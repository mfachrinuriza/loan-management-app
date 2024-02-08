Loan Management 

Instalasi

Persyaratan Sistem: 
- Pastikan perangkat Anda menggunakan sistem operasi macOS. 
Unduh Aplikasi: 
- Xcode

Jika Anda ingin mengompilasi aplikasi dari source code, ikuti langkah-langkah berikut:

Mneggunakan clone dari Git:
Pastikan Anda telah menginstal Xcode di komputer Anda.
Clone repositori loan-management-app ini ke komputer Anda: git clone git@github.com:mfachrinuriza/loan-management-app.git
Clone repositori Cores ini ke komputer Anda: git clone git@github.com:mfachrinuriza/Cores.git
Buka terminal dan arahkan pada folder loan-management-app yang anda simpan
Lalu lakukan "pod install" pada terminal
Buka file loan-management-app.xcworkspace di Xcode.
Pilih simulator atau perangkat yang ingin Anda gunakan untuk menjalankan aplikasi.
Tekan tombol "Run" atau pilih "Product" > "Run" dari menu bar.

Pendekatan 
- Menggunakan MVVM Architecture Pattern 
- Menggunakan Dependence Injection Autoregistration untuk memudahkan dalam register
- Melakukan Clean Architecture
- Menggunakan Reactive Programming dengan RXSwift
- Melakukan Modularization dengan memisahkan module Cores 
- Membuat beberapa Helper untuk membantu memudahkan dalam membuat code, seperti: Navigator untuk menghandle routing, CustomUIView, FitterCollectionView, Logger, HexCodeColor, extension
- Menerapkan asynchronous operations appropriately.
- Menggunakan Library: - RxSwift, RxCocoa, Swinject, SwinjectAutoRegistration, Kingfisher, Alamofire
