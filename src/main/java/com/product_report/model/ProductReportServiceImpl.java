package com.product_report.model;

import java.sql.Timestamp;
import java.util.List;

import core.DualKey;

public class ProductReportServiceImpl implements ProductReportService {

	private ProductReportDAO dao;

	public ProductReportServiceImpl() {
		dao = new ProductReportDAOJDBCImpl();
	}

	@Override
	public ProductReportVO insert(Integer PRODRP_PROD_ID, Integer PRODRP_MEM_ID, String PRODRP_CONTENT,
			Timestamp PRODRP_DATE, byte[] PRODRP_PHOTO, Integer PRODRP_STATUS) {

		ProductReportVO productReportVO = new ProductReportVO();

		productReportVO.setProductId(PRODRP_PROD_ID);
		productReportVO.setMemberId(PRODRP_MEM_ID);
		productReportVO.setContent(PRODRP_CONTENT);
		productReportVO.setDate(PRODRP_DATE);
		productReportVO.setPhoto(PRODRP_PHOTO);
		productReportVO.setStatus(PRODRP_STATUS);
		dao.insert(productReportVO);

		return productReportVO;

	}

	@Override
	public void deleteById() {
		DualKey<Integer, Integer> id = new DualKey<Integer, Integer>(null, null);
		dao.deleteById(id);
	}

	@Override
	public ProductReportVO selectById() {
		DualKey<Integer, Integer> id = new DualKey<Integer, Integer>(null, null);
		return dao.selectById(id);
	}

	@Override
	public List<ProductReportVO> selectAll() {
		return dao.selectAll();
	}
}
