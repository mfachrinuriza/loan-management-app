//
//  LoanRepository.swift
//  loan-management-app
//
//  Created by Muhammad Fachri Nuriza on 07/02/24.
//

import RxSwift

public protocol LoanRepositoryProtocol {
    func requestLoanList() -> Observable<[LoanData]>
//    func requestLoanDetail(id: Int) -> Observable<LoanData>
}

public class LoanRepository: NSObject {
        
    public let service: LoanServiceProtocol
    
    static let sharedInstance = {
        let service = LoanService.sharedInstance
        return LoanRepository(service: service)
    }()
    
    public init(service: LoanServiceProtocol) {
        self.service = service
    }
}

extension LoanRepository: LoanRepositoryProtocol {
    public func requestLoanList() -> Observable<[LoanData]> {
        return service.requestLoanList()
    }
    
//    public func requestLoanDetail(id: Int) -> Observable<LoanData> {
//        return service.requestGameDetail(id: id)
//    }
}
