//
//  ClimateManager.swift
//  homeClimateApp
//
//  Created by Benjamin Davidson on 2021-04-11.
//

import Foundation

struct ClimateManager {
    
    var climateModelArray = [ClimateModel]()
    
    func loadJSON(_ path: String) -> Data? {
        
        if let path = Bundle.main.path(forResource: path, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                print("✅ Got the data from \(path): \(data)")
                return data
            } catch {
                print(error)
            }
        }
        
        print("Couldn't load the JSON")
        return nil
    }
    
    mutating func parseJSON(_ climateData: Data) -> [ClimateModel]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ClimateData.self, from: climateData)
            print("✅ Managed to decode the data")
            
            // Now make an array of each climateDataElement
            
            for element in decodedData {
                let timeStamp = element.timeStamp
                let temperature = Double(element.temperature)
                let humidity = Double(element.humidity)
                let location = element.location
                
                let climate = ClimateModel(timeStamp: timeStamp, temperature: temperature, humidity: humidity, location: location)
                
                climateModelArray.append(climate)
                
            }
            
            print("The result of the parse is:")
            for element in climateModelArray {
                print(element.output())
            }
            
            
            return climateModelArray
            
        } catch {
            print("🛑 The error parsing the JSON is: \(Error.self)")
            return nil
        }
    }
}
