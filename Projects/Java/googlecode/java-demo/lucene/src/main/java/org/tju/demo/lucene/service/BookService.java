package org.tju.demo.lucene.service;

import java.util.List;

import org.tju.demo.lucene.bean.Author;
import org.tju.demo.lucene.bean.Book;

public interface BookService {

	public void test ();
	
	public void saveAuthor(Author instance);
	public void index();
	public List<Book> searchBook(String keyword) throws Exception;
}
