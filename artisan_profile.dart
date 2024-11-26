import 'package:flutter/material.dart';

class ArtisanProfilesScreen extends StatelessWidget {
  final List<Artisan> artisans = [
    Artisan(
      name: 'Juan Perez',
      bio: 'Maestro en Talavera',
      description:
          'Juan ha perfeccionado el arte de la Talavera por más de 20 años, creando piezas únicas que reflejan la tradición y el talento artesanal de Puebla.',
      imageUrl: 'assets/perfil1.jpg',
      contactInfo: 'juan.perez@example.com, 2218253098',
    ),
    Artisan(
      name: 'Maria Lopez',
      bio: 'Ceramista',
      description:
          'María es una ceramista apasionada que utiliza técnicas tradicionales para crear obras de arte contemporáneas. Sus piezas son conocidas por su durabilidad y belleza estética.',
      imageUrl: 'assets/perfil3.jpg',
      contactInfo: 'maria.lopez@example.com, 2215397250',
    ),
    Artisan(
      name: 'Carlos Martinez',
      bio: 'Trabajador del Mármol',
      description:
          'Carlos es un experto en el trabajo con mármol, transformando bloques de piedra en impresionantes obras de arte. Su dedicación y precisión se reflejan en cada detalle de sus creaciones.',
      imageUrl: 'assets/perfil2.jpg',
      contactInfo: 'carlos.martinez@example.com, 2239762012',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfiles de Artesanos'),
      ),
      body: ListView.builder(
        itemCount: artisans.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading:
                Image.asset(artisans[index].imageUrl, width: 50, height: 50),
            title: Text(artisans[index].name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(artisans[index].bio),
                const SizedBox(height: 4),
                Text(artisans[index].description),
                const SizedBox(height: 4),
                ElevatedButton(
                  onPressed: () {
                    _showContactDialog(context, artisans[index]);
                  },
                  child: const Text('Contactar'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showContactDialog(BuildContext context, Artisan artisan) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Contactar a ${artisan.name}'),
          content: Text(
              'Puedes contactar a ${artisan.name} en: ${artisan.contactInfo}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}

class Artisan {
  final String name;
  final String bio;
  final String description;
  final String imageUrl;
  final String contactInfo;

  Artisan({
    required this.name,
    required this.bio,
    required this.description,
    required this.imageUrl,
    required this.contactInfo,
  });
}
