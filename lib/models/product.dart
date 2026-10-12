// ignore_for_file: avoid_print, dead_code

void main() {
  var catatanProduk = "Stok baru datang minggu ini";
  final String kodeProduk = "SKU-07";
  const String namaToko = "Gudang Hemat Elektronik & Fashion";

  catatanProduk = "Stok sudah terverifikasi gudang";

  String namaProduk = "Keyboard Mechanical K87 RGB";
  int stokProduk = 18;
  double hargaProduk = 850000.00;
  bool statusProduk = true;

  print('----DETAIL PRODUK----');
  print('Nama Toko    : $namaToko');
  print('Kode Produk  : $kodeProduk');
  print('Catatan      : $catatanProduk');
  print('Nama Produk  : $namaProduk');
  print('Harga Produk : $hargaProduk');
  print('Stok Produk  : $stokProduk');
  print('Status Produk: ${statusProduk ? "Tersedia" : "Habis"}');

  List<String> daftarKategori = ['Elektronik', 'Fashion', 'Makanan'];
  Map<String, dynamic> produkMentah = {
    'id_produk': 207,
    'nama_produk': namaProduk,
    'harga_produk': hargaProduk,
    'stok_produk': stokProduk,
    'kategori': daftarKategori[0],
    'is_active': statusProduk,
    'tags': ['gaming', 'keyboard', 'promo-akhir-bulan']
  };

  print('\n---Koleksi Data---');
  print('Daftar Kategori : $daftarKategori');
  print('Data Mentah : $produkMentah');

  int jumlahBeli = 5;
  double totalHarga = hargaProduk * jumlahBeli; // Operator * (Perkalian)
  int sisaStok = stokProduk - jumlahBeli; // Operator - (Pengurangan)

  print('Jumlah Beli : $jumlahBeli item');
  print('Total Harga : Rp $totalHarga');
  print('Sisa Stok   : $sisaStok item');

  bool stokAman = sisaStok > 8;

  // cek apakah harga produk lebih mahal dari 500 ribu
  bool mahal = hargaProduk >= 500000;

  print('Apakah stok aman? (> 8) : $stokAman');
  print('Apakah produk mahal? (>= 500rb) : $mahal');

  // apakah produk layak ditampilkan di toko JIKA stoknya lebih dari 0 DAN statusnya aktif (true)
  bool layakTampil = (sisaStok > 0) && statusProduk;

  print('Apakah produk layak tampil di halaman utama? : $layakTampil');

  print('\n--- Langkah 3: Control Flow ---');

  // 1. If-Else: Menentukan label status stok
  String labelStok;
  if (sisaStok > 15) {
    labelStok = 'Tersedia Banyak';
  } else if (sisaStok > 0) {
    labelStok = 'Stok Terbatas';
  } else {
    labelStok = 'Habis';
  }
  print('Status Stok Saat Ini: $labelStok');

  // 2. For Loop: Menjumlahkan total belanja dari list harga
  List<double> keranjangBelanja = [850000.0, 120000.0, 45000.0];
  double totalBelanjaan = 0;
  for (int i = 0; i < keranjangBelanja.length; i++) {
    totalBelanjaan += keranjangBelanja[i];
  }
  print('\nTotal Belanjaan (For Loop): Rp $totalBelanjaan');

  // 3. While Loop: Simulasi pengurangan stok satu per satu
  int stokSimulasi = 4; // dibuat kecil agar simulasi tidak terlalu panjang
  print('\nMulai Promo Kilat!');
  while (stokSimulasi > 0) {
    print('Barang terjual 1. Sisa stok: ${stokSimulasi - 1}');
    stokSimulasi--;
  }
  print('Promo Kilat Selesai, barang habis!');

  // 4. Switch-Case: Menentukan diskon berdasarkan kategori produk
  String kategoriPromo = daftarKategori[0]; // Mengambil 'Elektronik'
  int persenDiskon;

  switch (kategoriPromo) {
    case 'Elektronik':
      persenDiskon = 10;
      break;
    case 'Fashion':
      persenDiskon = 15;
      break;
    case 'Makanan':
      persenDiskon = 5;
      break;
    default:
      persenDiskon = 0;
  }

  print('\nKategori: $kategoriPromo, Anda mendapat diskon: $persenDiskon%');

  print('\n--- Langkah 4: Functions ---');
  double hargaAwal = 300000.0;

  // Memanggil function tanpa diskon (memakai nilai default diskon = 0)
  double hargaNormal = hitungHargaSetelahDiskon(hargaAwal);

  // Memanggil function dengan named parameter diskon 20%
  double hargaDiskon = hitungHargaSetelahDiskon(hargaAwal, persenDiskon: 20);

  // Arrow function untuk format harga ke String 'Rp'
  print('Harga Awal  : ${formatRupiah(hargaAwal)}');
  print('Harga Normal: ${formatRupiah(hargaNormal)}');
  print('Harga Diskon (20%): ${formatRupiah(hargaDiskon)}');

  print('\n--- Langkah 5: OOP & Null Safety ---');

  // Objek Product biasa (description sengaja dikosongkan/null)
  Product produk1 = Product(
    id: 1,
    name: 'Keyboard Mechanical K87 RGB',
    price: 850000.0,
    imageUrl: 'keyboard.png',
    category: 'Elektronik',
    stock: 18,
  );
  produk1.displayProduct();
  print('    Status: ${produk1.getStatusStok()}');

  // Objek dari Class turunan (DiscountedProduct)
  DiscountedProduct produk2 = DiscountedProduct(
    id: 2,
    name: 'Jaket Bomber Hitam',
    price: 275000.0,
    imageUrl: 'jaket.png',
    category: 'Fashion',
    stock: 7,
    description: 'Jaket bomber bahan tebal cocok dipakai di cuaca dingin',
    discountPercent: 25,
  );
  produk2.displayProduct();
  print('    Status: ${produk2.getStatusStok()}');

  // ===== TUGAS MANDIRI =====
  print('\n--- Tugas Mandiri ---');

  // Tugas 2: List<Product> berisi minimal 8 produk dummy
  List<Product> daftarProduk = [
    Product(id: 1, name: 'Keyboard Mechanical K87 RGB', price: 850000.0, imageUrl: 'keyboard.png', category: 'Elektronik', stock: 18),
    Product(id: 2, name: 'Jaket Bomber Hitam', price: 275000.0, imageUrl: 'jaket.png', category: 'Fashion', stock: 7, description: 'Jaket bomber bahan tebal'),
    Product(id: 3, name: 'Keripik Tempe Original', price: 18000.0, imageUrl: 'keripik.png', category: 'Makanan', stock: 40),
    Product(id: 4, name: 'Mouse Gaming Wireless', price: 165000.0, imageUrl: 'mouse.png', category: 'Elektronik', stock: 4, description: 'Sensor presisi tinggi, baterai tahan lama'),
    Product(id: 5, name: 'Sweater Rajut', price: 190000.0, imageUrl: 'sweater.png', category: 'Fashion', stock: 0),
    Product(id: 6, name: 'Teh Celup Premium', price: 32000.0, imageUrl: 'teh.png', category: 'Makanan', stock: 25),
    Product(id: 7, name: 'Webcam Full HD', price: 220000.0, imageUrl: 'webcam.png', category: 'Elektronik', stock: 3, description: 'Cocok untuk meeting & live streaming'),
    Product(id: 8, name: 'Tas Selempang Kanvas', price: 135000.0, imageUrl: 'tas.png', category: 'Fashion', stock: 14, description: 'Bahan kanvas kuat, tahan lama'),
  ];

  print('\nDaftar 8 Produk Gudang Hemat:');
  for (var p in daftarProduk) {
    // Tugas 1: Menggunakan method getStatusStok()
    print('  [${p.id}] ${p.name} - ${formatRupiah(p.price)} | Stok: ${p.stock} -> ${p.getStatusStok()}');
  }

  // Tugas 3: Function hitungTotalBelanja
  // Simulasi keranjang belanja: ambil produk ke-1, 4, dan 6
  List<Product> keranjang = [daftarProduk[1], daftarProduk[4], daftarProduk[6]];
  double totalKeranjang = hitungTotalBelanja(keranjang);

  print('\nKeranjang Belanja:');
  for (var item in keranjang) {
    print('  - ${item.name}: ${formatRupiah(item.price)}');
  }
  print('Total Belanja: ${formatRupiah(totalKeranjang)}');
} // Akhir dari fungsi main()

