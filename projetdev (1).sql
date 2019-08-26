-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mar. 16 avr. 2019 à 11:16
-- Version du serveur :  10.1.35-MariaDB
-- Version de PHP :  7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projetdev`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

CREATE TABLE `adresse` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `pays` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ville` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `etat` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id`, `user_id`, `pays`, `adresse`, `ville`, `etat`) VALUES
(4, 3, 'Tunisie', 'gzre', 'zteze', 'egze'),
(5, 1, 'Algeria', 'fve', 'zerz', 'azez');

-- --------------------------------------------------------

--
-- Structure de la table `categorie_produit`
--

CREATE TABLE `categorie_produit` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `categorie_produit`
--

INSERT INTO `categorie_produit` (`id`, `libelle`, `image`, `updated_at`) VALUES
(1, 'CLIMB', '23c0c00b36fdba812270fe705f934aa5.png', '0000-00-00 00:00:00'),
(2, 'TRAVEL', 'JGMH35M4BBD7T3NP6KTSCKN5X.jpg', '0000-00-00 00:00:00'),
(8, 'SKING', 'W4CMUFD44Q6EBOGW82UPHGCL0.jpg', '0000-00-00 00:00:00'),
(9, 'SPORT', '24E8WQWUJ9HIT8DKXMIXFP4IL.jpg', '2019-02-27 21:54:31'),
(12, 'CAMPING', 'X366M71PJBHLS3ACICFRPK9GL.jpg', '2019-04-04 12:17:25'),
(13, 'tgre', 'JGMH35M4BBD7T3NP6KTSCKN5X.jpg', '2019-04-19 00:00:00'),
(14, 'gerf', 'JGMH35M4BBD7T3NP6KTSCKN5X.jpg', '2019-04-03 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `panier_id` int(11) DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` date NOT NULL,
  `visit` int(11) NOT NULL,
  `total` double(12,2) NOT NULL,
  `payer` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `panier_id`, `file`, `created`, `visit`, `total`, `payer`) VALUES
(3, 21, 'Facture1.pdf', '2019-04-10', 1, 0.00, 'chèque'),
(4, 21, 'Facture3.pdf', '2019-04-10', 1, 0.00, 'chèque'),
(5, 21, 'Facture4.pdf', '2019-04-10', 1, 4341.00, 'bancaire'),
(6, 21, 'Facture5.pdf', '2019-04-10', 1, 13009.00, 'chèque'),
(7, 21, 'Facture6.pdf', '2019-04-10', 1, 8675.00, 'bancaire'),
(8, 21, 'Facture7.pdf', '2019-04-10', 1, 8905.05, 'bancaire'),
(17, 21, 'Facture8.pdf', '2019-04-11', 1, 127.00, 'chèque'),
(18, 25, 'Facture17.pdf', '2019-04-15', 1, 8675.00, 'chèque'),
(19, 25, 'Facture18.pdf', '2019-04-15', 1, 8675.00, 'bancaire');

-- --------------------------------------------------------

--
-- Structure de la table `fos_user`
--

CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`) VALUES
(1, 'yassine', 'yassine', 'yassine.lahbib@esprit.tn', 'yassine.lahbib@esprit.tn', 1, NULL, '$2y$13$5G9sn/IycNvFuxTPBZCzB..ImWnIznca7lZIc3qqhp0Beeh.B0G9.', '2019-02-11 21:56:56', NULL, NULL, 'a:0:{}'),
(2, 'yassinelahbib', 'yassinelahbib', 'yassinelahbib1111@gmail.com', 'yassinelahbib1111@gmail.com', 1, NULL, '$2y$13$IFM.LcFtCo4plVEb5u20v.6l72sZpNwNs3V3DjgCZCQHg8cmQ9OHu', '2019-02-28 11:51:24', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}'),
(3, 'solta', 'solta', 'zoehorhe@azeoz.fr', 'zoehorhe@azeoz.fr', 1, NULL, '$2y$13$AiK7qskeqzy9bC/6Ej6jHOloYVfRYeLdS2PjtAQr.oxMJ8cemCJRq', '2019-02-27 21:35:18', NULL, NULL, 'a:0:{}'),
(4, 'test', 'test', 'test@test.com', 'test@test.com', 1, NULL, '$2y$13$bA.lCYNZsfy15jyQosjSqu6X6C/jCtWD2ViAT6hySXTSExwVEtQIW', '2019-02-14 09:27:27', NULL, NULL, 'a:0:{}'),
(5, 'yyyy', 'yyyy', 'yyyy@e.tn', 'yyyy@e.tn', 1, NULL, '$2y$13$0guodXPqX83Ns3y9.AhHAeBZ2fd9zJI9LNrfa9kEcnuUaFNbMTC.W', NULL, NULL, NULL, 'a:0:{}'),
(6, 'kk', 'kk', 'kkk@gmail.com', 'kkk@gmail.com', 1, NULL, '$2y$13$HZzxc.Uc4BUasZP7gTgdKehe5.PUbpxxc4gOKmF/kpVOsPIi8KbzW', NULL, NULL, NULL, 'a:0:{}'),
(7, 'aaa', 'aaa', 'aaa@d.c', 'aaa@d.c', 1, NULL, '$2y$13$9iFUS1zb9Ub0ZRwlBSZLXOk91jZI9kHCEKpa6bERn8YyWCx/plP.W', NULL, NULL, NULL, 'a:0:{}'),
(8, 'sss', 'sss', 'sss@sss.com', 'sss@sss.com', 1, NULL, '$2y$13$SETN6NIi2tfeuCA1pcmc/.XiKjUhdUz83ItANJkv4/Tvzyz/IL1V6', NULL, NULL, NULL, 'a:0:{}'),
(9, 'zzz', 'zzz', 'zzz', 'zzz', 1, NULL, '$2y$13$sS/2Q/90CMBbn6UgQj1h7eI7vdQ9Fj8Xp6QtJiIBgoekkBwrTxPv2', NULL, NULL, NULL, 'a:0:{}'),
(10, 'az', 'az', 'az', 'az', 1, NULL, '$2y$13$0e3kNEKka6vm9U/kGMWxwOj1hvmxg7Mhh67nzsqPQjBuz3DQUIqIC', NULL, NULL, NULL, 'a:0:{}'),
(11, 'yassineee', 'yassineee', 'aze', 'aze', 1, NULL, '$2y$13$Talz5FYqVWp5xXaJOzrYG.BY5FbyaYFaFroD2Xy.Zk9EKnTFJ8jsO', NULL, NULL, NULL, 'a:0:{}'),
(12, 'azzezerz', 'azzezerz', 'aaaa', 'aaaa', 1, NULL, '$2y$13$pDt9EAa5eE6DkvhN2ddmK.pVcRSW/kjpAoaYRuKtNfOXzUKb8jMpW', NULL, NULL, NULL, 'a:0:{}');

-- --------------------------------------------------------

--
-- Structure de la table `lignedepanier`
--

CREATE TABLE `lignedepanier` (
  `id` int(11) NOT NULL,
  `produit_id` int(11) DEFAULT NULL,
  `panier_id` int(11) DEFAULT NULL,
  `quantite` int(11) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `lignedepanier`
--

INSERT INTO `lignedepanier` (`id`, `produit_id`, `panier_id`, `quantite`, `created`) VALUES
(114, 5, 20, 1, '2019-04-11 00:00:00'),
(116, 8, 26, 1, '2019-04-14 14:30:38'),
(117, 8, 28, 1, '2019-04-16 11:01:36');

-- --------------------------------------------------------

--
-- Structure de la table `like_produit`
--

CREATE TABLE `like_produit` (
  `id` int(11) NOT NULL,
  `produit_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `like_produit`
--

INSERT INTO `like_produit` (`id`, `produit_id`, `created`, `user_id`) VALUES
(8, 3, '2019-02-27 12:14:09', 2),
(12, 6, '2019-02-27 20:42:03', 2),
(13, 6, '2019-02-27 20:43:23', 3),
(14, 8, '2019-02-27 22:12:12', 2),
(16, 9, '2019-02-28 10:13:10', 2);

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE `panier` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total` double(12,2) NOT NULL,
  `nbr_produit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `panier`
--

