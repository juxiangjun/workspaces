package org.tju.demo.lucene.service.impl;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.tju.demo.lucene.bean.Author;
import org.tju.demo.lucene.bean.Book;
import org.tju.demo.lucene.dao.*;
import org.tju.demo.lucene.service.BookService;

public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookDAO bookDAO;
	
	@Autowired
	private AuthorDAO authorDAO;
	
	private static Logger log = LoggerFactory.getLogger( BookServiceImpl.class );
	
	public void index() {
		this.bookDAO.index();
	}

	//@Transactional(propagation=Propagation.REQUIRES_NEW)
	public void test() {
		// TODO Auto-generated method stub
		log.debug("test info.");
	}
	
	public List<Book> searchBook(String keyword) throws Exception {
		return bookDAO.search(keyword);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW)
	public void saveAuthor(Author instance) {
		// TODO Auto-generated method stub
		authorDAO.save(instance);
	}

	public void setBookDAO(BookDAO bookDAO) {
		this.bookDAO = bookDAO;
	}

	public void setAuthorDAO(AuthorDAO authorDAO) {
		this.authorDAO = authorDAO;
	}

}
