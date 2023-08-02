# NUMPY

Importamos la librería numpy (si no funciona realizar __pip install numpy__ desde una consola de comandos)


```python
import numpy
```


```python
# Creamos nuestro primer array

arr = numpy.array([10, 20, 98, 34])

arr
```




    array([10, 20, 98, 34])




```python
# Observamos el tipo de clase que tiene un array
print(type(arr))
```

    <class 'numpy.ndarray'>
    

Algo muy extendido entre la comunidad de desarrolladores de Python es utilizar __alias__ en las librerías, para acortar su nombre e identificarlas más fácilmente, en el caso de __numpy__ utilizaremos el alias __np__


```python
import numpy as np

# Creamos de nuevo un array
arr = np.array([23, 42, 58])

arr
```




    array([23, 42, 58])



Tupla como array


```python
mi_tupla = (1, 58, 63, 45)
print(type(mi_tupla))

arr_tuple = np.array(mi_tupla)

print(arr_tuple)
print(type(arr_tuple))
```

    <class 'tuple'>
    [ 1 58 63 45]
    <class 'numpy.ndarray'>
    

Diccionario como array


```python
my_dict = {'one': 'uno', 
           'two': 'dos',
           'three': 'tres'}

dict_list = list(my_dict.items())
print(dict_list)

arr_dict = np.array(dict_list)
print(arr_dict)
```

    [('one', 'uno'), ('two', 'dos'), ('three', 'tres')]
    [['one' 'uno']
     ['two' 'dos']
     ['three' 'tres']]
    

### Dimensiones de un array

Verficamos las dimensiones de un array con la función <code>__ndim__</code>


```python
a = np.array(42)
```


```python
b = np.array([1, 2, 3, 4, 5])
```


```python
c = np.array([
    [1, 2, 3], [4, 5, 6]
])
```


```python
d = np.array([
    [
        [1, 2, 3], [4, 5, 6]
    ], 
    [
        [1, 2, 3], [4, 5, 6]
    ]
])
```


```python
e = np.array([
    [
        [[1, 2, 3], [4, 5, 6]], 
        [[1, 2, 3], [4, 5, 6]],
        [[1, 2, 3], [4, 5, 6]], 
        [[1, 2, 3], [4, 5, 6]]
    ]
])
```


```python
print(a.ndim)
print(b.ndim)
print(c.ndim)
print(d.ndim)
print(e.ndim)
```

    0
    1
    2
    3
    4
    

### Seleccionando elementos de un array




```python
b[0]
```




    1




```python
c[0]
```




    array([1, 2, 3])




```python
c[0][2]
```




    3




```python
d[1]
```




    array([[1, 2, 3],
           [4, 5, 6]])




```python
d[1][0]
```




    array([1, 2, 3])




```python
d[1][0][2]
```




    3



## Estructura de un array

Para ello utilizamos la función <code>__shape__</code> que nos devuelve la siguiente información
* (__longitud elementos dim 1__, __longitud elementos dim 2__,..., __longitud elementos dim n__)


```python
print(a.shape) # No tiene dimensiones, solamente es el número 42
```

    ()
    


```python
print(b.shape) # Longitud 5 dimensión 1
```

    (5,)
    


```python
print(c.shape) # Longitud 2, cada lista tiene 3 elemento
```

    (2, 3)
    


```python
print(d.shape) # Longitud 2, cada sub-lista tiene 2 listas, de 3 elementos
```

    (2, 2, 3)
    


```python
print(e.shape) # Longitud 1, 
               # dentro de esta lista hay 4 sub-listas, 
               # cada sub-lista tiene 2 listas, 
               # de 3 elementos
```

    (1, 4, 2, 3)
    

## Indexando arrays y creando _slices_ de arrays de una dimensión


```python
my_array = np.arange(11)
```


```python
my_array
```




    array([ 0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10])



De posición 0 a 3


```python
my_array[0:3] # De posición 0 a 3
```




    array([0, 1, 2])



De posición 2 a 7


```python
my_array[2:7] # De posición 2 a 7
```




    array([2, 3, 4, 5, 6])



De inicio a 6


```python
my_array[:6] # De inicio a 6
```




    array([0, 1, 2, 3, 4, 5])



De 6 a final


