

import Foundation

class Player{
    
    var name: String
    var token: Int
    var turn: Bool? = nil
    var score: Int
    
    init (name: String, token: Int, turn: Bool, score: Int = 0){
        self.name = name
        self.turn = turn
        self.token = token
        self.score = score
    }
    
}
