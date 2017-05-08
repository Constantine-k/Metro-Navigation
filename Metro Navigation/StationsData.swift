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
        ("Akademmistechko", 0.0, 0.0),
        ("Zhytomyrska", 9.0, 9.0),
        ("Sviatoshyn", 9.0, 9.0),
        ("Nyvky", 9.0, 9.0),
        ("Beresteiska", 9.0, 9.0),
        ("Shuliavska", 9.0, 9.0),
        ("Politekhnichnyi Instytut", 9.0, 9.0),
        ("Vokzalna", 9.0, 9.0),
        ("Universytet", 9.0, 9.0),
        ("Teatralna", 42.0, -23.0),
        ("Khreshchatyk", 32.0, 0.0),
        ("Arsenalna", 13.0, 15.0),
        ("Dnipro", 9.0, 9.0),
        ("Hidropark", 51.0, 0.0),
        ("Livoberezhna", 9.0, -9.0),
        ("Darnytsia", 9.0, -9.0),
        ("Chernihivska", 9.0, -9.0),
        ("Lisova", 9.0, -9.0)]
    let stationsBlue: [(name: String, xOffset: Double, yOffset: Double)] = [
        ("Heroiv Dnipra", 0.0, 0.0),
        ("Minska", 20.0, 0.0),
        ("Obolon", 20.0, 0.0)]
    let stationsGreen: [(name: String, xOffset: Double, yOffset: Double)] = [
        ("Syrets", 0.0, 0.0),
        ("Dorohozhychi", 20.0, 0.0),
        ("Lukianivska", 20.0, 0.0)]
    
    /// Return list of all station names in alpabetical order
    func namesList() -> [String] {
        let allStations = stationsRed + stationsBlue + stationsGreen
        return allStations.map({$0.name}).sorted(by: <)
    }
}
