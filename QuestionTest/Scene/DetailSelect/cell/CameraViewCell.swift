//
//  CameraViewCell.swift
//  QuestionTest
//
//  Created by Ricardo Gonzalez on 29/08/23.
//

import Foundation
import UIKit

class CameraViewCell: UITableViewCell {

    @IBOutlet weak var cameraFoto: UIImageView!
    
    weak var viewController: UIViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        cameraFoto.addGestureRecognizer(tapRecognizer)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func imageTapped(recognizer: UITapGestureRecognizer) {
        openCamera()
    }
    
    func openCamera() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {return}
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        switch Permissions().checkCameraPermissions() {
        case .Authorized:
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .camera;
                imagePicker.allowsEditing = false
                self.viewController?.present(imagePicker, animated: true, completion: nil)
            }
        case .Denied:()

        case .NotDetermined:
            Permissions().requestPermissionCamera(completion: { (success) in
                if success {
                    if UIImagePickerController.isSourceTypeAvailable(.camera) {
                        let imagePicker = UIImagePickerController()
                        imagePicker.delegate = self
                        imagePicker.sourceType = .camera;
                        imagePicker.allowsEditing = false
                        self.viewController?.present(imagePicker, animated: true, completion: nil)
                    }
                } else {
                    print("No dio el permiso")
                }
            })
        }
    }
}

extension CameraViewCell: UIImagePickerControllerDelegate, UINavigationControllerDelegate{}
