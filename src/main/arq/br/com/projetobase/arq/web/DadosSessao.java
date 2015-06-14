package br.com.projetobase.arq.web;

import java.io.Serializable;

import javax.enterprise.context.SessionScoped;

import br.com.projetobase.dominio.Usuario;

@SessionScoped
public class DadosSessao implements Serializable {

	private static final long serialVersionUID = 1L;
	
	Usuario usuario;

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	public void limparSesao() {
		setUsuario(null);
	}
	
}
