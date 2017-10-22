//
//  CadastrarViewController.swift
//  easyshop-PI2017
//
//  Created by uillian on 21/10/2017.
//  Copyright © 2017 uillian. All rights reserved.
//

import UIKit
import FirebaseAuth

class CadastrarViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var senha: UITextField!
    
    @IBOutlet weak var senhaConfirmacao: UITextField!
    
    
     // Exibir mensagem pro usuario
    
    func exibirMensagem(titulo: String, mensagem: String){
        
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert);
        
        let acaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil);
        
        alerta.addAction(acaoCancelar);
        
        present(alerta, animated: true, completion: nil)
        
        
    }
    
    
    
    
    @IBAction func criarConta(_ sender: Any) {
           
        
        //Recuperar dados;
            if let emailRecuperado = self.email.text{
                if let senhaRecuperado = self.senha.text{
                    if let senhaConfirmacaoR = self.senhaConfirmacao.text{
                
                        // validar senhas digitadas;
                        
                        if (senhaRecuperado == senhaConfirmacaoR){
                            
                            //print("Senha iguais podemos seguir")
                            
                            let autenticacao = Auth.auth();
                            
                            autenticacao.createUser(withEmail: emailRecuperado, password: senhaConfirmacaoR, completion: { (usuario, erro) in
                                
                                // verificacao de cadastro do faribase;
                                if erro == nil{
                                    
                                   // print("Sucesso ao cadastrar usuario");
                                    
                                    if usuario == nil{
                                        
                                        self.exibirMensagem(titulo: "Erro ao autenticar", mensagem: "Problemas ao autencicar, tente novamente");
                                        
                                        
                                    }else{
                                        
                                        //Redirecionar o usuario para tela principal;
                                        
                                        self.performSegue(withIdentifier: "cadastroSegue", sender: nil);
                                        
                                        
                                    }
                                    
                                }
                                
                                else{
                                    
                                    
                                    /*
                                     ERROR_INVALID_EMAIL
                                     ERROR_WEAK_PASSWORD
                                     ERROR_EMAIL_ALREADY_IN_USE
                                     */
                                    
                                    let erroRecuperado = erro! as NSError;
                                    //print(erroRecuperado.userInfo["error_name"]) //print qual tipo de erro nos log
                                    if let codigoErro = erroRecuperado.userInfo["error_name"]{
                                        
                                        let erroTexto = codigoErro as! String
                                        var mensagemErro = ""
                                        
                                        switch erroTexto{ // casos de erros que podem acontecer ao criar uma conta;
                                            
                                            case "ERROR_INVALID_EMAIL" :
                                                mensagemErro = "E-mail inválido, digite um e-mail válido!";
                                                break;
                                            case "ERROR_WEAK_PASSWORD" :
                                                mensagemErro = "Senha precisa ter no mínimo 6 caracteres com letras e números";
                                                break;
                                            case "ERROR_EMAIL_ALREADY_IN_USE":
                                            mensagemErro = "Esse e-mail já esta sendo utilizado! Crie sua conta com outro e-mail";
                                                break
                                            
                                        default: mensagemErro = "Dados digitados estão incorretos";
                                        }
                                        
                                        self.exibirMensagem(titulo: "Dados inválidos", mensagem: mensagemErro)
                                        
                                        
                                    }
                                    
                                    
                                    
                                    
                                } // fim de validacao do faribase;
                                
                                
                                
                                
                            })
                            
                        }else{
                            // mesagem da senha errada ao usuario final;
                            self.exibirMensagem(titulo: "Senha Inválida", mensagem: "As senhas não estão iguais, digite novamente")
                            
                        } // fim da validacao da senha;
                
                        }
            
                    }
            
            
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
