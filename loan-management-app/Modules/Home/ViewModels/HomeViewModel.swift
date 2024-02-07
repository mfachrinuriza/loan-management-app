//
//  HomeViewModel.swift
//  loan-management-app
//
//  Created by Muhammad Fachri Nuriza on 07/02/24.
//

import RxCocoa
import RxSwift

class HomeViewModel: BaseViewModel {
    let error: PublishRelay<String> = PublishRelay()
    let loading: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    
    let chipItems: BehaviorRelay<[ChipItem]> = BehaviorRelay(value: [])
    let borrowersTotal: BehaviorRelay<Int> = BehaviorRelay(value: 0)
    let amount: BehaviorRelay<Double?> = BehaviorRelay(value: nil)
    let selectedLoanId: BehaviorRelay<Int?> = BehaviorRelay(value: nil)
    let loanList: BehaviorRelay<[Loan]> = BehaviorRelay(value: [])
    let loanListFiltered: BehaviorRelay<[Loan]?> = BehaviorRelay(value: nil)
    
    var homeUseCase: HomeUseCase
    
    init(
        homeUseCase: HomeUseCase
    ) {
        self.homeUseCase = homeUseCase
    }
    
    func onSumTotalAmountAndBorrowers(loans: [Loan]) {
        let borrowersCounter = loans.count
        var amount: Double = 0
        for loan in loans {
            amount = amount + (loan.amount ?? 0)
        }
        self.amount.accept(amount)
        self.borrowersTotal.accept(borrowersCounter)
    }
    
    func onMapChipItems(loans: [Loan]) {
        var uniquePurposes = Set<String>() // To keep track of unique purposes
        var items = [ChipItem]()
        var tempOtherValue: ChipItem?

        for loan in loans {
            if let purpose = loan.purpose, !uniquePurposes.contains(purpose) {
                if purpose.lowercased() != "others" {
                    items.append(ChipItem(id: items.count + 1, name: purpose))
                    uniquePurposes.insert(purpose)
                } else {
                    tempOtherValue = ChipItem(id: items.count + 1, name: loan.purpose ?? "")
                }
            }
            
        }
        
        if let tempOther = tempOtherValue {
            items.append(tempOther)
        }
        
        items.insert(ChipItem(id: 1, name: "Semua"), at: 0)
        self.chipItems.accept(items)
    }
    
    func onFilterLoanPurpose(purpose: String) {
        let filtered = self.loanList.value.filter {
            $0.purpose == purpose
        }
        self.loanListFiltered.accept(filtered)
    }
}


// MARK: HIT API
extension HomeViewModel {
    func requestLoanList() {
        self.loading.accept(true)
        Logger.printLog(loading.value)
        homeUseCase.requestLoanList().subscribe(onNext: { [unowned self] results in
            self.loading.accept(false)
            self.loanList.accept(results)
            self.onSumTotalAmountAndBorrowers(loans: results)
            self.onMapChipItems(loans: results)
        }, onError: { [unowned self] error in
            self.error.accept(ServiceError.pleaseCheckConnectionError)
            self.loading.accept(false)
        }).disposed(by: disposeBag)
    }
}
