//
//  Food Model.swift
//  FoodChoices
//
//  Created by Warren Hansen on 2/5/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

import Foundation

struct HealthyFood {
    var restaurant = ""
    var dish = ""
}

class BasicFood   {

    func setUp()-> [HealthyFood] {
        
        var arrayFood:[HealthyFood] = []
        var oneDish = HealthyFood()
        
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
        
        return arrayFood
    }
}
