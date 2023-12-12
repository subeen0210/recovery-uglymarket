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
document.addEventListener("DOMContentLoaded", function () {
    const items = document.querySelectorAll('.shop-item');
    const itemsPerPage = 9;
    let currentPage = 1;
    const initialItemsToShow = 9;

    function showItems(startIndex, endIndex) {
        for (let i = 0; i < items.length; i++) {
            if (i >= startIndex && i < endIndex) {
                items[i].style.display = 'block';
            } else {
                items[i].style.display = 'none';
            }
        }
    }

    function updatePagination() {
        const totalPages = Math.ceil(items.length / itemsPerPage);

        // 페이지 번호를 나타내는 부분을 초기화
        document.getElementById('pagination').innerHTML = '';

        // 페이지가 1페이지일 때 또는 페이지가 2페이지 이상일 때만 페이지 버튼을 생성
        if (totalPages > 1) {
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

                document.getElementById('pagination').appendChild(pageButton);
            }
        }
    }

    document.getElementById('moreButton').addEventListener('click', function () {
        const totalPages = Math.ceil(items.length / itemsPerPage);
        if (currentPage < totalPages) {
            currentPage++;
            const startIndex = (currentPage - 1) * itemsPerPage;
            const endIndex = currentPage * itemsPerPage;
            showItems(startIndex, endIndex);
        }
    });

    // 초기에 첫 페이지를 보이도록 설정
    showItems(0, initialItemsToShow);
    updatePagination();
});
