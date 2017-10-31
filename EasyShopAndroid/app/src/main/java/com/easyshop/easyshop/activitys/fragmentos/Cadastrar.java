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
import android.widget.Toast;

import com.easyshop.easyshop.R;
import com.easyshop.easyshop.activitys.configuracao.ConfiguracaoFirebase;
import com.easyshop.easyshop.activitys.models.modelUsuario;
import com.github.rtoshiro.util.format.SimpleMaskFormatter;
import com.github.rtoshiro.util.format.text.MaskTextWatcher;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthInvalidCredentialsException;
import com.google.firebase.auth.FirebaseAuthUserCollisionException;
import com.google.firebase.auth.FirebaseAuthWeakPasswordException;
import com.google.firebase.auth.FirebaseUser;


/**
 * A simple {@link Fragment} subclass.
 */
public class Cadastrar extends Fragment {

    private EditText email;
    private EditText senhaCadastrar;
    private EditText nome;
    private EditText telefone;
    private EditText endereco;
    private Button cadastrar;
    private FirebaseAuth firebaseAuth;
    private modelUsuario usuario;



    public Cadastrar() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View view = inflater.inflate(R.layout.fragment_cadastrar, container, false);

        //Criando os ids dos componetes
        email = (EditText) view.findViewById(R.id.usuarioCadastrar);
        senhaCadastrar = (EditText) view.findViewById(R.id.senhaCadastrar);
        nome = (EditText) view.findViewById(R.id.nome);
        telefone = (EditText) view.findViewById(R.id.telefone);
        endereco = (EditText) view.findViewById(R.id.endereco);
        cadastrar = (Button) view.findViewById(R.id.cadastrar);

        //Criando as mascaras para os campos de entrada
        SimpleMaskFormatter simpleMaskNumero = new SimpleMaskFormatter("(NN)NNNNN-NNNN");
        MaskTextWatcher maskTextNumero = new MaskTextWatcher(telefone, simpleMaskNumero);

        telefone.addTextChangedListener(maskTextNumero);

        //Ação do botao Cadastrar
        cadastrar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                //Pegando os dados dos EditTexts
                usuario = new modelUsuario();

                usuario.setEmail(email.getText().toString());
                usuario.setSenha(senhaCadastrar.getText().toString());
                usuario.setNome(nome.getText().toString());
                usuario.setTelefone(telefone.getText().toString());
                usuario.setEndereco(endereco.getText().toString());

                if(nome.getText().toString().isEmpty()
                        || telefone.getText().toString().isEmpty()
                        || endereco.getText().toString().isEmpty()){

                    Toast.makeText(getActivity(), "Campo(s) vazios!",Toast.LENGTH_LONG).show();

                }else{

                    cadastrarUsuario();

                }

            }
        });

        return view;
    }

    private void cadastrarUsuario(){

    firebaseAuth = ConfiguracaoFirebase.getAutenticacao();

    firebaseAuth.createUserWithEmailAndPassword(
            usuario.getEmail(),
            usuario.getSenha()

        ).addOnCompleteListener(getActivity(), new OnCompleteListener<AuthResult>() {
        @Override
        public void onComplete(@NonNull Task<AuthResult> task) {

            if(task.isSuccessful()){

                Toast.makeText(getActivity(), "Conta cadastrada com sucesso!",Toast.LENGTH_LONG).show();
                Toast.makeText(getActivity(), "Você ja está logado!",Toast.LENGTH_SHORT).show();

                FirebaseUser firebaseUser = task.getResult().getUser();
                usuario.setId(firebaseUser.getUid());

                usuario.Salvar();

                email.setText("");
                senhaCadastrar.setText("");
                nome.setText("");
                telefone.setText("");
                endereco.setText("");

            }else{
                String erroCadastrar = "";

                try{

                    throw task.getException();

                }catch(FirebaseAuthWeakPasswordException e){
                    erroCadastrar = "Digite uma senha mais forte, contendo caracteres e com letras e números!";
                    senhaCadastrar.setText("");

                }catch(FirebaseAuthInvalidCredentialsException e){
                    erroCadastrar = "O e-mail digitado é inválido, digite um novo e-mail!";
                    email.setText("");

                }catch (FirebaseAuthUserCollisionException e){
                    erroCadastrar = "Essse e-mail já está em uso no App!";
                    email.setText("");

                }catch (Exception e){
                    erroCadastrar = "Ao cadastrar!";
                    e.printStackTrace();
                    email.setText("");
                    senhaCadastrar.setText("");
                }

                Toast.makeText(getActivity(), "Erro: " + erroCadastrar,Toast.LENGTH_LONG).show();
                Log.e("Signup Error", "onCancelled", task.getException());
            }

        }
    });

    }

}
