package com.bolsadeideas.springboot.backend.apirest.models.services.intefaces;

import com.bolsadeideas.springboot.backend.apirest.models.entity.ClientEntity;
import com.bolsadeideas.springboot.backend.apirest.models.entity.ShopEntity;

import java.util.List;

public interface IShopService {


    List<ShopEntity> findAll();
    ShopEntity save(ShopEntity clientEntity);
    ShopEntity findOne(Long id);
    ShopEntity findByEmailAndPasswor(String email, String password);


}
