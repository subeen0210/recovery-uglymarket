// 최근 본 상품 목록을 가져오는 함수
function getRecentProducts() {
    let recentProducts = localStorage.getItem('recentProducts');
    return recentProducts ? JSON.parse(recentProducts) : [];
}

// 상품을 최근 본 목록에 추가하는 함수
function addRecentProduct(i_no, i_img) {
    let recentProducts = getRecentProducts();
	console.log(getRecentProducts());

    // 이미 최근 본 상품 목록에 있는지 확인
    const existingProduct = recentProducts.find(product => product.i_no === i_no);

    if (!existingProduct) {
        // 최근 본 상품 목록에 추가
        recentProducts.unshift({ i_no, i_img });

        // 최근 본 상품이 3개를 초과하면 가장 오래된 상품 제거
        if (recentProducts.length > 3) {
            recentProducts.pop();
        }

        // 로컬 스토리지에 저장
        localStorage.setItem('recentProducts', JSON.stringify(recentProducts));
    }
}

// 상품 클릭 이벤트 처리
function onProductClick(i_no, i_img) {
    // 최근 본 상품에 추가
    addRecentProduct(i_no, i_img);
}