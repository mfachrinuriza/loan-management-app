//
//  BaseViewController.swift
//  loan-management-app
//
//  Created by Muhammad Fachri Nuriza on 07/02/24.
//

import UIKit

open class BaseViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var loading: LoadingView?
    
    open func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { action in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    open func showLoading() {
        loading = LoadingView()
        self.view.addSubview(loading!)
        loading?.translatesAutoresizingMaskIntoConstraints = false
        loading?.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        loading?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        loading?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        loading?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        loading?.indicator.startAnimating()
    }
    
    open func removeLoading() {
        loading?.indicator.stopAnimating()
        loading?.removeFromSuperview()
    }
    
    open func onBackController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setNavigationBarWithTitle(title: String) {
        setNavigationBarWithoutTitle()
        
        let label = UILabel(frame: CGRect(x: 8, y: 0, width: self.navigationController!.navigationBar.frame.width, height: self.navigationController!.navigationBar.frame.height))
        label.text = title
        label.textColor = Color.getColor(name: .black70)
        label.font = UIFont(name: Font.interSemiBold, size: 16)
        label.textAlignment = .left
        self.navigationItem.titleView = label
    }
    
    func setNavigationBarWithoutTitle() {
        let image = UIImage(named: "ic_arrow_left")!
        let barItem = UIBarButtonItem(image: image.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(onDismissController))
        self.navigationItem.leftBarButtonItem = barItem
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    @objc func onDismissController() {
        self.navigationController?.popViewController(animated: true)
    }
}
