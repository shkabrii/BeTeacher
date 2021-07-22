//
//  FormView.swift
//  BeTeacher
//
//  Created by MacBook on 20.07.2021.
//

import SwiftUI

struct FormView : View {
    @State private var student : String = ""
    @State private var subject : String = ""
    @State private var date = Date()
    
    public var didAddLesson: (_ lesson: Lesson) -> Void
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var body : some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Student", text: $student)
                    TextField("Subject", text: $subject)
                    Text("Enter date")
                        .font(.title2)
                    DatePicker("", selection: $date)
                        .datePickerStyle(WheelDatePickerStyle())
                        .frame(maxHeight: 400)
                }
                
                Button("Plan a Lesson") {
                    let lesson = Lesson(subject: subject, student: student, date: date, price: "30$", finished: false)
                    print(date)
                    didAddLesson(lesson)
                }.disabled(student.isEmpty || subject.isEmpty).padding()
            }.navigationTitle("New Lesson")
        }
    }
}
