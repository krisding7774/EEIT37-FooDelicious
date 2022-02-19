package foodelicious.backend.managerPage.model;


import java.util.List;

import org.springframework.stereotype.Repository;

import foodelicious.backend.managerPage.repository.BkManagerRepository;
import foodelicious.backend.memberpage.model.BkMember;

@Repository
public class BkManagerDaoImpl implements BkManagerDao{

    private BkManagerRepository bkManagerRepository;

    public BkManagerDaoImpl(BkManagerRepository bkManagerRepository) {
        this.bkManagerRepository = bkManagerRepository;
    }

    @Override
    public List<BkMember> findAllManager(){
        List<BkMember> managers = bkManagerRepository.findAllManager();
        return managers;
    }

    @Override
    public List<BkMember> findByMail(String mail) {
        List<BkMember> managers = bkManagerRepository.findByMail(mail);
        return managers;
    }

    @Override
    public BkMember findById(Long memberId) {
        BkMember manager = bkManagerRepository.findById(memberId).orElse(null);
        return manager;
    }

    @Override
    public String update(Long memberId,BkMember bkMember) {
        BkMember manager = bkManagerRepository.findById(memberId).orElse(null);
        if(manager != null){
            manager.setMemberStatus(bkMember.getMemberStatus());
            manager.setMemberName(bkMember.getMemberName());
            manager.setMemberPhone(bkMember.getMemberPhone());
            manager.setMemberAddress(bkMember.getMemberAddress());
            manager.setMemberCoin(bkMember.getMemberCoin());
            bkManagerRepository.save(manager);
        }

        return "更新資料成功";
    }

    @Override
    public List<BkMember> findByStatus(String status) {

        List<BkMember> list = bkManagerRepository.findByStatus(status);

        return list;
    }
}
