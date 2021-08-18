//
//  EnvironmentProtocol.swift
//  Base
//
//  Created by Roberto on 17/8/21.
//

protocol EnvironmentProtocol {
    
    var headers: [String: String] { get }
    
    var baseURL: String { get }
}
