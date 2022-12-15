//
//  ViewController.swift
//  TicTacToeApp
//
//  Created by Joel Pena Navarro on 2022-12-07.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var square1Img: UIImageView!
    @IBOutlet weak var square2Img: UIImageView!
    @IBOutlet weak var square3Img: UIImageView!
    @IBOutlet weak var square4Img: UIImageView!
    @IBOutlet weak var square5Img: UIImageView!
    @IBOutlet weak var square6Img: UIImageView!
    @IBOutlet weak var square7Img: UIImageView!
    @IBOutlet weak var square8Img: UIImageView!
    @IBOutlet weak var square9Img: UIImageView!
    
    @IBOutlet weak var winningLine1: UILabel!
    @IBOutlet weak var winningLine2: UILabel!
    @IBOutlet weak var winningLine3: UILabel!
    @IBOutlet weak var winningLine4: UILabel!
    @IBOutlet weak var winningLine5: UILabel!
    @IBOutlet weak var winningLine6: UILabel!
    @IBOutlet weak var winningLine7: UILabel!
    
    @IBOutlet weak var winningLine8: UILabel!
    @IBOutlet weak var p1TxtField: UITextField!
    @IBOutlet weak var p2TxtField: UITextField!
    
    @IBOutlet weak var screenMessage: UILabel!
    @IBOutlet weak var startButtonTxt: UIButton!
    
    @IBOutlet weak var turnOneLabel: UILabel!
    @IBOutlet weak var turnTwoLabel: UILabel!
    @IBOutlet weak var p1Score: UILabel!
    @IBOutlet weak var p2Score: UILabel!
    
    var playBoard = PlayBoard()
    var players = [Player]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blockPlayboard()
        //turnOneLabel.layer.cornerRadius = turnOneLabel.bounds.height/2
        //turnOneLabel.clipsToBounds = true
        p1Score.layer.borderColor = UIColor.gray.cgColor
        p1Score.layer.borderWidth = 1
        p1Score.layer.cornerRadius = 3
        p1Score.clipsToBounds = true
        
        p2Score.layer.borderColor = UIColor.gray.cgColor
        p2Score.layer.borderWidth = 1
        p2Score.layer.cornerRadius = 3
        p2Score.clipsToBounds = true
        
        screenMessage.layer.borderColor = UIColor.gray.cgColor
        screenMessage.layer.borderWidth = 1
        screenMessage.layer.cornerRadius = 3
        screenMessage.clipsToBounds = true
        
        
    }
    @IBAction func startButton(_ sender: UIButton) {
        //create 2 players if there are no players
        if (playBoard.players.isEmpty){
            let name1 = p1TxtField.text
            if let name1 = name1{
                let p1 = Player(name: name1, token: 1, turn: true)
                playBoard.players.append(p1)
                turnOneLabel.text = "X"
                turnOneLabel.backgroundColor = UIColor.green
                turnOneLabel.layer.cornerRadius = turnOneLabel.bounds.height/2
                turnOneLabel.clipsToBounds = true
                }
            let name2 = p2TxtField.text
            if let name2 =  name2{
                let p2 = Player(name: name2, token: 0, turn: false)
                playBoard.players.append(p2)
                turnTwoLabel.text = "O"
                turnTwoLabel.backgroundColor = UIColor.red
                turnTwoLabel.layer.cornerRadius = turnTwoLabel.bounds.height/2
                turnTwoLabel.clipsToBounds = true
                }
            unlockPlayboard()
            print("created players")
        }else if(playBoard.players[0].name != p1TxtField.text){ //if player 1 changes name
            let name1 = p1TxtField.text
            if let name1 = name1{
                print("changed name to: \(name1)")
                startButtonTxt.setTitle("Start", for: .normal)
                playBoard.players[0].name = name1
                playBoard.players[0].score = 0
                }
            screenMessage.text = "Press Start to begin"
        }else if(playBoard.players[1].name != p2TxtField.text){ //if player 2 changes name
            let name2 = p2TxtField.text
            if let name2 = name2{
                startButtonTxt.setTitle("Start", for: .normal)
                print("changed name to: \(name2)")
                playBoard.players[1].name = name2
                playBoard.players[1].score = 0
                }
            screenMessage.text = "Press Start to begin"
        }else{                                          //restarts game and views in playboard
            startButtonTxt.setTitle("Start", for: .normal)
            playBoard.restartGame()
            
            square1Img.image = UIImage(named: "base")
            square2Img.image = UIImage(named: "base")
            square3Img.image = UIImage(named: "base")
            square4Img.image = UIImage(named: "base")
            square5Img.image = UIImage(named: "base")
            square6Img.image = UIImage(named: "base")
            square7Img.image = UIImage(named: "base")
            square8Img.image = UIImage(named: "base")
            square9Img.image = UIImage(named: "base")
            
            screenMessage.text = ""
            
            winningLine1.isHidden = true
            winningLine2.isHidden = true
            winningLine3.isHidden = true
            winningLine4.isHidden = true
            winningLine5.isHidden = true
            winningLine6.isHidden = true
            winningLine7.isHidden = true
            winningLine8.isHidden = true
            
            unlockPlayboard()
            print("new game")
        }
    }
    
    
    func scores(player: Player){
        if(playBoard.boardArray[0] == 0){
            p1Score.text = "\(player.name)'s wins: \(String(player.score))"
        }else{
            p2Score.text = "\(player.name)'s wins: \(String(player.score))"

        }
    }
    
    func showWinner(option: Int, player: Player){
        if (option == 1){
            winningLine1.isHidden = false
            blockPlayboard()
            screenMessage.text = "\(player.name) wins!!"
            startButtonTxt.setTitle("Play Again", for: .normal)
        }else if (option == 2){
            winningLine2.isHidden = false
            blockPlayboard()
            screenMessage.text = "\(player.name) wins!!"
            startButtonTxt.setTitle("Play Again", for: .normal)
        }else if (option == 3){
            winningLine3.isHidden = false
            blockPlayboard()
            screenMessage.text = "\(player.name) wins!!"
            startButtonTxt.setTitle("Play Again", for: .normal)
        }else if (option == 4){
            winningLine4.isHidden = false
            blockPlayboard()
            screenMessage.text = "\(player.name) wins!!"
            startButtonTxt.setTitle("Play Again", for: .normal)
        }else if (option == 5){
            winningLine5.isHidden = false
            blockPlayboard()
            screenMessage.text = "\(player.name) wins!!"
            startButtonTxt.setTitle("Play Again", for: .normal)
        }else if (option == 6){
            winningLine6.isHidden = false
            blockPlayboard()
            screenMessage.text = "\(player.name) wins!!"
            startButtonTxt.setTitle("Play Again", for: .normal)
        }else if (option == 7){
            winningLine7.transform = CGAffineTransform(rotationAngle: -15)
            winningLine7.isHidden = false
            blockPlayboard()
            screenMessage.text = "\(player.name) wins!!"
            startButtonTxt.setTitle("Play Again", for: .normal)
        }else if (option == 8){
            winningLine8.transform = CGAffineTransform(rotationAngle: 15)
            winningLine8.isHidden = false
            blockPlayboard()
            screenMessage.text = "\(player.name) wins!!"
            startButtonTxt.setTitle("Play Again", for: .normal)
        }else if (option == 9){
            screenMessage.text = "The game ends in a draw"
            startButtonTxt.setTitle("Play Again", for: .normal)
        }
        p1Score.text = "\(playBoard.players[0].name)'s wins: \(String(playBoard.players[0].score))"
        p2Score.text = "\(playBoard.players[1].name)'s wins: \(String(playBoard.players[1].score))"
    }
    func blockPlayboard(){
        square1Img.isUserInteractionEnabled = false
        square2Img.isUserInteractionEnabled = false
        square3Img.isUserInteractionEnabled = false
        square4Img.isUserInteractionEnabled = false
        square5Img.isUserInteractionEnabled = false
        square6Img.isUserInteractionEnabled = false
        square7Img.isUserInteractionEnabled = false
        square8Img.isUserInteractionEnabled = false
        square9Img.isUserInteractionEnabled = false
    }
    func unlockPlayboard(){
        square1Img.isUserInteractionEnabled = true
        square2Img.isUserInteractionEnabled = true
        square3Img.isUserInteractionEnabled = true
        square4Img.isUserInteractionEnabled = true
        square5Img.isUserInteractionEnabled = true
        square6Img.isUserInteractionEnabled = true
        square7Img.isUserInteractionEnabled = true
        square8Img.isUserInteractionEnabled = true
        square9Img.isUserInteractionEnabled = true
    }
    
    
    //controls the images, check the winner, check turns and show on screen
    @IBAction func sqr1Tap(_ sender: UITapGestureRecognizer) {
        if (playBoard.play(place: 0) == true){
            square1Img.image = UIImage(named: "x")
            square1Img.isUserInteractionEnabled = false
            turnOneLabel.backgroundColor = UIColor.red
            turnTwoLabel.backgroundColor = UIColor.green
            let a = playBoard.checkWinner(player: playBoard.players[0])
            showWinner(option: a, player: playBoard.players[0])
        }else{
            square1Img.image = UIImage(named: "o")
            square1Img.isUserInteractionEnabled = false
            turnOneLabel.backgroundColor = UIColor.green
            turnTwoLabel.backgroundColor = UIColor.red
            let b = playBoard.checkWinner(player: playBoard.players[1])
            showWinner(option: b, player: playBoard.players[1])
            }
        }
    
    @IBAction func sqr2Tap(_ sender: UITapGestureRecognizer) {
        if (playBoard.play(place: 1) == true){
            square2Img.image = UIImage(named: "x")
            square2Img.isUserInteractionEnabled = false
            turnOneLabel.backgroundColor = UIColor.red
            turnTwoLabel.backgroundColor = UIColor.green
            let a = playBoard.checkWinner(player: playBoard.players[0])
            showWinner(option: a, player: playBoard.players[0])
        }else{
            square2Img.image = UIImage(named: "o")
            square2Img.isUserInteractionEnabled = false
            turnOneLabel.backgroundColor = UIColor.green
            turnTwoLabel.backgroundColor = UIColor.red
            let b = playBoard.checkWinner(player: playBoard.players[1])
            showWinner(option: b, player: playBoard.players[1])
            }
        }
    @IBAction func sqr3Tap(_ sender: UITapGestureRecognizer) {
        if (playBoard.play(place: 2) == true){
            square3Img.image = UIImage(named: "x")
            square3Img.isUserInteractionEnabled = false
            turnOneLabel.backgroundColor = UIColor.red
            turnTwoLabel.backgroundColor = UIColor.green
            let a = playBoard.checkWinner(player: playBoard.players[0])
            showWinner(option: a, player: playBoard.players[0])
        }else{
            square3Img.image = UIImage(named: "o")
            square3Img.isUserInteractionEnabled = false
            turnOneLabel.backgroundColor = UIColor.green
            turnTwoLabel.backgroundColor = UIColor.red
            let b = playBoard.checkWinner(player: playBoard.players[1])
            showWinner(option: b, player: playBoard.players[1])
            }
    }
    @IBAction func sqr4Tap(_ sender: UITapGestureRecognizer) {
        if (playBoard.play(place: 3) == true){
            square4Img.image = UIImage(named: "x")
            square4Img.isUserInteractionEnabled = false
            turnOneLabel.backgroundColor = UIColor.red
            turnTwoLabel.backgroundColor = UIColor.green
            let a = playBoard.checkWinner(player: playBoard.players[0])
            showWinner(option: a, player: playBoard.players[0])
        }else{
            square4Img.image = UIImage(named: "o")
            square4Img.isUserInteractionEnabled = false
            turnOneLabel.backgroundColor = UIColor.green
            turnTwoLabel.backgroundColor = UIColor.red
            let b = playBoard.checkWinner(player: playBoard.players[1])
            showWinner(option: b, player: playBoard.players[1])
            }
    }
    @IBAction func sqr5Tap(_ sender: UITapGestureRecognizer) {
        if (playBoard.play(place: 4) == true){
            square5Img.image = UIImage(named: "x")
            square5Img.isUserInteractionEnabled = false
            turnOneLabel.backgroundColor = UIColor.red
            turnTwoLabel.backgroundColor = UIColor.green
            let a = playBoard.checkWinner(player: playBoard.players[0])
            showWinner(option: a, player: playBoard.players[0])
        }else{
            square5Img.image = UIImage(named: "o")
            square5Img.isUserInteractionEnabled = false
            turnOneLabel.backgroundColor = UIColor.green
            turnTwoLabel.backgroundColor = UIColor.red
            let b = playBoard.checkWinner(player: playBoard.players[1])
            showWinner(option: b, player: playBoard.players[1])
            }
    }
    @IBAction func sqr6Tap(_ sender: UITapGestureRecognizer) {
        if (playBoard.play(place: 5) == true){
            square6Img.image = UIImage(named: "x")
            square6Img.isUserInteractionEnabled = false
            turnOneLabel.backgroundColor = UIColor.red
            turnTwoLabel.backgroundColor = UIColor.green
            let a = playBoard.checkWinner(player: playBoard.players[0])
            showWinner(option: a, player: playBoard.players[0])
        }else{
            square6Img.image = UIImage(named: "o")
            square6Img.isUserInteractionEnabled = false
            turnOneLabel.backgroundColor = UIColor.green
            turnTwoLabel.backgroundColor = UIColor.red
            let b = playBoard.checkWinner(player: playBoard.players[1])
            showWinner(option: b, player: playBoard.players[1])
            }
    }
    @IBAction func sqr7Tap(_ sender: UITapGestureRecognizer) {
        if (playBoard.play(place: 6) == true){
            square7Img.image = UIImage(named: "x")
            square7Img.isUserInteractionEnabled = false
            turnOneLabel.backgroundColor = UIColor.red
            turnTwoLabel.backgroundColor = UIColor.green
            let a = playBoard.checkWinner(player: playBoard.players[0])
            showWinner(option: a, player: playBoard.players[0])
        }else{
            square7Img.image = UIImage(named: "o")
            square7Img.isUserInteractionEnabled = false
            turnOneLabel.backgroundColor = UIColor.green
            turnTwoLabel.backgroundColor = UIColor.red
            let b = playBoard.checkWinner(player: playBoard.players[1])
            showWinner(option: b, player: playBoard.players[1])
            }
    }
    @IBAction func sqr8Tap(_ sender: UITapGestureRecognizer) {
        if (playBoard.play(place: 7) == true){
            square8Img.image = UIImage(named: "x")
            square8Img.isUserInteractionEnabled = false
            turnOneLabel.backgroundColor = UIColor.red
            turnTwoLabel.backgroundColor = UIColor.green
            let a = playBoard.checkWinner(player: playBoard.players[0])
            showWinner(option: a, player: playBoard.players[0])
        }else{
            square8Img.image = UIImage(named: "o")
            square8Img.isUserInteractionEnabled = false
            turnOneLabel.backgroundColor = UIColor.green
            turnTwoLabel.backgroundColor = UIColor.red
            let b = playBoard.checkWinner(player: playBoard.players[1])
            showWinner(option: b, player: playBoard.players[1])
            }
    }
    @IBAction func sqr9Tap(_ sender: UITapGestureRecognizer) {
        if (playBoard.play(place: 8) == true){
            square9Img.image = UIImage(named: "x")
            square9Img.isUserInteractionEnabled = false
            turnOneLabel.backgroundColor = UIColor.red
            turnTwoLabel.backgroundColor = UIColor.green
            let a = playBoard.checkWinner(player: playBoard.players[0])
            showWinner(option: a, player: playBoard.players[0])
        }else{
            square9Img.image = UIImage(named: "o")
            square9Img.isUserInteractionEnabled = false
            turnOneLabel.backgroundColor = UIColor.green
            turnTwoLabel.backgroundColor = UIColor.red
            let b = playBoard.checkWinner(player: playBoard.players[1])
            showWinner(option: b, player: playBoard.players[1])
            }
    }
    


}

