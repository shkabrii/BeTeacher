//
//  LessonRepository.swift
//  BeTeacher
//
//  Created by MacBook on 20.07.2021.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

final class LessonRepository: ObservableObject {
    private let path = "lessons"
    private let store = Firestore.firestore()
    @Published var lessons: [Lesson] = []
    
    init() {
        get()
    }
    
    func get() {
        store.collection(path).addSnapshotListener { (snapshot, error) in
            if let error = error {
                print(error)
                return
            }
            self.lessons = snapshot?.documents.compactMap {
                try? $0.data(as: Lesson.self)
            } ?? []
        }
    }
    
    func add(_ lesson: Lesson) {
        do {
           _ = try store.collection(path).addDocument(from: lesson)
        } catch {
            fatalError("Was not able to add a lesson")
        }
    }
}