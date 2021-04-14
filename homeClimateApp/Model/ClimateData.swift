//
//  ClimateData.swift
//  homeClimateApp
//
//  Created by Benjamin Davidson on 2021-04-11.
//

import Foundation

struct ClimateDataElement : Decodable {
        let timeStamp : String
        let temperature : Float
        let humidity : Float
        let location : String
}

typealias ClimateData = [ClimateDataElement]
