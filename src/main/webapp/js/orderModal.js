 	const myModal = document.getElementById('myModal');
    const openModalBtn = document.getElementById('openModalBtn');
    const closeModalBtn = document.getElementById('closeModalBtn');

  
    openModalBtn.addEventListener('click', () => {
      myModal.showModal();
    });

    closeModalBtn.addEventListener('click', () => {
      myModal.close();
    });