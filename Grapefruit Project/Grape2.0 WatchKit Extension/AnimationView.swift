//
//  AnimationView.swift
//  Grape2.0 WatchKit Extension
//
//  Created by Antonio Mennillo on 09/12/2020.
//

import Foundation
import SwiftUI

struct AnimationView:View {
    @State var accenting : String = ""
    @State var edging : String = ""
    @State var rhythm : String = ""
    @State var skipping : String = ""
    @State var unexpected : String = ""
    @State var pulsating : String = ""
    
    @State var bool = false
    @State var rotation = false
    @State private var currentPage = 0
    var techniques: TechniquesList
    
    var body: some View{

        VStack{
            PagerManager(pageCount: 2, currentIndex: $currentPage) {
            
                
                            if(techniques.title == "EDGING"){
                                Image(edging)
                                           .resizable()
                                    .frame(width: 124.8, height: 156, alignment: .center)
                                           .onAppear(perform: timeredging)
                            }
                            if(techniques.title == "ACCENTING"){
                                Image(accenting)
                                           .resizable()
                                    .frame(width: 124.8, height: 156, alignment: .center)
                                           .onAppear(perform: timeraccenting)
                            }
                            if(techniques.title == "RHYTHM"){
                                Image(rhythm)
                                           .resizable()
                                    .frame(width: 124.8, height: 156, alignment: .center)
                                           .onAppear(perform: timerrhythm)
                               
                            }
                            if(techniques.title == "SKIPPING"){
                                Image(skipping)
                                           .resizable()
                                    .frame(width: 124.8, height: 156, alignment: .center)
                                           .onAppear(perform: timerskipping)
                                
                            }
                            if(techniques.title == "PULSATING"){
                                Image(pulsating)
                                           .resizable()
                                    .frame(width: 124.8, height: 156, alignment: .center)
                                           .onAppear(perform: timerpulsating)
                            }
                            if(techniques.title == "UNEXPECTED"){
                                Image(unexpected)
                                           .resizable()
                                    .frame(width: 124.8, height: 156, alignment: .center)
                                           .onAppear(perform: timerunexpected)
                            }

                VStack{
                    
                    NavigationLink(destination:ContentView(techniques: techniques)){
                      Image("Exit")
                        .padding()
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.top, -18.0)
                    
                    Text("End Session")
                }

            }
            
            Spacer()
                .frame(width: 10, height: 10)
            
            //Page Control
            HStack{
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(currentPage==1 ? Color(#colorLiteral(red: 0.2696505487, green: 0.0629433915, blue: 0.05549599975, alpha: 1)):Color(#colorLiteral(red: 0.8765500784, green: 0.2680369616, blue: 0.1824135482, alpha: 1)))
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(currentPage==1 ? Color(#colorLiteral(red: 0.8765500784, green: 0.2680369616, blue: 0.1824135482, alpha: 1)):Color(#colorLiteral(red: 0.2696505487, green: 0.0629433915, blue: 0.05549599975, alpha: 1)))


}
}
        .navigationTitle("\(techniques.title)")
    
}
    func timeraccenting(){
        var index = 0
        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (Timer) in
            
            accenting = index < 10 ? "Accenting00\(index)" : index < 100 ? "Accenting0\(index)" : "Accenting\(index)"
            index += 1
            if (index > 111){
                index = 0
            }
        }
    }
    func timeredging(){
        var index = 0
        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (Timer) in
            
            edging = index < 10 ? "Edging00\(index)" : index < 100 ? "Edging0\(index)" : "Edging\(index)"
            index += 1
            if (index > 105){
                index = 0
            }
        }
    }
    func timerrhythm(){
        var index = 0
        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (Timer) in
            
            rhythm = index < 10 ? "Rhythm0\(index)" : index < 100 ? "Rhythm\(index)" : "Rhythm\(index)"
            index += 1
            if (index > 70){
                index = 0
            }
        }
    }
    func timerskipping(){
        var index = 0
        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (Timer) in
            
            skipping = index < 10 ? "Skipping00\(index)" : index < 100 ? "Skipping0\(index)" : "Skipping\(index)"
            index += 1
            if (index > 105){
                index = 0
            }
        }
    }
    func timerunexpected(){
        var index = 0
        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (Timer) in
            
            unexpected = index < 10 ? "Unexpected00\(index)" : index < 100 ? "Unexpected0\(index)" : "Unexpected\(index)"
            index += 1
            if (index > 111){
                index = 0
            }
        }
    }
    func timerpulsating(){
        var index = 0
        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (Timer) in
            
            pulsating = index < 10 ? "Pulsating00\(index)" : index < 100 ? "Pulsating0\(index)" : "Pulsating\(index)"
            index += 1
            if (index > 105){
                index = 0
            }
        }
    }
    
}


struct PagerManager<Content: View>: View {
    let pageCount: Int
    @Binding var currentIndex: Int
    let content: Content

    //Set the initial values for the variables
    init(pageCount: Int, currentIndex: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self.content = content()
    }
    
    @GestureState private var translation: CGFloat = 0

    //Set the animation
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                self.content.frame(width: geometry.size.width)
            }
            .frame(width: geometry.size.width, alignment: .leading)
            .offset(x: -CGFloat(self.currentIndex) * geometry.size.width)
            .offset(x: self.translation)

                
            .gesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = value.translation.width
                }.onEnded { value in
                    let offset = value.translation.width / geometry.size.width
                    let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                    self.currentIndex = min(max(Int(newIndex), 0), self.pageCount - 1)
                }
            )
        }
    }
}

struct Animation_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView(techniques: TechniquesList.all()[0])
    }
}
