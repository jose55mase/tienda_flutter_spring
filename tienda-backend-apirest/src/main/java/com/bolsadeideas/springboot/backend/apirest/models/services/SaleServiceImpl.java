package com.bolsadeideas.springboot.backend.apirest.models.services;

import com.bolsadeideas.springboot.backend.apirest.models.dao.IProductDao;
import com.bolsadeideas.springboot.backend.apirest.models.dao.ISaleDao;
import com.bolsadeideas.springboot.backend.apirest.models.entity.SaleEntity;
import com.bolsadeideas.springboot.backend.apirest.models.services.intefaces.ISaleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;


@Service
public class SaleServiceImpl implements ISaleService {

    @Autowired ISaleDao iSaleDao;
    @Autowired IProductDao iProductDao;


    @Override
    public List<SaleEntity> findAll(Long idShop) {

        return this.iSaleDao.findTop25ByIdShopOrderByIdDesc(idShop);
    }

    @Override
    public SaleEntity save(SaleEntity saleEntity) {
        return this.iSaleDao.save(saleEntity);
    }

    @Override
    public SaleEntity findOne(Long id) {
        return this.iSaleDao.findById(id).get();
    }

    @Override
    public List<SaleEntity> saveAll(List<SaleEntity> saleEntities) {
        return (List<SaleEntity>) this.iSaleDao.saveAll(saleEntities);
    }

    @Override
    public List<SaleEntity> filter(String status, String nameClient, String date, String dateFinal) {

        List<SaleEntity> response = new ArrayList<>();

        //Filter by Date
        if (!date.trim().equalsIgnoreCase("empty")
                & !dateFinal.trim().equalsIgnoreCase("empty")
                & status.trim().equalsIgnoreCase("empty")
                & nameClient.trim().equalsIgnoreCase("empty")){
            response = (List<SaleEntity>) this.iSaleDao.findByDateBetween(date, dateFinal);
        }

        //Filter by status
        if (date.trim().equalsIgnoreCase("empty")
                & dateFinal.trim().equalsIgnoreCase("empty")
                & !status.trim().equalsIgnoreCase("empty")
                & nameClient.trim().equalsIgnoreCase("empty")){
            boolean search = status.trim().equalsIgnoreCase("PAGO") ? true : false;
            response = (List<SaleEntity>) this.iSaleDao.findByPay(search);

        }

        //Filter by nameClient
        if (date.trim().equalsIgnoreCase("empty")
                & dateFinal.trim().equalsIgnoreCase("empty")
                & status.trim().equalsIgnoreCase("empty")
                & !nameClient.trim().equalsIgnoreCase("empty")){
            String search = nameClient.trim().equalsIgnoreCase("SIN CLIENTE") ? "" : nameClient.trim();
            response = (List<SaleEntity>) this.iSaleDao.findByClientName(search);
        }

        //Filter by status and nameClient
        if (date.trim().equalsIgnoreCase("empty")
                & dateFinal.trim().equalsIgnoreCase("empty")
                & !status.trim().equalsIgnoreCase("empty")
                & !nameClient.trim().equalsIgnoreCase("empty")){
            boolean search = status.trim().equalsIgnoreCase("PAGO") ? true : false;
            String searchTwo = nameClient.trim().equalsIgnoreCase("SIN CLIENTE") ? "" : nameClient.trim();
            response = (List<SaleEntity>) this.iSaleDao.findByPayAndClientName(search,searchTwo);
        }

        //Filter by status, nameClient and date
       if (!date.trim().equalsIgnoreCase("empty")
                & !dateFinal.trim().equalsIgnoreCase("empty")
                & !status.trim().equalsIgnoreCase("empty")
                & !nameClient.trim().equalsIgnoreCase("empty")){
           boolean search = status.trim().equalsIgnoreCase("PAGO") ? true : false;
           String searchTwo = nameClient.trim().equalsIgnoreCase("SIN CLIENTE") ? "" : nameClient.trim();
           response = (List<SaleEntity>) this.iSaleDao.findByDateBetween(date, dateFinal);
           response = response.stream()
                   .filter((item)->item.getClientName().equalsIgnoreCase(searchTwo))
                   .filter((item)->item.getPay() == search).collect(Collectors.toList());

        }
        return response;
    }

    @Override
    public List<SaleEntity> findByClientId(Integer clientId) {
        return this.iSaleDao.findByClientId(clientId);
    }
}
