//
//  ViewController.swift
//  Psychologist
//
//  Created by Aye Min Aung on 27/5/15.
//  Copyright (c) 2015 Aye Min Aung. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController
{
    
    
    @IBAction func nothing(sender: UIButton) {
        performSegueWithIdentifier("nothing", sender: self)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let hvc = (segue.destinationViewController as? UINavigationController)?.visibleViewController as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                    case "sad": hvc.happiness = 0
                    case "happy": hvc.happiness = 100
                    case "nothing": hvc.happiness = 25
                    default: hvc.happiness = 50
                }
            }
        }
    }

}

