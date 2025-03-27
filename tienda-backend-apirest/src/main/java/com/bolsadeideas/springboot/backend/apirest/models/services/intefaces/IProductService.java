package com.bolsadeideas.springboot.backend.apirest.models.services.intefaces;

import com.bolsadeideas.springboot.backend.apirest.models.entity.ProductEntity;

import java.util.List;

public interface IProductService {

    List<ProductEntity> findAll(Long idShop);
    ProductEntity save(ProductEntity productEntity);
    ProductEntity findOne(Long id);


}
