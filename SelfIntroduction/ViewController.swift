//
//  ViewController.swift
//  SelfIntroduction
//
//  Created by Dongdong Li on 5/10/15.
//  Copyright (c) 2015 Dongdong Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var dob: UIDatePicker!
    @IBOutlet weak var heightNum: UISlider!
    @IBOutlet weak var lastSemester: UISegmentedControl!
    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var result: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        name.delegate=self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func valueChanged(sender: UISlider) {
        var i=Int(sender.value);
        value.text="\(i)";
    }

    @IBAction func Clicked(sender: UIButton) {
        let gregorian = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let now = NSDate()
        let genderText = gender.selectedSegmentIndex==0 ? "male": "female"
        let components = gregorian?.components(NSCalendarUnit.YearCalendarUnit, fromDate: dob.date, toDate: now, options: NSCalendarOptions(0))
        let age = components?.year
        
        result.text = "\(name.text), \(age!) years old, \(genderText), Self-Motivation: \(value.text!)"
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
    
}

