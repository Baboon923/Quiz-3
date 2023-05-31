import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Kevin()
                .tabItem {
                    Label("Kevin", systemImage: "list.dash")
                }
            
            Venkatesh()
                .tabItem {
                    Label("Venkatesh", systemImage: "square.and.pencil")
                }
            Shlock()
                .tabItem {
                    Label("Shlock", systemImage: "highlighter")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

