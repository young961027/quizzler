//
//  ViewController.swift
//  quizzler
//
//  Created by Young Soo Hwang on 2021/12/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quizLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let quiz = [
        Question(text: "Four + Two is equal to Six", answer: "True"),
        Question(text: "Five - Two is greater than One", answer: "True"),
        Question(text: "Three + Eight is less than Ten", answer: "False")
    ]
    var timer = Timer()
    var questionNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let actualAnswer = quiz[questionNumber].answer
        
        if userAnswer == actualAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        if questionNumber < 2 {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        timer.invalidate()
        quizLabel.text = quiz[questionNumber].text
        trueButton.backgroundColor = UIColor.systemIndigo
        falseButton.backgroundColor = UIColor.systemIndigo
        progressBar.progress = Float(questionNumber + 1) / Float(quiz.count)
    }
}

