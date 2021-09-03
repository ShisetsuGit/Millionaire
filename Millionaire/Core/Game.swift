//
//  Game.swift
//  Millionaire
//
//  Created by Shisetsu on 31.08.2021.
//

import Foundation

final class Game {
    
    static let shared = Game()
    
    var session: Session?
    
    var difficulty: Difficulty = .normal
    
    private let scoreCaretaker = SaveLoad()
    
    var score = [ScoreTable]() {
        didSet {
            scoreCaretaker.saveData(toSave: self.score)
        }
    }
    
    private init() {
        self.score = self.scoreCaretaker.loadData()
    }
    
    func recordScore(_ score: ScoreTable) {
        self.score.append(score)
    }
    
    func didEndGame() {
        guard let gameSession = self.session else { return }
        let answersCount = gameSession.correctAnswers
        let reward = gameSession.totalReward
        let score = ScoreTable(score: Int(answersCount.value), date: Date(), reward: reward.value)
        self.recordScore(score)
        self.session = nil
    }
    
}
