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
    
    func getCourses() -> Observable<ListCoursesDto>?  {
        if let url = network.api.getCourse() {
            return createRequest(url)
        } else {
            return nil
        }
    }
}
