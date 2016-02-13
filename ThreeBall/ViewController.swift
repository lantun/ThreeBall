//
//  ViewController.swift
//  ThreeBall
//
//  Created by LanTun on 16/2/13.
//  Copyright © 2016年 LanTun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var waittingView:UIView! // 动画view

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor(red: 0.96470588235294119, green: 0.36470588235294116, blue: 0.18823529411764706, alpha: 1)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playAction(sender: AnyObject) {
        if (waittingView  != nil){
            waittingView.removeFromSuperview()
        }
        waittingView = UIView(frame: CGRectMake(0,0,200,200))
        waittingView.center = self.view.center
        waittingView.backgroundColor = UIColor.clearColor()
        
        let repeatcount:Float = 6*20
        
        let timeDuration:NSTimeInterval = 3.4
        
        let s3:CGFloat = sqrt(3.0)
        // 圆半径
        let radius:CGFloat = 9
        // 圆的距离
        let distance: CGFloat = radius/5
        // 六芒星阵的边长
        let lineWidth:CGFloat = 2*radius
        
        let path1 = UIBezierPath()
        let center = CGPointMake(100, 100)
        
        path1.moveToPoint(CGPointMake(center.x+lineWidth/2, center.y-s3*lineWidth/2))
        //        path1.addLineToPoint(CGPointMake(center.x, center.y-s3*lineWidth))2
        //        path1.addLineToPoint(CGPointMake(center.x-lineWidth/2, center.y-s3*lineWidth/2))3
        //        path1.addLineToPoint(CGPointMake(center.x-lineWidth*3/2, center.y-s3*lineWidth/2))4
        //        path1.addLineToPoint(CGPointMake(center.x-lineWidth, center.y))5
        //        path1.addLineToPoint(CGPointMake(center.x-lineWidth*3/2, center.y+s3*lineWidth/2))6
        //        path1.addLineToPoint(CGPointMake(center.x-lineWidth/2, center.y+s3*lineWidth/2))7
        //        path1.addLineToPoint(CGPointMake(center.x, center.y+s3*lineWidth))8
        //        path1.addLineToPoint(CGPointMake(center.x+lineWidth/2, center.y+s3*lineWidth/2))9
        //        path1.addLineToPoint(CGPointMake(center.x+lineWidth*3/2, center.y+s3*lineWidth/2))10
        //        path1.addLineToPoint(CGPointMake(center.x+lineWidth, center.y))11
        //        path1.addLineToPoint(CGPointMake(center.x+lineWidth*3/2, center.y-s3*lineWidth/2))12
        
        
        path1.addCurveToPoint(CGPointMake(center.x-lineWidth/2, center.y-s3*lineWidth/2), controlPoint1: CGPointMake(center.x, center.y-s3*lineWidth), controlPoint2: CGPointMake(center.x, center.y-s3*lineWidth))
        path1.addCurveToPoint(CGPointMake(center.x-lineWidth, center.y), controlPoint1: CGPointMake(center.x-lineWidth*3/2, center.y-s3*lineWidth/2), controlPoint2: CGPointMake(center.x-lineWidth*3/2, center.y-s3*lineWidth/2))
        path1.addCurveToPoint(CGPointMake(center.x-lineWidth/2, center.y+s3*lineWidth/2), controlPoint1: CGPointMake(center.x-lineWidth*3/2, center.y+s3*lineWidth/2), controlPoint2: CGPointMake(center.x-lineWidth*3/2, center.y+s3*lineWidth/2))
        path1.addCurveToPoint(CGPointMake(center.x+lineWidth/2, center.y+s3*lineWidth/2), controlPoint1: CGPointMake(center.x, center.y+s3*lineWidth), controlPoint2: CGPointMake(center.x, center.y+s3*lineWidth))
        path1.addCurveToPoint(CGPointMake(center.x+lineWidth, center.y), controlPoint1: CGPointMake(center.x+lineWidth*3/2, center.y+s3*lineWidth/2), controlPoint2: CGPointMake(center.x+lineWidth*3/2, center.y+s3*lineWidth/2))
        path1.addCurveToPoint(CGPointMake(center.x+lineWidth/2, center.y-s3*lineWidth/2), controlPoint1: CGPointMake(center.x+lineWidth*3/2, center.y-s3*lineWidth/2), controlPoint2: CGPointMake(center.x+lineWidth*3/2, center.y-s3*lineWidth/2))
        
        
        let keyframeAnimation1=CAKeyframeAnimation(keyPath: "position")
        keyframeAnimation1.path = path1.CGPath
        keyframeAnimation1.repeatCount = repeatcount/6
        keyframeAnimation1.removedOnCompletion = false
        keyframeAnimation1.duration = timeDuration
        keyframeAnimation1.cumulative = false
        keyframeAnimation1.fillMode = kCAFillModeForwards
        keyframeAnimation1.timingFunction=CAMediaTimingFunction(name: "linear")
        
        let circle1 = UIView()
        circle1.frame = CGRectMake(0, 0, radius*2, radius*2)
        circle1.backgroundColor = UIColor.whiteColor()
        circle1.layer.cornerRadius = radius
        circle1.layer.masksToBounds = true
        circle1.layer.addAnimation(keyframeAnimation1, forKey: "position")
        waittingView.addSubview(circle1)
        
        
        
        
        // 换成两个圆
        let sectionView = UIView()
        sectionView.frame = CGRectMake(0, 0, radius*4+distance*2, radius*2)
        sectionView.backgroundColor = UIColor.clearColor()
        
        // 左边的圆
        let circle2 = UIView()
        circle2.frame = CGRectMake(0, 0, radius*2, radius*2)
        circle2.backgroundColor = UIColor.whiteColor()
        circle2.layer.cornerRadius = radius
        circle2.layer.masksToBounds = true
        sectionView.addSubview(circle2)
        
        // 右边的圆
        let circle3 = UIView()
        circle3.frame = CGRectMake(radius*2+distance*2, 0, radius*2, radius*2)
        circle3.backgroundColor = UIColor.whiteColor()
        circle3.layer.cornerRadius = radius
        circle3.layer.masksToBounds = true
        sectionView.addSubview(circle3)
        
        // 旋转整体 120度/0.5秒
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = (CGFloat)(120/360*(2*M_PI))
        rotationAnimation.duration = timeDuration/6.0
        rotationAnimation.additive = true
        rotationAnimation.cumulative = true
        rotationAnimation.repeatCount = repeatcount
        rotationAnimation.fillMode = kCAFillModeForwards
        rotationAnimation.removedOnCompletion = false
        rotationAnimation.timingFunction = CAMediaTimingFunction(name: "linear")
        
        let path2 = UIBezierPath(arcCenter: center, radius: radius*0.5, startAngle: (CGFloat)(4/6*M_PI), endAngle: (CGFloat)(-1*M_PI-2/6*M_PI), clockwise: false)
        let keyframeAnimation2=CAKeyframeAnimation(keyPath: "position")
        keyframeAnimation2.path = path2.CGPath
        keyframeAnimation2.repeatCount = repeatcount/6
        keyframeAnimation2.removedOnCompletion = false
        keyframeAnimation2.duration = timeDuration
        keyframeAnimation2.repeatDuration = 0
        keyframeAnimation2.fillMode = kCAFillModeForwards
        keyframeAnimation2.timingFunction=CAMediaTimingFunction(name: "linear")
        
        
        sectionView.transform = CGAffineTransformMakeRotation((CGFloat)(30/360*M_PI))
        
        sectionView.layer.addAnimation(rotationAnimation, forKey: "rotationAnimation")
        sectionView.layer.addAnimation(keyframeAnimation2, forKey: "keyframeAnimation")
        
        
        waittingView.addSubview(sectionView)
        self.view.addSubview(waittingView)
    }

}