// --- Function untuk Langkah 4 (di LUAR fungsi main) ---

// 1 & 2. Function biasa dengan Named Parameter (persenDiskon default-nya 0)
double hitungHargaSetelahDiskon(double harga, {int persenDiskon = 0}) {
  double nominalDiskon = harga * (persenDiskon / 100);
  return harga - nominalDiskon;
}

// 3. Arrow Function (function ringkas satu baris)
String formatRupiah(double harga) => 'Rp ${harga.toStringAsFixed(0)}';

// Tugas Mandiri 3: Function untuk menghitung total belanja dari list produk
double hitungTotalBelanja(List<Product> keranjang) {
  double total = 0;
  for (var produk in keranjang) {
    total += produk.price;
  }
  return total;
}

// --- Langkah 5: Class & Null Safety (di LUAR main) ---

class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  final int stock;
  // Null Safety: String? artinya variabel ini boleh kosong (null)
  final String? description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.stock,
    this.description, // tidak wajib diisi karena nullable
  });

  // Tugas Mandiri 1: Method getStatusStok()
  String getStatusStok() {
    if (stock > 10) {
      return 'Tersedia Banyak';
    } else if (stock > 0) {
      return 'Stok Terbatas';
    } else {
      return 'Habis';
    }
  }

  void displayProduct() {
    print('[$id] $name - Rp $price | Kategori: $category | Stok: $stock');
    if (description != null) {
      print('    Deskripsi: $description');
    }
  }
}

// Inheritance: DiscountedProduct adalah turunan dari Product
class DiscountedProduct extends Product {
  final double discountPercent;

  DiscountedProduct({
    required super.id,
    required super.name,
    required super.price,
    required super.imageUrl,
    required super.category,
    required super.stock,
    super.description,
    required this.discountPercent,
  });

  // Getter untuk menghitung harga setelah diskon
  double get discountedPrice {
    return price - (price * (discountPercent / 100));
  }

  // Override method dari class induk (Product)
  @override
  void displayProduct() {
    super.displayProduct();
    print('    Diskon: $discountPercent% -> Harga Final: Rp $discountedPrice');
  }
}