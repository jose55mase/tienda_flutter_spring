package com.bolsadeideas.springboot.backend.apirest.controllers;

import com.bolsadeideas.springboot.backend.apirest.models.entity.ClientEntity;
import com.bolsadeideas.springboot.backend.apirest.models.services.intefaces.IClientService;
import com.bolsadeideas.springboot.backend.apirest.models.services.intefaces.IProductService;
import com.bolsadeideas.springboot.backend.apirest.utils.RestResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;


@CrossOrigin(origins = { "*" })
//@CrossOrigin(origins = { "http://localhost:4200" })
@RestController
@RequestMapping("/api/client")
public class ClientController {

    @Autowired IClientService iClientService;

    @GetMapping("/findAll/{idShop}")
    public RestResponse getAll(@PathVariable Long idShop) {
        return new RestResponse(HttpStatus.OK.value(),
                "Operacion completada con exito",this.iClientService.findAll(idShop));
    }

    @PostMapping("/edit")
    public RestResponse edit(@RequestBody ClientEntity clientEntity) {
        return new RestResponse(HttpStatus.OK.value(),
                "Operacion completada con exito", this.iClientService.save(clientEntity));
    }

    @PostMapping("/create")
    public RestResponse create(@RequestBody ClientEntity clientEntity) {
        return new RestResponse(HttpStatus.OK.value(),
                "Operacion completada con exito", this.iClientService.save(clientEntity));
    }


}
