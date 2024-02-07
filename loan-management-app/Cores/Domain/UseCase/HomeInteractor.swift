//
//  HomeInteractor.swift
//  loan-management-app
//
//  Created by Muhammad Fachri Nuriza on 07/02/24.
//

import RxSwift

public protocol HomeUseCase {
    func requestLoanList() -> Observable<[Loan]>
//    func requestLoanDetail(id: Int) -> Observable<Loan>
}

public class HomeInteractor: HomeUseCase {
    let loanRepository: LoanRepositoryProtocol
    
    let disposedBag = DisposeBag()
    
    public init(
        loanRepository: LoanRepositoryProtocol
    ) {
        self.loanRepository = loanRepository
    }

    public func requestLoanList() -> Observable<[Loan]> {
        return Observable.create { observer in
            
            self.loanRepository.requestLoanList().subscribe(onNext: { loanDataList in
                let loanList = loanDataList.map { loanData in
                    return Loan(from: loanData)
                }
                observer.onNext(loanList)
                observer.onCompleted()
            }, onError: { error in
                observer.onError(error)
            }).disposed(by: self.disposedBag)
            
            return Disposables.create()
        }
    }
}
