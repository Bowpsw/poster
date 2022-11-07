package org.itsci.poster.service;

import org.itsci.poster.model.Poster;

import java.util.List;

public interface PosterService {
    List<Poster> getPosters();
    public void savePoster(Poster poster);
    Poster getPoster(int posterId);
    void deletePoster(int posterId);

    void updatePoster(Poster posterEntity, Poster poster);

    List<Poster> getPosterDoesNotHaveOwner(int id);

    void addOwnerToPoster(int posterId, int ownerId);

    void removeOwnerFromPoster(int posterId, int ownerId);

}
