package com.bolsadeideas.springboot.backend.apirest.models.services;

import com.bolsadeideas.springboot.backend.apirest.models.dao.IClientDao;
import com.bolsadeideas.springboot.backend.apirest.models.dao.IShopDao;
import com.bolsadeideas.springboot.backend.apirest.models.entity.ClientEntity;
import com.bolsadeideas.springboot.backend.apirest.models.entity.ShopEntity;
import com.bolsadeideas.springboot.backend.apirest.models.services.intefaces.IClientService;
import com.bolsadeideas.springboot.backend.apirest.models.services.intefaces.IShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ShopServiceImpl implements IShopService {

    @Autowired
    IShopDao iShopDao;



    private Sort sortByIdAsc() {
        return new Sort(Sort.Direction.ASC, "id");
    }


    @Override
    public List<ShopEntity> findAll() {
        return List.of();
    }

    @Override
    public ShopEntity save(ShopEntity clientEntity) {
        return null;
    }

    @Override
    public ShopEntity findOne(Long id) {
        if(iShopDao.findById(id).isPresent()){
            return  iShopDao.findById(id).get();
        }
        return new ShopEntity();
    }

    @Override
    public ShopEntity findByEmailAndPasswor(String email, String password) {
        if ( this.iShopDao.findByEmailAndPasswor(email,password) == null){
            ShopEntity shopEntity = new ShopEntity();
            shopEntity.setId(0L);
            return  shopEntity;
        }
        return this.iShopDao.findByEmailAndPasswor(email,password);
    }
}
