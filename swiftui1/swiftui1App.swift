//
//  swiftui1App.swift
//  swiftui1
//
//  Created by 永見清文 on 2020/11/30.
//

import SwiftUI

@main
struct swiftui1App: App {
    #if !os(watchOS)
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    #endif
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
#if !os(watchOS)
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
    
    // 必要に応じて処理を追加
}
#endif
