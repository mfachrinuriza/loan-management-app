//
//  LoanCell.swift
//  loan-management-app
//
//  Created by Muhammad Fachri Nuriza on 07/02/24.
//

import UIKit

class LoanCell: UICollectionViewCell {

    @IBOutlet weak var container: CustomUIView!
    @IBOutlet weak var initialName: UILabel!
    @IBOutlet weak var creditScore: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var riskRating: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var reason: UILabel!
    @IBOutlet weak var interestRate: UILabel!
    @IBOutlet weak var term: UILabel!
    
    static let cellIdentifier = "LoanCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        initialName.layer.masksToBounds = true
        initialName.layer.cornerRadius = initialName.frame.width / 2
        
        creditScore.layer.masksToBounds = true
        creditScore.layer.cornerRadius = creditScore.frame.width / 2
    }
    
    func update(with data: Loan) {
        let borrower = data.borrower
        let installments = data.repaymentSchedule?.installments
        
        initialName.text = "\(borrower?.name?.prefix(1) ?? "?")"
        creditScore.text = "\(borrower?.creditScore ?? 0)"
        name.text = borrower?.name
        riskRating.text = WordingEnum.riskRating(data.riskRating ?? "")
        amount.text = "\(data.amount?.f(.currency) ?? "")"
        reason.text = data.purpose
        interestRate.text = "\(data.interestRate ?? 0)"
        term.text = "\(data.term ?? 0)"
    }
    
    
}
