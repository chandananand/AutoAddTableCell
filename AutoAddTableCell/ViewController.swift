//
//  ViewController.swift
//  AutoAddTableCell
//
//  Created by Chandan Anand on 3/27/18.
//  Copyright © 2018 Chandan Anand. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var timeArray: [TimeInterval] = []
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        //cell.label.text = "\(indexPath.row)"
        cell.label.text = String(timeArray[indexPath.row])
        cell.label?.textAlignment = .center
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 50
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Delete Hit")
            //tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBAction func startClicked(_ sender: Any) {
        if timer.isValid {
            return
        } else {
            startTimer()
        }
    }
    
    @IBAction func stopClicked(_ sender: Any) {
        stopTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(updateTableView), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer.invalidate()
    }
    
    @objc func updateTableView() {
        
        let lastTimerValue = timeArray.last ?? 0
        
        timeArray.append(lastTimerValue + timer.timeInterval)
        tableView.reloadData()
        scrollToBottom()
    }
    
    func scrollToBottom() {
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.timeArray.count - 1, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

