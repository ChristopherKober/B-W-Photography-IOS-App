//
//  CameraViewController.swift
//  BlackAndWhitePhotographyApp
//
//  Created by Kent on 3/26/17.
//  Copyright © 2017 Kent Kober. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {
    
    var c: Camera!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        
        if (c == nil) {
            c = Camera()
        }
    }
    
    
    @IBAction func takePicture(_ sender: UIButton) {
        print("Unimplemented Feature")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
