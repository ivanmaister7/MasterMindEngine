import Foundation

public struct MasterMindEngine {
    
    var rowsRequest: [Row] = []
    var rowsResponce: [Row] = []
    var rowResult: Row = Row(items: [])
    var gameSettings = GameSettings()
    
    init() { rowResult = Row.generate(for: gameSettings) }
    
    init(rowSize: Int, moves: Int, colors: Int) {
        gameSettings.prepareGameSettings(rowSize: rowSize, moves: moves, colors: colors)
        rowResult = Row.generate(for: gameSettings)
    }
    
    // перезапуск
    public mutating func resetGame() {
        //log
        rowsRequest.removeAll()
        rowsResponce.removeAll()
    }
    
    // сдача гри(фиксується перемога компютера) + перезапуск
    public func resignGame() {
        
    }
    
    public func nextMove(/*..*/) /*-> responceType*/ {
        
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
    
    public func hasWinner() /*-> responceType*/ {
        
    }
    
    public func getAvailableMoves() /*-> responceType*/ {
        
    }
    
    public func getGameLogs() /*-> responceType*/ {
        // логувати:
        // хід гравця, таймери, стан рядків(рядку),
    }
    
    public func getPlayerState() /*-> responceType*/ {
        
    }
    
    public func getCurrentGameState() -> GameSettings {
        gameSettings
    }
}
