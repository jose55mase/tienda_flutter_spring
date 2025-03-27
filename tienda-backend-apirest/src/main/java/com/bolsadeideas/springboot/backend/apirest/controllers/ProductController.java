package com.bolsadeideas.springboot.backend.apirest.controllers;

import com.bolsadeideas.springboot.backend.apirest.models.entity.ProductEntity;
import com.bolsadeideas.springboot.backend.apirest.models.entity.UserEntity;
import com.bolsadeideas.springboot.backend.apirest.models.services.intefaces.IProductService;
import com.bolsadeideas.springboot.backend.apirest.utils.RestResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@CrossOrigin(origins = { "*" })
//@CrossOrigin(origins = { "http://localhost:4200" })
@RestController
@RequestMapping("/api/product")
public class ProductController {

    @Autowired
    IProductService iProductService;

    @GetMapping("/findAll/{idShop}")
    public RestResponse getAll(@PathVariable Long idShop) {
        return new RestResponse(HttpStatus.OK.value(),
                "Operacion completada con exito",this.iProductService.findAll(idShop));
    }

    @GetMapping("/findAllBySame/{search}/{idShop}")
    public RestResponse findAllBySame(@PathVariable String search, @PathVariable Long idShop) {

        return new RestResponse(HttpStatus.OK.value(),
                "Operacion completada con exito",this.iProductService.findAll(idShop)
                .stream()
                .filter((item)-> item.getName().trim().toLowerCase().contains(search.trim().toLowerCase())));
    }

    @PostMapping("/edit")
    public RestResponse edit(@RequestBody ProductEntity productEntity) {
        return new RestResponse(HttpStatus.OK.value(),
                "Operacion completada con exito", this.iProductService.save(productEntity));
    }

    @PostMapping("/create")
    public RestResponse create(@RequestBody ProductEntity productEntity) {
        return new RestResponse(HttpStatus.OK.value(),
                "Operacion completada con exito", this.iProductService.save(productEntity));
    }

    @GetMapping("/findBarCode/{search}/{idShop}")
    public RestResponse findBarCode(@PathVariable String search, @PathVariable Long idShop) {

        List<ProductEntity> list = this.iProductService.findAll(idShop)
                .stream()
                .filter((i) -> i.getBarCode() != null)
                .filter( (item) -> item.getBarCode().equalsIgnoreCase(search.trim().toLowerCase()) ).collect(Collectors.toList());

        return new RestResponse(HttpStatus.OK.value(),
                "Operacion completada con exito",list);
    }
}
