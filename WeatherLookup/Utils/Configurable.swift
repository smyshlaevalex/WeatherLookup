//
//  Configurable.swift
//  AlarmClock
//
//  Created by Alexander on 11/30/18.
//  Copyright © 2018 Alexander Smyshlaev. All rights reserved.
//

import Foundation

protocol Configurable {
    associatedtype Item
    
    func configure(with item: Item)
}
