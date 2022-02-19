package foodelicious.article.repository;

import java.util.List;
import java.util.Map;

import foodelicious.article.model.ArticleData;
import foodelicious.article.model.ShareArea;

public interface ArticleRepository {

	void pushArticle(Map<String, String> params, Long id);

	List<ShareArea> findAll();

	List<ShareArea> useIdFindShareArea(int id);

	List<ArticleData> useIdFindArticleArea(int id);

	void useArticleIdDelete(int id);

	void UpdateArticle(Map<String, String> params, int id);

	List<ShareArea> findRecipe();

	List<ShareArea> findKitchenware();

	List<ShareArea> articleFuzzySearch(String clasify, String associateString);

	List<ShareArea> OneArticleFuzzySearch(String associateString);

	void viewNumUpdate(Integer ArticleId);

	String articleContent(Integer id);

	List<ShareArea> findVNAll();

	List<ShareArea> findVNRecipe();

	List<ShareArea> findVNKitchenware();

	List<ShareArea> focuseData(Long userID);

}
