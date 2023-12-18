// 필터기능
document.addEventListener("DOMContentLoaded", function() {
    const buttons = document.querySelectorAll('.shop-item-kwj span');
    const items = document.querySelectorAll('.shop-item');

    buttons.forEach(button => {
        button.addEventListener('click', function() {
            const filterValue = this.getAttribute('data-filter');
            
            items.forEach(item => {
                const category = item.getAttribute('data-category');
                
                if (filterValue === 'all' || category === filterValue) {
                    item.style.display = 'block';
                } else {
                    item.style.display = 'none';
                }
            });

            // 활성 버튼 표시
            buttons.forEach(btn => {
                btn.classList.remove('active');
            });
            this.classList.add('active');
        });
    });
});


// 페이징 기능
document.addEventListener('DOMContentLoaded', function () {
    const itemsPerPage = 9; // 페이지당 보여줄 상품 수
    let currentPage = 1; // 현재 페이지

    function showItems(startIndex, endIndex) {
        const items = document.querySelectorAll('.shop-item');
        items.forEach((item, index) => {
            if (index >= startIndex && index < endIndex) {
                item.style.display = 'block';
            } else {
                item.parentNode.style.display = 'none';
            }
        });
    }

    function updatePagination() {
        const items = document.querySelectorAll('.shop-item');
        const totalPages = Math.ceil(items.length / itemsPerPage);

        // 페이지 번호를 나타내는 부분을 초기화
        const paginationContainer = document.getElementById('pagination');
        paginationContainer.innerHTML = '';


    	// '처음' 버튼 생성
    	const firstButton = document.createElement('button');
   	 	firstButton.innerText = '처음';
    	firstButton.classList.add('pagination-button');
    	firstButton.addEventListener('click', function () {
        	currentPage = 1;
        	const startIndex = 0;
       		const endIndex = itemsPerPage;
        	showItems(startIndex, endIndex);
    	});
    	paginationContainer.appendChild(firstButton);


        // 페이지 버튼을 생성
        for (let i = 1; i <= totalPages; i++) {
            const pageNumber = i;
            const pageButton = document.createElement('button');
            pageButton.innerText = pageNumber;

            pageButton.addEventListener('click', function () {
                currentPage = pageNumber;
                const startIndex = (currentPage - 1) * itemsPerPage;
                const endIndex = currentPage * itemsPerPage;
                showItems(startIndex, endIndex);
            });

            paginationContainer.appendChild(pageButton);
        }

		// 끝 버튼을 생성
		const lastButton = document.createElement('button');
    	lastButton.innerText = '끝';
    	lastButton.classList.add('pagination-button');
    	lastButton.addEventListener('click', function () {
        	currentPage = totalPages;
        	const startIndex = (totalPages - 1) * itemsPerPage;
        	const endIndex = items.length;
        	showItems(startIndex, endIndex);
    	});
    	paginationContainer.appendChild(lastButton);


    }

    // 초기 로딩 시 첫 페이지 상품 표시
    showItems(0, itemsPerPage);

    // 초기 로딩 시 페이징 업데이트
    updatePagination();
});