//
//  HomeTableViewCell.swift
//  GBShop
//
//  Created by Mac on 07.04.2022.
//

import UIKit
import SDWebImage

class CatalogProductsTableViewCell: UITableViewCell {
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func config(for goods: ProductViewModel) {
        self.nameLabel.text = goods.name
        self.priceLabel.text = "\(goods.price)тыс. рублей"
        self.shortDescriptionLabel.text = goods.shortDescription
        self.mainImage.sd_setImage(with: URL(string: goods.url), placeholderImage: UIImage())
        self.descriptionLabel.text = goods.description
    }
    
}
