//
//  DI.swift
//  loan-management-app
//
//  Created by Muhammad Fachri Nuriza on 07/02/24.
//

import Swinject
import SwinjectAutoregistration

protocol DIProtocol {
    static func get<T>(_ type: T.Type, name: String?) -> T
}

public class DI: DIProtocol {
    static let container = Container()
    static let assembler = Assembler(
        [
            // Modules
            HomeAssembly(),
            CoreAssembly(),
        ],
        container: DI.container
    )
    
    static func get<T>(_ type: T.Type, name: String? = nil) -> T {
        DI.assembler.resolver.resolve(T.self, name: name)!
    }
}
