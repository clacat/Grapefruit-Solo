//
//  SecondView.swift
//  Grape2.0 WatchKit Extension
//
//  Created by Antonio Mennillo on 08/12/2020.
//

import Foundation
import SwiftUI

struct SecondView:View {
    var techniques:TechniquesList
    
    var body: some View{
        
        List{
            VStack{
        Text(techniques.title)
            .font(.title3)
            .fontWeight(.semibold)
            .padding(.bottom)
        Text(techniques.description)
                .font(.caption2)
                .fontWeight(.regular)
                
                NavigationLink(destination:
                    AnimationView(techniques: techniques)) {
                    
                Text("Start Session")
                    .padding(.all, 8.0)
                    .background(Color(#colorLiteral(red: 0.8765500784, green: 0.2680369616, blue: 0.1824135482, alpha: 1)))
                    .cornerRadius(10)
                    .padding(.vertical,15.0)
                    
                    }
                
            }
            .padding(.vertical, 8.0)
            .listRowPlatterColor(Color(#colorLiteral(red: 0.2696505487, green: 0.0629433915, blue: 0.05549599975, alpha: 1)))
            
        }
        .navigationTitle("Back")
    }
}

struct Second_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(techniques: TechniquesList.all()[0])
    }
}
