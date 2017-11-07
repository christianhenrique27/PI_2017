//
//  EntrarViewController.swift
//  easyshop-PI2017
//
//  Created by uillian on 21/10/2017.
//  Copyright © 2017 uillian. All rights reserved.
//

import UIKit
import FirebaseAuth

class EntrarViewController: UIViewController {
    
    @IBOutlet weak var entrarEmail: UITextField!
    @IBOutlet weak var entrarSenha: UITextField!
    
    @IBAction func entrar(_ sender: Any) {
        
        // recuperar dados Digitados;
        
        if let emailRecuperado = self.entrarEmail.text{
            if let senhaRecuperado = self.entrarSenha.text{
                
                // autenticar usuarios no firebase;
                
                let autenticacao = Auth.auth();
                autenticacao.signIn(withEmail: emailRecuperado, password: senhaRecuperado, completion: { (usuario, erro) in
                    
                    if erro == nil{
                        
                        if usuario == nil{
                            
                            self.exibirMensagem(titulo: "Erro ao autenticar", mensagem: "Problemas ao fazer a autenticação, tente novamente!")
                        }else{
                            
                           // self.exibirMensagem(titulo: "Sucesso", mensagem: "O usuário foi logado com sucesso!");
                            
                            //Redirecionar o usuario para tela principal;
                            
                            self.performSegue(withIdentifier: "loginAutomaticoSegue", sender: nil)
                            
                        }
                        
                        
                    }else{
                        
                        // mesagem de verificação do usuario do login;
                        self.exibirMensagem(titulo: "Dados inválido", mensagem: "Favor verificar os dados digitatos e tente novamente!");
                        
                    }
                    
                })
                
            }
        
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // Exibir mensagem pro usuario
    
    func exibirMensagem(titulo: String, mensagem: String){
        
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert);
        
        let acaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil);
        
        alerta.addAction(acaoCancelar);
        
        present(alerta, animated: true, completion: nil)
        
        
    }
    
    //Esconder o Teclado;
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
