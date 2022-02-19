package foodelicious.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

import foodelicious.product.model.Product;
import foodelicious.product.model.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	//show all data
	@GetMapping("/Product")
	public String  productlist(String productName,Model m) {
		List<Product> pros = productService.findAll();
		m.addAttribute("pros", pros);
		return "app.Product";
	}
	@ResponseBody
	@GetMapping("/Products")
	public List<Product>  productlist2(String productName,Model m) {
		  return productService.findAll();
	}
	
	//create model Attribute to bind for data
	@GetMapping("/backend/productAdd")
	public String showNewProductForm(Model m) {
		Product product = new Product();
		m.addAttribute("product",product);
		return "app.BackendProductAdd";
	}
	
	//save product to database
	@PostMapping("/Product")
	public String saveProduct(@ModelAttribute("product") Product product) {
		productService.saveProduct(product);
		return "redirect:/Product";
	}
	
	//show datadetail
	@GetMapping("/Product/{productId}")
    public String findproduct(@PathVariable Long productId, Model model) {
		List<Product> prod = productService.findByProductId(productId);
		model.addAttribute("prod",prod);
        return "app.ProductDetail";
    }
	
	//新增商品與圖片
//	@ResponseBody
	@PostMapping("/backend/product")
	public String post(@RequestParam(name = "productCategories") Short productCategories, @RequestParam(name = "productCategoriesName") String productCategoriesName,
			@RequestParam(name = "productName") String productName, @RequestParam(name = "productCompany") String productCompany,
			@RequestParam(name = "productCompanyId") Long productCompanyId,@RequestParam(name = "productPrice") Integer productPrice,
			@RequestParam(name = "productContent") String productContent,@RequestParam(name = "productStock") Integer productStock,
			@RequestParam(name = "productStatus") String productStatus,@RequestParam(name = "productKeywords") String productKeywords,@RequestParam(name = "productInsertDate") @DateTimeFormat(pattern ="yyyy-MM-dd HH:mm:ss") Date productInsertDate,
			@RequestParam(name = "productSalesFigures") Integer productSalesFigures,
			MultipartFile photo, HttpSession session)
			throws IllegalStateException, IOException, ParseException {

		String fileName = photo.getOriginalFilename();
		String saveFileDirPath = session.getServletContext().getRealPath("/") + "img\\";

		String suffixName = fileName.substring(fileName.lastIndexOf("."));
		String uuid = UUID.randomUUID().toString();
		fileName = uuid + suffixName;
		String finalPath = saveFileDirPath + File.separator + fileName;

		File saveFileDestPath = new File(finalPath);
		photo.transferTo(saveFileDestPath);

		Product t = new Product();
		t.setProductCategories(productCategories);
		t.setProductCategories_name(productCategoriesName);
		t.setProductName(productName);
		t.setProductCompany(productCompany);
		t.setProductCompanyId(productCompanyId);
		t.setProductPrice(productPrice);
		t.setProductPics(fileName);
		t.setProductContent(productContent);
		t.setProductStock(productStock);
		t.setProductStatus(productStatus);
		t.setProductKeywords(productKeywords);
		t.setProductInsertDate(productInsertDate);
		t.setProductSalesFigures(productSalesFigures);
		
		productService.saveProduct(t);

		return "redirect:/backend/product";
	}
	@ResponseBody
	@GetMapping("/Products/{productName}")
    public List<Product> findAllByName(@PathVariable String productName){
        return productService.findAllByName(productName);
    }
	@ResponseBody
    @GetMapping("/Products/{productName}/{categories}")
    public List<Product> findByNameAndType(@PathVariable String productName,
                                             @PathVariable Integer categories){
        return  productService.findByNameAndType(productName, categories);
    }
	@ResponseBody
    @GetMapping("/Products/search/{categories}")
    public List<Product> findAllByType(@PathVariable Integer categories){
        return productService.findByType(categories);
    }
	
	@ResponseBody
	@GetMapping("/Products/searchkey/{productKeywords}")
	public List<Product> findByProductKeywords(@PathVariable String productKeywords){
		return productService.findByProductKeywords(productKeywords);
	}

	@InitBinder
	public void initBinder(WebDataBinder binder, WebRequest request) {
		// 轉換日期格式
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		 dateFormat.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

}
