//
//  DiagnosticHappinessViewController.swift
//  Psychologist
//
//  Created by Aye Min Aung on 27/5/15.
//  Copyright (c) 2015 Aye Min Aung. All rights reserved.
//

import UIKit

class DiagnosticHappinessViewController: HappinessViewController, UIPopoverPresentationControllerDelegate{
    
    override var happiness: Int {
        didSet {
            diagnosticHistory += [happiness]
        }
    }
    private let defaults = NSUserDefaults.standardUserDefaults()
    var diagnosticHistory: [Int] {
        get {
            return defaults.objectForKey(History.DefaultsKey) as? [Int] ?? []
        }
        
        set {
            defaults.setObject(newValue, forKey: History.DefaultsKey)
        }
    }
    private struct History {
        static let SegueIdentifier = "Show Diagnostic History"
        static let DefaultsKey = "Psychologist.DiagnosticHappniessViewController.History"
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if let tvc = segue.destinationViewController as? TextViewController {
                if let ppc = tvc.popoverPresentationController {
                    ppc.delegate = self
                }
                tvc.text = "\(diagnosticHistory)"
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController!, traitCollection: UITraitCollection!) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
}
