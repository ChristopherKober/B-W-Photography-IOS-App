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

@available(iOS 10.0, *)
class Camera {
    
    var captureSession: AVCaptureSession!
//    var stillImage: AVCaptureStillImageOutput!
//    var previewLayer: AVCaptureVideoPreviewLayer!
//    var picture:  UIImage!
//    var status: AVAuthorizationStatus!
    
    
    init() {
        let sessionResult = self.createCaptureSession()
        
        if case let .Ok(capSess) = sessionResult {
            self.captureSession = capSess
        }
        
        #if DEBUG
        
            if case let .Err(message) = sessionResult {
                //MARK: - TODO
                // implement a debugging system
                print(message);
            }
            
        #endif
    }

  
    private func createCaptureSession() -> Result<AVCaptureSession,String> {
        switch AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo) {
        case .authorized: // The user has previously granted access to the camera.
            return self.setupCaptureSession()
            
        case .notDetermined: // The user has not yet been asked for camera access.
            AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo) { granted in
                if granted {
                    if case let .Ok(capSess) = self.createCaptureSession() {
                        self.captureSession = capSess
                    }
                }
            }
            
            return .Err("Waiting on user permission.")
        case .denied: // The user has previously denied access.
            return .Err("Could not set up camera session.")
        case .restricted: // The user can't grant access due to restrictions.
            return .Err("Could not set up camera session.")
        }
    }
    
    private func setupCaptureSession() -> Result<AVCaptureSession,String> {
        let capSess = AVCaptureSession.init()
        
        capSess.beginConfiguration()
        let videoDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        if (videoDevice == nil) {
            return .Err("Could not set up camera session. No default camera on device.")
        }
        guard
            let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice!),
            capSess.canAddInput(videoDeviceInput)
        else { return .Err("Cannot access camera input.") }
        
        capSess.addInput(videoDeviceInput)
        
        let photoOutput = AVCapturePhotoOutput()
        guard capSess.canAddOutput(photoOutput) else { return .Err("Cannot access camera output.") }
        
        capSess.sessionPreset = AVCaptureSessionPresetPhoto
        capSess.addOutput(photoOutput)
        
        capSess.commitConfiguration()
        
        return .Ok(capSess)
    }
  
    public func getSession() -> AVCaptureSession! {
        return self.captureSession;
    }
    
    public func startRunning() {
        if (self.captureSession != nil) {
            self.captureSession.startRunning()
        }
    }

}
