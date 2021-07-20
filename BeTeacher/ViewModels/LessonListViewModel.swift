//
//  LessonListViewModel.swift
//  BeTeacher
//
//  Created by MacBook on 20.07.2021.
//

import Combine

final class LessonListViewModel: ObservableObject {
    @Published var lessonRepository = LessonRepository()
    @Published var lessonViewModels: [LessonViewModel] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        lessonRepository.$lessons
            .map { lessons in
                lessons.map(LessonViewModel.init)
            }
            .assign(to: \.lessonViewModels, on: self)
            .store(in: &cancellables)
    }
    
    func add(_ lesson: Lesson) {
        lessonRepository.add(lesson)
    }
    
    func remove(_ lesson: Lesson) {
        lessonRepository.remove(lesson)
    }
    
    func update(_ lesson: Lesson) {
        lessonRepository.update(lesson)
    }
}
