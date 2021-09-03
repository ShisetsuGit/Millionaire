//
//  SaveQuestions.swift
//  Millionaire
//
//  Created by Shisetsu on 03.09.2021.
//

import Foundation

final class SaveQuestions {
    private let save = JSONEncoder()
    private let load = JSONDecoder()
    
    private let key = "Questions"
    
    func saveQuestionsData(toSave: [Question]) {
        do {
            let data = try self.save.encode(toSave)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func loadQuestionsData() -> [Question] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return[]
        }
        do {
            return try self.load.decode([Question].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
