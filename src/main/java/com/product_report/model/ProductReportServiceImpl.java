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
	public ProductReportVO insert(Integer productId, Integer memberId, String content,
			Timestamp date, byte[] photo, Integer status) {

		ProductReportVO vo = new ProductReportVO();

		vo.setProductId(productId);
		vo.setMemberId(memberId);
		vo.setContent(content);
		vo.setDate(date);
		vo.setPhoto(photo);
		vo.setStatus(status);
		dao.insert(vo);

		return vo;

	}

	@Override
	public  void deleteById() {
		DualKey<Integer, Integer> id = new DualKey<Integer, Integer>(null, null);
		dao.deleteById(id);
	}

	@Override
	public ProductReportVO selectById(Integer memberId, Integer productId) {
		DualKey<Integer, Integer> id = new DualKey<Integer, Integer>(memberId, productId);
		return dao.selectById(id);
	}

	@Override
	public List<ProductReportVO> selectAll() {
		return dao.selectAll();
	}
	
	@Override
	public ProductReportVO getOneById(int memberId) {		
		return dao. getOneById(memberId);
	}
	
	}

