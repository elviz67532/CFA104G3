package com.product_collection.model;

import java.util.List;

import com.move_order.model.MoveOrderVO;
import com.product.model.ProductDAOImpl;
import com.product.model.ProductVO;

import core.DualKey;

public class ProductCollectionServiceImpl implements ProductCollectionService {

	private ProductCollectionDAO dao;

	public ProductCollectionServiceImpl() {
		dao = new ProductCollectionDAOJDBCImpl();
	}
	@Override
	public ProductCollectionVO insert(Integer memberId, Integer productId) {
		ProductCollectionVO vo = new ProductCollectionVO();

		vo.setMemberId(memberId);
		vo.setProductId(productId);
		dao.insert(vo);

		return vo;

	}

	@Override
	public void deleteById() {
		DualKey<Integer, Integer> id = new DualKey<Integer, Integer>(null, null);
		dao.deleteById(id);
	}

	@Override	
	public List<ProductCollectionVO> selectAll() {
		return dao.selectAll();
	}
	
	public boolean listCollection(int memberId){
		ProductCollectionVO collectionVO = new ProductCollectionVO();
		ProductVO productVO = new ProductVO();
		ProductDAOImpl pdao = new ProductDAOImpl();
		productVO = pdao.selectById(collectionVO.getProductId());
		
	return true;	
	}
}
