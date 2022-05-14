//
//  ProductViewController.swift
//  GBShop
//
//  Created by Mac on 16.04.2022.
//

import UIKit
import SnapKit
import SDWebImage

class ProductViewController: UIViewController {
    
    var goods: [CatalogViewModel]?
    
    private let commentView = CommentsCollectionView()

    private let tableView = UITableView()
    private var productDetail: ProductView {
        return self.view as! ProductView
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        self.view.backgroundColor = .white
    }
    
    
    override func loadView() {
        self.view = ProductView()
    }
    
    func config() {
        self.productDetail.nameLabel.text = goods?[0].name
        self.productDetail.imageProduct.sd_setImage(with: URL(string: goods?[0].url ?? ""))
        self.productDetail.shortDescription.text = goods?[0].shortDescription
        self.productDetail.priceLabel.text = "\(goods?[0].price ?? 0)"
        self.productDetail.descriptionLabel.text = goods?[0].description
        
        self.view.addSubview(commentView)
        commentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        commentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        commentView.topAnchor.constraint(equalTo: productDetail.descriptionLabel.bottomAnchor, constant: 10).isActive = true
        commentView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
      

        }
    }
    

    


