package com.bolsadeideas.springboot.backend.apirest.models.services.intefaces;

import com.bolsadeideas.springboot.backend.apirest.models.entity.ClientEntity;
import com.bolsadeideas.springboot.backend.apirest.models.entity.ProductEntity;

import java.util.List;

public interface IClientService {


    List<ClientEntity> findAll(Long idShop);
    ClientEntity save(ClientEntity clientEntity);
    ClientEntity findOne(Long id);


}
