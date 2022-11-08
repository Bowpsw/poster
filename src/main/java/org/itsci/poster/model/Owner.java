package org.itsci.poster.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.util.List;

@Entity
@Table(name = "owners")
public class Owner {
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @GenericGenerator(name = "increment", strategy = "increment")
    int id;

    @NotNull
    @Pattern(regexp="^ON[0-9]{3}")
    @Column(name = "code", length = 10, nullable = false, unique = true)
    private String code;

    @NotNull
    @Column(name = "name")
    private String name;

    @NotNull
    @Pattern(regexp="^08||09||06[0-9]{8}")
    @Column(name = "phone")
    private String phone;

//    @NotNull
//    @Column(name = "owner")
//    private String owner;
//    @NotNull
//    @Column(name = "latitude")
//    private String latitude;
//    @NotNull
//    @Column(name = "longitude")
//    private String longitude;
//    @NotNull
//    @Column(name = "address")
//    private String address;

    public void fill(Owner owner) {
        this.code = owner.getCode();
        this.name = owner.getName();
        this.phone = owner.getPhone();
//        this.owner = owner.getOwner();
//        this.latitude = owner.getLatitude();
//        this.longitude = owner.getLongitude();
//        this.address = owner.getAddress();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

//        return owner;
//    }
//
//    public void setOwner(String owner) {
//        this.owner = owner;
//    }
//
//    public String getLatitude() {
//        return latitude;
//    }
//
//    public void setLatitude(String latitude) {
//        this.latitude = latitude;
//    }

//    public String getLongitude() {
//        return longitude;
//    }
//
//    public void setLongitude(String longitude) {
//        this.longitude = longitude;
//    }
//
//    public String getAddress() {
//        return address;
//    }
//
//    public void setAddress(String address) {
//        this.address = address;
//    }

}
