package br.com.projetobase.validators;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import br.com.projetobase.dominio.Usuario;
import br.com.projetobase.validators.annotations.LoginAvailable;

public class LoginAvailableValidator implements ConstraintValidator<LoginAvailable, Usuario> {

	@Override
	public void initialize(LoginAvailable arg0) {
		
	}

	@Override
	public boolean isValid(Usuario usuario, ConstraintValidatorContext context) {
		boolean contemErro = true;
		if (usuario.getEmail() == null || usuario.getSenha() == null) {
			contemErro = false;
		}
		return contemErro;
	}

}
