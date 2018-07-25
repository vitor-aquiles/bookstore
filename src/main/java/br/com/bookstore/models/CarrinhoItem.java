package br.com.bookstore.models;

import java.io.Serializable;
import java.math.BigDecimal;

public class CarrinhoItem implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Livro livro;
	private Idioma idioma;
	
	public CarrinhoItem(Livro livro, Idioma idioma) {
		this.livro = livro;
		this.idioma = idioma;
	}
	
	public BigDecimal getValor() {
		return livro.precoPara(idioma);
	}
	
	public Livro getLivro() {
		return livro;
	}

	public void setLivro(Livro livro) {
		this.livro = livro;
	}
	
	public Idioma getIdioma() {
		return idioma;
	}

	public void setIdioma(Idioma idioma) {
		this.idioma = idioma;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((livro == null) ? 0 : livro.hashCode());
		result = prime * result + ((idioma == null) ? 0 : idioma.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CarrinhoItem other = (CarrinhoItem) obj;
		if (livro == null) {
			if (other.livro != null)
				return false;
		} else if (!livro.equals(other.livro))
			return false;
		if (idioma == null) {
			if (other.idioma != null)
				return false;
		} else if (!idioma.equals(other.idioma))
			return false;
		return true;
	}
	
	public BigDecimal getValorTotalMesmoItem(int quantidade) {
		return this.getValor().multiply(new BigDecimal(quantidade));
	}
	
	

}
