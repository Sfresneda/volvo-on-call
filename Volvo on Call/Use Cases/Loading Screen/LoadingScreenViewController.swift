//
//  LoadingScreenViewController.swift
//  Volvo on Call
//
//  Created by Sergio Fresneda on 10/12/20.
//

import UIKit

class LoadingScreenViewController: BaseViewController {
    
    // MARK: - UI
    private weak var animatedImageView: AnimatedLogoImageView?
    private weak var informationLabel: SigninDynamicLabel?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.animatedImageView?.inAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.informationLabel?.runAnimation()
    }
    
    // MARK: - Setup
    private func setupView() {
        self.view.backgroundColor = UIColor.systemBackground
        
        self.addUIElements()
        self.addUIConstraints()
    }
}

extension LoadingScreenViewController {
    private func addUIElements() {
        // Animated Image View
        let animatedImageView = AnimatedLogoImageView.init(frame: .zero)
        self.animatedImageView = animatedImageView
        self.view.addSubview(animatedImageView)
        
        // Information Label
        let informationLabel = SigninDynamicLabel.init(initialText: "Signin in…",
                                                  slowConnectionText: "This could take more time than expected. Please check your network connection.")
        self.informationLabel = informationLabel
        self.view.addSubview(informationLabel)
    }
    
    private func addUIConstraints() {
        guard let animatedImageView = self.animatedImageView,
              let informationLabel = self.informationLabel else { return }
        
        let guide = self.view.safeAreaLayoutGuide
        
        self.animatedImageView?.translatesAutoresizingMaskIntoConstraints = false
        self.animatedImageView?.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3).isActive = true
        self.animatedImageView?.heightAnchor.constraint(equalTo: animatedImageView.widthAnchor).isActive = true
        self.animatedImageView?.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        self.animatedImageView?.centerYAnchor.constraint(equalTo: guide.centerYAnchor).isActive = true
        
        self.informationLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.informationLabel?.topAnchor.constraint(equalTo: animatedImageView.bottomAnchor, constant: 10).isActive = true
        self.informationLabel?.leadingAnchor.constraint(greaterThanOrEqualTo: guide.leadingAnchor, constant: 20).isActive = true
        guide.trailingAnchor.constraint(greaterThanOrEqualTo: informationLabel.trailingAnchor, constant: 20).isActive = true
        guide.bottomAnchor.constraint(greaterThanOrEqualTo: informationLabel.bottomAnchor).isActive = true
        self.informationLabel?.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
    }
}
