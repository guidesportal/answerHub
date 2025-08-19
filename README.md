## Test Laravel BLE "answerHub"

### Contexto 
AnswerHub, una plataforma pensada para recibir respuestas a encuestas desde sistemas externos, debemos poder usar el mismo punto de entrada a la lógica de la aplicación, manejando datos en formatos distintos ya que no podemos controlar lo que envían los sistemas externos, aunque si tenemos una definición de cómo vienen los datos desde cada uno.

### Definición de la prueba
Este repositorio está preparado para que se deba completar el flujo de código entre el controller
`app/Http/Controllers/External/SurveyAnswerController.php` y el método perform del Servicio
`app/Services/Surveys/SurveyAnswerService.php`

El sistema debe ser capaz de procesar todas las requests definidas dentro del prefix **external/survey-responses** de la api.
Tenéis los samples de los body para esas requests en **storage/app/samples**. Los samples "A" deben entrar correctamente, los "B" están pensados para fallar. Cada método del Controller **SurveyAnswerController** equivale a uno o más samples, ej:
- método **SystemA()** -> **storage/app/samples/SystemA-sampleA.json** (200 OK)
- método **SystemA()** -> **storage/app/samples/SystemA-sampleB.json** (400 Bad request)
- método  **SystemC()** -> **storage/app/samples/SystemC-sampleA.json** (solamente hay un sample, 200 OK)

Se puede usar cualquier herramienta, no hay limitaciones en este sentido.
**Podeis añadir tests de feature si sobra tiempo, no es obligatorio**.
Esta prueba en concreto está pensada para que dure alrededor de una hora u hora y media, así que de todas las formas posibles,
deberías elegir la que encaje dentro del tiempo de desarrollo previsto. Si consideras que teniendo más tiempo lo harías de forma distinta,
puedes añadirlo al archivo NOTES.md especificando como lo harías y porqué.

### Procedimiento de la prueba
 - Cambiar a la rama testBranch y hacer rebase en main
 - Crear el archivo NOTES.md para poder escribir cualquier aclaración de tu parte
 - Hacer los commits necesarios en el código
### Prerequisitos
 - Docker actualizado (probado con 4.42.1)
 - Postman (Opcional, para poder realizar pruebas manuales)

### Instalación / Build
El repositorio está preparado para levantar la infrastructura local solamente con docker ejecutando el siguiente comando:
```shell
$ docker compose up -d
```

### Otros comandos útiles
Si tenéis problemas con las migraciones, podeis lanzar de forma manual:
Reiniciar los servicios de compose:
```shell
$ docker compose down && docker compose up -d
```
Re-lanzar migraciones manual sin reiniciar los servicios:
```shell
$ docker compose run --rm app php artisan migrate:fresh
```

