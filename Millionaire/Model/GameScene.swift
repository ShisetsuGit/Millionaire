//
//  GameScene.swift
//  Millionaire
//
//  Created by Shisetsu on 25.08.2021.
//

import UIKit

protocol GameSceneDelegate: AnyObject {
    func resultSummation (_ controller: GameScene, questions: Question)
}

final class GameScene: UIViewController {
    
    weak var gameDelegate: GameSceneDelegate?
    private var setGameDifficultyStrategy: GameDiffcultyStrategy {
        switch Game.shared.difficulty {
        case .normal:
            return NormalQuestions()
        case .random:
            return RandomQuestions()
        }
    }
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var answerALabel: AnswerButton!
    @IBOutlet weak var answerBLabel: AnswerButton!
    @IBOutlet weak var answerCLabel: AnswerButton!
    @IBOutlet weak var answerDLabel: AnswerButton!
    @IBOutlet weak var rewardLabel: UILabel!
    
    var question: Question?
    var questionNumber: Int = 0
    var answerNumber: Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGameData()
    }
    
    @IBAction func choseAnswer(_ sender: UIButton) {
        let info = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        
        if sender.tag == question?.correctAnswer {
            info.title = "И это был... Правильный ответ!"
            questionNumber += 1
            
            if questionNumber < questions.count {
                self.gameDelegate?.resultSummation(self, questions: question!)
                info.addAction(UIAlertAction(title: "Продолжаем", style: .default, handler: setupGameData))
                present(info, animated: true)
            } else {
                info.title = "Игра закончена"
                info.addAction(UIAlertAction(title: "На главный экран", style: .default) {
                    [weak self] _ in
                    self?.finishGame()
                })
                present(info, animated: true)
            }
        } else {
            info.title = "И это был... Неправильный ответ!"
            info.addAction(UIAlertAction(title: "Игра окончена", style: .default) {
                [weak self] _ in
                self?.finishGame()
            })
            present(info, animated: true)
        }
    }
    
    
    func setupGameData(action: UIAlertAction! = nil) {
        
        questions = setGameDifficultyStrategy.setDifficulty()
        
        question = questions[questionNumber]
        
        questionLabel.text = question?.question
        
        playerNameLabel.text = "У нас в студии Игрок 1"
        
        answerALabel.setTitle(question?.answers[0], for: .normal)
        answerBLabel.setTitle(question?.answers[1], for: .normal)
        answerCLabel.setTitle(question?.answers[2], for: .normal)
        answerDLabel.setTitle(question?.answers[3], for: .normal)
        
        Game.shared.session?.correctAnswers.addObserver(self, options: [.initial, .new],
                                             closure: { [weak self] (correctAnswers, _) in
                                                self?.questionNumberLabel.text = "Правильных ответов: \(correctAnswers) из \(questions.count)"
                                             })
        Game.shared.session?.totalReward.addObserver(self, options: [.initial, .new],
                                             closure: { [weak self] (reward, _) in
                                                self?.rewardLabel.text = "Сумма выигрыша: \(reward)"
                                             })
    }
    
    func finishGame() {
        Game.shared.didEndGame()
        self.dismiss(animated: true)
    }
}
