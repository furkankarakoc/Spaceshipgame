//
//  Station.swift
//  a862805181fc4fe9e9a7d51a9b92b170
//
//  Created by furkan on 11.05.2022.
//

import Foundation

struct Station: Decodable {
    let name: String
    let coordinateX: Double
    let coordinateY: Double
    let capacity: Int
    var stock: Int
    var need: Int
    var favorite: Bool?
    //var eus: Int?
}

struct CardInfo: Decodable {
    let name: String
    let eus: Int
}
