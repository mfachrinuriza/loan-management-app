//
//  RouterProtocol.swift
//  loan-management-app
//
//  Created by Muhammad Fachri Nuriza on 07/02/24.
//

import UIKit

public protocol RouterProtocol {
    var initialRoute: Route { get }
    
    associatedtype V: UIViewController
    
    func getView(for route: Route) -> V
}

