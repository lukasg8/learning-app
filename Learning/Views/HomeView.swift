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
        
        Text(String(model.modules[0].id))
        Text(model.modules[0].content.description)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
