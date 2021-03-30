
package DAO;

import java.util.List;
import pojo.Teatre;
import pojo.Actori;

public interface ActoriDao {
    public void adaugaActori (Actori actor);
    public List<Actori> afiseazaActori();
    public void modificaActori (int idactor, Teatre teatru, String nume, String prenume, int salariu);
    public void stergeActor (Actori actor);
}

    
