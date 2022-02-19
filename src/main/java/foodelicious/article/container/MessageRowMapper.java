package foodelicious.article.container;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import foodelicious.article.model.MsgArea;


public class MessageRowMapper implements RowMapper<MsgArea> {

	
	@Override
	public MsgArea mapRow(ResultSet rs, int rowNum) throws SQLException {
		MsgArea msgArea = new MsgArea();
		msgArea.setId(rs.getLong("id"));
		msgArea.setFk_member_id(rs.getLong("fk_member_id"));
		msgArea.setFk_article_id(rs.getInt("fk_article_id"));
		
		msgArea.setText(rs.getString("text"));
		msgArea.setMsgPostTime(rs.getTimestamp("msgPostTime"));
		msgArea.setMemberName(rs.getString("memberName"));
		return msgArea;
	}

	
}
