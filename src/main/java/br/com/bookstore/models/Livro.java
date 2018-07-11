package br.com.bookstore.models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OrderColumn;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Entity
public class Livro {

	@Id
	@NotNull(message="'Código' é obrigatório")
	private Integer codigo;
	
	@NotBlank(message="'Título' é obrigatório")
	private String titulo;
	
	@Valid
	@ElementCollection(fetch=FetchType.EAGER)
	@OrderColumn
	private List<Paginas> paginas= new ArrayList<Paginas>();
	
	@NotBlank(message="'Gênero' é obrigatório")
	private String genero;
	
	@NotBlank(message="'Data de publicação' é obrigatório")
	private String dataPublicacao;

	@NotBlank(message="'Autor' é obrigatório")
	private String autor;

	@Valid
	@ElementCollection(fetch=FetchType.EAGER)
	@OrderColumn
	private List<Preco> preco = new ArrayList<Preco>();

	public Integer getCodigo() {
		return codigo;
	}
	
	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public List<Paginas> getPaginas() {
		return paginas;
	}

	public void setPaginas(List<Paginas> paginas) {
		this.paginas = paginas;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public String getDataPublicacao() {
		return dataPublicacao;
	}

	public void setDataPublicacao(String dataPublicacao) {
		this.dataPublicacao = dataPublicacao;
	}

	public String getAutor() {
		return autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}
	
	public List<Preco> getPreco() {
		return preco;
	}

	public void setPreco(List<Preco> preco) {
		this.preco = preco;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + codigo;
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
		Livro other = (Livro) obj;
		if (codigo == null) {
			if (other.codigo != null)
				return false;
		} else if (!codigo.equals(other.codigo))
			return false;
		return true;
	}
	
	
	
}
