//
//  MainViewController.swift
//  Animation
//
//  Created by Yohsuke Yamakawa on 2/1/16.
//  Copyright © 2016 DigitalCrafts. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var targetLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var targetTopConstraint: NSLayoutConstraint!

    
    @IBOutlet weak var targetView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.targetView.layer.cornerRadius = 10
        self.targetView.layer.shadowColor = UIColor.grayColor().CGColor
        self.targetView.layer.shadowOffset = CGSize(width: -10, height: 10)
        self.targetView.layer.shadowRadius = 5
        self.targetView.layer.shadowOpacity = 0.5
        
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func testButton(sender: AnyObject) {
        spinButton()
        changeColor()
        fadeTarget()
        moveMe()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func moveMe(){
    
        let leading = self.targetLeadingConstraint.constant
        let top = self.targetTopConstraint.constant
        
        self.targetTopConstraint.constant = 50
        self.targetLeadingConstraint.constant = 100
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.view.layoutIfNeeded()
            }) { (finished) -> Void in
                self.targetLeadingConstraint.constant = leading
                self.targetTopConstraint.constant = top
                
                UIView.animateWithDuration(0.5, delay: 2.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .CurveEaseInOut, animations: { () -> Void in
                    self.view.layoutIfNeeded()
                    }, completion: nil)
        }
        
        
        
    }
    
    
    func fadeTarget(){
        
        UIView.animateWithDuration(2.5, animations: { () -> Void in
            self.targetView.alpha = 0.0
            }) { (finished) -> Void in
                UIView.animateWithDuration(0.5, delay: 2.0, options: .CurveEaseInOut, animations: { () -> Void in
                    self.targetView.alpha = 1.0
                    }, completion: nil)
        }
        
    }
    
    
    
    
    func changeColor(){
        UIView.animateWithDuration(2.5, animations: { () -> Void in
            
                self.targetView.backgroundColor = UIColor.blueColor()
            
            }) { (finished) -> Void in
               UIView.animateWithDuration(0.5, delay: 2.0, options: .CurveEaseInOut, animations: { () -> Void in
                self.targetView.backgroundColor = UIColor.greenColor()
                }, completion: nil)
        }
    }
    
    func spinButton(){
        
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        
        animation.duration = 0.5
        animation.fromValue = CGFloat(0) * CGFloat(M_PI) / 180.0
        animation.toValue = CGFloat(180) * CGFloat(M_PI) / 180.0
        
        self.button.layer.addAnimation(animation, forKey: "MyAnimation")
        
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
