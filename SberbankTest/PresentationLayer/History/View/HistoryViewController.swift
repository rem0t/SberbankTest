//
//  StorageViewController.swift
//  SberbankTest
//
//  Created by Влад Калаев on 03/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, HistoryViewProtocol {


    var presenter: HistoryPresenterProtocol?
    var translations = [TranslateEtities]()
    
    @IBOutlet weak var searchField: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewConfiguration()
        presenter?.takeCountObjectsInDataBase()
    }
 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter?.takeCountObjectsInDataBase()
        tableView.reloadData()

    }

    
    func showTranslates(translations: [TranslateEtities]) {
        self.translations = translations
        tableView.reloadData()
    }
    
    // MARK: - Table View

    func tableViewConfiguration() {
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }
    
    // MARK: - Delegate methods Table View
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return translations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let word = translations[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryCell
        
        cell.leftText.text = word.lang
        cell.rightText.text = word.translation
        
        return cell
    }
    

}
