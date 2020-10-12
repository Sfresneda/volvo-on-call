//
//  TrimGroup.swift
//  Volvo on Call
//
//  Created by Sergio Fresneda on 10/12/20.
//

import Foundation

struct TrimGroup: Decodable {
    var title: String
    var description: String
    var images: [URL]?
}
