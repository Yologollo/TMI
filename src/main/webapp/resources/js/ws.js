// ws.js
// const ws = new WebSocket(`ws://${location.host}/TMI/echo`);
// const ws = new SockJS(`http://${location.host}/TMI/echo`);
// ws.addEventListener('open', (e) => console.log('open:', e));
// ws.addEventListener('message', (e) => console.log('message:', e));
// ws.addEventListener('error', (e) => console.log('error:', e));
// ws.addEventListener('close', (e) => console.log('close:', e));

const ws = new SockJS(`http://${location.host}/TMI/stomp`);
const stompClient = Stomp.over(ws);

stompClient.connect({}, (frame) => {
	console.log('open :', frame);

});