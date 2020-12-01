//
//  ViewController.swift
//  JSONDecoding
//
//  Created by Jamario Davis on 11/30/20.
//

import UIKit

class ViewController: UIViewController {
    
   override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    fileprivate func getData() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                let users = try JSONDecoder().decode([Users].self, from: data!)
                for user in users {
                    print("ID: \(user.id), Title: \(user.title), Body: \(user.body)")
                }
            } catch {
                print("failed to convert \(error.localizedDescription)")
            }
        }.resume()
    }
    struct Users: Decodable {
        let userId: Int
        let id: Int
        let title: String
        let body: String
    }
}

