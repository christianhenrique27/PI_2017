package com.easyshop.easyshop.activitys;

import android.os.Bundle;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.MenuItem;
import android.widget.TextView;
import android.widget.Toast;

import com.easyshop.easyshop.R;
import com.easyshop.easyshop.activitys.configuracao.ConfiguracaoFirebase;
import com.easyshop.easyshop.activitys.fragmentos.Cadastrar;
import com.easyshop.easyshop.activitys.fragmentos.Carrinho;
import com.easyshop.easyshop.activitys.fragmentos.Logar;
import com.easyshop.easyshop.activitys.fragmentos.Ofertas;
import com.easyshop.easyshop.activitys.fragmentos.Produtos;
import com.google.firebase.auth.FirebaseAuth;

public class Home extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener {

    private FirebaseAuth firebaseAuth;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        getSupportFragmentManager().
                beginTransaction().
                add(R.id.frameLayout, new Logar()).
                commit();

        /*FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });*/

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.setDrawerListener(toggle);
        toggle.syncState();

        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);
    }

    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else {
            super.onBackPressed();
        }
    }

    /*@Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.home, menu);
        return true;
    }*/

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        // Handle navigation view item clicks here.
        int id = item.getItemId();

        if (id == R.id.login) {

            getSupportFragmentManager() .
                    beginTransaction() .
                    replace(R.id.frameLayout, new Logar()).
                    commit();

        } else if (id == R.id.cadastro) {

            getSupportFragmentManager() .
                    beginTransaction() .
                    replace(R.id.frameLayout, new Cadastrar()).
                    commit();

        } else if (id == R.id.carrinho) {

            getSupportFragmentManager() .
                    beginTransaction() .
                    replace(R.id.frameLayout, new Carrinho()).
                    commit();

        } else if (id == R.id.produtos) {

            getSupportFragmentManager() .
                    beginTransaction() .
                    replace(R.id.frameLayout, new Produtos()).
                    commit();

        } else if (id == R.id.ofertas) {

            getSupportFragmentManager() .
                    beginTransaction() .
                    replace(R.id.frameLayout, new Ofertas()).
                    commit();

        } else if (id == R.id.deslogar) {

            verificarUsuarioLogado();

        }

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }

    private void verificarUsuarioLogado(){

        firebaseAuth = ConfiguracaoFirebase.getAutenticacao();

        if(firebaseAuth.getCurrentUser() != null){

            firebaseAuth = ConfiguracaoFirebase.getAutenticacao();
            firebaseAuth.signOut();

            Toast.makeText(Home.this, "Conta deslogada com sucesso!", Toast.LENGTH_LONG).show();

        }else{

            Toast.makeText(Home.this, "Você ainda não está logado!", Toast.LENGTH_LONG).show();

        }

    }

}
