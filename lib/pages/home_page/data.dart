class LibroData {
  final String title;
  final String imagen;
  final String description;
  final String author;
  final String category;

  const LibroData({
    required this.title,
    required this.imagen,
    required this.description,
    required this.author,
    required this.category,
  });
}

const List<LibroData> libroData = [
  LibroData(
    title:
        'The Lean Startup: How Today\'s Entrepreneurs Use Continuous Innovation to Create Radically Successful Businesses',
    imagen: 'assets/images/libro_canvas.jpg',
    description:
        'Es un libro de Eric Ries que introduce un enfoque innovador para desarrollar productos y negocios en condiciones de incertidumbre. Ries propone el método Lean Startup, que se basa en la creación rápida de prototipos, la validación de ideas a través de experimentos y la obtención de retroalimentación directa de los clientes. El objetivo es reducir el riesgo de fracaso y maximizar el aprendizaje, permitiendo a las startups adaptarse y evolucionar rápidamente. El libro enfatiza la importancia de medir el progreso de manera efectiva y pivotar cuando sea necesario, brindando un marco práctico para emprendedores que buscan construir empresas sostenibles y exitosas.',
    author: 'Eric Ries',
    category: 'Emprendimiento / Negocios / Innovación',
  ),
  LibroData(
    title: 'Running Lean: Cómo iterar de un plan A a un plan que funcione',
    imagen: 'assets/images/libro2_canvas.jpg',
    description:
        'Escrito por Ash Maurya que se enfoca en cómo los emprendedores y las startups pueden convertir sus ideas iniciales en negocios exitosos mediante la validación continua y la iteración. El autor presenta un enfoque práctico y sistemático basado en el método Lean Startup, que incluye la creación de hipótesis, la realización de experimentos y la obtención de retroalimentación constante del mercado. A través de herramientas como el Lean Canvas, Maurya guía a los lectores a identificar y solucionar problemas críticos, reducir el riesgo y maximizar las oportunidades de éxito.',
    author: 'Ash Maurya',
    category: 'Emprendimiento / Negocios / Metodologías Lean',
  ),
  LibroData(
    title:
        'Lean Enterprise: How High Performance Organizations Innovate at Scale – Sample Chapters',
    imagen: 'assets/images/enterprise.jpeg',
    description:
        'Es un libro que aborda cómo las organizaciones de alto rendimiento pueden innovar de manera efectiva y sostenible a gran escala utilizando principios Lean. Los autores, Jez Humble, Joanne Molesky y Barry OReilly, ofrecen una guía práctica para implementar metodologías Lean y Agile en el contexto empresarial, enfocándose en mejorar la eficiencia operativa, la velocidad de desarrollo y la capacidad de adaptación al cambio. El libro se basa en estudios de casos reales y proporciona herramientas y estrategias para líderes empresariales que buscan fomentar una cultura de mejora continua e innovación dentro de sus organizaciones.',
    author: 'Jez Humble, Joanne Molesky, Barry O\'Reilly',
    category: 'Negocios / Gestión / Innovación',
  ),
];
