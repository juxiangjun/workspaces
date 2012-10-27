package org.tju.demo.lucene.dao;

import java.util.List;

import org.tju.demo.lucene.bean.Book;

public interface BookDAO {
	public List<Book> search(String keyword) throws Exception;
	public void index();
	public void save(Book instance);
	public void delete(Book instance);
	public Book findById(String id);
}
