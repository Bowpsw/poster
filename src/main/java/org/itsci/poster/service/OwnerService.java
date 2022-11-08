package org.itsci.poster.service;

import org.itsci.poster.model.Category;
import org.itsci.poster.model.Owner;

import java.util.List;

public interface OwnerService {
    List<Owner> getOwners();
    public void saveOwner(Owner owner);
    Owner getOwner(int ownerId);
    void deleteOwner(int ownerId);
    void updateOwner(Owner ownerEntity, Owner owner);

    List<Owner> getOwnerDoesNotHavePoster(int id);
    void addPosterToOwner(int ownerId, int posterId);

    Owner getOwnerByCode(String code);

    void removePosterFromOwner(int ownerId, int posterId);
}
