//
//  LoanData.swift
//  loan-management-app
//
//  Created by Muhammad Fachri Nuriza on 07/02/24.
//

import Foundation

public struct LoanData: Codable {
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

extension LoanData {
    public init(from loan: Loan) {
        self.init(
            id: loan.id,
            amount: loan.amount,
            interestRate: loan.interestRate,
            term: loan.term,
            purpose: loan.purpose,
            riskRating: loan.riskRating,
            borrower: loan.borrower,
            collateral: loan.collateral,
            documents: loan.documents,
            repaymentSchedule: loan.repaymentSchedule
        )
    }
}

public struct BorrowerData: Codable {
    var id: String? = nil
    var name: String? = nil
    var email: String? = nil
    var creditScore: Int? = nil
}

public struct CollateralData: Codable {
    var type: String? = nil
    var value: Int? = nil
}

public struct DocumentsData: Codable {
    var type: String?
    var url: String?
}

public struct RepaymentScheduleData: Codable {
    var installments: [InstallmentsData]?
}

public struct InstallmentsData: Codable {
    var dueDate: String?
    var amountDue: Double?
}
