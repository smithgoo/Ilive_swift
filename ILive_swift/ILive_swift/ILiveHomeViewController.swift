//
//  ILiveHomeViewController.swift
//  ILive_swift
//
//  Created by 王朋 on 2021/3/20.
//

import UIKit
import SnapKit

class ILiveHomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell.init()
    }
    
    var tableView:UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    private func setupUI() {
        self.tableView = UITableView.init()
        self.view.addSubview(self.tableView!)
        self.tableView?.snp.makeConstraints({ make in
            make.edges.equalTo(self.view)
        })
    }
    
}

 
