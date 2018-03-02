#  REPORTE TÉCNICO






## José Manuel García Chávez  






## Requerimientos del cliente: 

- Es un botón al centro de la pantalla que dice: "Touch me"
- Y una cajita texto debajo del botón, al presionar el botón mandará un mensaje
Lo quiere para un iPhone 8 en portrait 



## Problemas detectados en el proyecto:

-Existían 2 botones encimados. Uno que ejecutaba la acción y el otro el Outlet.
-La caja de texto que desplegaría el botón eran dos UITextField. Campos para ingresar texto.
-Al ejecutar el proyecto, salió el siguiente error, debido a que éste era un TextField, no un LabelText.

2018-03-01 18:37:28.125652-0600 prueba[1277:139643] *** Terminating app due to uncaught exception 'NSUnknownKeyException', reason: '[<prueba.ViewController 0x7ffa4f607f30> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key outletText.'



## Desarrollo:

-Se eliminaron los textfield y el segundo botón.  -Se añadió un textLabel, y su respectivo outlet en view controller.
-Se editó la acción en viewcontroller.swift
-Se añadieron los constraints para centrar el botón.
-Se añadieron los constraints para el nuevo TextLabel.
-Se cambió el simulador a iPhone 8 y se probó en portrait.
