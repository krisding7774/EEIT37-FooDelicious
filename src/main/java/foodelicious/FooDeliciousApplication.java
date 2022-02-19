package foodelicious;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@SpringBootApplication
public class FooDeliciousApplication {

	public static void main(String[] args) {
		SpringApplication.run(FooDeliciousApplication.class, args);
	}

	@Bean
	public TilesConfigurer tilesConfig() {
		TilesConfigurer tilesConfig = new TilesConfigurer();
		String[] defs = { "WEB-INF/tiles.xml" };
		tilesConfig.setDefinitions(defs);
		return tilesConfig;
	}

	@Bean
	public UrlBasedViewResolver tilesViewResolver() {
		UrlBasedViewResolver tilesViewResolver = new UrlBasedViewResolver();
		tilesViewResolver.setViewClass(TilesView.class);
		return tilesViewResolver;
	}


}
