//
//  CharactersViewController.swift
//  DisneyX
//
//  Created by Kakyire on 05/07/2022.
//

import UIKit
import SDWebImage

class CharactersViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,NetworkManagerDelegate {
    
    var characters = [CharacterModel]()
    
    private var networkManager = NetworkManager()
    
    @IBOutlet weak var charactersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        networkManager.delegate = self
        networkManager.getAllCharacters()
        
        charactersTableView.dataSource = self
        charactersTableView.delegate = self
        
        charactersTableView.register(UINib(nibName: K.nibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - TableViewDelegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = charactersTableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! CharactersTableViewCell
        
        let character = characters[indexPath.row]
        cell.characterName.text = character.name
        cell.characterImage?.sd_setImage(with:URL(string: character.image),placeholderImage:UIImage(named: "placeholder"))
        
        return cell
    }
    
    func load(_ manager: NetworkManager,characters: [CharacterModel]) {
        self.characters = characters
        DispatchQueue.main.async {
            self.charactersTableView.reloadData()
            
        }
    }
    
}
