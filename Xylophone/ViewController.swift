// Biblioteca normal del proyecto.
import UIKit
// Biblioteca necesaria para el manejo de Audio y Video.
import AVFoundation

class ViewController: UIViewController {
    
    // Variable de tipo Object para acceder a los métodos de la biblioteca de audio y video.
    var player: AVAudioPlayer!
    
    // Función de carga de la aplicación, no la utilizamos aquí...
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Aquí el botón presionado se identifica como "sender", y con ese nombre podemos acceder a los atributos del botón, como el título del botón, su opacidad (valor de alpha), etc.
    @IBAction func pressButton(_ sender: UIButton) { // Al hacer la conexión del botón con el viewcontroller, debemos indicar el tipo como "UIButton"
        // Imprimimos el título del botón "desenvolviendo" el valor que encuentre (para eso el signo !)
        print(sender.currentTitle!) // Esto solo es para visualizar que así obtenemos tal cual el atributo "title" del botón que presionamos, para imprimirlo o usarlo como queramos.
        /* Aquí la idea es que el botón que va a activar el archivo de audio, se llame igual que dicho archivo para que podamos mandarlo como parámetro de la función "playSound" e identifique correctamente qué archivo de audio se debe reproducir
           Mandamos a llamar a la función con el parámetro de nombre igual al nombre del botón (title) */
        playSound(name: sender.currentTitle!)
        sender.alpha = 0.5 // Hacemos "transparente" al 50% el botón accediendo a su atributo "alpha" y modificándolo.
        // El siguiente método hace que el programa espere medio segundo para realizar lo que tenga en su bloque de código.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            sender.alpha = 1.0 // Eliminamos la transparencia del botón para que regrese a su color original
        }
    }
    
    // Función para reproducir un archivo de audio al presionar un botón que se llame "igual" que el archivo de audio.
    func playSound(name: String) {
        // Indicamos la dirección en donde debe buscar el archivo de audio, los cuales se deben de encontrar en una carpeta llamada Sounds que está a raíz del proyecto.
        let url = Bundle.main.url(forResource: name, withExtension: "wav") // Usar la extensión correspondiente, aunque se recomienda .wav
        // Le pedimos que cargue el archivo de audio que se encuentra en la constante url.
        player = try! AVAudioPlayer(contentsOf: url!)
        // Reproducimos el archivo de audio que se encontró en la dirección de la url.
        player.play()
    }
        
}
