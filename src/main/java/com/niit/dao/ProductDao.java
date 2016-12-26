package com.niit.dao;

import java.util.List;

import com.niit.model.Product;

public interface ProductDao {
	public List<Product> list();
	public Product get(int Id);
	public void saveOrUpdate(Product product);
	public void delete(int Id);
	public List getAllProducts();
	public Product getSingleProduct(int id);
	public int updateProduct(Product product);
}
