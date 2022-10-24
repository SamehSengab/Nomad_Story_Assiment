//
//  HomePresenter.swift
//  AssessmentApp
//
//  Created by Sameh Sengab on 22/10/2022.
//

import Foundation
protocol HomePresentionLogic {
    func productfetchedScuuflly()
}
class HomePresenter {
    var view: HomeDisplayLogic?
    init(view: HomeDisplayLogic ) {
        self.view = view
    }
}
extension HomePresenter: HomePresentionLogic {
    func productfetchedScuuflly() {
        view?.reloadTabel()
    }
}
