package foodelicious.CustomerService.model;

import java.io.Serializable;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;


@Entity
@Table(name = "customer_service")
public class CustomerService implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private Long Id;
	
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cstm_Id")
	private Long cstm_Id;
	
	@NotBlank(message="姓名不可為空白")
	@Column(name = "cstm_name")
	private String cstm_name;

	@Email
	@NotBlank(message="Email不可為空白")
	@Column(name = "cstm_email")
	private String cstm_email;
	
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "vendor_Id")
	private Long vendor_Id;
	
	@NotBlank(message="請選擇問題類型")
	@Column(name = "problem_Type")
	private String problem_Type;

	@NotBlank(message="內容不可為空白")
	@Size(max = 500, message = "內容不得多於500個字")
	@Column(name = "problem_Text")
	private String problem_Text;
	
	@Size(max = 500, message = "內容不得多於500個字")
	@Column(name = "responseMessage")
	private String responseMessage;
	
	@Column(name = "problem_postTime")
	private LocalDateTime problem_postTime;

	
	public CustomerService() {
	}
	
	public CustomerService(String problem_Type) {
		this.problem_Type = problem_Type;
	}
	
	public CustomerService(@NotBlank(message = "標題不可為空白") String problem_Type,
			@NotBlank(message = "內容不可為空白") @Size(max = 500, message = "內容不得多於500個字") String problem_Text,
			LocalDateTime problem_postTime) {
		super();
		this.problem_Type = problem_Type;
		this.problem_Text = problem_Text;
		this.problem_postTime = problem_postTime;
		//this.block_Img = block_Img;
	}

	public Long getId() {
		return Id;
	}

	public void setId(Long id) {
		Id = id;
	}

	public Long getCstm_Id() {
		return cstm_Id;
	}

	public void setCstm_Id(Long cstm_Id) {
		this.cstm_Id = cstm_Id;
	}

	public String getCstm_name() {
		return cstm_name;
	}

	public void setCstm_name(String cstm_name) {
		this.cstm_name = cstm_name;
	}

	public String getCstm_email() {
		return cstm_email;
	}

	public void setCstm_email(String cstm_email) {
		this.cstm_email = cstm_email;
	}

	public Long getVendor_Id() {
		return vendor_Id;
	}

	public void setVendor_Id(Long vendor_Id) {
		this.vendor_Id = vendor_Id;
	}

	public String getProblem_Type() {
		return problem_Type;
	}

	public void setProblem_Type(String problem_Type) {
		this.problem_Type = problem_Type;
	}

	public String getProblem_Text() {
		return problem_Text;
	}

	public void setProblem_Text(String problem_Text) {
		this.problem_Text = problem_Text;
	}

	public LocalDateTime getProblem_postTime() {
		return problem_postTime;
	}

	public void setProblem_postTime(LocalDateTime problem_postTime) {
		this.problem_postTime = problem_postTime;
	}

//	public String getBlock_Img() {
//		return block_Img;
//	}
//
//	public void setBlock_Img(String block_Img) {
//		this.block_Img = block_Img;
//	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public void get(String string) {
		// TODO Auto-generated method stub
		
	}

	public String getResponseMessage() {
		return responseMessage;
	}

	public void setResponseMessage(String responseMessage) {
		this.responseMessage = responseMessage;
	}
}
