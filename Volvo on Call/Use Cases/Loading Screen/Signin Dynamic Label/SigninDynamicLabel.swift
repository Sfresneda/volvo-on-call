//
//  SigninDynamicLabel.swift
//  Volvo on Call
//
//  Created by Sergio Fresneda on 10/12/20.
//

import UIKit

class SigninDynamicLabel: UILabel {

    // MARK: - Vars
    private var initialText: String?
    private var slowConnectionText: String?
    private var slowConnectionTimeInterval: TimeInterval?

    // MARK: - LifeCycle
    convenience init(initialText: String?,
         slowConnectionText: String?,
         slowConnectionTimeInterval: TimeInterval? = 5) {
        self.init(frame: .zero)
        self.initialText = initialText
        self.slowConnectionText = slowConnectionText
        self.slowConnectionTimeInterval = slowConnectionTimeInterval

        self.commonSetup()
    }
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
        self.text = self.initialText
        self.textAlignment = .center
        self.numberOfLines = 0
        self.font = UIFont.systemFont(ofSize: 14, weight: .light)
        self.alpha = 0
    }
    
    // MARK: - Actions
    public func runAnimation() {
        self.addAnimation()
        self.launchSlowConnectionTimeOut()
    }

    // MARK: - Helper
    private func addAnimation() {
        UIView.animate(withDuration: 0.2) {
            self.alpha = 1
        }
    }
    
    private func launchSlowConnectionTimeOut() {
        guard let slowConnectionTimeInterval = self.slowConnectionTimeInterval,
              0 < slowConnectionTimeInterval else { return }
        
        DispatchQueue
            .main
            .asyncAfter(deadline: .now() + slowConnectionTimeInterval) { [weak self] in
                guard let self = self else { return }
                UIView.transition(with: self,
                                  duration: 0.2,
                                  options: .transitionCrossDissolve) { [weak self] in
                    self?.text = self?.slowConnectionText
                } completion: { _ in }
            }
    }
}
