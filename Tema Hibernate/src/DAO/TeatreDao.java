
package DAO;

import java.util.List;
import pojo.Teatre;
import pojo.Orase;

public interface TeatreDao {
    public void adaugaTeatre (Teatre teatru);
    public List<Teatre> afiseazaTeatre();
    public void modificaTeatre (Integer idteatru, Orase oras, String nume, String adresa, int capacitate);
    public void stergeTeatru (Teatre teatru);
}

    
