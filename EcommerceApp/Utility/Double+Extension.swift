//
//  String+Extension.swift
//  EcommerceApp
//
//  Created by Tushar Jaunjalkar on 03/07/23.
//

import Foundation

extension Double {
    /// stringValue
    var stringValue: String {
        return "$\(String(format: "%.2f", self))"
    }
}
