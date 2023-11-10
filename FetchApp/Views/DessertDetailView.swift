import SwiftUI

struct DessertDetailView: View {
    @StateObject var dessertDetailViewModel = DessertDetailViewModel()
    let idMeal: String
    
    var body: some View {
        let selectedDessert = dessertDetailViewModel.selectedDessert
        
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Ingredients/Measurements")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .padding(.horizontal)
                
                if let ingredients = selectedDessert?.ingredients, let measurements = selectedDessert?.measurements {
                    ForEach(Array(zip(ingredients, measurements)).indices, id: \.self) { index in
                        let ingredient = ingredients[index]
                        let measurement = measurements[index]
                        
                        HStack {
                            Text("\(ingredient) - ")
                                .foregroundColor(.primary)
                                .font(.body)
                                .fontWeight(.semibold)
                            
                            Text(measurement)
                                .foregroundColor(.primary)
                                .font(.body)
                        }
                        .padding(.horizontal)
                    }
                } else {
                    Text("No ingredients available.")
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                }
            }
            .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Instructions")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                Text(selectedDessert?.strInstructions ?? "No instructions available.")
                    .foregroundColor(.primary)
                    .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .navigationTitle(selectedDessert?.strMeal ?? "")
        .task{ await dessertDetailViewModel.fetchData(byId: idMeal) }
    }
}
