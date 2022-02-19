package foodelicious.article.container;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import foodelicious.article.model.ShareArea;

public class ShareAreaRowMapper implements RowMapper<ShareArea> {

	@Override
	public ShareArea mapRow(ResultSet rs, int rowNum) throws SQLException {
		ShareArea shareArea = new ShareArea();
		shareArea.setShare_id(rs.getInt("share_id"));
		shareArea.setArticle_clallify(rs.getString("article_clallify"));
		shareArea.setArticle_title(rs.getString("article_title"));
		shareArea.setFk_account_id(rs.getLong("fk_account_id"));
		shareArea.setArticle_likes(rs.getInt("article_likes"));
		shareArea.setViewNum(rs.getInt("viewNum"));
		shareArea.setPostTime(rs.getDate("postTime"));
		return shareArea;
	}

}
