//
//  ViewController.swift
//  gesture practice
//
//  Created by Indah Fitriany on 04/07/19.
//  Copyright © 2019 Indah Fitriany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var translationImage: UIView!
    
    var tapGesture = UITapGestureRecognizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        translationImage.addGestureRecognizer(tapGesture)
        translationImage.isUserInteractionEnabled = true
        translationImage.isMultipleTouchEnabled = true
        
        // swipe Gesture
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGestureUp))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGestureDown))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGestureLeft))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGestureRight))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        view.addGestureRecognizer(swipeRight)
        
    }

        
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        
        let translation = recognizer.translation(in: self.view)
        
        if let view = recognizer.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        }
    
    @IBAction func handlePinch(recognizer: UIPinchGestureRecognizer) {
        
        if let view = recognizer.view {
            view.transform = view.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
            recognizer.scale = 1
        }
        
    }
    
    @IBAction func handleRotate(recognizer: UIRotationGestureRecognizer) {
        
        if let view = recognizer.view {
            view.transform = view.transform.rotated(by: recognizer.rotation)
            recognizer.rotation = 0
        }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
//        if self.translationImage.backgroundColor == translationImage.backgroundColor {
//            self.translationImage.backgroundColor = UIColor.yellow }
//        else {
//            self.translationImage.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
//        }
        
        if let view = sender.view {
           
            self.translationImage.layer.cornerRadius = self.translationImage.frame.size.width / 2
            
        } else {
            
            self.translationImage.layer.cornerRadius = self.translationImage.frame.size.width
        }
        
    }
    
    @objc func swipeGestureUp(sender: UISwipeGestureRecognizer) {
        
        if (sender as? UISwipeGestureRecognizer) != nil {
            
            view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            
                    }
        
    }
    
    @objc func swipeGestureDown(sender: UISwipeGestureRecognizer){
    
        if (sender as? UISwipeGestureRecognizer) != nil {
            
            view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
       }
        
    @objc func swipeGestureLeft(sender: UISwipeGestureRecognizer){
        
        if (sender as? UISwipeGestureRecognizer) != nil {
            
            view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        }
    }
    
    @objc func swipeGestureRight(sender: UISwipeGestureRecognizer){
        
        if (sender as? UISwipeGestureRecognizer) != nil {
        
            view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        }
        
        
    }
    
    
    
    @IBAction func handleLongPress(_ sender: UILongPressGestureRecognizer) {
        
        if sender.state == .began {
            
            self.translationImage.backgroundColor = UIColor.blue
        }
    }
}
    


