
package DAOlmpl;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Actori;
import DAO.ActoriDao;
import pojo.Teatre;


public class ActoriDaolmpl implements ActoriDao{
	
	 @Override
    public void adaugaActori(Actori actor) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(actor);
        transaction.commit();
        session.close();
    }
    @Override
    public List<Actori> afiseazaActori() {
        List<Actori> listaActori = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        org.hibernate.Query query = session.createQuery("From Actori");
        listaActori = query.list();
        return listaActori;
    }

    @Override
	public void stergeActor(Actori actor) {
    	Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(actor);
        transaction.commit();
        session.close();
		
	}

    @Override
	public void modificaActori (int idactor, Teatre teatru, String nume, String prenume, int salariu) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Actori detaliiActori;
        detaliiActori = (Actori) session.load(Actori.class, idactor);
        detaliiActori.setTeatre(teatru);
        detaliiActori.setNume(nume);
        detaliiActori.setPrenume(prenume);
        detaliiActori.setSalariu(salariu);
        session.update(detaliiActori);
        transaction.commit();
        session.close();
    }


}
