//
//  ViewController.swift
//  TableView with quotes api
//
//  Created by Chaitanya Soni on 06/04/25.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = false
        
        
        let searchBar = UISearchBar()
//        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.frame.size.height = 50
        searchBar.autoresizingMask = [.flexibleWidth]
        searchBar.contentMode = .redraw
        tableView.tableHeaderView = searchBar
        tableView.largeContentTitle = "Quotes"
        
        return tableView
    }()
    
    private var data: QuotesResponse? = nil {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        getData()
    }
    
    private func setupUI() {
        tableView.register(UINib(nibName: "CustomTableViewCell2", bundle: .main), forCellReuseIdentifier: "CustomTableViewCell2")
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: .main), forCellReuseIdentifier: "CustomTableViewCell")
        
        
        self.view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func getData() {
        var urlComponents: URLComponents? = .init(string: "https://api.freeapi.app/api/v1/public/quotes")
        urlComponents?.queryItems = [.init(name: "page", value: "1"),
                                     .init(name: "limit", value: "10"),
                                     .init(name: "query", value: "human")]
        
        guard let url = urlComponents?.url else { return }
        var request: URLRequest = .init(url: url,
                                        cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["accept": "application/json"]
        
        URLSession.shared.dataTask(with: request,
                                   completionHandler: { [weak self] (data, response, error) -> Void in
            
            if let error {
                
                // show alert
                return
            }
            
            guard let response = response as? HTTPURLResponse
            else {
                // show alert
                return
            }
            
            if response.statusCode == 200,
               let data,
               data.count > 0 {
                
                do {
                    let response: QuotesResponse = try JSONDecoder().decode(QuotesResponse.self, from: data)
                    self?.data = response
                } catch let err {
                    // show alert
                    print(err)
                }
                
            } else {
                // show alert
            }
            
            
        }).resume()
    }
    
    
    @objc func tableViewCellButtonTapped() {
        print(#function)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        
        label.text = "\(section) header"
        label.backgroundColor = .gray
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return label
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel()
        
        label.text = "\(section) footer"
        label.backgroundColor = .gray
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return label
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data?.data?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = self.data?.data?.data?[indexPath.row]
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
            cell.selectionStyle = .none
            cell.setData(data)
            cell.button.addTarget(self, action: #selector(self.tableViewCellButtonTapped), for: .touchUpInside)
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell2") as! CustomTableViewCell2
            cell.selectionStyle = .none
            cell.setData(data)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = self.data?.data?.data?[indexPath.row]
        print(data)
        let vc = ViewController2.instantiate(text: "\(data?.content ?? "no quote") : \(data?.author ?? "no author")")
        self.showDetailViewController(vc, sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
