    import XCTest
    @testable import MasterMindEngine

    final class RowResponceTests: XCTestCase {

        func test_proccesRowRequest_1_Ok() {
            let resultRow = RowRequest(items: [ItemRequest(color: .blue),
                                               ItemRequest(color: .blue),
                                               ItemRequest(color: .blue),
                                               ItemRequest(color: .blue)])
            
            let requestRow = RowRequest(items: [ItemRequest(color: .blue),
                                                ItemRequest(color: .blue),
                                                ItemRequest(color: .blue),
                                                ItemRequest(color: .blue)])
            
            var row = RowResponce(items: [], resultRow: resultRow)
            row.proccesRowRequest(for: requestRow)
            
            XCTAssertEqual(4, row.items.count)
            XCTAssertEqual(Array(repeating: ItemResponce(color: .white), count: 4),
                           row.items as! [ItemResponce])
        }
        
        func test_proccesRowRequest_2_Ok() {
            let resultRow = RowRequest(items: [ItemRequest(color: .blue),
                                               ItemRequest(color: .blue),
                                               ItemRequest(color: .blue),
                                               ItemRequest(color: .blue)])
            
            let requestRow = RowRequest(items: [ItemRequest(color: .blue),
                                                ItemRequest(color: .blue),
                                                ItemRequest(color: .red),
                                                ItemRequest(color: .green)])
            
            var row = RowResponce(items: [], resultRow: resultRow)
            row.proccesRowRequest(for: requestRow)
            
            XCTAssertEqual(2, row.items.count)
            XCTAssertEqual(Array(repeating: ItemResponce(color: .white), count: 2),
                           row.items as! [ItemResponce])
        }
        
        func test_proccesRowRequest_3_Ok() {
            let resultRow = RowRequest(items: [ItemRequest(color: .blue),
                                               ItemRequest(color: .blue),
                                               ItemRequest(color: .blue),
                                               ItemRequest(color: .blue)])
            
            let requestRow = RowRequest(items: [ItemRequest(color: .red),
                                                ItemRequest(color: .green),
                                                ItemRequest(color: .blue),
                                                ItemRequest(color: .yellow)])
            
            var row = RowResponce(items: [], resultRow: resultRow)
            row.proccesRowRequest(for: requestRow)
            
            XCTAssertEqual(1, row.items.count)
            XCTAssertEqual(Array(repeating: ItemResponce(color: .white), count: 1),
                           row.items as! [ItemResponce])
        }
        
        func test_proccesRowRequest_4_Ok() {
            let resultRow = RowRequest(items: [ItemRequest(color: .blue),
                                               ItemRequest(color: .blue),
                                               ItemRequest(color: .red),
                                               ItemRequest(color: .red)])
            
            let requestRow = RowRequest(items: [ItemRequest(color: .blue),
                                                ItemRequest(color: .blue),
                                                ItemRequest(color: .green),
                                                ItemRequest(color: .green)])
            
            var row = RowResponce(items: [], resultRow: resultRow)
            row.proccesRowRequest(for: requestRow)
            
            XCTAssertEqual(2, row.items.count)
            XCTAssertEqual(Array(repeating: ItemResponce(color: .white), count: 2),
                           row.items as! [ItemResponce])
        }
        
        func test_proccesRowRequest_5_Ok() {
            let resultRow = RowRequest(items: [ItemRequest(color: .blue),
                                               ItemRequest(color: .blue),
                                               ItemRequest(color: .red),
                                               ItemRequest(color: .red)])
            
            let requestRow = RowRequest(items: [ItemRequest(color: .blue),
                                                ItemRequest(color: .green),
                                                ItemRequest(color: .blue),
                                                ItemRequest(color: .green)])
            
            var row = RowResponce(items: [], resultRow: resultRow)
            row.proccesRowRequest(for: requestRow)
            
            XCTAssertEqual(2, row.items.count)
            XCTAssertEqual([ ItemResponce(color: .white),
                             ItemResponce(color: .black)],
                           row.items as! [ItemResponce])
        }
        
        func test_proccesRowRequest_6_Ok() {
            let resultRow = RowRequest(items: [ItemRequest(color: .blue),
                                               ItemRequest(color: .yellow),
                                               ItemRequest(color: .red),
                                               ItemRequest(color: .red)])
            
            let requestRow = RowRequest(items: [ItemRequest(color: .cyan),
                                                ItemRequest(color: .green),
                                                ItemRequest(color: .blue),
                                                ItemRequest(color: .green)])
            
            var row = RowResponce(items: [], resultRow: resultRow)
            row.proccesRowRequest(for: requestRow)
            
            XCTAssertEqual(1, row.items.count)
            XCTAssertEqual([ ItemResponce(color: .black)],
                           row.items as! [ItemResponce])
        }
        
        func test_proccesRowRequest_7_Ok() {
            let resultRow = RowRequest(items: [ItemRequest(color: .blue),
                                               ItemRequest(color: .blue),
                                               ItemRequest(color: .red),
                                               ItemRequest(color: .red)])
            
            let requestRow = RowRequest(items: [ItemRequest(color: .red),
                                                ItemRequest(color: .red),
                                                ItemRequest(color: .blue),
                                                ItemRequest(color: .blue)])
            
            var row = RowResponce(items: [], resultRow: resultRow)
            row.proccesRowRequest(for: requestRow)
            
            XCTAssertEqual(4, row.items.count)
            XCTAssertEqual(Array(repeating: ItemResponce(color: .black), count: 4),
                           row.items as! [ItemResponce])
        }
        
        func test_proccesRowRequest_8_Ok() {
            let resultRow = RowRequest(items: [ItemRequest(color: .blue),
                                               ItemRequest(color: .yellow),
                                               ItemRequest(color: .red),
                                               ItemRequest(color: .red)])
            
            let requestRow = RowRequest(items: [ItemRequest(color: .yellow),
                                                ItemRequest(color: .red),
                                                ItemRequest(color: .blue),
                                                ItemRequest(color: .green)])
            
            var row = RowResponce(items: [], resultRow: resultRow)
            row.proccesRowRequest(for: requestRow)
            
            XCTAssertEqual(3, row.items.count)
            XCTAssertEqual(Array(repeating: ItemResponce(color: .black), count: 3),
                           row.items as! [ItemResponce])
        }
        
        func test_proccesRowRequest_9_Ok() {
            let resultRow = RowRequest(items: [ItemRequest(color: .blue),
                                               ItemRequest(color: .yellow),
                                               ItemRequest(color: .red),
                                               ItemRequest(color: .red)])
            
            let requestRow = RowRequest(items: [ItemRequest(color: .blue),
                                                ItemRequest(color: .green),
                                                ItemRequest(color: .yellow),
                                                ItemRequest(color: .red)])
            
            var row = RowResponce(items: [], resultRow: resultRow)
            row.proccesRowRequest(for: requestRow)
            
            XCTAssertEqual(3, row.items.count)
            XCTAssertEqual([ ItemResponce(color: .white),
                             ItemResponce(color: .white),
                             ItemResponce(color: .black)],
                           row.items as! [ItemResponce])
        }
        
        func test_proccesRowRequest_10_Ok() {
            let resultRow = RowRequest(items: [ItemRequest(color: .blue),
                                               ItemRequest(color: .yellow),
                                               ItemRequest(color: .red),
                                               ItemRequest(color: .red)])
            
            let requestRow = RowRequest(items: [ItemRequest(color: .blue),
                                                ItemRequest(color: .yellow),
                                                ItemRequest(color: .red),
                                                ItemRequest(color: .red)])
            
            var row = RowResponce(items: [], resultRow: resultRow)
            row.proccesRowRequest(for: requestRow)
            
            XCTAssertEqual(4, row.items.count)
            XCTAssertEqual([ ItemResponce(color: .white),
                             ItemResponce(color: .white),
                             ItemResponce(color: .white),
                             ItemResponce(color: .white)],
                           row.items as! [ItemResponce])
        }
        
        func test_proccesRowRequest_11_Ok() {
            let resultRow = RowRequest(items: [ItemRequest(color: .blue),
                                               ItemRequest(color: .red),
                                               ItemRequest(color: .red),
                                               ItemRequest(color: .red)])
            
            let requestRow = RowRequest(items: [ItemRequest(color: .red),
                                                ItemRequest(color: .yellow),
                                                ItemRequest(color: .green),
                                                ItemRequest(color: .green)])
            
            var row = RowResponce(items: [], resultRow: resultRow)
            row.proccesRowRequest(for: requestRow)
            
            XCTAssertEqual(1, row.items.count)
            XCTAssertEqual([ ItemResponce(color: .black)],
                           row.items as! [ItemResponce])
        }
        
        func test_proccesRowRequest_12_Ok() {
            let resultRow = RowRequest(items: [ItemRequest(color: .blue),
                                               ItemRequest(color: .red),
                                               ItemRequest(color: .red),
                                               ItemRequest(color: .red)])
            
            let requestRow = RowRequest(items: [ItemRequest(color: .red),
                                                ItemRequest(color: .yellow),
                                                ItemRequest(color: .blue),
                                                ItemRequest(color: .yellow)])
            
            var row = RowResponce(items: [], resultRow: resultRow)
            row.proccesRowRequest(for: requestRow)
            
            XCTAssertEqual(2, row.items.count)
            XCTAssertEqual([ ItemResponce(color: .black),
                             ItemResponce(color: .black)],
                           row.items as! [ItemResponce])
        }
        
        func test_proccesRowRequest_13_Ok() {
            let resultRow = RowRequest(items: [ItemRequest(color: .blue),
                                               ItemRequest(color: .red),
                                               ItemRequest(color: .red),
                                               ItemRequest(color: .red)])
            
            let requestRow = RowRequest(items: [ItemRequest(color: .red),
                                                ItemRequest(color: .blue),
                                                ItemRequest(color: .red),
                                                ItemRequest(color: .green)])
            
            var row = RowResponce(items: [], resultRow: resultRow)
            row.proccesRowRequest(for: requestRow)
            
            XCTAssertEqual(3, row.items.count)
            XCTAssertEqual([ ItemResponce(color: .white),
                             ItemResponce(color: .black),
                             ItemResponce(color: .black)],
                           row.items as! [ItemResponce])
        }
        
        func test_proccesRowRequest_14_Ok() {
            let resultRow = RowRequest(items: [ItemRequest(color: .blue),
                                               ItemRequest(color: .yellow),
                                               ItemRequest(color: .red),
                                               ItemRequest(color: .red)])
            
            let requestRow = RowRequest(items: [ItemRequest(color: .blue),
                                                ItemRequest(color: .blue),
                                                ItemRequest(color: .blue),
                                                ItemRequest(color: .blue)])
            
            var row = RowResponce(items: [], resultRow: resultRow)
            row.proccesRowRequest(for: requestRow)
            
            XCTAssertEqual(1, row.items.count)
            XCTAssertEqual([ ItemResponce(color: .white)],
                           row.items as! [ItemResponce])
        }
        
        func test_proccesRowRequest_15_Ok() {
            let resultRow = RowRequest(items: [ItemRequest(color: .blue),
                                               ItemRequest(color: .yellow),
                                               ItemRequest(color: .red),
                                               ItemRequest(color: .red)])
            
            let requestRow = RowRequest(items: [ItemRequest(color: .blue),
                                                ItemRequest(color: .blue),
                                                ItemRequest(color: .yellow),
                                                ItemRequest(color: .blue)])
            
            var row = RowResponce(items: [], resultRow: resultRow)
            row.proccesRowRequest(for: requestRow)
            
            XCTAssertEqual(2, row.items.count)
            XCTAssertEqual([ ItemResponce(color: .white),
                             ItemResponce(color: .black)],
                           row.items as! [ItemResponce])
        }
        
        func test_proccesRowRequest_16_Ok() {
            let resultRow = RowRequest(items: [ItemRequest(color: .blue),
                                               ItemRequest(color: .yellow),
                                               ItemRequest(color: .red),
                                               ItemRequest(color: .red)])
            
            let requestRow = RowRequest(items: [ItemRequest(color: .green),
                                                ItemRequest(color: .blue),
                                                ItemRequest(color: .blue),
                                                ItemRequest(color: .blue)])
            
            var row = RowResponce(items: [], resultRow: resultRow)
            row.proccesRowRequest(for: requestRow)
            
            XCTAssertEqual(1, row.items.count)
            XCTAssertEqual([ ItemResponce(color: .black)],
                           row.items as! [ItemResponce])
        }
        
        func test_proccesRowRequest_17_Ok() {
            let resultRow = RowRequest(items: [ItemRequest(color: .blue),
                                               ItemRequest(color: .yellow),
                                               ItemRequest(color: .cyan),
                                               ItemRequest(color: .red)])
            
            let requestRow = RowRequest(items: [ItemRequest(color: .blue),
                                                ItemRequest(color: .yellow),
                                                ItemRequest(color: .cyan),
                                                ItemRequest(color: .red)])
            
            var row = RowResponce(items: [], resultRow: resultRow)
            row.proccesRowRequest(for: requestRow)
            
            XCTAssertEqual(4, row.items.count)
            XCTAssertEqual(Array(repeating: ItemResponce(color: .white), count: 4),
                           row.items as! [ItemResponce])
        }
        
    }
