package com.product_report.model;

import java.sql.Timestamp;
import java.util.List;

public interface ProductReportService {

	ProductReportVO insert(Integer PRODRP_PROD_ID, Integer PRODRP_MEM_ID, String PRODRP_CONTENT, Timestamp PRODRP_DATE,
			byte[] PRODRP_PHOTO, Integer PRODRP_STATUS);

	void deleteById();

	ProductReportVO selectById();

	List<ProductReportVO> selectAll();

}
