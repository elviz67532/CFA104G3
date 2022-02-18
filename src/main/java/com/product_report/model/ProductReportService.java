package com.product_report.model;

import java.sql.Timestamp;
import java.util.List;

public interface ProductReportService {

	ProductReportVO insert(Integer productId, Integer memberId, String content, Timestamp date,
			byte[] photo, Integer status);

	ProductReportVO selectById(Integer memberId, Integer productId);

	ProductReportVO  getOneById(int memberId);

	List<ProductReportVO> selectAll();
	
	void deleteById();
}
