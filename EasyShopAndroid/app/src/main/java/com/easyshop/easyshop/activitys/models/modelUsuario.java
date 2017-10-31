package com.easyshop.easyshop.activitys.models;

import android.graphics.DashPathEffect;

import com.easyshop.easyshop.activitys.configuracao.ConfiguracaoFirebase;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.Exclude;

/**
 * Created by Lupy on 21/10/2017.
 */

public class modelUsuario {
    private String id;
    private String email;
    private String senha;
    private String nome;
    private String telefone;
    private String endereco;

    public modelUsuario(){

    }

    public void Salvar(){
        DatabaseReference databaseReference = ConfiguracaoFirebase.getReferencia();
        databaseReference.child("Usuários").child(getId()).setValue(this);
    }

    @Exclude
    public String getId(){return id;}

    public void setId(String id) {this.id = id;}

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Exclude
    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }
}
