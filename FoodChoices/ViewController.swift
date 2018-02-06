//
//  ViewController.swift
//  FoodChoices
//
//  Created by Warren Hansen on 2/5/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

// MARK: - TODO - refactor model
// MARK: - TODO - Show used choices
// MARK: - TODO - add new dishes

import UIKit
import RealmSwift

struct HealthyFood {
    var restaurant = ""
    var dish = ""
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var arrayFood:[HealthyFood] = []
    
    var oneDish = HealthyFood()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Good Local Food"
        self.becomeFirstResponder() // To get shake gesture
        
        oneDish = HealthyFood(restaurant: "Senior G’s", dish: "Grilled Fish Tacos") //Senior G’s Fish Tacos, chicken + veggies, healthy Start Burrito
        
        arrayFood.append(oneDish)
        oneDish.dish = "Chicken + Veggies"
        arrayFood.append(oneDish)
        oneDish.dish = "Healthy Start Burrito"
        arrayFood.append(oneDish)
        
        oneDish.restaurant = "Mendocino Farms"
        oneDish.dish = "Avocado and Quinoa Ensalada + Chicken"
        arrayFood.append(oneDish)
        oneDish.dish = "Mendo's Chicken Cobb Salad"
        arrayFood.append(oneDish)
        
        oneDish.restaurant = "Playa Provisions"
        oneDish.dish = "Salmon (eve)"
        arrayFood.append(oneDish)
        oneDish.dish = "Grilled Fish Tacos"
        arrayFood.append(oneDish)
        
        oneDish.restaurant = "Whole Foods"
        oneDish.dish = "Turkey Meatloaf + Vegetables"
        arrayFood.append(oneDish)
        oneDish.dish = "Salad with Chicken"
        arrayFood.append(oneDish)
        oneDish.dish = "Salad with Tuna"
        arrayFood.append(oneDish)
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
    
    // We are willing to become first responder to get shake motion
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    // Enable detection of shake motion
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

