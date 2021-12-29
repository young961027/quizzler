//
//  QuizBrain.swift
//  quizzler
//
//  Created by Young Soo Hwang on 2021/12/29.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(text: "Four + Two is equal to Six", answer: "True"),
        Question(text: "Five - Two is greater than One", answer: "True"),
        Question(text: "Three + Eight is less than Ten", answer: "False")
    ]
    
    var questionNumber = 0
    
    func checkAnser(userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            return true
        } else {
            return false
        }
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
}
