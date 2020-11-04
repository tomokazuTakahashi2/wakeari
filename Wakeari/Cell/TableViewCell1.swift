//
//  TableViewCell1.swift
//  Wakeari
//
//  Created by Raphael on 2020/11/03.
//  Copyright © 2020 Raphael. All rights reserved.
//

import UIKit

class TableViewCell1: UITableViewCell {

    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemImaegView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var shopUrlButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setData(_ itemData: items) {
    
        self.itemNameLabel.text = itemData.Item.itemName
        //self.itemImaegView.image = UIImage(url: itemData.Item.mediumImageUrls)
        self.priceLabel.text = String("¥\(itemData.Item.itemPrice)")
        self.shopUrlButton.setTitle(itemData.Item.shopName, for: .normal)
    
    }
}
//String→UIImage
extension UIImage {
    public convenience init(url: String) {
        let url = URL(string: url)
        do {
            let data = try Data(contentsOf: url!)
            self.init(data: data)!
            return
        } catch let err {
            print("Error : \(err.localizedDescription)")
        }
        self.init()
    }
}
