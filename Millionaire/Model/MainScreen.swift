//
//  MainScreen.swift
//  Millionaire
//
//  Created by Shisetsu on 24.08.2021.
//

import UIKit

final class MainScreen: UIViewController {
    private let questionCaretaker = SaveQuestions()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = questionCaretaker.loadQuestionsData()
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let gameVC = storyBoard.instantiateViewController(withIdentifier: "GameScreen") as? GameScene {
            let gameSession = Session()
            Game.shared.session = gameSession
            gameVC.gameDelegate = gameSession
            gameVC.modalPresentationStyle = .fullScreen
            self.present(gameVC, animated: false, completion:nil)
        }
    }
    
    @IBAction func showScores(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ScoreScreen") as? ScoreTableScene {
            nextViewController.modalPresentationStyle = .popover
            self.present(nextViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func settingsScreen() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SettingsScreen") as? SettingsScreen {
            nextViewController.modalPresentationStyle = .fullScreen
            self.present(nextViewController, animated: false, completion: nil)
        }
    }
    
}
