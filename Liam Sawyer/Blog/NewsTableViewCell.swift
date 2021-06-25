//
//  NewsTableViewCell.swift
//  Liam Sawyer
//
//  Created by Liam Sawyer on 6/24/21.
//

import UIKit

enum CellState {
    case expanded
    case collapsed
}



class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.numberOfLines = 3
        }
    }
    @IBOutlet weak var dateLabel: UILabel!
    
    var item: RSSItem! {
        didSet {
            titleLabel.text = item.title
            descriptionLabel.text = item.description
            dateLabel.text = item.pubDate
        }
    }
    
}

