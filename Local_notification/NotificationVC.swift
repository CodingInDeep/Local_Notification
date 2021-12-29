//
//  ViewController.swift
//  Local_notification
//
//  Created by Deep Mahajan.
//

import UIKit
import UserNotifications

class NotificationVC: UIViewController, UNUserNotificationCenterDelegate {
    
    //MARK:- properties
    let notificationCenter = UNUserNotificationCenter.current()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationCenter.delegate = self
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
            }
    }
    
    //MARK:- Actions
    @IBAction func btnLocalNotification(_ sender: Any) {
        // Content
        let content  = UNMutableNotificationContent()
        content.categoryIdentifier = "My Category Identifier"
        content.title = "Local Notification"
        content.body = "Example of Local Notification"
        content.badge = 1
        content.sound = UNNotificationSound.default
        
        //Trigger time
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 2, repeats: false)
        let identifier = "Main Identifier"
        
        //Request
        let request = UNNotificationRequest.init(identifier: identifier, content: content, trigger: trigger)
        
        //add request to notification center
        notificationCenter.add(request) { (error) in print("\(String(describing: error?.localizedDescription))")
            
        }
  
        func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            completionHandler([.alert, .badge, .sound])
        }
   
    }
 
}

