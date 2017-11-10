//
//  ViewController.swift
//  Puzzle15
//
//  Created by Naoyuki YAMAMOTO on 2017/11/09.
//  Copyright © 2017年 山本尚幸. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var btn01: UIButton!
    @IBOutlet weak var btn02: UIButton!
    @IBOutlet weak var btn03: UIButton!
    @IBOutlet weak var btn04: UIButton!
    @IBOutlet weak var btn05: UIButton!
    @IBOutlet weak var btn06: UIButton!
    @IBOutlet weak var btn07: UIButton!
    @IBOutlet weak var btn08: UIButton!
    @IBOutlet weak var btn09: UIButton!
    @IBOutlet weak var btn10: UIButton!
    @IBOutlet weak var btn11: UIButton!
    @IBOutlet weak var btn12: UIButton!
    @IBOutlet weak var btn13: UIButton!
    @IBOutlet weak var btn14: UIButton!
    @IBOutlet weak var btn15: UIButton!
    
    var numButtons: [UIButton] = []
    let btnWHSize: CGFloat = 90.0;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.numButtons = getNumButtonArray()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pushedNumBtn(_ sender: Any) {
        print("pushed")
        if let btn = sender as? UIButton {
            print(btn.frame.origin.x)
            print(btn.frame.origin.y)
            
            if(isBlankLeft(x:btn.frame.origin.x, y:btn.frame.origin.y)){
                // 左にボタンを移動
                UIView.animate(withDuration: 0.3, animations: { () -> Void in
                    btn.frame = CGRect(x: btn.frame.origin.x-90, y: btn.frame.origin.y, width: 90, height: 90)
                }, completion: { finished in
                    // 完了チェック
                    if(self.checkComplete()){
                        
                    }
                })
            } else if(isBlankRight(x: btn.frame.origin.x, y: btn.frame.origin.y)){
                // 右に移動
                UIView.animate(withDuration: 0.3, animations: { () -> Void in
                    btn.frame = CGRect(x: btn.frame.origin.x+90, y: btn.frame.origin.y, width: 90, height: 90)
                }, completion: { finished in
                    // 完了チェック
                    if(self.checkComplete()){
                        
                    }
                })
            } else if(isBlankUpper(x: btn.frame.origin.x, y: btn.frame.origin.y)){
                // 上に移動
                UIView.animate(withDuration: 0.3, animations: { () -> Void in
                    btn.frame = CGRect(x: btn.frame.origin.x, y: btn.frame.origin.y-90, width: 90, height: 90)
                }, completion: { finished in
                    // 完了チェック
                    if(self.checkComplete()){
                        
                    }
                })
            } else if(isBlankBottom(x: btn.frame.origin.x, y: btn.frame.origin.y)){
                // 下に移動
                UIView.animate(withDuration: 0.3, animations: { () -> Void in
                    btn.frame = CGRect(x: btn.frame.origin.x, y: btn.frame.origin.y+90, width: 90, height: 90)
                }, completion: { finished in
                    // 完了チェック
                    if(self.checkComplete()){
                        
                    }
                })
            }
        }
    }
    
    // 上は空いてる？
    func isBlankUpper(x:CGFloat, y:CGFloat) -> Bool{
        if(y == 0) {
            return false
        }
        let array = self.numButtons

        for item in array {
            if (item.frame.origin.x == x && item.frame.origin.y == y-90){
                print(item.tag)
                return false
            }
        }
        
        return true
    }
    // 下は空いてる？
    func isBlankBottom(x:CGFloat, y:CGFloat) -> Bool{
        if(y == 90*3) {
            return false
        }
        let array = self.numButtons

        for item in array {
            if (item.frame.origin.x == x && item.frame.origin.y == y+90){
                print(item.tag)
                return false
            }
        }
        
        return true
    }
    // 左あいてる？
    func isBlankLeft(x:CGFloat, y:CGFloat) -> Bool{
        if(x == 0) {
            return false
        }
        let array = self.numButtons

        for item in array {
            if (item.frame.origin.x == x-90 && item.frame.origin.y == y){
                print(item.tag)
                return false
            }
        }
        
        return true
    }
    // 右空いてる？
    func isBlankRight(x:CGFloat, y:CGFloat) -> Bool{
        if(x == 90*3) {
            return false
        }
        let array = self.numButtons
        
        for item in array {
            if (item.frame.origin.x == x+90 && item.frame.origin.y == y){
                print(item.tag)
                return false
            }
        }
        
        return true
    }
    
    func getNumButtonArray() -> [UIButton]{
        var array:[UIButton] = []
        array.append(self.btn01)
        array.append(self.btn02)
        array.append(self.btn03)
        array.append(self.btn04)
        array.append(self.btn05)
        array.append(self.btn06)
        array.append(self.btn07)
        array.append(self.btn08)
        array.append(self.btn09)
        array.append(self.btn10)
        array.append(self.btn11)
        array.append(self.btn12)
        array.append(self.btn13)
        array.append(self.btn14)
        array.append(self.btn15)

        return array
    }

    func checkComplete() -> Bool {
        if(self.btn01.frame.origin.x != 0           || self.btn01.frame.origin.y != 0){
            return false
        }
        if(self.btn02.frame.origin.x != btnWHSize   || self.btn02.frame.origin.y != 0){
            return false
        }
        if(self.btn03.frame.origin.x != btnWHSize*2 || self.btn03.frame.origin.y != 0){
            return false
        }
        if(self.btn04.frame.origin.x != btnWHSize*3 || self.btn04.frame.origin.y != 0){
            return false
        }
        if(self.btn05.frame.origin.x != 0           || self.btn05.frame.origin.y != btnWHSize){
            return false
        }
        if(self.btn06.frame.origin.x != btnWHSize   || self.btn06.frame.origin.y != btnWHSize){
            return false
        }
        if(self.btn07.frame.origin.x != btnWHSize*2 || self.btn07.frame.origin.y != btnWHSize){
            return false
        }
        if(self.btn08.frame.origin.x != btnWHSize*3 || self.btn08.frame.origin.y != btnWHSize){
            return false
        }
        if(self.btn09.frame.origin.x != 0           || self.btn09.frame.origin.y != btnWHSize*2){
            return false
        }
        if(self.btn10.frame.origin.x != btnWHSize   || self.btn10.frame.origin.y != btnWHSize*2){
            return false
        }
        if(self.btn11.frame.origin.x != btnWHSize*2 || self.btn11.frame.origin.y != btnWHSize*2){
            return false
        }
        if(self.btn12.frame.origin.x != btnWHSize*3 || self.btn12.frame.origin.y != btnWHSize*2){
            return false
        }
        if(self.btn13.frame.origin.x != 0           || self.btn13.frame.origin.y != btnWHSize*3){
            return false
        }
        if(self.btn14.frame.origin.x != btnWHSize   || self.btn14.frame.origin.y != btnWHSize*3){
            return false
        }
        if(self.btn15.frame.origin.x != btnWHSize*2 || self.btn15.frame.origin.y != btnWHSize*3){
            return false
        }

        
        return true
    }
    
}

