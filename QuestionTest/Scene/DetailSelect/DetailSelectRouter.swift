//
//  DetailSelectRouter.swift
//  QuestionTest
//
//  Created by Ricardo Gonzalez on 29/08/23.
//

import UIKit

class DetailSelectRouter {
    
    weak var viewController: UIViewController?
    var view:DashboardVC?
    
    // MARK: Static methods
    static func createModule(itemsSelect: [itemDashboard]) -> UIViewController {
        
        let viewController = DetailSelectVC.initWithNibName()
        let interactor = DetailSelectInteractor()
        let router = DetailSelectRouter()
        let presenter = DetailSelectPresenter()
        
        viewController.presenter = presenter
        viewController.items = itemsSelect
        presenter.router = router
        presenter.view = viewController
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return viewController
    }
    
}

extension DetailSelectRouter: PresenterToRouterDetailSelectProtocol  {
}
