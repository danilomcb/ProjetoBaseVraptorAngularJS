package br.com.projetobase.web;

import javax.inject.Inject;
import javax.transaction.Transactional;

import br.com.caelum.vraptor.Consumes;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import br.com.projetobase.arq.web.AbstractController;
import br.com.projetobase.dominio.Usuario;
import br.com.projetobase.validators.annotations.LoginAvailable;

@Controller
public class LoginController extends AbstractController {

	@Inject
	private Validator validator;
	
	@Consumes("application/json")
	@Post
	@Transactional
	public void login(@LoginAvailable Usuario entidade) {
		validator.onErrorSendBadRequest();
		dadosSessao.setUsuario(entidade);
		result.use(Results.status()).ok();
	}
	public void form() {
	}
	
	public void sair() {
		dadosSessao.limparSesao();
		result.redirectTo(this).form();
	}

}
