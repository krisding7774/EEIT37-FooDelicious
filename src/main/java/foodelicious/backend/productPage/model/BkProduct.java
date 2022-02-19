package foodelicious.backend.productPage.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "productNum")
public class BkProduct implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id")
    private Integer productId;

    @Column(name = "categories")
    private Integer categories;

    @Column(name = "product_company")
    private String productCompany;

    @Column(name = "product_status")
    private String product_status;

    @Column(name = "product_name")
    private String productName;

    @Column(name = "product_content")
    private String productContent;

    @Column(name = "product_price")
    private Integer productPrice;

    @Column(name = "product_stock")
    private Integer productStock;

    @Column(name = "product_sales_figures")
    private Integer productSalesFigures;

    @Column(name = "product_keywords")
    private String productKeywords;

    @Column(name = "product_insert_date")
    private Date productInsertDate;

    @Column(name = "product_pics")
    private String productImg;

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getCategories() {
        return categories;
    }

    public void setCategories(Integer categories) {
        this.categories = categories;
    }

    public String getProductCompany() {
        return productCompany;
    }

    public void setProductCompany(String productCompany) {
        this.productCompany = productCompany;
    }

    public String getProduct_status() {
        return product_status;
    }

    public void setProduct_status(String product_status) {
        this.product_status = product_status;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductContent() {
        return productContent;
    }

    public void setProductContent(String productContent) {
        this.productContent = productContent;
    }

    public Integer getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Integer productPrice) {
        this.productPrice = productPrice;
    }

    public Integer getProductStock() {
        return productStock;
    }

    public void setProductStock(Integer productStock) {
        this.productStock = productStock;
    }

    public Integer getProductSalesFigures() {
        return productSalesFigures;
    }

    public void setProductSalesFigures(Integer productSalesFigures) {
        this.productSalesFigures = productSalesFigures;
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
}
