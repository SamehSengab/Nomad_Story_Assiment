//
//  MainControllerRouter.swift
//  AssessmentApp
//
//  Created by Sameh Sengab on 21/10/2022.
//

import Foundation
import UIKit
protocol MainRouterProtocol {
    func routeToDetails(row: Int)
}

protocol MainDataPassing {
    var dataStore: MainDataStore? { get }
}

class MainRouter {
    weak var viewController: MainViewController?
    var dataStore: MainDataStore?
    init(viewController: MainViewController?) {
        self.viewController = viewController
    }
}

extension MainRouter: MainRouterProtocol {
    func routeToDetails(row: Int) {
        guard let model = dataStore?.detailsModel?[row] else { return }
        let view = MainConfigrator.detailsProduct(model: .init(model: model))
        viewController?.navigationController?.pushViewController(view, animated: true)
    }
}

extension MainRouter: MainDataPassing {
}
