//
//  BuildIdentifier.swift
//  loan-management-app
//
//  Created by Muhammad Fachri Nuriza on 07/02/24.
//

import Foundation

public class CoreBundle {
    public static func getIdentifier() -> String {
        let bundle = Bundle(for: CoreClass.self)
        let bundleId = bundle.bundleIdentifier ?? ""
        return bundleId
    }
}

public class CoreClass {
    
}
