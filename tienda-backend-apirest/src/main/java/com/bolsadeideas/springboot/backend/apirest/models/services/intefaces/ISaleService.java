package com.bolsadeideas.springboot.backend.apirest.models.services.intefaces;

import com.bolsadeideas.springboot.backend.apirest.models.entity.ProductEntity;
import com.bolsadeideas.springboot.backend.apirest.models.entity.SaleEntity;

import java.util.List;

public interface ISaleService {

    List<SaleEntity> findAll(Long idShop);
    SaleEntity save(SaleEntity saleEntity);
    SaleEntity findOne(Long id);
    List<SaleEntity> saveAll(List<SaleEntity> saleEntities);
    List<SaleEntity> filter(String status, String nameClient, String date, String dateFinal);
    List<SaleEntity> findByClientId(Integer clientId);

}
