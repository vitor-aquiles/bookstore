package br.com.bookstore.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import br.com.bookstore.models.Usuario;

@Repository
public class UsuarioDAO implements UserDetailsService{

	@PersistenceContext
	private EntityManager em;
	
	public void gravar(Usuario usuario) {
		em.persist(usuario);
	}
	
	public Usuario buscar(String nome) {
		return em.find(Usuario.class, nome);
	}

	public Usuario loadUserByUsername(String nome){
		List<Usuario> usuarios = em.createQuery("select u from Usuario u where u.nome = :pNome", Usuario.class)
				.setParameter("pNome", nome).getResultList();
		
		if(usuarios == null) {
			throw new UsernameNotFoundException("Usuário " + nome + " não foi encontrado!");
		}
		return usuarios.get(0);
	}
}
