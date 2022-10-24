//
//  DetailController.swift
//  AssessmentApp
//
//  Created by Irfan Saeed on 19/01/2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descreptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    var router: DetailsRouterProtocol?
    var viewModel: DetailsViewModel?
    init(viewModel: DetailsViewModel?) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
    }
    func setUpData() {
        guard let price = viewModel?.costPrice else { return }
        productImage.load(urlString: viewModel?.imageURL ?? "")
        priceLabel.text = String(describing: price)
        titleLabel.text = viewModel?.name
        descreptionLabel.text = viewModel?.descreption
    }
}
