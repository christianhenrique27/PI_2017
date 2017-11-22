//
//  ProdutoNaoLogadoTableViewController.swift
//  easyshop-PI2017
//
//  Created by uillian on 21/11/2017.
//  Copyright © 2017 uillian. All rights reserved.
//

import UIKit

class ProdutoNaoLogadoTableViewController: UITableViewController {

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
        
        produto = Produ(titulo: "Açucar Refinado União", descricao: "R$ 2,70", imagem: #imageLiteral(resourceName: "acucar refinado"))
        mercadorias.append( produto )
        
        produto = Produ(titulo: "Bolacha (Água e Sal)", descricao: "R$ 4,60", imagem: #imageLiteral(resourceName: "Agua e sal"))
        mercadorias.append( produto )
        
        produto = Produ(titulo: "Arroz", descricao: "R$ 12,20", imagem: #imageLiteral(resourceName: "arroz"))
        mercadorias.append( produto )
        
        produto = Produ(titulo: "Ruffles 280g", descricao: "R$ 8,20", imagem: #imageLiteral(resourceName: "batata"))
        mercadorias.append( produto )
        
        produto = Produ(titulo: "Bombril", descricao: "R$ 1,73", imagem: #imageLiteral(resourceName: "bombril"))
        mercadorias.append( produto )
        
        produto = Produ(titulo: "Café", descricao: "R$ 5,55", imagem: #imageLiteral(resourceName: "café"))
        mercadorias.append( produto )
        
        produto = Produ(titulo: "Cerveja Brahma", descricao: "R$ 2,80", imagem: #imageLiteral(resourceName: "cerveja Brahma"))
        mercadorias.append( produto )
        
        produto = Produ(titulo: "Cerveja Skol", descricao: "R$ 2,64", imagem: #imageLiteral(resourceName: "cerveja skol"))
        mercadorias.append( produto )
        
        produto = Produ(titulo: "Coca Cola 2L", descricao: "R$ 5,90", imagem: #imageLiteral(resourceName: "coca 2L"))
        mercadorias.append( produto )
        
        produto = Produ(titulo: "Pinho Sol", descricao: "R$ 8,80", imagem: #imageLiteral(resourceName: "desinfetante"))
        mercadorias.append( produto )
        
        produto = Produ(titulo: "Bombom Garoto", descricao: "R$ 8,10", imagem: #imageLiteral(resourceName: "garoto"))
        mercadorias.append( produto )
        
        produto = Produ(titulo: "Iorgute", descricao: "R$ 2,60", imagem: #imageLiteral(resourceName: "iorgute"))
        mercadorias.append( produto )
        
        produto = Produ(titulo: "Leite Cemil", descricao: "R$ 2,10", imagem: #imageLiteral(resourceName: "leite cemil"))
        mercadorias.append( produto )
        
        produto = Produ(titulo: "Leite Condensado", descricao: "R$ 3,50", imagem: #imageLiteral(resourceName: "leite condensado"))
        mercadorias.append( produto )
        
        produto = Produ(titulo: "Óleo de Soja", descricao: "R$ 3,70", imagem: #imageLiteral(resourceName: "oleo soja"))
        mercadorias.append( produto )
        
        produto = Produ(titulo: "Papel Higiênico", descricao: "R$ 2,40", imagem: #imageLiteral(resourceName: "papel higienico"))
        mercadorias.append( produto )
        
        produto = Produ(titulo: "Sabão OMO 400g", descricao: "R$ 7,60", imagem: #imageLiteral(resourceName: "sabao omo"))
        mercadorias.append( produto )
        
        produto = Produ(titulo: "Shampoo", descricao: "R$ 6,20", imagem: #imageLiteral(resourceName: "shampoo"))
        mercadorias.append( produto )
        
        produto = Produ(titulo: "Suco Del Valle", descricao: "R$ 4,60", imagem: #imageLiteral(resourceName: "suco del valle"))
        mercadorias.append( produto )
        
        produto = Produ(titulo: "Suco Tang", descricao: "R$ 0,89", imagem: #imageLiteral(resourceName: "suco tang"))
        mercadorias.append( produto )
        
        produto = Produ(titulo: "Toddy", descricao: "R$ 8,30", imagem: #imageLiteral(resourceName: "toddy"))
        mercadorias.append( produto )
        
        produto = Produ(titulo: "Vinagre", descricao: "R$ 3,20", imagem: #imageLiteral(resourceName: "vinagre"))
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
        
        let alerta = UIAlertController(title: "Alerta", message: "Você precisa estar logado para realizar suas compras", preferredStyle: .alert)
        
        let confirmarAlerta = UIAlertAction(title: "Confirmar", style: .default, handler: nil)
        
        alerta.addAction(confirmarAlerta)
        
        present(alerta, animated: true, completion: nil)
        
        }
        
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

    
    
    
    
    
    
    
    

