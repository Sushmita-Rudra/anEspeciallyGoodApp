//
//  FirstViewController.swift
//  An ESPecially Good App
//
//  Created by student on 2/26/20.
//  Copyright © 2020 student. All rights reserved.
//

import UIKit

class GuessViewController: UIViewController {
    
    @IBOutlet weak var resultLBL: UILabel!
    
    @IBOutlet weak var scoreLBL: UILabel!

    let happyEmojis:[String] = ["🤩","🥳","😃","😎","😍","🤪","😇"]
    let sadEmojis:[String] = ["😫","😡","😨","🤧","😐","☹️","🤬"]
    
   
    
    @IBAction func tappedCircle(_ sender: Any) {
    
        if Predictions.shared.check(prediction: .circle){
    
           // Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: {_ in
            //self.resultLBL.text! = //self.happyEmojis[Int(arc4random_uniform(UInt32(self.happyEmojis.count)))]

        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { timer in
                self.resultLBL.text! = self.happyEmojis[Int(arc4random_uniform(UInt32(self.happyEmojis.count)))]

           })
            self.resultLBL.text! = "?"
        }
        else{
            self.resultLBL.text! = self.sadEmojis[Int(arc4random_uniform(UInt32(self.sadEmojis.count)))]
                     
        }
        
        Predictions.shared.generateQuestion()
        
        scoreLBL.text! = "\(Predictions.shared.numCorrect())/\(Predictions.shared.numAttempted())"
                   
        
    }
    
    @IBAction func tappedTriangle(_ sender: Any) {
        
        if Predictions.shared.check(prediction: .triangle){
              
                    self.resultLBL.text! = self.happyEmojis[Int(arc4random_uniform(UInt32(self.sadEmojis.count)))]
                
                
             }
             else{
                 
            self.resultLBL.text! = self.sadEmojis[Int(arc4random_uniform(UInt32(self.sadEmojis.count)))]
                          
             }
             
             Predictions.shared.generateQuestion()
             
             scoreLBL.text! = "\(Predictions.shared.numCorrect())/\(Predictions.shared.numAttempted())"
    }
    @IBAction func tappedStar(_ sender: Any) {
        
        if Predictions.shared.check(prediction: .star){
                self.resultLBL.text! = self.happyEmojis[Int(arc4random_uniform(UInt32(self.sadEmojis.count)))]
                
                
             }
             else{
                 
               self.resultLBL.text! = self.sadEmojis[Int(arc4random_uniform(UInt32(self.sadEmojis.count)))]
                          
             }
             
             Predictions.shared.generateQuestion()
             
             scoreLBL.text! = "\(Predictions.shared.numCorrect())/\(Predictions.shared.numAttempted())"
    }
    /*
    func timeDelay(){
        var t = 0
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            if t == 0{
                
            }
        })
    }
 */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

