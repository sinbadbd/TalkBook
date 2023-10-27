//
//  String+Unit.swift
//  MovieZoo
//
//  Created by Imran on 5/9/23.
//

import Foundation

extension String {
    func convertNumberToSwiftFormats(_ number: Int) -> (String, String, String) {
        let million = Double(number) / 1_000_000
        let billion = Double(number) / 1_000_000_000
        let thousand = Double(number) / 1_000
        
        let millionString = String(format: "%.2f", million) + " million"
        let billionString = String(format: "%.4f", billion) + " billion"
        let thousandString = String(format: "%.2f", thousand) + " thousand"
        
        return (millionString, billionString, thousandString)
    }

    // Example usage:
//    let number = 429800000
//    let (million, billion, thousand) = convertNumberToSwiftFormats(number)
//
//    print("\(number) is equal to \(million), \(billion), and \(thousand)")

}
