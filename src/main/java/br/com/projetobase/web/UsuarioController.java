package br.com.projetobase.web;

import java.io.Serializable;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.projetobase.arq.dao.Dao;
import br.com.projetobase.arq.web.CrudController;
import br.com.projetobase.dao.UsuarioDAO;
import br.com.projetobase.dominio.Usuario;

@Controller
@RequestScoped
@Path("/usuario")
public class UsuarioController extends CrudController<Usuario> implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Inject
	private UsuarioDAO usuarioDAO;
	
	@Override
	protected Dao<Usuario> getRepository() {
		return usuarioDAO;
	}
	
}
