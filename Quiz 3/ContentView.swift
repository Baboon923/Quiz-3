import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Kevin()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            
            Venkatesh()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
            Shlock()
                .tabItem {
                    Label("Order", systemImage: "highlighter")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

