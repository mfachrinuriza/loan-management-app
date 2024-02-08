//
//  DetailAssembly.swift
//  loan-management-app
//
//  Created by Muhammad Fachri Nuriza on 08/02/24.
//

import Swinject
import SwinjectAutoregistration

class DetailAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(DetailViewController.self, initializer: DetailViewController.init)
    }
}
