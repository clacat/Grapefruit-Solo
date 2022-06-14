//
//  ContentView.swift
//  Grape2.0 WatchKit Extension
//
//  Created by Antonio Mennillo on 08/12/2020.
//

import SwiftUI

struct ContentView: View {
    
    var techniques: TechniquesList
   
       
    
    @State private var model = TechniquesList.all()
    
    var body: some View {
        List{
            ForEach(model){ techniques in
                NavigationLink(destination: SecondView(techniques:techniques)){
                VStack(alignment: .leading){

                    Text(techniques.title)
                        .font(.title3)
                        .fontWeight(.semibold)

                    Text(techniques.subtitle)
                        .fontWeight(.regular)

                    }

                    }


                .listRowPlatterColor(Color(#colorLiteral(red: 0.8765500784, green: 0.2680369616, blue: 0.1824135482, alpha: 1)))
                .padding(.vertical, 15.0)

            }

        }
        .navigationBarBackButtonHidden(true)
        .listStyle(CarouselListStyle())
        .navigationTitle("Grapefruit")
        //Pager Manager
                
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(techniques: TechniquesList.all()[0])
    }
}
