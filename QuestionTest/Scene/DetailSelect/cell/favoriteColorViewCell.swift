//
//  favoriteColorViewCell.swift
//  QuestionTest
//
//  Created by Ricardo Gonzalez on 29/08/23.
//

import UIKit

class favoriteColorViewCell: UITableViewCell,UIPickerViewDataSource,UIPickerViewDelegate {

    
    @IBOutlet weak var colorTxt: UITextField!
    
    let pickerData = ["Rojo","Amarillo","Verde","Azul","Magenta"]
    
    var myPicker = UIPickerView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        myPicker.delegate = self
        myPicker.dataSource = self
        colorTxt.inputView = myPicker
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    //MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
     
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        colorTxt.text = pickerData[row]
    }
     
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 26.0)!,NSAttributedString.Key.foregroundColor:UIColor.blue])
        return myTitle
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel = view as! UILabel?
        if view == nil {  //if no label there yet
            pickerLabel = UILabel()
            //color the label's background
            let hue = CGFloat(row)/CGFloat(pickerData.count)
            pickerLabel?.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        }
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 26.0)!,NSAttributedString.Key.foregroundColor:UIColor.black])
        pickerLabel!.attributedText = myTitle
        pickerLabel!.textAlignment = .center
         
        return pickerLabel!
         
    }
}
