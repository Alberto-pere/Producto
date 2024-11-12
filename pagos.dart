import 'package:flutter/material.dart';
import 'personal_detailsform.dart'; // Importa la nueva pantalla

class PaymentScreen extends StatelessWidget {
  final String productName;
  final double productPrice;
  final String imageUrl;

  PaymentScreen({
    required this.productName,
    required this.productPrice,
    required this.imageUrl,
    required List selectedProducts,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Método de Pago'),
      ),
      backgroundColor:
          const Color.fromARGB(255, 243, 154, 134), // Color café oscuro
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imageUrl,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Text(
                'Producto: $productName',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Precio: \$${productPrice.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 24),
              const Text(
                'Seleccione su método de pago',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PersonalDetailsForm(),
                    ),
                  );
                },
                child: const Text('Pagar ahora'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
