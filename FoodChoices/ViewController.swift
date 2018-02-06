//
//  ViewController.swift
//  FoodChoices
//
//  Created by Warren Hansen on 2/5/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

// MARK: - TODO - refactor model
// MARK: - TODO - add new dishes

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var arrayFood:[HealthyFood] = []
    var oneDish = HealthyFood()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Good Local Food"
        self.becomeFirstResponder() // To get shake gesture
        arrayFood = BasicFood().setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func chooseAction(_ sender: Any) {
        randomChoice()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayFood.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = arrayFood[indexPath.row].restaurant
        cell.detailTextLabel?.text = arrayFood[indexPath.row].dish
        
        let allNums = PastChoice().allChoices()
        if allNums.contains(indexPath.row) {
            cell.contentView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        segueToResults(choice:indexPath.row)
    }
    
    func randomChoice() {
        let current = PastChoice().allChoices()
        var next: Int
        repeat {
            next = Int(arc4random_uniform(UInt32(arrayFood.count)))
            print(next)
        } while current.contains(next) && current.count < arrayFood.count
        
        if current.count >= arrayFood.count {
            print("All choices used, delete realm and try again")
            PastChoice().deleteChoices()
            next = Int(arc4random_uniform(UInt32(arrayFood.count)))
        }
        PastChoice().choiceMade(choice: Int(next))
        segueToResults(choice: Int(next))
    }

    override var canBecomeFirstResponder: Bool {
        get { return true }
    }

    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            print("Why are you shaking me?")
            randomChoice()
        }
    }
    
    func segueToResults(choice:Int) {
        let myVC:ResultsViewController = storyboard?.instantiateViewController(withIdentifier: "ResultsVC") as! ResultsViewController
        myVC.oneDish = arrayFood[choice]
        debugPrint(oneDish)
        navigationController?.pushViewController(myVC, animated: true)
    }
}

