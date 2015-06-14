package br.com.projetobase.arq.dao;

import java.util.Collection;

import br.com.projetobase.arq.dominio.AbstractEntity;

public interface Dao<T extends AbstractEntity> {

	public T save(T entity);
	
	public T update(T entity);
	
	public T find(Long id);
	
	public Collection<T> all();
	
	public void remove(T entity);
	
}
