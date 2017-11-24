//
//  CarrinhoViewController.swift
//  easyshop-PI2017
//
//  Created by uillian on 14/11/2017.
//  Copyright © 2017 uillian. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseAuth

class CarrinhoViewController: UIViewController{
    
    @IBOutlet weak var produtoImagemView: UIImageView!
    
    @IBOutlet weak var produtoTituloView: UILabel!
    
    @IBOutlet weak var produtoPrecoView: UILabel!
    

    @IBAction func finalizarCompra(_ sender: Any) {
        
        
       // msg de alerta assim que o cliente finaliza a compra
        
        let alerta = UIAlertController(title: "Dados enviados com Sucesso", message: "Compra finalizada com sucesso.", preferredStyle: .alert)
        
        let confirmarAlerta = UIAlertAction(title: "Confirmar", style: .default) { (acao) in
            print("Botão Confirmar Precionado!")
        }
        
        alerta.addAction(confirmarAlerta)
        present(alerta, animated: true, completion: nil)
    
       //Configurar bancos de dados;
        
        let database = Database.database().reference();
        
        let produtos = database.child("Produtos")
        
        let nomeProduto = self.produtoTituloView.text!
        let precoProduto = self.produtoPrecoView.text!
        
        let dadosUsuarios = [
            
            "Nome Produto" : nomeProduto,
            "Preco Produto": precoProduto]
                                                            as [String : Any]
        
        
        
        //Salvar dados
        
        produtos.childByAutoId().setValue(dadosUsuarios)
        
        
        
    }
    
    var carrinho : Produ!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        produtoImagemView.image = carrinho.imagem
        produtoTituloView.text =  carrinho.titulo
        produtoPrecoView.text = carrinho.descricao
        
    
    
    
}
}
