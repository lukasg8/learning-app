//
//  ContentView.swift
//  Learning
//
//  Created by Lukas on 9/20/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        
        

        NavigationView {
            VStack (alignment:.leading) {
                Text("What do you want to do today?")
                ScrollView {
                    LazyVStack (spacing: 20) {
                        ForEach(model.modules) { module in
                            
                            // Lesson row
                            HomeViewRow(image: module.content.image, title: ("Learn \(module.category)"), description: module.content.description, count: ("\(module.content.lessons.count) Lessons"), time: module.content.time)
                            
                            // Test row
                            HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Questions", time: module.test.time)
                        
                        }
                    }
                    .padding(5)
                }
            }
            .padding(.horizontal,15)
            .padding(.top,0)
            .navigationTitle("Get Started")
        }
        
        
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
