
import Foundation

class QuestionBank {
    
    var list = [Question]()
    
    init() {
        list.append(Question(text: "Lightning never strikes in the same place twice", correctAnswer: false))
        list.append(Question(text: "If you cry in space the tear just stick to your face", correctAnswer: true))
        list.append(Question(text: "Adult have fewer bones than baby", correctAnswer: true))
        list.append(Question(text: "Birds are dinosaurs", correctAnswer: true))
        list.append(Question(text: "Drinking alcohol kills brain cell", correctAnswer: false))
        
    }
    
}


