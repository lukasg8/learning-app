//
//  TestResultView.swift
//  Learning
//
//  Created by Lukas on 9/30/22.
//

import SwiftUI

struct TestResultView: View {
    
    @EnvironmentObject var model:ContentModel
    var numCorrect:Int
    
    var resultHeading:String {
        
        guard model.currentModule != nil else {
            return ""
        }
        
        let pct = Double(numCorrect) / Double(model.currentModule!.test.questions.count)
        
        if pct > 0.7 {
            return "Great job!"
        }
        else if pct > 0.5 {
            return "Almost there!"
        }
        else {
            return "Keep learning."
        }
        
    }
    
    var body: some View {
        Text(resultHeading)
            .bold()
            .font(.title)
            .padding()
        
        Text("You got \(numCorrect) out of \(model.currentModule?.test.questions.count ?? 0) questions")
        
        Button(action: {
            
            // user sent back to homeview
            model.currentTestSelected = nil
            
        }, label: {
            
            ZStack {
                RectangleCard(color: .green)
                    .frame(height: 48)
                
                Text("Complete")
                    .bold()
                    .foregroundColor(.white)
            }
            .padding()
            
        })
    }
}
