package com.niit.dao;

import java.util.List;
import com.niit.model.Supplier;

public interface SupplierDao
{	
		public List<Supplier> list();
		public Supplier get(int id);
		public List getAllSuppliers();
		public Supplier getSingleSupplier(int id);
		public void save(Supplier supplier);
		public void update(Supplier supplier);
		public void saveOrUpdate(Supplier supplier);
		public void delete(int id);
}

