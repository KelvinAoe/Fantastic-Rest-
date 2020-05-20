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
    
    @IBOutlet weak var switchOne: UISwitch!
    @IBOutlet weak var switchTwo: UISwitch!
    @IBOutlet weak var switchThree: UISwitch!
    
    
    var timer1Starter = 3600
    var timer2Starter = 5400
    var timer3Starter = 7200
    
    var switch1State:Bool = false
    var switch2State:Bool = false
    var switch3State:Bool = false
    
    
    
    
    
    override func viewDidLoad() {
        
        switchOne.isOn = false
        switchTwo.isOn = false
        switchThree.isOn = false
        
        
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
//
//        }
    }
    
    
    
    
    @IBAction func switch1Toggled(_ sender: UISwitch) {
        if switchOne.isOn == true{
            switchThree.isEnabled = false
                      switchTwo.isEnabled = false
            switch1State = true
                   
                   let content = UNMutableNotificationContent()
                          content.title = "Hey you!"
                           content.sound = .default
                          content.body = "List it down here and start to be productive!"
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
            
            
            
            return
        }else{
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["timer1"])
            switchThree.isEnabled = true
            switchTwo.isEnabled = true
        }
        save()
        
    }
  
    
    
    @IBAction func switch2Toogled(_ sender: UISwitch) {
        if switchTwo.isOn == true{
            switchThree.isEnabled = false
                                 switchOne.isEnabled = false
            switch2State = true
            
                let content = UNMutableNotificationContent()
                       content.title = "Hey you!"
                        content.sound = .default
                       content.body = "List it down here and start to be productive!"
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
            }
        save()
       
        }
    
    @IBAction func switch3Toogled(_ sender: UISwitch) {
        if switchThree.isOn == true{
            switchOne.isEnabled = false
            switchTwo.isEnabled = false
            switch3State = true
            
            let content = UNMutableNotificationContent()
                                  content.title = "Hey you!"
                                   content.sound = .default
                                  content.body = "List it down here and start to be productive!"
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
        }
        save()
        
    }
    
    func save(){
    UserDefaults.standard.set(switch1State, forKey: "switch1IsOn")
    UserDefaults.standard.set(switch2State, forKey: "switch2IsOn")
    UserDefaults.standard.set(switch3State, forKey: "switch3IsOn")
    
    UserDefaults.standard.synchronize()
    
    }
    
    }
    