```python
my_array[6:] # De 6 a final
```




    array([ 6,  7,  8,  9, 10])



De inicio a 9 de tres en tres elementos


```python
my_array[:9:3] # De inicio a 9 de tres en tres elementos
```




    array([0, 3, 6])



De 6 a fin de dos en dos elementos


```python
my_array[6::2] # De 6 a fin de dos en dos elementos
```




    array([ 6,  8, 10])



Posición 2 empezando por el final


```python
my_array[-2] # Posición 2 empezando por el final
```




    9



De inicio hasta el elemento -3 del array


```python
my_array[:-3] # De inicio hasta el elemento -3 del array
```




    array([0, 1, 2, 3, 4, 5, 6, 7])



Array reverso


```python
my_array[::-1] # Array reverso
```




    array([10,  9,  8,  7,  6,  5,  4,  3,  2,  1,  0])



De fin (reverso) a inicio tomados de 2 en 2


```python
my_array[::-2] # De fin (reverso) a inicio tomados de 2 en 2
```




    array([10,  8,  6,  4,  2,  0])



## Manipulando dimensiones de un array

Podemos definir las dimensiones de un array con la función <code>__reshape__</code>, por ejemplo, crear un array de 2 listas, con 3 sublistas de 6 elementos cada una.


```python
new_array = np.arange(36).reshape(2,3,6)
```


```python
new_array
```




    array([[[ 0,  1,  2,  3,  4,  5],
            [ 6,  7,  8,  9, 10, 11],
            [12, 13, 14, 15, 16, 17]],
    
           [[18, 19, 20, 21, 22, 23],
            [24, 25, 26, 27, 28, 29],
            [30, 31, 32, 33, 34, 35]]])



Algo más sencillo


```python
basic_array = np.arange(3).reshape(1,3)
basic_array
```




    array([[0, 1, 2]])



Podemos recodificar otros arrays a una nueva dimensión


```python
new_dims = e.reshape(2,2,6)
new_dims
```




    array([[[1, 2, 3, 4, 5, 6],
            [1, 2, 3, 4, 5, 6]],
    
           [[1, 2, 3, 4, 5, 6],
            [1, 2, 3, 4, 5, 6]]])



Lo contrario de reshape, es la función <code>__ravel__</code> y <code>__flatten__</code>, es decir, eliminar todas las dimensiones y dejar un array plano


```python
new_dims.ravel()
```




    array([1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6, 1, 2, 3, 4,
           5, 6])




```python
new_dims.flatten()
```




    array([1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6, 1, 2, 3, 4,
           5, 6])



La principal diferencia entre los dos es que __flaten__ devuelve una copia y __ravel__ devuelve una vista, es decir, si hacemos un cambio en el array original, se verá reflejado en la variable asignada a ravel.

Es importante recordar que los arrays son mutables, es decir, si no realizamos una copia correctamente, los dos arrays compartirán las mismas posiciones de memoria.

## _Stacking_ (apliando) de arrays

Los arrays pueden ser apilados ( _stacking_ ) de forma horizontal, vertical o en profundad. Veamos algunos casos y las funciones necesarias para ello.


```python
pares = np.array([
    [0, 2, 4],
    [6, 8, 10],
    [12, 14, 16]
])

impares = np.array([
    [1, 3, 5],
    [7, 9, 11],
    [13, 15, 17]
])
```

* **Stacking Horizontal** <code>__hstack__</code>


```python
np.hstack((pares, impares)) # Apila los arrays en referencia a la la longitud 3
```




    array([[ 0,  2,  4,  1,  3,  5],
           [ 6,  8, 10,  7,  9, 11],
           [12, 14, 16, 13, 15, 17]])



* **Stacking Vertical** <code>__vstack__</code>


```python
np.vstack((pares, impares)) # Apila los arrays en referencia al número de elementos.
```




    array([[ 0,  2,  4],
           [ 6,  8, 10],
           [12, 14, 16],
           [ 1,  3,  5],
           [ 7,  9, 11],
           [13, 15, 17]])



* Ambas funciones son equivalentes a <code>__concatenate__</code>, en este caso el elemento que diferencia el método de unión es el parámetro axis. 0 por filas, 1 columnas


