//
//  ViewController.swift
//  Base
//
//  Created by Roberto on 31/7/21.
//

import UIKit
import Resolver

class MainController: UIViewController, BaseController, MainContractor {
    
    var progress = UIActivityIndicatorView()
    
    var dialog = UIAlertController()
    
    var presenter: MainPresenter?
    
    typealias Presenter = MainPresenter
        
    func initializeUI() {}
    
    func registerListeners() {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBase()
        presenter = MainPresenter(contractor: self)
        presenter?.start()
    }
    
    func onGetCourseSuccess(courses: [CourseDto?]) {
        print(courses)
    }
    
    func onGetCourseError(error: String) {
        print("Se ha producido un error")
    }
}



