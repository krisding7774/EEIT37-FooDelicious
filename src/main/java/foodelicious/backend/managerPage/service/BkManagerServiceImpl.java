package foodelicious.backend.managerPage.service;

import java.util.List;

import org.springframework.stereotype.Service;

import foodelicious.backend.managerPage.model.BkManagerDao;
import foodelicious.backend.memberpage.model.BkMember;

@Service
public class BkManagerServiceImpl implements BkManagerService{

    private BkManagerDao bkManagerDao;

    public BkManagerServiceImpl(BkManagerDao bkManagerDao) {
        this.bkManagerDao = bkManagerDao;
    }

    @Override
    public List<BkMember> findAllManager() {
        return bkManagerDao.findAllManager();
    }

    @Override
    public List<BkMember> findByMail(String mail) {
        return bkManagerDao.findByMail(mail);
    }

    @Override
    public BkMember findById(Long memberId) {
        return bkManagerDao.findById(memberId);
    }

    @Override
    public String update(Long memberId, BkMember bkMember) {
        return bkManagerDao.update(memberId,bkMember);
    }

    @Override
    public List<BkMember> findByStatus(String status) {
        return bkManagerDao.findByStatus(status);
    }
}
