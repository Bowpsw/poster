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
    @Pattern(regexp="^SH[0-9]{3}")
    @Column(name = "code", length = 10, nullable = false, unique = true)
    private String code;

    @NotNull
    @Column(name = "name")
    private String name;

    @Pattern(regexp="^0[1-9]{9}")
    @NotNull
    @Column(name = "phone")
    private int phone;

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

    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinTable(name = "poster_owner", joinColumns = {@JoinColumn(name = "owner_id")}, inverseJoinColumns = {@JoinColumn(name = "poster_id")})
    private List<Poster> posters;

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

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }
    //    public String getOwner() {
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

    public List<Poster> getPosters() {
        return posters;
    }

    public void setPosters(List<Poster> posters) {
        this.posters = posters;
    }

}
