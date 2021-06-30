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
    var selectedPokemonId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pokemon"
        initViewModel()
        initCollectionViewCell()
    }
    
    func initViewModel(){
        pokemonViewModel.reloadTableView = {
            DispatchQueue.main.async { self.collectionView.reloadData() }
        }
        pokemonViewModel.getPokemon()
    }
    
    func initCollectionViewCell() {
        pokemonCollectionView.register(UINib(nibName: Constants.pokemonCellNibName, bundle: nil), forCellWithReuseIdentifier: Constants.pokemonCellIdentifier)
        if let layout = pokemonCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
                layout.minimumLineSpacing = 10
                layout.minimumInteritemSpacing = 10
                layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
                let size = CGSize(width:(collectionView!.bounds.width-30)/2, height: 200)
                layout.itemSize = size
        }
        pokemonCollectionView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! PokemonDetailsTableViewController
        destinationViewController.pokemonId = self.selectedPokemonId
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

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedPokemonId = (indexPath.row)+1
        performSegue(withIdentifier: Constants.allPokemonToPokemonDetailsSegue, sender: self)
    }

}

