//
//  LessonListView.swift
//  BeTeacher
//
//  Created by MacBook on 20.07.2021.
//

import SwiftUI

struct LessonListView: View {
    @ObservedObject var lessonListViewModel: LessonListViewModel
    @State private var showingForm = false
    @State private var showPassedLessons = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                Toggle(isOn: $showPassedLessons) {
                    Text("Show passed lessons")
                }.padding()
                List {
                    ForEach(lessonListViewModel.lessonViewModels.filter{
                        showPassedLessons == false ? $0.lesson.finished == showPassedLessons : true
                    }) {
                        lessonVM in
                        LessonView(lessonViewModel: lessonVM)
                            .onLongPressGesture(minimumDuration: 1.5) {
                                var lesson = lessonVM.lesson
                                lesson.finished.toggle()
                                lessonListViewModel.update(lesson)
                            }
                    }.onDelete(perform: delete)
                }
                .listStyle(InsetListStyle())
                .navigationTitle("Lessons")
                
                Button(action: {
                    showingForm = true
                }) {
                    Circle()
                        .fill(Color.green)
                        .frame(height: 60)
                        .overlay(Image(systemName: "plus").foregroundColor(.white))
                }.sheet(isPresented: $showingForm) {
                    FormView { (lesson) in
                        lessonListViewModel.add(lesson)
                        showingForm = false
                    }
                }
            }
        }
    }
    
    private func delete(at offsets: IndexSet) {
        offsets.map { lessonListViewModel.lessonViewModels[$0].lesson
        }.forEach(lessonListViewModel.remove)
    }
}

struct LessonListView_Previews: PreviewProvider {
    static var previews: some View {
        LessonListView(lessonListViewModel: LessonListViewModel())
    }
}
