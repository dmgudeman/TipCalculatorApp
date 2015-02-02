//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by David Gudeman on 2/1/15.
//  Copyright (c) 2015 David Gudeman. All rights reserved.
//

import Foundation

class TipCalculatorModel {
   
    var total: Double
    var taxPct: Double
    var subtotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
   
    init(total: Double, taxPct: Double){
        self.total = total
        self.taxPct = taxPct
        
    }

    func calcTipWithTipPct(tipPct: Double) -> Double {
        return subtotal * tipPct
    }
    
    func returnPossibleTips() -> [Int: Double] {
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        let possibleTipsExplicit:[Double] = [0.15, 0.18, 0.20]
        
        var retValue = [Int: Double]()
        for possibleTip in possibleTipsInferred{
            let intPct = Int(possibleTip*100)
            
            retValue[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retValue
    }
    
}
