//
//  MovieViewController.swift
//  RottenTomatoesSwift
//
//  Created by Ashish Nagavaram on 9/13/14.
//  Copyright (c) 2014 personal. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var completeImageView: UIImageView!
    
    var completeImageViewVar : String = "";
    var movieSynopsisViewVar :String = "";
    var titleVar = "";


    @IBOutlet weak var movieSynopsisView: UILabel!
    
@IBOutlet weak var titleNav: UINavigationItem!
    @IBOutlet weak var progressView: UIActivityIndicatorView!
    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.contentSize = CGSize(width:0, height: 800
        )

        progressView.hidden = true;

        completeImageView.setImageWithURL(NSURL(string: completeImageViewVar));
        
        UIView.animateWithDuration(1.5, animations: {
            self.completeImageView.alpha = 1.0
        })

        titleNav.title = titleVar;

        movieSynopsisView.text = movieSynopsisViewVar;
        
        movieSynopsisView.sizeToFit();
        
        
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
