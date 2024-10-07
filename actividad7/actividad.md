El Completely Fair Scheduler (CFS) es el algoritmo de planificación predeterminado en Linux desde la versión 2.6.23. A
diferencia de los enfoques anteriores que asignaban prioridades fijas o turnos de tiempo, el CFS distribuye el tiempo de
CPU de manera más equitativa entre las tareas. Se basa en el concepto de "justicia", donde cada tarea recibe una
proporción de tiempo de CPU de acuerdo con su nice value, que puede variar entre -20 y +19. Cuanto más bajo sea el nice
value, mayor será la proporción de tiempo que recibe la tarea.

El CFS funciona calculando un "tiempo de ejecución virtual" (vruntime) para cada tarea, que aumenta a diferentes ritmos
según su prioridad. Las tareas con mayor prioridad (menor nice value) tienen un ritmo de incremento más lento de su
vruntime, mientras que las tareas de menor prioridad tienen un ritmo más rápido. Esto permite que el CFS seleccione la
siguiente tarea a ejecutar basándose en la que tiene el menor vruntime.

El algoritmo utiliza una estructura de datos de árbol rojo-negro, un tipo de árbol binario de búsqueda equilibrado. Las
tareas se organizan en este árbol según su vruntime, lo que permite que el CFS seleccione de manera eficiente la tarea
con menor vruntime en O(log N) operaciones, donde N es el número de tareas. Sin embargo, para optimizar el rendimiento,
el CFS almacena en caché el valor más bajo de vruntime, lo que acelera la selección de la próxima tarea a ejecutar.

Además, el CFS ajusta automáticamente la "latencia objetivo", que es el tiempo durante el cual cada tarea debe
ejecutarse al menos una vez. Este valor aumenta si hay muchas tareas activas, lo que permite una mejor distribución del
tiempo de CPU cuando el sistema está muy ocupado.

El CFS también implementa el balanceo de carga entre procesadores en sistemas de múltiples núcleos (SMP). Se enfoca en
equilibrar la carga dentro de dominios de planificación, que son agrupaciones jerárquicas de núcleos que comparten
recursos como cachés. El algoritmo minimiza la migración de hilos entre diferentes dominios para reducir las
penalizaciones de rendimiento asociadas con la migración de datos entre cachés y la memoria local en sistemas NUMA.
