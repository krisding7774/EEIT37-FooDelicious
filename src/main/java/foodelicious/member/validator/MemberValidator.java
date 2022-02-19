package foodelicious.member.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import foodelicious.member.model.Member;

@Component
public class MemberValidator implements Validator {
	
	@Override
	public boolean supports(Class<?> clazz) {//如果方法執行不是Member的子子孫孫就不行
		return Member.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {//參數越往父代越好，這是物件導向的優點，如打針，打小狗打貓，如果物件很多參數就要寫很多，
//		但如果改成mammal的話就可簡化，但功能要往子代，因為兒子比父代功能多
		Member member = (Member) target;//(Member) 此為cast
//		if(target instanceof Product)因上面的support已過濾故不需要此行
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memberName", "member.memberName.empty", "姓名欄不能為空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memberGender", "member.memberGender.empty", "性別欄不能為空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memberMail", "member.memberMail.empty", "帳號欄不能為空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pwd", "member.pwd.empty", "密碼欄不能為空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memberBirth", "member.memberBirth.empty", "生日欄不能為空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memberAddress", "member.memberAddress.empty", "地址欄不能為空白");
		
		if (!errors.hasFieldErrors("memberMail")) {
			if (member.getMemberMail() != null && member.getMemberMail().length() <= 3) {
				errors.rejectValue("memberMail", "member.memberMail.length", "帳號欄必須為有效mail");
					}
			
		}
		if (!errors.hasFieldErrors("memberName")) {
			if (member.getMemberName() != null && member.getMemberName().length() < 2) {
				errors.rejectValue("memberName", "member.memberName.length", "姓名欄長度必須大於等於二");
			}
		}
	}
//還要考慮到跨欄位檢查，如：輸入密碼、再次確認密碼

}
