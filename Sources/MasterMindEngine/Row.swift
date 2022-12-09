//
//  Row.swift
//  
//
//  Created by Master on 24.11.2022.
//

import Foundation
import UIKit

protocol Row: Equatable {
    var items: [Item] { get set }
    init(items: [Item])
}

public struct RowRequest: Row {
    public static func == (lhs: RowRequest, rhs: RowRequest) -> Bool {
        lhs.items.map{ $0.color } == rhs.items.map{ $0.color }
    }
    
    var items: [Item]
    
    public init(items: [Item]) {
        self.items = items
    }
    
    mutating func generate(for colors: [UIColor], rowSize: Int) {
        items.removeAll()
        for _ in 0 ..< rowSize {
            items.append(ItemRequest(color: colors.randomElement() ?? .blue))
        }
    }
}

public struct RowResponce: Row {
    
    public static func == (lhs: RowResponce, rhs: RowResponce) -> Bool {
        lhs.items.map{ $0.color } == rhs.items.map{ $0.color }
    }
    
    var items: [Item]
    var resultRow: RowRequest
    
    init(items: [Item], resultRow: RowRequest) {
        self.items = items
        self.resultRow = resultRow
    }
    
    init(items: [Item]) {
        self.init(items: items, resultRow: RowRequest(items: []))
    }
    
    mutating func proccesRowRequest(for request: RowRequest) {
        var whiteItems = 0
        let requestColors = request.items.map{ $0.color }
        let resultColors = resultRow.items.map{ $0.color }
        
        for (index, _ ) in requestColors.enumerated() {
            if requestColors[index] == resultColors[index] {
                whiteItems += 1
            }
        }
        
        var blackItems = 0
        let requestItemsWithoutDuplicates = Set(requestColors)
        
        for item in requestItemsWithoutDuplicates {
            // min from concrete color count from request and concrete color count from result
            let requestItemCount = requestColors.filter{ $0 == item}.count
            let resultItemCount = resultColors.filter{ $0 == item}.count
            
            blackItems += min(requestItemCount, resultItemCount)
        }
        
        items.append(contentsOf: Array(repeating: ItemResponce(color: .white), count: whiteItems))
        items.append(contentsOf: Array(repeating: ItemResponce(color: .black), count: blackItems - whiteItems))
    }
}
