//
//  ProdutosViewController.swift
//  easyshop-PI2017
//
//  Created by uillian on 08/11/2017.
//  Copyright © 2017 uillian. All rights reserved.
//

import UIKit

class ProdutosViewController:UITableViewController {
    
    var mercadorias: [Produ] = []
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // LINHAS DA TABELAS DE PRODUTOS E SEUS VALORES RESPEQTIVOS
            
            var produto : Produ
        produto = Produ(titulo: "Veja", descricao: "R$ 3,00", imagem: #imageLiteral(resourceName: "produto1"))
            mercadorias.append( produto )
            
        produto = Produ(titulo: "Ajax", descricao: "R$ 4,99", imagem: #imageLiteral(resourceName: "produto2"))
            mercadorias.append( produto )
            
        produto = Produ(titulo: "Feijão Carioca", descricao: "R$ 6,00", imagem: #imageLiteral(resourceName: "produto3"))
            mercadorias.append( produto )
        
        produto = Produ(titulo: "Cookies", descricao: "R$ 3,40", imagem: #imageLiteral(resourceName: "produto4"))
            mercadorias.append( produto )
        
        produto = Produ(titulo: "Guaraná Zero", descricao: "R$ 3,60", imagem: #imageLiteral(resourceName: "produto5"))
        mercadorias.append( produto )
        
        
            
    }
    
    // FUNÇÃO PARA INICIALIZAR A TABELA;
    
        override func numberOfSections(in: UITableView) -> Int{
            
            return 1
            
        }
    
        // FUNÇÃO PARA CONTAR CADA LINHA DA TABELA
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return mercadorias.count
        }
    
    // FUNÇÃO PARA MONTAR A TABELA ;
    
        override func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let produtos: Produ = mercadorias[indexPath.row]
            let celulaReuso = "celulaReuso"
            
            let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! produtoCelula
            celula.produtoImageView.image = produtos.imagem
            celula.tituloLabel.text = produtos.titulo
            celula.precoLabel.text = produtos.descricao
            /* celula.textLabel?.text = filme.titulo
            celula.imageView?.image = filme.imagem */
            
            return celula
            
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detalheCarrinho"{
            
            if let indexPath = tableView.indexPathForSelectedRow{
                
                let produtoSelecionado = self.mercadorias[ indexPath.row ]
                let viewControllerDestino =  segue.destination as! CarrinhoViewController
                
                viewControllerDestino.carrinho = produtoSelecionado
            
            }
            
        }
        
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detalheCarrinho"{
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let produtoSelecionado = self.mercadorias [ indexPath.row ]
                let viewControlerDestino = segue.destination as! ProdutosViewController
                
                viewControlerDestino.mercadorias = [produtoSelecionado]
                
            }
            
            
        }
    }*/


    
    
    
    
}
