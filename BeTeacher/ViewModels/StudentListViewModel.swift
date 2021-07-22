//
//  StudentListViewModel.swift
//  BeTeacher
//
//  Created by MacBook on 22.07.2021.
//

import Combine

final class StudentListViewModel: ObservableObject {
    @Published var studentRepository = StudentRepository()
    @Published var studentViewModels: [StudentViewModel] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        studentRepository.$students
            .map { students in
                students.map(StudentViewModel.init)
            }
            .assign(to: \.studentViewModels, on: self)
            .store(in: &cancellables)
    }
    
    func add(_ student: Student) {
        studentRepository.add(student)
    }
    
    func remove(_ student: Student) {
        studentRepository.remove(student)
    }
    
    func update(_ student: Student) {
        studentRepository.update(student)
    }
}

