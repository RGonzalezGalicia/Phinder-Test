//
//  NameViewCell.swift
//  QuestionTest
//
//  Created by Ricardo Gonzalez on 29/08/23.
//

import UIKit

class NameViewCell: UITableViewCell {

    @IBOutlet weak var nameTxtFld: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        nameTxtFld.delegate = self
        nameTxtFld.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
}
extension NameViewCell: UITextFieldDelegate {
    
    @objc func textFieldDidChange(_ textField: UITextField) {
            if let text = nameTxtFld.text, text.count > 35 {
                let index = text.index(text.startIndex, offsetBy: 35)
                nameTxtFld.text = String(text[..<index])
            }
        }

        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let currentText = nameTxtFld.text ?? ""
            guard let stringRange = Range(range, in: currentText) else {
                return false
            }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            
            return updatedText.count <= 35
        }
}
