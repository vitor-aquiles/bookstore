package br.com.bookstore.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import br.com.bookstore.dao.LivroDAO;
import br.com.bookstore.dao.UsuarioDAO;
import br.com.bookstore.models.Idioma;
import br.com.bookstore.models.Livro;
import br.com.bookstore.models.Role;
import br.com.bookstore.models.Usuario;

@Controller
public class HomeController {

	@Autowired
	private LivroDAO livroDAO;
	
	@Autowired
	private UsuarioDAO usuarioDao;

	@RequestMapping("/home")
	@Cacheable(value="livrosHome")
	public ModelAndView livrosHome() {
		ModelAndView mav = new ModelAndView("home");
		List<Livro> livrosHome = livroDAO.listar();
		mav.addObject("listaLivros", livrosHome);
		mav.addObject("idiomaPt", Idioma.PT);
		return mav;
	}
	
	@Transactional
	@ResponseBody
	@RequestMapping("/userAdmin")
	public String urlMagicaMaluca() {
	    Usuario usuario = new Usuario(); 
	    usuario.setNome("Admin");
	    usuario.setEmail("aquilessrd@hotmail.com");
	    usuario.setSenha("$2a$04$JAiKFI91nW/wqFn5ha7/3uiK8sHotA4PTaKfwMp3Gi4MTb0Qt82r2");
	    usuario.setRoles(Arrays.asList(new Role("ROLE_ADMIN")));

	    usuarioDao.gravar(usuario);

	    return "home";
	}
	
}
