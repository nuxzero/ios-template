//
//  NoteDetailViewModel.swift
//  SimpleNote
//
//  Created by Natthawut Haematulin on 15/4/2564 BE.
//

import Foundation

class NoteDetailViewModel {
    let note: Observable<Note> = Observable(nil)
    private let noteService: NoteService
    
    init(_ noteService: NoteService) {
        self.noteService = noteService
    }
    
    func fetchNote(_ id: Int) {
        noteService.retrieveNote(with: id) { result in
            switch result {
            case .success(let note):
                self.note.value = note
            case .failure(let error):
                // TODO: set error value
                print(error)
            }
        }
    }
}
