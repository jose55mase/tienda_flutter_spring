package com.bolsadeideas.springboot.backend.apirest.models.dao;

import com.bolsadeideas.springboot.backend.apirest.models.entity.ProductEntity;
import com.bolsadeideas.springboot.backend.apirest.models.entity.SaleEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface IProductDao extends CrudRepository<ProductEntity, Long> {

    List<ProductEntity> findByIdShop(Long idShop);
}
