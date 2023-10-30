package com.example.example.DataBase;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
public class ActivityLogs {
    @Id
    @GeneratedValue (strategy = GenerationType.AUTO)
    private int ID_Log;
    private LocalDateTime tarih;
    private String personel;
    private String Operasyonu;


    public int getID_Log() {
        return ID_Log;
    }

    public void setID_Log(int ID_Log) {
        this.ID_Log = ID_Log;
    }

    public LocalDateTime getTarih() {
        return tarih;
    }

    public void setTarih(LocalDateTime tarih) {
        this.tarih = tarih;
    }

    public String getPersonel() {
        return personel;
    }

    public void setPersonel(String personel) {
        this.personel = personel;
    }

    public String getOperasyonu() {
        return Operasyonu;
    }

    public void setOperasyonu(String operasyonu) {
        Operasyonu = operasyonu;
    }
}
