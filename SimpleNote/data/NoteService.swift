//
//  NoteService.swift
//  SimpleNote
//
//  Created by Natthawut Haematulin on 11/1/2564 BE.
//

import Foundation

protocol NoteServiceProtocol {
    func fetchNotes(_ completionHandler: @escaping (Result<[Note], Error>) -> Void)
    func fetchNote(with id: Int, completionHandler: @escaping (Result<Note, Error>) -> Void)
}

class NoteService: NoteServiceProtocol {
    
    static let shared = NoteService()
    
    private var notes:[Note] = []
    private let networkService = NetworkService.shared
    
    func fetchNotes(_ completionHandler: @escaping (Result<[Note], Error>) -> Void) {
        let request = Note.getNoteListRequest()
        networkService.send(request) { result in
            var completionResult: Result<[Note], Error>
            defer {
                completionHandler(completionResult)
            }
            
            switch result {
            case .success(let data):
                print(data!)
                completionResult = .success(data!)
            case.failure(let error):
                print(error)
                completionResult = .failure(error)
            }
        }
    }
    
    func fetchNote(with id: Int, completionHandler: @escaping (Result<Note, Error>) -> Void) {
        let request = Note.getNoteRequest(id)
        networkService.send(request) { result in
            var completionResult: Result<Note, Error>
            defer {
                completionHandler(completionResult)
            }
            
            switch result {
            case .success(let data):
                print(data!)
                completionResult = .success(data!)
            case.failure(let error):
                print(error)
                completionResult = .failure(error)
            }
        }
    }
}
