//
//  ContentView.swift
//  BeTeacher
//
//  Created by MacBook on 22.07.2021.
//

import SwiftUI

struct ContentView : View {
    
    init() {
        UITabBar.appearance().barTintColor = .systemBackground
    }
    
    var body: some View {
        TabView {
            LessonListView(lessonListViewModel: LessonListViewModel())
                .tabItem {
                    Image(systemName: "calendar.badge.clock")
                    Text("Lessons")
                }
            StudentListView(studentListViewModel: StudentListViewModel())
                .tabItem {
                    Image(systemName: "graduationcap")
                    Text("Students")
                }
            Text("Finances")
                .tabItem {
                    Image(systemName: "banknote")
                    Text("Finances")
                }
        }
    }
}
