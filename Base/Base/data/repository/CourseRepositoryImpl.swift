//
//  CourseRepositoryImpl.swift
//  Base
//
//  Created by Roberto on 1/8/21.
//

import RxSwift
import Resolver

class CourseRepositoryImpl: CourseRepository {

    @Injected var network: NetworkDataSource
    
    func getCourses() throws -> Observable<ListCoursesDto>  {
        return try createRequest(network.api.getCourse())
    }
}
