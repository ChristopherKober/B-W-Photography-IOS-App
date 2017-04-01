//
//  Camera.swift
//  BlackAndWhitePhotographyApp
//
//  Created by Kent on 3/26/17.
//  Copyright © 2017 Kent Kober. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class Camera {
    
    var captureSession: AVCaptureSession!
    var stillImage: AVCaptureStillImageOutput!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var picture:  UIImage!
    var status: AVAuthorizationStatus!
    
    
    init() {
        status = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
        captureSession = nil
        stillImage = nil
        previewLayer = nil
        picture = nil
        
        if (status == AVAuthorizationStatus.authorized) {
            prepareCamera()
        }
    }
    
    internal func getAuthorizationStatus() -> Int {
        //case notDetermined = 0
        //case restricted = 1
        //case denied = 2
        //case authorized = 3
        return status.rawValue
    }
    
    fileprivate func prepareCamera() {}

}
