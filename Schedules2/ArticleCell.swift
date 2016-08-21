//
//  ArticleCell.swift
//  Schedules2
//
//  Created by Oscar Newman on 8/17/16.
//  Copyright © 2016 Oscar Newman. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var backgroundShadowView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryBanner: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {

        
        // Draw shadow on articel background
        backgroundShadowView.clipsToBounds = false
        
        backgroundShadowView.layer.shadowColor = UIColor(red:0.878, green:0.875, blue:0.867, alpha:1.000).CGColor
        backgroundShadowView.layer.shadowRadius = 0
        backgroundShadowView.layer.shadowOpacity = 1
        backgroundShadowView.layer.shadowOffset = CGSize(width: 0, height: 1)

        
    }
    
    func setup(article: Article) {
        titleLabel.text = article.title
        categoryLabel.text = article.category.uppercaseString
        authorLabel.text = article.author
        timeLabel.text = timeAgoSinceDate(article.date, numericDates: true)
        
        if article.category.lowercaseString == "news" {
            categoryBanner.backgroundColor = Stylesheet.Category.News.color
        } else {
            categoryBanner.backgroundColor = Stylesheet.Category.Announcement.color
        }
        
        setNeedsLayout()
        layoutIfNeeded()
        
        // Draw triangle inset on banner
        let mask = CAShapeLayer()
        mask.frame = categoryBanner.layer.bounds
        
        let width = categoryBanner.layer.frame.size.width
        let height = categoryBanner.layer.frame.size.height
        
        let path = CGPathCreateMutable()
        
        CGPathMoveToPoint(path, nil, 0, 0)
        CGPathAddLineToPoint(path, nil, width, 0)
        CGPathAddLineToPoint(path, nil, width-7, height/2)
        CGPathAddLineToPoint(path, nil, width, height)
        CGPathAddLineToPoint(path, nil, 0, height)
        CGPathAddLineToPoint(path, nil, 0, 0)
        CGPathCloseSubpath(path)
        
        mask.path = path
        categoryBanner.layer.mask = mask
        

    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        if highlighted {
            backgroundShadowView.backgroundColor = UIColor(white: 1.0, alpha: 0.6)
        } else {
            backgroundShadowView.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        }
    }
    
}
