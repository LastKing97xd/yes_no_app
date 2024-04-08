import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              'Laborum proident sint enim non exercitation in quis culpa aute commodo eu dolor. Minim amet aute sint adipisicing occaecat nulla cillum tempor quis quis. In aliquip ut proident ea ad aute laborum magna et ad deserunt minim exercitation Lorem. Veniam nostrud et culpa nulla commodo reprehenderit eu.',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10),

        _ImageBubble(),
        //Espacio de separacion para abajo
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //print(size);

    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          'https://yesno.wtf/assets/yes/8-2f93962e2ab24427df8589131da01a4d.gif',
          width: size.width * 0.8,
          height: 120,
          fit: BoxFit.cover,
          // Se ira construyendo :/
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return Container(
              width: size.width * 0.8,
              height: 120,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: const Text('Escribiendo...'),
            );
          },
        ));
  }
}
