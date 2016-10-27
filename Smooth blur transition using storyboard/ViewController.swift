//
//  ViewController.swift
//  Smooth blur transition using storyboard
//
//  Created by Yung Dai on 2016-10-26.
//  Copyright © 2016 Yung Dai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        
        if segue.identifier == "withCode" {
            
            let vc = segue.destination as! SecondViewController
            
            vc.background = UIImage.takeScreenshot(view: self.view)!
        }
    }

}

