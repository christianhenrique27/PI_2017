//
//  MaisViewController.swift
//  easyshop-PI2017
//
//  Created by uillian on 21/10/2017.
//  Copyright © 2017 uillian. All rights reserved.
//

import UIKit
import FirebaseAuth

class MaisViewController: UIViewController {
   
   
    @IBAction func deslogarUsuario(_ sender: Any) {
        
        let autenticacao = Auth.auth();
        
        // Sair do usuario se ele estiver logado;
        
        do {
            try autenticacao.signOut()
            
            dismiss(animated: true, completion: nil)
            
        } catch {
            print("Erro ao deslogar o usuario");
        }
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    //Esconder o teclado
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
