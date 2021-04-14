//
//  ClimateModelList.swift
//  homeClimateApp
//
//  Created by Benjamin Davidson on 2021-04-14.
//

import Foundation

struct ClimateModelList {
    
    var climateModelArray = [ClimateModel]()
    
    mutating func add(climateModel : ClimateModel) {
        climateModelArray.append(climateModel)
    }
    
    func avgTemperature() -> Double {
        // Find the average temperature of the data points
        
        var sum : Double = 0
        
        for element in climateModelArray {
            sum += element.temperature
        }
        
        let avg = sum / Double(climateModelArray.count)
        
        return avg
    }
    
    func avgTemperature(room: String) -> Float {
    // Find the average temperature of a particular room
        
        return 1.0
    }
    
}
