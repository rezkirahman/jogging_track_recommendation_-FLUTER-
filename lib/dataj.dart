List<double> jarak = [];
List<double> track = [];
List<double> rating = [];

class Dataj {
  int id;
  String nama, alamat, jamoperasional, gambar;
  double rating, panjangtrack, longitude, latitude;


  Dataj(
      {this.id,
      this.nama,
      this.alamat,
      this.jamoperasional,
      this.gambar,
      this.rating,
      this.panjangtrack,
      this.longitude,
      this.latitude});
}

List<Dataj> dataj = [
  Dataj(
    id: 1,
    nama: "Taman Trunojoyo",
    alamat: "Jl. Trunojoyo, Klojen, Kec. Klojen, Kota Malang, Jawa Timur 65111",
    jamoperasional: "buka 24 jam",
    gambar: "img/track/tamantrunojoyo.jpg",
    rating: 4.3,
    panjangtrack: 0.3,
    longitude: 112.636546,
    latitude: -7.976366,
  ),
  Dataj(
    id: 2,
    nama: "Taman Singha Merjosari",
    alamat:
        "Jl. Mertojoyo Selatan Blk. B No.20, Merjosari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144",
    jamoperasional: "buka 24 jam",
    gambar: "img/track/tamansinghamerjosari.jpg",
    rating: 4.4,
    panjangtrack: 0.5,
    longitude: 112.60374,
    latitude: -7.94529,
  ),
  Dataj(
    id: 3,
    nama: "Taman Slamet",
    alamat:
        "Jl. Taman Slamet No.8, Gading Kasri, Kec. Klojen, Kota Malang, Jawa Timur 65115",
    jamoperasional: "buka 24 jam",
    gambar: "img/track/tamanslamet.jpg",
    rating: 4.3,
    panjangtrack: 0.3,
    longitude: 112.622399,
    latitude: -7.973727,
  ),
  Dataj(
    id: 4,
    nama: "Taman Merbabu",
    alamat:
        "Jl. Merbabu, Oro-oro Dowo, Kec. Klojen, Kota Malang, Jawa Timur 65119",
    jamoperasional: "buka 24 jam",
    gambar: "img/track/tamanmerbabu.jpg",
    rating: 4.4,
    panjangtrack: 0.2,
    longitude: 112.625884,
    latitude: -7.967952,
  ),
  Dataj(
    id: 5,
    nama: "Taman Idjen Boulevard",
    alamat:
        "Jl. Besar Ijen, Oro-oro Dowo, Kec. Klojen, Kota Malang, Jawa Timur 65115",
    jamoperasional: "buka 24 jam",
    gambar: "img/track/tamanidjenboulevard.jpeg",
    rating: 4.6,
    panjangtrack: 1.4,
    longitude: 112.621754,
    latitude: -7.972298,
  ),
  Dataj(
    id: 6,
    nama: "Velodrom",
    alamat:
        "Jl. Danau jonge no. 1 velodrome, Sawojajar, Kec. Kedungkandang, Kota Malang, Jawa Timur 65139",
    jamoperasional: "buka 24 jam",
    gambar: "img/track/velodrom.jpg",
    rating: 4.2,
    panjangtrack: 0.5,
    longitude: 112.670009,
    latitude: -7.9730,
  ),
  Dataj(
    id: 7,
    nama: "Lapangan Rampal",
    alamat: "Jl. Lapangan Rampal, Blimbing, Kota Malang, Jawa Timur 65126",
    jamoperasional: "buka 24 jam",
    gambar: "img/track/lapanganrampal.jpg",
    rating: 4.5,
    panjangtrack: 1.5,
    longitude: 112.640799,
    latitude: -7.973571,
  ),
  Dataj(
    id: 8,
    nama: "Malabar State Park",
    alamat:
        "Jl. Malabar, Oro-oro Dowo, Kec. Klojen, Kota Malang, Jawa Timur 65119",
    jamoperasional: "buka 24 jam",
    gambar: "img/track/malabarstatepark.jpg",
    rating: 4.3,
    panjangtrack: 0.5,
    longitude: 112.626643,
    latitude: -7.968298,
  ),
  Dataj(
    id: 9,
    nama: "Taman Cerme",
    alamat:
        "Jl. Merbabu No.4, Oro-oro Dowo, Kec. Klojen, Kota Malang, Jawa Timur 65119",
    jamoperasional: "buka 24 jam",
    gambar: "img/track/tamancerme.jpg",
    rating: 4.3,
    panjangtrack: 0.1,
    longitude: 112.62531,
    latitude: -7.9703,
  ),
  Dataj(
    id: 10,
    nama: "Alun-alun Tugu Malang",
    alamat: "Jl. Tugu, Kiduldalem, Kec. Klojen, Kota Malang, Jawa Timur 65111",
    jamoperasional: "buka 24 jam",
    gambar: "img/track/tugumalang.jpg",
    rating: 4.5,
    panjangtrack: 0.6,
    longitude: 112.634053,
    latitude: -7.977122,
  ),
  Dataj(
    id: 11,
    nama: "Alun-alun Kota Malang",
    alamat:
        "Jl. Merdeka Selatan, Kiduldalem, Kec. Klojen, Kota Malang, Jawa Timur 65119",
    jamoperasional: "buka 24 jam",
    gambar: "img/track/alunalunmalang.jpg",
    rating: 4.5,
    panjangtrack: 0.5,
    longitude: 112.630887,
    latitude: -7.982477,
  ),
  Dataj(
    id: 12,
    nama: "Perumahan Bukit Tidar",
    alamat: "Merjosari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144",
    jamoperasional: "buka 24 jam",
    gambar: "img/track/perumahanbukittidar.jpg",
    rating: 4.2,
    panjangtrack: 0.4,
    longitude: 112.592878,
    latitude: -7.953897,
  ),
  Dataj(
    id: 13,
    nama: "Perumahan Citra Garden City",
    alamat:
        "Jalan The Hill Boulevard CitraGarden City, Buring, Kec. Kedungkandang, Kota Malang, Jawa Timur 65139",
    jamoperasional: "buka 24 jam",
    gambar: "img/track/perumahancitragardencity.jpg",
    rating: 4.3,
    panjangtrack: 1.4,
    longitude: 112.648065,
    latitude: -8.011534,
  ),
  Dataj(
    id: 14,
    nama: "Bridge Town Tidar",
    alamat:
        "Jalan Villa Tidar Estate No.ai 16, Karang Tengah, Karangwidoro, Kec. Dau, Malang, Jawa Timur 65151",
    jamoperasional: "08.00 - 16.00 WIB",
    gambar: "img/track/bridgetowntidar.jpg",
    rating: 4.3,
    panjangtrack: 1,
    longitude: 112.578165,
    latitude: -7.951059,
  ),
  Dataj(
    id: 15,
    nama: "Taman Kunang-kunang",
    alamat:
        "Jalan Jakarta Oro-oro Dowo, Penanggungan, Kec. Klojen, Kota Malang, Jawa Timur 65113",
    jamoperasional: "buka 24 jam",
    gambar: "img/track/tamankunangkunang.jpg",
    rating: 4.2,
    panjangtrack: 1.1,
    longitude: 112.623606,
    latitude: -7.963155,
  ),
];
