//
//  TestView.swift
//  Learning
//
//  Created by Lukas on 9/28/22.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        if model.currentQuestion != nil {
            
            VStack {
                
                // Question number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                
                // Question
                
                // Answers
                
                // Button
                
            }
            .navigationTitle("\(model.currentModule?.category ?? "") Test")
        }
        else {
            Text("No questions")
        }
    }
}
