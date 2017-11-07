//
//  ViewController.swift
//  easyshop-PI2017
//
//  Created by uillian on 20/10/2017.
//  Copyright © 2017 uillian. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
       /* Sair do usuario se ele estiver logado;
        
        do {
            try autenticacao.signOut()
        } catch {
            print("Erro ao deslogar o usuario");
        } */
        
        let autenticacao = Auth.auth()
        
        // Verificar se o usuario esta logado;
        autenticacao.addStateDidChangeListener { (autenticacao, usuario) in
            
            if let usuarioLogado = usuario{
                
                self.performSegue(withIdentifier: "loginTelaPrincipal", sender: nil)
                
            }
        }
        
        
      //  let pontuacao = firebase.child("Usuários")
        //pontuacao.removeValue(); // Para remover os nos abaixos
        //CRIAÇÃO DE NOS
        
        //pontuacao.child("001").child("Nome").setValue("Uillian");
        //pontuacao.child("002").child("Nome").setValue("Kevem")
        //pontuacao.child("003").child("Nome").setValue("Andressa");
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

