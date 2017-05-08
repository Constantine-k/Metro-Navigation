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
        ("Khreshchatyk", 35.0, 0.0),
        ("Arsenalna", 13.0, 15.0),
        ("Dnipro", 9.0, 9.0),
        ("Hidropark", 51.0, 0.0),
        ("Livoberezhna", 9.0, -9.0),
        ("Darnytsia", 9.0, -9.0),
        ("Chernihivska", 9.0, -9.0),
        ("Lisova", 9.0, -9.0)]
    let stationsBlue: [(name: String, xOffset: Double, yOffset: Double)] = [
        ("Heroiv Dnipra", 0.0, 0.0),
        ("Minska", 0.0, 9.0),
        ("Obolon", 0.0, 9.0),
        ("Petrivka", 0.0, 9.0),
        ("Tarasa Shevchenka", 0.0, 9.0),
        ("Kontraktova Ploshcha", 0.0, 9.0),
        ("Poshtova Ploshcha", 0.0, 9.0),
        ("Maidan Nezalezhnosti", 0.0, 18.0),
        ("Ploshcha Lva Tolstoho", 0.0, 54.0),
        ("Olimpiiska", 0.0, 16.0),
        ("Palats 'Ukrayina'", 0.0, 9.0),
        ("Lybidska", 0.0, 9.0),
        ("Demiivska", 0.0, 9.0),
        ("Holosiivska", 0.0, 9.0),
        ("Vasylkivska", 0.0, 9.0),
        ("Vystavkovyi Tsentr", 0.0, 9.0),
        ("Ipodrom", 0.0, 9.0),
        ("Teremky", 0.0, 9.0)]
    let stationsGreen: [(name: String, xOffset: Double, yOffset: Double)] = [
        ("Syrets", 0.0, 0.0),
        ("Dorohozhychi", 0.0, 9.0),
        ("Lukianivska", 0.0, 9.0),
        ("Zoloti Vorota", 0.0, 16.0),
        ("Palats Sportu", 35.0, 47.0),
        ("Klovska", 9.0, 9.0),
        ("Pecherska", 9.0, 9.0),
        ("Druzhby Narodiv", 9.0, 9.0),
        ("Vydubychi", 50.0, 9.0),
        ("Slavutych", 9.0, 9.0),
        ("Osokorky", 9.0, 9.0),
        ("Pozniaky", 9.0, 9.0),
        ("Kharkivska", 9.0, 9.0),
        ("Vyrlytsia", 9.0, 9.0),
        ("Boryspilska", 9.0, 9.0),
        ("Chervony Khutir", 9.0, 9.0)]
    
    /// Return list of all station names in alpabetical order
    func namesList() -> [String] {
        let allStations = stationsRed + stationsBlue + stationsGreen
        return allStations.map({$0.name}).sorted(by: <)
    }
}
