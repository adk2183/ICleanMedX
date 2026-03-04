//
//  ICleanMedX_appApp.swiftI
//  ICleanMedX app
//
//  Created by Alan Kim on 2/19/26.
//

import SwiftUI
import FirebaseCore

@main
struct ICleanMedX_appApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            DashboardView()
        }
    }
}
