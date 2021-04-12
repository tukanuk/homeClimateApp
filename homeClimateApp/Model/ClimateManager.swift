//
//  ClimateManager.swift
//  homeClimateApp
//
//  Created by Benjamin Davidson on 2021-04-11.
//

import Foundation

struct ClimateManager {
    
    let climateData = ClimateData(timeStamp: Date.init(), temperature: 20.0, humidity: 50.0, location: ClimateLocation(name: "Office", latitude: 42.3141, longitude: -83.0592))
}
