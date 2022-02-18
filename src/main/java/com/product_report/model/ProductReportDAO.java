package com.product_report.model;

import core.DualKey;
import core.dao.CoreDao;
import com.product.model.*;

public interface ProductReportDAO extends CoreDao<ProductReportVO, DualKey<Integer, Integer>>  {
	ProductReportVO getOneById(int memberId);
}
