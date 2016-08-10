//
//  ViewController.swift
//  YXJSwipeTableViewCell
//
//  Created by yuanxiaojun on 16/8/9.
//  Copyright © 2016年 袁晓钧. All rights reserved.
//

import UIKit
import YXJSwipeTableViewCell

class ViewController: UITableViewController, YXJSwipeTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK:table
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        weak var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as? ViewControllerCell
        cell!.label!.text = "\(indexPath.row)"

        cell!.setRightUtilityButtons(rightButtons() as [AnyObject], withButtonWidth: (cell?.frame.size.height)!)
        cell!.delegate = self

        return cell!
    }

    // MAKR:- YXJSwipeTableViewDelegate
    func rightButtons() -> NSMutableArray {
        let rightUtilityButtons = NSMutableArray()

        rightUtilityButtons.YXJ_addUtilityButtonWithColor(UIColor.redColor(), title: "取消关注", titleColor: UIColor.whiteColor(), font: UIFont.systemFontOfSize(15), normalIcon: UIImage(named: "course_noFollow"), selectedIcon: UIImage(named: "course_noFollow"), position: .Top, space: 4)

        return rightUtilityButtons
    }
    func swipeableTableViewCell(cell: YXJSwipeTableViewCell!, didTriggerRightUtilityButtonWithIndex index: Int) {
        print(">>>>>>>> \(index)")
        cell.hideUtilityButtonsAnimated(true)
    }
    func swipeableTableViewCellShouldHideUtilityButtonsOnSwipe(cell: YXJSwipeTableViewCell!) -> Bool {
        return true
    }
    func swipeableTableViewCell(cell: YXJSwipeTableViewCell!, canSwipeToState state: YXJSwipeCellState) -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

