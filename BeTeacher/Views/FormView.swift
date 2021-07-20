//
//  FormView.swift
//  BeTeacher
//
//  Created by MacBook on 20.07.2021.
//

import SwiftUI

struct FormView : View {
    @State private var student : String = ""
    @State private var time : String = ""
    @State private var duration : String = ""
    @State private var subject : String = ""
    
    public var didAddLesson: (_ lesson: Lesson) -> Void
    
    var body : some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Customer", text: $student)
                    TextField("Subject", text: $subject)
                    TextField("Duration", text: $duration)
                    TextField("Time", text: $time)
                }
                
                Button("Plan a Lesson") {
                    let lesson = Lesson(duration: duration, subject: subject, student: student, date: "20.08.2021", price: "30$", finished: false)
                    didAddLesson(lesson)
                }.disabled(student.isEmpty || time.isEmpty || duration.isEmpty || subject.isEmpty).padding()
            }.navigationTitle("New Lesson")
        }
    }
}
