//
//  DetailPresenter.swift
//  Base
//
//  Created by Roberto on 22/8/21.
//

import RxSwift
import Resolver

class DetailPresenter: BasePresenter {
    
    var disposeBag = DisposeBag()
        
    @Injected var errorManager: ErrorManager
    
    var contractor: DetailContractor
    
    typealias Contractor = DetailContractor
    
    init(contractor: DetailContractor) {
        self.contractor = contractor
    }
    
    func start() {}
    
}
