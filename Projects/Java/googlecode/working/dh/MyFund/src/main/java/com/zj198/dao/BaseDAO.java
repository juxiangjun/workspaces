package com.zj198.dao;

import java.util.List;

import com.zj198.model.KnwTitle;


public interface BaseDAO<T extends java.io.Serializable, PK extends java.io.Serializable> {
    
    public PK save(T model);

    public void saveOrUpdate(T model);
    
    public void update(T model);
    
//    public void merge(T model);

    public void delete(PK id);

    public void deleteObject(T model);

    public T get(PK id);
    
    boolean exists(PK id);
    
    public List<T> findAll();
    


}
