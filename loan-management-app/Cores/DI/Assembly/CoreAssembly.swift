//
//  CoreAssembly.swift
//  final project
//
//  Created by Muhammad Fachri Nuriza on 25/10/23.
//

import Swinject
import SwinjectAutoregistration
import Cores

class CoreAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Navigator.self) { _ in
            Navigator(router: Router())
        }.inObjectScope(.container)
    }
}
