//
//  ContentModel.swift
//  Learning
//
//  Created by Lukas on 9/20/22.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    var styleData:Data?
    
    init() {
        getLocalData()
    }
    
    func getLocalData() {
        
        // Parse URL data
        
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            let decoder = JSONDecoder()
            
            let modules = try decoder.decode([Module].self, from: jsonData)

            self.modules = modules
            
        }
        catch {
            print("Cannot parse json data")
        }
        
        // Parse style data
        
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
            
        }
        catch {
            print("could not parse style data")
        }
        
    }
    
}
