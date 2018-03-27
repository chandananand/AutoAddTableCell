# AutoAddTableCell

[![Screen_Shot_2018-03-27_at_1.56.29_PM.png](https://s31.postimg.org/xysj4cxvv/Screen_Shot_2018-03-27_at_1.56.29_PM.png)](https://postimg.org/image/noq454807/)

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
