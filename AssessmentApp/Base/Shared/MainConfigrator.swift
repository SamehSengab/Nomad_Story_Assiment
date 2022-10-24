//
//  MainConfigrator.swift
//  AssessmentApp
//
//  Created by Sameh Sengab on 21/10/2022.
//

import Foundation
import UIKit

enum MainConfigrator {
    static func mainView() -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter(view: view)
        let network = NetworkApi()
        let interactor = MainInteractor(presenter: presenter, network: network)
        let router = MainRouter(viewController: view)
        view.router = router
        router.dataStore = interactor
        view.interactor = interactor
        return view
    }
    static func detailsProduct(model: DetailsViewModel) -> UIViewController {
        let view = DetailsViewController(viewModel: model)
        let router = DetailsRouter(view: view)
        view.router = router
        return view
    }
    static func homeView() -> UIViewController {
        let view = HomeViewController()
        let router = HomeRouter(viewcontroller: view)
        let presenter = HomePresenter(view: view)
        let interactor = HomeInteractor(presenter: presenter)
        view.interactor = interactor 
        view.router = router
        
        return view
    }
}
