package com.bolsadeideas.springboot.backend.apirest.controllers;

import com.bolsadeideas.springboot.backend.apirest.models.entity.ProductEntity;
import com.bolsadeideas.springboot.backend.apirest.models.entity.SaleEntity;
import com.bolsadeideas.springboot.backend.apirest.models.services.intefaces.IProductService;
import com.bolsadeideas.springboot.backend.apirest.models.services.intefaces.ISaleService;
import com.bolsadeideas.springboot.backend.apirest.utils.RestResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@CrossOrigin(origins = { "*" })
//@CrossOrigin(origins = { "http://localhost:4200" })
@RestController
@RequestMapping("/api/sale")
public class SaleController {

    @Autowired
    ISaleService iSaleService;

    @GetMapping("/findAll/{idShop}")
    public RestResponse getAll(@PathVariable Long idShop) {
        return new RestResponse(HttpStatus.OK.value(),
                "Operacion completada con exito",this.iSaleService.findAll(idShop));
    }

    @GetMapping("/findByClientId/{clientId}")
    public RestResponse getAll(@PathVariable Integer clientId) {
        return new RestResponse(HttpStatus.OK.value(),
                "Operacion completada con exito",this.iSaleService.findByClientId(clientId));
    }

    @PostMapping("/create")
    public RestResponse create(@RequestBody SaleEntity saleEntity) {
        return new RestResponse(HttpStatus.OK.value(),
                "Operacion completada con exito", this.iSaleService.save(saleEntity));
    }

    @PostMapping("/createAll")
    public RestResponse createAll(@RequestBody List<SaleEntity> saleEntity) {
        return new RestResponse(HttpStatus.OK.value(),
                "Operacion completada con exito", this.iSaleService.saveAll(saleEntity));
    }

    @PostMapping("/filter/{status}/{nameClient}/{filterDate}/{filterDateFinal}")
    public RestResponse filter(@PathVariable String status, @PathVariable String nameClient,
                               @PathVariable String filterDate, @PathVariable String filterDateFinal) {
        return new RestResponse(HttpStatus.OK.value(),
                "Operacion completada con exito", this.iSaleService.filter(status, nameClient, filterDate, filterDateFinal));
    }

}
