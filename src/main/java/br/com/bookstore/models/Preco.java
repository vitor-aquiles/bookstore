package br.com.bookstore.models;

import java.math.BigDecimal;

import javax.persistence.Embeddable;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

//@Embeddable é usado para definir uma classe dependente de outra.
//Sua existência independente não faz sentido. No caso, não faz sentido existir um preço sem existir um livro.
//Não é possivel usar JPQL diretamente nesse tipo de classe.
@Embeddable
public class Preco {

	private Idioma idioma;
	
	@NotNull(message="Preço é obrigatório")
	@Digits(integer=3, fraction=2, message="Insira no máx centenas e 2 casas decimais")
	@Min(value=1, message="Insira um preço válido")
	private BigDecimal valor;
	
	public Idioma getIdioma() {
		return idioma;
	}
	public void setIdioma(Idioma idioma) {
		this.idioma = idioma;
	}
	public BigDecimal getValor() {
		return valor;
	}
	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}
}
