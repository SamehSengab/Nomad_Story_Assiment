//
//  ProductCell.swift
//  AssessmentApp
//
//  Created by Sameh Sengab on 21/10/2022.
//

import UIKit
typealias Closure = (()->())
protocol ProductCellProtocol {
    func displayData(model: ProductViewModel)
}

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titileLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var productImage: UIImageView!
    var addClosure: Closure?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpUI()
    }
    func setUpUI() {
        containerView.layer.cornerRadius = 8
        productImage.layer.cornerRadius = 8
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func addAction(_ sender: Any) {
        addClosure?()
    }
}

extension ProductCell: ProductCellProtocol {
    func displayData(model: ProductViewModel) {
        titileLabel.text = model.name
        productImage.load(urlString: model.imageURL)
    }
}
