//
//  ViewController.swift
//  CoinAnimation
//
//  Created by Matsuki, Reiya (松木 玲也) on 2017/06/19.
//  Copyright © 2017年 reiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var coinView:UIView!
    @IBOutlet var pointView:UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func coinAnimation(sender:AnyObject) {
        let initFrame:CGRect = coinView.frame
        coinView.alpha = 1
        UIView.transition(with: coinView, duration: 0.5, options: [.transitionFlipFromRight], animations: nil, completion: { (Bool) -> Void in
            UIView.transition(with: self.coinView, duration: 0.5, options: [.transitionFlipFromRight], animations: nil, completion: { (Bool) -> Void in
                UIView.transition(with: self.coinView, duration: 0.5, options: [.transitionFlipFromRight], animations: nil, completion: { (Bool) -> Void in
                    
                    self.coinView.alpha = 0
                    self.coinView.frame = initFrame
                })
                
                
            })
            
        
        })
        
        UIView.animate(withDuration: 1.5, delay: 0.0, options: .autoreverse, animations: {
            self.coinView.center.y -= 100.0
        }, completion: nil)

    }
    
    func pointAnimation(frame:CGRect){
        
        pointView.frame = frame
        pointView.alpha = 0.0
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 1.0
        animationGroup.fillMode = kCAFillModeForwards
        animationGroup.isRemovedOnCompletion = false
        
        let animation1 = CABasicAnimation(keyPath: "transform.scale")
        animation1.fromValue = 2.0
        animation1.toValue = 1.0
        
        animationGroup.animations = [animation1]
        pointView.layer.add(animationGroup, forKey: nil)
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveEaseIn], animations: {
            self.pointView.alpha = 1.0
        }, completion: {(Bool) -> Void in
            
            self.pointView.alpha = 0
    })

    
    }

    @IBAction func pointAnimation(sender:AnyObject) {
        let initFrame:CGRect = coinView.frame
        pointAnimation(frame: initFrame)
        
    }
    
    @IBAction func allAnimation(sender:AnyObject) {
        let initFrame:CGRect = coinView.frame
        coinView.alpha = 1
        UIView.transition(with: coinView, duration: 0.5, options: [.transitionFlipFromRight], animations: nil, completion: { (Bool) -> Void in
            UIView.transition(with: self.coinView, duration: 0.5, options: [.transitionFlipFromRight], animations: nil, completion: { (Bool) -> Void in
                UIView.transition(with: self.coinView, duration: 0.5, options: [.transitionFlipFromRight], animations: nil, completion: { (Bool) -> Void in
                    
                    self.coinView.alpha = 0
                    self.pointAnimation(frame: self.coinView.frame)
                    self.coinView.frame = initFrame
                })
                
                
            })
            
            
        })
        
        UIView.animate(withDuration: 1.5, delay: 0.0, options: .autoreverse, animations: {
            self.coinView.center.y -= 100.0
        }, completion: nil)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

