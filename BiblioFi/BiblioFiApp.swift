import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct BiblioFiApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @State private var isLoggedIn: Bool = UserDefaults.standard.bool(forKey: "isLoggedIn")
    
    var body: some Scene {
        WindowGroup {
            Group {
                if isLoggedIn {
                    NewSwift()
                } else {
                    ContentView()
                }
            }
            .onAppear {
                // Update the isLoggedIn state when the app launches
                self.isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
            }
        }
    }
}
