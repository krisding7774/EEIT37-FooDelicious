package foodelicious.backend.managerPage.controller;


import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import foodelicious.backend.managerPage.service.BkManagerService;
import foodelicious.backend.memberpage.model.BkMember;

@RestController
public class BkManagerController {

    private BkManagerService bkManagerService;

    public BkManagerController(BkManagerService bkManagerService) {
        this.bkManagerService = bkManagerService;
    }

    @GetMapping("/bkmanagers")
    public List<BkMember> findAllManager(){
        return bkManagerService.findAllManager();
    }

    @GetMapping("/bkmanagers/{mail}")
    public List<BkMember> findByMail(@PathVariable String mail){
        return bkManagerService.findByMail(mail);
    }

    @GetMapping("/bkmanagers/update/{memberId}")
    public BkMember findById(@PathVariable Long memberId){
        return bkManagerService.findById(memberId);
    }

    @PutMapping("/bkmanagers/update/{memberId}")
    public String update(@PathVariable Long memberId,
                        @RequestBody BkMember bkMember){
        return bkManagerService.update(memberId, bkMember);
    }

    @GetMapping("/bkmanagers/find/{status}")
    public List<BkMember> findByStatus(@PathVariable String status){
        return bkManagerService.findByStatus(status);
    }

}
