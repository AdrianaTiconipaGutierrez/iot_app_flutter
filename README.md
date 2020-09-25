# Let's build an IoT app with Flutter, Firebase & Arduino


![APP OIOT 1](https://user-images.githubusercontent.com/39227411/94284190-07049a80-ff20-11ea-9e23-56918348be91.png)
 
 
 ## APP IOT:
 
Vamos a realizar lo siguiente: 

![app iot](https://user-images.githubusercontent.com/39227411/94282876-59dd5280-ff1e-11ea-82e8-bbe4cd69a3e6.PNG)

## Los pasos a seguir 

Para poder realizar este sistema se seguiran los siguientes pasos:

![APP OIOT 2](https://user-images.githubusercontent.com/39227411/94284199-08ce5e00-ff20-11ea-994b-5f62b66ed384.png)
 
# RECOLECTAR DATOS
![nodo](https://user-images.githubusercontent.com/39227411/94294499-eb07f580-ff2d-11ea-9109-bbca0149468f.PNG)

## Materiales

- Placa esp8266 o esp 32
- Sensor de humedad FC-28
- Sensor de temperatura
- Sensor de CO

## Recolección de datos del medio

El sensor mide los cambios fisicos del medio ambiente

Para eso mediremos la humedad del suelo con el YL-69,sensor que mide la humedad del suelo por la variación de su conductividad.

- YL-69 permite obtener la medición como valor analógico o como una salida digital.
- Valores obtenidos van desde 0 sumergido en agua, a 1023 en el aire (o en un suelo muy seco). Un suelo ligeramente húmero daría valores típicos de 600-700. Un suelo seco tendrá valores de 800-1023.

## Esquema de conexión

A continuacion se detalla el esquema de conexiones

![ESQUEMA ADRIANA](https://user-images.githubusercontent.com/39227411/94286695-5a2c1c80-ff23-11ea-8307-24cc3ad62727.png)

### Como usamos el como placa el modulo esp8266 se debe considerar lo siguiente: 

![NodeMCU-–-Board-de-desarrollo-con-módulo-ESP8266-WiFi-y-Lua-4](https://user-images.githubusercontent.com/39227411/94286704-5bf5e000-ff23-11ea-8493-580febe486a4.png)

### Y en el Ide arduino se debe realizar las configuraciones de: 
-Placa 

![arduino 1](https://user-images.githubusercontent.com/39227411/94287093-e2aabd00-ff23-11ea-8af8-152246f7923d.PNG)


![arduino placas](https://user-images.githubusercontent.com/39227411/94287098-e3dbea00-ff23-11ea-8c00-89fda65d8ac3.PNG)


### Codigo en Arduino Leer Datos sensores

```
#include <ESP8266WiFi.h>

float humedad;
float temperatura;
float gas;
String mensaje;
uint32_t displayTimer = 0;

const int sensorPin = A0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);

}

void loop() {
  // put your main code here, to run repeatedly:
  if (millis() - displayTimer >= 5000) {
    temperatura = random(0, 100);
    gas = random(0, 100);
    humedad = analogRead(A0);

  }
}
```

# SUBIR INFROMACION A FIREBASE (REAL TIME DATA BASE )

PROBLEMA comunicación entre el microcontrolador y la aplicación de software

## Firebase 

Es un conjunto de herramientas para "crear, mejorar y hacer crecer su aplicación", dichas herramientas, reemplazan gran parte de los servicios que los desarrolladores normalmente tendrían que construir ellos mismos

•	Autenticación

•	Cloud Messaging

•	Cloud Firestore

• Firebase real time database

•	Cloud Storage

•	Cloud Functions for Firebase

•	Hosting

![firebase-portada](https://user-images.githubusercontent.com/39227411/94289519-d116e480-ff26-11ea-803b-52272ee9c5e0.jpg)

[`Firebase more info`](https://firebase.google.com/docs?hl=es-419)

###  Firebase Realtime Database 

Base de datos alojada en la nube con datos almacenados como JSON. Proporciona una base de datos back-end con acceso seguro para crear aplicaciones de colaboración enriquecidas directamente desde el lado del cliente. Los datos se conservan localmente en el dispositivo mientras los eventos fuera de línea y en tiempo real continúan activándose. Cuando el dispositivo recupera la conexión a Internet, la base de datos backend en tiempo real se sincroniza automáticamente con los cambios de datos locales que ocurrieron mientras el cliente estaba fuera de línea mientras se fusiona automáticamente cualquier conflicto.

[`Firebase Real Time Data Base`](https://firebase.google.com/docs/database?hl=es)


## Requerimientos Para la placa 

- Libreria Esp8266 [`Libreria Firebase-ESP8266`](https://github.com/mobizt/Firebase-ESP8266)

Agregamos la libreria en el ide

![firebase 2 libreria](https://user-images.githubusercontent.com/39227411/94290126-cad53800-ff27-11ea-9559-ddf240ee75e6.PNG)

## Codigo para la placa

### Incluimos la libreria
 ```
 //FirebaseESP8266.h must be included before ESP8266WiFi.h
#include "FirebaseESP8266.h"

 ```
### Configurar y declara las siguientes variables para ejecutar el ejemplo
```
#define FIREBASE_HOST "example.firebaseio.com"
#define FIREBASE_AUTH "token_or_secret"
#define WIFI_SSID "SSID"
#define WIFI_PASSWORD "PASSWORD"
```
### Para eso nos dirigimos a la consola de firebase 

[`Consola de FIREBASE`](https://console.firebase.google.com/)
#### 1. Crear un proyecto de Firebase


###### Creación de un Proyecto de Firebase

  - Consola de Firebase
  
  - Dasboard de Firebase
  
  - Agregar Proyecto
  
  ![AGREGAR PROYECTO](https://user-images.githubusercontent.com/39227411/87821025-2060da80-c83d-11ea-836b-4ed5d090139f.PNG)
  
![21](https://user-images.githubusercontent.com/39227411/87821729-56528e80-c83e-11ea-8d92-5cd3cf20fcb5.PNG)

![23](https://user-images.githubusercontent.com/39227411/87821734-581c5200-c83e-11ea-848f-5f46edd6efdc.PNG)

  - HABILITAMOS HERRAMIENTAS: DATABASE Y STORAGE EN LA CONSOLA
  

![24](https://user-images.githubusercontent.com/39227411/87821775-666a6e00-c83e-11ea-8f98-e14acfcc7a96.PNG)

![25](https://user-images.githubusercontent.com/39227411/87821783-679b9b00-c83e-11ea-9b65-ebc25d8aa256.PNG)

![26](https://user-images.githubusercontent.com/39227411/87821787-68ccc800-c83e-11ea-8363-3c9a810651f8.PNG)




- En Firebase console, haz clic en Agregar proyecto y selecciona o ingresa el Nombre del proyecto, y continuar.
![rtdb1](https://user-images.githubusercontent.com/39227411/94303164-64f2ab80-ff3b-11ea-8da8-cf57cc4c3dd3.PNG)

[Firebase Consola](https://console.firebase.google.com/?pli=1)

- Configura Google Analytics para tu proyecto (opcional).



### 2. Habilitar Firebase Realtime Database base de datos 

- Pasos a seguir en la CONSOLA DE FIREBASE
- Activar Firebase Realtime Database

![rtdb2](https://user-images.githubusercontent.com/39227411/94303170-6623d880-ff3b-11ea-9c1c-dece0924f81f.PNG)

- Modo Prueba
![rtdb 3](https://user-images.githubusercontent.com/39227411/94303162-6328e800-ff3b-11ea-939e-357b10b78dac.PNG)



![firebase 2 secreto BD](https://user-images.githubusercontent.com/39227411/94290713-93b35680-ff28-11ea-8a55-8fd480303290.PNG)

CLAVE

![firebase1](https://user-images.githubusercontent.com/39227411/94290716-94e48380-ff28-11ea-8aec-7072cdb17533.PNG)

### Define FirebaseESP8266 data object
```
FirebaseData firebaseData;
void printJsonObjectContent(FirebaseData &data);
FirebaseJson json;
```
### Definimos las variables a usar

```
//RUTA 
String path1 = "/ADRIANA";
String path = "/";

// Variables para almacenar los datos eidos por los sensores
float humedad;
float temperatura;
float gas;

// Pin Sensor de Humedad
const int sensorPin = A0;

// Controlar el tiempo de leer datos
String mensaje;
uint32_t displayTimer = 0;

// Actuadores Pines
int agua = 5; //d1
int calor = 4; //d2
```

### En SETUP colocaremos el código de configuración que se ejecutara una vez:
```
  Serial.begin(115200);

  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED)
  {
    Serial.print(".");
    delay(300);
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();
  
//Iniciamos la conexión con firebase
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  Firebase.reconnectWiFi(true);
  
```
###  Continuacion trabajamos en Void LOOP

Donde  almacenaremos los datos recolectados por los sensores a firebase

Se tiene las siguinetes operaciones co Real tiem data base

- SET Escribe o reemplaza datos en una ruta de acceso definida

- UPDATE Actualiza algunas de las claves de una ruta de acceso definida sin reemplazar todos los datos

- PUSH Agrega a una lista de datos en la base de datos,genera una clave única

```
  if (millis() - displayTimer >= 5000) {
    temperatura = random(0, 100);
    gas = random(0, 100);
    humedad = analogRead(A0);
// Creamos un json 
    json.clear().addDouble("nivelDioxidoCarbono", gas).addDouble("humedad", humedad).addDouble("temperatura", temperatura);
// Subimos los datos a firebase 
    Firebase.setJSON(firebaseData, path1 + "/Nodos/Nodo4", json);
    Firebase.setJSON(firebaseData, path + "Nodos/Nodo1", json);
  }
  ```


### Por ultimo se debe capturar los datos que vienen de firebase real time database 
```
if (Firebase.getInt(firebaseData, "/agua/button")) {

    if (firebaseData.dataType() == "int") {
      Serial.println(firebaseData.intData());
      digitalWrite(agua, firebaseData.intData());
    }

  } else {
    Serial.println(firebaseData.errorReason());
  }

  if (Firebase.getInt(firebaseData, "/calor/button")) {

    if (firebaseData.dataType() == "int") {
      Serial.println(firebaseData.intData());
      digitalWrite(calor, firebaseData.intData());
    }

  } else {
    Serial.println(firebaseData.errorReason());
  }

```
# CONEXION CON FIREBASE Y FLUTTER

## FLUTTER
DESARROLLO MOVIL 
Flutter orientado para  desarrollo de aplicaciones moviles androids and ios de forma nativa ,mucho mas rapidas y eficaces ya que todo el codigo de interfaz movil lo transfiere al lenguaje c capa mas baja en android y swift.

## Requerimientos

- Editor de código: Android Studio o VS Code
1. Instalar SDK Flutter
SDK de para flutter
- Windows 7
- Disco Duro 400 MB  10 GB
- Git
[git](https://git-scm.com/download/win)
- Instalar el dsk de Flutter
[Flutter](https://flutter.dev/docs/get-started/install/windows)
2. Instalar Android Studio

[Android Studio](https://developer.android.com/studio)
3. Emulador de Android Instalar
O  los siguientes dispositivos:
- Un dispositivo físico (es decir, un teléfono móvil): Android o iOS
- El simulador de iOS (requiere la instalación de herramientas Xcode)
- El emulador de Android (requiere instalación y configuración en Android Studio)

4. Verificar
Click a: flutter_console
```
flutter --version
flutter doctor
```

- FlutterFire

Flutter tiene soporte oficial para Firebase con el conjunto de bibliotecas FlutterFire

A new Flutter application.
![3](https://user-images.githubusercontent.com/39227411/94302520-548e0100-ff3a-11ea-84ba-9b8423fad795.png)

## Agrega Firebase a tu app de Flutter

[More info...](https://firebase.google.com/docs/flutter/setup?hl=es)
### Crea un proyecto de Firebase
Para poder agregar Firebase a tu app de Flutter, debes crear un proyecto de Firebase y conectarlo a la app. 
1.	Go to console
2.	Add Project
3.	Create Project
4. Activar Firebase Real Time Database
### 	Add firebase to our app
Android and ios
##### ANDROID FOLDER ==>  APP ==> build.gradle

A nivel de proyecto el fichero más importante es pubspec.yaml. En el definiremos las dependencias con librerías de terceros o plugins para acceder al hardware del dispositivo móvil. También será el lugar para definir los assets de nuestro proyecto

![Estructura](https://user-images.githubusercontent.com/39227411/94305409-1e06b500-ff3f-11ea-8fa9-25c12e34f3b4.PNG)

defaultCConfig{
applicationId ”xxxxxxxxxxxxxxx”}
6.	Add firebase a app android
Android package name: xxxxxxxxxxxxxxx} 	
7.Register app
8. Dowload config, decargar archive “google-services.json” y copio a androidapp
## ESTRUCTURA PROYECTO EN FLUTTER
[WIDGETS](https://flutter.dev/docs/development/ui/widgets)

### main.dart 

Que será el encargado de iniciar nuestra aplicación
```
import 'package:flutter/material.dart';
import 'nodo_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NodoPage(),
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        primarySwatch: Colors.cyan,
      ),
    );
  }
}

```

### nodo_page.dart
```
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'nodo.dart';

import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:wave_progress_widget/wave_progress_widget.dart';

class NodoPage extends StatefulWidget {
  @override
  _NodoPageState createState() => _NodoPageState();
}

class _NodoPageState extends State<NodoPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int tabIndex = 0;
  bool _boton = false;
  int _riego = 0;
  int _calor = 0;
  DatabaseReference _bdRef = FirebaseDatabase.instance.reference();
  DatabaseReference _nodoRef =
      FirebaseDatabase.instance.reference().child('Nodos');
  DatabaseReference _alarmaRef =
      FirebaseDatabase.instance.reference().child('alarmas');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'IOT APP',
          ),
        ),
        bottom: TabBar(
          labelColor: Colors.tealAccent,
          controller: _tabController,
          onTap: (int index) {
            setState(() {
              tabIndex = index;
            });
          },
          tabs: [
            Tab(
              icon: Icon(Icons.opacity),
            ),
            Tab(
              icon: Icon(Icons.wb_sunny),
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: _nodoRef.onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              !snapshot.hasError &&
              snapshot.data.snapshot.value != null) {
            print('snapshot data: ${snapshot.data.snapshot.value.toString()}');
            var _nodo = Nodo.fromJson(snapshot.data.snapshot.value['Nodo1']);
            print(
                "Nodo Object: ${_nodo.temperatura}/${_nodo.humedad}/${_nodo.nivelDioxidoCarbono}");
            return IndexedStack(
              index: tabIndex,
              children: [
                _humedadLayout(_nodo),
                _temperaturaLayout(_nodo),
              ],
            );
          } else {
            return Center(
              child: Text('No hay datos aun'),
            );
          }
        },
      ),
    );
  }

  Widget _temperaturaLayout(Nodo _nodo) {
    return Center(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40),
            child: Text(
              'TEMPERATURA',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.deepPurple,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: FAProgressBar(
                progressColor: Colors.pinkAccent.shade100,
                backgroundColor: Colors.grey,
                direction: Axis.vertical,
                verticalDirection: VerticalDirection.up,
                size: 100,
                currentValue: _nodo.temperatura.round(),
                changeColorValue: 70,
                changeProgressColor: Colors.pink,
                maxValue: 100,
                displayText: ' °C',
                borderRadius: 16,
                animatedDuration: Duration(milliseconds: 500),
              ),
            ),
          ),
          Card(
            color: Colors.deepPurple,
            margin: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Text(
                      "Temperatura actual: ${_nodo.temperatura.toStringAsFixed(2)} °C",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xffefbdd9),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: FloatingActionButton(
                          onPressed: () {
                            _alarmaRef.push().set({
                              'prueba': 'Enviar mensaje de alerta'
                            }).asStream();
                          },
                          backgroundColor: Color(0xffefbdd9),
                          child: Icon(
                            Icons.add_alert,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      Expanded(
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              _boton = !_boton;
                              _calor = 1;
                            });
                            _bdRef
                                .child('calor')
                                .set({'button': _calor}).asStream();
                          },
                          backgroundColor: Color(0xffefbdd9),
                          child: Icon(
                            Icons.invert_colors,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      Expanded(
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              _boton = !_boton;
                              _calor = 0;
                            });
                            _bdRef
                                .child('calor')
                                .set({'button': _calor}).asStream();
                          },
                          backgroundColor: Color(0xffefbdd9),
                          child: Icon(
                            Icons.invert_colors_off,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _humedadLayout(Nodo _nodo) {
    return Center(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40),
            child: Text(
              'HUMEDAD',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.deepPurple,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: FAProgressBar(
                progressColor: Colors.cyan,
                backgroundColor: Colors.grey,
                direction: Axis.vertical,
                verticalDirection: VerticalDirection.up,
                size: 130,
                currentValue: _nodo.humedad.round(),
                changeColorValue: 70,
                changeProgressColor: Colors.brown,
                maxValue: 100,
                displayText: ' %',
                borderRadius: 16,
                animatedDuration: Duration(milliseconds: 500),
              ),
            ),
          ),
          Card(
            color: Color(0xffefbdd9),
            margin: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Text(
                      "Porcentaje de humedad: ${_nodo.humedad.toStringAsFixed(2)}%",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              _boton = !_boton;
                              _riego = 1;
                            });
                            _bdRef
                                .child('agua')
                                .set({'button': _riego}).asStream();
                          },
                          backgroundColor: Colors.deepPurple,
                          child: Icon(
                            Icons.cloud_done,
                            color: Color(0xffefbdd9),
                          ),
                        ),
                      ),
                      Expanded(
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              _boton = !_boton;
                              _riego = 0;
                            });
                            _bdRef
                                .child('agua')
                                .set({'button': _riego}).asStream();
                          },
                          backgroundColor: Colors.deepPurple,
                          child: Icon(
                            Icons.cloud_off,
                            color: Color(0xffefbdd9),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

```
### nodo.dart
```
class Nodo {
  final double temperatura;
  final double humedad;
  final double nivelDioxidoCarbono;

  Nodo({this.temperatura, this.humedad, this.nivelDioxidoCarbono});

  factory Nodo.fromJson(Map<dynamic, dynamic> json) {
    double parser(dynamic source) {
      try {
        return double.parse(source.toString());
      } on FormatException {
        return -1;
      }
    }

    return Nodo(
      temperatura: parser(json['temperatura']),
      humedad: parser(json['humedad']),
      nivelDioxidoCarbono: parser(json['nivelDioxidoCarbono']),
    );
  }
}

```
## DETALLES  IMPORTANTES DEL CODIGO
## PACKAGES FLUTTER
- [FLUTTER PACKAGES](https://pub.dev/flutter/packages)

- [FlutterFire](https://pub.dev/packages?q=FlutterFire)
- [firebase_core](https://pub.dev/packages/firebase_core)
- [firebase_database](https://pub.dev/packages/firebase_database)

### Agregar estos paquetes a pubspec.yaml file:
En dependencies:

```
  cupertino_icons: ^0.1.3
  firebase_core: ^0.5.0
  firebase_database: ^4.0.0
  flutter_animation_progress_bar: ^1.0.5
```
### Ahora en código de Dart, puedes usar:
```
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
```
## CAPTURAMOS LOS DATOS 

### CONECTAMOS build conecta directo a firebase Real Time Database via 

En lugar de usar initState()y setState() para nuestras necesidades, Flutter viene con un práctico Widget llamado StreamBuilder. Como habrás adivinado, toma una función de Stream y una de builder, llamándola cada vez que un nuevo valor es emitido por el Stream. No necesitamos initStateo dispose para eso:
La variable snapShot contiene los datos más recientes que se recibieron del Stream. Compruebe siempre que contiene datos válidos antes de utilizarlo

```
// StreamBuilder retorna un widget 
StreamBuilder(
  stream: _bdRef.onValue,
  builder: (context, snapshot) {
    if (snapshot.hasData &&
        !snapshot.hasError &&
        snapshot.data.snapshot.value != null) {
      print(
          'snapshot data: ${snapshot.data.snapshot.value.toString()}');
    } else {}
    return Container();
  },

```

### Creamos Objeto DatabaseReference para trabajar con la base de datos de firebase
en state
```
DatabaseReference _nodoRef = FirebaseDatabase.instance.reference().child('SensorHumedad');
```

### El dato de snapshot que obtenemos es tipo JSON, SE DEBE CONVERTIR EL JSON A OBJETO JSON 
//Entonces creamos un modelo de objeto : Creo archivo nodo.dart
```
class Nodo{
  final double temperatura;
  final double humedad;
  final double nivelDioxidoCarbono;
```
//Se inicializa con estos valores para hacer un objeto de esta clase
```
  Nodo({this.temperatura, this.humedad, this.nivelDioxidoCarbono});
```
// Usamos keyword" factory " cuando no es necesario retornar una nueva instancia de la clase

```
factory Nodo.fromJson(Map<dynamic, dynamic> json) {
```
//Haré un analizador que cambie cualquier valor de datos al tipo doble. Siempre es necesario un manejo de excepciones, con valores extraños provenientes del hardware
```
    double parser(dynamic source) {
      try {
        return double.parse(source.toString());
      } on FormatException {
        return -1;
      }
      }
```
//Por ultimo retornamos el dato JSON parselado par completar el objeto
```
    return Nodo(
      temperatura: parser(json['temperatura']),
      humedad: parser(json['humedad']),
      nivelDioxidoCarbono: parser(json['nivelDioxidoCarbono']),
    );
```
### EN nodo_page.dart 
- IMPOORTAMOS Nodo.dart
```
import 'nodo.dart';

```
- Y modificamos stremaBuilder:
```
StreamBuilder(
  stream: _bdRef.onValue,
  builder: (context, snapshot) {
    if (snapshot.hasData &&
        !snapshot.hasError &&
        snapshot.data.snapshot.value != null) {
      print(
          'snapshot data: ${snapshot.data.snapshot.value.toString()}');
var _nodod = Nodo.fromJson(snapshot.data.snapshot.value['Json']);
print("Nodo: ${_nodo.temperatura}/${}")
    } else {}
    return Container();
  },

```

## TRABAJAMOS CON TAB BAR PARA MOSTRAR LOS DATOS
Ya capturamos la data AHORA  TRABAJAMOS para mostrar los datos usamos CON TAB BAR 
### 1.  se crea un TabController paar controlar el TabBar. Par esto es necesario SingleTickerProviderStateMixin.
Usamo la keyword "with" para usar la clase como mixin
```
TabController _tabController;
  with SingleTickerProviderStateMixin {
TabController _tabController;
int tabIndex = 0;
INICIALIZAR EN InitState() y remover de dispose()
@override
void initState() {
  super.initState();
  _tabController = TabController(length: 2, vsync: this);
}

@override
void dispose() {
  // TODO: implement dispose
  _tabController.dispose();
  super.dispose();
}
```
### 2. TRABAJAMOS EN SCAFFOLD CON appBar:  
CREAMOS AppBar in trhe mainScaffold, insertamos TabBar al prinicpio, y registramos el _tabController
```
appBar: AppBar(
  title: Text('Iot App Flutter'),
  bottom: TabBar(
    controller: _tabController,
  ),
),
```
En Tap Bar como boton para cambiar el valor de tabIndex, y redibujar la pantalla
```
onTap: (int index) {
  setState(() {
    tabIndex = index;
  });
},
tabs: [
  Tab(
    icon: Icon(Icons.access_alarm),
  ),
  Tab(
    icon: Icon(Icons.add),
  ),

```
### 3. The StreamBuilder ahora usa Indexedstack() para mostrar 2 pantallas diferentes de acuerdo al tabIndex. 
Si no hay datos entonces mostra un pantala muerta
```
StreamBuilder(
  stream: _bdRef.onValue,
  builder: (context, snapshot) {
    if (snapshot.hasData &&
        !snapshot.hasError &&
        snapshot.data.snapshot.value != null) {
      print(
          'snapshot data: ${snapshot.data.snapshot.value.toString()}');
      var _nodo = Nodo.fromJson(
          snapshot.data.snapshot.value['Json']);
      print(
          "Nodo: ${_nodo.temperatura}/${_nodo.humedad}/${_nodo.fecha}");
      return IndexedStack(
        index: tabIndex,
        children: [],
      );
    } else {
      return Center(
        child: Text('No hay datos aun'),
      );
    }
    return Container();
  },
),
```
### 4. SE HACE UNA FUCNOI WIDGET  PARA MOSTRAR GRAFICA DE TEMPERATURA Y HUMEDAD
```
Widget _temperaturaLayout(Nodo _nodo) {
  return Center(
    child: Text('ES TEMPERATURA LAYOUT'),
  );
}

Widget _humedadLayout(Nodo _nodo) {
  return Center(
    child: Text('ES HUMEDAD LAYOUT LAYOUT'),
  );
}
```
y 
```
return IndexedStack(
  index: tabIndex,
  children: [
    _humedadLayout(_nodo),
    _temperaturaLayout(_nodo)
  ],
);
```
## GRAFICAS

### Par mostar graficas usamos 

- [Flutter animation](https://pub.dev/packages?q=flutter+animation)
- [Flutter animation Progress Bar](https://pub.dev/packages/flutter_animation_progress_bar)
### Modificamos el pubspec.yaml
COPIAMOS AEN EL archivo pubspec.yaml
```
flutter_animation_progress_bar: ^1.0.5 
```
- POR ULTIMO SOLO getpackages
- IMPORTAMOS EL NUEVO PACKAGE
```
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
```
USAMOS CWIDGET COLUMNA PARA INSERTAR Txt-FAProgressBar-Text y widget eEXPANDED PAAR MOSTRAR FAProgressBar los mas grande

```
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: FAProgressBar(
                progressColor: Colors.pinkAccent.shade100,
                backgroundColor: Colors.grey,
                direction: Axis.vertical,
                verticalDirection: VerticalDirection.up,
                size: 100,
                currentValue: _nodo.temperatura.round(),
                changeColorValue: 70,
                changeProgressColor: Colors.pink,
                maxValue: 100,
                displayText: ' °C',
                borderRadius: 16,
                animatedDuration: Duration(milliseconds: 500),
              ),
            ),
          ),
```

