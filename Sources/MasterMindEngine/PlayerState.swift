//
//  PlayerState.swift
//  
//
//  Created by Master on 25.11.2022.
//

import Foundation

public struct PlayerState {
    var movesLeft = 0
    var allTimeLeft = TimeInterval()
    var currentMoveTime = TimeInterval()
    var lastMove: RowRequest?
    var lastAnswer: RowResponce?
    
}
