//
//  NotesViewControllerTests.swift
//  SimpleNoteTests
//
//  Created by Natthawut Haematulin on 15/4/2564 BE.
//

import XCTest
@testable import SimpleNote

class NotesViewControllerTests: XCTestCase {
    private var navigationController: UINavigationController!
    private var viewController: NotesViewController!
    private let viewModel = MockNotesViewModel()
    
    override func setUp() {
        navigationController = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NotesNavigationController") as! UINavigationController)
        viewController = (navigationController.children[0] as! NotesViewController)
        viewController.viewModel = viewModel
        _ = viewController.view // To call viewDidLoad()
    }

    override func tearDownWithError() throws {
        viewController = nil
    }

    func testNotesTableView_showListOfNotes() {
        XCTAssertTrue(viewModel.isFetchNotesCalled)
        XCTAssertFalse(viewController.tableView.isHidden)
        XCTAssertEqual(2, viewController.tableView.numberOfRows(inSection: 0))
    }
    
    // TODO: Figure out to click tableView's row
//    func testClickTableCell_navigateNoteDetail() {
//        XCTAssertEqual(2, viewController.tableView.numberOfRows(inSection: 0))
//        viewController.tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .none)
//        let noteDetailViewController = navigationController.children[1] as! NoteDetailViewController
//        XCTAssertEqual(1, noteDetailViewController.note!.id)
//    }
}
