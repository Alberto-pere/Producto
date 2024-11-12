import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'payment_screen.dart'; // Importamos la nueva pantalla de pago

class CatalogScreen extends StatelessWidget {
  final List<Section> sections = [
    Section(
      name: 'Talavera',
      products: [
        Product(
          name: 'Jarron de Talavera 1',
          imageUrl: 'assets/talavera1.jpg',
          price: 150.0,
        ),
        Product(
          name: 'Basija y taza de Talavera',
          imageUrl: 'assets/Jarron.jpg',
          price: 160.0,
        ),
        Product(
          name: 'Pulsera de Talavera',
          imageUrl: 'assets/pulsera.jpg',
          price: 60.0,
        ),
      ],
    ),
    Section(
      name: 'Cerámica',
      products: [
        Product(
          name: 'Cantarito de Cerámica 1',
          imageUrl: 'assets/ceramica1.jpg',
          price: 40.0,
        ),
        Product(
          name: 'Macetas de Cerámica',
          imageUrl: 'assets/macetas.jpg',
          price: 75.0,
        ),
        Product(
          name: 'Jarron de ceramica',
          imageUrl: 'assets/ceramica5.jpg',
          price: 60.0,
        ),
        Product(
          name: 'Tetera de ceramica',
          imageUrl: 'assets/ceramica4.jpg',
          price: 80.0,
        ),
        Product(
          name: 'Jarra de ceramica',
          imageUrl: 'assets/ceramica3.jpg',
          price: 120.0,
        ),
        Product(
          name: 'Macetero de ceramica',
          imageUrl: 'assets/ceramica2.jpg',
          price: 250.0,
        ),
      ],
    ),
    Section(
      name: 'Mármol',
      products: [
        Product(
          name: 'Azulejo para piso de Mármol 1',
          imageUrl: 'assets/marmol1.jpg',
          price: 60.0,
        ),
        Product(
          name: 'Lavadero de Mármol',
          imageUrl: 'assets/lavadero.jpg',
          price: 6000.0,
        ),
        Product(
          name: 'florero',
          imageUrl: 'assets/marmol2.jpg',
          price: 100.0,
        ),
        Product(
          name: 'reloj de marmol',
          imageUrl: 'assets/marmol6.jpg',
          price: 400.0,
        ),
        Product(
          name: 'portabasos de marmol',
          imageUrl: 'assets/marmol5.jpg',
          price: 180.0,
        ),
        Product(
          name: 'Esfera de marmol',
          imageUrl: 'assets/marmol4.jpg',
          price: 75.0,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Productos'),
      ),
      backgroundColor:
          const Color.fromARGB(255, 238, 146, 112), // Color café claro de fondo
      body: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index) {
          return SectionWidget(section: sections[index]);
        },
      ),
    );
  }
}

class Section {
  final String name;
  final List<Product> products;

  Section({required this.name, required this.products});
}

class Product {
  final String name;
  final String imageUrl;
  final double price;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
  });
}

class SectionWidget extends StatelessWidget {
  final Section section;

  SectionWidget({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(section.name),
      children: section.products.map((product) {
        return ProductWidget(product: product);
      }).toList(),
    );
  }
}

class ProductWidget extends StatefulWidget {
  final Product product;

  const ProductWidget({required this.product});

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  bool _isButtonPressed = false;

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: ListTile(
        leading: MouseRegion(
          onEnter: (_) {
            setState(() {
              _isHovered = true;
            });
          },
          onExit: (_) {
            setState(() {
              _isHovered = false;
            });
          },
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _isHovered ? 1.0 : 0.6,
            child:
                Image.asset(widget.product.imageUrl, width: 100, height: 100),
          ),
        ),
        title: Text(widget.product.name),
        subtitle: Text('\$${widget.product.price}'),
        trailing: GestureDetector(
          onTapDown: (_) {
            _animationController.forward(); // Iniciar la animación de escala
            setState(() {
              _isButtonPressed = true;
            });
          },
          onTapUp: (_) {
            _animationController.reverse(); // Volver al tamaño original
            setState(() {
              _isButtonPressed = false;
            });

            // Redirigir a la pantalla de pago
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentScreen(
                  productName: widget.product.name,
                  productPrice: widget.product.price,
                  imageUrl: widget.product.imageUrl,
                  selectedProducts: [], // Pasar la URL de la imagen
                ),
              ),
            );
          },
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: _isButtonPressed
                    ? const Color.fromARGB(255, 252, 238, 237)
                    : Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 231, 225, 225),
                  shadowColor: const Color.fromARGB(235, 235, 229, 229),
                ),
                onPressed: null,
                child: const Text('Comprar'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

