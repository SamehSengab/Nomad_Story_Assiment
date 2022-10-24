//
//  HomeInteractor.swift
//  AssessmentApp
//
//  Created by Sameh Sengab on 22/10/2022.
//

import Foundation
protocol HomeInteractorProtocol {
}

class HomeInteractor {
    var detailsModel: [ProductDataModel]?
    let presenter: HomePresentionLogic?
    init(presenter: HomePresentionLogic) {
        self.presenter = presenter
    }
}
extension HomeInteractor: HomeInteractorProtocol {
}
