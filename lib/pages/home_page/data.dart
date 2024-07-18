class LibroData {
  final String title;
  final String imagen;
  final String description;

  const LibroData(
      {required this.title, required this.imagen, required this.description});
}

const List<LibroData> libroData = [
  LibroData(
    title:
        'The Lean Startup: How Today\'s Entrepreneurs Use Continuous Innovation to Create Radically Successful Businesses',
    imagen: 'assets/images/libro_canvas.jpg',
    description:
        'Este es un libro fundamental que introduce los principios de Lean Startup, que son la base del Lean Canvas',
  ),
  LibroData(
    title: 'Libro 2',
    imagen: 'assets/images/libro2_canvas.jpg',
    description:
        'Este es un libro fundamental que introduce los principios de Lean Startup, que son la base del Lean Canvas',
  ),
  LibroData(
    title: 'Libro 3',
    imagen: 'assets/images/libro_canvas.jpg',
    description:
        'Este es un libro fundamental que introduce los principios de Lean Startup, que son la base del Lean Canvas',
  ),
];
