//
//  Either.swift
//  Base
//
//  Created by Roberto on 31/7/21.
//

import Foundation

class Either<L, R> {
    class Left<L, R> : Either<L, R> {
        
        let error: L
        
        public var description: String { return "Left \(error)" }

        init(error: L) {
            self.error = error
        }
    }
    
    class Right<L, R> : Either<L, R> {
        
        let success: R
        
        public var description: String { return "Right \(success)" }

        init(success: R) {
            self.success = success
        }
    }
    
    func fold(error:(L) -> Void, success: (R) -> Void) {
        if (self is Left) {
            let result = (self as! Either<L, R>.Left<L, R>).error
            let _ = error(result)
        } else if (self is Right) {
            let result = (self as! Either<L, R>.Right<L,R>).success
            let _ = success(result)
        }
    }
}

