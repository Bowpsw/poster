package org.itsci.poster.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.itsci.poster.model.Poster;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PosterDaoImpl implements PosterDao {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Poster> getPosters() {
        Session session = sessionFactory.getCurrentSession();
        Query<Poster> query = session.createQuery("from Poster",
                Poster.class);
        List<Poster> posters = query.getResultList();
        return posters;
    }

    @Override
    public void savePoster(Poster poster) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(poster);
    }
    @Override
    public Poster getPoster(int posterId) {
        Session session = sessionFactory.getCurrentSession();
        Poster poster = session.get(Poster.class, posterId);
        return poster;
    }
    @Override
    public void deletePoster(int posterId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("delete from Poster where id=:posterId");
        query.setParameter("posterId", posterId);
        query.executeUpdate();
    }

    @Override
    public List<Poster> getPosterDoesNotHaveOwner(int id) {
        Session session = sessionFactory.getCurrentSession();
        Query<Poster> query = session.createQuery("select s.posters from Owner s where s.id=:id");
        query.setParameter("id", id);
        List<Poster> posterowner = query.getResultList();
        query = session.createQuery("from Poster");
        List<Poster> allowners = query.getResultList();
        allowners.removeAll(posterowner);
        return allowners;
    }
}
