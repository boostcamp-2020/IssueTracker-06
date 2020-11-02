//
//  FilterSelectTableViewController.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/11/02.
//

import UIKit

class FilterSelectTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor(
            red: RGBcolor.red,
            green: RGBcolor.green,
            blue: RGBcolor.blue,
            alpha: RGBcolor.alpha
        )
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return (section == 0) ? 5 : 4
    }
    
    // header 높이
    override func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int) -> CGFloat {
        return (section == 0) ? Metric.firstHeaderHeight : Metric.secondHeaderHeight
    }
    
    override func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        label.font = UIFont.systemFont(ofSize: Metric.headerLabelFontSize, weight: .light)
        label.text = self.tableView(tableView, titleForHeaderInSection: section)
        label.sizeToFit()
        
        let headerView = UIView()
        headerView.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15),
            label.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -5)
        ])
        
        return headerView
    }
    
    // cell tap
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        if indexPath.section == 0 {
            createCheckButton(cell: cell)
        }
    }
    
    // cell 높이
    override func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Metric.cellHeight
    }
    
    func createCheckButton(cell: UITableViewCell) {
        let button = UIButton(type: .custom)
        if let image = UIImage(systemName: "checkmark") {
            button.setImage(image, for: .normal)
        }
        button.isEnabled = false
        button.titleLabel?.font = .boldSystemFont(ofSize: Metric.checkButtonFontSize)
        
        cell.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -15),
            button.centerYAnchor.constraint(equalTo: cell.centerYAnchor)
        ])
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FilterSelectTableViewController {
    
    enum Metric {
        static let cellHeight: CGFloat = 45
        static let firstHeaderHeight: CGFloat = 55
        static let secondHeaderHeight: CGFloat = 45
        static let headerLabelFontSize: CGFloat = 12
        static let checkButtonFontSize: CGFloat = 17
    }
    
    enum RGBcolor {
        static let red: CGFloat = 0.933241
        static let green: CGFloat = 0.933398
        static let blue: CGFloat = 0.937526
        static let alpha: CGFloat = 1
    }
}
