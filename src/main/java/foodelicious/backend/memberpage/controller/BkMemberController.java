package foodelicious.backend.memberpage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import foodelicious.backend.memberpage.model.BkMember;
import foodelicious.backend.memberpage.repository.BkCrudRepository;
import foodelicious.backend.memberpage.service.BkMemberService;


@RestController
public class BkMemberController {

    private BkMemberService bkMemberService;

    @Autowired
    private BkCrudRepository bkCrudRepository;

    public BkMemberController(BkMemberService bkMemberService) {
        this.bkMemberService = bkMemberService;
    }

    @GetMapping("/bkmembers")
    public List<BkMember> getAllData(){
        return bkMemberService.getAllData();
    }

    @GetMapping("/bkmembers/{searchEmail}")
    public List<BkMember> getAllByAcc(@PathVariable String searchEmail){
        return bkMemberService.findByEmail(searchEmail);
    }

    @GetMapping("/bkmembers/update/{memberId}")
    public BkMember findById(@PathVariable Long memberId){
        return bkMemberService.findById(memberId);
    }

    @PutMapping("/bkmembers/update/{memberId}")
    public String update(@PathVariable Long memberId,
                         @RequestBody BkMember bkMember){
        return bkMemberService.update(memberId, bkMember);
    }

    @DeleteMapping("/bkmembers/delete/{memberId}")
    public String delete(@PathVariable Long memberId){
        return bkMemberService.delete(memberId);
    }

}
