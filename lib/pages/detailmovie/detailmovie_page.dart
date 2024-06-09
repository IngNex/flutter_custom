import 'package:flutter/material.dart';

class DetailMoviePage extends StatelessWidget {
  const DetailMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    String title = "Wolverine & Deadpool";
    String info = "Estreno solo en cines - 26 de julio de 2024";
    String description =
        "Lobezno se recupera de sus heridas cuando se cruza con el bocazas, Deadpool, que ha viajado en el tiempo para curarlo con la esperanza de hacerse amigos y formar un equipo para acabar con un enemigo común.";
    String trailer = "Trailer";
    String sinopsis = "Sinopsis";
    String similar = "Similar";

    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 2, 3, 1),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 360,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/movie/wolverine_deadpool.jpg"),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  height: 360,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(5, 2, 3, 0),
                        Color.fromRGBO(5, 2, 3, 0.25),
                        Color.fromRGBO(5, 2, 3, 0.75),
                        Color.fromRGBO(5, 2, 3, 1),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            info,
            style: const TextStyle(fontSize: 11, color: Colors.white),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Play",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              Container(
                width: 150,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    borderRadius: BorderRadius.circular(20)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.download,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Download",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              description,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                trailer,
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold),
              ),
              Text(
                sinopsis,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                similar,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(10, 11, 26, 1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0.5, 0.5))
                  ]),
              child: Row(
                children: [
                  Container(
                    width: 135,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            AssetImage("assets/movie/deadpool_wolverine.jpg"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              trailer,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              "ver",
                              style:
                                  TextStyle(fontSize: 11, color: Colors.white),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          description,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
