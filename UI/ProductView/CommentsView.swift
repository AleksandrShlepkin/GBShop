//
//  CommentsView.swift
//  GBShop
//
//  Created by Mac on 17.04.2022.
//

import Foundation
import UIKit
import SnapKit

final class CommentsView: UICollectionViewCell {
    
    static let reuseID = "CommentsView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        initialize()
        initTwo()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        initialize()
        initTwo()
    }
    
    private(set) lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.textColor = .black
        name.font = UIFont.boldSystemFont(ofSize: 25)
        return name
    }()
    
    private(set) lazy var idLabel: UILabel = {
       let id = UILabel()
        id.textColor = .lightGray
        id.font = UIFont.boldSystemFont(ofSize: 15)
        return id
    }()
    
    private(set) lazy var commentLabel: UILabel = {
       let com = UILabel()
        com.textColor = .black
        com.font = UIFont.boldSystemFont(ofSize: 20)
        com.numberOfLines = 0
        return com
    }()
    
    func initTwo() {
        self.addSubview(nameLabel)
        self.addSubview(idLabel)
        self.addSubview(commentLabel)
        

        
        // nameLabel constraints
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        // smallDescriptionLabel constraints
        commentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        commentLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        commentLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2, constant: 10).isActive = true
        
        // likeImageView constraints

        
        // costLabel constraints
        idLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    
    }
    
    func initialize() {
        self.addSubview(nameLabel)
        self.addSubview(idLabel)
        self.addSubview(commentLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.left.equalToSuperview().inset(20)
        }
        idLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel).inset(10)
            make.left.equalToSuperview().inset(20)
        }
        commentLabel.snp.makeConstraints { make in
            make.top.equalTo(idLabel).inset(10)
            make.left.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(20)
        }
        
    }
    
    func configTwo() {
        self.nameLabel.text = "Hello world"
        self.idLabel.text = "Hello"
        self.commentLabel.text = "Hello world"
    }
    
    func config(for comment: CommentsViewModel) {
        self.nameLabel.text = comment.name
        self.idLabel.text = "\(comment.id)"
        self.commentLabel.text = comment.comment
    }
    
  
    
}

struct Constants {
    static let leftDistanceToView: CGFloat = 40
    static let rightDistanceToView: CGFloat = 40
    static let galleryMinimumLineSpacing: CGFloat = 10
    static let galleryItemWidth = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.galleryMinimumLineSpacing / 2)) / 2
}
