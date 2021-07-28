//
//  evaluate.swift
//  Recursion-Assignment1-evaluate
//
//  Created by Dylan Park on 2021-07-27.
//

import Foundation

func evaluate(calFormula: String) -> Int {
    if calFormula.count == 1 {
        return Int(calFormula)!
    } else if calFormula.count == 5 {
        return calResults(subFormula: calFormula)
    } else {
        if calFormula.contains(")+(") {
            let index = calFormula.range(of: ")+(")
            var firstString = String(calFormula[..<index!.upperBound])
            firstString = String(firstString[0, firstString.count - 2])
            var lastString = String(calFormula[index!.lowerBound...])
            lastString = String(lastString[2, lastString.count])
            return evaluate(calFormula: firstString) + evaluate(calFormula: lastString)
        } else if calFormula.contains(")*(") {
            let index = calFormula.range(of: ")*(")
            var firstString = String(calFormula[..<index!.upperBound])
            firstString = String(firstString[0, firstString.count - 2])
            var lastString = String(calFormula[index!.lowerBound...])
            lastString = String(lastString[2, lastString.count])
            return evaluate(calFormula: firstString) * evaluate(calFormula: lastString)
        } else if calFormula.contains("+(") {
            var newFormula = calFormula
            if newFormula[0] == "(" && newFormula[newFormula.count - 1] == ")" {
                newFormula = String(newFormula[1, newFormula.count - 1])
            }
            let index = newFormula.range(of: "+(")
            var firstString = String(newFormula[..<index!.upperBound])
            firstString = String(firstString[0, firstString.count - 2])
            var lastString = String(newFormula[index!.lowerBound...])
            lastString = String(lastString[1, lastString.count])
            return evaluate(calFormula: firstString) + evaluate(calFormula: lastString)
        } else if calFormula.contains("*(") {
            var newFormula = calFormula
            if newFormula[0] == "(" && newFormula[newFormula.count - 1] == ")" {
                newFormula = String(newFormula[1, newFormula.count - 1])
            }
            let index = newFormula.range(of: "*(")
            var firstString = String(newFormula[..<index!.upperBound])
            firstString = String(firstString[0, firstString.count - 2])
            var lastString = String(newFormula[index!.lowerBound...])
            lastString = String(lastString[1, lastString.count])
            return evaluate(calFormula: firstString) * evaluate(calFormula: lastString)
        } else if calFormula.contains(")+") {
            var newFormula = calFormula
            if newFormula[0] == "(" && newFormula[newFormula.count - 1] == ")" {
                newFormula = String(newFormula[1, newFormula.count - 1])
            }
            let index = newFormula.range(of: ")+")
            var firstString = String(newFormula[..<index!.upperBound])
            firstString = String(firstString[0, firstString.count - 1])
            var lastString = String(newFormula[index!.lowerBound...])
            lastString = String(lastString[2, lastString.count])
            return evaluate(calFormula: firstString) + evaluate(calFormula: lastString)
        } else if calFormula.contains(")*") {
            var newFormula = calFormula
            if newFormula[0] == "(" && newFormula[newFormula.count - 1] == ")" {
                newFormula = String(newFormula[1, newFormula.count - 1])
            }
            let index = newFormula.range(of: ")*")
            var firstString = String(newFormula[..<index!.upperBound])
            firstString = String(firstString[0, firstString.count - 1])
            var lastString = String(newFormula[index!.lowerBound...])
            lastString = String(lastString[2, lastString.count])
            return evaluate(calFormula: firstString) * evaluate(calFormula: lastString)
        } else {
            if calFormula.count == 2 {
                if calFormula[0] == "(" {
                    return evaluate(calFormula: calFormula[1])
                } else if calFormula[1] == ")" {
                    return evaluate(calFormula: calFormula[0])
                } else {
                    print(calFormula)
                    return 0
                }
            } else if calFormula.count % 2 == 0 {
                if calFormula[0] == "(" && calFormula[1] == "(" {
                    return evaluate(calFormula: String(calFormula[1, calFormula.count]))
                } else if calFormula[calFormula.count - 1] == ")" && calFormula[calFormula.count - 2] == ")" {
                    return evaluate(calFormula: String(calFormula[0, calFormula.count - 1]))
                } else {
                    print(calFormula)
                    return 0
                }
            } else {
                print(calFormula)
                return 0
            }
        }
    }
}

func calResults(subFormula: String) -> Int {
    let char = String(subFormula[2])
    if char == "+" {
        return (Int(String(subFormula[1]))! + Int(String(subFormula[3]))!)
    } else {
        return (Int(String(subFormula[1]))! * Int(String(subFormula[3]))!)
    }
}
