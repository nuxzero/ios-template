//
//  NoteDetailViewModel.swift
//  SimpleNote
//
//  Created by Natthawut Haematulin on 15/4/2564 BE.
//

import Foundation

protocol NoteDetailViewModelProtocol {
    var note: Observable<Note> { get }
    var error: Observable<Error> { get }
    
    func fetchNote(_ id: Int)
}

class NoteDetailViewModel: NoteDetailViewModelProtocol {
    private let noteService: NoteServiceProtocol
    
    let note: Observable<Note> = Observable(nil)
    let error: Observable<Error> = Observable(nil)
    
    init(_ noteService: NoteServiceProtocol) {
        self.noteService = noteService
    }
    
    func fetchNote(_ id: Int) {
        noteService.fetchNote(with: id) { result in
            switch result {
            case .success(let note):
                self.note.value = note
            case .failure(let error):
                print(error)
                self.error.value = error
            }
        }
    }
}
