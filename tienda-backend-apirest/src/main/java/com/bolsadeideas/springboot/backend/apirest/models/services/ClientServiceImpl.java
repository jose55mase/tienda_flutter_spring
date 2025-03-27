package com.bolsadeideas.springboot.backend.apirest.models.services;

import com.bolsadeideas.springboot.backend.apirest.models.dao.IClientDao;
import com.bolsadeideas.springboot.backend.apirest.models.entity.ClientEntity;
import com.bolsadeideas.springboot.backend.apirest.models.services.intefaces.IClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.Sort;


import java.util.List;


@Service
public class ClientServiceImpl implements IClientService {

    @Autowired
    IClientDao iClientDao;

    @Override
    public List<ClientEntity> findAll(Long idShop) {
        return (List<ClientEntity>) iClientDao.findByIdShop(idShop);
    }

    @Override
    public ClientEntity save(ClientEntity clientEntity) {
        return iClientDao.save(clientEntity);
    }

    @Override
    public ClientEntity findOne(Long id) {
        return iClientDao.findById(id).get();
    }

    private Sort sortByIdAsc() {
        return new Sort(Sort.Direction.ASC, "id");
    }


}
