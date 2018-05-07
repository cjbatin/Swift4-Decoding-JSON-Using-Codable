//
//  APIManager.swift
//  WeatherForecast
//
//  Created by Christopher Batin on 27/04/2018.
//  Copyright © 2018 Batin. All rights reserved.
//

import Foundation

class APIManager {
    let stubDataURL = "https://raw.githubusercontent.com/cjbatin/Swift4-Decoding-JSON-Using-Codable/master/WeatherForecast/StubData/londonWeather.json"

    func getWeather(completion: @escaping (_ weather: CurrentWeather?, _ error: Error?) -> Void) {
        getJSONFromURL(urlString: stubDataURL) { (data, error) in
            guard let data = data, error == nil else {
                print("Failed to get data")
                return completion(nil, error)
            }
            self.createWeatherObjectWith(json: data, completion: { (weather, error) in
                if let error = error {
                    print("Failed to convert data")
                    return completion(nil, error)
                }
                return completion(weather, nil)
            })
        }
    }

}

extension APIManager {
    private func getJSONFromURL(urlString: String, completion: @escaping (_ data: Data?, _ error: Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Error: Cannot create URL from string")
            return
        }
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            guard error == nil else {
                print("Error calling api")
                return completion(nil, error)
            }
            guard let responseData = data else {
                print("Data is nil")
                return completion(nil, error)
            }
            completion(responseData, nil)
        }
        task.resume()
    }

    private func createWeatherObjectWith(json: Data, completion: @escaping (_ data: CurrentWeather?, _ error: Error?) -> Void) {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let weather = try decoder.decode(CurrentWeather.self, from: json)
            return completion(weather, nil)
        } catch let error {
            print("Error creating current weather from JSON because: \(error.localizedDescription)")
            return completion(nil, error)
        }
    }
}
