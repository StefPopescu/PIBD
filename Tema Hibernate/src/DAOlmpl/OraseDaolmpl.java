
package DAOlmpl;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Orase;
import DAO.OraseDao;

public class OraseDaolmpl implements OraseDao{

    @Override
	public void modificaOrase(int idoras, String nume) {
    	Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Orase detaliiOrase = (Orase) session.load(Orase.class, idoras);
        detaliiOrase.setNume(nume);        
        session.update(detaliiOrase);
        transaction.commit();
        session.close();	
	}

	@Override
	public void stergeOras(Orase oras) {
		Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(oras);
        transaction.commit();
        session.close();	
	}
	
	@Override
	public void adaugaOrase(Orase oras) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(oras);
        transaction.commit();
        session.close();
    }
	
	@Override
    public List<Orase> afiseazaOrase() {
        List<Orase> listaOrase = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        org.hibernate.Query query = session.createQuery("From Orase");
        listaOrase = query.list();
        return listaOrase;
    }

}
