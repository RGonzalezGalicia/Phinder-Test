//
//  Permissions.swift
//  QuestionTest
//
//  Created by Ricardo Gonzalez on 29/08/23.


import Foundation
import CoreLocation
import Photos
import AVFoundation
import UIKit

enum PermissionType {
    case Authorized
    case Denied
    case NotDetermined
}


class Permissions {
    
    func checkCameraPermissions() -> PermissionType {
        let status = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        switch status {
        case .authorized:
            print("checkCameraPermissions: authorized")
            return PermissionType.Authorized
        case .denied, .restricted:
            print("checkCameraPermissions: denied, restricted")
            return PermissionType.Denied
        case .notDetermined:
            print("checkCameraPermissions: notDetermined")
            return PermissionType.NotDetermined
        }
    }
    
    func  requestPermissionCamera(completion: @escaping(_ success: Bool) -> Void) {
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { (granted) in
            completion(granted)
        }
    }
    
    func checkPhotoPermissions() -> PermissionType {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            print("checkPhotoPermissions: authorized")
            return PermissionType.Authorized
        case .denied, .restricted:
            print("checkPhotoPermissions: denied, restricted")
            return PermissionType.Denied
        case .notDetermined:
            print("checkPhotoPermissions: notDetermined")
            return PermissionType.NotDetermined
        case .limited:
            print("checkPhotoPermissions: notDetermined")
            return PermissionType.Denied
        @unknown default:
            print("checkPhotoPermissions: notDetermined")
            return PermissionType.Denied
        }
    }
    
    func  requestPermissionPhoto(completion: @escaping(_ success: Bool) -> Void) {
        PHPhotoLibrary.requestAuthorization { (status) in
            switch status{
            case .authorized:
                completion(true)
            case .denied, .restricted, .notDetermined:
                completion(false)
            case .limited:
                print("checkPhotoPermissions: notDetermined")
            @unknown default:
                print("checkPhotoPermissions: notDetermined")
            }
        }
    }
    
    func requestPermission(){
        let settingsUrl = URL(string: UIApplication.openSettingsURLString)
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(settingsUrl!, completionHandler: { (success) in
                print("Settings opened: \(success)")
            })
        } else {
            // Fallback on earlier versions
        }
    }
}

