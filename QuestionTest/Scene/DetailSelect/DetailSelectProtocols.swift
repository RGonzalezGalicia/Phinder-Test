//
//  DetailSelectProtocols.swift
//  QuestionTest
//
//  Created by Ricardo Gonzalez on 29/08/23.
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewDetailSelectProtocol: AnyObject {
    var presenter: ViewToPresenterDetailSelectProtocol? { get set}
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterDetailSelectProtocol: AnyObject {
    var view: PresenterToViewDetailSelectProtocol? { get set }
    var interactor: PresenterToInteractorDetailSelectProtocol? { get set }
    var router: PresenterToRouterDetailSelectProtocol? { get set }
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorDetailSelectProtocol: AnyObject {
    var presenter: InteractorToPresenterDetailSelectProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterDetailSelectProtocol: AnyObject {
    
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterDetailSelectProtocol {

}
