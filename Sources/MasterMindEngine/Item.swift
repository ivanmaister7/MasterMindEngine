//
//  Item.swift
//  
//
//  Created by Master on 24.11.2022.
//

import Foundation
import UIKit

struct Item {
    static let ALL_AVAILABLE_COLORS: [UIColor] = [.blue, .red, .yellow, .green, .brown, .cyan, .purple, .magenta, .orange, .gray]
    
    let color: UIColor
    
    static func getAvailableColors(forCount colors: Int) -> [UIColor] {
        var result: [UIColor] = []
        for i in 0...colors {
            result.append(ALL_AVAILABLE_COLORS[i])
        }
        return result
    }
}
