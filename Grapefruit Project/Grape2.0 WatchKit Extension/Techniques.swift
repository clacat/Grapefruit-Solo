//
//  Techniques.swift
//  Grape2.0 WatchKit Extension
//
//  Created by Antonio Mennillo on 08/12/2020.
//

import Foundation
import SwiftUI

struct TechniquesList: Identifiable{
    var id = UUID()
    var title: String
    var subtitle:String
    var description: String
}
extension TechniquesList{
    
    static func all()->[TechniquesList]{
        
        return[
            TechniquesList(title: "EDGING", subtitle: "To zero and rebuilding", description: "With the pausing method, you completely stop all touches just before reaching the climax. Then slow down, and start over again and again from the beginning until the big finale."),TechniquesList(title:"ACCENTING", subtitle: "Searching for the best", description: "Take the repeating motions that you enjoy the most and try to accent one zone for a while and see how that feels. Then give a try to other zones."),TechniquesList(title:"RHYTHM", subtitle: "Follow your body", description: "Repeat your motion right after finishing the last one with no pauses between. With this rhythm, there’s no time for pleasure to die down between motions."),TechniquesList(title: "SKIPPING", subtitle: "Pleasing skip", description: "You take a break in between each motion or every other motion. The best way to try is to take a touch that already works for you and skip part of it, over and over."),TechniquesList(title: "PULSATING", subtitle: "Almost a blur", description: "It is so fast that it’s almost a blur. You move so quickly that it becomes a flutter. It allows a tiny amount of movement to constantly stimulate yourself."),TechniquesList(title:"UNEXPECTED", subtitle: "Exciting suspense", description: " Each motion should be different to the last. Try taking the motions that already work for you and vary each repetition. The variation can be in location or in rhythm.")]
    }
}
