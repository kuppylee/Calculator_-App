//
//  ViewController.swift
//  CALCULATOR APP
//
//  Created by Decagon on 18/07/2021.
//
import UIKit

// created an enum for the Operations
enum Operations: String {
    case Addition = "+"
    case Subtraction = "-"
    case Division = "/"
    case Multiplication = "*"
    case Percentage = "%"
    case Empty = "Null"
}

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var outputDisplayedInLabel = ""
    var leftOperand = ""
    var rightOperand = ""
    var output = ""
    var presentOperation:Operations = .Empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputLabel.text = "0"
    }
    
    @IBAction func numberButtonPressed(_ sender: RoundedButton) {
        if outputDisplayedInLabel.count <= 8 {
            outputDisplayedInLabel += "\(sender.tag)"
            outputLabel.text = outputDisplayedInLabel
        }
    }
    
    @IBAction func dotButtonPressed(_ sender: RoundedButton) {
        if outputDisplayedInLabel.count <= 7 && !outputDisplayedInLabel.contains("."){
            outputDisplayedInLabel += "."
            outputLabel.text = outputDisplayedInLabel
        }
    }
    
    //created a function that implements all the operation
    func operationsToImplement(operation: Operations) {
        if presentOperation != .Empty{
            if outputDisplayedInLabel != ""{
                rightOperand = outputDisplayedInLabel
                outputDisplayedInLabel = ""
                
                switch presentOperation {
                case .Addition:
                    output = String(Double(leftOperand)! + Double(rightOperand)!)
                case .Subtraction:
                    output = String(Double(leftOperand)! - Double(rightOperand)!)
                case .Division:
                    output = String(Double(leftOperand)! / Double(rightOperand)!)
                case .Multiplication:
                    output = String(Double(leftOperand)! * Double(rightOperand)!)
                case .Percentage:
                    rightOperand = "100"
                    output = String(Double(leftOperand)! / Double(rightOperand)!)
                case .Empty:
                    output = "Null"
                }
                leftOperand = output
                
                if (Double(output)! .truncatingRemainder(dividingBy: 1) == 0){
                    output = "\(Int(Double(output)!))"
                }
                outputLabel.text = output
            }
            presentOperation = operation
            
        } else {
            leftOperand = outputDisplayedInLabel
            outputDisplayedInLabel = ""
            presentOperation = operation
        }
    }
    //called the operationToImplement function with the case type
    @IBAction func equalButtonPressed(_ sender: RoundedButton) {
        operationsToImplement(operation: presentOperation)
    }
    
    @IBAction func addButtonPressed(_ sender: RoundedButton) {
        operationsToImplement(operation: .Addition)
    }
    
    @IBAction func subtractButtonPressed(_ sender: RoundedButton) {
        operationsToImplement(operation: .Subtraction)
    }
    
    @IBAction func multiplyButtonPressed(_ sender: RoundedButton) {
        operationsToImplement(operation: .Multiplication)
    }
    
    @IBAction func divideButtonPressed(_ sender: RoundedButton) {
        operationsToImplement(operation: .Division)
    }
    
    @IBAction func pecentageButtonPressed(_ sender: RoundedButton) {
        operationsToImplement(operation: .Percentage)
    }
    
    @IBAction func clearButtonPressed(_ sender: RoundedButton) {
        outputDisplayedInLabel = ""
        leftOperand = ""
        rightOperand = ""
        output = ""
        presentOperation = .Empty
        outputLabel.text = "0"
    }
    
}

