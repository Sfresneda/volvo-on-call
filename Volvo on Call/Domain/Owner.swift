//
//  Owner.swift
//  Volvo on Call
//
//  Created by Sergio Fresneda on 10/12/20.
//

import Foundation

struct Owner: Decodable {
    var name: String
    var lastName: String
    var cars: [Car]?
}
