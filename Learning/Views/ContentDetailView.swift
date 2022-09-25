//
//  ContentDetailView.swift
//  Learning
//
//  Created by Lukas on 9/22/22.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string:Constants.videoHostUrl + (lesson?.video ?? ""))
        
        VStack {
            
            // Video
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            
            // Description
            CodeTextView()
            
            // Next lesson button
            if model.hasNextLesson() {
                Button(action: {
                    model.nextLesson()
                }, label: {
                    
                    ZStack {
                        
                        RectangleCard(color: .green)
                            .frame(height: 48)
                        
                        Text("Next lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(.white)
                            .bold()
                        
                    }
                })
            }
            else {
                // Show complete button if no next lesson
                
                Button(action: {
                    model.currentContentSelected = nil
                }, label: {
                    
                    ZStack {
                        
                        RectangleCard(color: .green)
                            .frame(height: 48)
                        
                        Text("Complete")
                        
                    }
                })
                
            }
        }
        .padding()
        .navigationBarTitle(lesson?.title ?? "")
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
