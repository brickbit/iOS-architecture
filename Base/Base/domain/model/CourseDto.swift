//
//  CourseDto.swift
//  Base
//
//  Created by Roberto on 1/8/21.
//

public struct CourseDto: Codable {
    let courseId: String?
    let attributes: CourseAttributesDto?
    
    private enum CodingKeys : String, CodingKey {
        case courseId = "id", attributes
    }
}
