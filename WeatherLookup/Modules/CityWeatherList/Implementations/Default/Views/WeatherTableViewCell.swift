//
//  WeatherTableViewCell.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 15/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell, Configurable {
    struct Item {
        let cityName: String
        let weatherData: WeatherData?
    }
    
    private lazy var cityLabel: UILabel = makeView {
        $0.font = .preferredFont(forTextStyle: .title1)
    }
    
    private lazy var temperatureLabel: UILabel = makeView {
        $0.font = .preferredFont(forTextStyle: .footnote)
        $0.textColor = .gray
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cityLabel)
        cityLabel.frame.origin = CGPoint(x: separatorInset.left,
                                         y: 8)
        
        contentView.addSubview(temperatureLabel)
        temperatureLabel.frame.origin.x = separatorInset.left
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        temperatureLabel.frame.origin.y = contentView.bounds.height - temperatureLabel.bounds.height - 8
    }
    
    func configure(with item: Item) {
        cityLabel.text = item.cityName
        cityLabel.sizeToFit()
        
        if let weatherData = item.weatherData {
            temperatureLabel.text = "\(weatherData.temperature) C˚"
        } else {
            temperatureLabel.text = "-- C˚"
        }
        
        temperatureLabel.sizeToFit()
    }
}
