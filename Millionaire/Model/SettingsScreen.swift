//
//  SettingsScreen.swift
//  Millionaire
//
//  Created by Shisetsu on 03.09.2021.
//

import UIKit

class SettingsScreen: UIViewController {
    
    private let questionCaretaker = SaveQuestions()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var difficultyControl: UISegmentedControl!
    
    private var selectedDifficulty: Difficulty {
        switch self.difficultyControl.selectedSegmentIndex {
        case 0:
            return .normal
        case 1:
            return .random
        default:
            return .normal
        }
    }
    
    @IBAction func saveDifficulty(_ sender: UIButton) {
        Game.shared.difficulty = self.selectedDifficulty
    }
    
    @IBAction func mainScreen(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let main = storyBoard.instantiateViewController(withIdentifier: "MainScreen") as? MainScreen {
            main.modalPresentationStyle = .fullScreen
            self.present(main, animated: false, completion:nil)
        }
    }
    
    @IBAction func addQuestions(_ sender: UIButton) {
        let alert = UIAlertController(title: "Добавление вопроса",
                                      message: "Напишите свой вопрос и 4 варианта ответа на него",
                                      preferredStyle: .alert)
        alert.addTextField { questionTextField in
            questionTextField.placeholder = "Ваш вопрос"
        }
        alert.addTextField { answer0TextField in
            answer0TextField.placeholder = "Вариант 1"
        }
        alert.addTextField { answer1TextField in
            answer1TextField.placeholder = "Вариант 2"
        }
        alert.addTextField { answer2TextField in
            answer2TextField.placeholder = "Вариант 3"
        }
        alert.addTextField { answer3TextField in
            answer3TextField.placeholder = "Вариант 4"
        }
        
        alert.addTextField { correctAnswerTextField in
            correctAnswerTextField.placeholder = "Номер верного ответа. От 1 до 4"
        }
        
        alert.addTextField { answerRewardTextField in
            answerRewardTextField.placeholder = "Награда. Указать число."
        }

        let cancelAction = UIAlertAction(title: "Отмена",
                                         style: .cancel)
        
        
        let saveAction = UIAlertAction(title: "Добавить", style: .default) { _ in
            guard let questionText = alert.textFields?[0],
                  let answer0Text = alert.textFields?[1],
                  let answer1Text = alert.textFields?[2],
                  let answer2Text = alert.textFields?[3],
                  let answer3Text = alert.textFields?[4],
                  let correctAnswerText = alert.textFields?[5],
                  let answerRewardText = alert.textFields?[6],
                  
                  let question = questionText.text,
                  let answer0 = answer0Text.text,
                  let answer1 = answer1Text.text,
                  let answer2 = answer2Text.text,
                  let answer3 = answer3Text.text,
                  let correctAnswer = correctAnswerText.text,
                  let answerReward = answerRewardText.text else { return }
            self.addQuestionToQuestionPull(userQuestion: question, userAnswer1: answer0, userAnswer2: answer1, userAnswer3: answer2, userAnswer4: answer3, userCorrectAnswer: correctAnswer, userAnswerReward: answerReward)
        }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func addQuestionToQuestionPull(userQuestion: String, userAnswer1: String, userAnswer2: String, userAnswer3: String, userAnswer4: String, userCorrectAnswer: String, userAnswerReward: String) {
        var userQuestions: Question?
        userQuestions = Question(question: userQuestion, answers: [userAnswer1, userAnswer2, userAnswer3, userAnswer4], correctAnswer: Int(userCorrectAnswer)! - 1, answerReward: Int(userAnswerReward)!)
        questions.append(userQuestions!)
        questionCaretaker.saveQuestionsData(toSave: questions)
    }
}
