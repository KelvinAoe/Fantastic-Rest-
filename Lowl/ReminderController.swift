//
//  ReminderContoller.swift
//  Lowl
//
//  Created by Dayton on 18/05/20.
//  Copyright © 2020 Muhammad Harviando. All rights reserved.
//

import UIKit
import UserNotifications

class ReminderController: UIViewController, UNUserNotificationCenterDelegate {
    
    @IBOutlet weak var backButton: UIButton!
    
    
    @IBOutlet weak var switchOne: UISwitch!
    @IBOutlet weak var switchTwo: UISwitch!
    @IBOutlet weak var switchThree: UISwitch!
    
    @IBOutlet weak var reminderTitle: UILabel!
    @IBOutlet weak var firstReminder: UILabel!
    @IBOutlet weak var secondReminder: UILabel!
    @IBOutlet weak var thirdReminder: UILabel!
    @IBOutlet weak var appExplanation: UILabel!
    
    
    var timer1Starter = 3600
    var timer2Starter = 5400
    var timer3Starter = 7200
    
    var switch1State:Bool = false
    var switch2State:Bool = false
    var switch3State:Bool = false
    
    
    
    override func viewDidLoad() {
        
       // MARK: Accessibility
                backButton.isAccessibilityElement = true
                backButton.accessibilityLabel = "Back"
                
                reminderTitle.font = UIFont.preferredFont(for: .largeTitle, weight: .semibold)
                reminderTitle.adjustsFontForContentSizeCategory = true
               
                firstReminder.font = UIFont.preferredFont(for: .title2, weight: .regular)
                firstReminder.adjustsFontForContentSizeCategory = true
                
                secondReminder.font = UIFont.preferredFont(for: .title2, weight: .regular)
                secondReminder.adjustsFontForContentSizeCategory = true
                
                thirdReminder.font = UIFont.preferredFont(for: .title2, weight: .regular)
                thirdReminder.adjustsFontForContentSizeCategory = true
                
                appExplanation.font = UIFont.preferredFont(for: .callout, weight: .light)
                appExplanation.adjustsFontForContentSizeCategory = true
                
            
                   
                switchOne.isAccessibilityElement = true
                switchOne.accessibilityLabel = "1 hour reminder"
                
                
                
                
                switchTwo.isAccessibilityElement = true
                switchTwo.accessibilityLabel = "1.5 hour reminder"
                
                switchThree.isAccessibilityElement = true
                switchThree.accessibilityLabel = "2 hour reminder"
                
                
                switchOne.transform = CGAffineTransform(scaleX: 1.42, y: 1.42)
                switchTwo.transform = CGAffineTransform(scaleX: 1.42, y: 1.42)
                switchThree.transform = CGAffineTransform(scaleX: 1.42, y: 1.42)
                
                
                //MARK: Setting notification
                
                
                UNUserNotificationCenter.current().delegate = self
                //step 1 ask for permission
                let center = UNUserNotificationCenter.current()
                center.requestAuthorization(options: [.alert, .sound]) {
                    (granted, error) in
                    
                    if let error = error{
                        print(error)
                    }else{
                        print("User is ", granted)
                }
                }
                
                switchOne.isOn = UserDefaults.standard.bool(forKey: "switch1IsOn")
                switchTwo.isOn = UserDefaults.standard.bool(forKey: "switch2IsOn")
                switchThree.isOn = UserDefaults.standard.bool(forKey: "switch3IsOn")
                
                
                
                if switchOne.isOn == true{
                    switchTwo.isEnabled = false
                    switchThree.isEnabled = false
                }else if switchTwo.isOn == true {
                    switchOne.isEnabled = false
                    switchThree.isEnabled = false
                }else if switchThree.isOn == true {
                    switchOne.isEnabled = false
                    switchTwo.isEnabled = false
                }else {
                    switchOne.isEnabled = true
                    switchTwo.isEnabled = true
                    switchThree.isEnabled = true
                }
               

            }
            
