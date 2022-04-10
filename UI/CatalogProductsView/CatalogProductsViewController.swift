//
//  HomeViewController.swift
//  GBShop
//
//  Created by Mac on 01.04.2022.
//

import Foundation
import UIKit


class CatalogProductsViewController: UIViewController {
    
    let apiService = APIServiceProduct()
    var catalog: APIServiceProduct? {
        didSet {
            catalog?.getCatalog(categoryId: 123, pageNumber: 6, complition: { [weak self] in
                self?.homeTableView.reloadData()
            })
        }
    }
    
    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.register(UINib(nibName: "CatalogProductsTableViewCell", bundle: nil), forCellReuseIdentifier: "CatalogProductsTableViewCell")
        
        catalog = APIServiceProduct()
        
    }
    
}

extension CatalogProductsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let page = catalog?.product else { return 0 }
        switch page {
        case .done(let pageArray):
            return pageArray.count
        case .fail:
            print("Error in numberOfRowsSection")
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(withIdentifier: "CatalogProductsTableViewCell", for: indexPath) as! CatalogProductsTableViewCell
        let goods = catalog?.product
        
        switch goods {
        case .done(let catalog):
            cell.config(for: catalog[indexPath.row])
        case .fail:
            print("Error in cellForRowAt")
        case .none:
            break
        }
        
        return cell
    }
    
}
