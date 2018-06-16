//
//  CameraPreviewView.swift
//  BlackAndWhitePhotographyApp
//
//  Created by Kent Kober on 6/16/18.
//  Copyright © 2018 Kent Kober. All rights reserved.
//

import UIKit
import AVFoundation

class CameraPreviewView: UIView {
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
    /// Convenience wrapper to get layer as its statically known type.
    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }
    
    public func setSession(captureSession : AVCaptureSession!) {
        self.videoPreviewLayer.session = captureSession
    }
}
