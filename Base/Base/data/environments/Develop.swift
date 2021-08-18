//
//  AppEnvironment.swift
//  Base
//
//  Created by Roberto on 17/8/21.
//

class Develop: EnvironmentProtocol {

    var headers: [String: String] =
        [
            "Content-Type" : "application/json",
            "Authorization" : "Bearer yourBearerToken"
        ]
        
    var baseURL: String = "https://api.raywenderlich.com/api/contents?filter[content_types][]=collection"
    
}
