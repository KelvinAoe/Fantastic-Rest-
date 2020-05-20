//
//  SecondViewController.swift
//  Lowl
//
//  Created by Muhammad Harviando on 11/05/20.
//  Copyright © 2020 Muhammad Harviando. All rights reserved.
//

import UIKit
import ARKit //AR

class SecondViewController: UIViewController, ARSessionDelegate {
    
        var session:ARSession! //AR
        var timer  = Timer()
        var isTimerRunning = false
        var counter = 0
    
    
    
    
        var blinkCount : Int = 0
        var blinkCD : Float = 3.0
        var isBlinked : Bool = false
        var kelopakKiriTurun : Bool = false
        var kelopakKananTurun : Bool = false
        @IBOutlet weak var blinkCounterLabel: UILabel!
        @IBOutlet weak var kelopakAtasKiri: UIImageView!
        @IBOutlet weak var kelopakBawahKiri: UIImageView!
        @IBOutlet weak var kelopakAtasKanan: UIImageView!
        @IBOutlet weak var kelopakBawahKanan: UIImageView!
        @IBOutlet weak var buttonContinue1: UIButton!
        @IBOutlet weak var timerLabel: UILabel!
        @IBOutlet weak var startButton: UIButton!
    
    
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        blinkCounterLabel.text = "\(blinkCount)"
        
        session = ARSession() //AR
        session.delegate = self //AR
        
        startButton.layer.cornerRadius = 10
        startButton.clipsToBounds = true
    }
    @IBAction func startDidTap(_ sender: Any) {
        if !isTimerRunning{
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,  selector: #selector(runTimer), userInfo: nil, repeats: true)
            isTimerRunning = true
        }
    }
    
    @objc func runTimer() {
       counter += 10
        let flooredCounter = Int(floor(Double(counter)))
        
        let minute = (flooredCounter % 3600) / 60
        var minuteString = "\(minute)"
        if minute < 10{
            minuteString = "0\(minute)"
        }
        
        let second = (flooredCounter % 3600) % 60
         var secondString = "\(second)"
        
        if second < 10{
        secondString = "0\(second)"
        }
        
        
        timerLabel.text = "\(minuteString):\(secondString)"
        
      
        if minute == 1{
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewControllerID")as!FirstViewController
            self.present(vc,animated: true,completion: nil)
        }
        
        }
    
    
    
    override func viewWillAppear(_ animated: Bool) { //AR
        super.viewWillAppear(animated)
        
        guard ARFaceTrackingConfiguration.isSupported else {print("iPhone X required"); return}
        
        let configuration = ARFaceTrackingConfiguration()
        
        session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
        
    }
    
    override var shouldAutorotate: Bool { //AR
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask { //AR
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) { //AR
        if let faceAnchor = anchors.first as? ARFaceAnchor {
            update(withFaceAnchor: faceAnchor)
        }
    }
    
    func update(withFaceAnchor faceAnchor: ARFaceAnchor) { //ENGINE AR NYA INI CUK
        var bledShapes:[ARFaceAnchor.BlendShapeLocation:Any] = faceAnchor.blendShapes
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .medium)
        guard let leftBlink = bledShapes[.eyeBlinkLeft] as? Float else {return}
        guard let rightBlink = bledShapes[.eyeBlinkRight] as? Float else {return}
        print("Kiri \(leftBlink)")
        print("Kanan \(rightBlink)")

//FUNGSI UNTUK NAMBAHIN BLINK COUNT+++++++++++++++++++++++
        if (leftBlink > 0.5 && rightBlink > 0.5 && isBlinked == false){
            isBlinked = true
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                print("Timer fired!")
                self.blinkCD -= 1

                if(self.blinkCD == 0) {
                    timer.invalidate()
                    self.blinkCount += 1
                    self.blinkCounterLabel.text = "\(self.blinkCount)"
                    self.blinkCD = 3
                    impactFeedbackgenerator.prepare()
                    impactFeedbackgenerator.impactOccurred()
                    self.isBlinked = false
                }
            }
        }else {
        }
        
//FUNGSI UNTUK NAMPILIN TOMBOL SETELAH 20 KALI BLINK
        if (blinkCount >= 20){
            isBlinked = true
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            timer.invalidate()
            }
            buttonContinue1.isHidden = false
            blinkCount = 0
            blinkCD = 3
        }
        
//FUNGSI UNTUK ANIMASI KELOPAK MATA+++++++++++++++++++++++
        if (rightBlink > 0.5 && kelopakKiriTurun == false)
        {
            kelopakKiriTurun = true
            UIView.animate(withDuration: 0.6, animations: {
            self.kelopakAtasKiri.frame.origin.y += 24; }, completion: nil)
        
            UIView.animate(withDuration: 0.6, animations: {
            self.kelopakBawahKiri.frame.origin.y -= 24; }, completion: nil)
        }
        
        if (rightBlink < 0.5 && kelopakKiriTurun == true){
            kelopakKiriTurun = false
            UIView.animate(withDuration: 0.6, animations: {
            self.kelopakAtasKiri.frame.origin.y -= 24; }, completion: nil)
            
            UIView.animate(withDuration: 0.6, animations: {
            self.kelopakBawahKiri.frame.origin.y += 24; }, completion: nil)
        }
        
        if (leftBlink > 0.5 && kelopakKananTurun == false)
        {
            kelopakKananTurun = true
            UIView.animate(withDuration: 0.6, animations: {
            self.kelopakAtasKanan.frame.origin.y += 24; }, completion: nil)
        
            UIView.animate(withDuration: 0.6, animations: {
            self.kelopakBawahKanan.frame.origin.y -= 24; }, completion: nil)
        }
        
        if (rightBlink < 0.5 && kelopakKananTurun == true){
            kelopakKananTurun = false
            UIView.animate(withDuration: 0.6, animations: {
            self.kelopakAtasKanan.frame.origin.y -= 24; }, completion: nil)
            
            UIView.animate(withDuration: 0.6, animations: {
            self.kelopakBawahKanan.frame.origin.y += 24; }, completion: nil)
        }
    }

    @IBAction func buttonBack(_ sender: UIButton) {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
        timer.invalidate()
        }
        blinkCD = 3
        blinkCount = 0
    }
    

    
    
    
    
}
