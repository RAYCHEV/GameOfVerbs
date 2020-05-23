//
//  RankingManagerTests.swift
//  GameOfVerbs1UnitTests
//
//  Created by Nikolay Raychev on 2.11.18.
//  Copyright © 2018 Nikolay Raychev. All rights reserved.
//

import XCTest

@testable import GameOfVerbs1

class RankingManagerTests: XCTestCase {

    var sut: RankingManager!
    let game1: Game = Game(user: User(nickname: "Bai Kolio", email: "kolio@mam.com"), points: 14, numOfVerbs: 30, dateEnded: Date.init(), diffuculty: .beginer)
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = RankingManager()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Initial Values
    func testInit_gamesCount_ReturnsZero() {
        XCTAssertEqual(sut.gamesCount, 0)
    }
    
    // MARK: Add and Query
    func testAdd_games_ReturnsOne() {
        sut.addGame(game: game1)
        XCTAssertEqual(sut.gamesCount, 1)
    }

}
