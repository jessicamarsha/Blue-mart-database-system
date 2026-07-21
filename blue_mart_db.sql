-- Blue Mart Database Management System
-- Database Course Project
-- Bachelor of Informatics Engineering
-- Sam Ratulangi University


-- Dumping database structure for blue_mart
CREATE DATABASE IF NOT EXISTS `blue_mart` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;
USE `blue_mart`;

-- Dumping structure for table blue_mart.detail_transaksi
CREATE TABLE IF NOT EXISTS `detail_transaksi` (
  `ID_Detail` varchar(10) NOT NULL,
  `Jumlah` int(11) NOT NULL CHECK (`Jumlah` > 0),
  `Harga_Jual` decimal(10,2) NOT NULL CHECK (`Harga_Jual` >= 0),
  `Ukuran` varchar(5) DEFAULT NULL,
  `Subtotal` decimal(10,2) DEFAULT NULL,
  `ID_Transaksi` varchar(10) DEFAULT NULL,
  `ID_Produk` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID_Detail`),
  KEY `ID_Transaksi` (`ID_Transaksi`),
  KEY `ID_Produk` (`ID_Produk`),
  CONSTRAINT `1` FOREIGN KEY (`ID_Transaksi`) REFERENCES `transaksi` (`ID_Transaksi`) ON DELETE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`ID_Produk`) REFERENCES `produk` (`ID_Produk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table blue_mart.detail_transaksi: ~25 rows (approximately)
INSERT INTO `detail_transaksi` (`ID_Detail`, `Jumlah`, `Harga_Jual`, `Ukuran`, `Subtotal`, `ID_Transaksi`, `ID_Produk`) VALUES
	('DT001', 2, 250000.00, 'M', 500000.00, 'TRX01', 'PRD08'),
	('DT002', 1, 85000.00, 'L', 85000.00, 'TRX01', 'PRD09'),
	('DT003', 3, 10000.00, NULL, 30000.00, 'TRX01', 'PRD01'),
	('DT004', 2, 15000.00, NULL, 30000.00, 'TRX02', 'PRD02'),
	('DT005', 1, 12000.00, NULL, 12000.00, 'TRX02', 'PRD03'),
	('DT006', 1, 250000.00, 'XL', 250000.00, 'TRX03', 'PRD08'),
	('DT007', 2, 18000.00, NULL, 36000.00, 'TRX03', 'PRD04'),
	('DT008', 3, 5000.00, NULL, 15000.00, 'TRX04', 'PRD05'),
	('DT009', 1, 20000.00, NULL, 20000.00, 'TRX04', 'PRD06'),
	('DT010', 2, 15000.00, NULL, 30000.00, 'TRX05', 'PRD07'),
	('DT011', 1, 85000.00, 'S', 85000.00, 'TRX05', 'PRD09'),
	('DT012', 1, 75000.00, 'M', 75000.00, 'TRX06', 'PRD10'),
	('DT013', 2, 10000.00, NULL, 20000.00, 'TRX06', 'PRD01'),
	('DT014', 1, 12000.00, NULL, 12000.00, 'TRX07', 'PRD03'),
	('DT015', 2, 15000.00, NULL, 30000.00, 'TRX07', 'PRD02'),
	('DT016', 1, 250000.00, 'L', 250000.00, 'TRX08', 'PRD08'),
	('DT017', 1, 85000.00, 'L', 85000.00, 'TRX08', 'PRD09'),
	('DT018', 3, 5000.00, NULL, 15000.00, 'TRX09', 'PRD05'),
	('DT019', 2, 20000.00, NULL, 40000.00, 'TRX09', 'PRD06'),
	('DT020', 2, 15000.00, NULL, 30000.00, 'TRX10', 'PRD07'),
	('DT021', 1, 18000.00, NULL, 18000.00, 'TRX10', 'PRD04'),
	('DT022', 2, 85000.00, 'M', 170000.00, 'TRX11', 'PRD09'),
	('DT023', 1, 75000.00, 'L', 75000.00, 'TRX11', 'PRD10'),
	('DT024', 1, 10000.00, NULL, 10000.00, 'TRX12', 'PRD01'),
	('DT025', 2, 12000.00, NULL, 24000.00, 'TRX12', 'PRD03');

-- Dumping structure for table blue_mart.pelanggan
CREATE TABLE IF NOT EXISTS `pelanggan` (
  `ID_Pelanggan` varchar(10) NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `No_HP` varchar(15) NOT NULL,
  PRIMARY KEY (`ID_Pelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table blue_mart.pelanggan: ~20 rows (approximately)
INSERT INTO `pelanggan` (`ID_Pelanggan`, `Nama`, `No_HP`) VALUES
	('PL001', 'Jessica', '081234567801'),
	('PL002', 'Reyna', '081234567802'),
	('PL003', 'Jesril', '081234567803'),
	('PL004', 'Reynaldo', '081234567804'),
	('PL005', 'Daniel', '081234567805'),
	('PL006', 'Feisy', '081234567806'),
	('PL007', 'Paskah', '081234567807'),
	('PL008', 'Salvius', '081234567808'),
	('PL009', 'Dirko', '081234567809'),
	('PL010', 'Rizal', '081234567810'),
	('PL011', 'Matthew', '081234567811'),
	('PL012', 'Antania', '081234567812'),
	('PL013', 'Marieta', '081234567813'),
	('PL014', 'Mirhen', '081234567814'),
	('PL015', 'Christania', '081234567815'),
	('PL016', 'Ronaldo', '081234567816'),
	('PL017', 'Sardira', '081234567817'),
	('PL018', 'Keysee', '081234567818'),
	('PL019', 'Chelsea', '081234567819'),
	('PL020', 'Agus', '081234567820');

-- Dumping structure for table blue_mart.produk
CREATE TABLE IF NOT EXISTS `produk` (
  `ID_Produk` varchar(10) NOT NULL,
  `Nama_Produk` varchar(100) NOT NULL,
  `Harga` decimal(10,2) NOT NULL CHECK (`Harga` >= 0),
  `Stok` int(11) NOT NULL CHECK (`Stok` >= 0),
  PRIMARY KEY (`ID_Produk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table blue_mart.produk: ~10 rows (approximately)
INSERT INTO `produk` (`ID_Produk`, `Nama_Produk`, `Harga`, `Stok`) VALUES
	('PRD01', 'Cireng', 10000.00, 100),
	('PRD02', 'Roti Bakar', 15000.00, 50),
	('PRD03', 'Jasuke', 12000.00, 40),
	('PRD04', 'Mie Goreng', 18000.00, 50),
	('PRD05', 'Es Teh', 5000.00, 100),
	('PRD06', 'Kentang Goreng', 20000.00, 40),
	('PRD07', 'Siomay', 15000.00, 30),
	('PRD08', 'Work Shirt', 250000.00, 20),
	('PRD09', 'Kaos Polos', 85000.00, 60),
	('PRD10', 'Topi', 75000.00, 25);

-- Dumping structure for table blue_mart.transaksi
CREATE TABLE IF NOT EXISTS `transaksi` (
  `ID_Transaksi` varchar(10) NOT NULL,
  `Tanggal_Transaksi` date NOT NULL,
  `Status_Bayar` enum('Lunas','DP') NOT NULL,
  `Total_Bayar` decimal(10,2) DEFAULT 0.00 CHECK (`Total_Bayar` >= 0),
  `ID_Pelanggan` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID_Transaksi`),
  KEY `ID_Pelanggan` (`ID_Pelanggan`),
  CONSTRAINT `1` FOREIGN KEY (`ID_Pelanggan`) REFERENCES `pelanggan` (`ID_Pelanggan`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table blue_mart.transaksi: ~12 rows (approximately)
INSERT INTO `transaksi` (`ID_Transaksi`, `Tanggal_Transaksi`, `Status_Bayar`, `Total_Bayar`, `ID_Pelanggan`) VALUES
	('TRX01', '2026-05-01', 'Lunas', 615000.00, 'PL004'),
	('TRX02', '2026-05-02', 'DP', 42000.00, 'PL001'),
	('TRX03', '2026-05-03', 'Lunas', 286000.00, 'PL004'),
	('TRX04', '2026-05-04', 'Lunas', 35000.00, 'PL002'),
	('TRX05', '2026-05-05', 'DP', 115000.00, 'PL005'),
	('TRX06', '2026-05-06', 'Lunas', 95000.00, 'PL004'),
	('TRX07', '2026-05-07', 'Lunas', 42000.00, 'PL006'),
	('TRX08', '2026-05-08', 'DP', 335000.00, 'PL004'),
	('TRX09', '2026-05-09', 'Lunas', 55000.00, 'PL007'),
	('TRX10', '2026-05-10', 'Lunas', 48000.00, 'PL008'),
	('TRX11', '2026-05-11', 'DP', 245000.00, 'PL004'),
	('TRX12', '2026-05-12', 'Lunas', 34000.00, 'PL009');

-- Dumping structure for trigger blue_mart.hitung_subtotal
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER hitung_subtotal
BEFORE INSERT ON Detail_Transaksi
FOR EACH ROW
BEGIN
    SET NEW.Subtotal = NEW.Jumlah * NEW.Harga_Jual;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger blue_mart.total_bayar_otomatis
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER total_bayar_otomatis
AFTER INSERT ON Detail_Transaksi
FOR EACH ROW
BEGIN
    UPDATE Transaksi
    SET Total_Bayar = (
        SELECT SUM(Subtotal)
        FROM Detail_Transaksi
        WHERE ID_Transaksi = NEW.ID_Transaksi
    )
    WHERE ID_Transaksi = NEW.ID_Transaksi;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;
