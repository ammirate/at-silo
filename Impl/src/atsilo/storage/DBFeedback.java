package atsilo.storage;

import atsilo.entity.Feedback;

public class DBFeedback extends DBBeans {
    Tabella tabella;
    
    public DBFeedback(){
        tabella= new Tabella("Feedback");
        super(tabella);
    }}