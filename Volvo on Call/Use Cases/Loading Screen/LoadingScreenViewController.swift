//
//  LoadingScreenViewController.swift
//  Volvo on Call
//
//  Created by Sergio Fresneda on 10/12/20.
//

import UIKit

class LoadingScreenViewController: BaseViewController {
    
    // MARK: - UI
    private weak var animatedImageView: HeartBeatAnimatedImageView!
    private weak var informationLabel: AnimatedLabel!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.animatedImageView.inAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.informationLabel.runAnimation()
    }
    
    // MARK: - Setup
    private func setupView() {
        self.view.backgroundColor = UIColor.white
        
        // Animated Image View
        let animatedImageView = HeartBeatAnimatedImageView.init(frame: .zero)
        self.animatedImageView = animatedImageView
        self.animatedImageView.image = UIImage.init(named: "img_logo")
        self.view.addSubview(animatedImageView)
        
        // Information Label
        let informationLabel = AnimatedLabel.init()
        self.informationLabel = informationLabel
        self.informationLabel.text = "Signin in…"
        self.informationLabel.numberOfLines = 0
        self.informationLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        self.view.addSubview(informationLabel)
        
        self.addConstraints()
    }
    
    
    // MARK: - Helpers
    private func addConstraints() {
        let guide = self.view.safeAreaLayoutGuide
        
        self.animatedImageView.translatesAutoresizingMaskIntoConstraints = false
        self.animatedImageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3).isActive = true
        self.animatedImageView.heightAnchor.constraint(equalTo: self.animatedImageView.widthAnchor).isActive = true
        self.animatedImageView.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        self.animatedImageView.centerYAnchor.constraint(equalTo: guide.centerYAnchor).isActive = true
        
        self.informationLabel.translatesAutoresizingMaskIntoConstraints = false
        self.informationLabel.topAnchor.constraint(equalTo: self.animatedImageView.bottomAnchor, constant: 10).isActive = true
        self.informationLabel.leadingAnchor.constraint(greaterThanOrEqualTo: guide.leadingAnchor, constant: 20).isActive = true
        guide.trailingAnchor.constraint(greaterThanOrEqualTo: self.informationLabel.trailingAnchor, constant: 20).isActive = true
        guide.bottomAnchor.constraint(greaterThanOrEqualTo: self.informationLabel.bottomAnchor).isActive = true
        self.informationLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
    }
}
