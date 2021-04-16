//
//  NotesViewModel.swift
//  SimpleNote
//
//  Created by Natthawut Haematulin on 14/4/2564 BE.
//

import Foundation

protocol NotesViewModelProtocol {
    var notes: Observable<[Note]> { get }
    var error: Observable<Error> { get }
    func fetchNotes()
}

class NotesViewModel: NotesViewModelProtocol {
    private let noteService: NoteServiceProtocol
    
    let notes: Observable<[Note]> = Observable([Note]())
    let error: Observable<Error> = Observable(nil)
    
    init(_ noteService: NoteServiceProtocol) {
        self.noteService = noteService
    }
    
    func fetchNotes() {
        noteService.fetchNotes { result in
            switch result {
            case .success(let notes):
                self.notes.value = notes
            case .failure(let error):
                print(error)
                self.error.value = error
            }
        }
    }
}
