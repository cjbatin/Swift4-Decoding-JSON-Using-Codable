//
//  Sys.swift
//  WeatherForecast
//
//  Created by Batin, Christopher on 13/04/2018.
//  Copyright © 2018 Batin. All rights reserved.
//

struct Sys: Codable {
    let type: Int
    let id: Int
    let message: Double
    let country: String
    let sunrise: Int
    let sunset: Int
}
