//
//  PokemonDetailsTableViewController.swift
//  Pokedex Demo App
//
//  Created by Yiğit Erdinç on 22.06.2021.
//

import Kingfisher

class PokemonDetailsTableViewController: UITableViewController {
    
    @IBOutlet var pokemonDetailsTableView: UITableView!
    
    var pokemonId: Int?
    var pokemonDetailsViewModel = PokemonDetailsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pokemon Details"
        initViewModel()
        pokemonDetailsTableView.register(UINib(nibName: Constants.pokemonDetailsCellNibName, bundle: nil), forCellReuseIdentifier: Constants.pokemonDetailsCellIdentifier)
        pokemonDetailsTableView.dataSource = self
    }
    
    func initViewModel(){
        pokemonDetailsViewModel.reloadTableView = {
            DispatchQueue.main.async { self.tableView.reloadData() }
        }
        pokemonDetailsViewModel.getPokemonDetails(pokemonId!)
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.pokemonDetailsCellIdentifier, for: indexPath) as! PokemonDetailsTableViewCell
        let pokemonDetailsTableViewModel = pokemonDetailsViewModel.getCellViewModel()

        cell.pokemonDetailCellTitleLabel.text = pokemonDetailsTableViewModel.pokemonName
        cell.pokemonDetailCellHeightLabel.text = pokemonDetailsTableViewModel.pokemonHeight
        cell.pokemonDetailCellWeightLabel.text = pokemonDetailsTableViewModel.pokemonWeight
        cell.pokemonDetailCellImageView.kf.setImage(with: pokemonDetailsTableViewModel.pokemonImageURL)

        return cell
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
