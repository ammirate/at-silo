package atsilo.entity;

public class Classe {
    private String id;
    
    private Registro registro;

    Classe() {
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setRegistro(Registro registro) {
        this.registro = registro;
    }

    public Registro getRegistro() {
        return registro;
    }
}
