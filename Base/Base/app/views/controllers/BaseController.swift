//
//  BaseControllerProtocol.swift
//  Base
//
//  Created by Roberto on 8/8/21.
//

import UIKit

public protocol BaseController: UIViewController, BaseContractor {
    
    var progress: UIActivityIndicatorView { get set }
    
    var dialog: UIAlertController { get set }
    
    associatedtype Presenter: BasePresenter
    
    var presenter: Presenter? { get set }
        
    func initBase()
    
    func initializeUI()
    
    func registerListeners()
    
    func configureProgress()
            
}

extension BaseController {
    
    var progress: UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }
    
    var dialog: UIAlertController {
        return UIAlertController()
    }
    
    func initBase() {
        configureProgress()
        initializeUI()
        registerListeners()
    }
    
    func configureProgress() {
        progress.center.x = UIScreen.main.bounds.width / 2
        progress.center.y = UIScreen.main.bounds.height / 2
        progress.style = .medium
        view.addSubview(progress)
    }
    
    func showProgress() {
        progress.startAnimating()
    }
    
    func hideProgress() {
        progress.stopAnimating()
    }
    
    func showError(error: String) {
        dialog.message = error
        dialog.title = "Error"
        let dialogAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        dialog.addAction(dialogAction)
        self.present(dialog, animated: true, completion: nil)
    }
    
    func showMessage(message: String) {
        dialog.message = message
        dialog.title = "Información"
        let dialogAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        dialog.addAction(dialogAction)
        self.present(dialog, animated: true, completion: nil)
    }
}
