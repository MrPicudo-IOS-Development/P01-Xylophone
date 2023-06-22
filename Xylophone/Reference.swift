/* Reference.swift --> Xylophone. Created by Miguel Torres on 22/06/23. */

/* Referencia rápida:
 
Este proyecto se encarga de reproducir sonidos en la aplicación de manera muy básica creando la función "playSound()" que utiliza un objeto del framework AVFoundation para poder reproducir sonidos.
 
Estamos usando el directorio "Bundle.main" que es donde se almacenan todos los recursos de la aplicación como imágenes, archivos de audio, archivos compilados del proyecto (ejecutables), cadenas localizadas (para aplicaciones que estén diseñadas para trabajar en diferentes lenguajes), etc. El directorio Bundle.main es de solo lectura, por lo que no puede modificarse una vez que la app fue construida. Cuando estamos ejecutando la aplicación, podemos acceder a todos los recursos a través de este directorio.
 
El uso de: let url = Bundle.main.url(forResource: name, withExtension: "wav") está obteniendo una URL que apunta a un archivo con nombre "name" y extensión "wav" que se encuentra en el directorio Bundle.main
 
- - - - - Código: - - - - -
 
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    @IBAction func pressButton(_ sender: UIButton) {
        // We use optional binding (if let var = optionalValue) to safely unwrap the title.
        if let title = sender.currentTitle {
            playSound(title)
            sender.alpha = 0.5
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                sender.alpha = 1.0
            }
        } else {
            print("Button doesn't have a title.")
        }
    }
    
    func playSound(_ name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "wav") else {
            print("Resource not found")
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch {
            print("Couldn't play sound: \(error.localizedDescription)")
        }
        }
    
    }
}

*/

