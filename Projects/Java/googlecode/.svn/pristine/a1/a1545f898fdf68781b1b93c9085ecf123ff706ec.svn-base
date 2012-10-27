package org.tju.demo.lucene.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Store;



@Entity
@Table(name = "author")
public class Author {
		// Fields
		private Integer id;
		private String name;
		
		@Id
		@Column(name = "id", unique = true, nullable = false)
		@GeneratedValue(strategy=GenerationType.AUTO)
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		
		@Column(name = "name", nullable = false)
		@Field(store = Store.YES) 
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		
}
