//
//  Predictions.swift
//  An ESPecially Good App
//
//  Created by student on 2/26/20.
//  Copyright © 2020 student. All rights reserved.
//

import Foundation

enum Shape : CaseIterable{
    case circle,triangle,star
}

struct Question{
    var actualShape:Shape!
    var predictedShape:Shape!
    var isCorrect:Bool?{
        get{
            var  shapeTester:Bool = false
            if actualShape == predictedShape{
                shapeTester = true
            }
            else if actualShape == nil || predictedShape == nil{
                shapeTester = false
            }
            return shapeTester
        }
    }
}

class Predictions{
    
    
    private static var _shared:Predictions!
    
    static var shared:Predictions{
        if _shared == nil{
            _shared = Predictions()
        }
        return _shared
    
    }
    var questions:[Question] = []
    var currentQuestion:Question!
    
   // var ShapeQuestion = Question()
    func generateQuestion(){
        /*
        let randomQuestionGeneration = Shape.allCases.randomElement()!
        currentQuestion.actualShape = randomQuestionGeneration
        currentQuestion.predictedShape = nil
 */
        currentQuestion = Question(actualShape: Shape.allCases.randomElement()!, predictedShape: nil)
        //return currentQuestion
        
        
        
    }
    
    func check(prediction:Shape) -> Bool{
        //ShapeQuestion.predictedShape = prediction
        currentQuestion.predictedShape = prediction
        questions.append(currentQuestion)
    
        if currentQuestion.isCorrect!{
            return true
        }
        else{
            return false
        }
     
    }
    
    func numAttempted() -> Int{
        return questions.count
    }
    
    func numCorrect() -> Int{
        var countOfCorrect:Int = 0
        for ques in questions{
            if ques.isCorrect == true{
                countOfCorrect += 1
            }
        }
        return countOfCorrect
    }
    
    func clearResults(){
        questions = []
    }
    
    init(){
        generateQuestion()
    }
    
    func question(at:Int) -> Question!{
        if at >= 0 && at < questions.count{
            return questions[at]
            
        }
        else{
            return nil
        }
        
    }
    
}
