//
//  MainPResenter.swift
//  Base
//
//  Created by Roberto on 1/8/21.
//

import RxSwift
import Resolver

class MainPresenter: BasePresenter {
    
    var disposeBag = DisposeBag()
    
    @Injected var repository: CourseRepository
    
    @Injected var errorManager: ErrorManager
    
    var contractor: MainContractor
    
    typealias Contractor = MainContractor
    
    init(contractor: MainContractor) {
        self.contractor = contractor
    }
    
    func start() {
        getCourse()
    }
    
    func getCourse() {
        contractor.showProgress()

        do {
            try execute(observedValue: repository.getCourses(), onNext: { courses in
                self.contractor.onGetCourseSuccess(courses: courses.data )
            }, onError: { error in
                var errorDescription = ""
                switch error {
                case ApiError.conflict:
                    errorDescription = "Conflict error"
                case ApiError.forbidden:
                    errorDescription = "Forbidden error"
                case ApiError.notFound:
                    errorDescription = "Not found error"
                default:
                    errorDescription = "Unknown error: \(error)"
                }
                self.contractor.onGetCourseError(error: errorDescription)
                
            }, onCompleted: {
                self.contractor.hideProgress()

            }).disposed(by: disposeBag)
            } catch {
                print("Error")
            }
    }
    
}
