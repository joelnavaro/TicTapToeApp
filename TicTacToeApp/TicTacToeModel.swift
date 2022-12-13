
import Foundation

class PlayBoard{
    
    var boardArray : [Int?] = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
    var players = [Player]()
    
    //decides the turns and the tokes for the payers
    func play(place: Int)-> Bool?{
        if (players[0].turn == true){
            boardArray[place] = players[0].token
            players[0].turn = false
            players[1].turn = true
            return true
        }else if(players[1].turn == true){
            boardArray[place] = players[1].token
            players[1].turn = false
            players[0].turn = true
            return false
        }
        return nil
    }
    
    //restarts the boardArray and the 
    func restartGame(){
        boardArray[0...8] = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
    }
    
    func checkWinner(player: Player)-> Int{
        //checks which player is winning, which way or if its a tie
        if (boardArray[0]==player.token && boardArray[1]==player.token && boardArray[2]==player.token){
            player.score += 1
            return 1
            //winningLine1.backgroundColor = UIColor.green
        }else if(boardArray[3]==player.token && boardArray[4]==player.token && boardArray[5]==player.token){
            player.score += 1
            return 2
        }else if(boardArray[6]==player.token && boardArray[7]==player.token && boardArray[8]==player.token){
            player.score += 1
            return 3
        }else if(boardArray[0]==player.token && boardArray[3]==player.token && boardArray[6]==player.token){
            player.score += 1
            return 4
        }else if(boardArray[1]==player.token && boardArray[4]==player.token && boardArray[7]==player.token){
            player.score += 1
            return 5
        }else if(boardArray[2]==player.token && boardArray[5]==player.token && boardArray[8]==player.token){
            player.score += 1
            return 6
        }else if(boardArray[0]==player.token && boardArray[4]==player.token && boardArray[8]==player.token){
            player.score += 1
            return 7
        }else if(boardArray[2]==player.token && boardArray[4]==player.token && boardArray[6]==player.token){
            player.score += 1
            return 8
        }else if(!boardArray.contains(nil)){
            return 9
        }
        return 0
    }
}
