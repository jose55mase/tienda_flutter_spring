package com.bolsadeideas.springboot.backend.apirest.models.dao;

import com.bolsadeideas.springboot.backend.apirest.models.entity.ProductEntity;
import com.bolsadeideas.springboot.backend.apirest.models.entity.SaleEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ISaleDao extends CrudRepository<SaleEntity, Long> {

    //List<ProductEntity> findByIdShop(Long idShop);
    List<SaleEntity> findTop25ByIdShopOrderByIdDesc(Long idShop);
    List<SaleEntity> findByClientName(String clientName);
    List<SaleEntity> findByPay(Boolean pay);
    List<SaleEntity> findByDateBetween(String date, String dataFinal);
    List<SaleEntity> findByDateAndPayAndClientName(String date, Boolean pay, String clientName);
    List<SaleEntity> findByPayAndClientName( Boolean pay, String clientName);
    List<SaleEntity> findByClientId( Integer clientId );
}
