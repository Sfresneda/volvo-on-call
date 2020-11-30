//
//  AnimatedLogoImageView.swift
//  Volvo on Call
//
//  Created by Sergio Fresneda on 10/12/20.
//

import UIKit

class AnimatedLogoImageView: UIImageView {
    
    // MARK: - Vars
    private let heartBeatTimmingFunction: CAMediaTimingFunction = CAMediaTimingFunction.init(controlPoints: 0.0, 0.5, 0.6, 1.0)
    private let minSizeRatio: CGFloat = 0.9
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonSetup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonSetup()
    }
    
    // MARK: - Setup
    private func commonSetup() {
        self.image = nil

        self.backgroundColor = UIColor.clear
        self.contentMode = .scaleAspectFit
        self.transform = CGAffineTransform.init(scaleX: self.minSizeRatio, y: self.minSizeRatio)
        self.image = UIImage.init(named: "img_logo")
    }
    
    
    // MARK: - Actions
    public func inAnimation() {
        self.initInAnimation()
    }
    public func outAnimation() {
        self.initOutAnimation()
    }
    
    // MARK: - Helper
    private func initInAnimation() {
        UIView.animate(withDuration: 0.5) {
            self.transform = .identity
        } completion: { _ in
            self.heartBeatAnimation()
        }
    }
    private func initOutAnimation() {
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform.init(scaleX: 0, y: 0)
        }
    }
    
    private func heartBeatAnimation() {
        let updatedBounds = CGRect.init(x: self.layer.presentation()?.bounds.origin.x ?? 0,
                                        y: self.layer.presentation()?.bounds.origin.y ?? 0,
                                        width: (self.layer.presentation()?.bounds.width ?? 0) * self.minSizeRatio,
                                        height: (self.layer.presentation()?.bounds.height ?? 0) * self.minSizeRatio)
        
        let animation = CABasicAnimation(keyPath: "bounds")
        animation.duration = 1
        
        //it's better to start animation from presentation layer in case there is already animation going on
        animation.fromValue = self.layer.presentation()?.bounds
        animation.repeatCount = .infinity
        animation.autoreverses = true
        animation.toValue = updatedBounds
        animation.timingFunction = self.heartBeatTimmingFunction

        CATransaction.begin()
        self.layer.add(animation, forKey: nil)
        CATransaction.commit()

    }
}
