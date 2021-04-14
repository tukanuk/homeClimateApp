//
//  ClimateModel.swift
//  homeClimateApp
//
//  Created by Benjamin Davidson on 2021-04-13.
//

import Foundation

struct ClimateModel {
    var timeStamp : Date
    var temperature : Double
    var humidity : Double
    var location : String
    
    func output() -> String {
        let result = "\(timeStamp): \(temperature)C, \(humidity)% in the \(location)"
        return result
    }
}
