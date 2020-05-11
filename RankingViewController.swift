//
//  RankingViewController.swift
//  Barabara
//
//  Created by RS on 2020/05/11.
//  Copyright © 2020 osuke. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController {
    @IBOutlet var rank1: UILabel!
    @IBOutlet var rank2: UILabel!
    @IBOutlet var rank3: UILabel!
    
    let defaults: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        rank1.text = String(defaults.integer(forKey: "score1"))
        rank2.text = String(defaults.integer(forKey: "score2"))
        rank3.text = String(defaults.integer(forKey: "score3"))
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
