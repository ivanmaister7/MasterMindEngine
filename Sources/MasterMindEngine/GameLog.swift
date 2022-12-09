//
//  File.swift
//  
//
//  Created by Master on 25.11.2022.
//

import Foundation

public struct GameLog {
    var gameSettings: GameSettings
    var playerState: PlayerState
    var lastRequest: RowRequest?
    var lastResponce: RowResponce?
    //var currentTime: TimeInterval
    var action: String
}

enum UserAction: String {
    case start = "User Start Game"
    case move = "User Make Move"
    case rollback = "Rollback Action"
    case rollforward = "Rollforward Action"
    case reset = "User Reset Game"
    case resign = "User Resign Game"
    case userWin = "User Win"
    case computerWin = "Computer Win"
    case hasWinner = "Can't make action, because there is a winner"
}
