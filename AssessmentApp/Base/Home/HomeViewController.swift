//
//  HomeViewController.swift
//  AssessmentApp
//
//  Created by Sameh Sengab on 22/10/2022.
//

import Foundation
import UIKit

protocol HomeDisplayLogic {
    func reloadTabel()
}
class HomeViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            setUpTableView()
        }
    }
    // MARK: vars
    var productsList: [Product] = []
    var router: HomeRouterProtocol?
    var interactor: HomeInteractorProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    // MARK: Functions
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getProducts()
        totalPriceLabel.text = getTotal()
        tableView.reloadData()
    
    }
    func getProducts() {
        do {
            let products = try context.fetch(Product.fetchRequest())
            productsList = products
            tableView.reloadData()
        } catch {
            print(error)
        }
        tableView.reloadData()
    }
    
    func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "ProductCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ProductCell")
    }
    
    @IBAction func addAction(_ sender: Any) {
        router?.goToAdd()
    }
    
    func getTotal() -> String {
        var total = 0.0
        for price in productsList {
            total += price.price
        }
        return "\(total)"
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell")
                as? ProductCell else { return UITableViewCell() }
        var index = indexPath.row
        cell.productImage.load(urlString: productsList[index].image ?? "")
        cell.titileLabel.text = productsList[index].name
        
        return cell
    }
}
extension HomeViewController: HomeDisplayLogic {
    func reloadTabel() {
        tableView.reloadData()
    }
    
    
}
