//
//  CoursesAttributesDto.swift
//  Base
//
//  Created by Roberto on 1/8/21.
//

struct CourseAttributesDto: Codable {
    let name: String?
    let description: String?
    let artworkUrl: String?
    let difficulty: String?
    let contributor: String?
    
    private enum CodingKeys : String, CodingKey {
        case name, description, artworkUrl = "card_artwork_url", difficulty, contributor
    }
}
