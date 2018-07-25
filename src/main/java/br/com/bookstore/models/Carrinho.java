package br.com.bookstore.models;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

@Component
@Scope(value=WebApplicationContext.SCOPE_SESSION, proxyMode=ScopedProxyMode.TARGET_CLASS)
public class Carrinho implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Map<CarrinhoItem, Integer> itens = new LinkedHashMap<CarrinhoItem, Integer>();

	public Collection<CarrinhoItem> getItens() {
		return itens.keySet();
	}
	
	public void add(CarrinhoItem item) {
		itens.put(item, getQuantidade(item) + 1);
	}
	
	//Verifica se "item" já existe ou não no carrinho.
    //Caso sim, retorna o Value referente a (Key)item, no caso a quantidade de "item" dentro de "itens"(itens do carrinho).
    //Caso não, insere "item"(key) dentro da lista de itens do carrinho com Value igual a 0
    //A partir dessa verificação, o método "add" consegue saber quantos "item" já existem dentro do carrinho
	public Integer getQuantidade(CarrinhoItem item) {
		if(!itens.containsKey(item)) {
			itens.put(item, 0);
		}
		return itens.get(item);
	}
	
	////Retorna a quantidade de itens dentro do carrinho
	public int getQuantidade() {
		return this.itens.values().stream().reduce(0, (proximo, acumulador) -> proximo + acumulador);
	}
	
	public BigDecimal getTotal(CarrinhoItem item) {
		return item.getValorTotalMesmoItem(getQuantidade(item));

	}
	
	public BigDecimal getTotal() {
		BigDecimal total = BigDecimal.ZERO;
		
		for(CarrinhoItem item : itens.keySet()) {
			total = total.add(getTotal(item));
		}
		
		return total;
	}
	
	public void remove(Integer codigo, Idioma idioma) {
		Livro livro = new Livro();
		livro.setCodigo(codigo);
		this.itens.remove(new CarrinhoItem(livro, idioma));
	}
	
	public void atualiza(CarrinhoItem item, Integer quantidade) {
		if(itens.containsKey(item)) {
			itens.put(item, quantidade);
		}
	}
	
	
}