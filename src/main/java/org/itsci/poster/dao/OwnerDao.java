package org.itsci.poster.dao;


import org.itsci.poster.model.Owner;

import java.util.List;

public interface OwnerDao {
    List<Owner> getOwner();
    void saveOwner(Owner owners);
    Owner getOwner(int id);
    void deleteOwner(int id);
    List<Owner> getOwnerDoesNotHavePoster(int id);
    Owner getOwnerByCode(String code);
}
