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

class CarrinhoViewController: UIViewController{
    
    @IBOutlet weak var produtoImagemView: UIImageView!
    
    @IBOutlet weak var produtoTituloView: UILabel!
    
    @IBOutlet weak var produtoPrecoView: UILabel!
    

    @IBAction func finalizarCompra(_ sender: Any) {
    
       //Configurar bancos de dados;
        
        let database = Database.database().reference();
        
        let produtos = database.child("Produtos")
        
        let dadosUsuarios = [
            
            "Nome Produto" : self.produtoTituloView.text,
            "Preco Produto": self.produtoPrecoView.text]
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