```python
np.concatenate((pares, impares), axis=1)
```




    array([[ 0,  2,  4,  1,  3,  5],
           [ 6,  8, 10,  7,  9, 11],
           [12, 14, 16, 13, 15, 17]])




```python
np.concatenate((pares, impares), axis=0)
```




    array([[ 0,  2,  4],
           [ 6,  8, 10],
           [12, 14, 16],
           [ 1,  3,  5],
           [ 7,  9, 11],
           [13, 15, 17]])



Con <code>**dstack**</code> podemos apilar los arrays de elemento a elemento (primero con primero, segundo con segundo ...)


```python
np.dstack((pares, impares))
```




    array([[[ 0,  1],
            [ 2,  3],
            [ 4,  5]],
    
           [[ 6,  7],
            [ 8,  9],
            [10, 11]],
    
           [[12, 13],
            [14, 15],
            [16, 17]]])



## Splitting (dividiendo) arrays

Al igual que podemos apilar o unir arrays, también podemos dividir arrays en nuevos arrays, los criterios de unión son muy similares a los de división: Horizaontal, vertical y en profundidad 

* Para división horizontal <code>**hsplit**</code>, importante, esta función toma un valor de división que debe ser igual al número de elementos del array (por lista)


```python
np.hsplit(pares, 3)
```




    [array([[ 0],
            [ 6],
            [12]]), array([[ 2],
            [ 8],
            [14]]), array([[ 4],
            [10],
            [16]])]



* Para división vertical <code>**vsplit**</code>, importante, esta función toma un valor de división que debe ser igual al número de elementos del array (por lista)


```python
np.vsplit(pares, 3)
```




    [array([[0, 2, 4]]), array([[ 6,  8, 10]]), array([[12, 14, 16]])]



* Equivalentemente tenemos la función <code>**split**</code> que nos permite realizar la división del array por columnas o filas


```python
np.split(pares, 3, axis=1)
```




    [array([[ 0],
            [ 6],
            [12]]), array([[ 2],
            [ 8],
            [14]]), array([[ 4],
            [10],
            [16]])]




```python
np.split(pares, 3, axis=0)
```




    [array([[0, 2, 4]]), array([[ 6,  8, 10]]), array([[12, 14, 16]])]



Finalmente, con <code>**dsplit**</code> podemos realizar la división por profundidad. Importante: Este tipo de división, requiere arrays de dimensión 3 como mínimo.


```python
big = np.arange(27).reshape(3, 3, 3)
```


```python
big
```




    array([[[ 0,  1,  2],
            [ 3,  4,  5],
            [ 6,  7,  8]],
    
           [[ 9, 10, 11],
            [12, 13, 14],
            [15, 16, 17]],
    
           [[18, 19, 20],
            [21, 22, 23],
            [24, 25, 26]]])




```python
np.dsplit(big, 3)
```




    [array([[[ 0],
             [ 3],
             [ 6]],
     
            [[ 9],
             [12],
             [15]],
     
            [[18],
             [21],
             [24]]]), array([[[ 1],
             [ 4],
             [ 7]],
     
            [[10],
             [13],
             [16]],
     
            [[19],
             [22],
             [25]]]), array([[[ 2],
             [ 5],
             [ 8]],
     
            [[11],
             [14],
             [17]],
     
            [[20],
             [23],
             [26]]])]



## Atributos de un array

* <code>**ndim**</code> Muestra el número de dimensiones de un array


```python
big.ndim
```




    3



* <code>**size**</code> Cuenta el número de elementos.


```python
big.size
```




    27



* <code>**itemsize**</code> Espacio que ocupa en bytes cada elemento del array


```python
big.itemsize
```




    4



* <code>**nbytes**</code> Tamaño de todo el array en bytes


```python
big.nbytes
```




    108



* <code>**T**</code> Transpuesta del array


```python
big.T
```




    array([[[ 0,  9, 18],
            [ 3, 12, 21],
            [ 6, 15, 24]],
    
           [[ 1, 10, 19],
            [ 4, 13, 22],
            [ 7, 16, 25]],
    
           [[ 2, 11, 20],
            [ 5, 14, 23],
            [ 8, 17, 26]]])



## Convirtiendo arrays

