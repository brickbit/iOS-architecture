//
//  BasePesenter.swift
//  Base
//
//  Created by Roberto on 1/8/21.
//

import RxSwift

public protocol BasePresenter {
    
    associatedtype Contractor

    var contractor: Contractor { get set }
    
    var errorManager: ErrorManager { get set }
    
    var disposeBag: DisposeBag { get set }

    func start()
        
    func execute<T>(observedValue: Observable<T>,
                           onNext: @escaping ((T) -> Void),
                           onError: @escaping ((Error) -> Void),
                           onCompleted: @escaping (() -> Void)) -> Disposable

}

extension BasePresenter {
    func execute<T>(observedValue: Observable<T>,
                           onNext: @escaping ((T) -> Void),
                           onError: @escaping ((Error) -> Void),
                           onCompleted: @escaping (() -> Void)) -> Disposable {
        let observable = observedValue.observe(on: MainScheduler.instance)
        
        let compositeDisposable = CompositeDisposable()
        
        let disposable: Disposable = observable.subscribe(
            onNext: onNext,
            onError: onError,
            onCompleted: onCompleted
        )
        
        let _ = compositeDisposable.insert(disposable)
        
        return disposable
    }
}
