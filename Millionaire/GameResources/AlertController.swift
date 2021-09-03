//
//  AlertController.swift
//  Millionaire
//
//  Created by Shisetsu on 27.08.2021.
//

import UIKit

protocol AlertControllerDelegate: AnyObject {
    func setPlayerName(withName result: String)
}

class AlertController: UIAlertController {
    
    weak var alertDelegate: AlertControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAlert()
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Новая игра",
                                      message: "Введите ваше имя",
                                      preferredStyle: .alert)
        alert.addTextField { player in
            player.placeholder = "Игрок 1"
        }
        let cancelAction = UIAlertAction(title: "Отмена",
                                         style: .cancel)
        
        
        let saveAction = UIAlertAction(title: "Старт!", style: .default) { _ in
            let player = alert.textFields?[0]
            let playerName = (player?.text)!
            self.alertDelegate?.setPlayerName(withName: playerName)
            print(playerName)
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}
