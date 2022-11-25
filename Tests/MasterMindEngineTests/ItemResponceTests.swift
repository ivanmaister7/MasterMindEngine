    import XCTest
    @testable import MasterMindEngine

    final class ItemResponceTests: XCTestCase {

        func test_getAvailableColors_Size_Ok() {
            let colors = ItemResponce.getAvailableColors(forCount: 5)
            
            XCTAssertEqual(2, colors.count)
        }
        
        func test_getAvailableColors_NotEmpty_Ok() {
            let colors = ItemResponce.getAvailableColors(forCount: 0)
            
            XCTAssertFalse(colors.isEmpty)
        }
        
        func test_getAvailableColors_Elements2_Ok() {
            let colors = ItemResponce.getAvailableColors(forCount: 2)
            
            XCTAssertEqual(2, colors.count)
            XCTAssertEqual([.black,.white], colors)
        }
        
        func test_getAvailableColors_Elements5_Ok() {
            let colors = ItemResponce.getAvailableColors(forCount: 5)
            
            XCTAssertEqual(2, colors.count)
            XCTAssertEqual([.black,.white], colors)
        }
    }
