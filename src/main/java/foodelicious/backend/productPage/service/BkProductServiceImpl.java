package foodelicious.backend.productPage.service;

import foodelicious.backend.productPage.model.BkProduct;
import foodelicious.backend.productPage.model.BkProductDao;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BkProductServiceImpl implements BkProductService{

    private BkProductDao bkProductDao;

    public BkProductServiceImpl(BkProductDao bkProductDao) {
        this.bkProductDao = bkProductDao;
    }

    @Override
    public List<BkProduct> findAllProduct() {
        return bkProductDao.findAllProduct();
    }

    @Override
    public List<BkProduct> findAllByName(String productName) {
        return bkProductDao.findAllByName(productName);
    }

    @Override
    public List<BkProduct> findByNameAndType(String productName, Integer categories) {
        return bkProductDao.findByNameAndType(productName, categories);
    }

    @Override
    public List<BkProduct> findByType(Integer categories) {
        return bkProductDao.findByType(categories);
    }

    @Override
    public BkProduct findById(Integer productId) {
        return bkProductDao.findById(productId);
    }

    @Override
    public String update(Integer productId, BkProduct bkProduct) {
        return bkProductDao.update(productId, bkProduct);
    }

    @Override
    public String delete(Integer productId) {
        return bkProductDao.delete(productId);
    }
}
