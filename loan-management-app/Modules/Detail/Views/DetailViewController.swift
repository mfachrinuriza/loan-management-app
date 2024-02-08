//
//  DetailViewController.swift
//  loan-management-app
//
//  Created by Muhammad Fachri Nuriza on 07/02/24.
//

import UIKit
import Cores

class DetailViewController: BaseViewController {

    @IBOutlet weak var initialName: UILabel!
    @IBOutlet weak var creditScore: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var collateralType: UILabel!
    @IBOutlet weak var collateralValue: UILabel!
    @IBOutlet weak var repaymentSchedule: UILabel!
    
    var loan: Loan?
    var navigator: Navigator
    
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
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.setNavigationBarWithTitle(title: "Loan Details")
    }
    
    func setupUI() {
        initialName.layer.masksToBounds = true
        initialName.layer.cornerRadius = initialName.frame.width / 2
        
        creditScore.layer.masksToBounds = true
        creditScore.layer.cornerRadius = creditScore.frame.width / 2
    }
    
    func updateUI() {
        let borrower = loan?.borrower
        
        initialName.text = "\(borrower?.name?.prefix(1) ?? "?")"
        creditScore.text = "\(borrower?.creditScore ?? 0)"
        name.text = borrower?.name
        email.text = borrower?.email
        collateralType.text = loan?.collateral?.type
        collateralValue.text = "\(loan?.collateral?.value ?? 0)"
        repaymentSchedule.text = DateTime.getDateStringFromDashedDateString(string: loan?.repaymentSchedule?.installments?.first?.dueDate ?? "")
    }
    
    @IBAction func btnShowDocumentTapped(_ sender: Any) {
        self.navigator.push(.document(documentUrl: loan?.documents?.first?.url ?? ""))
    }
}