INSERT INTO `panier` (`id`, `user_id`, `total`, `nbr_produit`) VALUES
(20, 2, 7.00, 0),
(21, 3, 7.00, 0),
(25, 1, 7.00, 0),
(26, 4, 4341.00, 1),
(28, 12, 4341.00, 1);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `souscategorie_id` int(11) DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `prix` double(12,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `firstimg` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secondimg` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thirdimg` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `taille` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `promotion` float NOT NULL,
  `idpromo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `souscategorie_id`, `libelle`, `description`, `prix`, `stock`, `firstimg`, `secondimg`, `thirdimg`, `taille`, `color`, `created`, `updated_at`, `promotion`, `idpromo`) VALUES
(1, 4, 'Casque', 'Lorem ipsum dolor sit amet, consectetur adipisicing elitse do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercita tio ullamco laboris nisi ut aliquip.', 454.00, 7, '1fb6418e8443fbc9af0dc7191d835ccc.jpeg', '890c18c8d5e69cbef45b75e5c2599747.jpeg', '20310b272d016f1b1f027f4ea3c994fd.jpeg', 'xl', '#000000', '2019-02-20 11:11:35', '0000-00-00 00:00:00', 0, 0),
(2, 2, '32 SHILOH JACKET', 'Sed ac enim eu massa lacinia semper. Nam egestas consequat libero sit amet sodales. Phasellus faucibus quis turpis et iaculis. Sed dignissim erat ut aliquam egestas. Duis feugiat tincidunt lobortis. Fusce hendrerit lectus viverra quam euismod ullamcorper.', 230.00, 5, 'img4.jpg', 'img44.jpg', 'img55.jpg', 'xl', '#f87654', '2019-02-26 09:53:00', '0000-00-00 00:00:00', 0, 0),
(3, 1, '32 SHILOH JACKETF', 'Sed ac enim eu massa lacinia semper. Nam egestas consequat libero sit amet sodales. Phasellus faucibus quis turpis et iaculis. Sed dignissim erat ut aliquam egestas. Duis feugiat tincidunt lobortis. Fusce hendrerit lectus viverra quam euismod ullamcorper.', 230.00, 6, 'img5.jpg', 'img44.jpg', 'img55.jpg', 'xl', '#f35654', '2019-02-26 09:53:00', '2019-02-28 06:46:49', 0, 0),
(4, 2, '32 SHILOH JACKETD', 'Sed ac enim eu massa lacinia semper. Nam egestas consequat libero sit amet sodales. Phasellus faucibus quis turpis et iaculis. Sed dignissim erat ut aliquam egestas. Duis feugiat tincidunt lobortis. Fusce hendrerit lectus viverra quam euismod ullamcorper.', 230.00, 4, 'img4.jpg', 'img44.jpg', 'img55.jpg', 'xl', '#f87654', '2019-02-26 09:53:00', '0000-00-00 00:00:00', 0, 0),
(5, 3, '32 SHILOH JACKET', 'Sed ac enim eu massa lacinia semper. Nam egestas consequat libero sit amet sodales. Phasellus faucibus quis turpis et iaculis. Sed dignissim erat ut aliquam egestas. Duis feugiat tincidunt lobortis. Fusce hendrerit lectus viverra quam euismod ullamcorper.', 120.00, 440, 'img4.jpg', 'img44.jpg', 'img55.jpg', 'xl', '#f87654', '2019-02-26 09:53:00', '0000-00-00 00:00:00', 0, 0),
(6, 4, '32 SHILOH JACKET', 'Sed ac enim eu massa lacinia semper. Nam egestas consequat libero sit amet sodales. Phasellus faucibus quis turpis et iaculis. Sed dignissim erat ut aliquam egestas. Duis feugiat tincidunt lobortis. Fusce hendrerit lectus viverra quam euismod ullamcorper.', 230.00, 0, 'img4.jpg', 'img44.jpg', 'img55.jpg', 'xl', '#f87654', '2019-02-26 09:53:00', '0000-00-00 00:00:00', 0, 0),
(7, 5, '32 SHILOH JACKET', 'Sed ac enim eu massa lacinia semper. Nam egestas consequat libero sit amet sodales. Phasellus faucibus quis turpis et iaculis. Sed dignissim erat ut aliquam egestas. Duis feugiat tincidunt lobortis. Fusce hendrerit lectus viverra quam euismod ullamcorper.', 230.00, 0, 'img4.jpg', 'img44.jpg', 'img55.jpg', 'xl', '#f87654', '2019-02-26 09:53:00', '0000-00-00 00:00:00', 0, 0),
(8, 6, 'Stripe', 'efzerge', 4334.00, 8, 'img4.jpg', 'stripe-toggle-front-stripe-long-cardigan (1).jpg', 'stripe-toggle-front-stripe-long-cardigan.jpg', 's', '#000000ff', '2019-02-21 00:00:00', '2019-02-27 22:13:37', 0, 0),
(9, 3, 'Bag', 'efzerge', 4334.02, 12, 'Sac.jpg', 'img1.jpg', 'U1CO9KUKJJOS4ZBGLD.jpg', 's', '#000000ff', '2019-02-21 00:00:00', '2019-02-27 22:18:09', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `sous_categorie_produit`
--

CREATE TABLE `sous_categorie_produit` (
  `id` int(11) NOT NULL,
  `categorie_id` int(11) DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `sous_categorie_produit`
--

INSERT INTO `sous_categorie_produit` (`id`, `categorie_id`, `libelle`, `Created`) VALUES
(1, 8, 'shoes', '2019-02-17 15:54:46'),
(2, 2, 'jeans', '2019-02-08 11:00:00'),
(3, 9, 'Bag', '2019-02-27 21:55:36'),
(4, 12, 'Bontrager', '2019-02-27 21:56:40'),
(5, 1, 'test', '2019-04-04 12:56:29'),
(6, 9, 'eeeeeee', '2019-04-11 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `tablefille`
--

CREATE TABLE `tablefille` (
  `id` int(11) NOT NULL,
  `tablemere_id` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `tablefille`
--

INSERT INTO `tablefille` (`id`, `tablemere_id`, `libelle`) VALUES
(1, 1, 'rr');

-- --------------------------------------------------------

--
-- Structure de la table `tablemere`
--

CREATE TABLE `tablemere` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `tablemere`
--

INSERT INTO `tablemere` (`id`, `libelle`) VALUES
(1, 'rr');

-- --------------------------------------------------------

--
-- Structure de la table `vente__produit`
--

CREATE TABLE `vente__produit` (
  `id` int(11) NOT NULL,
  `produit_id` int(11) DEFAULT NULL,
  `nbr_produit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `vente__produit`
--

INSERT INTO `vente__produit` (`id`, `produit_id`, `nbr_produit`) VALUES
(1, 5, 1),
(2, 4, 4),
(3, 6, 3),
(4, 3, 3),
(5, 7, 6),
(6, 8, 2),
(7, 8, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C35F0816A76ED395` (`user_id`);

--
-- Index pour la table `categorie_produit`
--
ALTER TABLE `categorie_produit`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6EEAA67DF77D927C` (`panier_id`);

--
-- Index pour la table `fos_user`
--
ALTER TABLE `fos_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479C05FB297` (`confirmation_token`);

--
-- Index pour la table `lignedepanier`
--
ALTER TABLE `lignedepanier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_96D2617FF347EFB` (`produit_id`),
  ADD KEY `IDX_96D2617FF77D927C` (`panier_id`);

--
-- Index pour la table `like_produit`
--
ALTER TABLE `like_produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7A28A604F347EFB` (`produit_id`),
  ADD KEY `IDX_7A28A604A76ED395` (`user_id`);

--
-- Index pour la table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_24CC0DF2A76ED395` (`user_id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_29A5EC27A27126E0` (`souscategorie_id`);

--
-- Index pour la table `sous_categorie_produit`
--
ALTER TABLE `sous_categorie_produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B7039772BCF5E72D` (`categorie_id`);

--
-- Index pour la table `tablefille`
--
ALTER TABLE `tablefille`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_34D07E919E3F264E` (`tablemere_id`);

--
-- Index pour la table `tablemere`
--
ALTER TABLE `tablemere`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vente__produit`
--
ALTER TABLE `vente__produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FDB8E5BEF347EFB` (`produit_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `categorie_produit`
--
ALTER TABLE `categorie_produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `fos_user`
--
ALTER TABLE `fos_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `lignedepanier`
--
ALTER TABLE `lignedepanier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT pour la table `like_produit`
--
ALTER TABLE `like_produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `panier`
--
ALTER TABLE `panier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `sous_categorie_produit`
--
ALTER TABLE `sous_categorie_produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `tablefille`
--
ALTER TABLE `tablefille`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `tablemere`
--
ALTER TABLE `tablemere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `vente__produit`
--
ALTER TABLE `vente__produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `FK_C35F0816A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user` (`id`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_6EEAA67DF77D927C` FOREIGN KEY (`panier_id`) REFERENCES `panier` (`id`);

--
-- Contraintes pour la table `lignedepanier`
--
ALTER TABLE `lignedepanier`
  ADD CONSTRAINT `FK_96D2617FF347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`),
  ADD CONSTRAINT `FK_96D2617FF77D927C` FOREIGN KEY (`panier_id`) REFERENCES `panier` (`id`);

--
-- Contraintes pour la table `like_produit`
--
ALTER TABLE `like_produit`
  ADD CONSTRAINT `FK_7A28A604A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user` (`id`),
  ADD CONSTRAINT `FK_7A28A604F347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `FK_24CC0DF2A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user` (`id`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `FK_29A5EC27A27126E0` FOREIGN KEY (`souscategorie_id`) REFERENCES `sous_categorie_produit` (`id`);

--
-- Contraintes pour la table `sous_categorie_produit`
--
ALTER TABLE `sous_categorie_produit`
  ADD CONSTRAINT `FK_B7039772BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie_produit` (`id`);

--
-- Contraintes pour la table `tablefille`
--
ALTER TABLE `tablefille`
  ADD CONSTRAINT `FK_34D07E919E3F264E` FOREIGN KEY (`tablemere_id`) REFERENCES `tablemere` (`id`);

--
-- Contraintes pour la table `vente__produit`
--
ALTER TABLE `vente__produit`
  ADD CONSTRAINT `FK_FDB8E5BEF347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
