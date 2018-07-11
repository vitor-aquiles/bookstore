package br.com.bookstore.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.bookstore.models.Livro;

@Repository
@Transactional
public class LivroDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	public void gravar(Livro livro) {
		em.persist(livro);
	}
	
	public List<Livro> listar(){
		return em.createQuery("from Livro", Livro.class).getResultList();
	}
	
	public Livro buscar(Integer livroCodigo) {
		return em.find(Livro.class, livroCodigo);
	}
	
	public void atualizar(Livro livro) {
		em.merge(livro);
	}
	
	public void excluir(Integer livroCodigo) {
		Livro livro = em.find(Livro.class, livroCodigo);
		em.remove(livro);
	}
	
	public Livro buscaCompleta(Integer codigo) {
		return em.createQuery("select l from Livro l join fetch l.preco join fetch l.paginas where l.codigo = :codigo", Livro.class).setParameter("codigo", codigo).getSingleResult();
	}

}
