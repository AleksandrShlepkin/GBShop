//
//  CommentsCollectionView.swift
//  GBShop
//
//  Created by Mac on 17.04.2022.
//

import UIKit

class CommentsCollectionView: UICollectionView {
    
    
    private let tableView = UITableView()
    let apiService = APIServiceComments()
    var comments: APIServiceComments? {
        didSet {
            comments?.getComments(productID: 444, complition: {
                [weak self] in
                self?.tableView.reloadData()
            })
        }
    }

    init() {
       let layout = UICollectionViewFlowLayout()
       layout.scrollDirection = .horizontal
       super.init(frame: .zero, collectionViewLayout: layout)
       
       backgroundColor = #colorLiteral(red: 0.9589126706, green: 0.9690223336, blue: 0.9815708995, alpha: 1)
       delegate = self
       dataSource = self
       register(CommentsView.self, forCellWithReuseIdentifier: CommentsView.reuseID)
       
       translatesAutoresizingMaskIntoConstraints = false
       layout.minimumLineSpacing = Constants.galleryMinimumLineSpacing
       contentInset = UIEdgeInsets(top: 0, left: Constants.leftDistanceToView, bottom: 0, right: Constants.rightDistanceToView)
       
       showsHorizontalScrollIndicator = false
       showsVerticalScrollIndicator = false
   }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.galleryItemWidth, height: frame.height * 0.8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension CommentsCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let page = comments?.comment else { return 0 }
        switch page {
        case .done(let commentsArray):
            print(commentsArray)
            return commentsArray.count
        case .fail(let error):
            print(error)
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: CommentsView.reuseID, for: indexPath) as! CommentsView
        let comments = comments?.comment
        switch comments {
        case .done(let comments):
            cell.config(for: comments[indexPath.row])
        case .fail(let error):
            print(error)
        case .none:
            break
            
        }
        return cell
    }
    
    
}
