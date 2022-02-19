package foodelicious.backend.memberpage.service;


import java.util.List;

import org.springframework.stereotype.Service;

import foodelicious.backend.memberpage.model.BkMember;
import foodelicious.backend.memberpage.model.BkMemberDao;

@Service
public class BkMemberServiceImpl implements BkMemberService {

    private final BkMemberDao bkMemberDao;

    public BkMemberServiceImpl(BkMemberDao bkMemberDao) {
        this.bkMemberDao = bkMemberDao;
    }

    @Override
    public List<BkMember> getAllData() {
        return bkMemberDao.getAllData();
    }

    @Override
    public List<BkMember> findByEmail(String searchEmail){return bkMemberDao.findByEmail(searchEmail);};

    @Override
    public BkMember findById(Long memberId){
        return bkMemberDao.findById(memberId);
    }

    @Override
    public String update(Long memberId, BkMember bkMember){
        return bkMemberDao.update(memberId, bkMember);
    }

    @Override
    public String delete(Long memberId){
        return bkMemberDao.delete(memberId);};
}
