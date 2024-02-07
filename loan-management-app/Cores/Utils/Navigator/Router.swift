//
//  Router.swift
//  loan-management-app
//
//  Created by Muhammad Fachri Nuriza on 07/02/24.
//

import UIKit

struct Router: RouterProtocol {
    
    static let shared = Router()
    
    let initialRoute: Route = .home
    
    func getView(for route: Route) -> UIViewController {
        switch route {
        case .home:
            let homeViewController = DI.get(HomeViewController.self)
            return homeViewController
        case .detail(let gameId):
            let detailViewController = DI.get(DetailViewController.self)
//            detailViewController.gameId = gameId
            return detailViewController
        }
    }
}
