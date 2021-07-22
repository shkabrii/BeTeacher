//
//  StudentViewModel.swift
//  BeTeacher
//
//  Created by MacBook on 22.07.2021.
//

import Combine

final class StudentViewModel: ObservableObject, Identifiable {
    private let studentRepository = StudentRepository()
    @Published var student: Student
    
    var id = ""
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(student: Student) {
        self.student = student
        $student
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}
