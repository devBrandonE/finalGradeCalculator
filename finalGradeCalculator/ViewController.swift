//
//  ViewController.swift
//  finalGradeCalculator
//
//  Created by Brandon Escobar on 10/1/19.
//  Copyright © 2019 Brandon Escobar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentGrade: UITextField!
    @IBOutlet weak var gradeThing: UISegmentedControl!
    @IBOutlet weak var examWeight: UITextField!
    @IBOutlet weak var gradeNeeded: UILabel!
    @IBOutlet weak var background: UIView!
    @IBOutlet var deepBackground: UIView!
    var gradeWant = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //(requiredGrade - (100% - weight) × currentGrade) / weight
    }
    @IBAction func onViewTapped(_ sender: UITapGestureRecognizer) {
        switch gradeThing.selectedSegmentIndex{
        case 0:
            gradeWant = 90
        case 1:
            gradeWant = 80
        case 2:
            gradeWant = 70
        case 3:
            gradeWant = 60
        case 4:
            gradeWant = 50
        default:
            gradeWant = 0
            
        }
        
        if let curGrade = Double(currentGrade.text!){
            let reqGrade = Double(gradeWant)
            if let weight = Double(examWeight.text!){
                //let cG = curGrade / 100
                //let rG = reqGrade / 100
                //let w = weight / 100
                if weight == 0 {
                    gradeNeeded.text = "The weight can't be zero"
                    background.backgroundColor = .white
                    deepBackground.backgroundColor = .lightGray
                } else {
                    let percent = weight / 100.0
                    let calc = (reqGrade - ((1 - percent) * curGrade)) / percent
                    //( required grade - (100% - w)×current grade ) / w
                    if calc > 100 {
                        background.backgroundColor = .red
                        deepBackground.backgroundColor = .black
                    } else {
                        background.backgroundColor = .green
                        deepBackground.backgroundColor = .white
                    }
                    //deepBackground.backgroundColor = .black
                    gradeNeeded.text = String(format: "%.1f", calc)
                    self.view.endEditing(true)
                }
            }
        }
        //gradeNeeded.text = String(calc)
    }
    
}

