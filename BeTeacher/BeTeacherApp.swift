//
//  BeTeacherApp.swift
//  BeTeacher
//
//  Created by MacBook on 20.07.2021.
//

import SwiftUI
import Firebase

@main
struct BeTeacherApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LessonListView(lessonListViewModel: LessonListViewModel())
        }
    }
}
