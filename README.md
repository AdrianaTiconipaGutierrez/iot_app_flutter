# Let's build an IoT app with Flutter, Firebase & Arduino

![Presentación Iot app](https://user-images.githubusercontent.com/39227411/94283294-d4a66d80-ff1e-11ea-9e63-341deba0c3cb.png)
![APP OIOT 1](https://user-images.githubusercontent.com/39227411/94284190-07049a80-ff20-11ea-9e23-56918348be91.png)
 
 ## APP IOT:
Vamos a realizar lo siguiente: 

![app iot](https://user-images.githubusercontent.com/39227411/94282876-59dd5280-ff1e-11ea-82e8-bbe4cd69a3e6.PNG)

## Los pasos a seguir 

Para poder realizar este sistema se seguiran los siguientes pasos:

![APP OIOT 2](https://user-images.githubusercontent.com/39227411/94284199-08ce5e00-ff20-11ea-994b-5f62b66ed384.png)
 
# RECOLECTAR DATOS
## Materiales
- Placa esp8266 o esp 32
- Sensor de humedad FC-28
- Sensor de temperatura
- Sensor de CO

## Recolectamos datos del medio

Sensor mide los cambios fisicos del medio ambiente

Para eso mediremos la humedad del suelo con el FC-28,sensor que mide la humedad del suelo por la variación de su conductividad.

- FC-28  permite obtener la medición como valor analógico o como una salida digital.
- Valores obtenidos van desde 0 sumergido en agua, a 1023 en el aire (o en un suelo muy seco). Un suelo ligeramente húmero daría valores típicos de 600-700. Un suelo seco tendrá valores de 800-1023.

A continuacion se detalla el esquema de conexiones

![ESQUEMA ADRIANA](https://user-images.githubusercontent.com/39227411/94286695-5a2c1c80-ff23-11ea-8307-24cc3ad62727.png)

Como usamos el como placa el modulo esp8266 se debe considerar lo siguiente: 

![NodeMCU-–-Board-de-desarrollo-con-módulo-ESP8266-WiFi-y-Lua-4](https://user-images.githubusercontent.com/39227411/94286704-5bf5e000-ff23-11ea-8493-580febe486a4.png)

Y en el Ide arduino se debe realizar las configuraciones de: 
-Placa 

![arduino 1](https://user-images.githubusercontent.com/39227411/94287093-e2aabd00-ff23-11ea-8af8-152246f7923d.PNG)

![arduino placas](https://user-images.githubusercontent.com/39227411/94287098-e3dbea00-ff23-11ea-8c00-89fda65d8ac3.PNG)


### Codigo en Arduino leer Datos

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

Firebase es un conjunto de herramientas para "crear, mejorar y hacer crecer su aplicación", dichas herramientas, reemplazan gran parte de los servicios que los desarrolladores normalmente tendrían que construir ellos mismos
•	Autenticación
•	Cloud Messaging
•	Firestore , Firebase real time database
•	Cloud Storage
•	Cloud Functions
•	Hosting
•	Microservicios



A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
