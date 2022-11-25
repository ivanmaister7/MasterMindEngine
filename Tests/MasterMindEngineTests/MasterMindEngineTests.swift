    import XCTest
    @testable import MasterMindEngine

    final class MasterMindEngineTests: XCTestCase {
        
        func test_initWithParams_Ok() {
            let game = MasterMindEngine(rowSize: 5, moves: 7, colors: 5, duration: 15.0)
            let settings = GameSettings(rowSize: 5, moves: 7, colors: 5, duration: 15.0)
            
            XCTAssertTrue(settings == game.gameSettings)
        }
        
        func test_initWithParams_Bad() {
            let game = MasterMindEngine(rowSize: 5, moves: 7, colors: 5, duration: 15.0)
            let settings = GameSettings(rowSize: 4, moves: 8, colors: 6, duration: 15.0)
            
            XCTAssertTrue(settings != game.gameSettings)
        }

        func test_prepareGameSettings_and_initWithParams_Ok() {
            let game = MasterMindEngine(rowSize: 5, moves: 7, colors: 5, duration: 15.0)
            var settings = GameSettings()
            settings.prepareGameSettings(rowSize: 5, moves: 7, colors: 5, duration: 15.0)
            
            XCTAssertTrue(settings == game.gameSettings)
        }
    }
