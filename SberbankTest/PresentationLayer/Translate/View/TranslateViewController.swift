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
        
        navigationController?.setNavigationBarHidden(true, animated: false)

        buttonConfiguration()
        textViewConfiguration()
    }

    // MARK: - Protocols methods input

    func showTranslatedText(text: String) {
        translatedTextView.text = text
    }
    
    // MARK: - TextView configuration
    
    func textViewConfiguration() {
        
        translationTextview.delegate = self
        
        translationTextview.text = "Введите текст"
        translationTextview.textColor = UIColor.lightGray
        
    }
    
    // MARK: - TextView Delegate methods
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        let textCode = secondLanguageButton.titleLabel?.text

        presenter?.translateText(text: textView.text, textCode: textCode!)
    }
    
    // MARK: - Buttons configuration
    
    func buttonConfiguration() {
        
        arrowButton.addTarget(self, action: #selector(switchTranslationWords), for: .touchDown)
        firstLanguageButton.addTarget(self, action: #selector(changeTranslationFirst), for: .touchDown)
        secondLanguageButton.addTarget(self, action: #selector(changeTranslationSecond), for: .touchDown)
        
        arrowButton.tag = 0
        firstLanguageButton.tag = 1
        secondLanguageButton.tag = 2
    }

    // MARK: - Buttons actions
    
    @objc func switchTranslationWords() { // FIXME: - Text in buttons
        
        swapTextInButtons()
        
        if translationTextview.textColor != UIColor.lightGray {
            let from = translationTextview.text
            let to = translatedTextView.text
            
            translationTextview.text = to
            translatedTextView.text = from
        }
        
    }
    
    func swapTextInButtons() {
        let from = firstLanguageButton.titleLabel?.text
        let to = secondLanguageButton.titleLabel?.text
        
        firstLanguageButton.setTitle(to, for: .normal)
        secondLanguageButton.setTitle(from, for: .normal)
    }
    
    @objc func changeTranslationFirst(sender:UIButton) {
        configActionSheet(button: sender)
    }
    
    @objc func changeTranslationSecond(sender:UIButton) {
        configActionSheet(button: sender)
    }
    
    // MARK: - Action Sheet
    
    func configActionSheet(button:UIButton) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let rusButton = UIAlertAction(title: "Русский", style: .default, handler: { (action) -> Void in
            self.translationChangeLogic(text: "Русский", buttonTag: button.tag)
        })
        
        let enButton = UIAlertAction(title: "English", style: .default, handler: { (action) -> Void in
            self.translationChangeLogic(text: "English", buttonTag: button.tag)
        })
        
        let beButton = UIAlertAction(title: "Белорусский", style: .default, handler: { (action) -> Void in
            self.translationChangeLogic(text: "Белорусский", buttonTag: button.tag)
        })
 
        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alertController.addAction(rusButton)
        alertController.addAction(enButton)
        alertController.addAction(beButton)
        alertController.addAction(cancel)

        self.present(alertController, animated: true, completion: nil)
        
    }

    func translationChangeLogic(text: String , buttonTag: Int) {
        
        if buttonTag == 1 {
            
            if text == secondLanguageButton.titleLabel?.text {
                swapTextInButtons()
            } else {
                firstLanguageButton.setTitle(text, for: .normal)
            }
            
        } else if buttonTag == 2 {
            if text == firstLanguageButton.titleLabel?.text {
                swapTextInButtons()
            } else {
                secondLanguageButton.setTitle(text, for: .normal)
            }
            
        }
        
    }
    

}