Es posible extraer slices del array o, simplemente todo el array para obtener listas o modificar el tipo del array, en este caso utilizaremos dos funciones para realizar conversiones sobre el array.

* <code>**tolist**</code> Convierte a lista el array o un slice del mismo


```python
lista = big.tolist()
```


```python
print(lista)
print(type(lista))
```

    [[[0, 1, 2], [3, 4, 5], [6, 7, 8]], [[9, 10, 11], [12, 13, 14], [15, 16, 17]], [[18, 19, 20], [21, 22, 23], [24, 25, 26]]]
    <class 'list'>
    

* <code>**astype**</code> Para modificar el tipo del array.


```python
big.astype(float)
```




    array([[[ 0.,  1.,  2.],
            [ 3.,  4.,  5.],
            [ 6.,  7.,  8.]],
    
           [[ 9., 10., 11.],
            [12., 13., 14.],
            [15., 16., 17.]],
    
           [[18., 19., 20.],
            [21., 22., 23.],
            [24., 25., 26.]]])




```python
big.astype(str)
```




    array([[['0', '1', '2'],
            ['3', '4', '5'],
            ['6', '7', '8']],
    
           [['9', '10', '11'],
            ['12', '13', '14'],
            ['15', '16', '17']],
    
           [['18', '19', '20'],
            ['21', '22', '23'],
            ['24', '25', '26']]], dtype='<U11')




```python
big.astype(int)
```




    array([[[ 0,  1,  2],
            [ 3,  4,  5],
            [ 6,  7,  8]],
    
           [[ 9, 10, 11],
            [12, 13, 14],
            [15, 16, 17]],
    
           [[18, 19, 20],
            [21, 22, 23],
            [24, 25, 26]]])



## Copias y Vistas de un array.

Es importante mencionar que al igual que las listas los arrays comparten posiciones en nuestra memoria física, por lo tanto, si no utilizamos los comandos necesario para realizar una copia de un array correctamente, los cambios que hagamos en el array_a, se verán reflejados en el array_b.

Vamos a ver el ejemplo más básico, hacer una copia de un array asignándolo a una nueva variable.


```python
# Definimos un array con elementos del 2 hasta 20
arr = np.arange(2, 20)
```


```python
# Asignamos las dos últimas posiciones a la variable b
b = arr[-2:]
b
```




    array([18, 19])




```python
# Asignamos todas las posiciones del array b a cero.
b[::] = 0
b
```




    array([0, 0])




```python
# Los cambios se reflejan en nuestra variable arr
arr
```




    array([ 2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16, 17,  0,
            0])



Vamos a ver ahora otro ejemplo similar, obtendremos las primeras cinco posiciones del array, se las asignaremos a otra variable, les daremos valor 100 y veremos que estos cambios se ven reflejados en nuestro array original


```python
array_dos = np.arange(0, 31)
```


```python
c = array_dos[0:5]
```


```python
c[::] = 100
c
```




    array([100, 100, 100, 100, 100])




```python
array_dos
```




    array([100, 100, 100, 100, 100,   5,   6,   7,   8,   9,  10,  11,  12,
            13,  14,  15,  16,  17,  18,  19,  20,  21,  22,  23,  24,  25,
            26,  27,  28,  29,  30])



En los dos ejemplos anteriores vemos que los arrays hay sufrido cambios producidos en los arrays copia, algo similar sucede si utilizamos la función <code>**view**</code>, su uso se aconseja para mostrar arrays, pero no para realizar cambios sobre los mismos.


```python
array_1 = np.array([[10,10], [2,3], [4,5]]) 
array_1
```




    array([[10, 10],
           [ 2,  3],
           [ 4,  5]])



Creamos un segundo array basado en el primero


```python
array_dos = array_1.view()

array_dos
```




    array([[10, 10],
           [ 2,  3],
           [ 4,  5]])



Con el comando <code>__id()__</code> vemos que las posiciones son iguales


```python
id(array_1)
```




    3081462834160




```python
id(array_dos)
```




    3081462759952



Modificamos el segundo array


```python
array_dos[0] = [10000, 3]

array_dos
```




    array([[10000,     3],
           [    2,     3],
           [    4,     5]])



Comprobamos que ha ocurrido lo mismo en el primero


