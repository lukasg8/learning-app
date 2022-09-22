//
//  ContentView.swift
//  Learning
//
//  Created by Lukas on 9/21/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        ScrollView {
            LazyVStack {
                
                // Check that current module is not nil
                if model.currentModule != nil {
                    
                    ForEach(0..<model.currentModule!.content.lessons.count, id: \.self) { index in
                       
                        NavigationLink(destination: {
                            ContentDetailView()
                                .onAppear(perform: {
                                    model.enterLesson(lessonIndex: index)
                                })
                        }, label: {
                            ContentViewRow(index: index)
                        })
                        
                    }
                    
                }
            }
            .padding(10)
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
            .accentColor(.black)
        }
    }
}
