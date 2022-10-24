//
//  MainControllerPresenter.swift
//  AssessmentApp
//
//  Created by Sameh Sengab on 21/10/2022.
//

import Foundation

protocol MainPresentionLogic {
  
    func productfetchedScuuflly()
}

class MainPresenter {
    var view: MainDisplayLogic?
    init(view: MainDisplayLogic ) {
        self.view = view
    }
}
extension MainPresenter: MainPresentionLogic {
    
    func productfetchedScuuflly() {
        view?.reloadTabel()
    }


}
