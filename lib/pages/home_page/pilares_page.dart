import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PilaresPage extends StatelessWidget {
  PilaresPage({super.key});

  final List<Map<String, String>> cardContents = [
    {
      'title': '#1 – Problema',
      'content':
          'El problema que resuelve tu producto o servicio es tu razón de ser como negocio, así que ten claro a qué problema o problemas le estás dando solución. Se recomienda detectar los 3 principales problemas de tu público objetivo relacionados con tu campo de acción.',
      'image': 'assets/images/pensando2.png',
    },
    {
      'title': '#2 – Solución',
      'content':
          'La solución que das a esos problemas está materializada en tu producto o servicio. Si detectas adecuadamente los problemas, podrás afinar mucho mejor la solución que ofreces. Céntrate en desarrollar óptimamente las 3 características de tu producto o servicio que van a permitirte dar una solución a los problemas detectados, y deja el resto para más adelante.',
      'image': 'assets/images/bombilla2.png',
    },
    {
      'title': '#3 – Segmentos de clientes',
      'content':
          'Define cuáles son los segmentos de clientes que sufren los problemas detectados y a quienes tu producto o servicio puede dar solución. Ash Maurya destaca aquí la importancia de la detección y ataque de los clientes que pueden convertirse en early adopters, porque son ellos los más susceptibles de empezar a usar nuestro producto o servicio y dar ejemplo al resto del mercado o instaurar una tendencia.',
      'image': 'assets/images/personas2.png',
    },
    {
      'title': '#4 – Proposición de valor única',
      'content':
          'La proposición de valor única es el beneficio diferencial que ofrece tu producto o servicio con respecto a otras soluciones parecidas del mercado. Es el reason why por el que los clientes van a interesarse en la solución que plantea tu producto o servicio, y no en soluciones similares.',
      'image': 'assets/images/sobresale2.jpg',
    },
    {
      'title': '#5 – Ventaja única o especial',
      'content':
          'Es aquello que te hace estar un paso por delante de tus competidores, y que es muy difícil o imposible de copiar o imitar. Puede ser un diseño exclusivo, una patente, barreras de entrada muy difíciles de penetrar, una tecnología específica, etc.',
      'image': 'assets/images/pordelante3.png',
    },
    {
      'title': '#6 – Canales',
      'content':
          'Los canales son tu medio de acceso hacia los clientes. ¿A través de qué canales vas a vender? ¿A través de qué canales vas a comunicarte con qué segmentos de clientes? ¿A través de qué canales vas a captar a nuevos clientes? Ten en cuenta que tu estrategia de canales debe abarcar la customer experience al completo, y no sólo la fase de venta.',
      'image': 'assets/images/redessociales3.png',
    },
    {
      'title': '#7 – Estructura de costes',
      'content':
          'Aquí debemos recoger todo lo que nos va a generar gasto en el lanzamiento y puesta en marcha del negocio, incluyendo (aunque no exclusivamente):\n\n- Costes de adquisición de clientes\n- Personal (externos y contratados)\n- Compra de stock/materia prima\n- Alquileres\n- Material de oficina\n- Logística y almacén\n- Hosting y diseño web\n- Tecnología\n- Etc.',
    },
    {
      'title': '#8 – Flujo de ingresos',
      'content':
          'En este apartado debemos definir cómo va a ganar dinero nuestra startup. Aquí es donde debemos plantear las modalidades de compra / suscripción / alquiler, la estrategia de recurrencia, las barreras de salida, el margen comercial, ticket medio y valor del cliente, etc.',
      'image': 'assets/images/grafico4.png',
    },
    {
      'title': '#9 – Métricas clave',
      'content':
          'Finalmente, una vez definido todo lo anterior, tenemos que determinar nuestros KPIs o Key Performance Indicators. Hay que definir pocos KPIs pero asegurarnos de que los datos que ofrecen son muy relevantes, porque deberán guiarnos en nuestra fase startup y decirnos si vamos bien o hay que pivotar.\n\n¿Te animas a probar el Lean Canvas para visualizar tu negocio y actuar en consecuencia? Te recomendamos encarecidamente esta herramienta si eres pequeño o justo empiezas. ¡Cuéntanos cómo te va en los comentarios!',
    },
  ];

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilares'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: cardContents.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            cardContents[index]['title']!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          if (cardContents[index]['image'] != null &&
                              cardContents[index]['image']!.isNotEmpty)
                            Column(
                              children: [
                                Image.asset(
                                  cardContents[index]['image']!,
                                  height: 180, // Altura
                                  width: 200, // Ancho
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(height: 10),
                              ],
                            )
                          else
                            const SizedBox(height: 50),
                          Text(
                            cardContents[index]['content']!,
                            style: const TextStyle(fontSize: 14),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: cardContents.length,
              effect: const WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                spacing: 8,
                dotColor: Colors.grey,
                activeDotColor: Colors.blue,
              ),
              onDotClicked: (index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
