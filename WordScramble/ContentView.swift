//
//  ContentView.swift
//  WordScramble
//
//  Created by Guillermo Ruiz Baires on 17/7/23.
//

import SwiftUI

struct ContentView: View {
    private var fruits = ["Bannana", "Grape", "Apple"]
    
    var body: some View {
        /// Just for practice purpose
        NavigationStack {
            List {
                Section("Static Section") {
                    Text("Static Row 1")
                    Text("Static Row 2")
                }
                
                Section("Dynamic Section") {
                    ForEach(1..<4) {
                        Text("Dynamic row \($0)")
                    }
                }
                
                Section("Dynamic section with an array") {
                    ForEach(fruits, id: \.self) {
                        Text("I like \($0)")
                    }
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("Practicing List")
        }
    }
    
    func loadFiles() {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                fileContents
            }
        }
    }
    
    func test() -> [String] {
        let input = " Guillermo Ruiz Baires"
        let names = input.components(separatedBy: " ")
        
        let word = "workts"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        
        let misspelledRage = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return names
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
