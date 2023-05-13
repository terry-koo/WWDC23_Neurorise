import SwiftUI

@main
struct MyApp: App {
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                MainView()
                    .onAppear{
                        Player.playBackgroundMusic()
                    }
            }
        }
    }
}
