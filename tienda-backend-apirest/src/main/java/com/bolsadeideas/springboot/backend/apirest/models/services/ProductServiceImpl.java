package com.bolsadeideas.springboot.backend.apirest.models.services;

import com.bolsadeideas.springboot.backend.apirest.models.dao.IProductDao;
import com.bolsadeideas.springboot.backend.apirest.models.entity.ProductEntity;
import com.bolsadeideas.springboot.backend.apirest.models.services.intefaces.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;


@Service
public class ProductServiceImpl implements IProductService {

    @Autowired
    IProductDao iProductDao;

    @Override
    public List<ProductEntity> findAll(Long idShop) {
        //Optional<List<ProductEntity>> data = (List<ProductEntity>) this.iProductDao.findAll();
        return (List<ProductEntity>) this.iProductDao.findByIdShop(idShop);
    }

    @Override
    public ProductEntity save(ProductEntity productEntity) {
        return this.iProductDao.save(productEntity);
    }

    @Override
    public ProductEntity findOne(Long id) {
        ProductEntity productEntity = new ProductEntity();
        Optional<ProductEntity> data = this.iProductDao.findById(id);
        if (data.isPresent()){
            return data.get();
        } else {
            return productEntity;
        }

    }
}
