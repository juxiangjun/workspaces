package org.tju.demo.lucene.dao.impl;

import org.tju.demo.lucene.bean.Author;
import org.tju.demo.lucene.dao.AuthorDAO;

public class AuthorDAOImpl extends BaseDAO implements AuthorDAO {
	
	
	
	public void save(Author instance) {
		// TODO Auto-generated method stub
		
		if (instance.getId() == null) {
			em.persist(instance);
		} else {
			em.merge(instance);
		}
		
	}

	public Author findById(int id) {
		// TODO Auto-generated method stub
		return em.find(Author.class, id);
	}

	public void delete(Author instance) {
		// TODO Auto-generated method stub
		em.remove(instance);
	}

}
