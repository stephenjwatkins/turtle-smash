//
//  ProgressView.swift
//  Turtle Smash
//
//  Created by Stephen Watkins on 1/25/15.
//  Copyright (c) 2015 Stephen Watkins. All rights reserved.
//

import Foundation
import UIKit

class ProgressView : UIView {
    
    var circleLayer: CAShapeLayer?
    var baseLayer: CAShapeLayer?
    
    override init() {
        super.init()
        self.addArcs()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addArcs()
    }
    
    func addArcs() {
        self.addBaseArc()
        self.addProgressArc()
    }
    
    func setColor(color: UIColor) {
        circleLayer!.strokeColor = color.CGColor
    }
    
    func stopProgress() {
        let pausedTime = circleLayer!.convertTime(CACurrentMediaTime(), fromLayer: nil)
        circleLayer!.speed = 0.0;
        circleLayer!.timeOffset = pausedTime;
    }
    
    func animateProgress(duration: NSTimeInterval) {
        circleLayer!.removeAnimationForKey("animateCircle")
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        circleLayer!.speed = 1.0
        circleLayer!.strokeEnd = 1.0
        circleLayer!.addAnimation(animation, forKey: "animateCircle")
    }
    
    func addProgressArc() {
        circleLayer = CAShapeLayer()
        circleLayer!.path = self.createCirclePath()
        circleLayer!.fillColor = UIColor.clearColor().CGColor
        circleLayer!.strokeColor = Colors["DarkGreen"]!.CGColor
        circleLayer!.lineWidth = 3.0
        circleLayer!.strokeEnd = 0.0
        
        // Add the circleLayer to the view's layer's sublayers
        self.layer.addSublayer(circleLayer)
    }
    
    func addBaseArc() {
        baseLayer = CAShapeLayer()
        baseLayer!.path = self.createCirclePath()
        baseLayer!.fillColor = UIColor.clearColor().CGColor
        baseLayer!.strokeColor = Colors["DarkGreen"]!.colorWithAlphaComponent(0.15).CGColor
        baseLayer!.lineWidth = 3.0
        
        // Add the circleLayer to the view's layer's sublayers
        self.layer.addSublayer(baseLayer)
    }
    
    func createCirclePath() -> CGPath {
        return UIBezierPath(
            arcCenter: CGPoint(
                x: self.frame.size.width / 2.0,
                y: self.frame.size.height / 2.0
            ),
            radius: (self.frame.size.width - 6) / 2,
            startAngle: CGFloat(M_PI * -0.5),
            endAngle: CGFloat(M_PI * 1.5),
            clockwise: true
        ).CGPath
    }
    
}