```python
array_1
```




    array([[10000,     3],
           [    2,     3],
           [    4,     5]])



Para evitar que esto ocurra, si realmente queremos obtener una copia de un array para su posterior procesamiento o modificación, lo mejor es copiar el array con el comando <code>__copy()__</code>


```python
array_copiado = array_1.copy()
```

Comprobamos posiciones de memoria


```python
print(id(array_1))
print(id(array_copiado))
```

    3081462834160
    3081462483664
    

Realizamos una modificación en el array original


```python
array_1[1] = [2200, 34]

array_1
```




    array([[10000,     3],
           [ 2200,    34],
           [    4,     5]])



Vemos si los cambios aparecen en nuestra copia


```python
array_copiado
```




    array([[10000,     3],
           [    2,     3],
           [    4,     5]])



## Operaciones sobre arrays

Existen varias operaciones que podemos realizar sobre arrays, es importante enfatizar en la importancia de saber sobre qué eje ( *axis* ) de los arrays queremos realizar la suma

* Suma <code>**sum**</code>


```python
e = np.array([[[1, 0], [0, 0]],
              [[1, 1], [1, 0]],
              [[1, 0], [0, 1]]]
            )

e.sum(axis = 0)
```




    array([[3, 1],
           [1, 1]])



El resultado significa que sumando las columnas del primer componente que es:
[1. 0]
[1, 1]
[1, 0]

Obtenemos que las filas en la columna suman 3 y en la segunda columna 1, por lo tanto [3, 1]

En el segundo componente que es:
[0, 0]
[1, 0]
[0, 1]

Obtenemos que las filas de la primera columna suman 1 y de la segunda 1 también, por lo tanto [1, 1]


```python
e.sum(axis=1)
```




    array([[1, 0],
           [2, 1],
           [1, 1]])



En este caso cada dimensión, funciona a nivel de fila, por lo tanto, si sumamos la primera fila que sería [1 + 0], [0 + 0] = [1, 0]

La segunda fila: [1 + 1], [1 + 0] = [2, 1]

La tercera: [1 + 0], [0 + 1] = [1, 1]

* <code>**empty**</code> genera un array con valores arbitrarios


```python
nothing = np.empty(10)
nothing
```




    array([1.52243116e-311, 2.22329541e-322, 0.00000000e+000, 0.00000000e+000,
           8.48798316e-313, 1.16095484e-028, 1.07321823e+160, 4.25117458e-096,
           9.78750380e+199, 6.97843734e+252])



* <code>**ones**</code> genera un array solamente con unos.


```python
ones = np.ones(5)
ones
```




    array([1., 1., 1., 1., 1.])



* <code>**zeros**</code> genera un array solamente con ceros.


```python
zeros = np.zeros(5)
zeros
```




    array([0., 0., 0., 0., 0.])



* <code>**random**</code> Como función. Importa una serie de funciones para generación de números aleatorios de diferente distribución. Algunos de los diferentes valores que podemos generar son:

* <code>**rand**</code>: Valores aleatorios.
* <code>**randn**</code> : Valores aleatorios siguiendo una distribución normal.
* <code>**randint**</code>: Valores aleatorios enteros desde menor valor a mayor.
* <code>**random**</code>: Valores aleatorios de tipo float entre el intervalo [0.0, 1.0].
* <code>**beta**</code>: Valores que siguen una distribución Beta.
* <code>**binomial**</code>: Valores aleatorios que siguen una distribución Binomial.
* <code>**gamma**</code>: Valores que siguen una distribución Gamma.

Todos los diferentes valores aleatorios y distribuciones que podemos realizar se encuentran en el siguiente link. https://docs.scipy.org/doc/numpy-1.15.0/reference/routines.random.html


```python
rand = np.random.rand(10)
rand
```




    array([0.00679214, 0.87719023, 0.96415461, 0.15073363, 0.53432306,
           0.46579972, 0.65413353, 0.17148798, 0.26835114, 0.53212125])




```python
randn = np.random.randn(10)
randn
```




    array([ 0.67349417,  0.44322206,  1.14267717,  0.09392948,  0.67466901,
           -1.00494561,  1.29410641, -0.9576192 ,  1.59516205, -0.68454205])




