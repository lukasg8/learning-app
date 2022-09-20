//
//  HomeViewRow.swift
//  Learning
//
//  Created by Lukas on 9/20/22.
//

import SwiftUI

struct HomeViewRow: View {
    
    var image:String
    var title:String
    var description:String
    var count:String
    var time:String
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175),contentMode: .fit)
            
            HStack {
                
                Image(image)
                    .resizable()
                    .frame(width: 116,height: 116)
                    .clipShape(Circle())
                
                VStack (alignment: .leading, spacing:10) {
                    
                    Text(title)
                        .bold()
                    
                    Text(description)
                        .font(.caption)
                        .padding(.bottom,20)
                    
                    HStack {
                        
                        Image(systemName:"text.book.closed")
                        Text(count)
                            .font(Font.system(size: 9.5))
                                                            
                        Image(systemName:"clock")
                        Text(time)
                            .font(Font.system(size: 9.5))
                    }
                }
                .padding(.leading,20)
            }
            .padding(15)
        }
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
                
        HomeViewRow(image: "swift", title: "title", description: "description here", count: "20 questions", time: "10 minutes")
    }
}
