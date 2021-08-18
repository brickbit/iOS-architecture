//
//  Injection.swift
//  Base
//
//  Created by Roberto on 8/8/21.
//

import UIKit
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        defaultScope = .application
        
        //Common
        #if DEBUG
            register {Develop()}.implements(EnvironmentProtocol.self)
        #else
            register {Production()}.implements(EnvironmentProtocol.self)
        #endif
        
        register {ErrorManagerImpl()}.implements(ErrorManager.self)
        register {ApiInterfaceImpl()}.implements(ApiInterface.self)
        register {NetworkDataSourceImpl()}.implements(NetworkDataSource.self)
        
        //Repositories
        register {CourseRepositoryImpl()}.implements(CourseRepository.self)
    }
}
