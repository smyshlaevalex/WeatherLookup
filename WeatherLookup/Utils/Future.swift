//
//  Future.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 15/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import Foundation

class Future<Output> {
    var didFulfill = Delegated<Output, Void>()
    
    init(_ attemptToFulfill: @escaping (@escaping (Output) -> Void) -> Void) {
        attemptToFulfill {
            self.didFulfill.call($0)
        }
    }
}