            //MARK: Switch1 Toogled
            @IBAction func switch1Toggled(_ sender: UISwitch) {
                if switchOne.isOn == true{
                    
                    switch1State = true
                    switchThree.isEnabled = false
                    switchTwo.isEnabled = false
                    
                    
                           
                           let content = UNMutableNotificationContent()
                                  content.title = "Hey you!"
                                   content.sound = .default
                                  content.body = "You have worked hard today! Take a rest with us, won't you? It will be fun!"
                                  
                                  //step3  create the notifications trigger
                                  let targetTime = timer1Starter
                           let trigger =  UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(targetTime), repeats: true)
                                  
                                  
                                  let request = UNNotificationRequest(identifier: "timer1", content: content, trigger: trigger)
                                  
                                  UNUserNotificationCenter.current().add( request, withCompletionHandler: {error in
                                      if error != nil {
                                          print("Something went wrong")
                                      }
                                  })
                }else{
                    UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["timer1"])
                    switchThree.isEnabled = true
                    switchTwo.isEnabled = true
                    switch1State = false
                }
                save()
                print("Switch 1 state = \(switch1State)")
            }
          
            
            //MARK: Switch2 Toogled
            @IBAction func switch2Toogled(_ sender: UISwitch) {
                if switchTwo.isOn == true{
                    switch2State = true
                    switchThree.isEnabled = false
                    switchOne.isEnabled = false
                    
                        let content = UNMutableNotificationContent()
                               content.title = "Hey you!"
                                content.sound = .default
                               content.body = "You have worked hard today! Take a rest with us, won't you? It will be fun!"
                               
                               //step3  create the notifications trigger
                               let targetTime = timer2Starter
                        let trigger =  UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(targetTime), repeats: true)
                               
                               
                               let request = UNNotificationRequest(identifier: "timer2", content: content, trigger: trigger)
                               
                               UNUserNotificationCenter.current().add( request, withCompletionHandler: {error in
                                   if error != nil {
                                       print("Something went wrong")
                                   }
                               })
                    
                    
                    }else{
                        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["timer2"])
                    switchThree.isEnabled = true
                    switchOne.isEnabled = true
                    switch2State = false
                    }
                save()
                print("Switch 2 State = \(switch2State)")
               
                }
            
            //MARK: Switch3 Toogled
            @IBAction func switch3Toogled(_ sender: UISwitch) {
                if switchThree.isOn == true{
                     switch3State = true
                    switchOne.isEnabled = false
                    switchTwo.isEnabled = false
                    
                    let content = UNMutableNotificationContent()
                                          content.title = "Hey you!"
                                           content.sound = .default
                                          content.body = "You have worked hard today! Take a rest with us, won't you? It will be fun!"
                                          
                                          //step3  create the notifications trigger
                                          let targetTime = timer3Starter
                                   let trigger =  UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(targetTime), repeats: true)
                                          
                                          
                                          let request = UNNotificationRequest(identifier: "timer3", content: content, trigger: trigger)
                                          
                                          UNUserNotificationCenter.current().add( request, withCompletionHandler: {error in
                                              if error != nil {
                                                  print("Something went wrong")
                                              }
                                          })
                    
                }else{
                    UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["timer3"])
                    switchTwo.isEnabled = true
                    switchOne.isEnabled = true
                    switch3State = false
                }
                save()
                print("Switch 3 State = \(switch3State)")
                
            }
            
            //MARK: UserDefaults Saving
            
            func save(){
            UserDefaults.standard.set(switch1State, forKey: "switch1IsOn")
            UserDefaults.standard.set(switch2State, forKey: "switch2IsOn")
            UserDefaults.standard.set(switch3State, forKey: "switch3IsOn")
            
            UserDefaults.standard.synchronize()
            
            }
            
            }
            
            // MARK: UIFont Extension

        extension UIFont {
            static func preferredFont(for style: TextStyle, weight: Weight) -> UIFont {
                let metrics = UIFontMetrics(forTextStyle: style)
                let desc = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style)
                let font = UIFont.systemFont(ofSize: desc.pointSize, weight: weight)
                return metrics.scaledFont(for: font)
            }
        }


        class AccessibilityUiSwitch: UISwitch {
            override var accessibilityValue: String? {
                get {
                    return isOn ? "on" : "off"
                }
                set {
                    self.accessibilityValue = newValue
                }
            }
        }
