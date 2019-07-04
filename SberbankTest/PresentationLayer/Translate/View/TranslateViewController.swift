//
//  ViewController.swift
//  SberbankTest
//
//  Created by Влад Калаев on 03/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import UIKit

class TranslateViewController: UIViewController, UITextViewDelegate, TranslateViewProtocol {
    
    var presenter: TranslatePresenterProtocol?

    @IBOutlet weak var arrowButton: UIButton!
    @IBOutlet weak var firstLanguageButton: UIButton!
    @IBOutlet weak var secondLanguageButton: UIButton!
    
    @IBOutlet weak var mainViewBackground: UIView!
    
    @IBOutlet weak var translationTextview: UITextView!
    @IBOutlet weak var translatedTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        buttonConfiguration()
        textViewConfiguration()
    }

    // MARK: - Protocols methods input

    func showTranslatedText(text: String) {
        translatedTextView.text = text
    }
    
    
    // MARK: - TextView configuration
    
    // FIXME: - make PlaseHolder 
    
    func textViewConfiguration() {
        
        translationTextview.delegate = self
        
    }
    
    // MARK: - Delegate methods
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        presenter?.translateText(text: textView.text)
    }
    
    
    // MARK: - Buttons configuration
    
    func buttonConfiguration() {
        
        arrowButton.addTarget(self, action: #selector(switchTranslationWords), for: .touchDown)
        firstLanguageButton.addTarget(self, action: #selector(changeTranslationFirst), for: .touchDown)
        secondLanguageButton.addTarget(self, action: #selector(changeTranslationSecond), for: .touchDown)

    }

    // MARK: - Buttons actions
    
    @objc func switchTranslationWords() { // FIXME: - Text in buttons
        
        let from = firstLanguageButton.titleLabel?.text
        let to = secondLanguageButton.titleLabel?.text
        
        firstLanguageButton.titleLabel?.text = to
        secondLanguageButton.titleLabel?.text = from

    }
    
    @objc func changeTranslationFirst() {
        configActionSheet()
    }
    
    @objc func changeTranslationSecond() {
        configActionSheet()
    }
    
    // MARK: - Action Sheet
    
    func configActionSheet() {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let sendButton = UIAlertAction(title: "Русский", style: .default, handler: { (action) -> Void in
            print("Русский button tapped")
        })
        
        let  deleteButton = UIAlertAction(title: "English", style: .default, handler: { (action) -> Void in
            print("English button tapped")
        })
        
        let cancelButton = UIAlertAction(title: "Белорусский", style: .default, handler: { (action) -> Void in
            print("Белорусский button tapped")
        })
 
        alertController.addAction(sendButton)
        alertController.addAction(deleteButton)
        alertController.addAction(cancelButton)
        
        self.navigationController!.present(alertController, animated: true, completion: nil)
        
    }

    
    

}

