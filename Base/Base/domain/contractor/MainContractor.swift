//
//  MainContractor.swift
//  Base
//
//  Created by Roberto on 1/8/21.
//

protocol MainContractor: BaseContractor {
    
    func onGetCourseSuccess(courses: [CourseDto?])
    
    func onGetCourseError(error: String)
}
