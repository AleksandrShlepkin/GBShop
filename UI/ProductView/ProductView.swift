//
//  ProductView.swift
//  GBShop
//
//  Created by Mac on 16.04.2022.
//

import Foundation
import UIKit
import SnapKit

final class ProductView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    private(set) lazy var imageProduct: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 30.0
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private(set) lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.textColor = .black
        name.font = UIFont.boldSystemFont(ofSize: 25)
        return name
    }()
    
    private(set) lazy var priceLabel: UILabel = {
       let price = UILabel()
        price.textColor = .orange
        price.font = UIFont.boldSystemFont(ofSize: 20)
        return price
    }()
    
    private(set) lazy var shortDescription: UILabel = {
       let short = UILabel()
        short.textColor = .gray
        short.font = UIFont.boldSystemFont(ofSize: 20)
        return short
    }()
    
    private(set) lazy var descriptionLabel: UILabel = {
       let descript = UILabel()
        descript.textColor = .black
        descript.font = UIFont.boldSystemFont(ofSize: 20)
        descript.numberOfLines = 0
        return descript
    }()
    
    public func initialize() {
        self.addSubview(imageProduct)
        self.addSubview(nameLabel)
        self.addSubview(shortDescription)
        self.addSubview(priceLabel)
        self.addSubview(descriptionLabel)
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(shortDescription).inset(30)
            make.left.equalToSuperview().inset(30)
            make.right.equalToSuperview().inset(30)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel).inset(50)
            make.right.equalToSuperview().inset(20)
        }
        
        shortDescription.snp.makeConstraints { make in
            make.top.equalTo(priceLabel).inset(50)
            make.right.equalToSuperview().inset(20)
        }
        
        imageProduct.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.left.equalToSuperview().inset(20)
            make.height.equalTo(200)
            make.width.equalTo(300)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(400)
            make.right.equalToSuperview().inset(20)
        }

    }
    
}
