//
//  PhoneViewCell.swift
//  QuestionTest
//
//  Created by Ricardo Gonzalez on 29/08/23.
//

import UIKit

class PhoneViewCell: UITableViewCell {

    @IBOutlet weak var phoneNumber: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        phoneNumber.delegate = self
    }
    
}
extension PhoneViewCell: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
           
            let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
            if newText.isEmpty || (Int(newText) != nil && newText.count <= 10) {
                return true
            }
            
            return false
        }
}
