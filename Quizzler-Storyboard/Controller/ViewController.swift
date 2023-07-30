//
//  ViewController.swift
//  Quizzler-Storyboard
//
//  Created by iOS - Developer on 29.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var questionText: UILabel!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    
    let quizBrain = QuizBrain()
    var timer: Timer!
    var progress: Float = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        trueButton.layer.cornerRadius = 20
        falseButton.layer.cornerRadius = 20
    }

    @IBAction func tappedButtonTrue(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        quizBrain.checkAnswer(answer: userAnswer)

        if userAnswer == actualAnswer {
            sender.backgroundColor = .systemGreen
        } else {
            sender.backgroundColor = .systemRed
        }
    
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateProgress() {
        progress += 0.05
        if progress > 1.0 {
            progress = 0
        }
        progressView.setProgress(progress, animated: true)
        trueButton.layer.cornerRadius = 20
        falseButton.layer.cornerRadius = 20
    }
    
   @objc private func updateUI() {
        questionText.text = quiz[questionNumber].text
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
        progressView.progress = Float(questionNumber + 1) / Float(quiz.count)
    }
}

