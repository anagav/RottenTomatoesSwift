//
//  MovieTableViewCell.swift
//  RottenTomatoesSwift
//
//  Created by Ashish Nagavaram on 9/13/14.
//  Copyright (c) 2014 personal. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieSynopsisLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setMovieTitleLabel(movietitle: String){
        
        println("function argument is \(movietitle)")
        
        if movieTitleLabel != nil{
                  movieTitleLabel!.text = "test1";
        }
        
      
       // movieTitleLabel!.text = movietitle.capitalizedString;
    }

}
