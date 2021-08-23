//
//  Navigation.swift
//  Base
//
//  Created by Roberto on 2/8/21.
//

import UIKit

func navigateToDetailController(_ viewController: UIViewController, course: CourseAttributesDto) {
    let detailController = DetailController()
    detailController.modalPresentationStyle = .fullScreen
    detailController.course = course
    viewController.present(detailController, animated: true, completion: nil)
}
