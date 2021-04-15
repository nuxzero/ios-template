//
//  NotesViewModel.swift
//  SimpleNote
//
//  Created by Natthawut Haematulin on 14/4/2564 BE.
//

import Foundation

class NotesViewModel {
    let notes: Observable<[Note]> = Observable([Note]())
    private let noteService: NoteServiceProtocol
    
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
            }
        }
    }
}
