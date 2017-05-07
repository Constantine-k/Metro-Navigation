//
//  StationsData.swift
//  Metro Navigation
//
//  Created by Konstantin Konstantinov on 5/7/17.
//  Copyright © 2017 Konstantin Konstantinov. All rights reserved.
//

import Foundation

struct StationsData {
    // Stations list arrays
    let stationsRed: [(name: String, xOffset: Double, yOffset: Double)] = [
        ("Akademmistechko", 10.0, 0.0),
        ("Zhytomyrska", 10.0, 0.0),
        ("Sviatoshyn", 10.0, 0.0)]
    let stationsBlue: [(name: String, xOffset: Double, yOffset: Double)] = [
        ("Heroiv Dnipra", 10.0, 0.0),
        ("Minska", 10.0, 0.0),
        ("Obolon", 10.0, 0.0)]
    let stationsGreen: [(name: String, xOffset: Double, yOffset: Double)] = [
        ("Syrets", 10.0, 0.0),
        ("Dorohozhychi", 10.0, 0.0),
        ("Lukianivska", 10.0, 0.0)]
    
    /// Return list of all station names in alpabetical order
    func namesList() -> [String] {
        let allStations = stationsRed + stationsBlue + stationsGreen
        return allStations.map({$0.name}).sorted(by: <)
    }
}
