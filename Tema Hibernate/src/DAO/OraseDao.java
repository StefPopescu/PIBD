
package DAO;

import java.util.List;
import pojo.Orase;

public interface OraseDao {
    public void adaugaOrase (Orase oras);
    public List<Orase> afiseazaOrase();
    public void modificaOrase (int idoras, String nume);
    public void stergeOras (Orase oras);
}

    
