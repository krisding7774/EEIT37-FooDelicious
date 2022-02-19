package foodelicious.article.service.impl;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import foodelicious.article.model.ArticleData;
import foodelicious.article.model.ShareArea;
import foodelicious.article.repository.ArticleRepository;
import foodelicious.article.service.ArticleService;

@Service
@Transactional
public class ArticleServiceImpl implements ArticleService{
	
	ArticleRepository articleRepository;

	//spring 4.3後內建
	public ArticleServiceImpl(ArticleRepository articleRepository) {
		this.articleRepository = articleRepository;
	}

	@Override
	public void pushArticle(Map<String, String> params, Long id) {
		articleRepository.pushArticle(params, id);
	}

	@Override
	public List<ShareArea> findAll() {
		return articleRepository.findAll();
	}

	@Override
	public List<ShareArea> useIdFindShareArea(int id) {
		return articleRepository.useIdFindShareArea(id);
	}

	@Override
	public List<ArticleData> useIdFindArticleArea(int id) {
		return articleRepository.useIdFindArticleArea(id);
	}

	@Override
	public void useArticleIdDelete(int id) {
		articleRepository.useArticleIdDelete(id);
	}

	@Override
	public void UpdateArticle(Map<String, String> params, int id) {
		articleRepository.UpdateArticle(params, id);
	}

	@Override
	public List<ShareArea> findRecipe() {
		return articleRepository.findRecipe();
	}

	@Override
	public List<ShareArea> findKitchenware() {
		return articleRepository.findKitchenware();
	}

	@Override
	public List<ShareArea> articleFuzzySearch(String clasify, String associateString) {
		return articleRepository.articleFuzzySearch(clasify, associateString);		
	}

	@Override
	public List<ShareArea> OneArticleFuzzySearch(String associateString) {
		return articleRepository.OneArticleFuzzySearch(associateString);
	}

	@Override
	public void viewNumUpdate(Integer ArticleId) {
		articleRepository.viewNumUpdate(ArticleId);
	}

	@Override
	public String articleContent(Integer id) {
		return articleRepository.articleContent(id);
	}

	@Override
	public List<ShareArea> findVNAll() {		
		return articleRepository.findVNAll();
	}

	@Override
	public List<ShareArea> findVNRecipe() {
		return articleRepository.findVNRecipe();
	}

	@Override
	public List<ShareArea> findVNKitchenware() {
		return articleRepository.findVNKitchenware();
	}

	@Override
	public List<ShareArea> focuseData(Long userID) {
		return articleRepository.focuseData(userID);
	}	
	
}
