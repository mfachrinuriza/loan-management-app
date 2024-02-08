//
//  Router.swift
//  loan-management-app
//
//  Created by Muhammad Fachri Nuriza on 07/02/24.
//

import UIKit
import Cores

struct Router: RouterProtocol {
    
    static let shared = Router()
    
    let initialRoute: Route = .home
    
    func getView(for route: Route) -> UIViewController {
        switch route {
        case .home:
            let homeViewController = DI.get(HomeViewController.self)
            return homeViewController
        case .detail(let loan):
            let detailViewController = DI.get(DetailViewController.self)
            detailViewController.loan = loan
            return detailViewController
        case .document(let documentUrl):
            let documentViewController = DI.get(DocumentViewController.self)
            documentViewController.documentUrl = documentUrl
            return documentViewController
        }
    }
}
