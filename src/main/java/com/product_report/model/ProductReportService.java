package com.product_report.model;

import java.sql.Timestamp;
import java.util.List;

public interface ProductReportService {

	ProductReportVO insert(Integer productId, Integer memberId, String content, Timestamp date,
			byte[] photo, Integer status);

	void deleteById();

	ProductReportVO selectById();

	List<ProductReportVO> selectAll();

}
