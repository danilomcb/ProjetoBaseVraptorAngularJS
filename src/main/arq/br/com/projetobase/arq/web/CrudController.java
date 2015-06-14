package br.com.projetobase.arq.web;

import java.util.Collection;

import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.validation.Valid;

import br.com.caelum.vraptor.Consumes;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import br.com.projetobase.arq.dao.Dao;
import br.com.projetobase.arq.dominio.AbstractEntity;

public abstract class CrudController<T extends AbstractEntity> extends AbstractController {

	@Inject
	protected Validator validator;
	
	abstract protected Dao<T> getRepository();
	
	public void form() {
	}
		
	@Consumes("application/json")
	@Post
	@Transactional
	public void editar(T entidade) {
		T entidadePersistida = getRepository().find(entidade.getId());
		result.use(Results.json()).withoutRoot().from(entidadePersistida).serialize();
	}
	
	private void persistirEntidade(T entidade) {
		if (entidade.getId() != null && entidade.getId() != 0) {
			getRepository().update(entidade);
		} else {
			getRepository().save(entidade);
		}
	}
	
	@Consumes("application/json")
	@Post
	@Transactional
	public void salvar(@Valid T entidade) {
		validator.onErrorSendBadRequest();
		persistirEntidade(entidade);
		Collection<T> entidadesPersistidas = getRepository().all();
		result.use(Results.json()).withoutRoot().from(entidadesPersistidas).serialize();
	}
	
	@Consumes("application/json")
	@Post
	@Transactional
	public void remover(T entidade) {
		getRepository().remove(entidade);
		Collection<T> entidadesPersistidas = getRepository().all();
		result.use(Results.json()).withoutRoot().from(entidadesPersistidas).serialize();
	}
	
	@Consumes("application/json")
	@Get
	public void entidades() {
		Collection<T> entidadesCadastradas = getRepository().all();
		result.use(Results.json()).withoutRoot().from(entidadesCadastradas).serialize();
	}

}