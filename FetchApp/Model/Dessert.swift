//
//  Data.swift
//  FetchApp
//
//  Created by Cesar Achurra on 11/08/23.
//

import SwiftUI

struct Meal: Codable {
    let meals: [Desserts]
}

struct Desserts: Codable, Identifiable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
    var id: String {idMeal}
}











