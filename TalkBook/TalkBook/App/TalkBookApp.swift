//
//  TalkBookApp.swift
//  TalkBook
//
//  Created by Imran on 21/10/23.
//

import SwiftUI
import Cloudinary

@main
struct TalkBookApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State private var appState: AppState = .splash

    
    var body: some Scene {
        WindowGroup {
            ContentView(appState: $appState)
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
//    public var cloudinary: CLDCloudinary?
//    func initCloudinary() {
//        // init cloudinary if there's a cloud name present (Otherwise the first load will require the user to type in his cloud name).
//  
//        if let cloudName = UserDefaults.standard.object(forKey: "cloud_name") {
//            cloudinary = CLDCloudinary(configuration: CLDConfiguration(options: ["cloud_name": cloudName as AnyObject])!)
//            print("cloudName\(cloudinary)")
//        }
//    }
//    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        initCloudinary()
        //CLOUDINARY_URL=cloudinary://476142822697917:ijoossGqF3TRT9SHdBxMxhHuTpk@devsloop
        let config = CLDConfiguration(cloudinaryUrl: "CLOUDINARY_URL=cloudinary://476142822697917:ijoossGqF3TRT9SHdBxMxhHuTpk@devsloop")
        let cloudinary = CLDCloudinary(configuration: config ?? CLDConfiguration(cloudName: "devsloop"))
        
        
        
        CLDCloudinary.logLevel = CLDLogLevel.debug

        print("CLDCloudinary.logLevel: \(CLDCloudinary.logLevel)")
        
        print("cloudinary: \(cloudinary)")
        print("config: \(config)")
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

}
