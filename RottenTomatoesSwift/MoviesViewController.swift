//
//  MoviesViewController.swift
//  RottenTomatoesSwift
//
//  Created by Ashish Nagavaram on 9/13/14.
//  Copyright (c) 2014 personal. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var progressView: UIActivityIndicatorView!
    var movies: Dictionary<String, AnyObject>! = nil;
    var movie: [NSDictionary]! = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self;
        tableView.dataSource = self;
        // Do any additional setup after loading the view.
        
        
        var url = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=9htuhtcb4ymusd73d4z6jxcj"
        
        let manager = AFHTTPRequestOperationManager()

        manager.requestSerializer = AFJSONRequestSerializer()

        manager.responseSerializer = AFJSONResponseSerializer()

        
        manager.GET(url, parameters: nil,
            success: { ( operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                self.movies = responseObject as Dictionary<String, AnyObject>
                self.movie = (self.movies["movies"] as AnyObject?) as? [NSDictionary];
                
                self.tableView.reloadData();
                self.progressView.hidden = true;
                
            },
            failure: { (operation: AFHTTPRequestOperation!, error: NSError!) in
                self.errorView.hidden = false;
                self.tableView.hidden = true
                self.errorLabel.text = error.localizedDescription;
        })
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as MovieTableViewCell
        
        if movie.count == 0 {
            return UITableViewCell();
        }
        
        //cell.movieTitleLabel.text = movies[;
        
        //println("\(movie)");
        
        var mov = self.movie[indexPath.row];
        
        cell.movieTitleLabel.text = mov["title"] as String!;
        cell.movieSynopsisLabel.text = mov["synopsis"] as String!;
        
        var poster = mov["posters"] as NSDictionary
        var posterURL = poster["thumbnail"] as NSString!;
        
        
        
        cell.moviePosterImageView.setImageWithURL(NSURL(string: posterURL));
        
        
        
        //cell.movieSynopsisLabel.textAlignment = NSTextAlignment;
        
//      println("\(mov)");
        
        return cell;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!,
         sender: AnyObject!){
            //make sure that the segue is going to secondViewController
            let selectedIndex = self.tableView.indexPathForCell(sender as UITableViewCell)
            var mov = self.movie[selectedIndex!.row];
            
            if segue.identifier == "MovieViewController"{
            
                var destination = segue.destinationViewController as MovieViewController
                //var mov = self.movie[indexPath.row];
                
                destination.movieSynopsisViewVar = mov["synopsis"] as String!;
                var poster = mov["posters"] as NSDictionary
                
                destination.titleVar = mov["title"] as String
                
                var posterurl1 = poster["original"] as String;
                println(posterurl1)
                destination.completeImageViewVar = posterurl1;
   
                
                //var poster = mov["posters"] as NSDictionary
                //var posterURL = poster["detailed"] as String
                //destination.completeImageView.setImageWithURL(NSURL(string: posterURL));
            }
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
