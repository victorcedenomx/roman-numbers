class Solution {
    
    
    struct Roman {
        let number: String
        let value: Int
    }
    
    func romanToInt(_ s: String) -> Int {
        
        
        let one = Roman(number: "I", value: 1)
        let five = Roman(number: "V", value: 5)
        let ten = Roman(number: "X", value: 10)
        
        //let romanCharacters = ["I", "V", "X", "L", "C", "D", "M"]
        let romanCharacters = [one, five, ten]
        
        let romanLetters = s.map { $0 }
        
        var counter = 0
        var lastIndex = 0
        
        for (index, letter) in s.uppercased().enumerated() {
            if s.count == 1 {
                if let value = romanCharacters.first { $0.number == String(letter) }?.value {
                    counter = value
                }
            } else if index < s.count - 1 {
                if index > lastIndex {
                    let leftRoman = romanCharacters[index]
                    let rightRoman = romanCharacters[index + 1]
                    
                    if leftRoman.value < rightRoman.value {
                        lastIndex = index + 1
                        counter = rightRoman.value - leftRoman.value
                    } else {
                        lastIndex = index + 1
                        counter = leftRoman.value + rightRoman.value
                    }
                }
            }
        }
        
        return counter
    }
}