//
//  DetailSelectPresenter.swift
//  QuestionTest
//
//  Created by Ricardo Gonzalez on 29/08/23.
//

import UIKit

class DetailSelectPresenter: ViewToPresenterDetailSelectProtocol {
    var itemSelect: String?
    

    // MARK: Properties
    weak var view: PresenterToViewDetailSelectProtocol?
    var interactor: PresenterToInteractorDetailSelectProtocol?
    var router: PresenterToRouterDetailSelectProtocol?
}

extension DetailSelectPresenter: InteractorToPresenterDetailSelectProtocol {
}
