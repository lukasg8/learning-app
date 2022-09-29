//
//  TestView.swift
//  Learning
//
//  Created by Lukas on 9/28/22.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model:ContentModel
    @State var selectedAnswerIndex:Int?
    @State var submitted = false
    
    // counting how many correct in whole test
    @State var numCorrect = 0
    
    var body: some View {
        
        if model.currentQuestion != nil {
            
            VStack (alignment:.leading) {
                
                // Question number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                    .padding(.leading,20)
                
                // Question
                CodeTextView()
                    .padding(.horizontal,20)
                
                // Answers
                ScrollView {
                    VStack {
                        ForEach(0..<model.currentQuestion!.answers.count, id: \.self) { index in
                                
                            Button(action: {
                                // track selected index
                                selectedAnswerIndex = index
                            }, label: {
                                ZStack {
                                    
                                    if submitted == false {
                                        RectangleCard(color: index == selectedAnswerIndex ? .gray : .white)
                                            .frame(height:48)
                                    }
                                    else {
                                        // answer submitted
                                        if (index == selectedAnswerIndex && index == model.currentQuestion!.correctIndex) || index == model.currentQuestion!.correctIndex {
                                            
                                            // correct answer selected OR display the correct answer regardless
                                            RectangleCard(color: .green)
                                                .frame(height:48)
                                        }
                                        else if index == selectedAnswerIndex && index != model.currentQuestion!.correctIndex{
                                            
                                            // wrong answer submitted
                                            RectangleCard(color: .red)
                                                .frame(height:48)
                                        }
                                        else {
                                            RectangleCard(color: .white)
                                                .frame(height:48)
                                        }
                                    }
                                    
                                    
                                    Text(model.currentQuestion!.answers[index])
                                }
                            })
                            .disabled(submitted)
                        }
                    }
                    .accentColor(.black)
                    .padding()
                }
                
                // Button
                Button(action: {
                    
                    submitted = true
                    
                    if selectedAnswerIndex == model.currentQuestion!.correctIndex {
                        numCorrect += 1
                    }
                    
                }, label: {
                    ZStack {
                        RectangleCard(color:.green)
                            .frame(height:48)
                        Text("Submit")
                            .bold()
                            .foregroundColor(.white)
                    }
                    .padding()
                })
                .disabled(selectedAnswerIndex == nil)
                
            }
            .navigationTitle("\(model.currentModule?.category ?? "") Test")
        }
        else {
            // Need this since currentQuestion is only set onAppear (which is the variable which is needed to show VStack in TestView)
            // Therefore, by adding another view if currentQuestion is nil, onAppear perform will execute enterLesson and assign currentQuestion a value
            ProgressView()
        }
    }
}
