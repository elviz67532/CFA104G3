package com.product.model;




import java.sql.Timestamp;
import java.util.List;

import org.junit.Test;






class ProductDAOImplTest {
	private ProductDAOImpl dao = null;
	
	@BeforeEach
	public void before() {
		dao = new ProductDAOImpl();
	}
	
	@Test
	@DisplayName("insert")
	public void testInsert() {
		
		ProductVO productVO = new ProductVO();
		productVO.setDescription("Hello this is a test!");
		productVO.setId(2);
		productVO.setLocation("台中市");
		productVO.setSellerMemberId(2);
		productVO.setName("張帥哥");
		productVO.setPrice(1000);
		productVO.setStatus(2);
		productVO.setType(2);
		java.util.Date date=new java.util.Date();
		java.sql.Timestamp sqlDate = new java.sql.Timestamp(date.getTime());
		productVO.setLaunchedDate(sqlDate);
		
		String key = dao.insert_get_key(productVO);
//		System.out.println("key: "+key);
		assertNotNull(key);
	}
	
	@Test
	@DisplayName("update")
	public void testUpdate() {
		Integer prodid = 3;
		String prodDesc = "Hello this is a test!";
		String prodLoc = "台中市";
		Integer prodMemId = 2; 
		String prodName = "Sam";
		Integer prodPrice = 1000;
		Integer prodStatus = 2;
		Integer prodType = 2;
		
		ProductVO productVO = new ProductVO();
		productVO.setId(prodid);;
		productVO.setDescription(prodDesc);;
		productVO.setLocation(prodLoc);;
		productVO.setSellerMemberId(prodMemId);
		productVO.setName(prodName);
		productVO.setPrice(prodPrice);
		productVO.setStatus(prodStatus);
		productVO.setType(prodType);
		java.util.Date date=new java.util.Date();
		java.sql.Timestamp sqlDate = new java.sql.Timestamp(date.getTime());
		productVO.setLaunchedDate(sqlDate);
		
		int row = dao.update(productVO);

		ProductVO productVO2 = dao.selectById(prodid);
		
		assertEquals(productVO2.getName(), productVO.getName());
	}
	
	@Test
	@DisplayName("delete")
	public void testDelete() {
		
		Integer prodid = 1;
		
		int row = dao.deleteById(prodid);
		ProductVO vo = dao.selectById(prodid);
		
		assertEquals(vo, null);
	}
	
	@Test
	@DisplayName("findByPrimaryKey")
	public void testFindByPrimaryKey() {
		
		Integer prodid = 2;
		
		ProductVO vo = dao.selectById(prodid);
		
		assertNotEquals(vo.getDescription(), null);
	}
	
	@Test
	@DisplayName("getAll")
	public void testGetAll() {
		
		List<ProductVO> list = dao.selectAll();
		System.out.println("total: " + list.size());
		for (ProductVO productVO : list) {
			System.out.print(productVO.getId());
			System.out.print(" ");
			System.out.print(productVO.getName());
			System.out.println();
		}
		assertTrue(list.size() > 0);
	}
	
	@Test
	@DisplayName("getProductByName")
	public void testGetProductByName() {
		
		String prodName = "鬼滅之刃1";
		
		List<ProductVO> list = dao.getProductsByName(prodName);
		System.out.println("total: " + list.size());
		for (ProductVO productVO : list) {
			System.out.print(productVO.getId());
			System.out.print(" ");
			System.out.print(productVO.getName());
			System.out.println();
		}
		assertTrue(list.size() > 0);
	}
	
	@Test
	@DisplayName("getProductByType")
	public void testGetProductByType() {
		
		Integer prodType = 0;
		List<ProductVO> list = dao.getProductsByType(prodType);
		System.out.println("total: " + list.size());
		for (ProductVO productVO : list) {
			System.out.print(productVO.getId());
			System.out.print(" ");
			System.out.print("type: ");
			System.out.print(productVO.getType());
			System.out.print(" ");
			System.out.print(productVO.getName());
			System.out.println();
		}
		assertTrue(list.size() > 0);
	}
}
