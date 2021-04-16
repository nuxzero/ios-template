//
//  Observable.swift
//  SimpleNote
//
//  Created by Natthawut Haematulin on 14/4/2564 BE.
//

/// This class similars to the Box class in this tutorial https://www.raywenderlich.com/library?domain_ids%5B%5D=1&q=mvvm&sort_order=relevance#toc-anchor-005 .

import Foundation

class Observable<T> {
    typealias Listener = (T?) -> Void
    var listener: Listener?
    
    var value: T? {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T?) {
        self.value = value
}
    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
