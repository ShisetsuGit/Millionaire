//
//  ScoreTableScene.swift
//  Millionaire
//
//  Created by Shisetsu on 31.08.2021.
//

import UIKit

class ScoreTableScene: UITableViewController {
    
    let dateFormatter: DateFormatter = {
        let date = DateFormatter()
        date.dateStyle = .medium
        date.locale = Locale(identifier: "ru_RU")
        return date
    }()
    
    var scores = Game.shared.score.sorted() { $0.date > $1.date }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        scores.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreCell")
        let score = scores[indexPath.row]
        let date = dateFormatter.string(from: score.date)
        cell?.textLabel?.text = "Дата: \(date) Верных ответов: \(score.score) из \(questions.count) Приз: \(score.reward) ₽"
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = ScoreHeader().headerView
         
         return headerView
    }
}
