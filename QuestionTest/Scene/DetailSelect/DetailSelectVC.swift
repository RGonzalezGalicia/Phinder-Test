//
//  DetailSelectVC.swift
//  QuestionTest
//
//  Created by Ricardo Gonzalez on 29/08/23.
//
import UIKit

class DetailSelectVC: UIViewController {
    
    // MARK: - Lifecycle Methods
    
    @IBOutlet weak var tableView: UITableView!
    
    var items: [itemDashboard]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Second Call the services
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCellWith(identifier: CameraViewCell.identifier)
        tableView.registerCellWith(identifier: FotoViewCell.identifier)
        tableView.registerCellWith(identifier: NameViewCell.identifier)
        tableView.registerCellWith(identifier: PhoneViewCell.identifier)
        tableView.registerCellWith(identifier: birthDateViewCell.identifier)
        tableView.registerCellWith(identifier: sexViewCell.identifier)
        tableView.registerCellWith(identifier: favoriteColorViewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        
    }

    public static func initWithNibName() -> DetailSelectVC {
        let bundle = Bundle(for: DetailSelectVC.self)
        let newView = DetailSelectVC(nibName: "DetailSelectViewController", bundle: bundle)
        return newView
    }
    
    // MARK: - Properties
    var presenter: ViewToPresenterDetailSelectProtocol?
}

extension DetailSelectVC: PresenterToViewDetailSelectProtocol{
    // TODO: Implement View Output Methods
}
