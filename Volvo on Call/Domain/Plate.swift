//
//  Plate.swift
//  Volvo on Call
//
//  Created by Sergio Fresneda on 10/12/20.
//

import Foundation

fileprivate let k_plateLettersFilter = ["a", "e", "i", "o", "u"]
fileprivate let k_minElementsCount = 1
fileprivate let k_maxElementsCount = 4

fileprivate let k_rangeLowNumber = 0
fileprivate let k_rangeHighNumber = 9

fileprivate let k_minPlateNumber = 0
fileprivate let k_maxPlateNumber = 9999

struct Plate: Decodable {
    private var identificationNumber: Int!
    private var identificationLetters: String!
    
    init(numbers: [Int], letters: [String]) throws {
        guard !numbers.isEmpty, !letters.isEmpty else {
            fatalError("Not valid plate identifiers: \(String(describing: numbers)) - \(String(describing: letters))")
        }
        
        let identificationNumber = try self.validateNumbers(numbers)
        let identificationLetters = try self.validateLetters(letters)
        
        self.identificationNumber = identificationNumber
        self.identificationLetters = identificationLetters
    }
    
    // MARK: - Getter
    var getESStringPlate: String {
        return self.identificationLetters + String(self.identificationNumber)
    }
    
    // MARK: - Validators
    private func validateNumbers(_ numbers: [Int]) throws -> Int {
        guard k_minElementsCount <= numbers.count, k_maxElementsCount >= numbers.count else {
            throw DomainError.invalidPlate(message: "Plate numbers should be between 1-4 elements")
        }
        
        guard !numbers.filter({ k_rangeLowNumber <= $0 && k_rangeHighNumber >= $0  }).isEmpty else {
            throw DomainError.invalidPlate(message: "Plate numbers should be between 0-9")
        }
        
        guard let identificationNumber = Int(numbers.map({ String($0) }).joined()),
              k_minPlateNumber <= identificationNumber, k_maxPlateNumber >= identificationNumber else {
            throw DomainError.invalidPlate(message: "Plate number joined should be between 0000 - 9999")
        }
        
        return identificationNumber
    }
    
    private func validateLetters(_ letters: [String]) throws -> String {
        guard k_minElementsCount <= letters.count, k_maxElementsCount >= letters.count else {
            throw DomainError.invalidPlate(message: "Plate letters should contain between 1-3 elements")
        }
        
        guard letters.map({ $0.lowercased() }).allSatisfy({ k_plateLettersFilter.contains($0)}) else {
            throw DomainError.invalidPlate(message: "Plate letters shouldn't contain any of this characters: \(String(describing: k_plateLettersFilter))")
        }
        
        return letters.joined()
    }
}
