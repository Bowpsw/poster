package org.itsci.poster.service;

import org.itsci.poster.dao.PosterDao;
import org.itsci.poster.dao.OwnerDao;
import org.itsci.poster.model.Category;
import org.itsci.poster.model.Poster;
import org.itsci.poster.model.Owner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class OwnerServiceImpl implements OwnerService {
    @Autowired
    private OwnerDao ownerDao;

    @Autowired
    private PosterDao posterDao;

    @Override
    @Transactional
    public List<Owner> getOwners() {
        return ownerDao.getOwner();
    }

    @Override
    @Transactional
    public void saveOwner(Owner owner) {
        ownerDao.saveOwner(owner);
    }
    @Override
    @Transactional
    public Owner getOwner(int ownerId) {
        return ownerDao.getOwner(ownerId);
    }
    @Override
    @Transactional
    public void deleteOwner(int ownerId) {
        ownerDao.deleteOwner(ownerId);
    }

    @Override
    @Transactional
    public void updateOwner(Owner ownerEntity, Owner owner) {
        ownerEntity.fill(owner);
        ownerDao.saveOwner(ownerEntity);
    }

    @Override
    @Transactional
    public List<Owner> getOwnerDoesNotHavePoster(int id) {
        return ownerDao.getOwnerDoesNotHavePoster(id);
    }

    @Override
    @Transactional
    public void addPosterToOwner(int ownerId, int posterId) {
        Poster poster = posterDao.getPoster(posterId);
        Owner owner = ownerDao.getOwner(ownerId);

        ownerDao.saveOwner(owner);
    }

    @Override
    @Transactional
    public Owner getOwnerByCode(String code) {
        return ownerDao.getOwnerByCode(code);
    }
    @Override
    @Transactional
    public void removePosterFromOwner(int ownerId, int posterId) {
        Poster poster = posterDao.getPoster(posterId);
        Owner owner = ownerDao.getOwner(ownerId);
        ownerDao.saveOwner(owner);
    }
}
