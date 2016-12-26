package com.niit.dao;


import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.model.UserDetails;

@Repository("userDetailsDAO")
public class UserDetailsDAOImpl implements UserDetailsDAO
{
	@Autowired
	private SessionFactory sessionFactory;
	public UserDetailsDAOImpl(SessionFactory sessionFactory){
		try {
			this.sessionFactory = sessionFactory;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
	
	
	
	@Transactional
	public List<UserDetails> list() {
		@SuppressWarnings("unchecked")
		List<UserDetails> list = (List<UserDetails>) sessionFactory.getCurrentSession().createCriteria(UserDetails.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return list;
	}

	@Transactional
	public void save(UserDetails userDetails) {
		sessionFactory.getCurrentSession().save(userDetails);
	}
	@Transactional
	public void delete(int id) {
		UserDetails userDetails= new UserDetails();
//		register.setId(id);
		sessionFactory.getCurrentSession().delete(userDetails);
	}

	
	@Transactional
	public void saveOrupdate(UserDetails userDetails)
	{
		//sessionFactory.getCurrentSession().saveOrUpdate(userDetails);
		Session s1=sessionFactory.openSession();
		Transaction t1=s1.beginTransaction();
		s1.saveOrUpdate(userDetails);
		t1.commit();
	}
	@Transactional
	public UserDetails get(int id) {
		String hql = "from UserDetails where id="+ "'" + id+"'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<UserDetails> list = (List<UserDetails>) query.list();
		if(list != null && !list.isEmpty() ){
			return list.get(0);
		}
		return null;
	}
	
	@Transactional
	public boolean isValidUserDetails(int id, String password) {
		String hql = "from UserDetails where id='"+id+"' and " + "password='"+password+"'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<UserDetails> list = (List<UserDetails>) query.list();
		if(list != null && !list.isEmpty() ){
			return true;
		}
		return false;
	}



	



	@Transactional
	public void update(UserDetails userDetails)
	{
		sessionFactory.getCurrentSession().update(userDetails);
		
	}

		
	}
	

