
document.querySelector(".msg_send_btn").addEventListener('click', (e) => {
	const msg = document.querySelector("#msg").value;
	if(!msg) return;
	
	
	const payload = {
		chatroomId,
		sendEmail,
		receiveEmail,
		msg,
		time : new Date(+new Date() + 3240 * 10000).toISOString().replace("T", " ").replace(/\..*/,''),
		type : 'CHAT'
	};
	
	stompClient.send(`/app/chat/${chatroomId}`, {}, JSON.stringify(payload));
	document.querySelector("#msg").value = '';
	
});

setTimeout(() => {
	const container = document.querySelector('.msg_history');
	const mesgeContainer = $('.mesgs');
	const msgHistory = $('.msg_history');
	
	stompClient.subscribe(`/app/chat/${chatroomId}`, (message) => {
		console.log(`/app/chat/${chatroomId} : `, message);
		const {'content-type' : contentType} = message.headers;
		if(!contentType) return;
		
		
		const {sendEmail, receiveEmail, msg, time} = JSON.parse(message.body);
		if(sendEmail == loginMemberEmail){
			const html = `<div class="outgoing_msg">
				              <div class="sent_msg">
				                <p>${msg}</p>
				                <span class="time_date"> ${sendEmail} | ${time} </span> 
			                  </div>
				          </div>`;
			container.insertAdjacentHTML('beforeend', html);
			msgHistory.scrollTop(msgHistory[0].scrollHeight); 
		}
		if(sendEmail != loginMemberEmail){
			const html = `<div class="incoming_msg">
				              <div class="received_msg">
				                <div class="received_withd_msg">
				                  <p>${msg}</p>
				                  <span class="time_date"> ${sendEmail} | ${time} </span></div>
				              </div>
			              </div>`;
			container.insertAdjacentHTML('beforeend', html);
			msgHistory.scrollTop(msgHistory[0].scrollHeight); 
		}
		
	});
	
}, 500);