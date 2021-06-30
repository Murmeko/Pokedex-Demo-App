//
//  PokemonCollectionViewController.swift
//  Pokedex Demo App
//
//  Created by Yiğit Erdinç on 22.06.2021.
//

import Kingfisher

class PokemonCollectionViewController: UICollectionViewController {

    @IBOutlet var pokemonCollectionView: UICollectionView!
    
    var pokemonViewModel = PokemonViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
        pokemonCollectionView.register(UINib(nibName: Constants.pokemonCellNibName, bundle: nil), forCellWithReuseIdentifier: Constants.pokemonCellIdentifier)
    }
    
    func initViewModel(){
        pokemonViewModel.reloadTableView = {
            DispatchQueue.main.async { self.collectionView.reloadData() }
        }
        pokemonViewModel.getPokemon()
    }
    
    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonViewModel.numberOfCells
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.pokemonCellIdentifier, for: indexPath) as! PokemonCollectionViewCell
        let pokemonCollectionCellViewModel = pokemonViewModel.getCellViewModel(at: indexPath)
        
        cell.pokemonTitleLabel.text = pokemonCollectionCellViewModel.pokemonName
        cell.pokemonImageView.kf.setImage(with: pokemonCollectionCellViewModel.pokemonImageURL)
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

