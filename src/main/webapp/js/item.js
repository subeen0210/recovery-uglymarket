$(function() {
	const urlParams = new URL(location.href).searchParams;
	const name = urlParams.get('name');
	if (!name) {
		getAllItem('');
	} else {
		getAllItem(name);
	}

});

function getAllItem(name) {

	$.ajax({
		url: 'get-all-item',
		data : {name}
	}).done(function(data) {
		itemPagination(data);
	})

}

function itemPagination(jsonArray) {
    let container = $('#pagination');
    container.pagination({
        dataSource: jsonArray.slice(0, 3), 
        pageSize: 9,
        callback: function(data, pagination) {
            console.log(data);
            var dataHtml = '<div class="shop-list">';

            $.each(data, function(index, item) {

                dataHtml += '<div class="shop-item">';
                dataHtml += '<div><img onclick="location.href=\'ShopDetailC?no=' + item.i_no + '\'"class="item-img" src="itemFolder/' + item.i_img + '"></div>';


                if (item.i_category == 1) {
                    dataHtml += '<div class="category-back1">アグリー</div>';
                } else {
                    dataHtml += '<div class="category-back2">普通</div>';
                }

                dataHtml += '<div class="text-name"><span onclick="location.href=\'ShopDetailC?no=' + item.i_no + '\'">' + item.i_name + '</span></div>';
                dataHtml += '<div class="text-price"><img class="money-icon" src="img/en-icon.png"><span onclick="location.href=\'ShopDetailC?no=' + item.i_no + '\'">' + item.i_price + '</div>';
                dataHtml += '</div>';
            });
            dataHtml += '</div>';
            $("#data-container").html(dataHtml);
        }
    })
}