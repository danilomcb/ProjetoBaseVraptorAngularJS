package br.com.projetobase.web;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.validator.Validator;
import br.com.projetobase.arq.web.AbstractController;
import br.com.projetobase.dominio.Usuario;
import br.com.projetobase.validators.annotations.LoginAvailable;

@Controller
public class LoginController extends AbstractController {

	@Inject
	private Validator validation;
	
	public void login(@LoginAvailable Usuario entidade) {
		validation.onErrorForwardTo(this).form();
		dadosSessao.setUsuario(entidade);
		result.redirectTo(IndexController.class).index();
	}
	
	public void form() {
	}
	
	public void sair() {
		dadosSessao.limparSesao();
		result.redirectTo(this).form();
	}

}
