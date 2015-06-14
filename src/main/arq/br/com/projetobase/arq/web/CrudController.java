package br.com.projetobase.arq.web;

import java.util.Collection;

import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import br.com.caelum.vraptor.Consumes;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
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
	
	@Get
	@Path("/form/{entidade.id}")
	public void form(T entidade) {
		T entidadePersistida = getRepository().find(entidade.getId());
		result.include("entidade", entidadePersistida);
	}
	
	@Consumes("application/json")
	@Post
	@Transactional
	public void editarJson(T entidade) {
		T entidadePersistida = getRepository().find(entidade.getId());
		result.use(Results.json()).withoutRoot().from(entidadePersistida).serialize();
	}
	
	@Post
	@Transactional
	public void salvar(@NotNull @Valid T entidade) {
		validator.validate(entidade);
		validator.onErrorUsePageOf(this).form();
		persistirEntidade(entidade);
		result.redirectTo(this).list();
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
	public void salvarJson(@Valid T entidade) {
		validator.validate(entidade);
		validator.onErrorSendBadRequest();
		persistirEntidade(entidade);
		Collection<T> entidadesPersistidas = getRepository().all();
		result.use(Results.json()).withoutRoot().from(entidadesPersistidas).serialize();
	}
	
	public T show(T entidade) {
		T entity = getRepository().find(entidade.getId());
		return entity;
	}
	
	@Path("/remover/{entidade.id}")
	@Get
	@Transactional
	public void remover(T entidade) {
		getRepository().remove(entidade);
		result.redirectTo(this).list();
	}
	
	@Consumes("application/json")
	@Post
	@Transactional
	public void removerJson(T entidade) {
		getRepository().remove(entidade);
		Collection<T> entidadesPersistidas = getRepository().all();
		result.use(Results.json()).withoutRoot().from(entidadesPersistidas).serialize();
	}
	
	public void list() {
		Collection<T> entidadesCadastradas = getRepository().all();
		result.include("entidades", entidadesCadastradas);
	}
	
	@Consumes("application/json")
	@Get
	public void entidades() {
		Collection<T> entidadesCadastradas = getRepository().all();
		result.use(Results.json()).withoutRoot().from(entidadesCadastradas).serialize();
	}

}