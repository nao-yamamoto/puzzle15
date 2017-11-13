//
//  CompleteViewController.swift
//  Puzzle15
//
//  Created by Naoyuki YAMAMOTO on 2017/11/13.
//  Copyright © 2017年 山本尚幸. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var mybestLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.timeLabel.text = ""
        self.mybestLabel.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.mybestLabel.isHidden = true
    }
    override func viewDidAppear(_ animated: Bool) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func pushedCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: {
            [presentingViewController] () -> Void in
            // 閉じた時に行いたい処理
            presentingViewController?.viewWillAppear(true)
        })
    }
    func checkrecord(){
        print ("----------")
        print (self.timeLabel.text!)
        let userDefaults = UserDefaults.standard
        let besttime = userDefaults.string(forKey: "besttime")
        if(besttime == nil || besttime == ""){
            self.mybestLabel.isHidden = false
            userDefaults.set(self.timeLabel.text!, forKey: "besttime")
        } else {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm.ss"
            let date1 = formatter.date(from: besttime!)!
            let date2 = formatter.date(from: self.timeLabel.text!)!
            
            if (date1 > date2){
                print("best")
                self.mybestLabel.isHidden = false
                userDefaults.set(self.timeLabel.text!, forKey: "besttime")
            } else {
                self.mybestLabel.isHidden = true
            }
            
        }

    }
}
