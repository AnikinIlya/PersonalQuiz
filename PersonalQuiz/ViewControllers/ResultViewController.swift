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

    // MARK: Override Methods
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
        var answerCounter: [AnimalType: Int] = [
            .cat: 0,
            .rabbit: 0,
            .turtle: 0,
            .dog: 0
        ]
        
        answers.forEach { answer in
            if let animalType = answerCounter[answer.type] {
                answerCounter.updateValue(animalType + 1, forKey: answer.type)
            }
        }
        
        let sortedFrequencyOfAnimals = answerCounter.max { $0.value < $1.value }
        
        guard let mostFrequentAnimal = sortedFrequencyOfAnimals?.key else {
            return
        }
        
        updateUI(with: mostFrequentAnimal)
    }
    
    private func updateUI(with animal: AnimalType) {
        animalTypeLabel.text = "Вы - \(animal.rawValue)"
        animalDefinitionLabel.text = animal.definition
    }
}
