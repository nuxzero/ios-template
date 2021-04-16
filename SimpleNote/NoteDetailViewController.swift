//
//  NoteDetailViewController.swift
//  SimpleNote
//
//  Created by Natthawut Haematulin on 13/1/2564 BE.
//

import UIKit

class NoteDetailViewController: UIViewController {
    let noteService = NoteService.shared
    var viewModel: NoteDetailViewModelProtocol = NoteDetailViewModel(NoteService.shared)
    
    var note: Note?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var bannerImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.note.bind { note in
            guard let note = note else {
                return
            }
            self.titleLabel.text = note.title
            self.descriptionLabel.text = note.note
            ImageLoader.loadImage(with: self.bannerImageView, for: note.image, completionHandler: nil)
        }
        
        if let note = note {
            viewModel.fetchNote(note.id)
        }
    }
}
