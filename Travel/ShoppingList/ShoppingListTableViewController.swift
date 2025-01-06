//
//  ShoppingListTableViewController.swift
//  Travel
//
//  Created by 박준우 on 1/3/25.
//

import UIKit

class ShoppingListTableViewController: UITableViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerTextField: UITextField!
    @IBOutlet weak var headerButton: UIButton!
    
    var list = ShoppingList().list
    
    override func awakeFromNib() {
        tabBarItem = .init(title: "쇼핑", image: .init(systemName: "cart"), tag: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "쇼핑"
        setHeaderView()
        tableView.keyboardDismissMode = .onDrag
    }

    @IBAction func addShoppingList(_ sender: UIButton) {
        if !headerTextField.text!.isEmpty {
            list.append(.init(title: headerTextField.text!))
            headerTextField.text = nil
            tableView.reloadData()
        }
        view.endEditing(true)
    }
    @IBAction func dismissKeyboardWithTextField(_ sender: UITextField) {
    }
    func setHeaderView() {
        headerView.backgroundColor = .systemGray6
        headerView.layer.cornerRadius = 10
        
        headerTextField.placeholder = "무엇을 구매하실 건가요?"
        headerTextField.textColor = .black
        headerTextField.borderStyle = .none
        headerTextField.tintColor = .black
        
        headerButton.layer.cornerRadius = 10
        headerButton.backgroundColor = .systemGray5
        headerButton.setTitle("추가", for: .normal)
        headerButton.setTitleColor(.black, for: .normal)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingListTableViewCell", for: indexPath) as! ShoppingListTableViewCell

        cell.shoppingView.backgroundColor = .systemGray6
        cell.shoppingView.layer.cornerRadius = 10
        
        for order in 0..<cell.shoppingButtonCollection.count {
            cell.shoppingButtonCollection[order].tintColor = .black
            cell.shoppingButtonCollection[order].setImage(setButtonImage(buttonIndex: order, data: list[indexPath.row]), for: .normal)
            cell.shoppingButtonCollection[order].tag = order == 0 ? indexPath.row * 2 : indexPath.row * 2 + 1
            cell.shoppingButtonCollection[order].addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        }
        cell.shoppingLabel.text = list[indexPath.row].title
        cell.shoppingLabel.numberOfLines = 0
        cell.shoppingLabel.font = .systemFont(ofSize: 14)
        
        return cell
    }
    
    func setButtonImage(buttonIndex: Int, data: Shopping) -> UIImage {
        var buttonImage = buttonIndex == 0 ? "checkmark.square" : "star"
        let buttonState = buttonIndex == 0 ? data.isCheck: data.isStar
        if buttonState {
            buttonImage += ".fill"
        }
        return UIImage(systemName: buttonImage) ??  UIImage(systemName: "photo")!
    }
    
    @objc func tapButton(_ sender: UIButton) {
        // Section을 무슨 버튼인지 구분하는 인자로 사용
        var indexPath = IndexPath(row: sender.tag, section: sender.tag)

        if indexPath.section % 2 == 0 {
            indexPath.row /= 2
            list[indexPath.row].isCheck = !list[indexPath.row].isCheck
        } else {
            indexPath.row -= 1
            indexPath.row /= 2
            list[indexPath.row].isStar = !list[indexPath.row].isStar
        }
        indexPath.section = 0
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "삭제") { _, _, _ in
            self.list.remove(at: indexPath.row)
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true)
    }

    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let check = UIContextualAction(style: .normal, title: list[indexPath.row].isCheck ? "체크해제" : "체크") { _, _, _ in
            self.list[indexPath.row].isCheck.toggle()
            tableView.reloadData()
        }
        check.backgroundColor = list[indexPath.row].isCheck ? .orange : .systemTeal
        
        return UISwipeActionsConfiguration(actions: [check])
    }
    
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
