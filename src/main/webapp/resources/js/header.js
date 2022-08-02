

console.log("dsad");

function scrollHeader(){
console.log("test");
    const header = document.getElementById('header')
    if(this.scrollY >= 10) {
    	header.classList.add('scroll-header'); 
		console.log("test1");
	} else {
		header.classList.remove('scroll-header')
		console.log("test2");
	}
}
window.addEventListener('scroll', scrollHeader)

