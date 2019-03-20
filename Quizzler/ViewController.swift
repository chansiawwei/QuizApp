

import UIKit

class ViewController: UIViewController {
    
   let allQuestion=QuestionBank()
    var pickedAnswer:Bool=false
    var questionNumber:Int=0
    var score:Int=0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text=allQuestion.list[0].questionText
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag==1{
            pickedAnswer=true
        }
        else if sender.tag==2{
            pickedAnswer=false
        }
        checkAnswer()
        
        questionNumber+=1
        
        nextQuestion()
    }
    
    
    func updateUI() {
        scoreLabel.text="Score: \(score)"
        
        progressLabel.text="\(questionNumber+1)/5"
        
        progressBar.frame.size.width = (view.frame.size.width / 5 ) * CGFloat(questionNumber+1)
        
    }
    

    func nextQuestion() {
        if questionNumber<=4{
        questionLabel.text=allQuestion.list[questionNumber].questionText
            updateUI()
        }
        else {
            //Adding Alert pop up box for user to restart the quiz
            let alert=UIAlertController(title: "Awesome you have got \(score) score", message: "You have finished all the questions, do you want to start again?", preferredStyle: .alert)
            
           let restartAction=UIAlertAction(title: "Restart", style: .default, handler: {(UIAlertAction) in  self.startOver()})
            
            alert.addAction(restartAction)
            
            present(alert,animated: true,completion: nil)
            
        }
    }
    
    
    func checkAnswer() {
        let correctAnswer=allQuestion.list[questionNumber].answer
        
        if(correctAnswer==pickedAnswer){
            ProgressHUD.showSuccess("Correct!")
            score+=1

        }
        else{
            ProgressHUD.showError("wrong")
        }
    }
    
    
    func startOver() {
       questionNumber=0
        score=0
        nextQuestion()
    }
    

    
}
