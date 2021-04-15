//
//  NotesViewModelTests.swift
//  SimpleNoteTests
//
//  Created by Natthawut Haematulin on 15/4/2564 BE.
//

import XCTest
@testable import SimpleNote

class NotesViewModelTests: XCTestCase {
    private var noteService: MockNoteService!
    private var viewModel: NotesViewModel!
    
    override func setUpWithError() throws {
        noteService = MockNoteService()
        viewModel = NotesViewModel(noteService)
    }

    func testFetchNotes_successful() {
        let expectation = self.expectation(description: "Fetch notes")
        
        viewModel.fetchNotes()
        
        viewModel.notes.bind { notes in
            XCTAssertEqual(self.noteService.notes.count, notes?.count)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testFetchNotes_failure() {
        let expectation = self.expectation(description: "Fetch notes")
        noteService.fetchNotesSuccessfulFlag = false
        
        viewModel.fetchNotes()
        
        viewModel.error.bind { error in
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 3, handler: nil)
    }
}
