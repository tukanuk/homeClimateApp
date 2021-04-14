//
//  ClimateManager.swift
//  homeClimateApp
//
//  Created by Benjamin Davidson on 2021-04-11.
//

import Foundation

struct ClimateManager {
    
    let climateModelArray = [ClimateModel]()
    
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
    
    func parseJSON(_ climateData: Data) -> ClimateModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ClimateData.self, from: climateData)
            print("✅ Managed to decode the data")
            let timeStamp = decodedData[0].timeStamp
            let temperature = Double(decodedData[0].temperature)
            let humidity = Double(decodedData[0].humidity)
            let location = decodedData[0].location
            
            let climate = ClimateModel(timeStamp: timeStamp, temperature: temperature, humidity: humidity, location: location)
            
            print("The result of the parse is:")
            print(climate.output())
            
            return climate
            
        } catch {
            print("🛑 The error parsing the JSON is: \(Error.self)")
            return nil
        }
    }
}
