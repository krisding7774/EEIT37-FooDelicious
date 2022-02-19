package foodelicious.backend.productPage.model;

import foodelicious.backend.productPage.repository.BkProductRepository;
import foodelicious.backend.productPage.repository.BkShopCartRepository;
import foodelicious.backend.productPage.service.BkProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;
import foodelicious.backend.productPage.model.BkProduct;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class BkProductDaoImpl implements BkProductDao{

    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    @Autowired
    private BkShopCartRepository bkShopCartRepository;

    @Autowired
    private BkProductRepository bkProductRepository;

    public BkProductDaoImpl(BkProductRepository bkProductRepository) {
        this.bkProductRepository = bkProductRepository;
    }

    @Override
    public List<BkProduct> findAllProduct() {

        List<BkProduct> products = (List<BkProduct>) bkProductRepository.findAll();

        return products;
    }

    @Override
    public List<BkProduct> findAllByName(String productName) {

        List<BkProduct> products = bkProductRepository.findByName(productName);

        return products;
    }

    @Override
    public List<BkProduct> findByNameAndType(String productName, Integer categories) {

        List<BkProduct> products = bkProductRepository.findByNameAndType(productName, categories);

        return products;
    }

    @Override
    public List<BkProduct> findByType(Integer categories) {

        List<BkProduct> products = bkProductRepository.findByType(categories);
        return products;
    }

    @Override
    public BkProduct findById(Integer productId) {

        BkProduct product = bkProductRepository.findById(productId).orElse(null);
        return product;
    }

    @Override
    public String update(Integer productId, BkProduct bkProduct) {
        BkProduct product = bkProductRepository.findById(productId).orElse(null);
        if(product != null){
            product.setCategories(bkProduct.getCategories());
            product.setProductCompany(bkProduct.getProductCompany());
            product.setProduct_status(bkProduct.getProduct_status());
            product.setProductName(bkProduct.getProductName());
            product.setProductContent(bkProduct.getProductContent());
            product.setProductPrice(bkProduct.getProductPrice());
            product.setProductStock(bkProduct.getProductStock());
            product.setProductSalesFigures(bkProduct.getProductSalesFigures());
            product.setProductKeywords(bkProduct.getProductKeywords());
            bkProductRepository.save(product);
            return "資料更新成功";
        }else{
            return "資料更新失敗";
        }
    }


    @Override
    public String delete(Integer productId) {

        List<BkShoppingCar> car = bkShopCartRepository.findByProductId(productId);

        if(car != null){
            bkShopCartRepository.deleteAll(car);
        }

        bkProductRepository.deleteById(productId);
        return "資料刪除成功";
    }
}
