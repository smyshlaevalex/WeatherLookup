//
//  UITableViewCell+Utils.swift
//  AlarmClock
//
//  Created by Alexander on 11/30/18.
//  Copyright © 2018 Alexander Smyshlaev. All rights reserved.
//

import UIKit

extension UITableViewCell {
    func removeSeparator() {
        separatorInset.left = .greatestFiniteMagnitude
    }
}
