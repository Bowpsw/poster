package org.itsci.poster.dao;

import org.itsci.poster.model.Poster;

import java.util.List;

public interface PosterDao {
   List<Poster> getPosters();
   void savePoster(Poster poster);
   Poster getPoster(int id);
   void deletePoster(int id);
   List<Poster> getPosterDoesNotHaveOwner(int id);
}
