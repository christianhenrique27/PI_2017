package com.easyshop.easyshop.activitys.fragmentos;


import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.easyshop.easyshop.R;
import com.easyshop.easyshop.activitys.configuracao.ConfiguracaoFirebase;
import com.easyshop.easyshop.activitys.models.modelUsuario;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthInvalidCredentialsException;
import com.google.firebase.auth.FirebaseAuthInvalidUserException;


/**
 * A simple {@link Fragment} subclass.
 */
public class Logar extends Fragment {

    private TextView linkCadastrar;
    private EditText emailLogar;
    private EditText senhaLogar;
    private Button login;
    private modelUsuario usuario;
    private FirebaseAuth firebaseAuth;


    public Logar() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment

        View view = inflater.inflate(R.layout.fragment_logar, container, false);

        //Criando os ids dos componetes
        linkCadastrar = (TextView) view.findViewById(R.id.linkCadastrar);
        emailLogar = (EditText) view.findViewById(R.id.usuarioLogar);
        senhaLogar = (EditText) view.findViewById(R.id.senhaLogar);

        //verificarUsuarioLogado();

        //Ação do link Cadastrar
        linkCadastrar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                getActivity().
                        getSupportFragmentManager().
                        beginTransaction().
                        replace(R.id.frameLayout, new Cadastrar()).
                        commit();
            }
        });

        //Ação do botão Logar
        login = (Button) view.findViewById(R.id.login);

        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                //Pegando os dados dos EditTexts
                usuario = new modelUsuario();
                usuario.setEmail(emailLogar.getText().toString());
                usuario.setSenha(senhaLogar.getText().toString());

                if(emailLogar.getText().toString().isEmpty() ||
                        senhaLogar.getText().toString().isEmpty()){

                    Toast.makeText(getActivity(), "Campo(s) vazios!",Toast.LENGTH_LONG).show();

                }else{

                    validarLogin();
                    emailLogar.setText("");
                    senhaLogar.setText("");

                }

            }
        });

        return view;

    }

    private void validarLogin(){

        firebaseAuth = ConfiguracaoFirebase.getAutenticacao();
        firebaseAuth.signInWithEmailAndPassword(

                usuario.getEmail(),
                usuario.getSenha()

        ).addOnCompleteListener(new OnCompleteListener<AuthResult>() {
            @Override
            public void onComplete(@NonNull Task<AuthResult> task) {

                if(task.isSuccessful()){

                    Toast.makeText(getActivity(), "Login efetuado com sucesso!", Toast.LENGTH_LONG).show();

                }else{
                    String erroLogin = "";

                    try{

                        throw task.getException();

                    }catch (FirebaseAuthInvalidUserException e){
                        erroLogin = "E-mail não cadastrado!";
                        emailLogar.setText("");

                    }catch (FirebaseAuthInvalidCredentialsException e){
                        erroLogin = "Senha errada tente novamente!";
                        senhaLogar.setText("");

                    }catch (Exception e){
                        erroLogin = "Ao logar!";
                        e.printStackTrace();
                        emailLogar.setText("");
                        senhaLogar.setText("");
                    }

                    Toast.makeText(getActivity(), "Erro: " + erroLogin, Toast.LENGTH_LONG).show();
                    Log.e("Signup Error", "onCancelled", task.getException());
                }

            }
        });

    }

    /*private void verificarUsuarioLogado(){

        firebaseAuth = ConfiguracaoFirebase.getAutenticacao();

        if(firebaseAuth.getCurrentUser() != null){

            Intent intent = new Intent(getActivity(), Ofertas.class);
            startActivity(intent);

        }

    }*/

}
