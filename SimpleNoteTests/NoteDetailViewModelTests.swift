//
//  NoteDetailViewModelTests.swift
//  SimpleNoteTests
//
//  Created by Natthawut Haematulin on 15/4/2564 BE.
//

import XCTest
@testable import SimpleNote

class NoteDetailViewModelTests: XCTestCase {

    private var noteService: MockNoteService!
    private var viewModel: NoteDetailViewModel!
    
    override func setUpWithError() throws {
        noteService = MockNoteService()
        viewModel = NoteDetailViewModel(noteService)
    }

    func testFetchNote_successful() {
        let expectation = self.expectation(description: "Fetch notes")
        
        viewModel.fetchNote(1)
        
        viewModel.note.bind { note in
            XCTAssertEqual(self.noteService.notes[0].id, note!.id)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testFetchNote_failure() {
        let expectation = self.expectation(description: "Fetch notes")
        noteService.fetchNoteSuccessfulFlag = false
        
        viewModel.fetchNote(1)
        
        viewModel.error.bind { error in
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testFetchNote_noteNotFound() {
        let expectation = self.expectation(description: "Fetch notes")
        
        viewModel.fetchNote(999)
        
        viewModel.error.bind { error in
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
}
