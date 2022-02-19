package foodelicious.backend.managerPage.model;


import java.util.List;

import foodelicious.backend.memberpage.model.BkMember;

public interface BkManagerDao {

    public List<BkMember> findAllManager();

    public List<BkMember> findByMail(String mail);

    public BkMember findById(Long memberId);

    public String update(Long memberId,BkMember bkMember);

    public List<BkMember> findByStatus(String status);

}
