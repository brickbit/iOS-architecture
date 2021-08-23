//
//  Navigation.swift
//  Base
//
//  Created by Roberto on 2/8/21.
//

import UIKit

func navigateToDetailController(_ navigationController: UINavigationController?, course: CourseDto) {
    let detailController = DetailController()
    detailController.course = course
    navigationController?.pushViewController(detailController, animated: true)
}
