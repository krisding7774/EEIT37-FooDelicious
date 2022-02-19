package foodelicious.compbackend.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import foodelicious.compbackend.model.CBKProductDao;
import foodelicious.product.model.Product;

@Controller
public class CompanyBackEndController {


	@GetMapping(path = "/companyMain")
	public String companyMain2() {

		return "app.CompanyMain2";
	}

	@GetMapping(path = "/companyProduct")
	public String companyProduct2() {

		return "app.CompanyProduct2";
	}

	@GetMapping(path = "/companyProductsAdd")
	public String companyProductAdd() {
		return "app.CompanyProductAdd2";
	}
	
	@GetMapping(path = "/companyProductsAdd2")
	public String companyProductAdd2() {
		return "app.CompanyProductAdd2";
	}
	
	@GetMapping(path = "/companyBestSeller")
	public String companyBestSeller() {
		return "app.CompanyBestSeller";
	}
	
	@GetMapping(path = "/companyOrder")
	public String companyOrder() {

		return "app.CompanyOrder2";
	}

	@GetMapping(path = "/companyProduct/update")
	public String companyProductUpdate() {

		return "app.CompanyProductUpdate";
	}

	@GetMapping(path = "/logout")
	public String companyLogout(HttpSession session, SessionStatus status) {
		status.setComplete();
		session.invalidate();
		return "app.index";
	}

	
	private final CBKProductDao cbkProductDao;

	public CompanyBackEndController(final CBKProductDao cbkProductDao) {
		
		this.cbkProductDao = cbkProductDao;
	}
	
	//==============Product Insert (有時間再改成mvc)==============================

	// 新增商品與圖片
	@PostMapping("/companyProductsAdd")
	public String post(@RequestParam(name = "productCategories") Short productCategories,
			@RequestParam(name = "productCategoriesName") String productCategoriesName,
			@RequestParam(name = "productName") String productName,
			@RequestParam(name = "productCompany") String productCompany,
			@RequestParam(name = "productCompanyId") Long productCompanyId,
			@RequestParam(name = "productPrice") Integer productPrice,
			@RequestParam(name = "productContent") String productContent,
			@RequestParam(name = "productStock") Integer productStock,
			@RequestParam(name = "productStatus") String productStatus,
			@RequestParam(name = "productKeywords") String productKeywords,
			@RequestParam(name = "productSalesFigures") Integer productSalesFigures, MultipartFile photo,
			HttpSession session) throws IllegalStateException, IOException, ParseException {

		String fileName = photo.getOriginalFilename();
		String saveFileDirPath = session.getServletContext().getRealPath("/") + "img\\";

		String suffixName = fileName.substring(fileName.lastIndexOf("."));
		String uuid = UUID.randomUUID().toString();
		fileName = uuid + suffixName;
		String finalPath = saveFileDirPath + File.separator + fileName;

		File saveFileDestPath = new File(finalPath);
		photo.transferTo(saveFileDestPath);

		Product product = new Product();
		product.setProductCategories(productCategories);
		product.setProductCategories_name(productCategoriesName);
		product.setProductName(productName);
		product.setProductCompany(productCompany);
		product.setProductCompanyId(productCompanyId);
		product.setProductPrice(productPrice);
		product.setProductPics(fileName);
		product.setProductContent(productContent);
		product.setProductStock(productStock);
		product.setProductStatus(productStatus);
		product.setProductKeywords(productKeywords);
		product.setProductSalesFigures(productSalesFigures);

		boolean insertStatus = cbkProductDao.saveProduct(product);

		if (insertStatus == true) {
			// 如何在這邊加alert說商品insert成功
			
			return "app.CompanyProduct2";

		} else {
			// 如何在這邊加alert說商品insert失敗
			return "app.CompanyProductAdd";
		}

	}

}
