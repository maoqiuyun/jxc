$(document).ready(function(){
	$('#product_search').live("submit",function(){
		$.get("/products/select_products",$(this).serialize(), null,"script");
		return false;
	});
	$('.select_this').live("click",function(){
		has_this = false
		this_id = $(this).attr("data-id")
		$("#products_talbe input[name*='product_id[]']").each(function(){
			if(this_id == $(this).val()){
				alert("已添加该商品");
				has_this = true
			}
		});
		if(has_this == true){
			return false;
		}
		var id = "<input type='hidden' name='product_id[]' value='" + this_id + "'>";
		var brand = "<td>" + $(this).attr("data-brand") + id + "</td>";
		var brand_type = "<td>" + $(this).attr("data-brand_type")+ "</td>";
		var supplier = "<td>" + $(this).attr("data-supplier") + "</td>";
		var name = "<td>" + $(this).attr("data-name") + "</td>";
		var price = "<td><input type='text' name='price[]' size='5' class='required number'></td>";
		var number = "<td><input type='text' name='number[]' size='5' class='required number'></td>";
		$('#products_talbe').append("<tr>"+name + brand +brand_type+supplier +price+number+"</tr>");
		$("#succeed_text").show();
		$("#succeed_text").fadeOut(5000);
		//$.fancybox.close();
	});
});