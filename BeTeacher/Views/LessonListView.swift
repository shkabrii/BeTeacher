//
//  LessonListView.swift
//  BeTeacher
//
//  Created by MacBook on 20.07.2021.
//

import SwiftUI

struct LessonListView: View {
    @ObservedObject var lessonListViewModel: LessonListViewModel
    
    var body: some View {
        VStack {
            List(lessonListViewModel.lessonViewModels) { lessonVM in
                Text(lessonVM.lesson.subject)
            }
            Button("Add Mock Lesson") {
                let lesson = Lesson(duration: "2", subject: "Mathe VWU", student: "Dilshoda", date: "20.08.2021", price: "30$", finished: false)
                lessonListViewModel.add(lesson)
            }
        }
    }
}

struct LessonListView_Previews: PreviewProvider {
    static var previews: some View {
        LessonListView(lessonListViewModel: LessonListViewModel())
    }
}
