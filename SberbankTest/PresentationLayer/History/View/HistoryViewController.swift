//
//  StorageViewController.swift
//  SberbankTest
//
//  Created by Влад Калаев on 03/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchControllerDelegate, UISearchResultsUpdating, HistoryViewProtocol {
    
    var presenter: HistoryPresenterProtocol?
    
    var translations = [TranslateEtities]()
    var filteredTranslations = [TranslateEtities]()
    var seacrh = UISearchController()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewConfiguration()
        presenter?.takeCountObjectsInDataBase()
        configurationNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter?.takeCountObjectsInDataBase()
        tableView.reloadData()
        
    }
    
    // MARK: - NavigationBar
    
    func configurationNavigationBar() {
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        navigationController?.navigationBar.topItem?.title = "История переводов"
        
        seacrh = UISearchController(searchResultsController: nil)
        
        navigationItem.searchController = seacrh
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController?.dimsBackgroundDuringPresentation = false
        navigationItem.searchController?.delegate = self
        navigationItem.searchController?.searchResultsUpdater = self
        self.definesPresentationContext = true
        
        let trash = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(trashAllHistory))
        trash.tintColor = UIColor.black
        
        self.navigationItem.rightBarButtonItem = trash
        
    }
    
    // MARK: - Search Controller
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text ?? String())
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {

        filteredTranslations = translations.filter {
            $0.lang.lowercased().contains(searchText.lowercased()) ||
            $0.translation.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }
    
    func searchBarIsEmpty() -> Bool {
        return seacrh.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        return seacrh.isActive && !searchBarIsEmpty()
    }
    
    // MARK: - Methods protocols input view
    
    func showTranslates(translations: [TranslateEtities]) {
        self.translations = translations
        self.translations.reverse()
        tableView.reloadData()
    }
    
    func updateTableView() {
        self.translations.removeAll()
        tableView.reloadData()
    }
    
    func showAllertWithMessedge(text: String) {
        let alertErrorCoreData = UIAlertController(title: "Внимание", message: text, preferredStyle: .alert)
        alertErrorCoreData.addAction(UIAlertAction(title: "ок", style: .default))
        self.present(alertErrorCoreData, animated: true, completion: nil)
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
        
        if isFiltering() {
            return filteredTranslations.count
        }
        
        return translations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let word:TranslateEtities
        
        if isFiltering() {
            word = filteredTranslations[indexPath.row]
        } else {
            word = translations[indexPath.row]
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HistoryCell
        
        cell?.leftText.text = word.lang
        cell?.rightText.text = word.translation
        
        return cell ?? HistoryCell()
    }
    
    // MARK: - Helpers
    
    @objc func trashAllHistory() {
        
        let alertController = UIAlertController(title: "Внимание", message: "Вы уверены что хотите удалить историю переводов ?", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Нет", style: .default))
        
        alertController.addAction(UIAlertAction(title: "Да", style: .default, handler: { (action) in
            self.presenter?.deleteHistory()
        }))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
}
