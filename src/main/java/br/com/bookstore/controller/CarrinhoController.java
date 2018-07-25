package br.com.bookstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.bookstore.dao.LivroDAO;
import br.com.bookstore.models.Carrinho;
import br.com.bookstore.models.CarrinhoItem;
import br.com.bookstore.models.Idioma;
import br.com.bookstore.models.Livro;

@RequestMapping("/carrinho")
@Controller
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class CarrinhoController {

	@Autowired
	private Carrinho carrinho;
	
	@Autowired
	private LivroDAO livroDao;
	
	@RequestMapping("/itens")
	public String itens() {
		return "carrinho/itens";
	}
	
	@RequestMapping("/add")
	public ModelAndView add(Integer codigo, Idioma idioma) {
		System.out.println(codigo + "codigo aqui");
		ModelAndView mav = new ModelAndView("redirect:/carrinho/itens");
		CarrinhoItem item = criaItem(codigo, idioma);
		carrinho.add(item);
		return mav;
	}
	
	private CarrinhoItem criaItem(Integer codigo, Idioma idioma) {
		//Livro livro = this.livroDao.buscaCompleta(codigo);
		Livro livro = livroDao.buscaCompleta(codigo);
		System.out.println("Codigo retornado pela busca na hora de criar o item: " + livro.getCodigo());
		CarrinhoItem carrinhoItem = new CarrinhoItem(livro, idioma);
		return carrinhoItem;		
	}
	
	@RequestMapping("/remover")
	public ModelAndView remover(Integer codigo, Idioma idioma) {
		carrinho.remove(codigo, idioma);
		return new ModelAndView("redirect:/carrinho/itens");
	}
	
	@RequestMapping("/atualizar")
	public ModelAndView atualizar(Integer codigo, Idioma idioma, Integer quantidade) {
		Livro livro = livroDao.buscaCompleta(codigo);
		carrinho.atualiza(new CarrinhoItem(livro, idioma), quantidade);
		return new ModelAndView("redirect:/carrinho/itens");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
