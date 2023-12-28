
const myModal2 = document.getElementById('myModal2');
const openModalBtn2 = document.getElementById('openModalBtn2');
const closeModalBtn2 = document.getElementById('closeModalBtn2');


openModalBtn2.addEventListener('click', () => {
	myModal2.showModal();
});

closeModalBtn2.addEventListener('click', () => {
	myModal2.close();
});