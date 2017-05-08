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
    var stationsRed: [(name: String, xOffset: Double, yOffset: Double, active: Bool)] = [
        ("Akademmistechko", 0.0, 0.0, false),
        ("Zhytomyrska", 9.0, 9.0, false),
        ("Sviatoshyn", 9.0, 9.0, false),
        ("Nyvky", 9.0, 9.0, false),
        ("Beresteiska", 9.0, 9.0, false),
        ("Shuliavska", 9.0, 9.0, false),
        ("Politekhnichnyi Instytut", 9.0, 9.0, false),
        ("Vokzalna", 9.0, 9.0, false),
        ("Universytet", 9.0, 9.0, false),
        ("Teatralna", 42.0, -23.0, false),
        ("Khreshchatyk", 35.0, 0.0, false),
        ("Arsenalna", 13.0, 15.0, false),
        ("Dnipro", 9.0, 9.0, false),
        ("Hidropark", 51.0, 0.0, false),
        ("Livoberezhna", 9.0, -9.0, false),
        ("Darnytsia", 9.0, -9.0, false),
        ("Chernihivska", 9.0, -9.0, false),
        ("Lisova", 9.0, -9.0, false)]
    var stationsBlue: [(name: String, xOffset: Double, yOffset: Double, active: Bool)] = [
        ("Heroiv Dnipra", 0.0, 0.0, false),
        ("Minska", 0.0, 9.0, false),
        ("Obolon", 0.0, 9.0, false),
        ("Petrivka", 0.0, 9.0, false),
        ("Tarasa Shevchenka", 0.0, 9.0, false),
        ("Kontraktova Ploshcha", 0.0, 9.0, false),
        ("Poshtova Ploshcha", 0.0, 9.0, false),
        ("Maidan Nezalezhnosti", 0.0, 18.0, false),
        ("Ploshcha Lva Tolstoho", 0.0, 54.0, false),
        ("Olimpiiska", 0.0, 16.0, false),
        ("Palats 'Ukrayina'", 0.0, 9.0, false),
        ("Lybidska", 0.0, 9.0, false),
        ("Demiivska", 0.0, 9.0, false),
        ("Holosiivska", 0.0, 9.0, false),
        ("Vasylkivska", 0.0, 9.0, false),
        ("Vystavkovyi Tsentr", 0.0, 9.0, false),
        ("Ipodrom", 0.0, 9.0, false),
        ("Teremky", 0.0, 9.0, false)]
    var stationsGreen: [(name: String, xOffset: Double, yOffset: Double, active: Bool)] = [
        ("Syrets", 0.0, 0.0, false),
        ("Dorohozhychi", 0.0, 9.0, false),
        ("Lukianivska", 0.0, 9.0, false),
        ("Zoloti Vorota", 0.0, 16.0, false),
        ("Palats Sportu", 35.0, 47.0, false),
        ("Klovska", 9.0, 9.0, false),
        ("Pecherska", 9.0, 9.0, false),
        ("Druzhby Narodiv", 9.0, 9.0, false),
        ("Vydubychi", 50.0, 9.0, false),
        ("Slavutych", 9.0, 9.0, false),
        ("Osokorky", 9.0, 9.0, false),
        ("Pozniaky", 9.0, 9.0, false),
        ("Kharkivska", 9.0, 9.0, false),
        ("Vyrlytsia", 9.0, 9.0, false),
        ("Boryspilska", 9.0, 9.0, false),
        ("Chervony Khutir", 9.0, 9.0, false)]
    
    /// Return list of all station names in alpabetical order
    func namesList() -> [String] {
        let allStations = stationsRed + stationsBlue + stationsGreen
        return allStations.map({$0.name}).sorted(by: <)
    }
    
    /// Return array with active stations
    func makeRoute(fromStation: String?, toStation: String?) -> StationsData {
        if !(fromStation == nil && toStation == nil) {
            
            var stationsDataWithRoute = StationsData()
            
            if stationsDataWithRoute.stationsRed.contains(where: {$0.name == fromStation}) {
                if stationsDataWithRoute.stationsRed.contains(where: {$0.name == toStation}) {
                    var fromStationIndex = 0
                    var toStationIndex = 0
                    for (stationIndex, stationValue) in stationsDataWithRoute.stationsRed.enumerated() {
                        if stationValue.name == fromStation {
                            fromStationIndex = stationIndex
                        } else if stationValue.name == toStation {
                            toStationIndex = stationIndex
                        }
                    }
                    
                    if fromStationIndex < toStationIndex {
                        for index in fromStationIndex...toStationIndex {
                            stationsDataWithRoute.stationsRed[index].active = true
                        }
                    } else if fromStationIndex > toStationIndex {
                        for index in toStationIndex...fromStationIndex {
                            stationsDataWithRoute.stationsRed[index].active = true
                        }
                    }
                }
            }
            
            return stationsDataWithRoute
        } else {
            return self
        }
    }
}
