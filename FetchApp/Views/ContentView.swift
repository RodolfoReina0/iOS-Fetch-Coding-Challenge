import SwiftUI

struct ContentView: View {
    @StateObject var dessertViewModel = DessertViewModel()
    
    var body: some View {
        NavigationStack {
            List(dessertViewModel.filteredDessertList) { dessert in
                NavigationLink {
                    DessertDetailView(idMeal: dessert.idMeal)
                } label: {
                    Text(dessert.strMeal)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue)
                        )
                }

            }
            .navigationTitle("Desserts List")
        }
        .task {
            await dessertViewModel.fetchData()
        }
    }
    
}

#Preview {
    ContentView()
}
