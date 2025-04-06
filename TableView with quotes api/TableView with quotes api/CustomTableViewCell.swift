//
//  CustomTableViewCell.swift
//  TableView with quotes api
//
//  Created by Chaitanya Soni on 06/04/25.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbL: UILabel!
    @IBOutlet weak var subtitleLbL: UILabel!
    @IBOutlet weak var button: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setData(_ data: Datum?) {
        self.titleLbL.text = data?.content
        self.subtitleLbL.text = data?.author
    }
    @IBAction func buttonTapped(_ sender: Any) {
        print(self.titleLbL.text ?? "none")
    }
}
