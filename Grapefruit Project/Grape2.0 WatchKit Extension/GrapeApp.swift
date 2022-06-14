//
//  Grape2_0App.swift
//  Grape2.0 WatchKit Extension
//
//  Created by Antonio Mennillo on 08/12/2020.
//

import SwiftUI

@main
struct Grape2_0App: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(techniques: TechniquesList.all()[0]) 
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
