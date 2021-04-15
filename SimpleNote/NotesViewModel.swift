//
//  NotesViewModel.swift
//  SimpleNote
//
//  Created by Natthawut Haematulin on 14/4/2564 BE.
//

import Foundation

class NotesViewModel {
    let notes: Observable<[Note]> = Observable([Note]())
    private let noteService: NoteService
    
    init(_ noteService: NoteService) {
        self.noteService = noteService
    }
    
    func fetchNotes() {
        noteService.retrieveNotes { result in
            switch result {
            case .success(let notes):
                self.notes.value = notes
            case .failure(let error):
                // TODO: set error value
                print(error)
            }
        }
    }
}
