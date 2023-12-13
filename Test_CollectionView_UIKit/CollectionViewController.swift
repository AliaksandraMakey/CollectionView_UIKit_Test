//
//  ViewController.swift
//  Test_CollectionView_UIKit
//
//  Created by Александра Макей on 13.12.2023.
//

import UIKit

class CollectionViewController: UIViewController {
    //MARK: - Properties
    var collectionView: UICollectionView!
    var users: [User] = []
    lazy var userService: NetworkServiceProtocol = NetworkService()
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        fetchDataFromService()
    }
    //MARK: - Setup Collection
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.width, height: 200)
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = .gray
        view.addSubview(collectionView)
    }
    //MARK: - Actions
    private  func fetchDataFromService() {
        userService.fetchUsers { [weak self] (users, error) in
            guard let self = self else { return }
            if let error = error {
                print("Error fetching users: \(error)")
                return
            }
            
            if let users = users {
                self.users = users
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
}
//MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionCell else {
              return UICollectionViewCell()
          }
        let user = users[indexPath.item]
        cell.backgroundColor = .red
        cell.configure(with: user)
        
        return cell
    }
}

// MARK: - SwiftUI
import SwiftUI
struct FlowProvider: PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    struct ContainterView: UIViewControllerRepresentable {
        let view = CollectionViewController( )
        func makeUIViewController(context:
                                  UIViewControllerRepresentableContext<FlowProvider.ContainterView>) -> CollectionViewController
        {
            return view
        }
        func updateUIViewController(_ uiViewController:
                                    FlowProvider.ContainterView.UIViewControllerType,context:
                                    UIViewControllerRepresentableContext<FlowProvider.ContainterView>){
        }
    }
}
