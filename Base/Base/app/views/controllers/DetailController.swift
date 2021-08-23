//
//  DetailController.swift
//  Base
//
//  Created by Roberto on 22/8/21.
//

import UIKit
import Resolver

class DetailController: UIViewController, BaseController, DetailContractor {
    
    @IBOutlet weak var courseImageView: UIImageView!
    @IBOutlet weak var courseTitleLabel: UILabel!
    @IBOutlet weak var courseDescriptionLabel: UITextView!
    @IBOutlet weak var courseLevelLabel: UILabel!
    @IBOutlet weak var courseAuthorLabel: UILabel!
    
    // MARK: - Attributes
    
    var progress = UIActivityIndicatorView()
    
    var dialog = UIAlertController()
    
    var presenter: DetailPresenter?
    
    typealias Presenter = DetailPresenter
    
    var course: CourseAttributesDto? = nil
            
    // MARK: - Base methods
    
    func initializeUI() {
        self.title = "Details"
        
        courseTitleLabel.text = course?.name
        courseDescriptionLabel.attributedText = course?.description?.htmlString
        courseLevelLabel.text = course?.difficulty
        courseAuthorLabel.text = course?.contributor
        
        guard let artworkUrl = course?.artworkUrl else{ return }
        guard let data = try? Data(contentsOf: artworkUrl.asURL()) else { return }
        let image = UIImage(data: data)
        courseImageView.image = image
            
        
    }
    
    func registerListeners() {}
    
    // MARK: -Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBase()
        presenter = DetailPresenter(contractor: self)
        presenter?.start()
    }
}
