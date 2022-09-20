//
//  ContentModel.swift
//  Learning
//
//  Created by Lukas on 9/20/22.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    init() {
        getLocalData()
    }
    
    func getLocalData() {
        
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
    }
    
}
