//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 18.08.2022.
//

import UIKit

final class ResultViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var animalTypeLabel: UILabel!
    @IBOutlet var animalDefinitionLabel: UILabel!
    
    // MARK: - Public Properties
    public var answerChosen: [Answer] = []

    // MARK: Override Methos
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        updateResult(answerChosen)
    }
    
    // MARK: - IBActions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

    // MARK: - Extensions
extension ResultViewController {
    private func updateResult(_ answers: [Answer]) {
        var answerCounter = [
            "Cat": 0,
            "Rabbit": 0,
            "Turtle": 0,
            "Dog": 0
        ]
        
        answers.forEach { answer in
            switch answer.type{
            case .cat:
                answerCounter["Cat"]! += 1
            case .rabbit:
                answerCounter["Rabbit"]! += 1
            case .turtle:
                answerCounter["Turtle"]! += 1
            default:
                answerCounter["Dog"]! += 1
            }
        }
        
        if answerCounter.values.max() == answerCounter["Cat"] {
            animalTypeLabel.text = "Вы - \(AnimalType.cat.rawValue)"
            animalDefinitionLabel.text = AnimalType.cat.definition
        } else if answerCounter.values.max() == answerCounter["Rabbit"] {
            animalTypeLabel.text = "Вы - \(AnimalType.rabbit.rawValue)"
            animalDefinitionLabel.text = AnimalType.rabbit.definition
        } else if answerCounter.values.max() == answerCounter["Turtle"] {
            animalTypeLabel.text = "Вы - \(AnimalType.turtle.rawValue)"
            animalDefinitionLabel.text = AnimalType.turtle.definition
        } else {
            animalTypeLabel.text = "Вы - \(AnimalType.dog.rawValue)"
            animalDefinitionLabel.text = AnimalType.dog.definition
        }
    }
}
