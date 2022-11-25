//
//  Row.swift
//  
//
//  Created by Master on 24.11.2022.
//

import Foundation
import UIKit

protocol Row {
    var items: [Item] { get set }
}

struct RowRequest: Row {
    var items: [Item]
    
    mutating func generate(for colors: [UIColor], rowSize: Int) {
        items.removeAll()
        for _ in 0 ..< rowSize {
            items.append(ItemRequest(color: colors.randomElement() ?? .blue))
        }
    }
}

struct RowResponce: Row {
    var items: [Item]
    
    mutating func proccesRowRequest(for request: RowRequest) {
        // procces the move
    }
}
