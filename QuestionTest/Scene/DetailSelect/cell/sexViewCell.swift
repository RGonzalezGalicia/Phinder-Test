//
//  sexViewCell.swift
//  QuestionTest
//
//  Created by Ricardo Gonzalez on 29/08/23.
//

import UIKit

class sexViewCell: UITableViewCell {

    @IBOutlet weak var sexTct: UITextField!
    
    let pickerView = UIPickerView()
    let codePicker = ["Masculino","femenino"]
    var codeSelect = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        pickerView.delegate = self
        pickerView.dataSource = self
        sexTct.inputView = pickerView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension sexViewCell: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if sexTct.isFirstResponder{
            return codePicker.count
        }
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if sexTct.isFirstResponder {
            return codePicker[row]
        }
        return codePicker[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if sexTct.isFirstResponder {
            print("selecion",codePicker[row])
            sexTct.text = codePicker[row]
            codeSelect = codePicker[row]
        }
    }
}
