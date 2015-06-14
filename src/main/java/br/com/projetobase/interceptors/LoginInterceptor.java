package br.com.projetobase.interceptors;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import br.com.caelum.vraptor.Accepts;
import br.com.caelum.vraptor.AroundCall;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.controller.ControllerMethod;
import br.com.caelum.vraptor.interceptor.SimpleInterceptorStack;
import br.com.projetobase.arq.web.DadosSessao;
import br.com.projetobase.web.LoginController;

@Intercepts
@RequestScoped
public class LoginInterceptor {

	@Inject
	private Result result;
	
	@Inject
	private DadosSessao dadosSessao;
	
	@AroundCall
	public void intercept(SimpleInterceptorStack stack) {
		if (dadosSessao.getUsuario() == null) {
			result.redirectTo(LoginController.class).form();
		} else {
			stack.next();
		}
	} 
	
	@Accepts
	public boolean accepts(ControllerMethod controllerMethod) {
		return !controllerMethod.getController().getType().equals(LoginController.class);
	}
}
