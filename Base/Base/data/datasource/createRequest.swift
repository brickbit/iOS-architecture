//
//  createRequest.swift
//  Base
//
//  Created by Roberto on 9/8/21.
//

import RxSwift
import Alamofire

func createRequest<T: Codable> (_ urlConvertible: URLRequestConvertible) -> Observable<T> {
    return Observable<T>.create { observer in
        let request = AF.request(urlConvertible).responseDecodable(completionHandler: {(response: AFDataResponse<T>) in
            switch response.result {
            case .success(let value):
                observer.onNext(value)
                observer.onCompleted()
            case .failure(let error):
                switch response.response?.statusCode {
                case 403:
                    observer.onError(ApiError.forbidden)
                case 404:
                    observer.onError(ApiError.notFound)
                case 409:
                    observer.onError(ApiError.conflict)
                case 500:
                    observer.onError(ApiError.internalServerError)
                default:
                    observer.onError(error)
                }
            }
        })
        return Disposables.create {
            request.cancel()
        }
    }
}

