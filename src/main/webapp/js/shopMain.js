let totalItem;

$(function() {
	const urlParams = new URL(location.href).searchParams;
	const name = urlParams.get('name');
	if (!name) {
		getAllItem('');
	} else {
		getAllItem(name);
	}
$('.filter[val="all"]').addClass('active');
});



function filter(data) {
	console.log(data);
	console.log('--------------')
	 $('.filter[val="all"]').addClass('active');
	$(".shop-menu").on('click', '.filter', function() {
		$('.filter').removeClass('active');
		$(this).addClass('active');

		let fil = $(this).attr('val');
		var filteredItems;
		if (fil == 'ugly') {
			filteredItems = data.filter(function(item) {
				return item.i_category === 1;
			});

		} else if (fil == 'normal') {
			filteredItems = data.filter(function(item) {
				return item.i_category === 2;
			});
		} else if (fil == 'all') {
			filteredItems = data;
		}
		console.log(filteredItems);
		pagination(filteredItems);
	});
}


function getAllItem(name) {

	$.ajax({
		url: 'get-all-item',
		data : {name}
	}).done(function(data) {
		totalItem = data;
		pagination(data);
		filter(totalItem);
	})

}


function pagination(jsonArray) {
	let container = $('#pagination');
	container.pagination({
		dataSource: jsonArray,
		pageSize: 9,
		callback: function(data, pagination) {
			console.log(data);
			var dataHtml = '<div class="shop-list">';

			$.each(data, function(index, item) {

				dataHtml += '<div class="shop-item">';
				dataHtml += '<div><img onclick="handleProductClick(\'' + item.i_no + '\', \'' + item.i_img + '\', \'' + item.i_name + '\', \'' + item.i_price + '\')" class="item-img" src="itemFolder/' + item.i_img + '"></div>';


				if (item.i_category == 1) {
					dataHtml += '<div class="category-back1">アグリー</div>';
				} else {
					dataHtml += '<div class="category-back2">普通</div>';
				}
				
				dataHtml += '<div class="text-name"><span onclick="handleProductClick(\'' + item.i_no + '\', \'' + item.i_img + '\', \'' + item.i_name + '\', \'' + item.i_price + '\')">' + item.i_name + '</span></div>';
				dataHtml += '<div class="text-price"><span onclick="handleProductClick(\'' + item.i_no + '\', \'' + item.i_img + '\', \'' + item.i_name + '\', \'' + item.i_price + '\')">￥' + item.i_price + '</span></div>';
				dataHtml += '</div>';
			});
			dataHtml += '</div>';
			$("#data-container").html(dataHtml);
		}
	})
}

function handleProductClick(i_no, i_img, i_name, i_price) {
    location.href = 'ShopDetailC?no=' + i_no;
    onProductClick(i_no, i_img, i_name, i_price);
}