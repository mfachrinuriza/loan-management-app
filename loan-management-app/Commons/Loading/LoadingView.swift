//
//  LoadingView.swift
//  loan-management-app
//
//  Created by Muhammad Fachri Nuriza on 08/02/24.
//

import UIKit

class LoadingView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI() {
        Bundle.main.loadNibNamed("LoadingView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.frame
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}

