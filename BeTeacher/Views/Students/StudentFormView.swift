//
//  StudentFormView.swift
//  BeTeacher
//
//  Created by MacBook on 22.07.2021.
//

import SwiftUI

struct StudentFormView : View {
    @State private var name : String = ""
    @State private var totalPaid : String = ""
    @State private var currentBalance : String = ""
    
    public var didAddStudent: (_ student: Student) -> Void
    
    var body : some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Name", text: $name)
                    TextField("Current balance", text: $currentBalance)
                    TextField("Totally paid", text: $totalPaid)
                }
                
                Button("Add a student") {
                    let student = Student(name: name, totalPaid: Int(totalPaid)!, currentBalance: Int(currentBalance)!)
                    didAddStudent(student)
                }.disabled(name.isEmpty || Int(totalPaid) == nil || Int(currentBalance) == nil).padding()
            }.navigationTitle("New student")
        }
    }
}
