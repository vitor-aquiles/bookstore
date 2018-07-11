package br.com.bookstore.conf;

import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.concurrent.ConcurrentMapCacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import br.com.bookstore.controller.HomeController;
import br.com.bookstore.controller.LivrosController;
import br.com.bookstore.dao.LivroDAO;
import br.com.bookstore.dao.UsuarioDAO;

@EnableWebMvc
@ComponentScan(basePackageClasses= {HomeController.class, LivrosController.class, LivroDAO.class, UsuarioDAO.class})
@EnableCaching
public class AppWebConfiguration implements WebMvcConfigurer {

	@Bean
	public InternalResourceViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		
		return resolver;
	}
	
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
	
	@Bean
	public CacheManager cacheManager() {
		//CacheBuilder<Object, Object> builder = CacheBuilder.newBuilder().maximumSize(100).expireAfterAccess(5, TimeUnit.MINUTES);  GUAVA
		/*LoadingCache<Object, Object> builder = Caffeine.newBuilder().maximumSize(100).expireAfterWrite(5, TimeUnit.MINUTES).build(
                new CacheLoader<Object, Object>() {
                    public String load(Object key) {
                        return ;
                    }
                });
			
		//});
		*/
		return new ConcurrentMapCacheManager();
	}
	
	
}
