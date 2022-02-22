//
//  ViewController.swift
//  VDImageText
//
//  Created by Vinay Devdikar on 19/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    let dataSource: [ViewModel] = [
        .init(title: "Why do we use it?",
              description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution.",
              image: UIImage(named: "dummyimage"),
              imageURL: nil,
              footerNote: "2 Mins"),
        .init(title: "Where can I get some?",
              description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
              image: UIImage(named: "dummyimage"),
              imageURL: nil,
              footerNote: "4 Mins"),
        .init(title: "1914 translation by H. Rackham",
              description: "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. ",
              image: UIImage(named: "dummyimage"),
              imageURL: nil,
              footerNote: "8 Mins"),
        .init(title: "Whats new in swift 5.5",
              description: "Swift 5.5 comes with some set of changes. In this article i am going to explain you some of important changes with sample code.",
              image: UIImage(named: "dummyimage"),
              imageURL: nil,
              footerNote: "2 Mins")
    
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    private func registerTableView() {
        tableView.register(VDImageTextViewCell.self, forCellReuseIdentifier: "kImageTextViewCell")
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "kImageTextViewCell", for: indexPath) as? VDImageTextViewCell else {
            return UITableViewCell()
        }
        cell.updateTextView(viewModel: dataSource[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

