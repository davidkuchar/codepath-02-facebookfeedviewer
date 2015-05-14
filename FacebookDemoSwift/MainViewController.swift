//
//  MainViewController.swift
//  FacebookDemoSwift
//
//  Created by Timothy Lee on 2/11/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var feedView: UITableView!
    
    var posts: [FBGraphObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.feedView.rowHeight = UITableViewAutomaticDimension
        
        reload()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reload() {
        FBRequestConnection.startWithGraphPath("/me/home", parameters: nil, HTTPMethod: "GET") { (connection: FBRequestConnection!, result: AnyObject!, error: NSError!) -> Void in
//            println("\(result)")
            
            self.posts = result["data"] as! [FBGraphObject]
            self.feedView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = self.posts[indexPath.row] as FBGraphObject
        
        if let imageUrlString = post.objectForKey("picture") as? String {
            let cell = self.feedView.dequeueReusableCellWithIdentifier("com.facefeed.mixed", forIndexPath: indexPath) as! FaceFeedMixedCell
            
            let imageUrl = NSURL(string: imageUrlString)
            cell.feedImageView.setImageWithURL(imageUrl)
            cell.feedMessageLabel.text = post.objectForKey("message") as? String ?? ""
            
            return cell
        } else {
            let cell = self.feedView.dequeueReusableCellWithIdentifier("com.facefeed.plain", forIndexPath: indexPath) as! FaceFeedPlainCell
            
            cell.feedMessageLabel.text = post.objectForKey("message") as? String ?? ""
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts?.count ?? 0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
