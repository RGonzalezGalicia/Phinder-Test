//
//  Tableview+Addons.swift
//  QuestionTest
//
//  Created by Ricardo Gonzalez on 28/08/23.
//

import Foundation
import UIKit

extension UITableView {
    
    func registerCellWith(identifier: String) {
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }

}


extension UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
}
