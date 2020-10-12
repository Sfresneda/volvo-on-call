//
//  BaseViewController.swift
//  Volvo on Call
//
//  Created by Sergio Fresneda on 10/12/20.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - Life Cycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    deinit {
        self.commonDeinit()
    }
    
    // MARK: - Helper
    private func commonInit() {
        debugPrint("INIT: - \(String(describing: self))")
    }
    
    private func commonDeinit() {
        debugPrint("DEINIT: - \(String(describing: self))")
    }
}