```python
randint = np.random.randint(20, 100, 10)
randint
```




    array([54, 46, 64, 94, 46, 74, 24, 56, 35, 93])




```python
random = np.random.random(10)
random
```




    array([0.95804504, 0.82351063, 0.75977208, 0.85074348, 0.62058657,
           0.09923072, 0.69949507, 0.93667934, 0.37439332, 0.28600882])




```python
beta = np.random.beta(0.2, 0.5, 10)
beta
```




    array([1.35547028e-03, 7.21263816e-01, 3.86039195e-05, 3.04373215e-01,
           4.57047174e-01, 1.46928514e-01, 9.97819614e-01, 9.98043526e-01,
           8.87201997e-01, 9.58624595e-01])




```python
binomial = np.random.binomial(10, 0.5, 10)
binomial
```




    array([4, 5, 6, 7, 7, 5, 5, 6, 3, 0])




```python
gamma = np.random.gamma(0.25, 0.3, 10)
gamma
```




    array([2.38672509e-01, 5.30281913e-01, 1.08387922e-01, 9.47582879e-02,
           5.33274875e-04, 2.17414073e-05, 1.26559566e-03, 2.08965128e-01,
           1.87621880e-03, 1.63473501e-02])



* <code>**round**</code>: Permite redondear a n decimales todo un array.


```python
gamma.round(2)
```




    array([0.24, 0.53, 0.11, 0.09, 0.  , 0.  , 0.  , 0.21, 0.  , 0.02])



* <code>**fill**</code>: Permite rellenar un array con un valor pasado por parámetro.


```python
zero_array = np.zeros(20)
zero_array[5:15].fill(5)
zero_array
```




    array([0., 0., 0., 0., 0., 5., 5., 5., 5., 5., 5., 5., 5., 5., 5., 0., 0.,
           0., 0., 0.])



* <code>**mean**</code>: Realiza la media del array o por uno de sus ejes.


```python
e.mean(axis = 0)
```




    array([[1.        , 0.33333333],
           [0.33333333, 0.33333333]])




```python
e.mean(axis = 1)
```




    array([[0.5, 0. ],
           [1. , 0.5],
           [0.5, 0.5]])




```python
e.mean()
```




    0.5



* <code>**dot**</code>: Producto de matrices


```python
e.dot(gamma) # Tenemos que asegurarnos de que son de la misma dimensión.
```


    ---------------------------------------------------------------------------

    ValueError                                Traceback (most recent call last)

    <ipython-input-100-316e05f7281f> in <module>
    ----> 1 e.dot(gamma) # Tenemos que asegurarnos de que son de la misma dimensión.
    

    ValueError: shapes (3,2,2) and (10,) not aligned: 2 (dim 2) != 10 (dim 0)



```python
e.dot(d)
```




    array([[[[1, 2, 3],
             [1, 2, 3]],
    
            [[0, 0, 0],
             [0, 0, 0]]],
    
    
           [[[5, 7, 9],
             [5, 7, 9]],
    
            [[1, 2, 3],
             [1, 2, 3]]],
    
    
           [[[1, 2, 3],
             [1, 2, 3]],
    
            [[4, 5, 6],
             [4, 5, 6]]]])



* <code>**min**</code>: Valor mínimo del array o de uno de sus ejes


```python
aux = np.array([
    [1, 100, 5],
    [2, 4, 0]
])

aux.min()
```




    0




```python
aux.min(axis=0)
```




    array([1, 4, 0])




```python
aux.min(axis=1)
```




    array([1, 0])



* <code>**max**</code>: Valor máximo del array o de uno de sus ejes


```python
print(aux.max())
print(aux.max(axis=0))
print(aux.max(axis=1))
```

    100
    [  2 100   5]
    [100   4]
    

* <code>**argmin**</code>: Posición del índice con el valor mínimo de un array


```python
aux.argmin()
```




    5



* <code>**argmax**</code>: Posición del índice con el valor máximo de un array


```python
aux.argmax()
```




    1



* <code>**sort**</code>: Ordenar elementos de un array.


```python
aux.sort()
aux
```




    array([[  1,   5, 100],
           [  0,   2,   4]])




# Autor

William Sarti José

https://www.linkedin.com/in/william-analistadesistema/
