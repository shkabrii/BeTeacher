//
//  StudentListView.swift
//  BeTeacher
//
//  Created by MacBook on 22.07.2021.
//

import SwiftUI

struct StudentListView: View {
    @ObservedObject var studentListViewModel: StudentListViewModel
    @State private var showingForm = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(studentListViewModel.studentViewModels) {
                        studentVM in
                        StudentView(studentViewModel: studentVM)
                    }.onDelete(perform: delete)
                }
                .listStyle(InsetListStyle())
                .navigationTitle("Students")
                .navigationBarItems(trailing:
                    Button(action: {
                        showingForm = true
                    }) {
                        Text("Add student")
                    }.sheet(isPresented: $showingForm) {
                        StudentFormView { (student) in
                            studentListViewModel.add(student)
                            showingForm = false
                        }
                    }
                )
            }
        }
    }
    
    private func delete(at offsets: IndexSet) {
        offsets.map { studentListViewModel.studentViewModels[$0].student
        }.forEach(studentListViewModel.remove)
    }
}
