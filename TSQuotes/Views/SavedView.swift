import SwiftUI

struct SavedView: View {
    @EnvironmentObject private var savedViewModel: SavedViewModel
    
    var body: some View {
        NavigationView() {
            if savedViewModel.quotes.isEmpty {
                VStack {
                    Text("No saved quotes found.")
                        .padding(.horizontal)
                }
            } else {
                List(savedViewModel.quotes, id: \.id) { quote in
                    NavigationLink(destination: SavedDetailView(quote: quote)) {
                        Text(quote.quote)
                            .frame(height: 20)
                            .truncationMode(.tail)
                    }
                    .navigationBarTitle("")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}
