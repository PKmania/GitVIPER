//
//  ForkListViewController.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24.

//

import UIKit

class ForkListViewController: UIViewController, AlertsPresentable {
    
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var ViewNoDataFound: UIView!
    @IBOutlet weak var tableView: UITableView!
    var presenter : (ForkListPresenter & ForkListViewToPresenterDelegate)!
    weak var searchView : SearchView!
    weak var nothingFoundView : NothingFoundView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSettings()
        
    }
    
    private func initialSettings(){
        self.setupSearchView()
        self.addNothingFoundView()
        self.setupTableView()
        self.title = "GitHub"
        self.presenter.viewDidLoad()
        self.view.backgroundColor = .backgroundColor
        
        self.ViewNoDataFound.isHidden = false
        self.hideKeyboardWhenTappedAround()
        self.searchView.searchTextField.delegate = self
    }
    
    private func setupTableView(){
        self.tableView.setdelegateAndDatasource(for: self)
        self.tableView.register(ShowMoreTableViewCell.self)
        self.tableView.register(ForkListTableViewCell.self)
    }
    
    private func setupSearchView(){
        let width = viewSearch.frame.width
        let height  = viewSearch.frame.height
        searchView = SearchView.loadNib()
        searchView.frame =  CGRect(x: 0, y: 0, width:width , height: height)
        self.searchView.delegate = self
        viewSearch.addSubview(searchView)
    }
    
    private func addNothingFoundView(){
        let width = ViewNoDataFound.frame.width
        let height  = ViewNoDataFound.frame.height
        
        nothingFoundView = NothingFoundView.loadNib()
        nothingFoundView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        
        ViewNoDataFound.addSubview(nothingFoundView)
    }
    
}

extension ForkListViewController : UITableViewDataSource, UITableViewDelegate{

    



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getCell(of : tableView, at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return presenter.heightForRow(at: indexPath.row).toCGFloat
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didTapOnRow(of: indexPath.section, at:indexPath.row)
    }
    
    private func getCell(of tableView : UITableView , at indexPath : IndexPath)->UITableViewCell{
        var cell : UITableViewCell!
      
           
        if let forkDict = presenter.forkListDTO,let dict = forkDict.owners {
            let forkListCell = tableView.dequeResuseableCell(for: indexPath) as ForkListTableViewCell
            forkListCell.setData(owner: dict)
            cell = forkListCell
    
        }else {
            return UITableViewCell()
        }
        
            
        
        
        return cell
    }
    
    
    
    
}

extension ForkListViewController : ForkListPresenterToViewDelegate{

    func reloadData() {
        tableView.reloadData()
    }
    
    func startAnimatingLoader() {
//        startAnimating()
    }
    
    func stopAnimatingLoader() {
//        stopAnimating()
    }
    func showNoResultFoundAlert() {
        self.ViewNoDataFound.isHidden = false
    }
    func showErrorAlert(with title: String, message: String) {
        showAlert(with: title, and: message)
    }
    
}


extension ForkListViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    self.view.endEditing(true)
    return false
    }
}
extension ForkListViewController : SearchViewDelegate{
    func didTapOnSearchButton(searchString: String) {
        self.ViewNoDataFound.isHidden = true
        presenter.search(queryString: searchString)
    }
}
