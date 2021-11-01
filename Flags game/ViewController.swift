
import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries = ["estonia","italy","russia","nigeria","ireland","spain","germany","monaco","poland","us","uk","france"];
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        let uppercasedCountry = countries[correctAnswer].uppercased()

        title = "Score: \(score) — Tap on: \(uppercasedCountry)'s flags"

        if score == 3 {
            title = "Game over!"
            let endTheGame = UIAlertController(title: title, message: """
You win the game!
Your score is: \(score)
Tap "Play again" to start the new game
""", preferredStyle: .alert)
            endTheGame.addAction(UIAlertAction(title: "Play again", style: .default, handler: askQuestion))

            present(endTheGame, animated: true)
            score = 0
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
        }else{
            title = "Wrong!"
            let endTheGame = UIAlertController(title: title, message: "That's the flag of \(countries[sender.tag].uppercased())", preferredStyle: .alert)
            endTheGame.addAction(UIAlertAction(title: "Play again", style: .default, handler: askQuestion))

            present(endTheGame, animated: true)
            score = 0
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
    }
}
