//
//  GameViewController.swift
//  Barabara
//
//  Created by RS on 2020/05/11.
//  Copyright © 2020 osuke. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var img1: UIImageView!
    @IBOutlet var img2: UIImageView!
    @IBOutlet var img3: UIImageView!
    @IBOutlet var result: UILabel!
    
    var timer: Timer!
    var score: Int = 1000
    let defaults: UserDefaults = UserDefaults.standard
    
    let width: CGFloat = UIScreen.main.bounds.size.width
    var positionX: [CGFloat] = [0.0,0.0,0.0]
    var dx: [CGFloat] = [1.0,-0.5,-1.0]
    
    func start() {
        result.isHidden = true
        timer = Timer.scheduledTimer(timeInterval: 0.005, target: self,
                                     selector: #selector(self.up), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        positionX = [width/2,width/2,width/2]
        self.start()
        // Do any additional setup after loading the view.
    }
    
    @objc func up() {
        for i in 0 ..< 3{
            if positionX[i]  > width || positionX[i] < 0{
                dx[i] = dx[i] * ( -1)
            }
            positionX[i] += dx[i]
        }
        
        img1.center.x = positionX[2]
        img2.center.x = positionX[1]
        img3.center.x = positionX[0]
    }
    
    @IBAction func stop() {
        if timer.isValid == true {
            timer.invalidate()
            for i in 0 ..< 3 {
                score = score - abs(Int(width/2-positionX[i]))*2
            }
            result.text = "Score :" + String(score)
            result.isHidden = false
        }

        let high1: Int = defaults.integer(forKey: "score1")
        let high2: Int = defaults.integer(forKey: "score2")
        let high3: Int = defaults.integer(forKey: "score3")
            
        if score > high1{
            defaults.set(score, forKey: "score1")
            defaults.set(high1, forKey:"score2")
            defaults.set(high2, forKey: "score3")
        }else if score > high2{
            defaults.set(score, forKey:"score2")
            defaults.set(high2, forKey: "score3")
        }else if score > high3{
            defaults.set(score, forKey: "score3")
        }
    }
    
    @IBAction func retry() {
        score = 1000
        positionX = [width/2,width/2,width/2]
        
        if timer.isValid == false {
            self.start()
        }
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
}
        
        
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


