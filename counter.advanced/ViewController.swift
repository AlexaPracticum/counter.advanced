//
//  ViewController.swift
//  counter.advanced
//
//  Created by Alexandra Vasilenko on 01.12.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countNumber: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var subtractButton: UIButton!
    
    @IBOutlet weak var reloadButton: UIButton!
    
    @IBOutlet weak var historyOfActions: UITextView!
    
    private var count: Int = 0
    let textView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyOfActions.text = "История изменений:\n"
        
        addButton.layer.cornerRadius = 40
        addButton.clipsToBounds = true
        
        subtractButton.layer.cornerRadius = 40
        subtractButton.clipsToBounds = true
        
        reloadButton.layer.cornerRadius = 40
        reloadButton.clipsToBounds = true
        
        textView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        textView.isEditable = false
        textView.isScrollEnabled = true
    }
    
    
    @IBAction func addCount(_ sender: Any) {
        if count > -1 {
            count = count + 1
            countNumber.text = "\(count)"
        }
        let date = Date()
        let formatter = DateFormatter()
                   formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                   let formattedDate = formatter.string(from: date)
        
        historyOfActions.text += "\(formattedDate): значение изменено на +1\n"
    }
    
    @IBAction func subtractCount(_ sender: Any) {
        if count > 0 {
            count = count - 1
            countNumber.text = "\(count)"
            
            let date = Date()
            let formatter = DateFormatter()
                       formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                       let formattedDate = formatter.string(from: date)
            
            historyOfActions.text += "\(formattedDate): значение изменено на -1\n"
        } else {
            let date = Date()
            let formatter = DateFormatter()
                       formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                       let formattedDate = formatter.string(from: date)
            
            historyOfActions.text += "\(formattedDate): попытка уменьшить значение счётчика ниже 0\n"
        }
    }
    
    @IBAction func reloadCount(_ sender: Any) {
        count = 0
        countNumber.text = "\(count)"
        let date = Date()
        let formatter = DateFormatter()
                   formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                   let formattedDate = formatter.string(from: date)
        historyOfActions.text += "\(formattedDate): значение сброшено\n"
    }

}
