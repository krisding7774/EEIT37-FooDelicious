package foodelicious.article.container;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import foodelicious.article.model.ArticleData;

public class ArticleRowMapper implements RowMapper<ArticleData> {

	@Override
	public ArticleData mapRow(ResultSet rs, int rowNum) throws SQLException {
		ArticleData articleData = new ArticleData();
		
		articleData.setArticle_id(rs.getInt("article_id"));
		articleData.setFk_share_id(rs.getInt("fk_share_id"));
		
		articleData.setArticle(rs.getString("article"));
		
		return articleData;
	}

}
