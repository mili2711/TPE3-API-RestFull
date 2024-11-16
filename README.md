__Integrantes:__  
- Acosta, Lautaro  
- Callejo, Milagros

__Descripción:__  
API REST de reseñas sobre canciones con soporte para alta, baja y modificación de las mismas. 
Cada reseña está compuesta por un id, el titulo de la canción, un puntaje del 1 al 10, y un breve comentario.

---  
__Endpoints:__  
- __localhost/Web_2/TPE3-API-RestFull/api/reviews__ (Método GET para la lectura de las reseñas)
  
  ***reviews?sortby=...*** para ordenar bajo alguno de los 4 criterios disponibles: 'id_review' (por defecto), 'song_name', 'rating', 'comment'.
    
  ***reviews?order=asc ó reviews?order=desc*** para ordenar de manera ascendente (por defecto) o descendente.
    
  ***reviews?page=...*** para ver las reseñas en forma paginada. Actualmente al haber 16 reseñas en total se decidió dividir el contenido equitativamente en 4 páginas pero se puede paginar de cualquier forma cambiando el valor de algunas constantes en el codigo.

  Los 3 parámetros query se pueden combinar de cualquier manera.
  
- __localhost/Web_2/TPE3-API-RestFull/api/reviews/'id'__ (Método GET para la lectura de una reseña en particular dado su numero de id)  

- __localhost/Web_2/TPE3-API-RestFull/api/reviews__ (Método POST para añadir una reseña)

- __localhost/Web_2/TPE3-API-RestFull/api/reviews/'id'__ (Método DELETE para eliminar una reseña en particular dado su id)

- __localhost/Web_2/TPE3-API-RestFull/api/reviews/'id'__ (Método PUT para editar una reseña en particular dado su id)  
  __Aclaración:__ Por cuestiones de integridad de la bdd, no se pueden modificar ni el id de la reseña ni el nombre de la canción. Si se edita alguno de estos dos campos la acción no va a tener efecto.







