//
//  WeatherDetails.swift
//  WeatherForecast
//
//  Created by Batin, Christopher on 13/04/2018.
//  Copyright © 2018 Batin. All rights reserved.
//

struct WeatherDetails: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
