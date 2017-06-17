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
    
    /// Return list of all station names in alphabetical order
    func namesList() -> [String] {
        let allStations = stationsRed + stationsBlue + stationsGreen
        return allStations.map({$0.name}).sorted(by: <)
    }
    
    struct stationTransitions {
        static let redToBlue = "Khreshchatyk"
        static let redToGreen = "Teatralna"
        static let blueToRed = "Maidan Nezalezhnosti"
        static let blueToGreen = "Ploshcha Lva Tolstoho"
        static let greenToRed = "Zoloti Vorota"
        static let greenToBlue = "Palats Sportu"
    }
    
    /// Return array with active stations
    func makeRoute(fromStation: String?, toStation: String?) -> StationsData {
        if fromStation != nil && toStation != nil && fromStation != toStation {
            
            var stationsDataWithRoute = StationsData()
            
            /// Return array with marked active stations
            func markAsActive(fromStationName: String, toStationName: String, onLine metroLine: [(name: String, xOffset: Double, yOffset: Double, active: Bool)]) -> [(name: String, xOffset: Double, yOffset: Double, active: Bool)] {
                var fromStationIndex = 0
                var toStationIndex = 0
                for (stationIndex, stationValue) in metroLine.enumerated() {
                    if stationValue.name == fromStationName {
                        fromStationIndex = stationIndex
                    } else if stationValue.name == toStationName {
                        toStationIndex = stationIndex
                    }
                }
                
                var metroLineCopy = metroLine
                
                if fromStationIndex < toStationIndex {
                    for index in fromStationIndex...toStationIndex {
                        metroLineCopy[index].active = true
                    }
                } else if fromStationIndex > toStationIndex {
                    for index in toStationIndex...fromStationIndex {
                        metroLineCopy[index].active = true
                    }
                }
                
                return metroLineCopy
            }
            
            
            
            if stationsDataWithRoute.stationsRed.contains(where: {$0.name == fromStation!}) {
                if stationsDataWithRoute.stationsRed.contains(where: {$0.name == toStation!}) {
                    stationsDataWithRoute.stationsRed = markAsActive(fromStationName: fromStation!, toStationName: toStation!, onLine: stationsDataWithRoute.stationsRed)
                } else if stationsDataWithRoute.stationsBlue.contains(where: {$0.name == toStation!}) {
                    stationsDataWithRoute.stationsRed = markAsActive(fromStationName: fromStation!, toStationName: stationTransitions.redToBlue, onLine: stationsDataWithRoute.stationsRed)
                    stationsDataWithRoute.stationsBlue = markAsActive(fromStationName: stationTransitions.blueToRed, toStationName: toStation!, onLine: stationsDataWithRoute.stationsBlue)
                } else if stationsDataWithRoute.stationsGreen.contains(where: {$0.name == toStation!}) {
                    stationsDataWithRoute.stationsRed = markAsActive(fromStationName: fromStation!, toStationName: stationTransitions.redToGreen, onLine: stationsDataWithRoute.stationsRed)
                    stationsDataWithRoute.stationsGreen = markAsActive(fromStationName: stationTransitions.greenToRed, toStationName: toStation!, onLine: stationsDataWithRoute.stationsGreen)
                }
            } else if stationsDataWithRoute.stationsBlue.contains(where: {$0.name == fromStation!}) {
                if stationsDataWithRoute.stationsBlue.contains(where: {$0.name == toStation!}) {
                    stationsDataWithRoute.stationsBlue = markAsActive(fromStationName: fromStation!, toStationName: toStation!, onLine: stationsDataWithRoute.stationsBlue)
                } else if stationsDataWithRoute.stationsRed.contains(where: {$0.name == toStation!}) {
                    stationsDataWithRoute.stationsBlue = markAsActive(fromStationName: fromStation!, toStationName: stationTransitions.blueToRed, onLine: stationsDataWithRoute.stationsBlue)
                    stationsDataWithRoute.stationsRed = markAsActive(fromStationName: stationTransitions.redToBlue, toStationName: toStation!, onLine: stationsDataWithRoute.stationsRed)
                } else if stationsDataWithRoute.stationsGreen.contains(where: {$0.name == toStation!}) {
                    stationsDataWithRoute.stationsBlue = markAsActive(fromStationName: fromStation!, toStationName: stationTransitions.blueToGreen, onLine: stationsDataWithRoute.stationsBlue)
                    stationsDataWithRoute.stationsGreen = markAsActive(fromStationName: stationTransitions.greenToBlue, toStationName: toStation!, onLine: stationsDataWithRoute.stationsGreen)
                }
            } else if stationsDataWithRoute.stationsGreen.contains(where: {$0.name == fromStation!}) {
                if stationsDataWithRoute.stationsGreen.contains(where: {$0.name == toStation!}) {
                    stationsDataWithRoute.stationsGreen = markAsActive(fromStationName: fromStation!, toStationName: toStation!, onLine: stationsDataWithRoute.stationsGreen)
                } else if stationsDataWithRoute.stationsRed.contains(where: {$0.name == toStation!}) {
                    stationsDataWithRoute.stationsGreen = markAsActive(fromStationName: fromStation!, toStationName: stationTransitions.greenToRed, onLine: stationsDataWithRoute.stationsGreen)
                    stationsDataWithRoute.stationsRed = markAsActive(fromStationName: stationTransitions.redToGreen, toStationName: toStation!, onLine: stationsDataWithRoute.stationsRed)
                } else if stationsDataWithRoute.stationsBlue.contains(where: {$0.name == toStation!}) {
                    stationsDataWithRoute.stationsGreen = markAsActive(fromStationName: fromStation!, toStationName: stationTransitions.greenToBlue, onLine: stationsDataWithRoute.stationsGreen)
                    stationsDataWithRoute.stationsBlue = markAsActive(fromStationName: stationTransitions.blueToGreen, toStationName: toStation!, onLine: stationsDataWithRoute.stationsBlue)
                }
            }
            
            return stationsDataWithRoute
        } else {
            return self
        }
    }
}
