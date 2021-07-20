//
//  LessonViewModel.swift
//  BeTeacher
//
//  Created by MacBook on 20.07.2021.
//

import Combine

final class LessonViewModel: ObservableObject, Identifiable {
    private let lessonRepository = LessonRepository()
    @Published var lesson: Lesson
    
    var id = ""
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(lesson: Lesson) {
        self.lesson = lesson
        $lesson
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}
