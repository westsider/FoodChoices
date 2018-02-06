//
//  ResultsViewController.swift
//  FoodChoices
//
//  Created by Warren Hansen on 2/5/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var oneDish = HealthyFood(restaurant: "Senior G’s", dish: "Grilled Fish Tacos")
    
    @IBOutlet weak var scrollView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScrollView() 
    }

    func setUpScrollView() {
        
        var foodString = "Shazam!\n\n"
        foodString += oneDish.restaurant + "\n\n"
        foodString += oneDish.dish + "\n\n"
        foodString += "Remeber...\nNo Rice, Grains, Pasta, Bread or Beans"
        scrollView.text = foodString
    }

}
