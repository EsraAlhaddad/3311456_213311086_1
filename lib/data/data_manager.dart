import 'package:traveller/models/cities_model.dart';
import 'package:traveller/models/content_model.dart';

class DataManager {
  static List<CitiesModel> Details = [
    CitiesModel(
      id: 0,
      mainImage: 'images/istanbul.jpg',
      title: " İstanbul",
      starCount: '3.0',
      discription: "Istanbul  is a mega city that sits in both Europe and Asia,"
          "divided by the Bosporus. Although it is the largest city of Turkey,"
          " it is not the capital. It is the largest city in Europe by population."
          " It is also the 3rd largest European city in size. It was the capital city of the old Ottoman Empire until 1923. "
          "The city has been known since ancient times by the older names Byzantium and Constantinople Being a seaport, "
          "Istanbul is the main trade center of Turkey.",
    ),
    CitiesModel(
      id: 1,
      mainImage: 'images/konya.jpg',
      title: " Konya",
      discription: "Konya  is a major city in central Turkey,"
          " on the southwestern edge of the Central Anatolian Plateau,"
          " and is the capital of Konya Province."
          " During antiquity and into Seljuk times it was known as Iconium ."
          " In 19th-century accounts of the city in English its name is usually spelt Konia or Koniah."
          " In the late medieval period, Konya was the capital of the Seljuk Turks' Sultanate of Rum,"
          "from where they ruled over Anatolia.",
      starCount: '4.0',
    ),
    CitiesModel(
      starCount: '1.0',
      id: 2,
      mainImage: 'images/izmir.jpg',
      title: " İzmir",
      discription:
          "Izmir is a metropolitan city in the western extremity of Turkey and"
          "the third most populous city in Turkey, after Istanbul and Izmir."
          "Once the ancient city of Smyrna, İzmir is now a modern,"
          " developed,and busy commercial center, set around a huge bay and surrounded by mountains."
          " The broad boulevards, glass-fronted buildings and modern shopping centers are dotted with"
          " traditional red-tiled roofs, the 18th century market, "
          "and old mosques and churches, although the city has an atmosphere more of"
          " Mediterranean Europe than traditional Turkey.",
    ),
    CitiesModel(
      starCount: '3.0',
      id: 3,
      mainImage: 'images/ankara.jpg',
      title: " Ankara",
      discription: "Ankara is the capital city of Turkey and the country's"
          " second largest city after Istanbul. "
          "The city has a population (as of 2019) of 5,5 million,"
          " and a mean elevation of 850 m (2800 ft). It was formerly known as Angora. "
          "The Hittites gave it the name Ankuwash before 1200 BC, "
          "the Galatians and Romans called it Ancyra, and in the classical,"
          " Hellenistic, and Byzantine periods it was known as Ánkyra. "
          "Ankara also serves as the capital of the Province of Ankara.",
    ),
    CitiesModel(
      id: 4,
      mainImage: 'images/trabzon.jpg',
      title: " Trabzon",
      starCount: '5.0',
      discription: "Trabzon ,  is a city on the Black Sea coast of northeastern"
          " Turkey and the capital of Trabzon Province."
          " Trabzon, located on the historical Silk Road, became a melting pot of religions,"
          " languages and culture for centuries and a trade gateway to Persia in the southeast"
          " and the Caucasus to the northeast. ",
    ),
    CitiesModel(
      id: 5,
      mainImage: 'images/antalya.jpg',
      title: " Antalya",
      starCount: '4.0',
      discription: "Antalya  is the fifth-most populous city in Turkey "
          "as well as the capital of Antalya Province. It is seen as the capital of tourism"
          " in Turkey.Located on Anatolia's southwest coast bordered by the Taurus Mountains,"
          " Antalya is the largest Turkish city on the Mediterranean coast outside"
          "the Aegean region with over one million people in its metropolitan area.",
    ),
  ];
  static List<UnbordingContent> contents = [
    UnbordingContent(
        id: 0,
        title: "Welcome To Traveller!",
        image: "images/logo.png",
        discription: "How would you like to take a trip with us? ^_~"),
    UnbordingContent(
        id: 1,
        title: "Well, what are you waiting for!",
        image: "images/screen_2.jpg",
        discription: "All You Have To Do Is Register With Traveller"),
    UnbordingContent(
        id: 2,
        title: "We wish you a good trip in advance",
        image: "images/screen_3.jpg",
        discription: "Don't Forget Us While Traveling (:"),
  ];
}
