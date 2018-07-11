package br.com.bookstore.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.bookstore.dao.UsuarioDAO;
import br.com.bookstore.models.Usuario;

@Controller
public class LoginController {

	@Autowired
	private UsuarioDAO usuarioDao;

	@RequestMapping(value="/login", name="formLogin")
	public String formLogin(Usuario usuario) {
		return "login";
	}
	
	@RequestMapping(value="/cadastrar", name="formCadastro")
	public String formCadastro(Usuario usuario) {
		return "cadastro";
	}
	
	//@Transactionl aqui pois se utilizado em UsuarioDAO 
	//gera erro proxy,por conta das condigurações de UserDetails
	@Transactional
	@RequestMapping(value="/cadastrar/gravar", name="gravar")
	public String gravar(@Valid Usuario usuario, BindingResult result) {
		Usuario user = usuarioDao.buscar(usuario.getNome());
		
		if(result.hasErrors() || !(user == null)) {
			return formCadastro(usuario);
		}
		
		//usuario.setSenha(new BCryptPasswordEncoder().encode(usuario.getPassword()));
		
		usuarioDao.gravar(usuario);
		return "cadastroSucesso";
	}
}
