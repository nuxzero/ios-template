//
//  MockNoteDetailViewModel.swift
//  SimpleNoteTests
//
//  Created by Natthawut Haematulin on 16/4/2564 BE.
//

import Foundation
@testable import SimpleNote

class MockNoteDetailViewModel: NoteDetailViewModelProtocol {
    var note: Observable<Note> = Observable(nil)
    
    var error: Observable<Error> = Observable(nil)
    
    func fetchNote(_ id: Int) {
        
    }
    
    
}
