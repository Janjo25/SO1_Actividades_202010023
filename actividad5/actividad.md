# Conceptos de Sistemas Operativos

## 1. Tipos de Kernel y sus Diferencias

### 1.1. Kernel Monolítico
El kernel monolítico es un tipo de núcleo de sistema operativo que gestiona directamente los recursos del hardware, como la memoria, el procesamiento y los dispositivos de entrada/salida. Todo el código de control del hardware está integrado en el mismo espacio de memoria, lo que puede hacer que el sistema sea rápido, pero también más vulnerable a fallos si ocurre un error en alguna parte del kernel.

### 1.2. Microkernel
El microkernel es un enfoque que minimiza las funciones del núcleo del sistema operativo, relegando muchas de sus responsabilidades a procesos de usuario que se ejecutan fuera del kernel. Esto incluye funciones como el manejo de controladores de dispositivos y el sistema de archivos. El objetivo es crear un sistema más modular y estable, aunque a veces puede ser menos eficiente debido a la comunicación entre procesos.

### 1.3. Exokernel
El exokernel es un tipo de kernel que intenta dar a las aplicaciones más control sobre el hardware, dejando la mayoría de las políticas de gestión de recursos al nivel de la aplicación. Esto puede aumentar la eficiencia y la flexibilidad, aunque a costa de una mayor complejidad en el desarrollo de software.

### 1.4. Nanokernel
El nanokernel es un término utilizado para describir un kernel extremadamente minimalista que sólo proporciona las funciones básicas necesarias para que el sistema operativo funcione. A menudo se utiliza en sistemas embebidos o de tiempo real.

### 1.5. Kernel Híbrido
Un kernel híbrido combina elementos de los kernels monolíticos y microkernels. Intenta aprovechar la modularidad y estabilidad de un microkernel, al tiempo que mantiene algunas de las características de alto rendimiento de un kernel monolítico.

## 2. User Mode vs Kernel Mode

### 2.1. Definición de User Mode
El modo de usuario es un estado de operación en el que se ejecutan aplicaciones normales. En este modo, el acceso a los recursos del sistema, como la memoria y los dispositivos de hardware, está restringido para proteger la estabilidad del sistema operativo. Las aplicaciones deben solicitar al sistema operativo permisos para interactuar con estos recursos.

### 2.2. Definición de Kernel Mode
El modo kernel es el estado en el que se ejecuta el núcleo del sistema operativo. En este modo, el código tiene acceso total a todos los recursos del hardware. Este acceso sin restricciones es necesario para la gestión eficiente y segura de los recursos del sistema, pero también significa que cualquier error puede tener consecuencias graves.

### 2.3. Diferencias y Funciones
La principal diferencia entre el modo usuario y el modo kernel es el nivel de acceso a los recursos del sistema. Mientras que el modo usuario está diseñado para proteger al sistema limitando el acceso de las aplicaciones, el modo kernel proporciona un acceso completo para permitir al sistema operativo gestionar el hardware y los recursos críticos.

## 3. Interruptions vs Traps

### 3.1. ¿Qué son las Interrupciones?
Las interrupciones son señales enviadas al procesador por hardware o software que indican que se necesita atención inmediata. El procesador detiene temporalmente su ejecución para atender la interrupción y luego reanuda la tarea original. Un ejemplo común de interrupción es cuando se presiona una tecla en el teclado.

### 3.2. ¿Qué son las Trampas?
Las trampas (traps) son un tipo de interrupción que generalmente es generada por el software, y se utiliza para manejar condiciones excepcionales como errores o para solicitar servicios del sistema operativo, como llamadas al sistema.

### 3.3. Diferencias Clave entre Interrupciones y Trampas
Mientras que las interrupciones pueden ser generadas por hardware o software y son asíncronas, las trampas son siempre generadas por el software y ocurren como resultado de una instrucción específica en el código. Las trampas son sincrónicas con el proceso que las generó.
