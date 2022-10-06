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
        
    var lesson: Lesson {
        if model.currentModule != nil && index < model.currentModule!.content.lessons.count {
            return model.currentModule!.content.lessons[index]
        }
        else {
            return Lesson(id: 0, title: "", video: "", duration: "", explanation: "")
        }
    }
    
    var body: some View {
                
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
