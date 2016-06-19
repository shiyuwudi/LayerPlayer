//
//  ClassListViewController.swift
//  LayerPlayer
//
//  Created by Scott Gardner on 11/10/14.
//  Copyright (c) 2014 Scott Gardner. All rights reserved.
//

import UIKit

class ClassListViewController: UITableViewController {
  
  var classes: [(String, String)] {
    get {
      return [
        ("CALayer", "Manage and animate visual content"),
        ("CAScrollLayer", "Display portion of a scrollable layer"),
        ("CATextLayer", "Render plain text or attributed strings"),
        ("AVPlayerLayer", "Display an AV player "),
        ("CAGradientLayer", "Apply a color gradient over the background"),
        ("CAReplicatorLayer", "Duplicate a source layer"),
        ("CATiledLayer", "Asynchronously draw layer content in tiles"),
        ("CAShapeLayer", "Draw using scalable vector paths"),
        ("CAEAGLLayer", "Draw OpenGL content"),
        ("CATransformLayer", "Draw 3D structures"),
        ("CAEmitterLayer", "Render animated particles")
      ]
    }
  }
  
  var navController: UINavigationController!
  var detailViewController: UIViewController!
  var collapseDetailViewController = true
  
  override func viewDidLoad() {
    super.viewDidLoad()
    splitViewController?.delegate = self
  }
  
  // MARK: - UITableViewDataSource
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return classes.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ClassCell")!
    let row = indexPath.row
    cell.textLabel!.text = classes[row].0
    cell.detailTextLabel!.text = classes[row].1
    cell.imageView!.image = UIImage(named: classes[row].0)
    return cell
  }
  
  // MARK: - UITableViewDelegate
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let identifier = classes[indexPath.row].0
    navController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(identifier) as! UINavigationController
    detailViewController = navController.topViewController
    detailViewController?.navigationItem.leftBarButtonItem = splitViewController!.displayModeButtonItem()
    detailViewController?.navigationItem.leftItemsSupplementBackButton = true
    splitViewController?.showDetailViewController(navController, sender: nil)
    collapseDetailViewController = false
  }
  
}

extension ClassListViewController: UISplitViewControllerDelegate {
  
  func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool {
    return collapseDetailViewController
  }
  
}

