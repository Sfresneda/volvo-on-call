//
//  Car.swift
//  Volvo on Call
//
//  Created by Sergio Fresneda on 10/12/20.
//

import Foundation

struct Car: Decodable {
    var identifier: UUID
    var title: String
    var carModelYear: Int
    var slug: String
    var isRechargable: Bool
    var trim: TrimGroup
    var associatedPlate: Plate?
}
