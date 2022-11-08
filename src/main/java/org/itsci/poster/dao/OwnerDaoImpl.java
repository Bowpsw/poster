package org.itsci.poster.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.itsci.poster.model.Category;
import org.itsci.poster.model.Owner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OwnerDaoImpl implements OwnerDao {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Owner> getOwner() {
        Session session = sessionFactory.getCurrentSession();
        Query<Owner> query = session.createQuery("from Owner",
                Owner.class);
        List<Owner> owners = query.getResultList();
        return owners;
    }

    @Override
    public void saveOwner(Owner owner) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(owner);
    }
    @Override
    public Owner getOwner(int ownerId) {
        Session session = sessionFactory.getCurrentSession();
        Owner owner = session.get(Owner.class, ownerId);
        return owner;
    }
    @Override
    public void deleteOwner(int ownerId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("delete from Owner where id=:ownerId");
        query.setParameter("ownerId", ownerId);
        query.executeUpdate();
    }

    @Override
    public List<Owner> getOwnerDoesNotHavePoster(int id) {
        Session session = sessionFactory.getCurrentSession();
        Query<Owner> query = session.createQuery("select p.owners from Poster p where p.id=:id");
        query.setParameter("id", id);
        List<Owner> posterowner = query.getResultList();
        query = session.createQuery("from Owner");
        List<Owner> allowners = query.getResultList();
        allowners.removeAll(posterowner);
        return allowners;
    }

    @Override
    public Owner getOwnerByCode(String code) {
        Session session = sessionFactory.getCurrentSession();
        Query<Owner> query = session.createQuery("from Owner where code=:code", Owner.class);
        query.setParameter("code", code);
        Owner owner = query.getSingleResult();
        return owner;
    }
}
