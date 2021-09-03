//
//  GameDiffcultyStrategy.swift
//  Millionaire
//
//  Created by Shisetsu on 03.09.2021.
//

import Foundation

protocol  GameDiffcultyStrategy{
    func setDifficulty () -> [Question]
}

final class RandomQuestions: GameDiffcultyStrategy {
    
    func setDifficulty() -> [Question] {
        questions = questions.shuffled()
        return questions
    }
}

final class NormalQuestions: GameDiffcultyStrategy {
    func setDifficulty() -> [Question] {
        return questions
    }
}
