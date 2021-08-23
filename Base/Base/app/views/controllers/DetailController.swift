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
    @IBOutlet weak var viewCourseButton: UIButton!
    
    // MARK: - Attributes
    
    var progress = UIActivityIndicatorView()
    
    var dialog = UIAlertController()
    
    var presenter: DetailPresenter?
    
    typealias Presenter = DetailPresenter
    
    var course: CourseDto? = nil
            
    // MARK: - Base methods
    
    func initializeUI() {
        self.title = "Details"
        
        courseTitleLabel.text = course?.attributes?.name
        courseDescriptionLabel.attributedText = course?.attributes?.description?.htmlString
        courseLevelLabel.text = course?.attributes?.difficulty?.uppercased()
        courseAuthorLabel.text = course?.attributes?.contributor
        
        guard let artworkUrl = course?.attributes?.artworkUrl else{ return }
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
    
    //MARK: - Actions
    @IBAction func onViewCourseClicked(_ sender: Any) {
        let path = "https://raywenderlich.com/\(course?.courseId ?? "")"
        if let url = URL(string: path ) {
            UIApplication.shared.open(url)
        }
    }
}
