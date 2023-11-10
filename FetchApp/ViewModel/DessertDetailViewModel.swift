import Foundation

class DessertDetailViewModel: ObservableObject {
    @Published var selectedDessert : DessertDetails?
    
    func fetchData(byId id: String) async {
        guard let mealDetails: MealDetail = await ApiService().downloadData(fromURL: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)") else { return }
        
        await MainActor.run {
            selectedDessert = mealDetails.meals.first
        }
    }
}
