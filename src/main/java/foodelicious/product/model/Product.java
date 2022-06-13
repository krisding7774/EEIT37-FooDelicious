package foodelicious.product.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "productNum")
public class Product implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "product_id")
	private Long productId;

	@Column(name = "categories")
	private Short productCategories;

	@Column(name = "product_categories_name")
	private String productCategoriesName;

	@Column(name = "product_name")
	private String productName;

	@Column(name = "product_company")
	private String productCompany;

	@Column(name = "product_company_id")
	private Long productCompanyId;

	@Column(name = "product_price")
	private Integer productPrice;

	@Column(name = "product_pics")
	private String productPics;

	@NotBlank(message = "內容不可空白")
	@Size(min = 3, max = 255, message = "請輸入最少5個字的敘述")
	@Column(name = "product_content")
	private String productContent;

	@Column(name = "product_stock")
	private Integer productStock;

	@Column(name = "product_status")
	private String productStatus;

	@Column(name = "product_keywords")
	private String productKeywords;

//	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@Column(name = "product_insert_date")
	private Date productInsertDate;

	@PrePersist // 設定物件轉換為Persistent以前行
	private void onCreate() {
		if (productInsertDate == null) {
			productInsertDate = new Date();
		}
	}

	@Column(name = "product_sales_figures")
	private Integer productSalesFigures;

	public Product() {
		super();
	}

	public Product(Long productId, Short productCategories, String productCategoriesName, String productName,
			String productCompany, Long productCompanyId, Integer productPrice, String productPics,
			@NotBlank(message = "內容不可空白") @Size(min = 3, max = 255, message = "請輸入最少5個字的敘述") String productContent,
			Integer productStock, String productStatus, String productKeywords, Date productInsertDate,
			Integer productSalesFigures) {
		super();
		this.productId = productId;
		this.productCategories = productCategories;
		this.productCategoriesName = productCategoriesName;
		this.productName = productName;
		this.productCompany = productCompany;
		this.productCompanyId = productCompanyId;
		this.productPrice = productPrice;
		this.productPics = productPics;
		this.productContent = productContent;
		this.productStock = productStock;
		this.productStatus = productStatus;
		this.productKeywords = productKeywords;
		this.productInsertDate = productInsertDate;
		this.productSalesFigures = productSalesFigures;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public Short getProductCategories() {
		return productCategories;
	}

	public void setProductCategories(Short productCategories) {
		this.productCategories = productCategories;
	}

	public String getProductCategories_name() {
		return productCategoriesName;
	}

	public void setProductCategories_name(String productCategories_name) {
		this.productCategoriesName = productCategories_name;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductCompany() {
		return productCompany;
	}

	public void setProductCompany(String productCompany) {
		this.productCompany = productCompany;
	}

	public Long getProductCompanyId() {
		return productCompanyId;
	}

	public void setProductCompanyId(Long productCompanyId) {
		this.productCompanyId = productCompanyId;
	}

	public Integer getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductPics() {
		return productPics;
	}

	public void setProductPics(String productPics) {
		this.productPics = productPics;
	}

	public String getProductContent() {
		return productContent;
	}

	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}

	public Integer getProductStock() {
		return productStock;
	}

	public void setProductStock(Integer productStock) {
		this.productStock = productStock;
	}

	public String getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}

	public String getProductKeywords() {
		return productKeywords;
	}

	public void setProductKeywords(String productKeywords) {
		this.productKeywords = productKeywords;
	}

	public Date getProductInsertDate() {
		return productInsertDate;
	}

	public void setProductInsertDate(Date productInsertDate) {
		this.productInsertDate = productInsertDate;
	}

	public Integer getProductSalesFigures() {
		return productSalesFigures;
	}

	public void setProductSalesFigures(Integer productSalesFigures) {
		this.productSalesFigures = productSalesFigures;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productCategories=" + productCategories
				+ ", productCategoriesName=" + productCategoriesName + ", productName=" + productName
				+ ", productCompany=" + productCompany + ",  productPrice=" + productPrice + ", productPics="
				+ productPics + ", productContent=" + productContent + ", productStock=" + productStock
				+ ", productStatus=" + productStatus + ", productKeywords=" + productKeywords + ", productInsertDate="
				+ productInsertDate + ", productSalesFigures=" + productSalesFigures + "]";
	}

}