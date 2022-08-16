//
//  MemoViewController.swift
//  MemoPad
//
//  Created by 原田摩利奈 on 8/15/22.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate {
    
     @IBOutlet var titleTextField: UITextField!
     @IBOutlet var contentTextView: UITextView!
     
     let saveDate: UserDefaults = UserDefaults.standard
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         titleTextField.text = saveDate.object(forKey: "title") as? String
         contentTextView.text = saveDate.object(forKey: "content") as? String
         
         titleTextField.delegate = self
         
         // Do any additional setup after loading the view.
     }
     
     @IBAction func saveButton(){
         saveDate.set(titleTextField.text, forKey: "title")
         saveDate.set(contentTextView.text, forKey: "content")
         
         let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました。", preferredStyle: .alert)
         
         alert.addAction(UIAlertAction(title: "OK", style: .default,handler: { action in
             self.navigationController?.popViewController(animated: true)
             print("OKボタンが押されました！")
         }))
         
         present(alert, animated: true,completion: nil)
         
     }
     
     func textFieldShouldReturn(_ textFiled: UITextField) -> Bool {
         textFiled.resignFirstResponder()
         return true
     }
}
