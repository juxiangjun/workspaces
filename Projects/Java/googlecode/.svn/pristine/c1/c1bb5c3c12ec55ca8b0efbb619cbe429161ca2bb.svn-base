package org.tju.demo.lucene.dao;

import java.util.List;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.AbstractTransactionalDataSourceSpringContextTests;
import org.tju.demo.lucene.bean.Book;
import org.tju.demo.lucene.service.BookService;

@SuppressWarnings("deprecation")
public class BookServiceTest extends AbstractTransactionalDataSourceSpringContextTests{

	private BookService bookService;
	private static Logger log = LoggerFactory.getLogger( BookServiceTest.class );
	
	protected String[] getConfigLocations() { 
        setAutowireMode(AUTOWIRE_BY_NAME); 
        return new String[] {"classpath*:applicationContext.xml"}; 
	}
	
	@Test
    public void testIndexAndSearch() throws Exception {
        List<Book> books = bookService.searchBook( "hibernate" );
        assertEquals( "Should get empty list since nothing is indexed yet", 0, books.size() );
        log.debug("********* Count(Hibernate1):" + books.size());
        bookService.index();

        // search by title
        books = bookService.searchBook( "hibernate" );
        log.debug("********* Count(Hibernate2):" + books.size());
        
        assertEquals( "Should find one book", 1, books.size() );
        assertEquals( "Wrong title", "Java Persistence with Hibernate", books.get( 0 ).getTitle() );

        // search author
        books = bookService.searchBook( "\"Gavin King\"" );
        log.debug("********* Count(Gavin King):" + books.size());
        assertEquals( "Should find one book", 1, books.size() );
        assertEquals( "Wrong title", "Java Persistence with Hibernate", books.get( 0 ).getTitle() );
    }

    @Test
    public void testStemming() throws Exception {

        bookService.index();

        List<Book> books = bookService.searchBook( "refactor" );
        log.debug("********* Count(refactor):" + books.get(0).getTitle());
        assertEquals( "Wrong title", "Refactoring: Improving the Design of Existing Code", books.get( 0 ).getTitle() );

        books = bookService.searchBook( "refactors" );
        log.debug("********* Count(Refactors):" + books.get(0).getTitle());
        assertEquals( "Wrong title", "Refactoring: Improving the Design of Existing Code", books.get( 0 ).getTitle() );

        books = bookService.searchBook( "refactored" );
        log.debug("********* Count(refactored):" + books.get(0).getTitle());
        assertEquals( "Wrong title", "Refactoring: Improving the Design of Existing Code", books.get( 0 ).getTitle() );

        books = bookService.searchBook( "refactoring" );
        log.debug("********* Count(refactoring):" + books.get(0).getTitle());
        assertEquals( "Wrong title", "Refactoring: Improving the Design of Existing Code", books.get( 0 ).getTitle() );
    }

	
	
	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}
}
