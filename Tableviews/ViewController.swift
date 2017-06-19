//

//  ViewController.swift

//  Superhero Table View

//

//  Created by Sai Girap on 6/19/17.

//  Copyright © 2017 Sai Girap. All rights reserved.

//



import UIKit

//bring in datasource and delegate protocols

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
    
{
    
    @IBOutlet weak var myTableView: UITableView!
    
    var superheroArray : [Superhero] = []
    
    override func viewDidLoad()
        
    {
        
        super.viewDidLoad()
        
        superheroArray.append(Superhero(Name: "Deathstroke", Alias: "Slade Wilson", Power: 64, Image: #imageLiteral(resourceName: "deathstroke")))
        
        
        
        superheroArray.append(Superhero(Name: "Green Lantern", Alias: "Hal Jordan", Power: 75, Image: #imageLiteral(resourceName: "greenlantern")))
        
        
        
        superheroArray.append(Superhero(Name: "Batman", Alias: "Bruce Wayne", Power: 82, Image: #imageLiteral(resourceName: "batman")))
        
        
        
        superheroArray.append(Superhero(Name: "Solomon Grundy", Alias: "Cyrus Gold", Power: 80, Image: #imageLiteral(resourceName: "solomongrundy")))
        
        
        superheroArray.append(Superhero(Name: "Darkseid", Alias: "Uxas", Power: 92, Image: #imageLiteral(resourceName: "darkseid")))

        
        
    
    }
    
    
    
    
    
    //required function
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        
    {
        
        return superheroArray.count
        
    }
    
    
    
    
    
    //required function
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        
    {
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = superheroArray[indexPath.row].name
        
        cell.detailTextLabel?.text = superheroArray[indexPath.row].alias
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            superheroArray.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let superhero = superheroArray[sourceIndexPath.row]
        superheroArray.remove(at: sourceIndexPath.row)
        superheroArray.insert(superhero, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem)
    {
        let addAlert = UIAlertController(title: "Add Superhero", message: nil, preferredStyle: .alert)
        addAlert.addTextField { (nameTextField) in nameTextField.placeholder = "Enter name here"
        }
        addAlert.addTextField { (aliasTextField) in aliasTextField.placeholder = "Enter alias here"
        }
        let addAction = UIAlertAction(title: "Add", style: .default) { (addAction) in self.superheroArray.append(Superhero(Name: addAlert.textFields![0].text!, Alias: (addAlert.textFields?[1].text)!))
            self.myTableView.reloadData()
        }
        addAlert.addAction(addAction)
        addAlert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        
        present(addAlert, animated: true, completion: nil)
    }
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem)
    {
        myTableView.isEditing = !myTableView.isEditing
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailController = segue.destination as! DetailViewController
        detailController.superhero = superheroArray[(myTableView.indexPathForSelectedRow?.row)!]
    }
    
}
    

    


