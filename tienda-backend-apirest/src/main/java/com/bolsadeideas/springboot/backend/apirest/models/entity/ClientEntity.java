package com.bolsadeideas.springboot.backend.apirest.models.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "client")
public class ClientEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Long idShop;
    private String name;
    private String phone;
    private String address;
    private double oweMoney;
    private double totalPurchased;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getOweMoney() {
        return oweMoney;
    }

    public void setOweMoney(double oweMoney) {
        this.oweMoney = oweMoney;
    }

    public double getTotalPurchased() {
        return totalPurchased;
    }

    public void setTotalPurchased(double totalPurchased) {
        this.totalPurchased = totalPurchased;
    }

    public Long getIdShop() {
        return idShop;
    }

    public void setIdShop(Long idShop) {
        this.idShop = idShop;
    }

    @Override
    public String toString() {
        return "ClientEntity{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", oweMoney=" + oweMoney +
                ", totalPurchased=" + totalPurchased +
                '}';
    }
}
