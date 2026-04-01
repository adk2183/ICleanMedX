//
//  ICleanMedX_App.swiftI
//  ICleanMedX app
//
//  Created by Alan Kim on 2/19/26.
//

import SwiftUI
import FirebaseCore

@main
struct ICleanMedX_App: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                DashboardView()
            }
        }
    }

}
