//
//  HomeViewController.swift
//  loan-management-app
//
//  Created by Muhammad Fachri Nuriza on 07/02/24.
//

import UIKit
import Cores

class HomeViewController: BaseViewController {

    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var borrowersTotal: UILabel!
    @IBOutlet weak var chips: Chips!
    @IBOutlet weak var collectionView: FittedCollectionView!
    
    var navigator: Navigator
    var homeViewModel: HomeViewModel
    
    init(
        homeViewModel: HomeViewModel,
        navigator: Navigator
    ) {
        self.homeViewModel = homeViewModel
        self.navigator = navigator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
        setupBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func loadData() {
        homeViewModel.requestLoanList()
    }
    
    func setupUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: LoanCell.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: LoanCell.cellIdentifier)
        
        // Rounded Chips
        chips.onChange = { [unowned self] selected in
            if selected > 0 {
                let purpose = self.homeViewModel.chipItems.value[selected].name
                self.homeViewModel.onFilterLoanPurpose(purpose: purpose)
            } else if selected == 0 {
                self.homeViewModel.loanListFiltered.accept(nil)
                self.collectionView.reloadData()
            }
            chips.selected = selected
        }
        
    }
    
    func updateUI() {
        let borrowersTotal = homeViewModel.borrowersTotal.value
        let amount = homeViewModel.amount.value
        self.amount.text = "\(amount?.f(.currency) ?? "")"
        self.borrowersTotal.text = WordingEnum.borrowersTotal(borrowersTotal)
    }
    
    func setupBinding() {
        homeViewModel.error.subscribe(onNext: { error in
            self.showAlert(title: "Perhatian", message: error)
        }).disposed(by: homeViewModel.disposeBag)
        
        homeViewModel.loading.subscribe(onNext: { loading in
            if loading {
                self.showLoading()
            } else {
                self.removeLoading()
            }
        }).disposed(by: homeViewModel.disposeBag)
        
        homeViewModel.loanList.subscribe(onNext: { result in
            self.collectionView.reloadData()
        }).disposed(by: homeViewModel.disposeBag)
        
        homeViewModel.amount.subscribe(onNext: { result in
            self.updateUI()
        }).disposed(by: homeViewModel.disposeBag)
        
        homeViewModel.borrowersTotal.subscribe(onNext: { result in
            self.updateUI()
        }).disposed(by: homeViewModel.disposeBag)
        
        homeViewModel.chipItems.subscribe(onNext: { result in
            self.chips.items = result
        }).disposed(by: homeViewModel.disposeBag)
        
        homeViewModel.loanListFiltered.subscribe(onNext: { result in
            self.collectionView.reloadData()
        }).disposed(by: homeViewModel.disposeBag)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.homeViewModel.loanListFiltered.value?.count ?? self.homeViewModel.loanList.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoanCell.cellIdentifier, for: indexPath) as! LoanCell
        var data = Loan()
        if let filtered = self.homeViewModel.loanListFiltered.value {
            data = filtered[indexPath.row]
        } else {
            data = self.homeViewModel.loanList.value[indexPath.row]
        }
        cell.update(with: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var data = Loan()
        if let filtered = self.homeViewModel.loanListFiltered.value {
            data = filtered[indexPath.row]
        } else {
            data = self.homeViewModel.loanList.value[indexPath.row]
        }
        self.navigator.push(.detail(loan: data))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: collectionView.frame.width,
            height: 120
        )
    }
}
