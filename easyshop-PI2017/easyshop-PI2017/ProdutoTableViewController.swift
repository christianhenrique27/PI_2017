//
//  ProdutoTableViewController.swift
//  easyshop-PI2017
//
//  Created by uillian on 08/11/2017.
//  Copyright © 2017 uillian. All rights reserved.
//

import UIKit

class ProdutoTableViewController: UITableViewController {

    
    
    
    var filmes: [Filme] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        var filme : Filme
        filme = Filme(titulo: "filme 1", descricao: "filme 1")
        filmes.append( filme )
        
        filme = Filme(titulo: "filme 2", descricao: "filme 2")
        filmes.append( filme )
        
        filme = Filme(titulo: "filme 3", descricao: "filme 3")
        filmes.append( filme )
        
        
    }
    
    override func numberOfSections(in: UITableView) -> Int{
        
        return 1
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmes.count
    }
    
    override func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let filme: Filme = filmes [indexPath.row]
        let celulaReuso = "celulaReuso"
        
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        celula.textLabel?.text = filme.titulo
        
        return celula
        
    }
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


  


}
