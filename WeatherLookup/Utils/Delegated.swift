//
//  Delegated.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 15/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import Foundation

struct Delegated<Input, Output> {
    private(set) var callback: ((Input) -> Output?)?
    
    init() {}
    
    mutating func delegate<Target : AnyObject>(to target: Target,
                                                      with callback: @escaping (Target, Input) -> Output) {
        self.callback = { [weak target] input in
            guard let target = target else {
                return nil
            }
            
            return callback(target, input)
        }
    }
    
    mutating func removeDelegate() {
        self.callback = nil
    }
    
    func call(_ input: Input) -> Output? {
        return self.callback?(input)
    }
}
