//
//  Session.swift
//  Millionaire
//
//  Created by Shisetsu on 31.08.2021.
//

import Foundation

class Session {
    
    var questionCount: Int = questions.count
    var correctAnswers = Observable<Int>(0)
    var totalReward = Observable<Int>(0)
}

extension Session: GameSceneDelegate {
    func resultSummation (_ controller: GameScene, questions: Question) {
        self.correctAnswers.value += 1
        self.totalReward.value += questions.answerReward
    }
}
