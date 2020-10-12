//
//  DomainWrappers.swift
//  Volvo on Call
//
//  Created by Sergio Fresneda on 10/12/20.
//

import Foundation

enum DomainError: Error {
    case invalidPlate(message: String?)
    case invalidCar(message: String?)
    case invalidTrim(message: String?)
}
