//
//  NotesViewController.swift
//  SimpleNote
//
//  Created by Natthawut Haematulin on 11/1/2564 BE.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    private let viewModel = NotesViewModel(NoteService.shared)
    private var notes:[Note] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        viewModel.notes.bind { notes in
            self.notes = notes  ?? []
            self.tableView.reloadData()
        }
        
        viewModel.fetchNotes()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoteTableViewCell", for: indexPath) as? NoteTableViewCell else {
            fatalError("The dequeued cell is not an instance of NoteTableViewCell.")
        }
        
        let note = notes[indexPath.row]
        
        cell.titleLabel.text = note.title
        ImageLoader.loadImage(with: cell.thumbImageView, for: note.image, completionHandler: nil)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let note = notes[indexPath.row]
        
        print(note)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(90)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "ToNoteDetail" {
            guard let noteDetailViewController = segue.destination as? NoteDetailViewController else {
                fatalError("The segue is not an instance of NoteDetailViewController.")
            }
            noteDetailViewController.note = notes[tableView.indexPathForSelectedRow!.row]
        } 
    }
}
