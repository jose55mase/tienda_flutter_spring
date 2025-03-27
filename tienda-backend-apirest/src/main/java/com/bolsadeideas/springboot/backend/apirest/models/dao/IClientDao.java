package com.bolsadeideas.springboot.backend.apirest.models.dao;

import com.bolsadeideas.springboot.backend.apirest.models.entity.ClientEntity;
import com.bolsadeideas.springboot.backend.apirest.models.entity.ProductEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface IClientDao extends CrudRepository<ClientEntity, Long> {
    List<ClientEntity> findByIdShop(Long idShop);
}
