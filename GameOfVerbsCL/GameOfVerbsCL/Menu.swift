//
//  Menu.swift
//  GameOfVerbsCL
//
//  Created by Nikolay Raychev on 28/02/2018.
//  Copyright © 2018 Nikolay Raychev. All rights reserved.
//

import Foundation

class Menu {
    static let sharedInstance = Menu()
    private let ex = Exersice()
    
    private let wellcomeMsg = """
    Wellcome in to the Game OF Verbs (Command line version) 1.0
    """
    private let menuMsg = """
    /| Main menu |\\
    --------------------------------------------------
    || Controlls:
    || forward(Enter) , quit(q), help(h)
    || show(s) //show all verbs
    --------------------------------------------------
    \n
    """

    
    func run() {
       print(wellcomeMsg + "\n" + menuMsg)
        var menuLoop : Bool = true
        while menuLoop {
            if var keyboardInput = readLine(){
                keyboardInput = keyboardInput.lowercased()
                keyboardInput = keyboardInput.trimmingCharacters(in: .whitespaces)
                switch keyboardInput{
                case "help", "h":
                    print(menuMsg)
                case "", "forward":
                    //print("Enter")
                    var defExersice : Bool = true
                    while defExersice{
                        defExersice = ex.exersicing(exerciceVersion: .byGivenVerb1)
                    }
                    print()
                    print(menuMsg)
                    
                case "exit", "q", "quit":
                    print("exit")
                    menuLoop = false
                    
                case "o", "option", "options":
                    print("options")
                
                case "show", "s":
                    //todo- multiply option like show -all, etc
                    let verb = Verbs()
                    verb.showVerbs(.vAll)
                default:
                    print("No such command as \"\(keyboardInput)\"")
                }
                
            }
        }
        //        print("for escaping press 'esc'")
        //        print("for step forward press 'Enter'")
        //        while(true){
        //            ex.exersicing(exerciceVersion: .byGivenVerb1)
        
    }
    private init(){}
}

        


