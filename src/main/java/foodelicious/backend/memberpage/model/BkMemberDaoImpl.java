package foodelicious.backend.memberpage.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import foodelicious.backend.memberpage.repository.BkCrudRepository;

@Repository
public class BkMemberDaoImpl implements BkMemberDao {

    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    @Autowired
    private BkCrudRepository bkcrud;

    @Override
    public List<BkMember> getAllData() {
        List<BkMember> members = (List<BkMember>) bkcrud.findAll();
        return members;
    }

    @Override
    public List<BkMember> findByEmail(String searchEmail){
        List<BkMember> accounts = bkcrud.findByEmail(searchEmail);
        return accounts;
    }
    @Override
    public BkMember findById(Long memberId){
        BkMember updateMember = bkcrud.findById(memberId).orElse(null);
        return updateMember;
    }

    @Override
    public String update(Long memberId, BkMember bkMember){
        BkMember member = bkcrud.findById(memberId).orElse(null);
        if(member != null){
            member.setMemberStatus(bkMember.getMemberStatus());
            member.setMemberName(bkMember.getMemberName());
            member.setMemberGender(bkMember.getMemberGender());
            member.setMemberBirth(bkMember.getMemberBirth());
            member.setMemberPhone(bkMember.getMemberPhone());
            member.setMemberAddress(bkMember.getMemberAddress());
            member.setMemberCoin(bkMember.getMemberCoin());
            member.setDiscount(bkMember.getDiscount());
            bkcrud.save(member);
            return "資料更新成功!!";
        }else{
            return "資料更新失敗，查無此筆資料";
        }
    }
//    @Override
//    public void delete(Long memberId){
//        bkcrud.deleteById(memberId);
//
//    }

    @Override
    public String delete(Long memberId){
        String sql = "DELETE FROM member_data2 WHERE member_id = :memberId";
        Map<String, Object> map = new HashMap<>();
        map.put("memberId", memberId);
        namedParameterJdbcTemplate.update(sql, map);
        return "刪除資料成功";
    }
}
