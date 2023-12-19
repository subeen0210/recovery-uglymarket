let totalItem;

$(function() {
	getAllItem();

});



function filter(data) {
	console.log(data);
	console.log('--------------')
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
		} else if(fil == 'all'){
			filteredItems = data;
		}
			console.log(filteredItems);
			pagination(filteredItems);
	});
}


function getAllItem() {

	$.ajax({
		url: 'get-all-item'
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
				dataHtml += '<div><img onclick="location.href=\'ShopDetailC?no=' + item.i_no + '\'"class="item-img" src="itemFolder/' + item.i_img + '"></div>';


				if (item.i_category == 1) {
					dataHtml += '<div class="category-back1">アグリー</div>';
				} else {
					dataHtml += '<div class="category-back2">普通</div>';
				}
				
				dataHtml += '<div class="text-name"><span onclick="location.href=\'ShopDetailC?no=' + item.i_no + '\'">' + item.i_name + '</span></div>';
				dataHtml += '<div class="text-price"><span onclick="location.href=\'ShopDetailC?no=' + item.i_no + '\'">' + item.i_price + '</div>';
				dataHtml += '</div>';
			});
			dataHtml += '</div>';
			$("#data-container").html(dataHtml);
		}
	})
}

