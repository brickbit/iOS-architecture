//
//  MainController.swift
//  Base
//
//  Created by Roberto on 22/8/21.
//

import UIKit
import Resolver

class MainController: UIViewController, BaseController, MainContractor, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Outlets
    
    @IBOutlet weak var courseTable: UITableView!

    // MARK: - Attributes
    
    var progress = UIActivityIndicatorView()
    
    var dialog = UIAlertController()
    
    var presenter: MainPresenter?
    
    typealias Presenter = MainPresenter
        
    var courseList: [CourseAttributesDto] = []
    
    var courseImages: [UIImage] = []
    
    // MARK: - Base methods
    
    func initializeUI() {
        self.title = "Base project"
        courseTable.delegate = self
        courseTable.dataSource = self
        
        let cell = UINib(nibName: "CourseViewCell", bundle: nil)
        courseTable.register(cell, forCellReuseIdentifier: "CourseViewCell")
    }
    
    func registerListeners() {}
    
    // MARK: -Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBase()
        presenter = MainPresenter(contractor: self)
        presenter?.start()
    }
    
    // MARK: - Contractor methods
    
    func onGetCourseSuccess(courses: [CourseDto?]) {
        //print(courses)
        let _ = courses.map{ item in
            courseList.append(item!.attributes!)
            guard let artworkUrl = item?.attributes?.artworkUrl else { return }
            guard let data = try? Data(contentsOf: artworkUrl.asURL()) else { return }
            guard let image = UIImage(data: data) else { return }
            courseImages.append(image)
                    
        }
        courseTable.reloadData()
    }
    
    func onGetCourseError(error: String) {
        print("Se ha producido un error")
    }
    
    // MARK: - TableView methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseViewCell", for: indexPath) as! CourseViewCell

        cell.titleCourseLabel.text = courseList[indexPath.row].name
        cell.subtitleCourseLabel.attributedText = courseList[indexPath.row].description?.htmlString
        cell.imageView?.image = courseImages[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let detailController = DetailController()
        detailController.course = courseList[indexPath.row]
        navigationController?.pushViewController(detailController, animated: true)

        //navigateToDetailController(self, course: courseList[indexPath.row])
    }
}
