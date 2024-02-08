//
//  DocumentAssembly.swift
//  loan-management-app
//
//  Created by Muhammad Fachri Nuriza on 08/02/24.
//

import Swinject
import SwinjectAutoregistration

class DocumentAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(DocumentViewController.self, initializer: DocumentViewController.init)
    }
}

