package org.tju.demo.lucene.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javassist.bytecode.analysis.Analyzer;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.lucene.queryParser.MultiFieldQueryParser;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.util.Version;
import org.hibernate.search.FullTextQuery;
import org.hibernate.search.jpa.FullTextEntityManager;
import org.tju.demo.lucene.bean.Book;
import org.tju.demo.lucene.dao.BookDAO;

public class BookDAOImpl extends BaseDAO implements BookDAO{
	
	@PersistenceContext
	private EntityManager em;
	
	String[] bookFields = { "title", "subtitle", "authors.name", "publicationDate" };
	
	
	public void index() {
		super.index();
	}
	
	/**
	 * @author tju
	 * @param keyword
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Book> search(String searchKeyword) throws Exception {

        //lucene part
        Map<String, Float> boostPerField = new HashMap<String, Float>( 4 );
        boostPerField.put( bookFields[0], (float) 4 );
        boostPerField.put( bookFields[1], (float) 3 );
        boostPerField.put( bookFields[2], (float) 4 );
        boostPerField.put( bookFields[3], (float) .5 );

        FullTextEntityManager ftEm = org.hibernate.search.jpa.Search.getFullTextEntityManager(em);
        org.apache.lucene.analysis.Analyzer customAnalyzer = ftEm.getSearchFactory().getAnalyzer("customanalyzer");
        
        QueryParser parser = new MultiFieldQueryParser(
                Version.LUCENE_34, bookFields,
                customAnalyzer, boostPerField
        );

        org.apache.lucene.search.Query luceneQuery = parser.parse(searchKeyword);
        org.hibernate.search.jpa.FullTextQuery  query = ftEm.createFullTextQuery(luceneQuery, Book.class);

        return query.getResultList();

	}

	public void save(Book instance) {
		// TODO Auto-generated method stub
		if (instance.getId() == null) {
			em.persist(instance);
		} else {
			em.merge(instance);
		}
	}

	public void delete(Book instance) {
		// TODO Auto-generated method stub
		em.remove(instance);
	}

	public Book findById(String id) {
		// TODO Auto-generated method stub
		return em.find(Book.class, id);
	}

}
