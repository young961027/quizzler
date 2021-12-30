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
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!

        if quizBrain.checkAnser(userAnswer: userAnswer) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        quizLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
//        quizLabel.text = quiz[questionNumber].text
        scoreLabel.text = "Score : \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.systemIndigo
        falseButton.backgroundColor = UIColor.systemIndigo
//        progressBar.progress = Float(questionNumber + 1) / Float(quiz.count)
    }
}

