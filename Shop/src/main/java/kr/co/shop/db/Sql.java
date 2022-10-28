package kr.co.shop.db;

public class Sql {
	
	public static final String Select_customer = "SELECT * FROM `customer`";
	public static final String Select_order = "SELECT a.*, b.`name`, c.`prodName` FROM `order` AS a "
											+ "JOIN `customer` AS b ON a.orderid = b.custid "				
											+ "JOIN `product` AS c ON a.orderProduct = c.prodNO";
	
	public static final String Select_product = "SELECT * FROM `product`";
	
	

	
	
	
}
