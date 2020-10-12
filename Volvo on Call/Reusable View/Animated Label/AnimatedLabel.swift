//
//  AnimatedLabel.swift
//  Volvo on Call
//
//  Created by Sergio Fresneda on 10/12/20.
//

import UIKit

class AnimatedLabel: UILabel {

    // MARK: - Vars

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
        self.text = nil
        self.alpha = 0
    }
    
    // MARK: - Actions
    public func runAnimation() {
        self.addAnimation()
    }

    // MARK: - Helper
    private func addAnimation() {
        UIView.animate(withDuration: 0.2) {
            self.alpha = 1
        }
    }
}
