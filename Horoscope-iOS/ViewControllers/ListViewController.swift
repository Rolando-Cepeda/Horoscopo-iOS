//
//  ViewController.swift
//  Horoscope-iOS
//
//  Created by Mañanas on 29/7/24.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var horoscopeList: [Horoscope] = HoroscopeProvider.getAllHoroscope()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
//Nos dice el numero de filas o celdas que tienen que mostrar
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horoscopeList.count
    }
  //Nos dice la CELDA para cada posicion
    // // Obtenemos el horoscopo correspondiente a la posición de la celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HoroscopeViewCell
        
        let horoscope = horoscopeList[indexPath.row]
        
        // Rellenamos los datos de la celda.
        /*cell.nameLabel.text = horoscope.name
        cell.logoImageView.image = horoscope.logo
        cell.datesLabel.text = horoscope.dates*/
        
        //Ahora llamaremos al RENDER para pintar.
        cell.render(horoscope: horoscope)
        
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Preguntamos cual es el identificador del segue
        if segue.identifier == "navigateToDetail" {
            // Obtenemos el viewController de destino
            let viewController = segue.destination as! DetailViewController
            // Obtenemos la celda seleccionada
            let indexPath = tableView.indexPathForSelectedRow!
            // Asignamos en detalle el horoscopo que corresponde a la celda seleccionada
            viewController.horoscope = horoscopeList[indexPath.row]
            // Deseleccionamos la celda para que no aparezca marcada
            tableView.deselectRow(at: indexPath, animated: false)
        }
    }
}

