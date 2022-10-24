//
//  MainController.swift
//  AssessmentApp
//
//  Created by Irfan Saeed on 19/01/2022.
//

import UIKit

#warning("""
The initial viewcontroller should show the shopping basket.
It should contain a 'Plus' button for adding new items to the basket.
It should contain a 'Clear' button for removing all items in the basket.
""")
protocol MainDisplayLogic {
    func reloadTabel()
}

class MainViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            setUpTableView()
        }
    }
    // MARK: vars
    var router: MainRouterProtocol?
    var interactor: MainBusinessLogic?
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.getList()
    }
    
    
    // MARK: Functions
    func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "ProductCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ProductCell")
    }
}

// MARK: extensions
// MARK: TableView Delegate and DataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor?.getCount() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell")
               as? ProductCell else { return UITableViewCell() }
        
        interactor?.configureCell(cell: cell, for: indexPath.row)
        cell.addClosure = { [weak self] in
            guard let self else { return }
            self.interactor?.addToCurt(row: indexPath.row)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.routeToDetails(row: indexPath.row)
    }
}
extension MainViewController: MainDisplayLogic {
    func reloadTabel() {
        tableView.reloadData()
    }


}
