# AutoAddTableCell

[![Screen-Shot-2018-03-27-at-1-56-29-PM.png](https://i.postimg.cc/Qd7NR6Wj/Screen-Shot-2018-03-27-at-1-56-29-PM.png)](https://postimg.cc/dhqKCjBf)

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
