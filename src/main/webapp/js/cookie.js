// 최수빈 쿠키 생성 코드 작성
function getProductIdFromURL() {
    let urlParams = new URLSearchParams(window.location.search);
    return urlParams.get('no');
}

	let productId = getProductIdFromURL();
	//console.log('productId:', productId);
	addRecentProduct(productId);

// 상품을 추가하는 함수
function addRecentProduct(productId) {
    let recentProducts = getRecentProductIds() || [];

    // 이미 최근 본 상품 목록에 있는지 확인
    if (!recentProducts.includes(productId)) {
        recentProducts.unshift(productId);

        if (recentProducts.length > 3) {
            recentProducts.pop();
        }
        saveRecentProductIds(recentProducts);
    }
}

// 최근 본 상품 목록을 저장하는 함수 (쿠키 또는 다른 저장소에 저장)
function saveRecentProductIds(recentProducts) {
    createCookie('itemCookie', recentProducts.join(','), 1);
    console.log('쿠키 생성 완료');
}

// 최근 본 상품 목록을 가져오는 함수
function getRecentProductIds() {
    let cookieValue = getCookie('itemCookie');
    const recentProducts = cookieValue ? cookieValue.split(',') : [];
    console.log('최근 본 상품 목록:', recentProducts);
    return recentProducts;
}

// 쿠키 생성 함수
function createCookie(name, value, days) {
    let expires = '';
    if (days) {
        const date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        expires = '; expires=' + date.toUTCString();
    }
    document.cookie = name + '=' + value + expires + '; path=/';
}

// 쿠키 조회 함수
function getCookie(name) {
    const nameEQ = name + '=';
    const cookies = document.cookie.split(';');
    for (let i = 0; i < cookies.length; i++) {
        let cookie = cookies[i];
        while (cookie.charAt(0) === ' ') cookie = cookie.substring(1, cookie.length);
        if (cookie.indexOf(nameEQ) === 0) return cookie.substring(nameEQ.length, cookie.length);
    }
    return null;
}