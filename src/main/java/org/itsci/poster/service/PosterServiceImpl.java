package org.itsci.poster.service;

import org.itsci.poster.dao.CategoryDao;
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
public class PosterServiceImpl implements PosterService {
    @Autowired
    private PosterDao posterDao;
    @Autowired
    private OwnerDao ownerDao;
    @Autowired
    private CategoryDao categoryDao;

    @Override
    @Transactional
    public List<Poster> getPosters() {
        return posterDao.getPosters();
    }

    @Override
    @Transactional
    public void savePoster(Poster poster) {
        Category category = categoryDao.getCategoryByCode(poster.getCategory().getCode());
        poster.setCategory(category);
        Owner owner = ownerDao.getOwnerByCode(poster.getOwners().getCode());
        poster.setOwners(owner);
        posterDao.savePoster(poster);
    }

    @Override
    @Transactional
    public Poster getPoster(int posterId) {
        return posterDao.getPoster(posterId);
    }

    @Override
    @Transactional
    public void deletePoster(int posterId) {
        posterDao.deletePoster(posterId);
    }

    @Override
    @Transactional
    public void updatePoster(Poster posterEntity, Poster poster) {
        posterEntity.fill(poster);
        savePoster(posterEntity);
    }

    @Override
    @Transactional
    public List<Poster> getPosterDoesNotHaveOwner(int id) {
        return posterDao.getPosterDoesNotHaveOwner(id);
    }


    @Override
    @Transactional
    public void addOwnerToPoster(int posterId, int ownerId) {
        Owner owner = ownerDao.getOwner(ownerId);
        Poster poster = posterDao.getPoster(posterId);
        posterDao.savePoster(poster);
    }
    @Override
    @Transactional
    public void removeOwnerFromPoster(int posterId, int ownerId) {
        Owner owner = ownerDao.getOwner(ownerId);
        Poster poster = posterDao.getPoster(posterId);
        posterDao.savePoster(poster);
    }

}
