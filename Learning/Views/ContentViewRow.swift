//
//  ContentViewRow.swift
//  Learning
//
//  Created by Lukas on 9/21/22.
//

import SwiftUI

struct ContentViewRow: View {
    
    @EnvironmentObject var model:ContentModel
    var index:Int
        
    var body: some View {
        
        let lesson = model.currentModule!.content.lessons[index]
        
        ZStack (alignment: .leading) {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            HStack {
                
                Text(String(index+1))
                    .bold()
                    .padding(.leading,5)
                
                VStack (alignment: .leading) {
                    Text(lesson.title)
                        .bold()
                    Text(lesson.duration)
                }
                .padding(.horizontal, 10)
            }
            .padding(10)
        }
        .padding(.horizontal,10)
        .padding(.bottom,5)
    }
}
