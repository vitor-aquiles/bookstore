package br.com.bookstore.models;

import javax.persistence.Embeddable;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

@Embeddable
public class Paginas {
	
	@NotNull(message="Nº de páginas é obrigatório")
	@Min(value=1, message="Informe um nº válido")
	private Integer quantidade;
	
	private Idioma idioma;
	
	public Integer getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}
	public Idioma getIdioma() {
		return idioma;
	}
	public void setIdioma(Idioma idioma) {
		this.idioma = idioma;
	}
	
	
}
