package atsilo.storage;

import java.util.ArrayList;

public interface ManagerDB {
    public ManagerDB();

    public String getNomeTabella();

    public void setNomeTabella(String newNome);

    public ArrayList<String> getTipoColonne(ArrayList<String> nomeAttributi);

    public boolean insert(ArrayList<String> valori);

    public ArrayList<String> select();

    public boolean update(ArrayList<String> valori, ArrayList<String> campi);
}
