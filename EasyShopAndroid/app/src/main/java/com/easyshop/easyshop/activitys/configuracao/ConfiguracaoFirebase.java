package com.easyshop.easyshop.activitys.configuracao;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

/**
 * Created by Lupy on 21/10/2017.
 */

public final class ConfiguracaoFirebase {

    private static DatabaseReference databaseReference;
    private static FirebaseAuth firebaseAuth;

    public static DatabaseReference getReferencia(){

        if(databaseReference == null){

            databaseReference = FirebaseDatabase.getInstance().getReference();

        }

        return databaseReference;
    }

    public static FirebaseAuth getAutenticacao(){

        if (firebaseAuth == null){

            firebaseAuth = FirebaseAuth.getInstance();

        }

        return firebaseAuth;
    }

}
