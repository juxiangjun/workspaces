package org.tju.demo.lucene.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.hibernate.search.FullTextSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.demo.lucene.service.impl.BookServiceImpl;

public class BaseDAO {

	@PersistenceContext
	protected EntityManager em;
	
	private static Logger log = LoggerFactory.getLogger( BookServiceImpl.class );
	
	protected void index() {                                                                                                        
        FullTextSession ftSession = org.hibernate.search.Search.getFullTextSession( (Session) em.getDelegate() );
        try {
            ftSession.createIndexer().startAndWait();
            log.debug("created data index.");
        }
        catch ( InterruptedException e ) {
            log.error( "Was interrupted during indexing", e );
        }
    }
}
