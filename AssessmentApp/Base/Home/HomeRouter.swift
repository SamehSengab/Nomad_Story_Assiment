//
//  HomeRouter.swift
//  AssessmentApp
//
//  Created by Sameh Sengab on 22/10/2022.
//

import Foundation
import UIKit
protocol HomeRouterProtocol {
    func goToAdd()
}

class HomeRouter {
    weak var viewcontroller: HomeViewController?
    init(viewcontroller: HomeViewController?) {
        self.viewcontroller = viewcontroller
    }
}
extension HomeRouter: HomeRouterProtocol{
    func goToAdd() {
        let view = MainConfigrator.mainView()
        viewcontroller?.navigationController?.pushViewController(view, animated: true)
    }
    
    
    
}
