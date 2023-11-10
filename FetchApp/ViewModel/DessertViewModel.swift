//
//  DessertViewModel.swift
//  FetchApp
//
//  Created by Cesar Achurra on 11/08/23.
//

import SwiftUI

class DessertViewModel: ObservableObject {
    @Published var dessertData = [Desserts]()
    @Published var filteredDessertList = [Desserts]()
    
    func fetchData() async {
        guard let data: Meal = await ApiService().downloadData(fromURL: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
            else { return }
        
        await MainActor.run {
            dessertData = data.meals
            filteredDessertList = self.dessertData
                .filter { !$0.strMeal.isEmpty && !$0.strMealThumb.isEmpty && !$0.idMeal.isEmpty }
                .sorted { $0.strMeal < $1.strMeal }
        }
    }
    
    
    
    
}

