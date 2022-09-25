//
//  ContentModel.swift
//  Learning
//
//  Created by Lukas on 9/20/22.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    // Current module
    @Published var currentModule:Module?
    var currentModuleIndex = 0
    
    // Current lesson
    @Published var currentLesson:Lesson?
    var currentLessonIndex = 0
    
    // Current lesson explanation
    @Published var lessonDescription = NSAttributedString()
    var styleData:Data?
    
    // Current selected content and test
    @Published var currentContentSelected:Int?
    
    
    init() {
        getLocalData()
    }
    
    // MARK - Data methods
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
    
    // MARK - Module navigation methods
    func enterModule(moduleId:Int) {
        if let index = modules.firstIndex(where: { (module) -> Bool in module.id == moduleId }) {
            currentModuleIndex = index
        }
        currentModule = modules[currentModuleIndex]
    }
    
    func enterLesson(lessonIndex:Int) {
        
        // Check lesson index is in range of lessons
        if lessonIndex < currentModule!.content.lessons.count {
            currentLessonIndex = lessonIndex
        }
        else {
            currentLessonIndex = 0
        }
        
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        lessonDescription = addStyling(currentLesson!.explanation)
        
    }
    
    func nextLesson() {
        
        // Advance lesson index
        currentLessonIndex += 1
        
        // Check if it's within range
        if currentLessonIndex < currentModule!.content.lessons.count {
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
            lessonDescription = addStyling(currentLesson!.explanation)
        }
        else {
            currentLessonIndex = 0
            currentLesson = nil
        }
        
    }
    
    func hasNextLesson() -> Bool {
        return currentLessonIndex + 1 < currentModule!.content.lessons.count
    }
    
    // MARK - Code Styling
    private func addStyling(_ htmlString:String) -> NSAttributedString {
        var resultString = NSAttributedString()
        var data = Data()
        
        // add styling data
        if styleData != nil {
            data.append(styleData!)
        }
        
        // add html data
        data.append(Data(htmlString.utf8))
        
        // convert to attributed string
        // "try?" means that if you cannot create attributed string, it just skips the code inside the if statement
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType:NSAttributedString.DocumentType.html], documentAttributes: nil) {
            resultString = attributedString
        }
        
        return resultString
    }
    
}
