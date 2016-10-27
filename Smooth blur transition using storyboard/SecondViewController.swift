//
//  SecondViewController.swift
//  Smooth blur transition using storyboard
//
//  Created by Yung Dai on 2016-10-26.
//  Copyright © 2016 Yung Dai. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var backgroundImageView: UIImageView! = UIImageView()
    var background: UIImage = UIImage()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.backgroundImageView.image = background
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.3, animations: {
        
            self.backgroundImageView.alpha = 0
        })
    }

  


}
