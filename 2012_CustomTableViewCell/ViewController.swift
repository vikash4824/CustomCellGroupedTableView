//
//  ViewController.swift
//  2012_CustomTableViewCell
//
//  Created by mamidisetty Vikash on 19/03/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let cellTableView:UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SimpleTableViewCell.self, forCellReuseIdentifier: SimpleTableViewCell.identifier)
//        table.register(TollyWoodCell.nib(), forCellReuseIdentifier: TollyWoodCell.identifer)
        
        return table
        
    }()
    var movies = [Movies]()
    var movieWood = [[Movies]]()
    var tWood = [Movies]()
    var bWood = [Movies]()
    var hWood = [Movies]()
    var kWood = [Movies]()
    var sWood = [Movies]()

    
    var Zone = ["TollyWood","KollyWood","HollyWood","BollyWood"]
    var TitleImage = ["TollyWood.jpg","KollyWood","HollyWood","BollyWood"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(cellTableView)
        cellTableView.rowHeight = 189
        cellTableView.dataSource = self
        cellTableView.delegate = self
        

        downlodaJson { [self] in
            for i in 0..<movies.count
            {
                if("Tollywood" == movies[i].industry){
                    tWood.append(movies[i])
                }

            }

            for i in 0..<movies.count
            {
                if("Bollywood" == movies[i].industry){
                    bWood.append(movies[i])
                }

            }
            for i in 0..<movies.count
            {
                if("Hollywood" == movies[i].industry){
                    hWood.append(movies[i])
                }

            }
            for i in 0..<movies.count
            {
                if("Kollywood" == movies[i].industry){
                    kWood.append(movies[i])
                }

            }

            movieWood = [tWood,bWood,hWood,kWood]
            self.cellTableView.reloadData()
        }
        cellTableView.register( UINib(nibName: "TollyWoodCell", bundle: nil), forCellReuseIdentifier: "TollyWoodCell")
        cellTableView.register(UINib(nibName: "BollyWoodCustomCell", bundle: nil), forCellReuseIdentifier: "BollyWoodCustomCell")
        cellTableView.register(UINib(nibName: "HollyWoodCustomCell", bundle: nil), forCellReuseIdentifier: "HollyWoodCustomCell")
        cellTableView.register(UINib(nibName: "KollyWoodTableViewCell", bundle: nil), forCellReuseIdentifier: "KollyWoodTableViewCell")
    }
    override func viewDidLayoutSubviews() {
        
        cellTableView.frame = view.bounds
    }
    func downlodaJson(completed: @escaping  () -> ()){
       let url = URL(string: "https://services.brninfotech.com/tws/MovieDetails2.php?mediaType=movies&quantity=50")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil{
                do{self.movies = try JSONDecoder().decode([Movies].self, from: data!)
                    DispatchQueue.main.async { [self] in
                    //print("\(self.movies[0].industry!)")
                       
                        completed()
                       
                    }
                }catch {
                    
                }
            }

        }.resume()


    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(Zone[section])"
        
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 189
//    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 88))
//        header.backgroundColor = .red
        let titleImageView = UIImageView(image: UIImage(named: "\(TitleImage[section])"))

        titleImageView.tintColor = .systemBlue
        titleImageView.contentMode = .scaleToFill
        
       header.addSubview(titleImageView)
        titleImageView.frame = CGRect(x: 0, y: 0, width:header.frame.size.width, height: 88)

        return header
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return Zone.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return  tWood.count
        }
        if section == 1{
            return kWood.count
        }
        if section == 2{
            return hWood.count
        }
        else {
            return bWood.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {let cell = tableView.dequeueReusableCell(withIdentifier: SimpleTableViewCell.identifier ,for: indexPath)
        
        if (indexPath.section == 0) {
            print("99999")
            print("Data Od:\(movieWood[0].count)")

            var cell:TollyWoodCell = tableView.dequeueReusableCell(withIdentifier: "TollyWoodCell",for: indexPath) as! TollyWoodCell
            print("Data Od:\(movieWood[3][1].title)")
            cell.TTitleLB.text! = movieWood[0][indexPath.row].title!
            cell.TdirectorLB.text! = "Director : \(movieWood[0][indexPath.row].director!)"
            cell.tImageView.imageDisplay(url: "https://services.brninfotech.com/tws/\(movieWood[0][indexPath.row].posters![0])")
            cell.backgroundColor = UIColor.white
//            cell.backgroundColor = UIColor(patternImage: UIImage(named: "041019031925bahubali")!)
            cell.layer.cornerRadius = 20
            cell.contentMode = .scaleAspectFit
            return cell
        }
       
       if (indexPath.section == 2){
            var cell:HollyWoodCustomCell = tableView.dequeueReusableCell(withIdentifier: "HollyWoodCustomCell", for: indexPath)as! HollyWoodCustomCell
            cell.HollyWoodLB.text! = movieWood[2][indexPath.row].title!.capitalized
            cell.HollyWoodLB1.text! = "Director : \(movieWood[2][indexPath.row].director!)"
          cell.HollyWoodLB2.text! = movieWood[2][indexPath.row].actors![0].capitalized
            cell.backgroundColor = UIColor(patternImage: UIImage(named: "7ff2dca8b628deb838445a3dc2561d9889047620")!)
            cell.layer.cornerRadius = 25
            cell.contentMode = .scaleAspectFit
            cell.HollyWoodImgView.imageDisplay(url: "https://services.brninfotech.com/tws/\(movieWood[2][indexPath.row].posters![0])")
            return cell
        }
       if (indexPath.section == 3){
          var cell:BollyWoodCustomCell = tableView.dequeueReusableCell(withIdentifier: "BollyWoodCustomCell", for: indexPath)as! BollyWoodCustomCell
          cell.BollyWoodLB.text! = movieWood[1][indexPath.row].title!.capitalized
          cell.BollyWoodLB1.text! = "Director: \(movieWood[1][indexPath.row].director!.capitalized)"
          cell.BollyWoodImgView.imageDisplay(url: "https://services.brninfotech.com/tws/\(movieWood[1][indexPath.row].posters![0])")
          cell.backgroundColor = UIColor.white
          cell.layer.cornerRadius = 20
          return cell
      }
       if (indexPath.section == 1){
        var cell:KollyWoodTableViewCell = tableView.dequeueReusableCell(withIdentifier: "KollyWoodTableViewCell", for: indexPath)as! KollyWoodTableViewCell
        cell.KtitileLB.text! = movieWood[3][indexPath.row].title!
        cell.KdirLB.text! = movieWood[3][indexPath.row].actors![0]
        print(movieWood[3][1].director)
        cell.kDirectorLB.text! = movieWood[3][indexPath.row].director!
        cell.KollywoodImgView.imageDisplay(url: "https://services.brninfotech.com/tws/\(movieWood[3][indexPath.row].posters![0])")
        cell.backgroundColor = UIColor.white

        return cell
      }
        
        
        print("Data")
        cell.textLabel?.text = "VikashRDP"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sp = storyboard?.instantiateViewController(identifier: "SecontPage") as! SecontPage
        sp.title = movies[indexPath.row].title!.capitalized
        sp.actor = movies[indexPath.row].actors![0].capitalized
        sp.director = movies[indexPath.row].director!.capitalized
        sp.poster = "https://services.brninfotech.com/tws/\(movies[indexPath.row].posters![0])"
        sp.videoUrl = "https://services.brninfotech.com/tws/\(movies[indexPath.row].trailers!)"
        sp.audioUrl = "https://services.brninfotech.com/tws/\(movies[indexPath.row].songs!)"
        navigationController?.pushViewController(sp, animated: true)

    }

}

extension UIImageView {
    func imageDisplay(url:String) {
        let posteDB = URLSession.shared.dataTask(with:URL(string: url.replacingOccurrences(of: " ", with: "%20"))!) { (data, response, error) in
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        posteDB.resume()
        
    }
}

