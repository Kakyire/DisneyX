//
//  NetworkManager.swift
//  DisneyX
//
//  Created by Kakyire on 05/07/2022.
//

import Foundation


protocol NetworkManagerDelegate {
    func load(_ manager:NetworkManager,characters:[CharacterModel])
}
struct NetworkManager{
    

    var delegate : NetworkManagerDelegate?
    
    func getAllCharacters()  {
        performNetworkRequest(with: K.getAllCharacters)
    }
    
    
    func getCharacter(with id:String)  {
        let endpoint = K.getOneCharacter + id
        performNetworkRequest(with: endpoint)
    }
    
    
    private  func performNetworkRequest(with endPoint:String)  {
        
        if  let url = URL(string: endPoint){
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print("Error message: \(String(describing: error))")
                    return
                }
                
                if let data = data{
                    parseJson(data)
                }
                
            }
            task.resume()
        }
        
        
    }
    
    
    private func parseJson(_ data:Data) {
        do{
            let decodedData = try JSONDecoder().decode(CharactersResponse.self, from: data)
            
            var charactersDTO = [CharacterModel]()
            
            for characterDto in decodedData.data {
                let id = characterDto.id
                let name = characterDto.name
                let image = characterDto.imageURL
                let popularFilms = characterDto.films.joined(separator: ",")
                
                let dto = CharacterModel(id:id,name: name,image: image,popularFilms: popularFilms)
                
                charactersDTO.append(dto)
            }
            
//            print("Characters : \(charactersDTO)")
            delegate?.load(self,characters: charactersDTO)
            
        }catch{
         print("Error parsing json : \(error)")
        }
        
        
        
    }
}
