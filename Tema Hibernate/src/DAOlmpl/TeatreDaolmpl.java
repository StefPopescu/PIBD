
package DAOlmpl;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Teatre;
import DAO.TeatreDao;
import pojo.Orase;


public class TeatreDaolmpl implements TeatreDao{

    @Override
	public void modificaTeatre(Integer idteatru, Orase oras, String nume, String adresa, int capacitate) {
    	Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Teatre detaliiTeatre;
        detaliiTeatre = (Teatre) session.load(Teatre.class, idteatru);
        detaliiTeatre.setOrase(oras);
        detaliiTeatre.setNume(nume);
        detaliiTeatre.setAdresa(adresa);
        detaliiTeatre.setCapacitate(capacitate);
        session.update(detaliiTeatre);
        transaction.commit();
        session.close();	
	}

	@Override
	public void stergeTeatru(Teatre teatru) {
		Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(teatru);
        transaction.commit();
        session.close();	
	}
	@Override
	public void adaugaTeatre(Teatre teatru) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(teatru);
        transaction.commit();
        session.close();
    }
	@Override
    public List<Teatre> afiseazaTeatre() {
        List<Teatre> listaTeatre = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        org.hibernate.Query query = session.createQuery("From Teatre");
        listaTeatre = query.list();
        return listaTeatre;
    }


}
