import 'package:flutter/material.dart';

class StylistsSection extends StatelessWidget {
  const StylistsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Estilistas',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 70,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 70,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://navarra.okdiario.com/asset/thumbnail,992,558,center,center/media/navarra/images/2022/02/28/2022022816392875963.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://diariocronica-s2.cdn.net.ar/st2i1700/2023/05/diariocronica/images/51/86/518621_7b06a0319ecb8efb40bdc7b49060cb5bccab1dd92bf45e517a412dec665c3e8f/lg.webp'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://elements-video-cover-images-0.imgix.net/files/226053744/preview.jpg?auto=compress&crop=edges&fit=crop&fm=jpeg&h=630&w=1200&s=149cb5954b64bb297ee7a200e2c3e2a9'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://elements-video-cover-images-0.imgix.net/files/226053744/preview.jpg?auto=compress&crop=edges&fit=crop&fm=jpeg&h=630&w=1200&s=149cb5954b64bb297ee7a200e2c3e2a9'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://elements-video-cover-images-0.imgix.net/files/226053744/preview.jpg?auto=compress&crop=edges&fit=crop&fm=jpeg&h=630&w=1200&s=149cb5954b64bb297ee7a200e2c3e2a9'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://elements-video-cover-images-0.imgix.net/files/226053744/preview.jpg?auto=compress&crop=edges&fit=crop&fm=jpeg&h=630&w=1200&s=149cb5954b64bb297ee7a200e2c3e2a9'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
