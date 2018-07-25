package br.com.bookstore.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import br.com.bookstore.dao.LivroDAO;
import br.com.bookstore.models.Idioma;
import br.com.bookstore.models.Livro;

@Controller
@RequestMapping("/livros")
public class LivrosController {
	
	
	@Autowired
	private LivroDAO livroDao;

	@RequestMapping("/cadastro")
	public ModelAndView cadastro(Livro livro){
		ModelAndView mav = new ModelAndView("livros/cadastro");
		mav.addObject("idiomas", Idioma.values());
		return mav;
	}
	
	//@RequestMapping("/gravar")
	@RequestMapping(method=RequestMethod.POST)
	@CacheEvict(cacheNames= {"livrosHome", "listaLivros"}, allEntries=true)
	public ModelAndView gravar(@Valid Livro livro, BindingResult result) {
		Livro livroCadastrado = livroDao.buscar(livro.getCodigo());
		
		if(result.hasErrors() || !(livroCadastrado==null)) {
			return cadastro(livro);
		}
		
		livroDao.gravar(livro);
		
		return new ModelAndView("redirect:/livros");
	}
	
	//@RequestMapping("")
	@RequestMapping(method=RequestMethod.GET)
	@Cacheable(value="listaLivros")
	public ModelAndView listar() {
		ModelAndView mav = new ModelAndView("livros/lista");
		List<Livro> livros = livroDao.listar();
		mav.addObject("listaLivros", livros);

		return mav;
		
	}
	
	@RequestMapping("/editar/{codigo}")
	public ModelAndView editar(@PathVariable("codigo") Integer livroCodigo) {
		ModelAndView mav = new ModelAndView("livros/editar");
		Livro livro = livroDao.buscar(livroCodigo);
		mav.addObject("livro", livro);
		return mav;
	}
	
	@RequestMapping("/editar/atualizar")
	public ModelAndView atualizar(@Valid Livro livro, BindingResult result) {
			
		if(result.hasErrors()) {
			return editar(livro.getCodigo());
		}
		
		livroDao.atualizar(livro);
		return new ModelAndView("redirect:/livros");
	}
	
	@RequestMapping("/detalhesAdmin/{codigo}")
	public ModelAndView detalhesAdmin(@PathVariable("codigo") Integer codigo) {
		ModelAndView mav = new ModelAndView("livros/detalhesAdmin");
		Livro livro = livroDao.buscaCompleta(codigo);
		mav.addObject(livro);
		return mav;
	}
	
	@RequestMapping("/detalhes/{codigo}")
	public ModelAndView detalhes(@PathVariable("codigo") Integer codigo) {
		ModelAndView mav = new ModelAndView("livros/detalhes");
		Livro livro = livroDao.buscaCompleta(codigo);
		mav.addObject(livro);
		return mav;
	}
	
	@RequestMapping("/excluir")
	@CacheEvict(cacheNames= {"livrosHome", "listaLivros"}, allEntries=true)
	public ModelAndView excluir(Integer codigo) {
		
		livroDao.excluir(codigo);
		
		return new ModelAndView("redirect:/livros");
	}
	
	@RequestMapping("/{codigo}")
	@ResponseBody
	public Livro detalhesJson(@PathVariable("codigo") Integer codigo) {
		return livroDao.buscaCompleta(codigo);
	}
	
	
}
