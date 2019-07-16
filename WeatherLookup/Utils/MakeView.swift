//
//  MakeView.swift
//  WeatherLookup
//
//  Created by Alexander on 15/07/2019.
//  Copyright © 2019 Alexander. All rights reserved.
//

import UIKit

func makeView<View: UIView>(_ view: View = View(), useAutoresizingMask: Bool = true, _ block: ((View) -> Void)? = nil) -> View {
    view.translatesAutoresizingMaskIntoConstraints = useAutoresizingMask
    
    block?(view)
    
    return view
}
