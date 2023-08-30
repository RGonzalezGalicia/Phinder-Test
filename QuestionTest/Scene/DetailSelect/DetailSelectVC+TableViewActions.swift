//
//  DetailSelectVC+TableViewActions.swift
//  QuestionTest
//
//  Created by Ricardo Gonzalez on 29/08/23.
//

import Foundation
import UIKit

extension DetailSelectVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch items?[indexPath.row].title {
        case "Camara":
            return 120
        case "Foto":
            return 240
       /* case 2:
            return 40
        case 3:
            return 40
        case 4:
            return 40
        case 5:
            return 40
        case 6:
            return 40*/
        default:
            return 60
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch items?[indexPath.row].title{
        case "Camara":
            if let cell = tableView.dequeueReusableCell(withIdentifier: CameraViewCell.identifier, for: indexPath) as? CameraViewCell {
                cell.viewController = self
                return cell
            }
        case "Foto":
            if let cell = tableView.dequeueReusableCell(withIdentifier: FotoViewCell.identifier, for: indexPath) as? FotoViewCell {
                return cell
            }
        case "Nombre Completo":
            if let cell = tableView.dequeueReusableCell(withIdentifier: NameViewCell.identifier, for: indexPath) as? NameViewCell {
                return cell
            }
        case "Numero Telefonico":
            if let cell = tableView.dequeueReusableCell(withIdentifier: PhoneViewCell.identifier, for: indexPath) as? PhoneViewCell {
                return cell
            }
        case "Fecha de nacimiento":
            if let cell = tableView.dequeueReusableCell(withIdentifier: birthDateViewCell.identifier, for: indexPath) as? birthDateViewCell {
                return cell
            }
        case "Sexo":
            if let cell = tableView.dequeueReusableCell(withIdentifier: sexViewCell.identifier, for: indexPath) as? sexViewCell {
                return cell
            }
        case "Color Favorito":
            if let cell = tableView.dequeueReusableCell(withIdentifier: favoriteColorViewCell.identifier, for: indexPath) as? favoriteColorViewCell {
                return cell
            }
        default:
            return UITableViewCell()
            
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //debugPrint(indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

