//
//  DetailsRouter.swift
//  AssessmentApp
//
//  Created by Sameh Sengab on 22/10/2022.
//

import Foundation
import UIKit
protocol DetailsRouterProtocol {
    func backToMain()
}

class DetailsRouter {
    weak var view: DetailsViewController?
    init(view: DetailsViewController?) {
        self.view = view
    }
}

extension DetailsRouter: DetailsRouterProtocol {
    func backToMain() {
        view?.navigationController?.popViewController(animated: true)
    }
}
