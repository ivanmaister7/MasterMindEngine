//
//  Item.swift
//  
//
//  Created by Master on 24.11.2022.
//

import Foundation
import UIKit

protocol Item {
    static var ALL_AVAILABLE_COLORS: [ UIColor] { get }
    var color: UIColor { get set}
    static func getAvailableColors(forCount colors: Int) -> [UIColor]
}

struct ItemRequest: Item, Equatable {
    static let ALL_AVAILABLE_COLORS: [UIColor] = [.blue, .red, .yellow, .green, .brown, .cyan, .purple, .magenta, .orange, .gray]

    var color: UIColor
    
    static func getAvailableColors(forCount colors: Int) -> [UIColor] {
        var result: [UIColor] = []
        for i in 0 ..< colors {
            result.append(ALL_AVAILABLE_COLORS[i])
        }
        return result
    }
}

struct ItemResponce: Item, Equatable {
    static let ALL_AVAILABLE_COLORS: [UIColor] = [.black, .white]

    var color: UIColor
    
    static func getAvailableColors(forCount colors: Int) -> [UIColor] {
        ALL_AVAILABLE_COLORS
    }
}
