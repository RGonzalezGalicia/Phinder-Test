//
//  AppDelegateBuilder.swift
//  QuestionTest
//
//  Created by Ricardo Gonzalez on 28/08/23.
//

import UIKit
import Foundation

class AppDelegateBuilder {
    
    var logic : AppDelegateLogic = AppDelegateLogic()
    
    func createRootScene() -> UIViewController {
        DashboardRouter.createModule()
        }
                
    }
