//
//  CourseRepository.swift
//  Base
//
//  Created by Roberto on 1/8/21.
//

import RxSwift

protocol CourseRepository {
    func getCourses() -> Observable<ListCoursesDto>?
}
