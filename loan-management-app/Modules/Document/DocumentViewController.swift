//
//  DocumentViewController.swift
//  loan-management-app
//
//  Created by Muhammad Fachri Nuriza on 08/02/24.
//

import UIKit
import Cores
import Kingfisher

class DocumentViewController: BaseViewController {

    @IBOutlet weak var documentImage: UIImageView!
    
    var documentUrl: String?
    var navigator: Navigator
    @IBOutlet weak var emptyState: UILabel!
    
    init(
        navigator: Navigator
    ) {
        self.navigator = navigator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.setNavigationBarWithTitle(title: "Loan Document")
    }
    
    func setupUI() {
        if let url = documentUrl {
            self.documentImage.setImage(url, placeholder: "ic_document_not_found")
        } else {
            emptyState.isHidden = false
        }
    }
}
