//
//  CustomButton.swift
//  Smooth blur transition using storyboard
//
//  Created by Yung Dai on 2016-10-26.
//  Copyright © 2016 Yung Dai. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {
    // MARK: Inspectable properties ******************************
    
    @IBInspectable var viewColour: UIColor = UIColor.gray {
        didSet {
            backgroundColor = viewColour
        }
    }
    
    @IBInspectable var useGradient: Bool = false {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable var perfectCircleBorder: Bool = false {
        didSet{
            makeBorderCircle()
        }
    }
    
    @IBInspectable var StartColor: UIColor = UIColor.white
    @IBInspectable var EndColor: UIColor = UIColor.black
    @IBInspectable var isHorizontal: Bool = false {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var roundness: CGFloat = 10.0
    
    // MARK: Internal functions *********************************
    
    // Setup the view appearance
    private func setupView() {
        
        if (useGradient) {
            let colors:Array = [StartColor.cgColor, EndColor.cgColor]
            gradientLayer.colors = colors
            
            self.setNeedsDisplay()
        }
        
        
        if (isHorizontal){
            //            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
            self.setNeedsDisplay()
        }else{
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
            self.setNeedsDisplay()
        }
        
    }
    
    @IBInspectable var buttonRounding: CGFloat = 10 {
        didSet {
            layer.cornerRadius = buttonRounding
            
        }
    }
    
    @IBInspectable var BorderWidth: CGFloat = 1 {
        didSet {
            layer.borderWidth = BorderWidth
            
        }
    }
    
    
    @IBInspectable var BorderColour: UIColor? {
        didSet {
            layer.borderColor = BorderColour?.cgColor
        }
    }
    
    // Helper to return the main layer as CAGradientLayer
    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
    // MARK: Overrides ******************************************
    
    
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setupView()
    }

    
    private func makeBorderCircle() {
        
        if (perfectCircleBorder) {
            gradientLayer.cornerRadius = frame.size.width / 2
            layer.cornerRadius = frame.size.width / 2
        } else {
            gradientLayer.cornerRadius = roundness
        }
        self.setNeedsDisplay()
    }
    
    
    // MARK: - Bouncing the button
    func jumpButtonAnimationIn(sender: UIButton, bounce: CGFloat, duration: CFTimeInterval ) {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 1
        animation.toValue = bounce
        animation.duration = duration
        animation.repeatCount = 0
        animation.autoreverses = false
        animation.isRemovedOnCompletion = false
        
        // ensures when done it passes the current status of the object to the next CABasicAnimation
        animation.fillMode = kCAFillModeForwards
        
        sender.layer.add(animation, forKey: nil)
    }
    
    func jumpButtonAnimationOut(sender: UIButton, bounce: CGFloat, duration: CFTimeInterval ) {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = bounce
        animation.toValue = 1
        animation.duration = duration
        animation.repeatCount = 0
        animation.autoreverses = false
        animation.isRemovedOnCompletion = false
        
        // ensures when done it passes the current status of the object to the next CABasicAnimation
        animation.fillMode = kCAFillModeForwards
        
        sender.layer.add(animation, forKey: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        jumpButtonAnimationIn(sender: self, bounce: 0.95, duration: 0.1)
        
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        jumpButtonAnimationOut(sender: self, bounce: 0.95, duration: 0.1)
        super.touchesEnded(touches, with: event)
    }
}
