package foodelicious.backend.productPage.service;

import foodelicious.backend.productPage.model.BkProduct;

import java.util.List;

public interface BkProductService {

    public List<BkProduct> findAllProduct();

    public List<BkProduct> findAllByName(String productName);

    public List<BkProduct> findByNameAndType(String productName,Integer categories);

    public List<BkProduct> findByType(Integer categories);

    public BkProduct findById(Integer productId);

    public String  update(Integer productId, BkProduct bkProduct);

    public String  delete(Integer productId);

}
