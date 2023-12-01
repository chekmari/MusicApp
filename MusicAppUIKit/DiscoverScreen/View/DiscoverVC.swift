import UIKit
//  DiscoverVC.swift

protocol DiscoverViewProtocol: AnyObject {
    func g()
}

enum VideoItem: Hashable {
    
    case category(category: Category)
    case song(song: Song)

     func hash(into hasher: inout Hasher) {
        switch self {
        case .category(let category):
            hasher.combine(category)
        case .song(let song):
            hasher.combine(song)
        }
     }
}

class DiscoverVC: UIViewController {
    var presenter: DiscoverViewPresenterProtocol?
    // MARK: - Value Types
    typealias DataSource = UICollectionViewDiffableDataSource<Section, VideoItem>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, VideoItem>
    private lazy var dataSource = makeDataSource()
    
    // MARK: - UI elements
    private(set) lazy var rightBarButtonItem: UIButton = Factories.NavigationBar.Buttons.largeTitleViewRightBarButton(
        target: self,
        action: #selector(rightButtonTapped),
        event: .touchUpInside
    )
    private(set) lazy var largeTitleViewRightBarButton: UIButton = Factories.NavigationBar.Buttons.largeTitleViewRightBarButton(
        target: self,
        action: #selector(rightButtonTapped),
        event: .touchUpInside
    )
    private(set) var collectionView: UICollectionView! = nil
    
    // MARK: - Section
    enum Section: Int, CaseIterable {
        case categories, trendingRightNow
        var count: Int {
            switch self {
            case .categories: return 3
            case .trendingRightNow: return 3
            }
        }
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Functions
    func makeDataSource() -> DataSource {
        let dataSource = DataSource(
            collectionView: collectionView,
            cellProvider: { (collectionView, indexPath, data) -> UICollectionViewCell? in
                
                
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: CategoryCell.id,
                    for: indexPath)  as? CategoryCell
                
                return cell
            })
        
        return dataSource
    }
}

// MARK: - SETUP UI
extension DiscoverVC {
    private func setupUI() {
        view.backgroundColor = .black
        setupCollectionView()
        configureDataSource()
        setNavigationLargeRightButton()
        addView()
        setConstraints()
    }
    
    private func addView() {
        view.addSubview(collectionView)
    }
    
    private func setNavigationLargeRightButton() {
        guard let navbar = navigationController?.navigationBar else { return }
        guard let titleLargeView = NSClassFromString("_UINavigationBarLargeTitleView") else { return }
        navbar.subviews.forEach { subview in
            if subview.isKind(of: titleLargeView.self) {
                subview.addSubview(largeTitleViewRightBarButton)
                largeTitleViewRightBarButton.snp.makeConstraints {
                    $0.centerY.equalTo(subview.snp.centerY)
                    $0.right.equalTo(subview.snp.right).inset(16)
                }
            }
        }
    }
    
    private func setConstraints() {
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(8)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

// MARK: - Collection View
extension DiscoverVC {
    private func setupCollectionView() {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: createLayout()
        )
        collectionView.backgroundColor = .black
        collectionView.register(
            CategoryCell.self,
            forCellWithReuseIdentifier: CategoryCell.id
        )
        collectionView.register(
            TrendCell.self,
            forCellWithReuseIdentifier: TrendCell.id
        )
        collectionView.delegate = self
        self.collectionView = collectionView
    }
    
    private func creatвeLayout() -> UICollectionViewLayout {
      // 1
      // setup the item
      let itemSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(0.25),
        heightDimension: .fractionalHeight(1.0)
      )
      let item = NSCollectionLayoutItem(layoutSize: itemSize)
      item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)

      // 2
      // setup the group
      let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1/2))
      let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

      // 3
      // setup the section
      let section = NSCollectionLayoutSection(group: group)

      // 4
      // setup the layout
      let layout = UICollectionViewCompositionalLayout(section: section)

      return layout
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            guard let sectionIndex = Section(rawValue: sectionIndex) else {
                fatalError("could not create a sectionKind instance")
            }
            
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let itemSpacing: CGFloat = 5
            item.contentInsets = NSDirectionalEdgeInsets(
                top: 10,
                leading: 11,
                bottom: 0,
                trailing: 11
            )
        
        // group
            let innerGroupHeght = sectionIndex == .categories ?
            NSCollectionLayoutDimension.fractionalHeight(0.5) :
            NSCollectionLayoutDimension.fractionalHeight(0.25)
            
            let innerGroupWidth = sectionIndex == .categories ?
            NSCollectionLayoutDimension.fractionalWidth(1.0) :
            NSCollectionLayoutDimension.fractionalHeight(1.0)
            
            let innerGroupSize = NSCollectionLayoutSize(
                widthDimension: innerGroupWidth,
                heightDimension: innerGroupHeght
            )
            
            let innerGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: innerGroupSize,
                subitem: item,
                count: sectionIndex.count // 2 or 1
            )
        
        let nestedGroupSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .fractionalHeight(1.0)
        )
        let nestedGroup = NSCollectionLayoutGroup.horizontal(
          layoutSize: nestedGroupSize,
          subitems: [innerGroup]
        )
        
        // section
        let section = NSCollectionLayoutSection(group: nestedGroup)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
//        // section header
//        // we can setup sizes using: .fractional, .absoulte, .estimated
//        // Steps to add a section header to a section
//        // 1. define the size and add to the section
//        // 2. register the supplementary view
//        // 3. dequeue the supplementary view
//        let headerSize = NSCollectionLayoutSize(
//          widthDimension: .fractionalWidth(1.0),
//          heightDimension: .absolute(44)
//        )
//        let header = NSCollectionLayoutBoundarySupplementaryItem(
//          layoutSize: headerSize,
//          elementKind: UICollectionView.elementKindSectionHeader,
//          alignment: .top
//        )
//        section.boundarySupplementaryItems = [header]
            
            
        
        return section
      }
      // layout
      return layout
    }
}

// MARK: - Collection View Data Source
extension DiscoverVC {
    
    
    private func configureDataSource() {
      // 1

    

      // 2
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.categories, .trendingRightNow])
        snapshot.appendItems(Array(1...10), toSection: .categories)
        snapshot.appendItems(Array(1...20), toSection: .trendingRightNow)
    }
}



// MARK: - Collection View Delegate
extension DiscoverVC: UICollectionViewDelegate {
    
}

// MARK: Actions
extension DiscoverVC {
    private func addActions() {
        
    }
    
    @objc
    func rightButtonTapped() {
        
    }
}

// MARK: - DiscoverViewProtocol
extension DiscoverVC: DiscoverViewProtocol {
    func g() {
        
    }
}

// MARK: Scroll View Delegate
extension DiscoverVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= 3 {
            let view = rightBarButtonItem
            let rightBar = UIBarButtonItem(customView: view)
            view.transform = CGAffineTransformMakeTranslation(10, 0)
            navigationItem.rightBarButtonItem = rightBar
            navigationItem.rightBarButtonItem?.tintColor = .navBarTitle
        } else {
            navigationItem.rightBarButtonItem = nil
        }
    }
}
