-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 01 Bulan Mei 2024 pada 04.21
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `game`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `head` varchar(50) NOT NULL,
  `content` varchar(100) NOT NULL,
  `text_color` enum('text-dark','text-light') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `banners`
--

INSERT INTO `banners` (`id`, `product_id`, `image`, `head`, `content`, `text_color`) VALUES
(4, 3, '7f835b7235cd45661cac8a6c3de3f000.jpg', 'Anno 1880', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Qui, cupiditate Lorem ipsum dolor sit amet', 'text-light'),
(5, 1, 'f2ea03a2f9af29c035d12d14bcc0dc48.jpg', 'Assasins\'s Creeds Halvala', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Qui, cupiditate Lorem ipsum dolor sit amet', 'text-light'),
(6, 6, '1d1646517087c5f29ea221c8cc2e0851.jpg', 'Watch Dogs®: Legion', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Necessitatibus cupiditate esse adipisci cum', 'text-light');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` text NOT NULL,
  `status` enum('waiting','paid','delivered','cancel') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `date`, `invoice`, `total`, `name`, `address`, `phone`, `status`) VALUES
(4, 5, '2020-06-29', '520200629021101', 705000, 'User', 'Tangerang', '123123123', 'paid'),
(5, 5, '2024-04-20', '520240420152514', 894000, 'user', 'jl raya', '08123456789', 'delivered'),
(6, 6, '2024-05-01', '620240501033837', 1239000, 'User 2', 'testing address', '08123456789', 'paid'),
(7, 6, '2024-05-01', '620240501034515', 259750, 'user 2', 'testing address', '08123456789', 'cancel'),
(8, 6, '2024-05-01', '620240501035001', 619000, 'user 2', 'tes', '08123456789', 'cancel'),
(9, 6, '2024-05-01', '620240501035144', 619000, 'user 2', 'test', '08123456789', 'waiting'),
(10, 6, '2024-05-01', '620240501035626', 619000, 'user 2', 'tes', '08123456789', 'waiting'),
(11, 6, '2024-05-01', '620240501035818', 619000, 'user 2', 'tes', '08123456789', 'waiting');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders_confirm`
--

CREATE TABLE `orders_confirm` (
  `id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `nominal` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `orders_confirm`
--

INSERT INTO `orders_confirm` (`id`, `orders_id`, `account_name`, `account_number`, `nominal`, `note`, `image`) VALUES
(3, 4, 'User', '651901016050537', 1000000, 'testing', '23c839ec129597ed7735de78e515120a.jpg'),
(4, 6, 'user 2', '1234456789', 1500000, 'testing', '747e6de5de8ed4fec1d6ed81f7c3fe70.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders_detail`
--

CREATE TABLE `orders_detail` (
  `id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `orders_detail`
--

INSERT INTO `orders_detail` (`id`, `orders_id`, `product_id`, `subtotal`) VALUES
(7, 4, 1, 205000),
(8, 4, 5, 500000),
(9, 5, 2, 689000),
(10, 5, 1, 205000),
(11, 6, 6, 1239000),
(12, 7, 7, 259750),
(13, 8, 2, 619000),
(14, 9, 1, 619000),
(15, 10, 5, 619000),
(16, 11, 5, 619000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `edition` enum('reguler','premium') NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `requirements` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `edition`, `image`, `description`, `requirements`) VALUES
(1, 'Assassin\'s Creed® Origins', 619000, 'reguler', 'assasincreedorigins.jpg', '<p><b>ASSASSIN’S CREED® ORIGINS IS A NEW BEGINNING </b></p>\r\n<p>\r\n	*The Discovery Tour by Assassin’s Creed®: Ancient Egypt is available now as a\r\n	free update!*\r\n</p>\r\n<p>\r\n	Ancient Egypt, a land of majesty and intrigue, is disappearing in a ruthless\r\n	fight for power. Unveil dark secrets and forgotten myths as you go back to the\r\n	one founding moment: The Origins of the Assassin’s Brotherhood.\r\n</p>\r\n\r\n<br />\r\n\r\n<p><b>A COUNTRY TO DISCOVER</b></p>\r\n<p>\r\n	Sail down the Nile, uncover the mysteries of the pyramids or fight your way\r\n	against dangerous ancient factions and wild beasts as you explore this\r\n	gigantic and unpredictable land.\r\n</p>\r\n\r\n<p><b> A NEW STORY EVERY TIME YOU PLAY</b></p>\r\n<p>\r\n	Engage into multiple quests and gripping stories as you cross paths with\r\n	strong and memorable characters, from the wealthiest high-born to the most\r\n	desperate outcasts.\r\n</p>\r\n\r\n<p><b> EMBRACE ACTION-RPG</b></p>\r\n<p>\r\n	Experience a completely new way to fight. Loot and use dozens of weapons with\r\n	different characteristics and rarities. Explore deep progression mechanics and\r\n	challenge your skills against unique and powerful bosses.\r\n</p>\r\n', '<p><b>MINIMUM CONFIGURATION</b></p>\r\n<hr />\r\n<p>OS: Windows 7 SP1, Windows 8.1, Windows 10 (64-bit versions only)</p>\r\n<p>\r\n	PROCESSOR: Intel Core i5-2400s @ 2.5 GHz or AMD FX-6350 @ 3.9 GHz or\r\n	equivalent\r\n</p>\r\n<p>\r\n	VIDEO CARD: NVIDIA GeForce GTX 660 or AMD R9 270 (2048 MB VRAM with Shader\r\n	Model 5.0 or better)\r\n</p>\r\n<p>SYSTEM RAM: 6GB Resolution: 720p Video Preset: Lowest</p>\r\n<br />\r\n<p><b>RECOMMENDED CONFIGURATION </b></p>\r\n<hr />\r\n<p>OS: Windows 7 SP1, Windows 8.1, Windows 10 (64-bit versions only)</p>\r\n<p>PROCESSOR: Intel Core i7- 3770 @ 3.5 GHz or AMD FX-8350 @ 4.0 GHz</p>\r\n<p>\r\n	VIDEO CARD: NVIDIA GeForce GTX 760 or AMD R9 280X (3GB VRAM with Shader Model\r\n	5.0 or better)\r\n</p>\r\n<p>SYSTEM RAM: 8GB Resolution: 1080p Video Preset: High</p>\r\n'),
(2, 'Watch Dogs 2', 619000, 'reguler', 'watchdogs2.jpg', '<p>\r\n	Use hacking as a weapon in the massive & dynamic open world of Watch Dogs 2.\r\n	In 2016, ctOS 2.0, an advanced operating system networking city\r\n	infrastructure, was implemented in several US cities to create a safer, more\r\n	efficient metropolis. Play as Marcus Holloway, a brilliant young hacker living\r\n	in the birthplace of the tech revolution, the San Francisco Bay Area.\r\n</p>\r\n<p>\r\n	Team up with Dedsec, a notorious group of hackers, and expose the hidden\r\n	dangers of ctOS 2.0, which, in the hands of corrupt corporations, is being\r\n	wrongfully used to monitor and manipulate citizens on a massive scale. With\r\n	the power of hacking and Dedsec by your side, launch the Hack of the Century,\r\n	take down ctOS 2.0 and give freedom back to whom it belongs: the people.\r\n	Features\r\n</p>\r\n\r\n<br /><br />\r\n\r\n<p><b>WELCOME TO THE SAN FRANCISCO BAY AREA</b></p>\r\n<p>\r\n	Explore a massive and dynamic open-world offering an incredible variety of\r\n	gameplay possibilities. Hack your way through traffic while you engage in\r\n	dangerous car chases through the winding streets of San Francisco, traverse\r\n	the rooftops of the colorful & vibrant neighborhoods of Oakland, and\r\n	infiltrate the cutting edge offices of Silicon Valley companies. There are\r\n	many secrets to uncover in the birthplace of the tech revolution.\r\n</p>\r\n\r\n<br />\r\n\r\n<p><b>HACKING IS YOUR WEAPON </b></p>\r\n<p>\r\n	Hack into the city’s infrastructure, every connected device, and everyone’s\r\n	personal database. Take control of drones, cars, cranes, security robots, and\r\n	much more. Hack your enemies and bystanders alike– manipulate them in\r\n	different ways to trigger unpredictable chains of events. Every person, any\r\n	vehicle they might drive, any connected device they possess can be hacked.\r\n</p>\r\n\r\n<br />\r\n\r\n<p><b>YOU ARE IN CTRL</b></p>\r\n<p>\r\n	Use hacking and stealth to complete missions without killing a single enemy or\r\n	combine hacking and your weapons for a more ferocious approach. Develop\r\n	different skills to suit your playstyle, and upgrade your hacker tools – RC\r\n	cars, Quadcopter drones, 3D printed weapons and much more.\r\n</p>\r\n\r\n<br />\r\n\r\n<p><b>SEAMLESSLY CONNECT WITH FRIENDS</b></p>\r\n<p>\r\n	Stay connected to your friends with a brand new seamless multiplayer\r\n	experience that includes both Co-op and Player vs. Player activities, all\r\n	available in a shared open world experience.\r\n</p>\r\n\r\n<br />\r\n\r\n<p><b>PUT YOUR EYES IN CTRL</b></p>\r\n<p>\r\n	Get the upper hand with Tobii Eye Tracking. Let your gaze aid you in\r\n	weaponizing the “internet of things”, aim at enemies and take cover while you\r\n	naturally explore the environment. Combine the extensive eye tracking feature\r\n	set to pinpoint enemies, interact with your surroundings, locate shelter\r\n	points, and rapidly select hackable targets. Let your vision lead the hacking\r\n	of the city’s digital brain.\r\n</p>\r\n', '<p><b>MINIMUM CONFIGURATION</b></p>\r\n<hr />\r\n<p>\r\n	OS: Originally released for Windows 7, the game can be played on Windows 10\r\n	and Windows 11 OS\r\n</p>\r\n<p>PROCESSOR: Intel Core i5 2400s @ 2.5 GHz, AMD FX 6120 @ 3.5 GHz or better</p>\r\n<p>\r\n	VIDEO CARD: NVIDIA GeForce GTX 780 | AMD Radeon R9 290, with 3GB VRAM or\r\n	better - See supported List*\r\n</p>\r\n<p>RAM: 6 GB RAM</p>\r\n<p>\r\n	GRAPHICS: NVIDIA GeForce GTX 660 with 2 GB VRAM or AMD Radeon HD 7870, with 2\r\n	GB VRAM or better - See supported List*\r\n</p>\r\n<p>NETWORK: Broadband Internet connection</p>\r\n<p>SOUND CARD: DirectX-compatible using the latest drivers</p>\r\n<p>STORAGE: 27 GB available space</p>\r\n<p>\r\n	Additional Notes: Minimum specs above for 720p , 30+ FPS, Low graphic settings\r\n	// Periphericals: Microsoft Xbox One Controller, DUALSHOCK® 4 Controller,\r\n	Windows-compatible keyboard, mouse, optional controller / Multiplayer: 256\r\n	kbps or faster broadband connection / Note: This product supports 64-bit\r\n	operating systems only. Laptop versions of these cards may work, but are not\r\n	officially supported. For the most up-to-date requirement listings, please\r\n	visit the FAQ on our support website at support.ubi.com. High speed internet\r\n	access and a valid Ubisoft account are required to activate the game after\r\n	installation, to authenticate your system and continue gameplay after any\r\n	re-activation, access online features, play online or unlock exclusive\r\n	content. Game contains EasyAntiCheat (https://www.easyanticheat.net/)\r\n	anti-cheat technology and Denuvo (https://www.denuvo.com/) anti-tamper\r\n	technology.\r\n</p>\r\n<br />\r\n<br />\r\n<p><b>RECOMMENDED CONFIGURATION</b></p>\r\n<hr />\r\n<p>\r\n	OS: Originally released for Windows 7, the game can be played on Windows 10\r\n	and Windows 11 OS\r\n</p>\r\n<p>PROCESSOR: Intel Core i5 2400s @ 2.5 GHz, AMD FX 6120 @ 3.5 GHz or better</p>\r\n<p>\r\n	VIDEO CARD: NVIDIA GeForce GTX 780 | AMD Radeon R9 290, with 3GB VRAM or\r\n	better - See supported List*\r\n</p>\r\n<p>RAM: 8 GB RAM</p>\r\n<p>\r\n	GRAPHICS: NVIDIA GeForce GTX 660 with 2 GB VRAM or AMD Radeon HD 7870, with 2\r\n	GB VRAM or better - See supported List*\r\n</p>\r\n<p>NETWORK: Broadband Internet connection</p>\r\n<p>SOUND CARD: DirectX-compatible using the latest drivers</p>\r\n<p>STORAGE: 27 GB available space</p>\r\n<p>\r\n	Additional Notes: Recommended specs above for 1080p , 30+ FPS, High graphic\r\n	settings // SUPPORTED VIDEO CARDS AT TIME OF RELEASE: • NVIDIA® GeForce®\r\n	GTX600 Series: GTX660 or better / GeForce® GTX700 Series: GTX760 or better /\r\n	GeForce® GTX900 Series: GTX950 or better / GeForce® GTX1000 Series: GTX1060 or\r\n	better. • AMD Radeon™ HD 7000 series: Radeon™ HD7870 or better / Radeon™ 200\r\n	series: Radeon R9 270 or better / Radeon™ 300/Fury X series: Radeon™ R9 370 or\r\n	better / Radeon 400 series: Radeon RX460 or better. Game contains\r\n	EasyAntiCheat (https://www.easyanticheat.net/) anti-cheat technology and\r\n	Denuvo (https://www.denuvo.com/) anti-tamper technology.\r\n</p>\r\n'),
(3, 'Anno 1800', 1339000, 'premium', 'anno.jpg', '<p>\r\n	Anno 1800™ – Lead the Industrial Revolution! Welcome to the dawn of the\r\n	Industrial Age. The path you choose will define your world. Are you an\r\n	innovator or an exploiter? A conqueror or a liberator? How the world remembers\r\n	your name is up to you.\r\n</p>\r\n<p>\r\n	In Anno 1800, players will take charge of their own fortune as they navigate\r\n	the rapidly evolving technological landscape and malicious political arena of\r\n	the 19th century in their quest to build an empire that will reach from the\r\n	smog-filled cities of Europe to the teeming jungles of South America.\r\n</p>\r\n<p>\r\n	Combining beloved features with innovative gameplay, Anno 1800 is the\r\n	beginning of a new era for the Anno franchise as players leave their mark on a\r\n	crucial moment in human history.\r\n</p>\r\n<p>\r\n	Welcome to the 19th century, a time of industrialization, diplomacy, and\r\n	discovery. Rich with technological innovations, conspiracies, and changing\r\n	allegiances, this era presents the perfect setting for classic Anno gameplay.\r\n	Anno 1800 provides players ample opportunity to prove their skills as a ruler\r\n	as they create huge metropolises, plan efficient logistic networks, settle an\r\n	exotic new continent, send out expeditions around the globe, and dominate\r\n	their opponents by diplomacy, trade, or warfare.\r\n</p>\r\n<p>\r\n	Anno 1800 combines beloved features from 20 years of Anno history. It delivers\r\n	a rich city-building experience, including a story-based campaign, a highly\r\n	customizable sandbox mode, and the classic Anno multiplayer experience. Anno\r\n	1800 will see the return of beloved features such as individual AI opponents,\r\n	shippable trade goods, randomly generated maps, multi-session gameplay, items,\r\n	and more.\r\n</p>\r\n<p>\r\n	To bring this pivotal historical era to life, Anno 1800 introduces many\r\n	all-new features to the franchise’s rich tradition. Expeditions allow players\r\n	to send crews of specialists across the globe as they seek fame and fortune,\r\n	while the new workforce feature makes managing your factories more demanding\r\n	and realistic than ever. Finally, players will settle South America as they\r\n	lay claim to the black gold powering this new age of industry.\r\n</p>\r\n<p>\r\n	Leading prosperous metropolises requires you to adapt your strategy to new\r\n	situations. Fulfil the needs of your inhabitants by establishing numerous\r\n	production chains, deal with other AI rulers sharing your world, and rise to\r\n	prosperity by building a profitable network of trade routes.\r\n</p>\r\n', '<p><b>MINIMUM CONFIGURATION</b></p>\r\n<hr />\r\n<p>Requires a 64-bit processor and operating system</p>\r\n<p>OS: Windows 10(64-bit versions only)</p>\r\n<p>CPU: Intel i5 3470, AMD FX 6350</p>\r\n<p>RAM: 8 GB RAM</p>\r\n<p>CPU: Intel i5-4460 - 3.2 Ghz, AMD Ryzen3 1200 - 3.1 Ghz</p>\r\n<p>\r\n	GPU: NVIDIA GeForce 670 GTX or AMD Radeon R9 285 (2 GB of VRAM, Shader Model\r\n	5.0)\r\n</p>\r\n<p>DirectX: Version 11</p>\r\n<p>Storage: 60 GB available space</p>\r\n\r\n<br />\r\n\r\n<p><b>RECOMMENDED CONFIGURATION</b></p>\r\n<hr />\r\n<p>Requires a 64-bit processor and operating system</p>\r\n<p>OS: Windows 10(64-bit versions only)</p>\r\n<p>CPU: Intel i5 4690k, AMD Ryzen 5 1400</p>\r\n<p>RAM: 8 GB RAM</p>\r\n<p>CPU: Intel i5-4460 - 3.2 Ghz, AMD Ryzen3 1200 - 3.1 Ghz</p>\r\n<p>\r\n	GPU: NVIDIA GeForce 970 GTX or AMD Radeon RX 480 (4 GB of VRAM, Shader Model\r\n	5.1)\r\n</p>\r\n<p>DirectX: Version 12</p>\r\n<p>Storage: 60 GB available space</p>\r\n'),
(4, 'Assassin\'s Creed Valhalla', 619000, 'reguler', '6d593e0b9fe86690a49fd1fd32d26983.jpg', '<p>\r\n	Become Eivor, a legendary Viking raider on a quest for glory. Explore\r\n	England\'s Dark Ages as you raid your enemies, grow your settlement, and build\r\n	your political power.\r\n</p>\r\n\r\n<p>\r\n	• Lead epic Viking raids against Saxon fortresses throughout England.<br />\r\n	• Dual-wield powerful weapons and relive the visceral fighting style of the\r\n	Vikings.<br />\r\n	• Challenge yourself with the most varied collection of enemies ever found in\r\n	Assassin\'s Creed.<br />\r\n	• Shape the growth of your character with every choice you make and carve your\r\n	path to glory.<br />\r\n	• Explore a Dark Age open world, from the harsh shores of Norway to the\r\n	beautiful kingdoms of England.<br />\r\n</p>\r\n\r\n<br />\r\n\r\n<p>\r\n	<strong>THE GAME</strong><br />\r\n	• Copy of the Ultimate Edition of <strong>Assassin’s Creed Valhalla</strong>,\r\n	including the following digital content.<br />\r\n</p>\r\n\r\n<p>\r\n	<strong>THE SEASON PASS</strong><br />\r\n	Extend your experience with the<strong> Season Pass*</strong>:<br />\r\n	• Get access to epic new content, explore new lands and discover new gear.<br />\r\n	• Enjoy an immersive Story Mission, available at Launch.\r\n</p>\r\n\r\n<strong>THE ULTIMATE PACK</strong><br />\r\n\r\nStrike fear into the hearts of your enemies, dominate raids and rivers with the\r\nset of items included in the <strong>Ultimate Pack*</strong>: <br />\r\n• <strong>The Berserker Gear Pack </strong>includes the Bearded Axe, the Ursine\r\nGuard Light Shield, a new skin for your Raven, the ferocious Hati Wolf Mount and\r\nthe Berserker Set for Eivor.<br />\r\n• <strong>The Berserker Longship Pack</strong> includes a majestic Longship\r\nwhich comes with a unique figurehead and a set of new sails. <br />\r\n• <strong>The Berserker Settlement Pack </strong>includes new ways to customise\r\nyour settlement in England.<br />\r\n• <strong>A Set of Runes </strong>to sharpen the weapons or improve the gear of\r\nyour choice.\r\n                                    ', '<p><b>MINIMUM CONFIGURATION </b></p>\r\n<hr />\r\n<p>Requires a 64-bit processor and operating system</p>\r\n<p>OS: Windows 10 (versions 64 bits uniquement)</p>\r\n<p>Processor: AMD Ryzen 3 1200 3.1 GHz / Intel Core i5-4460 3.2 GHz</p>\r\n<p>Memory: 8 GB RAM</p>\r\n<p>Graphics: AMD R9 380 /NVIDIA GeForce GTX 960</p>\r\n<p>DirectX: Version 12</p>\r\n<p>Storage: 160 GB available space</p>\r\n\r\n<br />\r\n\r\n<p><b>RECOMMENDED CONFIGURATION </b></p>\r\n<hr />\r\n<p>Requires a 64-bit processor and operating system</p>\r\n<p>OS: Windows 10 (versions 64 bits uniquement)</p>\r\n<p>Processor: AMD Ryzen 5 1600 3.2 GHz / Intel Core i7-4790 3.6 GHz</p>\r\n<p>Memory: 8 GB RAM</p>\r\n<p>Graphics: AMD R9 380 /NVIDIA GeForce GTX 960</p>\r\n<p>DirectX: Version 12</p>\r\n<p>Storage: 160 GB available space</p>\r\n                                    '),
(5, 'Far Cry 5', 619000, 'reguler', 'a15512528a86ac45c1ee4c9c47e4cb3c.jpg', '<p style=\"font-family: \'Times New Roman\', serif\">\r\n	Seventeen years after a global nuclear catastrophe, civilization re-emerges\r\n	from the chaos to find a world dramatically changed. In Hope County, Montana,\r\n	the remaining populace has gathered into different groups, each with their own\r\n	rules for survival.\r\n</p>\r\n\r\n<p style=\"text-align: justify; margin: 0cm 0cm 0.0001pt\">\r\n	<span style=\"font-size: 10pt\"\r\n		><span style=\"font-family: \'Times New Roman\', serif\"\r\n			><span style=\"font-family: \'Arial\', sans-serif\" lang=\"EN-US\"></span></span\r\n	></span>\r\n</p>\r\n\r\n<p style=\"text-align: justify; margin: 0cm 0cm 0.0001pt\">\r\n	<span style=\"font-size: 10pt\"\r\n		><span style=\"font-family: \'Times New Roman\', serif\"\r\n			><span style=\"font-family: \'Arial\', sans-serif\" lang=\"EN-US\"\r\n				>In this new world order, the vicious Highwaymen, led by twin sisters\r\n				Mickey and Lou, travel from place to place bleeding people dry of all\r\n				available resources. As the Survivors try to defend their lands against\r\n				the </span\r\n			><span style=\"font-family: \'Stratum1 Regular\', sans-serif\" lang=\"EN-US\"\r\n				>Highwaymen\'s relentless onslaught, </span\r\n			><span style=\"font-family: \'Arial\', sans-serif\" lang=\"EN-US\"\r\n				>it\'s up to you to come to their aid and lead the fight. </span\r\n			><span style=\"font-family: \'Stratum1 Regular\', sans-serif\" lang=\"EN-CA\"\r\n				><span style=\"font-variant: small-caps\"></span></span></span\r\n	></span>\r\n</p>\r\n\r\n<p style=\"text-align: justify; margin: 0cm 0cm 0.0001pt\">\r\n	<span style=\"font-size: 10pt\"\r\n		><span style=\"font-family: \'Times New Roman\', serif\"\r\n			><span style=\"font-family: \'Arial\', sans-serif\" lang=\"EN-US\"></span></span\r\n	></span>\r\n</p>\r\n\r\n<p style=\"text-align: justify; margin: 0cm 0cm 0.0001pt\">\r\n	<span style=\"font-size: 10pt\"\r\n		><span style=\"font-family: \'Times New Roman\', serif\"\r\n			><span style=\"font-family: \'Arial\', sans-serif\" lang=\"EN-US\"\r\n				>In the latest installment of the award-winning Far Cry franchise,</span\r\n			><span style=\"font-family: \'Stratum1 Regular\', sans-serif\" lang=\"EN-US\">\r\n				you are the last line of defense in a transformed, post-apocalyptic Hope\r\n				County. Help the community of Survivors grow stronger, craft a makeshift\r\n				arsenal through Turf Wars and cross-country Expeditions, and form\r\n				unexpected alliances to fight for survival in a dangerous new\r\n				frontier.</span\r\n			><span style=\"font-size: 9pt\" lang=\"EN-US\"\r\n				><span style=\"font-family: \'Arial\', sans-serif\"></span></span></span\r\n	></span>\r\n</p>\r\n\r\n<p style=\"margin: 0cm 0cm 0.0001pt; text-align: justify\">\r\n	<span style=\"color: null\"\r\n		><span style=\"font-size: 10pt\"\r\n			><span style=\"font-family: \'Times New Roman\', serif\"\r\n				><span\r\n					style=\"font-family: \'Stratum1 Regular\', sans-serif\"\r\n					lang=\"EN-US\"\r\n				></span\r\n				><span style=\"font-size: 9pt\" lang=\"EN-US\"\r\n					><span\r\n						style=\"font-family: \'Arial\', sans-serif\"\r\n					></span></span></span></span\r\n	></span>\r\n</p>\r\n\r\n<p style=\"text-align: justify; margin: 0cm 0cm 0.0001pt\">\r\n	<span style=\"color: null\"\r\n		><span style=\"font-size: 10pt\"\r\n			><span style=\"font-family: \'Times New Roman\', serif\"\r\n				><span\r\n					style=\"font-family: \'Stratum1 Regular\', sans-serif\"\r\n					lang=\"EN-US\"\r\n				></span\r\n				><span style=\"font-size: 9pt\" lang=\"EN-US\"\r\n					><span\r\n						style=\"font-family: \'Arial\', sans-serif\"\r\n					></span></span></span></span\r\n	></span>\r\n</p>\r\n\r\n<p style=\"text-align: justify; margin: 0cm 0cm 0.0001pt\">\r\n	<span style=\"color: null\"></span>\r\n</p>\r\n\r\n<p style=\"text-align: justify; margin: 0cm 0cm 0.0001pt\"></p>\r\n\r\n<p>\r\n	<span style=\"color: null\"\r\n		><span style=\"font-size: 10pt\"\r\n			><span style=\"font-family: \'Times New Roman\', serif\"\r\n				><b\r\n					><span\r\n						style=\"font-family: \'Arial\', sans-serif\"\r\n						lang=\"EN-US\"\r\n					></span></b></span></span\r\n	></span>\r\n</p>\r\n\r\n<p style=\"margin: 0cm 0cm 0.0001pt\">\r\n	<span style=\"color: null\"\r\n		><span style=\"font-size: 10pt\"\r\n			><span style=\"font-family: \'Times New Roman\', serif\"\r\n				><b\r\n					><span style=\"font-family: \'Arial\', sans-serif\" lang=\"EN-US\"\r\n						>FIGHT FOR SURVIVAL IN A BREATHTAKING POST-APOCALYPTIC WORLD</span\r\n					></b\r\n				></span\r\n			></span\r\n		></span\r\n	>\r\n</p>\r\n\r\n<ul>\r\n	<li style=\"margin: 0cm 0cm 0.0001pt 36pt\">\r\n		<span style=\"color: null\"\r\n			><span style=\"font-size: 10pt\"\r\n				><span style=\"font-family: \'Times New Roman\', serif\"\r\n					><span style=\"font-family: Symbol\" lang=\"EN-US\"></span\r\n					><span style=\"font-family: \'Arial\', sans-serif\" lang=\"EN-US\"\r\n						>Sprawling superbloom fields and dense overgrowth invite you into a\r\n						wildly beautiful yet deadly post-apocalyptic landscape, to discover\r\n						on your own or with a friend in two player co-op.</span\r\n					></span\r\n				></span\r\n			></span\r\n		>\r\n	</li>\r\n	<li style=\"margin: 0cm 0cm 0.0001pt 36pt\">\r\n		<span style=\"color: null\"\r\n			><span style=\"font-size: 10pt\"\r\n				><span style=\"font-family: \'Times New Roman\', serif\"\r\n					><span style=\"font-family: Symbol\" lang=\"EN-US\"></span\r\n					><span style=\"font-family: \'Arial\', sans-serif\" lang=\"EN-US\"\r\n						>Wildlife has not gone untouched by the disaster, with some\r\n						predators evolving rugged natural defenses.</span\r\n					></span\r\n				></span\r\n			></span\r\n		>\r\n	</li>\r\n</ul>\r\n\r\n<p style=\"margin: 0cm 0cm 0.0001pt\">\r\n	<span style=\"color: null\"\r\n		><span style=\"font-size: 10pt\"\r\n			><span style=\"font-family: \'Times New Roman\', serif\"\r\n				><b\r\n					><span\r\n						style=\"font-family: \'Arial\', sans-serif\"\r\n						lang=\"EN-US\"\r\n					></span></b></span></span\r\n	></span>\r\n</p>\r\n\r\n<p style=\"margin: 0cm 0cm 0.0001pt\">\r\n	<span style=\"color: null\"\r\n		><span style=\"font-size: 10pt\"\r\n			><span style=\"font-family: \'Times New Roman\', serif\"\r\n				><b\r\n					><span style=\"font-family: \'Arial\', sans-serif\" lang=\"EN-US\"\r\n						>UNFORGETTABLE CHARACTERS COLLIDE WITH A RELENTLESS DOUBLE\r\n						THREAT</span\r\n					></b\r\n				>\r\n			</span></span\r\n		></span\r\n	>\r\n</p>\r\n\r\n<ul>\r\n	<li style=\"margin: 0cm 0cm 0.0001pt 36pt\">\r\n		<span style=\"color: null\"\r\n			><span style=\"font-size: 10pt\"\r\n				><span style=\"font-family: \'Times New Roman\', serif\"\r\n					><span style=\"font-family: \'Arial\', sans-serif\" lang=\"EN-US\"\r\n						>Clash with the brutal Highwaymen and their unruly leaders Mickey\r\n						and Lou. Known as The Twins, these sisters combine brains and brawn\r\n						to give their army an iron grip on Hope County\'s precious\r\n						resources.</span\r\n					></span\r\n				></span\r\n			></span\r\n		>\r\n	</li>\r\n	<li style=\"margin: 0cm 0cm 0.0001pt 36pt\">\r\n		<span style=\"color: null\"\r\n			><span style=\"font-size: 10pt\"\r\n				><span style=\"font-family: \'Times New Roman\', serif\"\r\n					><span style=\"font-family: \'Arial\', sans-serif\" lang=\"EN-US\"\r\n						>Recruit an eclectic cast of Guns and Fangs for Hire to fight by\r\n						your side. These new allies, as well as some familiar faces, each\r\n						bring unique and critical skills to the fray.</span\r\n					></span\r\n				></span\r\n			></span\r\n		>\r\n	</li>\r\n	<li style=\"margin: 0cm 0cm 0.0001pt 36pt\">\r\n		<span style=\"color: null\"\r\n			><span style=\"font-size: 10pt\"\r\n				><span style=\"font-family: \'Times New Roman\', serif\"\r\n					><span style=\"font-family: \'Arial\', sans-serif\" lang=\"EN-US\"\r\n						>Find the former doomsday cult and seek out the charismatic leader\r\n						who prophesized the collapse of civilization: Joseph Seed.</span\r\n					></span\r\n				></span\r\n			></span\r\n		>\r\n	</li>\r\n</ul>\r\n\r\n<p style=\"margin: 0cm 0cm 0.0001pt\">\r\n	<span style=\"color: null\"\r\n		><span style=\"font-size: 10pt\"\r\n			><span style=\"font-family: \'Times New Roman\', serif\"\r\n				><span lang=\"EN-US\"></span></span></span\r\n	></span>\r\n</p>\r\n\r\n<p style=\"margin: 0cm 0cm 0.0001pt\">\r\n	<span style=\"color: null\"\r\n		><span style=\"font-size: 10pt\"\r\n			><span style=\"font-family: \'Times New Roman\', serif\"\r\n				><b\r\n					><span style=\"font-family: \'Arial\', sans-serif\" lang=\"EN-US\"\r\n						>GROW THE SURVIVORS TO BUILD UP YOUR HOMEBASE</span\r\n					></b\r\n				><span\r\n					style=\"font-family: \'Arial\', sans-serif\"\r\n					lang=\"EN-US\"\r\n				></span></span></span\r\n	></span>\r\n</p>\r\n\r\n<ul>\r\n	<li style=\"margin: 0cm 0cm 0.0001pt 36pt\">\r\n		<span style=\"color: null\"\r\n			><span style=\"font-size: 10pt\"\r\n				><span style=\"font-family: \'Times New Roman\', serif\"\r\n					><span style=\"font-family: \'Arial\', sans-serif\" lang=\"EN-US\"\r\n						>Specialists join the Survivors to help you craft</span\r\n					><span style=\"font-family: \'Arial\', sans-serif\" lang=\"EN-US\">\r\n						weapons and vehicles, train your Guns for Hire, and even go on\r\n						Expeditions from the eight Homebase facilities: the workbench,\r\n						training camp, explosives lab, infirmary, garage, healing garden,\r\n						cartography, and expeditions.\r\n					</span></span\r\n				></span\r\n			></span\r\n		>\r\n	</li>\r\n	<li style=\"margin: 0cm 0cm 0.0001pt 36pt\">\r\n		<span style=\"color: null\"\r\n			><span style=\"font-size: 10pt\"\r\n				><span style=\"font-family: \'Times New Roman\', serif\"\r\n					><span style=\"font-family: \'Arial\', sans-serif\" lang=\"EN-US\"\r\n						>Grow your community and upgrade your Homebase to improve your\r\n						facilities and unlock more powerful weapons and gear.\r\n					</span></span\r\n				></span\r\n			></span\r\n		>\r\n	</li>\r\n</ul>\r\n\r\n<p style=\"margin: 0cm 0cm 0.0001pt 36pt\">\r\n	<span style=\"color: null\"\r\n		><span style=\"font-size: 10pt\"\r\n			><span style=\"font-family: \'Times New Roman\', serif\"\r\n				><b\r\n					><span\r\n						style=\"font-family: \'Arial\', sans-serif\"\r\n						lang=\"EN-US\"\r\n					></span></b></span></span\r\n	></span>\r\n</p>\r\n\r\n<p style=\"margin: 0cm 0cm 0.0001pt\">\r\n	<span style=\"color: null\"\r\n		><span style=\"font-size: 10pt\"\r\n			><span style=\"font-family: \'Times New Roman\', serif\"\r\n				><b\r\n					><span style=\"font-family: \'Arial\', sans-serif\" lang=\"EN-US\"\r\n						>BATTLE FOR RESOURCES IN HOPE COUNTY AND BEYOND</span\r\n					></b\r\n				><span\r\n					style=\"font-family: \'Arial\', sans-serif\"\r\n					lang=\"EN-US\"\r\n				></span></span></span\r\n	></span>\r\n</p>\r\n\r\n<ul>\r\n	<li style=\"margin: 0cm 0cm 0.0001pt 36pt\">\r\n		<span style=\"color: null\"\r\n			><span style=\"font-size: 10pt\"\r\n				><span style=\"font-family: \'Times New Roman\', serif\"\r\n					><span style=\"font-family: \'Arial\', sans-serif\" lang=\"EN-US\"\r\n						>Engage the Highwaymen in Turf Wars by clearing their outposts and\r\n						then scavenging them for Ethanol and other materials. When the\r\n						Highwaymen return with stronger reinforcements, you can take on a\r\n						greater challenge for even more of these valuable resources.</span\r\n					></span\r\n				></span\r\n			></span\r\n		>\r\n	</li>\r\n	<li style=\"margin: 0cm 0cm 0.0001pt 36pt\">\r\n		<span style=\"color: null\"\r\n			><span style=\"font-size: 10pt\"\r\n				><span style=\"font-family: \'Times New Roman\', serif\"\r\n					><span style=\"font-family: \'Arial\', sans-serif\" lang=\"EN-US\"\r\n						>For the first time in Far Cry, the adventure is not just local.\r\n						Venture outside of Hope County on thrilling Expeditions to unique\r\n						and memorable locations across the USA including wetlands, canyons,\r\n						and coastal regions.</span\r\n					><span\r\n						style=\"font-family: \'Arial\', sans-serif\"\r\n						lang=\"EN-US\"\r\n					></span></span></span\r\n		></span>\r\n	</li>\r\n	<li style=\"margin: 0cm 0cm 0.0001pt 36pt\">\r\n		<span style=\"color: null\"\r\n			><span style=\"font-size: 10pt\"\r\n				><span style=\"font-family: \'Times New Roman\', serif\"\r\n					><span style=\"font-family: Symbol\" lang=\"EN-US\"></span\r\n					><span style=\"font-family: \'Arial\', sans-serif\" lang=\"EN-US\"\r\n						>Expeditions and Outposts are different every playthrough, for\r\n						rewarding missions that increase in challenge and are surprising\r\n						every time.\r\n					</span></span\r\n				></span\r\n			></span\r\n		>\r\n	</li>\r\n</ul>\r\n', '                                                                                                                                                                <div class=\"section-content requirements-min\">\r\n	<h3>MINIMUM CONFIGURATION:</h3>\r\n	<hr />\r\n	<p>Requires a 64-bit processor and operating system</p>\r\n	<ul>\r\n		<li>\r\n			<font style=\"color: #bcbcbc\">OPERATING SYSTEM: </font>Windows 10 (64-bit\r\n			versions only)\r\n		</li>\r\n		<li>\r\n			<font style=\"color: #bcbcbc\">PROCESSOR: </font> Intel Core i5-2400 @ 3.1\r\n			GHz or AMD FX-6300 @ 3.5 GHz or equivalent\r\n		</li>\r\n		<li><font style=\"color: #bcbcbc\">RAM: </font>8GB</li>\r\n		<li>\r\n			<font style=\"color: #bcbcbc\">VIDEO CARD: </font>NVIDIA GeForce GTX 670 or\r\n			AMD R9 270 (2GB VRAM with Shader Model 5.0 or better)\r\n		</li>\r\n		<li><font style=\"color: #bcbcbc\">DIRECTX: </font>Version 9.0c</li>\r\n		<li>\r\n			<font style=\"color: #bcbcbc\">NETWORK: </font>Broadband Internet connection\r\n		</li>\r\n		<li><font style=\"color: #bcbcbc\">STORAGE: </font>40 GB available space</li>\r\n	</ul>\r\n</div>\r\n\r\n<br />\r\n\r\n<h3>RECOMMENDED CONFIGURATION:</h3>\r\n<hr />\r\n<ul>\r\n	<li>\r\n		<font style=\"color: #bcbcbc\">OPERATING SYSTEM: </font>Windows 10 (64-bit\r\n		versions only)\r\n	</li>\r\n\r\n	<li>\r\n		<font style=\"color: #bcbcbc\">PROCESSOR: </font>Intel Core i7-4770 @ 3.4 GHz\r\n		or AMD Ryzen 5 1600 @ 3.2 GHz or equivalent\r\n	</li>\r\n	<li><font style=\"color: #bcbcbc\">RAM: </font>8GB</li>\r\n	<li>\r\n		<font style=\"color: #bcbcbc\">VIDEO CARD: </font>NVIDIA GeForce GTX 970 or\r\n		AMD R9 290X (4GB VRAM with Shader Model 5.0 or better)\r\n	</li>\r\n	<li><font style=\"color: #bcbcbc\">DIRECTX: </font>Version 9.0c</li>\r\n	<li>\r\n		<font style=\"color: #bcbcbc\">NETWORK: </font>Broadband Internet connection\r\n	</li>\r\n	<li><font style=\"color: #bcbcbc\">HARD DRIVE: </font>40 GB available space</li>\r\n</ul>\r\n                                                                                                                                                '),
(6, 'Watch Dogs®: Legion', 1239000, 'premium', '7b7555704e1f8cdaee8db2765930796c.png', '                                                                                <p>\r\n	Build a resistance as you fight to take back a near-future London facing its\r\n	downfall. Welcome to the Resistance.\r\n</p>\r\n\r\n<br /><br />\r\n\r\n<p>\r\n	<b>Watch Dogs: Legion</b> is a 2020 action-adventure game developed by Ubisoft\r\n	Toronto and published by Ubisoft. The game is the sequel to 2016\'s Watch Dogs\r\n	2 and the third installment in the Watch Dogs series. Set within a\r\n	fictionalised representation of a futuristic, dystopian London, the game\'s\r\n	story follows the hacker syndicate DedSec as they seek to clear their names\r\n	after being framed for a series of terrorist bombings. While searching for the\r\n	true culprits, DedSec also attempt to liberate London\'s citizens from the\r\n	control of Albion, an oppressive private military company that has turned the\r\n	city into a surveillance state following the bombings. While the core gameplay\r\n	is similar to its predecessors, consisting of a combination of shooting,\r\n	driving, stealth, and hacking puzzles, Legion introduces a multiple playable\r\n	characters system, allowing players to recruit virtually any non-player\r\n	character found in the game\'s open world. Each playable character has their\r\n	own unique skills and backgrounds, and can be lost permanently if players\r\n	enable the option of permadeath before starting a new game. There are multiple\r\n	ways to complete missions depending on which playable character is selected.\r\n	In March 2021, a cooperative multiplayer mode was added to the game, allowing\r\n	up to four players to complete missions or explore London together.\r\n</p>\r\n\r\n<br />\r\n\r\n<p>\r\n	<b>Multiplayer</b>\r\n</p>\r\n\r\n<p>\r\n	The online component of the game, introduced in March 2021, allows for\r\n	four-player cooperative gameplay, which aimed to share progression between the\r\n	single-player and multiplayer modes.[8] The multiplayer experience offers\r\n	several different activities for players to engage in, including city events,\r\n	co-operative missions (including the more complex \"Tactical Ops\"), and the\r\n	\"Spiderbot Arena\" competitive mode, where players controlling miniature\r\n	spiderbot gadgets fight in free for all matches. The asymmetrical multiplayer\r\n	mode \"Invasion\" from the previous two Watch Dogs games made a return several\r\n	months after release, with several changes.\r\n</p>\r\n                                                                        ', '                                                                                <p>\r\n	<b>MINIMUM CONFIGURATION</b>\r\n</p>\r\n<hr />\r\n\r\nRequires a 64-bit processor and operating system\r\n<p>OS: Windows 10 (64-bit versions)</p>\r\n<p>Processor: Intel Core i5-4460 or AMD Ryzen 5 1400 290X</p>\r\n<p>Memory: 8 GB RAM</p>\r\n<p>\r\n	Graphics: NVIDIA GeForce GTX 970, NVIDIA GeForce GTX 1650, or AMD Radeon R9\r\n	290X DirectX: Version 11\r\n</p>\r\n<p>Network: Broadband Internet connection</p>\r\n<p>Storage: 115 GB available space</p>\r\n\r\n<br />\r\n\r\n<p>\r\n	<b>RECOMMENDED CONFIGURATION</b>\r\n</p>\r\n<hr />\r\n\r\nRequires a 64-bit processor and operating system\r\n<p>OS: Windows 10 (64-bit versions)</p>\r\n<p>Processor: Intel Core i7-4790 or AMD Ryzen 5 1600</p>\r\n<p>Memory: 8 GB RAM</p>\r\n<p>\r\n	Graphics: NVIDIA GeForce GTX 1060, NVIDIA GeForce GTX 1660 S, or AMD Radeon RX\r\n	480\r\n</p>\r\n<p>Network: Broadband Internet connection</p>\r\n<p>Storage: 115 GB available space</p>\r\n                                                                        '),
(7, 'Battlefield™ 2042', 259750, 'premium', '51f5a683e6a64d50f04f85491248b754.jpeg', '<p>\r\n	It’s all or nothing in Season 7: Turning Point. Battlefield™ 2042 is a\r\n	first-person shooter that marks the return to the iconic all-out warfare of\r\n	the franchise.\r\n</p>\r\n<p>\r\n	<b>WELCOME TO 2042</b>\r\n</p>\r\n<p>\r\n	Battlefield™ 2042 is a first-person shooter that marks the return to the\r\n	iconic all-out warfare of the franchise. With the help of a cutting-edge\r\n	arsenal, you can engage in intense, immersive multiplayer battles.\r\n</p>\r\n<p>\r\n	It’s all or nothing in Battlefield™ 2042 – Season 7: Turning Point Do whatever\r\n	it takes in Season 7: Turning Point, which brings the battle for Earth’s most\r\n	valuable resource to the Atacama Desert in Chile. There’s no holding back for\r\n	your squad as you engage in lawless, suburban combat on the new map Haven and\r\n	revisit a returning fan-favorite front: Stadium. Use destruction as your ally\r\n	and give the enemy everything you’ve got with new gear like the SCZ-3 SMG, the\r\n	Predator SRAW gadget, and the XFAD-4 Draugr aerial bomber*. Unlock 100 new\r\n	tiers of Battle Pass content in a battle for ultimate power.\r\n</p>\r\n<p>\r\n	Lead your team to victory in both large, all-out warfare and close-quarters\r\n	combat on maps from the world of 2042 and classic Battlefield titles. Find\r\n	your playstyle in class-based gameplay and take on several experiences,\r\n	including elevated versions of Conquest and Breakthrough. Explore Battlefield\r\n	Portal, a platform where players can discover, create, and share unexpected\r\n	battles from Battlefield\'s past and present.\r\n</p>\r\n', '<p>\r\n	<b> MINIMUM CONFIGURATION </b>\r\n</p>\r\n<hr />\r\n<p>Requires a 64-bit processor and operating system</p>\r\n<p>OS: 64-bit Windows 10</p>\r\n<p>Processor: AMD Ryzen 5 1600, Core i5 6600K</p>\r\n<p>Memory: 8 GB RAM</p>\r\n<p>Graphics: AMD Radeon RX 560,Nvidia GeForce GTX 1050 Ti</p>\r\n<p>DirectX: Version 12</p>\r\n<p>Network: Broadband Internet connection</p>\r\n<p>Storage: 100 GB available space</p>\r\n<p>Sound Card: No recommendation</p>\r\n\r\n<br />\r\n\r\n<p>\r\n	<b> RECOMMENDED CONFIGURATION </b>\r\n</p>\r\n<hr />\r\n<p>Requires a 64-bit processor and operating system</p>\r\n<p>OS: 64-bit Windows 10</p>\r\n<p>Processor: AMD Ryzen 7 2700X, Intel Core i7 4790</p>\r\n<p>Memory: 16 GB RAM</p>\r\n<p>Graphics: AMD Radeon RX 6600 XT, Nvidia GeForce RTX 3060</p>\r\n<p>DirectX: Version 12</p>\r\n<p>Network: Broadband Internet connection</p>\r\n<p>Storage: 100 GB available space</p>\r\n<p>Sound Card: No recommendation</p>\r\n');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('1','2') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2y$10$I52FUe8oEeyXPw8y6olwD.m12vecYpd0FiS66r2iN08cOiRmHE.I6', '1'),
(5, 'user', 'user@gmail.com', '$2y$10$AQYlbnQNxmv7geXScoacOOgPAT35DKMBoTDr4oNdk80.PBRHITaYa', '2'),
(6, 'user2', 'user2@gmail.com', '$2y$10$3ZQ5xiZQaehe7aACWL933Ot0PwuHSA5I1q7lefbiUJdAuB/u94RKi', '2');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders_confirm`
--
ALTER TABLE `orders_confirm`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `orders_confirm`
--
ALTER TABLE `orders_confirm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `orders_detail`
--
ALTER TABLE `orders_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `banners`
--
ALTER TABLE `banners`
  ADD CONSTRAINT `banners_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Ketidakleluasaan untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
