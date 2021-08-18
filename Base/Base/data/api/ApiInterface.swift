//
//  ApiInterface.swift
//  Base
//
//  Created by Roberto on 9/8/21.
//

import Alamofire
import Foundation

protocol ApiInterface {
    
    var environment : EnvironmentProtocol { get }
        
    func method(api: ApiRequest)-> RequestMethod
    
    func path(api: ApiRequest) -> String
    
    func parameters(api: ApiRequest) -> [String : Any]
    
    func encoding(method: RequestMethod) -> ParameterEncoding
    
    func getCourse() throws -> URLRequest 

}

extension ApiInterface {
    func method(api: ApiRequest)-> RequestMethod {
        switch api {
        case .getCourse:
            return RequestMethod.get
        }
    }
    
    func path(api: ApiRequest) -> String {
        switch api {
        case .getCourse:
            return environment.baseURL + "" //llevar a constants las URL
        }
    }
    
    func parameters(api: ApiRequest) -> [String : Any] {
        switch api {
        case .getCourse:
            return [:]
        }
    }
    
    func encoding(method: RequestMethod) -> ParameterEncoding {
        let encoding: ParameterEncoding = {
            switch method {
            case RequestMethod.get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        return encoding
    }
}
