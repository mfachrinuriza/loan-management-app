//
//  Loan.swift
//  loan-management-app
//
//  Created by Muhammad Fachri Nuriza on 07/02/24.
//

import Foundation

public struct Loan: Codable {
    public var id: String?
    public var amount: Double?
    public var interestRate: Double?
    public var term: Int?
    public var purpose: String?
    public var riskRating: String?
    public var borrower: BorrowerData?
    public var collateral: CollateralData?
    public var documents: [DocumentsData]?
    public var repaymentSchedule: RepaymentScheduleData?
    
    public init(
        id: String? = nil,
        amount: Double? = nil,
        interestRate: Double? = nil,
        term: Int? = nil,
        purpose: String? = nil,
        riskRating: String? = nil,
        borrower: BorrowerData? = nil,
        collateral: CollateralData? = nil,
        documents: [DocumentsData]? = nil,
        repaymentSchedule: RepaymentScheduleData? = nil
    ) {
        self.id = id
        self.amount = amount
        self.interestRate = interestRate
        self.term = term
        self.purpose = purpose
        self.riskRating = riskRating
        self.borrower = borrower
        self.collateral = collateral
        self.documents = documents
        self.repaymentSchedule = repaymentSchedule
    }
}

extension Loan {
    public init(from loanData: LoanData) {
        self.init(
            id: loanData.id,
            amount: loanData.amount,
            interestRate: loanData.interestRate,
            term: loanData.term,
            purpose: loanData.purpose,
            riskRating: loanData.riskRating,
            borrower: loanData.borrower,
            collateral: loanData.collateral,
            documents: loanData.documents,
            repaymentSchedule: loanData.repaymentSchedule
        )
    }
}
