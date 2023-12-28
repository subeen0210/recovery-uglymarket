function orderList() {
  $.ajax({
    url: "UserOrderC",
    type: "post",
    datatype: "json",
    success: function (json) {
      console.log(json);
      let data = `<tr>
                <td><a class='openModalBtn' style='cursor: pointer;'>${order.o_orderNum}</a></td>
                <td>${order.i_name}</td>
                <td>${order.o_quantity}/${order.i_price}</td>
                <td>${order.o_totalprice}</td>
                <td>${order.o_status}</td>
                <td>${order.o_date}</td>
                <td><button class='openModalBtn2'>作成</button>
                <td><a>削除</a></td>
            </tr>`;
    },
	error : function(request,status,error){
		  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	}
  });
}
$(function () {
  console.log("order.js loaded ======");
  orderList();
});
