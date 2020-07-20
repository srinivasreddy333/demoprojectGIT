//
//  ViewController.swift
//  DemoTimer
//
//  Created by Vivek Dharmani on 09/07/20.
//  Copyright © 2020 Vivek Dharmani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   @IBOutlet var playBtn: UIButton!
     
     @IBOutlet var titleLbl: UILabel!
     
     var timer = Timer()
     var countr = 0.0
     var isRunning = false
     var btnChange = true
     
     
     override func viewDidLoad() {
         super.viewDidLoad()
         titleLbl.text = "\(countr)"
     }

     @IBAction func resetClick(_ sender: UIButton) {
         timer.invalidate()
        countr = 0.0
         titleLbl.text = "\(countr)"
         isRunning = false
        playBtn.setImage( #imageLiteral(resourceName: "play"), for: .normal)
        btnChange = true
     }
     
     @IBAction func playClick(_ sender: UIButton) {
        if btnChange == true{
            btnChange = false
         if !isRunning{
            playBtn.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
             timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTime), userInfo: nil, repeats: true)
             isRunning = true
         }
        }else{
            btnChange = true
            playBtn.setImage( #imageLiteral(resourceName: "play"), for: .normal)
            timer.invalidate()
            isRunning = false
        }
     }
     
     @objc func UpdateTime(){
         countr += 0.1
         titleLbl.text = String(format: "%.1f", countr)
     }
}

