import Foundation
import UIKit

public class MasterMindEngine {
    var logger: GameLogger? = nil
    
    var rowsRequest: [RowRequest] = []
    var rowsResponce: [RowResponce] = []
    var rowResult = RowRequest(items: [])
    var lastMoveDate = Date()
    var gameSettings = GameSettings()
    
    public init(rowSize: Int, moves: Int, colors: Int, duration: Double) {
        gameSettings.prepareGameSettings(rowSize: rowSize, moves: moves, colors: colors, duration: duration)
        rowResult.generate(for: gameSettings.availableColors, rowSize: gameSettings.rowSize)
        logger = GameLogger(game: self)
        logger?.log(action: .start)
    }
    
    public convenience init() {
        self.init(rowSize: 4, moves: 8, colors: 6, duration: 15.0)
    }
    
    // перезапуск
    public func resetGame() {
        logger?.log(action: .reset)
        rowsRequest.removeAll()
        rowsResponce.removeAll()
        rowResult.generate(for: gameSettings.availableColors, rowSize: gameSettings.rowSize)
        gameSettings.prepareGameSettings(rowSize: gameSettings.rowSize, moves: gameSettings.countMoves, colors: gameSettings.availableColors.count, duration: gameSettings.gameDuration / 60)
    }
    
    // сдача гри(фiксується перемога компютера) + перезапуск
    public func resignGame() {
        logger?.log(action: .computerWin)
        logger?.log(action: .resign)
        resetGame()
    }
    
    public func nextMove(for request: RowRequest) { /*-> responceType*/
        let (hasWinner, _) = hasWinner()
        
        if hasWinner {
            logger?.log(action: .hasWinner)
            return
        }
        
        logger?.log(action: .move)
        rowsRequest.append(request)
        var responce = RowResponce(items: [], resultRow: rowResult)
        responce.proccesRowRequest(for: request)
        rowsResponce.append(responce)
    }
    
    // після завершення гри для аналізу(ходити не можна) або для real-time mode(ходити можна!)
    public func rollbackMove() /*-> responceType*/ {

    }
    
    // після завершення гри для аналізу(ходити не можна) або для real-time mode(ходити можна!)
    public func rollForwardMove() /*-> responceType*/ {
        
    }
    
    // немає таймеру і працюють відкатування вперед і назад для ходу
    public func realtimeModeOn() {
        
    }
    
    public func hasWinner() -> (Bool, PlayerType?) {
        if rowsRequest.last == rowResult {
            return (true, .player)
        }
        
        if rowsRequest.count == gameSettings.countMoves || getPlayerState().allTimeLeft < 1.0{
            return (true, .computer)
        }
        
        return (false, nil)
    }
    
    public func getAvailableMoves() -> [UIColor] {
       gameSettings.availableColors
    }
    
    public func getGameLogs() -> [GameLog] {
        // логувати:
        // дія гравця, таймери , таймери до початку ходу і після, стан рядків(рядку),
        logger?.gameLogs ?? []
    }
    
    public func getPlayerState() -> PlayerState {
        PlayerState(movesLeft: gameSettings.countMoves - rowsRequest.count,
                    allTimeLeft: gameSettings.gameDuration - Date().timeIntervalSince(gameSettings.startDate),
                    currentMoveTime: Date().timeIntervalSince(lastMoveDate),
                    lastMove: rowsRequest.last,
                    lastAnswer: rowsResponce.last)
    }
    
    public func getCurrentGameSettings() -> GameSettings {
        gameSettings
    }
    
    public func getCurrentGameState() -> GameState {
        GameState(requestRows: rowsRequest, responceRows: rowsResponce)
    }
}
