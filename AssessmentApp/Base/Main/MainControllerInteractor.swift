//
//  MainControllerInteractor.swift
//  AssessmentApp
//
//  Created by Sameh Sengab on 21/10/2022.
//

import Foundation
protocol MainBusinessLogic {
    func getList()
    func configureCell(cell: ProductCellProtocol, for indexPath: Int)
    func getCount() -> Int
    func addToCurt(row: Int)
}

protocol MainDataStore {
    var detailsModel: [ProductDataModel]? { get }
}
 
class MainInteractor {
    var detailsModel: [ProductDataModel]?
    let url = URL(string: "https://run.mocky.io/v3/4e23865c-b464-4259-83a3-061aaee400ba")
    var productsArrar: [ProductDataModel] = []
    let network: NetworkApiProtocol?
    let presenter: MainPresentionLogic?
    init(presenter: MainPresentionLogic, network: NetworkApiProtocol?) {
        self.network = network
        self.presenter = presenter
    }
}
extension MainInteractor: MainBusinessLogic {
    
    func addToCurt(row: Int) {
        print(row)

        let newItems = Product(context: context)
        newItems.name = productsArrar[row].name
        newItems.image = productsArrar[row].imageURL
       // newItems.productID = productsArrar[row].id
        newItems.price = productsArrar[row].retailPrice ?? 0.0
        do {
            try context.save()
            print("saved")
        } catch {
            print(error)
        }
    }
    
    func configureCell(cell: ProductCellProtocol, for indexPath: Int) {
        let model: ProductViewModel = .init(model: productsArrar[indexPath])
        cell.displayData(model: model)
    }
    func getList() {
        network?.request(url: url, expecting: ModelKay.self, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.productsArrar.append(contentsOf: [data.model1, data.model2, data.model3, data.model4, data.model5])
                self.detailsModel = self.productsArrar
                DispatchQueue.main.async {
                    self.presenter?.productfetchedScuuflly()
                }
            case .failure(let error):
                print(error)
            }
        })
    }
    func getCount() -> Int {
        return productsArrar.count
    }
    
    
}
extension MainInteractor: MainDataStore {
}
    

