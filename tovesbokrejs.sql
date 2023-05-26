-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 26, 2023 at 02:47 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tovesbokrejs`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `first_name`, `last_name`) VALUES
(1, 'Camilla', 'Läckberg'),
(2, 'Astrid', 'Lindgren'),
(3, 'Lars', 'Kepler'),
(4, 'Jan', 'Guillou');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `genre` varchar(32) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `year`, `genre`, `author_id`) VALUES
(1, 'Harry Potter', 2001, 'Fantasy', 1),
(2, 'Huset vid sjön', 1999, 'Skräck', 1),
(3, 'Eldsvittnet', 2014, 'Thriller', 3),
(4, 'Att inte vilja se', 2005, 'Drama', 4),
(5, 'Pippi Långstrump', 1975, 'Familj', 2);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `review` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `title`, `review`, `user_id`, `book_id`) VALUES
(1, 'Recension på Att inte vilja se', 'En gripande dramabok som utforskar djupet av mänskliga relationer och de utmaningar som familjer kan ställas inför. Med sin starka emotionella laddning och trovärdiga karaktärer väcker Att inte vilja se starka känslor hos läsaren och bjuder på en berörande läsupplevelse.', 2, 4),
(2, 'Recension på Pippi Långstrump', 'En hjärtlig och humoristisk bokserie som sprudlar av fantasi och äventyr. Med den sprudlande och unika karaktären Pippi Långstrump tar böckerna läsarna med på roliga och fantasifulla äventyr, samtidigt som de förmedlar viktiga budskap om vänskap, mod och att vara sig själv.', 1, 5),
(3, 'Recension på Eldsvittnet', 'En nervkittlande thriller som fångar läsaren i en katt-och-råtta-lek fylld av spänning och fara. Med sina snabba tempo och välskrivna karaktärer skapar Eldsvittnet en spännande läsupplevelse som håller läsaren på kanten av stolen.', 3, 3),
(4, 'Recension på Harry Potter', 'En förtrollande och fantasifull bokserie som tar läsarna med på en magisk resa genom trollkarlsvärlden. Med sin välskrivna berättelse, karaktärernas djup och spännande äventyr fångar Harry Potter-serien läsare i alla åldrar och bjuder på en oförglömlig läsupplevelse.', 4, 1),
(5, 'Recension på Huset vid sjön', 'En gastkramande skräckroman som skapar en kuslig atmosfär och lockar läsaren djupare in i en mysteriös och obehaglig värld. Med sin spännande intrig och oväntade vändningar är Huset vid sjön en bok som håller läsaren på helspänn från början till slut.', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `age` int(11) NOT NULL,
  `email` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `age`, `email`) VALUES
(1, 'Tove', 26, 'tovan@live.se'),
(2, 'Rolf', 81, 'roffe@gmail.com'),
(3, 'Majken', 31, 'majkalajka@gmail.com'),
(4, 'Kasper', 52, 'kappe@live.se');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
