//
//  NoteDetailViewController.swift
//  SimpleNoteTests
//
//  Created by Natthawut Haematulin on 16/4/2564 BE.
//

import XCTest
@testable import SimpleNote

class NoteDetailViewControllerTests: XCTestCase {
    private var navigationController: UINavigationController!
    private var viewController: NoteDetailViewController!
    private let viewModel = MockNoteDetailViewModel()
    
    override func setUp() {
        viewController = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NoteDetailViewController") as! NoteDetailViewController)
        viewController.viewModel = viewModel
        _ = viewController.view // To call viewDidLoad()
    }

    func testNoteDetail_successful() {
        // TODO: Add test assertions
    }
}
