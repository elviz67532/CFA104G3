package com.product_report.model;

import java.sql.Timestamp;
import java.util.List;

import core.DualKey;

public interface ProductReportService {

	ProductReportVO insert(Integer productId, Integer memberId, String content, Timestamp date,
			byte[] photo, Integer status);

	ProductReportVO selectById(DualKey<Integer, Integer> id);

	ProductReportVO getOneById(int memberId);

	List<ProductReportVO> selectAll();
	
	void deleteById(DualKey<Integer, Integer>id);
	
	ProductReportVO changestatus(Integer status, Integer memberId, Integer productId);
}
