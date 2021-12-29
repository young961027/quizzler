//
//  Question.swift
//  quizzler
//
//  Created by Young Soo Hwang on 2021/12/29.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(text: String, answer: String) {
        self.text = text
        self.answer = answer
    }
}
