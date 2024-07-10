class PresentationData {
  String? title;
  String? description;
  String? image;

  PresentationData({
    this.title,
    this.description,
    this.image,
  });

  static List<PresentationData> getPresentationDatas() {
    return [
      PresentationData(
        title: 'Bienvenido y conoce a Lean Canvas',
        description:
            'Transforma tu idea en negocio sólido con nuestro enfoque estructurado y visual.',
        image: 'assets/images/welcome.svg',
      ),
      PresentationData(
        title: 'Descubre los Beneficios de Lean Canvas',
        description:
            'Simplifica la planificación y enfócate en lo que realmente importa para tu negocio.',
        image: 'assets/images/benefits.svg',
      ),
      PresentationData(
        title: 'Empieza a Crear tu Lean Canvas',
        description:
            'Completa los 9 bloques  esenciales para darle vida a tu idea de negocio',
        image: 'assets/images/start.svg',
      ),
    ];
  }
}
