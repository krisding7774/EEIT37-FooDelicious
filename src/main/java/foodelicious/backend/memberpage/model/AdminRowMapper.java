package foodelicious.backend.memberpage.model;




import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import foodelicious.member.model.Member;

public class AdminRowMapper implements RowMapper<Member> {

    @Override
    public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
        Member member = new Member();

        member.setMember_status(rs.getString("member_status"));

        return member;
    }
}
