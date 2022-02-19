package foodelicious.backend.memberpage.service;

import java.util.List;

import foodelicious.backend.memberpage.model.BkMember;



public interface BkMemberService {

    public List<BkMember> getAllData();

    public List<BkMember> findByEmail(String searchEmail);

    public BkMember findById(Long memberId);

    public String update(Long memberId, BkMember bkMember);

    public String delete(Long memberId);
}
