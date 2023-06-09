//
//  ContentModel.swift
//  Learning App
//
//  Created by Andrew on 2023-05-24.
//

import Foundation

class ContentModel: ObservableObject {
    // list of Modules
    @Published var modules = [Module]()
    
    //current Module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    //current Lesson
    @Published var currentLesson: Lesson?
    var currentLessonIndex = 0
    
    //Current Lesson Explination
    @Published var lessonDescription =  NSAttributedString()
    
    var styleData: Data?
    
    init() {
        getLocalData()
        
    }
    //MARK: Data Methods
    func getLocalData() {
        // get url to json
        let jsonURL = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            // read the file into data object
            let jsonData = try Data(contentsOf: jsonURL!)
            // try to decode the json into array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode(([Module].self), from: jsonData)
            //Assigned parsed moudules to modules property
            self.modules = modules
        }
        catch {
            // TO DO: Error handeling
            print("cannot parse localData")
        }
        //Parse Style Data
        
        let styleURL = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            //read the file into data object
            let styleData = try Data(contentsOf: styleURL!)
            
            self.styleData = styleData
        }
        
        catch{
            print("could not parse style data")
        }
        
    }
    
    //MARK: Navigation Methods
    
    func beginModule(_ moduleid: Int) {
        //set index for module id
        for index in 0..<modules.count {
            if modules[index].id == moduleid {
                // found the matching modules
                currentModuleIndex = index
                break
            }
        }
        // Set current module
        currentModule = modules[currentModuleIndex]
    }
    
    func beginLesson(_ lessonIndex: Int) {
        // check that lesson index is within range
        if lessonIndex < currentModule!.content.lessons.count {
            currentLessonIndex = lessonIndex
        }else{
            currentLessonIndex = 0
        }
        // Set current Lesson
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        //set current explination
        lessonDescription = addStyling(currentLesson!.explanation)
    }
    
    func nextLesson() {
        //Advance Lesson Index
        currentLessonIndex += 1
        //check lesson is in range
        if currentLessonIndex < currentModule!.content.lessons.count{
            //set currentLesson
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
            lessonDescription = addStyling(currentLesson!.explanation)
        }else{
            currentLesson = nil
            currentLessonIndex = 0
        }
    }
    //MARK: - Code styling
    
    private func addStyling(_ htmlString: String) -> NSAttributedString {
        
        var resultString = NSAttributedString()
        var data = Data()
        
        //add the styling data
        if styleData != nil{
            data.append(styleData!)
        }
        //add the html data
        data.append(Data(htmlString.utf8))
        
        
        
        
        //convert to attributed string
      
            if let attirbutedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
               
                resultString = attirbutedString
            }
        
        return resultString
    }
}


