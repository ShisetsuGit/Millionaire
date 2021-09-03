//
//  Questions.swift
//  Millionaire
//
//  Created by Shisetsu on 25.08.2021.
//

import Foundation


struct Question: Codable {
    var question: String
    var answers: [String]
    var correctAnswer: Int
    var answerReward: Int
}


var questions: [Question] = [
    
    Question(question: "Что делают участники телеигры «Поле Чудес»?", answers: ["A: вращают барабан", "B: распрямляют саксофон", "C: поднимают рояль", "D: залезают в контрабас"], correctAnswer: 0, answerReward: 100),
    
    Question(question: "С чем сравнил герой песни Высоцкого себя и своего друга, гуляющих по Парижу?", answers: ["A: с дрелью на пляже", "B: с пассатижами в бане", "C: с отвёрткой в пустыне", "D: с долотом в бассейне"], correctAnswer: 1, answerReward: 200),

    Question(question: "Что сделали тульские мастера с механической блохой в сказке «Левша»?", answers: ["A: запрягли", "B: одели", "C: подковали", "D: покрасили"], correctAnswer: 2, answerReward: 2000),

    Question(question: "Что туристы бросают в фонтан Треви, чтобы вернуться в Рим?", answers: ["A: монеты", "B: визитные карточки", "C: мобильные телефоны", "D: загранпаспорта"], correctAnswer: 0, answerReward: 5000),

    Question(question: "Как не характеризовали Нину в фильме «Кавказская пленница»?", answers: ["A: спортсменка", "B: активистка", "C: комсомолка", "D: студентка"], correctAnswer: 1, answerReward: 50000),

    Question(question: "Кто дирижировал на балу у Воланда в романе «Мастер и Маргарита»?", answers: ["A: Иоганн Штраус", "B: Иоганн Себастьян Бах", "C: Людвиг ван Бетховен", "D: Ференц Лист"], correctAnswer: 0, answerReward: 100000)
]




//struct AnswersID {
//
//    var id: Int
//    var answer: String
//
//}
//
//struct QuestionsPull: Encodable {
//
//    var id: Int
//    var question: String
//    var answers: [AnswersID]
//    var correctAnswer: Int
//    var answerReward: Int
//
//}
//
//var questions: [QuestionsPull] = [
//
//    QuestionsPull(id: 1, question: "Что делают участники телеигры «Поле Чудес»?", answers: [AnswersID(id: 0, answer: "A: вращают барабан"), AnswersID(id: 1, answer: "B: распрямляют саксофон"), AnswersID(id: 2, answer: "C: поднимают рояль"), AnswersID(id: 3, answer: "D: залезают в контрабас")], correctAnswer: 0, answerReward: 100),
//
//    QuestionsPull(id: 2, question: "С чем сравнил герой песни Высоцкого себя и своего друга, гуляющих по Парижу?", answers: [AnswersID(id: 0, answer: "A: с дрелью на пляже"), AnswersID(id: 1, answer: "B: с пассатижами в бане"), AnswersID(id: 2, answer: "C: с отвёрткой в пустыне"), AnswersID(id: 3, answer: "D: с долотом в бассейне")], correctAnswer: 1, answerReward: 200),
//
//    QuestionsPull(id: 3, question: "Что сделали тульские мастера с механической блохой в сказке «Левша»?", answers: [AnswersID(id: 0, answer: "A: запрягли"), AnswersID(id: 1, answer: "B: одели"), AnswersID(id: 2, answer: "C: подковали"), AnswersID(id: 3, answer: "D: покрасили")], correctAnswer: 2, answerReward: 2000),
//
//    QuestionsPull(id: 4, question: "Что туристы бросают в фонтан Треви, чтобы вернуться в Рим?", answers: [AnswersID(id: 0, answer: "A: монеты"), AnswersID(id: 1, answer: "B: визитные карточки"), AnswersID(id: 2, answer: "C: мобильные телефоны"), AnswersID(id: 3, answer: "D: загранпаспорта")], correctAnswer: 0, answerReward: 5000),
//
//    QuestionsPull(id: 5, question: "Как не характеризовали Нину в фильме «Кавказская пленница»?", answers: [AnswersID(id: 0, answer: "A: спортсменка"), AnswersID(id: 1, answer: "B: активистка"), AnswersID(id: 2, answer: "C: комсомолка"), AnswersID(id: 3, answer: "D: студентка")], correctAnswer: 1, answerReward: 50000),
//
//    QuestionsPull(id: 6, question: "Кто дирижировал на балу у Воланда в романе «Мастер и Маргарита»?", answers: [AnswersID(id: 0, answer: "A: Иоганн Штраус"), AnswersID(id: 1, answer: "B: Иоганн Себастьян Бах"), AnswersID(id: 2, answer: "C: Людвиг ван Бетховен"), AnswersID(id: 3, answer: "D: Ференц Лист")], correctAnswer: 0, answerReward: 100000)
//]
