//
//  Animal.swift
//  HelloiOS
//
//  Created by Christo Kumar on 19/06/22.
//

import Foundation
struct AnimalResponse: Decodable {
    let errorMessage: String
    let animals: [Animal]
    enum CodingKeys: String, CodingKey {
        case animals = "data"
        case errorMessage
    }
}
struct Animal: Decodable {
    let name: String
    let image: String
}
