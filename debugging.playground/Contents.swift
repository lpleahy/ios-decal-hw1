//: # Homework 1 - Debugging and Swift Intro

//: To see markup format, go to Editor -> Show Rendered Markup


import UIKit


//: ## Q1: Optionals
//: The compiler is yelling at us. Why isn't this the correct way to unwrap optionals?

class Foo {
    
    var wordA : String?
    var wordB : String?
    
    init (words: [String?]) {
        wordA = words[0]!
        wordB = words[1]!
    }
    
//: Given that words is a optional array of strings, we should probably declare the vars we're making as optionals as well (as they could be nil). Since the array is of optionals, we have to unwrap it in order to obtain the value. Therefore, we use the '!' after the array indexing in order to extract the string/nil stored there.
    

    
//: ## Q2: Variable Types and Function Types
//: Why does the compiler dislike the for loop? Also, what should we return?
    
    static func arePalindromes(words: [String]) -> Bool {
        let reversedWords = words.map() {String($0.characters.reverse())}
        var numElements = words.count
        
        for var i = 0; i < numElements; i++ {
            if words[i] != reversedWords[i] {
                return false
            }
        }
        
        return true
    }
    
//: We use 'let' for the variable 'i'. This makes it a constant and therefore it cannot be changed. Changed the declaration to 'var'. 
//: Changed return type to 'Bool' as the '!' is redundant. Furthermore, changed the last case to 'true' as we should be evaluating to a boolean value. Also, it doesn't make sense to return 'nil' as that is not relevant when we know the answer. Additionally we declare the method as static as we want to use it without an instance.
    
    
    
//: ## Q3: More functions, and object initialization
//: The method should be returning true or false -- what's wrong?
//: Are we initializing the dictionary correctly?
    static func isAnagram(wordA: String, wordB: String) -> Bool {
        var countLetters = [Character : Int]()
        let lenA = wordA.characters.count
        let lenB = wordB.characters.count
        
        if lenA != lenB {
            return false
        }
        var arrA = Array(wordA.characters)
        var arrB = Array(wordB.characters)
        
        for i in 0...lenA-1 {
            let letter = arrA[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val + 1
            } else {
                countLetters[letter] = 1
            }
        }
        
        for i in 0...lenB-1 {
            let letter = arrB[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val - 1
            } else {
                return false
            }
        }
        
        for (letter, count) in countLetters {
            if count != 0 {
                return false
            }
        }
        
        return true
    }
}

//: The dictionary was not initialized properly, it was changed to instatiate a new dictionary of type 'Character : Int'. Additionally, we declare the method as static as we want to use it without an instance.


//: **Do not** change anything below.
//: You should be able to call the methods as is.
Foo.isAnagram("anagram", wordB: "managra")
Foo.isAnagram("hello", wordB: "what")

var palindromes = ["hih", "racecar", "mom", "wow"]
var notPalindromes = ["gene", "shawn", "hello"]
Foo.arePalindromes(palindromes)
Foo.arePalindromes(notPalindromes)
