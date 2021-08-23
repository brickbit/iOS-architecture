//
//  ApiRouter.swift
//  Base
//
//  Created by Roberto on 5/8/21.
//

import Foundation
import Resolver
import Alamofire

class ApiInterfaceImpl: ApiInterface {

    @Injected var environment: EnvironmentProtocol
    
    func getCourse()-> URLRequest? {
        let api = ApiRequest.getCourse
        var url = try? URLRequest(url: path(api: api).asURL())
        url?.httpMethod = method(api: api).rawValue
        let headers = environment.headers
        let _ = headers.map { header in
            url?.setValue(header.key, forHTTPHeaderField: header.value)
        }
        let encoding = encoding(method: method(api: api))
        
        if let url = url {
            return try? encoding.encode(url, with: nil)
        } else {
            return nil
        }
    }
    

    
}

