//
//  ViewController.swift
//  more
//
//  Created by 贾雨松 on 2018/3/19.
//  Copyright © 2018年 贾雨松. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var  targetLabel:UILabel!
    @IBOutlet weak var  scoreLabel:UILabel!
    @IBOutlet weak var  roundLabel:UILabel!
    @IBOutlet weak var slider:UISlider!
    
    var currentValue=0
    var targetValue=0
    var round=0
    var score=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startnewround()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func sliderMoved(slider: UISlider){
        currentValue = lroundf(slider.value)
    }
    @IBAction func showAlert(){
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        let title: String
        let mesage = "滑动条的当前数值是：\(currentValue)" +
            "\n目标数值是： \(targetValue)" +
        "\n两者的差值是： \(difference)"

        if difference == 0 {
            title = "完美！"
            points += 100
        }else if difference < 5 {
            title = "就差那么一丢丢"
            if(difference == 1){
                points += 50
            }
        }else if difference < 10 {
            title = "问题不大"
        }else {
            title = "认真点唷"
        }
        
        score += points
        
        let alert = UIAlertController(title: title,
                                      message: mesage,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title:"ok",style: .default,handler: {action in
            self.startnewround()
        })
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
            currentValue=50
            slider.value = Float(currentValue)
//        startnewround()
    }
    
    
   @IBAction func startnewround() {
        round += 1
        targetValue = 1 + Int (arc4random_uniform(100))
//    currentValue=50
//    slider.value = Float(currentValue)
       updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }


}

