package com.bolsadeideas.springboot.backend.apirest.models.dao;

import com.bolsadeideas.springboot.backend.apirest.models.entity.ShopEntity;
import org.springframework.data.repository.CrudRepository;

public interface IShopDao extends CrudRepository<ShopEntity, Long> {

    ShopEntity findByEmailAndPasswor(String email, String password);
}
