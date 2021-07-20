//
//  LessonView.swift
//  BeTeacher
//
//  Created by MacBook on 20.07.2021.
//

import SwiftUI

struct LessonView: View {
    @State private var dragOffset = CGFloat.zero
    
    var lessonViewModel: LessonViewModel
    
    
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(lessonViewModel.lesson.finished ? Color.green : Color.blue)
            .frame(height: 120)
            .overlay(
                ZStack {
                    HStack {
                        Spacer()
                        VStack {
                            Image ( systemName: lessonViewModel.lesson.finished ? "star.fill" : "star")
                        }
                        Spacer()
                    }
                    Text(lessonViewModel.lesson.student)
                    Spacer()
                    Text(lessonViewModel.lesson.subject)
                    Spacer()
                    Text(lessonViewModel.lesson.price)
                }.padding()
            )
            .onTapGesture {
                lessonViewModel.lesson.finished = true
            }
    }
}
