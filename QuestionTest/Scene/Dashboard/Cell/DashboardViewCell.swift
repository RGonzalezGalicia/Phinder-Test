//
//  DashboardViewCell.swift
//  QuestionTest
//
//  Created by Ricardo Gonzalez on 28/08/23.
//

import UIKit

protocol ItemSelectDelegate: AnyObject {
    func onSelectedItem(item: itemDashboard)
}

class DashboardViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checkbox: UIButton!
    
    weak var delegate: ItemSelectDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var content: itemDashboard! {
        didSet{
            setupCell()
        }
    }
    
    func setupCell(){
        titleLabel.text = content.title
        let image = content.checkbox == true ? "checkmark.circle.fill" : "checkmark.circle"
        checkbox.setImage(UIImage(systemName: image), for: .normal)
    }
    
    @IBAction func checkbokAction(_ sender: Bool) {
        content.checkbox = !content.checkbox
        delegate?.onSelectedItem(item: content)
    }
}
