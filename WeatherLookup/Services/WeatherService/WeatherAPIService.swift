//
//  WeatherAPIService.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 15/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import Foundation

class WeatherAPIService: WeatherService {
    let session: URLSession
    let decoder: JSONDecoder
    
    init(session: URLSession = URLSession.shared,
         decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }
    
    func temperatureInCity(named name: String) -> Future<Result<WeatherData, Error>> {
        return Future { completion in
            #error("ADD API KEY")
            let apiKey = "-- YOUR API KEY --"
            
            let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(name)&units=metric&APPID=\(apiKey)")!
            self.session.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                if let data = data {
                    do {
                        let weatherData = try self.decoder.decode(WeatherData.self, from: data)
                        completion(.success(weatherData))
                    } catch {
                        completion(.failure(error))
                    }
                }
            } .resume()
        }
    }
}
