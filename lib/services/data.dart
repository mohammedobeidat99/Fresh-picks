
import 'package:fresh_picks/consts/images.dart';
import 'package:fresh_picks/models/category.dart';
import 'package:fresh_picks/models/product%20.dart';

List<Category> categories = [
  Category(
    id: '1',
    name: 'Android Phones',
    image: imgAndroid,
    products: [
      Product(id: '1', name: 'Galaxy S24', price: 999.0, image: samsung, city: 'Al-Balqa', urlMap: 'https://maps.app.goo.gl/XXQRhmSxDj1VDeui9', storeName: 'الزهور للاجهزة الكهربائية',storeDis: '6 km'),
      Product(id: '2', name: 'Samsung A72', price: 319.0, image: samsung1, city: 'Al-Balqa', urlMap: 'https://maps.app.goo.gl/XXQRhmSxDj1VDeui9', storeName: 'Smart home' ,storeDis: '3.4 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipPDhzf9TP-PdptgowRJS5T8rA_X04HltG_1aWoB=w424-h240-k-no'),
      Product(id: '3', name: 'Oppo Reno 5', price: 249.0, image: oppo, city: 'Al-Balqa', urlMap: 'https://maps.app.goo.gl/XXQRhmSxDj1VDeui9', storeName: 'Smart home',storeDis: '3.4 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipPDhzf9TP-PdptgowRJS5T8rA_X04HltG_1aWoB=w424-h240-k-no'),
      // Additional Products
      Product(id: '19', name: 'Xiaomi Mi 11', price: 599.0, image: xiaomi, city: 'Al-Balqa', urlMap: 'https://maps.app.goo.gl/XXQRhmSxDj1VDeui9', storeName: 'Smart home',storeDis: '3.4 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipPDhzf9TP-PdptgowRJS5T8rA_X04HltG_1aWoB=w424-h240-k-no'),
      Product(id: '20', name: 'OnePlus 9', price: 729.0, image: oneplus, city: 'Al-Balqa', urlMap: 'https://maps.app.goo.gl/XXQRhmSxDj1VDeui9', storeName: 'Smart home' ,storeDis: '3.4 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipPDhzf9TP-PdptgowRJS5T8rA_X04HltG_1aWoB=w424-h240-k-no'),
    ],
  ),
  Category(
    id: '2',
    name: 'Apple Phones',
    image: imgApple,
    products: [
      Product(id: '4', name: 'iPhone 15 Pro Max', price: 999.0, image: promax15, city: 'Amman', urlMap: 'https://maps.app.goo.gl/XXQRhmSxDj1VDeui9', storeName: 'iService', storeDis: '7 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipP_u-cEeI0A0j2q3_7AFt47-oWvbVpMjb-vJa-3=w408-h544-k-no'),
      Product(id: '5', name: 'iPhone 14 Pro Max', price: 860.0, image: promax14, city: 'Amman', urlMap: 'https://maps.app.goo.gl/XXQRhmSxDj1VDeui9',  storeName: 'iService', storeDis: '7 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipP_u-cEeI0A0j2q3_7AFt47-oWvbVpMjb-vJa-3=w408-h544-k-no'),
      Product(id: '6', name: 'iPhone 15', price: 880.0, image: appale15, city: 'Amman', urlMap: 'https://maps.app.goo.gl/XXQRhmSxDj1VDeui9', storeName: 'iService', storeDis: '7 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipP_u-cEeI0A0j2q3_7AFt47-oWvbVpMjb-vJa-3=w408-h544-k-no'),
      Product(id: '7', name: 'iPhone 14', price: 770.0, image: appale14, city: 'Amman', urlMap: 'https://maps.app.goo.gl/XXQRhmSxDj1VDeui9', storeName: 'iService', storeDis: '7 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipP_u-cEeI0A0j2q3_7AFt47-oWvbVpMjb-vJa-3=w408-h544-k-no'),
      Product(id: '8', name: 'iPhone 13', price: 650.0, image: appale13, city: 'Amman', urlMap: 'https://maps.app.goo.gl/XXQRhmSxDj1VDeui9', storeName: 'iService', storeDis: '7 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipP_u-cEeI0A0j2q3_7AFt47-oWvbVpMjb-vJa-3=w408-h544-k-no'),
      // Additional Products
      Product(id: '21', name: 'iPhone 12', price: 599.0, image: appale12, city: 'Al-Balqa', urlMap: 'https://maps.app.goo.gl/XXQRhmSxDj1VDeui9', storeName: 'iCenter - Jo', storeDis: '2.7 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipOWd67EOJ99ai0hxPAlZ1EQus1PUokeABkkJcfS=w408-h544-k-no'),
      Product(id: '22', name: 'iPhone SE', price: 399.0, image: appalese, city: 'Al-Balqa', urlMap: 'https://maps.app.goo.gl/XXQRhmSxDj1VDeui9', storeName: 'iCenter - Jo' , storeDis: '2.7 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipOWd67EOJ99ai0hxPAlZ1EQus1PUokeABkkJcfS=w408-h544-k-no'),

      Product(id: '7', name: 'iPhone 14 pro', price: 650.0, image: pro,  city: 'Al-Balqa', urlMap: 'https://maps.app.goo.gl/XXQRhmSxDj1VDeui9', storeName: 'iCenter - Jo' , storeDis: '2.7 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipOWd67EOJ99ai0hxPAlZ1EQus1PUokeABkkJcfS=w408-h544-k-no'),
      Product(id: '7', name: 'iPhone 14 plis', price: 650.0, image: plis, city: 'Amman', urlMap: 'https://maps.app.goo.gl/XXQRhmSxDj1VDeui9', storeName: 'iService', storeDis: '7 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipP_u-cEeI0A0j2q3_7AFt47-oWvbVpMjb-vJa-3=w408-h544-k-no'),


    ],
  ),
  Category(
    id: '3',
    name: 'Laptops',
    image: laptop,
    products: [
      Product(id: '9', name: 'HP Laptop', price: 450.0, image: laptophp, city: 'Amman', urlMap: 'https://maps.app.goo.gl/NTGYKcCksJdgGHg68', storeName: 'DigiTime' ,storeDis: '10 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipMO17rLyAskFkbOgTCs831cfmFrdwFO7Rc8_vCV=w408-h544-k-no'),
      Product(id: '10', name: 'Asus Laptop', price: 600.0, image: laptopasus, city: 'Amman', urlMap: 'https://maps.app.goo.gl/NTGYKcCksJdgGHg68', storeName: 'DigiTime',storeDis: '10 km',storeImage: 'https://lh5.googleusercontent.com/p/AF1QipMO17rLyAskFkbOgTCs831cfmFrdwFO7Rc8_vCV=w408-h544-k-no'),
      Product(id: '11', name: 'Huawei Laptop', price: 630.0, image: laptophuawei, city: 'Amman', urlMap: 'https://maps.app.goo.gl/XXQRhmSxDj1VDeui9', storeName: 'DigiTime',storeDis: '10 km',storeImage: 'https://lh5.googleusercontent.com/p/AF1QipMO17rLyAskFkbOgTCs831cfmFrdwFO7Rc8_vCV=w408-h544-k-no'),
      Product(id: '12', name: 'Lenovo Laptop', price: 500.0, image: laptoplenovo, city: 'Amman', urlMap: 'https://maps.app.goo.gl/TZ95fG1n2o5UmcUQ9', storeName: 'Waves center',storeDis: '7 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipPn7dCLKBuURVBm9uz5XTMsNNdmuj3FCynqyKCf=w408-h306-k-no'),
      Product(id: '13', name: 'MacBook', price: 1100.0, image: laptopmacbook, city: 'Amman', urlMap: 'https://maps.app.goo.gl/TZ95fG1n2o5UmcUQ9', storeName: 'Waves center',storeDis: '7 km',storeImage: 'https://lh5.googleusercontent.com/p/AF1QipPn7dCLKBuURVBm9uz5XTMsNNdmuj3FCynqyKCf=w408-h306-k-no'),
      // Additional Products
      Product(id: '23', name: 'Dell Laptop Latitude', price: 719.00, image: latitude, city: 'Al-Balqa', urlMap: 'https://maps.app.goo.gl/XXQRhmSxDj1VDeui9', storeName: 'Smart home',storeDis: '3.4 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipPDhzf9TP-PdptgowRJS5T8rA_X04HltG_1aWoB=w424-h240-k-no'),
      Product(id: '23', name: 'Dell Laptop 5540 ', price: 649.00, image: laptopdell, city: 'Al-Balqa', urlMap: 'https://maps.app.goo.gl/XXQRhmSxDj1VDeui9', storeName: 'Smart home',storeDis: '3.4 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipPDhzf9TP-PdptgowRJS5T8rA_X04HltG_1aWoB=w424-h240-k-no'),
      Product(id: '23', name: 'Dell Laptop Business 264', price: 1045.00, image: business, city: 'Amman', urlMap: 'https://maps.app.goo.gl/321RLGPdN8iU42qN9', storeName: 'Total Vision' ,storeDis: '3 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipOac3-pSeM65wsYEMD3yD7IzI034beKcqIvedEb=w408-h556-k-no'),
      Product(id: '23', name: 'Dell Laptop G16', price: 300.00, image: g16, city: 'Al-Balqa', urlMap: 'https://maps.app.goo.gl/XXQRhmSxDj1VDeui9', storeName: 'Smart home',storeDis: '3.4 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipPDhzf9TP-PdptgowRJS5T8rA_X04HltG_1aWoB=w424-h240-k-no'),
      Product(id: '23', name: 'Dell Laptop ', price: 500.00, image: laptopdell, city: 'Al-Balqa', urlMap: 'https://maps.app.goo.gl/XXQRhmSxDj1VDeui9', storeName: 'Smart home',storeDis: '3.4 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipPDhzf9TP-PdptgowRJS5T8rA_X04HltG_1aWoB=w424-h240-k-no'),




      Product(id: '24', name: 'Acer Laptop', price: 480.0, image: laptopacer, city: 'Amman', urlMap: 'https://maps.app.goo.gl/321RLGPdN8iU42qN9', storeName: 'Total Vision',storeDis: '3 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipOac3-pSeM65wsYEMD3yD7IzI034beKcqIvedEb=w408-h556-k-no'),
    ],
  ),
  Category(
    id: '4',
    name: 'Phone Accessories',
    image: a,
    products: [
      Product(id: '14', name: 'Fast Type-C', price: 24.99, image: a1, city: 'Al-Balqa', urlMap: 'https://maps.app.goo.gl/XXQRhmSxDj1VDeui9', storeName: 'Smart home' ,storeDis: '3.4 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipPDhzf9TP-PdptgowRJS5T8rA_X04HltG_1aWoB=w424-h240-k-no'),
      Product(id: '15', name: 'Cover S24 Ultra', price: 12.99, image: a2, city: 'Al-Balqa', urlMap: 'https://maps.app.goo.gl/XXQRhmSxDj1VDeui9', storeName: 'Smart home' ,storeDis: '3.4 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipPDhzf9TP-PdptgowRJS5T8rA_X04HltG_1aWoB=w424-h240-k-no'),
      Product(id: '16', name: 'Cover 15 Pro Max', price: 14.99, image: a3, city: 'Amman', urlMap: 'https://maps.app.goo.gl/XXQRhmSxDj1VDeui9', storeName: 'iService', storeDis: '7 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipP_u-cEeI0A0j2q3_7AFt47-oWvbVpMjb-vJa-3=w408-h544-k-no'),
      Product(id: '17', name: 'Cover 14 Pro Max', price: 8.49, image: a5,  city: 'Amman', urlMap: 'https://maps.app.goo.gl/XXQRhmSxDj1VDeui9', storeName: 'iService', storeDis: '7 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipP_u-cEeI0A0j2q3_7AFt47-oWvbVpMjb-vJa-3=w408-h544-k-no'),
      Product(id: '18', name: 'Covers 15 Pro Max', price: 12.49, image: a4, city: 'Amman', urlMap: 'https://maps.app.goo.gl/XXQRhmSxDj1VDeui9', storeName: 'iService', storeDis: '7 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipP_u-cEeI0A0j2q3_7AFt47-oWvbVpMjb-vJa-3=w408-h544-k-no'),
      // Additional Products
      Product(id: '25', name: 'Wireless Charger', price: 19.99, image: a6,city: 'Amman', urlMap: 'https://maps.app.goo.gl/XXQRhmSxDj1VDeui9', storeName: 'Smart home' ,storeDis: '3.4 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipPDhzf9TP-PdptgowRJS5T8rA_X04HltG_1aWoB=w424-h240-k-no'),
      Product(id: '26', name: 'Bluetooth Earbuds', price: 29.99, image: a7, city: 'Amman', urlMap: 'https://maps.app.goo.gl/XXQRhmSxDj1VDeui9', storeName: 'Smart home' ,storeDis: '3.4 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipPDhzf9TP-PdptgowRJS5T8rA_X04HltG_1aWoB=w424-h240-k-no'),
    ],
  ),
  // Additional Categories
  Category(
    id: '5',
    name: 'Tablets',
    image: imgTablet,
    products: [
      Product(id: '27', name: 'iPad Pro', price: 799.0, image: ipadPro, city: 'Amman', urlMap: 'https://maps.app.goo.gl/tcKHLJAHthJxqJ2t9', storeName: '365 solutions' ,storeDis: '10 km',storeImage: 'https://lh5.googleusercontent.com/p/AF1QipOBqNgaDJSg9137hDUPCnigfPoQCnfggs1-ZMVo=w408-h544-k-no'),
      Product(id: '28', name: 'Samsung  Tab', price: 649.0, image: samsungTab,  city: 'Amman', urlMap: 'https://maps.app.goo.gl/tcKHLJAHthJxqJ2t9', storeName: '365 solutions' ,storeDis: '10 km',storeImage: 'https://lh5.googleusercontent.com/p/AF1QipOBqNgaDJSg9137hDUPCnigfPoQCnfggs1-ZMVo=w408-h544-k-no'),
    ],
  ),
  Category(
    id: '6',
    name: 'Smart Watches',
    image: imgSmartWatch,
    products: [
      Product(id: '30', name: 'Apple Watch 7', price: 399.0, image: appleWatch, city: 'Al-Balqa', urlMap: 'https://maps.app.goo.gl/BuV2U3Lt66gPWwZR7', storeName: 'Smart home' ,storeDis: '3.4 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipPDhzf9TP-PdptgowRJS5T8rA_X04HltG_1aWoB=w424-h240-k-no'),
      Product(id: '31', name: 'Samsung Watch4', price: 349.0, image: samsungWatch, city: 'Al-Balqa', urlMap: 'https://maps.app.goo.gl/BuV2U3Lt66gPWwZR7', storeName: 'Smart home' ,storeDis: '3.4 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipPDhzf9TP-PdptgowRJS5T8rA_X04HltG_1aWoB=w424-h240-k-no'),
    ],
  ),
  
  Category(
    id: '7',
    name: 'Televisions',
    image: imgTelevision,
    products: [
      Product(id: '32', name: 'Samsung 55-inch ', price: 999.0, image: samsungTV, city: 'Al-Balqa', urlMap: 'https://maps.app.goo.gl/BuV2U3Lt66gPWwZR7', storeName: 'Smart home' ,storeDis: '3.4 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipPDhzf9TP-PdptgowRJS5T8rA_X04HltG_1aWoB=w424-h240-k-no'),
      Product(id: '34', name: 'Sony 75-inch 4K', price: 1999.0, image: sonyTV, city: 'Al-Balqa', urlMap: 'https://maps.app.goo.gl/BuV2U3Lt66gPWwZR7', storeName: 'Smart home' ,storeDis: '3.4 km' ,storeImage: 'https://lh5.googleusercontent.com/p/AF1QipPDhzf9TP-PdptgowRJS5T8rA_X04HltG_1aWoB=w424-h240-k-no'),
    ],
  ),
];
