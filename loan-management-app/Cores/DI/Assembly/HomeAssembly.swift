//
//  HomeAssembly.swift
//  loan-management-app
//
//  Created by Muhammad Fachri Nuriza on 07/02/24.
//

import Swinject
import SwinjectAutoregistration
import Cores

class HomeAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(LoanRepositoryProtocol.self, initializer: LoanRepository.init).inObjectScope(.container)
        container.autoregister(LoanServiceProtocol.self, initializer: LoanService.init).inObjectScope(.container)
        
        container.autoregister(HomeUseCase.self, initializer: HomeInteractor.init)
        container.autoregister(HomeViewModel.self, initializer: HomeViewModel.init)
        container.autoregister(HomeViewController.self, initializer: HomeViewController.init)
    }
}
