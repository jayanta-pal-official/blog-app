-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2025 at 06:47 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog-app`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `added_by`, `created_at`, `updated_at`) VALUES
(1, 'Food', 'food', 1, '2024-12-06 02:53:49', '2024-12-09 08:00:36'),
(2, 'Tech', 'tech', 3, '2024-12-06 02:58:20', '2024-12-06 02:58:20'),
(3, 'Travel', 'travel', 3, '2024-12-09 01:50:54', '2024-12-09 01:50:54'),
(5, 'News', 'news', 3, '2024-12-09 01:51:20', '2024-12-11 01:55:24'),
(7, 'test 567', 'test-567', 1, '2025-01-07 02:43:32', '2025-01-07 02:43:32'),
(8, 'hthrth', 'hthrth', 1, '2025-01-07 02:43:42', '2025-01-07 02:43:42');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(12, '0001_01_01_000002_create_jobs_table', 2),
(13, '2024_12_03_061604_create_categories_table', 2),
(14, '2024_12_03_075533_create_posts_table', 2),
(15, '2024_12_06_080859_add_added_by_field_to_categories', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('jayanta@klizos.com', '$2y$12$745W0ti0Wr1If4e1sa0.MeUe6tsSndmfoCkR9ct9NYSw5ADcydNsi', '2024-12-02 06:20:57');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `cat_id` bigint(20) UNSIGNED NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `slug`, `image`, `user_id`, `cat_id`, `views`, `created_at`, `updated_at`) VALUES
(4, 'Planet A Foods nabs $30M to make tons more cocoa-free chocolateb', '<p>Turning sunflower seeds into sustainable, cocoa-free chocolate has netted Munich-based B2B food tech startup <a href=\"https://planet-a-foods.com/\">Planet A Foods</a> (formerly <a href=\"https://techcrunch.com/2021/10/27/qoa-brings-in-seed-round-to-do-for-chocolate-what-oatly-did-for-milk/\">QOA</a>) a $30 million Series B funding round. Now, the Y Combinator alum is gearing up for industrialization, with the funds set to be deployed to scale its production capacity by around 7.5x. The round fast follows a <a href=\"https://techcrunch.com/2024/02/01/planet-a-foods-cocoa-free-chocolate/\">$15.4 million Series A back in February</a>.</p><p>Currently, the startup is producing 2,000 tons of ChoViva, as it calls its cocoa-free, lower carbon chocolate alternative, per year. It plans to step that up to over 15,000 tons as it adds capacity and kicks off international expansion outside an initial trio of European markets.</p><p>Opening its first U.S.-based production facility is on the cards. Building on the three local markets (Germany, Austria, and Switzerland) where its chocolate substitute is already in food products that aim to tempt sweet-toothed consumers, it is also eyeing launches into the U.K. and France during the first quarter of 2025. Brands buying into ChoViva so far include Lambertz, Lindt, Rewe Group, and even the German train operator, Deutsche Bahn, which doubtless pops a lot of chocolate treats on customers’ tea trays every day.</p><p>So far, the startup has around 20 customers for its alt chocolate ingredients, mostly major European food manufacturers but also some U.S. brands. As it grows capacity, it’ll be aiming to add more strategic partners too.</p><h2>Cocoa, not so sweet</h2><p>The problem Planet A Foods is tackling is making a staple sweet treat (chocolate) less of an environmental horror. Traditional cocoa-based chocolate production raises serious sustainability issues, since the crop grows in areas with rainforest, which can be cut down to make way for cocoa bean plantations. Global demand is also outstripping an increasingly fragile (and ethically fraught) supply, leading to inflated costs and fears for the future of the cocoa bean in a rapidly warming world.</p><p>Supplying the food industry with an alternative chocolate-esque ingredient that — just like the real deal — can be baked into or folded onto snack products like breakfast cereals, confectionary, and cakes is Planet A’s mission. And it’s not a trivial goal: The startup reckons an annual toll of some 500 million tons of CO2 could be avoided through switching bulk chocolate production away from cocoa beans to its more sustainable method that avoids deforestation and localizes ingredients sourcing.</p><p>The ingredients it uses to produce ChoViva have been selected in part as they can be grown locally (oats are another of its staples) — hence it claims a carbon footprint that’s up to 80% lower than conventional chocolate (but note that higher bound is for the vegan version of ChoViva which, unlike other blends, doesn’t contain any milk products).</p><p>&nbsp;</p><p><strong>TC Sessions: AI</strong><br><strong>Join 1,200 tech leaders for a full day of main-stage sessions, breakouts and networking at TechCrunch Sessions: AI. Get on the waitlist to be among the first for early registrations.</strong></p><p><strong>Location TBA</strong> | June 5, 2025</p><p><a href=\"https://share.hsforms.com/1yTwVrkN9TheNpVfzKpXLQgq997c\"><strong>GET ON WAITLIST</strong></a></p><p>“We’re not against chocolate,” stresses co-founder and CEO Dr. Maximilian Marquart, one half of the brother-sister founder team behind Planet A Foods. CTO Dr. Sara Marquart is the food scientist who developed the process for making the cocoa-free chocolate. “That’s very important. So we’re not taking away your [premium] chocolate. We’re after all the snacking applications — [confectionary such as] M&amp;Ms, Snickers, Mars, Bounty, you know, all that stuff.”</p><p>Premium chocolate is a tiny market compared to the bulk business of mass market confectionary that Planet A Foods is targeting. And in this domain, where environmental degradation occurs at terrible scale, the quality of the chocolate that’s used is generally lower, often because it’s lower in actual cocoa-content — hence [Maximilian] Marquart argues there’s no difference between how ChoViva tastes, and the stuff consumers are routinely being sold in mass market products. “It’s indistinguishable,” he suggests.</p><p>“My sister Sara . . . found out that actually 80% of the typical chocolate flavors come from the <i>processing</i> of the cocoa beans and not from the beans itself — so . . . if eight out of 10 flavors are actually coming from fermentation roasting, why do you need cocoa beans?”</p><h2>Scaling for impact</h2><p>The economics also make ChoViva an attractive switch for the industrial food industry, as the startup tells it, since the product is not subject to the price volatility that can hit cocoa beans as a limited resource. But for such a switch to happen, the startup needs to be able to produce its alternative at the volumes that food giants demand — so there’s a long road of scaling ahead for the team.</p><p>At this point, the production capacity for ChoViva still represents an incredibly tiny portion of the global cocoa bean harvest — which [Maximilian] Marquart notes is between 4 million and 5 million tons annually. So it will require giant leaps in production capacity to have the massive positive sustainability change the Marquarts want.</p><p>“We’ve already acquired the machines [for this stage of industrialization]. So we are already in the scale-up runs, and we have some real industrial clients already, so we’re currently just trying to cope with the demand in Europe,” he says, adding: “We’re automating. We’re improving the processes. We are also commissioning new machines. Plus, we are currently planning another facility in the States.”</p><p>They are also exploring how the business might respond to demand from Asia ([Maximilian] Marquart happens to be on a business trip to Japan when we talk). But he says they also recognize that, as a startup, they do need to focus, too.</p><p>“We’re a startup . . . we’re not naive. So we can’t conquer the world alone,” he tells TechCrunch. “I think U.K. and U.S. are the main markets where we will expand. However, in Asia we have a lot of demand, so we’re currently investigating what we do here — what we can do alone, and together with partners eventually.”</p><h2>Supply chain all-nighters</h2><p>Being in the (quasi) chocolate-making business might conjure up quaint images of high-hatted chocolatiers gently whipping batches of sweet stuff in charmingly rustic environs. But don’t be fooled: the business of manufacturing ChoViva is already sweating toil.</p><p>Having everything in place to be able to precisely produce tons of cocoa-free chocolate to ship out exactly when customers need it has required the founders to pull some all-nighters at the plant. And [Maximilian] Marquart says a big focus for this tranche of scaling is automation — so they can reduce the risk of human errors causing supply chain headaches.</p><blockquote><p>We slept under those machines . . . Every day our life is a hell given the challenges that we have in the supply chain.”</p></blockquote><p>“I think currently we’re at a scale — industrial scale — that no one else is,” he suggests when asked about the competitive landscape for cocoa-free chocolate. Other startups he name-checks are Foreverland, Nukoko, WinWin, and Voyage Foods. They are using various methods and base ingredients (including cereals, broad beans, carob, grape seeds, and more) to blend up rival cocoa-free chocolate products. So there’s a range of approaches in play.</p><p>In this context, and, indeed, for almost any kind of startup, succeeding “takes more than just developing a product” — or, in this case, an ingredient in a lab — and [Maximilian] Marquart says this invention element represents only 5% of the challenge they’ve set themselves.</p><p>“The main challenge lies in building up production, building up quality management, building up the supply chain. Every day, two 40-ton lorries leave our factory with our product. And that’s something that someone else needs to figure out. It’s really a challenge,” he emphasizes, adding: “Sara — my sister — and I, we slept under those machines. We really figured out the supply chain. It’s a big hassle. Every day our life is a hell given the challenges that we have in the supply chain.”</p><figure class=\"image\"><img src=\"https://techcrunch.com/wp-content/uploads/2024/12/01_Management_left-to-right_Laura-Schneider_Dr.-Maximilian-Marquart_Michael-Hampel_Dr.-Sara-Marquart_Stefan-Rost_Ute-Schellenberg_Source-Planet-A-Foods_Photographer-Maria-Boger.jpg?w=680\" alt=\"\" srcset=\"https://techcrunch.com/wp-content/uploads/2024/12/01_Management_left-to-right_Laura-Schneider_Dr.-Maximilian-Marquart_Michael-Hampel_Dr.-Sara-Marquart_Stefan-Rost_Ute-Schellenberg_Source-Planet-A-Foods_Photographer-Maria-Boger.jpg 3511w, https://techcrunch.com/wp-content/uploads/2024/12/01_Management_left-to-right_Laura-Schneider_Dr.-Maximilian-Marquart_Michael-Hampel_Dr.-Sara-Marquart_Stefan-Rost_Ute-Schellenberg_Source-Planet-A-Foods_Photographer-Maria-Boger.jpg?resize=150,112 150w, https://techcrunch.com/wp-content/uploads/2024/12/01_Management_left-to-right_Laura-Schneider_Dr.-Maximilian-Marquart_Michael-Hampel_Dr.-Sara-Marquart_Stefan-Rost_Ute-Schellenberg_Source-Planet-A-Foods_Photographer-Maria-Boger.jpg?resize=300,225 300w, https://techcrunch.com/wp-content/uploads/2024/12/01_Management_left-to-right_Laura-Schneider_Dr.-Maximilian-Marquart_Michael-Hampel_Dr.-Sara-Marquart_Stefan-Rost_Ute-Schellenberg_Source-Planet-A-Foods_Photographer-Maria-Boger.jpg?resize=768,576 768w, https://techcrunch.com/wp-content/uploads/2024/12/01_Management_left-to-right_Laura-Schneider_Dr.-Maximilian-Marquart_Michael-Hampel_Dr.-Sara-Marquart_Stefan-Rost_Ute-Schellenberg_Source-Planet-A-Foods_Photographer-Maria-Boger.jpg?resize=680,510 680w, https://techcrunch.com/wp-content/uploads/2024/12/01_Management_left-to-right_Laura-Schneider_Dr.-Maximilian-Marquart_Michael-Hampel_Dr.-Sara-Marquart_Stefan-Rost_Ute-Schellenberg_Source-Planet-A-Foods_Photographer-Maria-Boger.jpg?resize=1200,900 1200w, https://techcrunch.com/wp-content/uploads/2024/12/01_Management_left-to-right_Laura-Schneider_Dr.-Maximilian-Marquart_Michael-Hampel_Dr.-Sara-Marquart_Stefan-Rost_Ute-Schellenberg_Source-Planet-A-Foods_Photographer-Maria-Boger.jpg?resize=1280,960 1280w, https://techcrunch.com/wp-content/uploads/2024/12/01_Management_left-to-right_Laura-Schneider_Dr.-Maximilian-Marquart_Michael-Hampel_Dr.-Sara-Marquart_Stefan-Rost_Ute-Schellenberg_Source-Planet-A-Foods_Photographer-Maria-Boger.jpg?resize=430,322 430w, https://techcrunch.com/wp-content/uploads/2024/12/01_Management_left-to-right_Laura-Schneider_Dr.-Maximilian-Marquart_Michael-Hampel_Dr.-Sara-Marquart_Stefan-Rost_Ute-Schellenberg_Source-Planet-A-Foods_Photographer-Maria-Boger.jpg?resize=720,540 720w, https://techcrunch.com/wp-content/uploads/2024/12/01_Management_left-to-right_Laura-Schneider_Dr.-Maximilian-Marquart_Michael-Hampel_Dr.-Sara-Marquart_Stefan-Rost_Ute-Schellenberg_Source-Planet-A-Foods_Photographer-Maria-Boger.jpg?resize=900,675 900w, https://techcrunch.com/wp-content/uploads/2024/12/01_Management_left-to-right_Laura-Schneider_Dr.-Maximilian-Marquart_Michael-Hampel_Dr.-Sara-Marquart_Stefan-Rost_Ute-Schellenberg_Source-Planet-A-Foods_Photographer-Maria-Boger.jpg?resize=800,600 800w, https://techcrunch.com/wp-content/uploads/2024/12/01_Management_left-to-right_Laura-Schneider_Dr.-Maximilian-Marquart_Michael-Hampel_Dr.-Sara-Marquart_Stefan-Rost_Ute-Schellenberg_Source-Planet-A-Foods_Photographer-Maria-Boger.jpg?resize=1536,1152 1536w, https://techcrunch.com/wp-content/uploads/2024/12/01_Management_left-to-right_Laura-Schneider_Dr.-Maximilian-Marquart_Michael-Hampel_Dr.-Sara-Marquart_Stefan-Rost_Ute-Schellenberg_Source-Planet-A-Foods_Photographer-Maria-Boger.jpg?resize=2048,1536 2048w, https://techcrunch.com/wp-content/uploads/2024/12/01_Management_left-to-right_Laura-Schneider_Dr.-Maximilian-Marquart_Michael-Hampel_Dr.-Sara-Marquart_Stefan-Rost_Ute-Schellenberg_Source-Planet-A-Foods_Photographer-Maria-Boger.jpg?resize=668,501 668w, https://techcrunch.com/wp-content/uploads/2024/12/01_Management_left-to-right_Laura-Schneider_Dr.-Maximilian-Marquart_Michael-Hampel_Dr.-Sara-Marquart_Stefan-Rost_Ute-Schellenberg_Source-Planet-A-Foods_Photographer-Maria-Boger.jpg?resize=500,375 500w, https://techcrunch.com/wp-content/uploads/2024/12/01_Management_left-to-right_Laura-Schneider_Dr.-Maximilian-Marquart_Michael-Hampel_Dr.-Sara-Marquart_Stefan-Rost_Ute-Schellenberg_Source-Planet-A-Foods_Photographer-Maria-Boger.jpg?resize=823,617 823w, https://techcrunch.com/wp-content/uploads/2024/12/01_Management_left-to-right_Laura-Schneider_Dr.-Maximilian-Marquart_Michael-Hampel_Dr.-Sara-Marquart_Stefan-Rost_Ute-Schellenberg_Source-Planet-A-Foods_Photographer-Maria-Boger.jpg?resize=708,531 708w\" sizes=\"100vw\" width=\"3511\"></figure><p>The startup’s management team, with its brother-sister co-founder duo pictured center<strong>Image Credits:</strong>Planet A Foods</p><p>“Most of the other competitors, they have great products, but they need to bring that into reality, and need to be really able to deliver it to their customers, and that lies ahead of them. It’s incredibly difficult to deliver 40 tons of chocolate to a customer in time, at the right place, at the right recipe, the right quality.”</p><p>Planet A Foods’ Series B was co-led by Burda Principal Investments and Zintinus, with participation from AgriFoodTech Venture Alliance, Bayern Kapital, Cherry Ventures, Omnes Capital, Tengelmann Ventures, and World Fund.</p><h2>R&amp;D</h2><p>Scaling aside, funding will also go on further research and development, as the team is working on an alternative to cocoa butter, which is another key ingredient for the food industry. Being able to offer a replacement for palm oil is another goal, as that also creates huge sustainability problems. The startup also believes its approach could work to replace other specialty fats that are used in food production, such as stearin, an animal fat, or coconut oil, per [Maximilian] Marquart.</p><p>“[Sara] developed a kind of full fermentation platform where we can make bio identical coco butter,” he notes, saying bio identical in this context “means the right mouthful, the right snap, the right melting point, the right properties.”</p><p>“With our fermentation technology, we can offer a bio identical cocoa butter using fermentation at a much lower price than conventional cocoa butter, and that’s really a game changer in the future,” he suggests. “I think we’re the only company that is actually able to produce cocoa butter using fermentation at a lower price than natural cocoa butter.”</p><p>There’s an additional challenge here, though. For one version of the cocoa butter, which [Maximilian] Marquart suggests yields the best set of properties, they use precision fermentation. It’s a biotech method that involves genetically engineered microorganisms. This version of the product has to be approved as a novel food before it can be sold. And since European regulations are more stringent, he suggests it could hit the U.S. market first.</p>', 'planet-a-foods-nabs-30m-to-make-tons-more-cocoa-free-chocolateb-1', '1733473838-04_ChoViva-bar_Source_-Planet-A-Foods_Photographer_-Daniel-Schvarcz.webp', 7, 5, 14, '2024-12-06 03:00:38', '2024-12-11 00:50:36'),
(5, 'Elon Musk’s xAI lands $6B in new cash to fuel AI ambitions', '<p>xAI, Elon Musk’s AI company, has <a href=\"https://www.sec.gov/Archives/edgar/data/2002695/000200269524000003/xslFormDX01/primary_doc.xml\">raised</a> $6 billion, according to a filing with the U.S. Securities and Exchange Commission on Thursday.</p><p>Investors gave a minimum of $77,593, per the filing (97 participated, but the document doesn’t reveal their identities). The Wall Street Journal previously <a href=\"https://www.wsj.com/tech/ai/elon-musks-startup-xai-valued-at-50-billion-in-new-funding-round-7e3669dc\">reported</a> that Valor Equity Partners, Sequoia Capital, and Andreessen Horowitz were expected to contribute to the round, along with Qatar Investment Authority, Qatar’s sovereign wealth fund.</p><p>The new cash brings xAI’s total raised to $12 billion, adding to the $6 billion tranche xAI <a href=\"https://techcrunch.com/2024/05/26/elon-musks-xai-raises-6b-from-valor-a16z-and-sequoia/\">raised</a> this spring. CNBC <a href=\"https://www.cnbc.com/2024/11/15/elon-musks-xai-raising-up-to-6-billion-to-purchase-100000-nvidia-chips-for-memphis-data-center.html\">reported</a> in November that xAI was aiming for a $50 billion valuation — double its valuation as of six months ago.</p><p><a href=\"https://www.ft.com/content/5c9ca1f6-b6fe-4c96-84e2-38e3eee90f3b\">According</a> to the Financial Times, only investors who’d backed xAI in its previous fundraising round were permitted to participate in this one. Reportedly, investors who <a href=\"https://techcrunch.com/2022/10/27/elon-musk-bought-twitter/\">helped</a> finance Musk’s Twitter acquisition were given <a href=\"https://www.ft.com/content/5c9ca1f6-b6fe-4c96-84e2-38e3eee90f3b\">access</a> to up to 25% of xAI’s shares.</p><h2>Ramping up AI</h2><p>Musk formed xAI last year. Soon after, the company released&nbsp;<a href=\"https://techcrunch.com/2024/03/29/what-is-elon-musks-grok-chatbot-and-how-does-it-work/\">Grok</a>, a flagship generative AI model that now powers a number of features on X, including a chatbot accessible to <a href=\"https://techcrunch.com/2024/03/26/elon-musk-says-all-premium-subscribers-on-x-will-gain-access-to-ai-chatbot-grok-this-week/\">X Premium</a> subscribers and <a href=\"https://techcrunch.com/2024/11/10/x-is-testing-a-free-version-of-ai-chatbot-grok/\">free users</a> in some regions.</p><p>Grok has what Musk has described as “a rebellious streak” — a willingness to answer “spicy questions that are rejected by most other AI systems.” Told to be vulgar, for example, Grok will happily oblige, spewing profanities and colorful language you won’t hear from&nbsp;<a href=\"https://techcrunch.com/2024/11/22/chatgpt-everything-to-know-about-the-ai-chatbot/\">ChatGPT</a>.</p><p>Musk has <a href=\"https://www.wired.com/llm-political-bias/\">derided</a> ChatGPT and other AI systems for being too “woke” and “politically correct,” despite Grok’s own <a href=\"https://www.wsj.com/tech/ai/elon-musk-x-open-ai-03ff1ead\">unwillingness to cross certain boundaries</a> and <a href=\"https://www.wired.com/story/fast-forward-elon-musk-grok-political-bias-chatbot/\">hedge</a> on political subjects. He’s also referred to Grok as “maximally truth-seeking” and less biased than competing models, although there’s <a href=\"https://www.wired.com/story/fast-forward-elon-musk-grok-political-bias-chatbot/\">evidence</a> to suggest that Grok leans to the left.</p><p>&nbsp;</p><p><strong>TC Sessions: AI</strong><br><strong>Join 1,200 tech leaders for a full day of main-stage sessions, breakouts and networking at TechCrunch Sessions: AI. Get on the waitlist to be among the first for early registrations.</strong></p><p><strong>Location TBA</strong> | June 5, 2025</p><p><a href=\"https://share.hsforms.com/1yTwVrkN9TheNpVfzKpXLQgq997c\"><strong>GET ON WAITLIST</strong></a></p><p>Over the past year, Grok has become increasingly ingrained in X, the social network formerly known as Twitter. At launch, Grok was <i>only</i> available to X users — and developers skilled enough to get the <a href=\"https://techcrunch.com/2024/03/18/why-elon-musks-ai-company-open-sourcing-grok-matters-and-why-it-doesnt/\">“open source” edition</a> up and running.</p><p>Thanks to an&nbsp;<a href=\"https://techcrunch.com/2024/08/13/xais-grok-can-now-generate-images-on-x/\">integration</a>&nbsp;with the open image generator Flux, Grok can generate images on X (without guardrails, controversially). The model can analyze images as well, and summarize news and trending events (<a href=\"https://mashable.com/article/elon-musk-x-twitter-ai-chatbot-grok-fake-news-trending-explore\">imperfectly</a>, mind).</p><p>Reports indicate that Grok may&nbsp;handle even more X functions in the future, from <a href=\"https://techcrunch.com/2024/08/13/xais-grok-can-now-generate-images-on-x/\">enhancing</a>&nbsp;X’s search capabilities and&nbsp;<a href=\"https://techcrunch.com/2024/07/24/x-launches-underwhelming-grok-powered-more-about-this-account-feature/\">account bios</a> to helping with post analytics and reply settings.</p><p>xAI is sprinting to catch up to formidable competitors like OpenAI and Anthropic in the generative AI race. The company <a href=\"https://techcrunch.com/2024/10/21/xai-elon-musks-ai-startup-launches-an-api/\">launched</a> an API in October, allowing customers to build Grok into third-party apps, platforms, and services. According to The Wall Street Journal, xAI is preparing to release a standalone <a href=\"https://techcrunch.com/2024/11/27/elon-musks-ai-company-may-release-a-consumer-app/\">consumer</a> app similar to OpenAI’s in December.</p><p>Musk asserts that it hasn’t been a fair fight.</p><p>In a <a href=\"https://techcrunch.com/2024/06/13/tesla-shareholders-sue-musk-for-starting-competing-ai-company/\">lawsuit</a> filed against OpenAI and Microsoft, OpenAI’s close collaborator, attorneys for Musk accuse OpenAI of “actively trying to eliminate competitors” like xAI by “extracting promises from investors&nbsp;<a href=\"https://www.reuters.com/technology/openai-tells-investor-not-invest-five-ai-startups-including-sutskevers-ssi-2024-10-02/\">not to fund them</a>.” OpenAI, Musk’s counsel says, also unfairly benefits from Microsoft’s infrastructure and expertise in what the attorneys describe as a “de facto merger.”</p><p>Yet Musk often says that X’s data gives xAI a leg up compared to rivals. Last month, X&nbsp;<a href=\"https://techcrunch.com/2024/10/17/elon-musks-x-is-changing-its-privacy-policy-to-allow-third-parties-to-train-ai-on-your-posts/\">changed</a>&nbsp;its privacy policy to allow third parties, including xAI, to train models on X posts.</p><p>Musk, it’s worth noting, was one of the original founders of OpenAI, and left the company in 2018 after disagreements over its direction. He’s argued in previous suits that OpenAI profited from his early involvement yet reneged on its nonprofit pledge to make the fruits of its AI research available to all.</p><h2>An xAI ecosystem</h2><p>xAI has outlined a vision according to which its models would be trained on data from Musk’s various companies, including Tesla and SpaceX, and its models could then improve technology across those companies. It is already powering customer support features for SpaceX’s Starlink internet service, according to The Wall Street Journal, and the startup is <a href=\"https://www.wsj.com/tech/ai/elon-musk-x-open-ai-03ff1ead?mod=latest_headlines\">said</a> to be in talks with Tesla to provide R&amp;D in exchange for some of the carmaker’s revenue.</p><p>Tesla shareholders, for one, object to these plans. <a href=\"https://techcrunch.com/2024/06/13/tesla-shareholders-sue-musk-for-starting-competing-ai-company/\">Several have sued Musk</a>&nbsp;over his decision to start xAI, arguing that Musk has&nbsp;<a href=\"https://electrek.co/2024/08/08/elon-musk-continues-to-siphon-tesla-talent-to-train-xais-grok/#:~:text=Elon%20Musk\'s%20xAI%20has%20now,as%20%E2%80%9Can%20AI%20company%E2%80%9D.\">diverted both talent and resources</a>&nbsp;from Tesla to what’s essentially a competing venture.</p><p>Nevertheless, the deals — and xAI’s developer and consumer-facing products — have driven xAI’s revenue to around $100 million a year. For comparison, Anthropic is <a href=\"https://www.pymnts.com/artificial-intelligence-2/2024/anthropic-revenue-reportedly-set-to-jump-to-1-billion-this-year/\">reportedly</a> on pace to generate $1 billion in revenue this year, and OpenAI is targeting $4 billion by the end of 2024.</p><p>Musk said this summer that xAI is training the next generation of Grok models at its Memphis data center, which was apparently built in just 122 days and is currently powered partly by portable diesel generators. The company hopes to upgrade the server farm, which contains 100,000 Nvidia GPUs, next year. (Because of their ability to perform many calculations in parallel, GPUs are the favored chips for training and running models.)</p><p>In November, xAI won <a href=\"https://www.datacenterdynamics.com/en/news/xai-colossus-memphis-power-tva/\">approval</a> from the regional power authority in Memphis for 150MW of additional power — enough to power roughly 100,000 homes. To win the agency over, xAI pledged to improve the quality of the city’s drinking water and provide the Memphis grid with discounted Tesla-manufactured batteries. But some residents criticized the move, arguing it would strain the grid and <a href=\"https://www.cnbc.com/2024/08/28/musk-xai-accused-of-worsening-memphis-smog-with-unauthorized-turbines.html#:~:text=Tech-,Elon%20Musk\'s%20xAI%20accused%20of%20worsening%20Memphis%20smog,gas%20turbines%20at%20data%20center&amp;text=Environmental%20advocates%20say%20Elon%20Musk\'s,air%20pollutants%20there%2C%20without%20authorization.\">worsen</a> the area’s air quality.</p><p>Tesla is also <a href=\"https://www.cnbc.com/2024/09/21/elon-musk-hopes-supercomputers-will-boost-tesla-and-xai.html\">expected</a> to use the upgraded data center to improve its autonomous driving technologies.</p><p>xAI has expanded quite rapidly from an operations standpoint in the year since its founding, growing from just a dozen employees in March 2023 to <a href=\"https://www.linkedin.com/company/xai/people/\">over 100</a> today. In October, the startup <a href=\"https://techcrunch.com/2024/10/02/elon-musks-xai-moves-into-openais-old-hq/\">moved</a> into OpenAI’s old corporate offices in San Francisco’s Mission neighborhood.</p><p>xAI has reportedly told investors it plans to raise more money next year.</p><p>It won’t be the only AI lab raising immense cash. Anthropic <a href=\"https://techcrunch.com/2024/11/22/anthropic-raises-an-additional-4b-from-amazon-makes-aws-its-primary-cloud-partner/\">recently</a> secured $4 billion from Amazon, bringing its total raised to $13.7 billion, while OpenAI <a href=\"https://techcrunch.com/2024/10/02/openai-raises-6-6b-and-is-now-valued-at-157b/\">raised</a> $6.6 billion in October to grow its war chest to $17.9 billion.</p><p>Megadeals like OpenAI’s and Anthropic’s drove AI venture capital activity to $31.1 billion across over 2,000 deals in Q3 2024, <a href=\"https://pitchbook.com/news/reports/q3-2024-ai-ml-report\">per</a> PitchBook data.</p><p><i>TechCrunch has an AI-focused newsletter!&nbsp;</i><a href=\"https://techcrunch.com/newsletters/\"><i>Sign up here</i></a><i>&nbsp;to get it in your inbox every Wednesday.</i></p>', 'elon-musks-xai-lands-6b-in-new-cash-to-fuel-ai-ambitions', '1733485264-GettyImages-2158243831.webp', 3, 2, 8, '2024-12-06 06:11:04', '2024-12-06 06:12:35'),
(6, 'Delaware judge rules against Elon Musk’s $56B pay package again', '<p>Welcome back to <strong>TechCrunch Mobility</strong> — your central hub for news and insights on the future of transportation. Sign up here for free — just click <a href=\"https://techcrunch.com/newsletters/\">TechCrunch Mobility!</a></p><p>Your usual host Kirsten is out this week, so I’ll be taking you through the last couple weeks’ worth of mobility news.&nbsp;</p><p>Top of mind this week is a Delaware judge’s decision to uphold her previous ruling <a href=\"https://techcrunch.com/2024/12/02/judge-confirms-decision-to-sink-elon-musks-56b-pay-package-despite-tesla-shareholder-vote/\">denying the legality</a> of <strong>Elon Musk</strong>’s exorbitant $56 billion pay package. To refresh your memory, Delaware Chancery court judge Kathaleen McCormick in <a href=\"https://techcrunch.com/2024/01/30/elon-musks-56b-tesla-pay-deal-is-unfair-judge-rules/\">January</a> ruled that the pay package — the largest compensation deal in corporate history — is unfair given that the CEO spends so much of his time occupied with his many other companies and projects, including X (formerly Twitter). And now he’s in charge of “government efficiency” to boot!</p><p>Tesla tried to change McCormick’s mind after shareholders voted to “re-ratify” the deal, but she wasn’t swayed by their arguments. In her decision, she wrote, among other things, that a shareholder vote can’t overturn a court ruling.&nbsp;</p><p><a href=\"https://x.com/lexfridman/status/1863987001063538971\">The X-verse</a> is up in arms about it, arguing that no, in fact, a judge’s ruling shouldn’t be able to overrule a shareholder vote.&nbsp;</p><p>Musk has threatened to pull back from helping Tesla grow if he doesn’t get his money, a prospect that terrifies shareholders. Tesla will appeal the decision again, and with Musk as Trump’s new right-hand man, this will be an interesting one to watch.&nbsp;</p><p><i>— Rebecca Bellan</i></p><p>&nbsp;</p><p><strong>TC Sessions: AI</strong><br><strong>Join 1,200 tech leaders for a full day of main-stage sessions, breakouts and networking at TechCrunch Sessions: AI. Get on the waitlist to be among the first for early registrations.</strong></p><p><strong>Location TBA</strong> | June 5, 2025</p><p><a href=\"https://share.hsforms.com/1yTwVrkN9TheNpVfzKpXLQgq997c\"><strong>GET ON WAITLIST</strong></a></p><h2>A little bird</h2><figure class=\"image\"><img src=\"https://techcrunch.com/wp-content/uploads/2019/10/blinky-cat-bird-green.gif?w=680\" alt=\"blinky cat bird green\"></figure><p><strong>Image Credits:</strong>Bryce Durbin</p><p>Looks like <strong>Henrik Fisker</strong>, founder of the now-defunct EV startup Fisker, has his name on something new. It’s called “Glogy Foods LLC” and is described in a filing as having something to do with food and beverage. With a name like that, I’m not sure I want to know.&nbsp;</p><p><i>Got a tip for us? Email Kirsten Korosec at </i><a href=\"mailto:kirsten.korosec@techcrunch.com/\"><i>kirsten.korosec@techcrunch.com</i></a><i>, Sean O’Kane at </i><a href=\"mailto:sean.okane@techcrunch.com/\"><i>sean.okane@techcrunch.com</i></a><i> or Rebecca Bellan at </i><a href=\"https://techcrunch.com/got-a-tip/\"><i>rebecca.bellan@techcrunch.com</i></a><i>.</i> Or check out <a href=\"https://techcrunch.com/got-a-tip/\">these instructions</a> to learn how to contact us via encrypted messaging apps or SecureDrop.</p><h2>Deals!</h2><figure class=\"image\"><img src=\"https://techcrunch.com/wp-content/uploads/2019/10/money-the-station.png?w=680\" alt=\"money the station\" srcset=\"https://techcrunch.com/wp-content/uploads/2019/10/money-the-station.png 1024w, https://techcrunch.com/wp-content/uploads/2019/10/money-the-station.png?resize=150,38 150w, https://techcrunch.com/wp-content/uploads/2019/10/money-the-station.png?resize=300,75 300w, https://techcrunch.com/wp-content/uploads/2019/10/money-the-station.png?resize=768,192 768w, https://techcrunch.com/wp-content/uploads/2019/10/money-the-station.png?resize=680,170 680w, https://techcrunch.com/wp-content/uploads/2019/10/money-the-station.png?resize=430,108 430w, https://techcrunch.com/wp-content/uploads/2019/10/money-the-station.png?resize=720,180 720w, https://techcrunch.com/wp-content/uploads/2019/10/money-the-station.png?resize=900,225 900w, https://techcrunch.com/wp-content/uploads/2019/10/money-the-station.png?resize=800,200 800w, https://techcrunch.com/wp-content/uploads/2019/10/money-the-station.png?resize=668,167 668w, https://techcrunch.com/wp-content/uploads/2019/10/money-the-station.png?resize=708,177 708w\" sizes=\"100vw\" width=\"1024\"></figure><p><strong>Image Credits:</strong>Bryce Durbin</p><h4>Main deal</h4><p>Chinese autonomous vehicle company <strong>Pony AI</strong> <a href=\"https://techcrunch.com/2024/11/27/pony-ai-set-for-nasdaq-debut-at-4-55b-valuation/\">debuted</a> on the Nasdaq last week as investors showed an interest in backing Chinese tech companies following a de facto ban on foreign IPOs from Beijing. Pony’s debut comes after WeRide and Zeekr became publicly traded companies earlier this year.</p><p>Pony opened at $15 per share, pulling in a valuation of $5.25 billion. That opening price was higher than Pony’s offering price of $13 per share, but it quickly dropped down to size and on Wednesday closed just shy of $12. Perhaps that’s because Pony, like most other AV companies, is operating at a heavy loss as it throws money into R&amp;D and attempts to scale a frontier technology.&nbsp;</p><h4>Other deals that got my attention …</h4><p><strong>Ampeco</strong>,<strong> </strong>an EV charging platform, raised a<a href=\"https://techcrunch.com/2024/11/26/ev-charging-platform-ampeco-raise-26m-series-b-as-demand-for-charging-soars/\"> $26 million Series B</a> round led by Revaia. The startup provides OEMs with a charging network to mix and match hardware partners, which has helped it scale with major utilities companies across Europe.&nbsp;</p><p>The <strong>Biden administration</strong> is racing to approve clean energy loans before Trump takes over, and <a href=\"https://techcrunch.com/2024/12/03/biden-administration-races-to-approve-clean-energy-loans-before-trump-takes-over-heres-whos-benefitting/\">companies are benefiting</a>. <strong>Rivian </strong><a href=\"https://techcrunch.com/2024/11/25/rivian-snags-6-6b-conditional-federal-loan-to-build-georgia-factory/\">snagged a $6.6 billion</a> conditional federal loan to resume construction of its Georgia EV factory; and <strong>Stellantis</strong> and <strong>Samsung</strong>, via their JV StarPlus Energy, secured a conditional loan of up to $7.54 billion to help finance two lithium-ion battery cell and module factories in Indiana.&nbsp;</p><p>Speaking of battery factories, <strong>General Motors</strong> is <a href=\"https://techcrunch.com/2024/12/02/gm-offloads-one-of-its-battery-factories-to-lges/\">selling its stake</a> in the nearly completed Ultium battery cell plant in Lansing, Michigan, to its JV partner LG Energy Solution (LGES). We don’t have a deal number, but GM says it expects to recoup its initial investment into the factory. GM and LGES had promised to invest over $2 billion into that site.&nbsp;</p><h2>Notable reads and other tidbits</h2><figure class=\"image\"><img src=\"https://techcrunch.com/wp-content/uploads/2019/12/the-station-ride-hailing1.png?w=680\" alt=\"\" srcset=\"https://techcrunch.com/wp-content/uploads/2019/12/the-station-ride-hailing1.png 1024w, https://techcrunch.com/wp-content/uploads/2019/12/the-station-ride-hailing1.png?resize=150,38 150w, https://techcrunch.com/wp-content/uploads/2019/12/the-station-ride-hailing1.png?resize=300,75 300w, https://techcrunch.com/wp-content/uploads/2019/12/the-station-ride-hailing1.png?resize=768,193 768w, https://techcrunch.com/wp-content/uploads/2019/12/the-station-ride-hailing1.png?resize=680,171 680w, https://techcrunch.com/wp-content/uploads/2019/12/the-station-ride-hailing1.png?resize=430,108 430w, https://techcrunch.com/wp-content/uploads/2019/12/the-station-ride-hailing1.png?resize=720,181 720w, https://techcrunch.com/wp-content/uploads/2019/12/the-station-ride-hailing1.png?resize=900,226 900w, https://techcrunch.com/wp-content/uploads/2019/12/the-station-ride-hailing1.png?resize=800,201 800w, https://techcrunch.com/wp-content/uploads/2019/12/the-station-ride-hailing1.png?resize=668,168 668w, https://techcrunch.com/wp-content/uploads/2019/12/the-station-ride-hailing1.png?resize=708,178 708w\" sizes=\"100vw\" width=\"1024\"></figure><p><strong>Image Credits:</strong>Bryce Durbin</p><h4>Autonomous vehicles</h4><p><strong>Tesla</strong> appears to be building a teleoperations team for its <a href=\"https://techcrunch.com/2024/11/26/tesla-appears-to-be-building-a-teleoperations-team-for-its-robotaxi-service/\">robotaxi service</a>. The company posted a job listing for a software engineer that can help develop the system to allow human operators to remotely access and control Tesla’s upcoming robotaxis.&nbsp;</p><p><strong>TuSimple </strong>co-founder and former CEO Xiaodi Hou is demanding that the board immediately <a href=\"https://techcrunch.com/2024/11/27/tusimple-co-founder-demands-liquidation-sues-company-for-control-of-his-shares/\">liquidate the company</a> and return all remaining funds to shareholders. Things are getting super spicy over here!&nbsp;</p><h4>Electric vehicles, charging, &amp; batteries</h4><p><strong>California</strong> plans to offer <a href=\"https://techcrunch.com/2024/11/25/california-will-offer-ev-rebates-if-trump-kills-federal-tax-credits/\">EV rebates</a> if Trump kills the federal tax credits currently offered to Americans via the Inflation Reduction Act.&nbsp;</p><p><strong>EVgo </strong>and GM have <a href=\"https://www.businesswire.com/news/home/20241204441940/en/EVgo-and-GM-Surpass-2000-Public-Fast-Charging-Stalls-in-the-U.S.\">surpassed 2,000 public fast-charging stalls</a> through their ongoing charging collab. That’s double their shared EV charging footprint from a year ago.&nbsp;</p><p><strong>General Motors</strong> has taken a <a href=\"https://www.wsj.com/business/autos/general-motors-to-take-5-billion-charge-on-china-business-c3d534f5?mod=hp_lead_pos4\">$5 billion hit</a> due to weakness in its China business. GM, via state-owned SAIC Motor, used to be a dominant player in China but is struggling to compete with the influx of new models over the past couple of years.&nbsp;</p><p><strong>Hyundai, Kia, </strong>and<strong> Genesis </strong>are <a href=\"https://techcrunch.com/2024/11/22/hyundai-and-kia-recall-208000-evs/\">recalling</a> about 208,000 EVs in the U.S. due to an issue that could cause the cars to suddenly lose power.&nbsp;</p><p>The pope is getting his first <a href=\"https://techcrunch.com/2024/12/04/the-pope-gets-his-first-electric-popemobile-from-mercedes-benz/\">electric popemobile</a>, and, no, it’s not from now-defunct Fisker. His Holiness will cruise around in a <strong>Mercedes-Benz </strong>G-Class SUV.</p><p><strong>Northvolt</strong>, a Swedish battery manufacturer and unicorn, has filed for <a href=\"https://techcrunch.com/2024/11/22/battery-unicorn-northvolt-files-for-bankruptcy-co-founder-and-ceo-resigns/\">Chapter 11 bankruptcy</a> in the U.S. The company will work to reorganize and ramp up operations in order to better position itself for the long term.&nbsp;</p><p><strong>Revel </strong>is expanding its EV-charging empire in New York City. The startup is working with Port Authority to install <a href=\"https://techcrunch.com/2024/12/04/revel-to-install-24-fast-ev-chargers-at-jfk-airport/\">24 fast chargers</a> at JFK airport.&nbsp;</p><h4>In-car tech</h4><p><strong>Tesla</strong> came out with a host of <a href=\"https://techcrunch.com/2024/12/02/tesla-updates-include-apple-watch-app-and-fart-prank/\">new features</a> this week, including a new Tesla app for the Apple Watch and the ability to prank your friends with a fart sound when they sit down in a passenger seat.&nbsp;</p><h4>Micromobility</h4><p><strong>Joco</strong>, the NYC-based startup offering bright orange e-bikes to delivery workers, offers a slice of hope for founders taking on micromobility. The company almost died several times, including at launch, but has managed to expand mainly on its own cashflow and become a <a href=\"https://techcrunch.com/2024/11/30/joco-almost-died-at-launch-now-its-a-lifeline-for-e-bike-delivery-riders-and-a-profitable-business/\">profitable business</a>.&nbsp;</p><p><strong>London</strong> has had it with all the dockless e-bikes crowding up sidewalks and streets. The city’s transport authority announced a <a href=\"https://techcrunch.com/2024/11/26/say-goodbye-to-freeform-dockless-e-bike-parking-in-london-tfl-debuts-new-rules-to-reduce-bike-mess-on-streets/\">new enforcement policy</a> that will restrict parking for the tens of thousands of e-bikes offered for rent by Lime, Human Forest, and Dott.&nbsp;</p><p><strong>Skarper</strong>, the U.K. startup that helps convert bicycles to e-bikes, must have done something right because the company has got the backing and endorsement of <a href=\"https://techcrunch.com/2024/11/30/why-olympic-champion-cyclist-sir-chris-hoy-is-backing-skarper-to-make-any-bike-an-ebike/\">Sir Chris Hoy</a>, one of the most decorated track cyclists.</p><h4>Ride-hail</h4><p><strong>Uber </strong>is expanding what it means to be a gig worker. The company is <a href=\"https://techcrunch.com/2024/11/26/uber-is-building-a-fleet-of-gig-workers-to-label-data-for-ai-models/\">hiring contractors</a> for a new AI and data-labeling division called Scaled Solutions that services both Uber and outside customers, like Aurora Innovation and Niantic.&nbsp;&nbsp;</p><p>Uber is also under <a href=\"https://techcrunch.com/2024/11/27/ubers-subscription-service-reportedly-target-of-ftc-probe/\">investigation</a> by the <strong>Federal Trade Commission </strong>over whether the company broke consumer protection laws by allegedly automatically signing people up for its Uber One subscription service and making it hard to cancel.&nbsp;</p><h2>This week’s wheels</h2><figure class=\"image\"><img src=\"https://techcrunch.com/wp-content/uploads/2024/11/NY-jonny-Joco-on-street.jpg?w=680\" alt=\"Jonathan Cohen, co-founder and chief growth officer of Joco, riding an e-bike in Manhattan.\" srcset=\"https://techcrunch.com/wp-content/uploads/2024/11/NY-jonny-Joco-on-street.jpg 1920w, https://techcrunch.com/wp-content/uploads/2024/11/NY-jonny-Joco-on-street.jpg?resize=150,113 150w, https://techcrunch.com/wp-content/uploads/2024/11/NY-jonny-Joco-on-street.jpg?resize=300,225 300w, https://techcrunch.com/wp-content/uploads/2024/11/NY-jonny-Joco-on-street.jpg?resize=768,576 768w, https://techcrunch.com/wp-content/uploads/2024/11/NY-jonny-Joco-on-street.jpg?resize=680,510 680w, https://techcrunch.com/wp-content/uploads/2024/11/NY-jonny-Joco-on-street.jpg?resize=1200,900 1200w, https://techcrunch.com/wp-content/uploads/2024/11/NY-jonny-Joco-on-street.jpg?resize=1280,960 1280w, https://techcrunch.com/wp-content/uploads/2024/11/NY-jonny-Joco-on-street.jpg?resize=430,323 430w, https://techcrunch.com/wp-content/uploads/2024/11/NY-jonny-Joco-on-street.jpg?resize=720,540 720w, https://techcrunch.com/wp-content/uploads/2024/11/NY-jonny-Joco-on-street.jpg?resize=900,675 900w, https://techcrunch.com/wp-content/uploads/2024/11/NY-jonny-Joco-on-street.jpg?resize=800,600 800w, https://techcrunch.com/wp-content/uploads/2024/11/NY-jonny-Joco-on-street.jpg?resize=1536,1152 1536w, https://techcrunch.com/wp-content/uploads/2024/11/NY-jonny-Joco-on-street.jpg?resize=668,501 668w, https://techcrunch.com/wp-content/uploads/2024/11/NY-jonny-Joco-on-street.jpg?resize=500,375 500w, https://techcrunch.com/wp-content/uploads/2024/11/NY-jonny-Joco-on-street.jpg?resize=823,617 823w, https://techcrunch.com/wp-content/uploads/2024/11/NY-jonny-Joco-on-street.jpg?resize=708,531 708w\" sizes=\"100vw\" width=\"1920\"></figure><p>Jonathan Cohen, co-founder and chief growth officer of Joco, riding an e-bike in Manhattan.<strong>Image Credits:</strong>Rebecca Bellan</p><p>While reporting on Joco, I got to test-drive some of their now-iconic orange e-bikes, which are custom made for the company based on <strong>Segway</strong>’s <a href=\"https://b2b.segway.com/e-bike-a200p/\">A200 platform</a>. And I must say, that’s one hell of a sturdy ride. There wasn’t a pothole or cracked bit of pavement that slowed my roll. The acceleration was smooth, and I felt like I was flying down those NYC bike paths — something I’m sure NYC’s many delivery drivers will also appreciate.&nbsp;&nbsp;</p><p>Perhaps my favorite part of the bike, though, was the built-in phone holder that not only secures your phone in place on the handlebars so you can use GPS, but also charges your phone at the same time.&nbsp;</p><p><i>What is “This week’s wheels”? It’s a chance to learn about the different transportation products we’re testing, whether it’s an electric or hybrid car, an e-bike, or even a ride in an autonomous vehicle. Future vehicles include the<strong> Lucid Air</strong>, more time in the next-gen <strong>Rivian R1S</strong>, and the <strong>Volkswagen ID Buzz</strong>. Stay tuned.</i></p>', 'delaware-judge-rules-against-elon-musks-56b-pay-package-again', '1733487552-elon-musk-us-capitol.webp', 7, 2, 10, '2024-12-06 06:49:12', '2024-12-11 00:49:50'),
(7, 'Holiday app Festivitas puts Xmas lights on your Macj', '<p>Getting into the holiday spirit but still stuck at work? A cute new macOS called <a href=\"https://www.festivitas.app/\">Festivitas</a> can help you decorate your Mac computer screen with twinkling, holiday lights that are strung up from your menu bar and illuminate your dock.</p><p>This whimsical holiday treat was dreamed up by software developer Simon B. Støvring, the maker of other iOS apps favored by developers like text editor <a href=\"https://runestone.app/\">Runestone</a>,&nbsp;scripting app <a href=\"https://scriptable.app/\">Scriptable</a>, JSON editor <a href=\"https://jayson.app/\">Jayson</a>, and others. He’s been teasing the app on <a href=\"https://bsky.app/profile/simonbs.dev\">social media</a> in the days ahead of its launch, showing off <a href=\"https://bsky.app/profile/simonbs.dev/post/3lck6zicb4c2l\">different</a> <a href=\"https://bsky.app/profile/simonbs.dev/post/3lceavscpn627\">customizations</a> he added.</p><p>At launch, you’re able to adjust things like the cable thickness, size of lights, distance apart, drop height and width, flashing pattern, speed of flash, and colors. You can also switch to white lights instead of colored and can optionally disable the lights in the dock or menu bar, per your preferences.</p><p>That way, if you find the lights are distracting you from seeing, say, your important Slack notifications in the dock, you could simply turn the dock lights off during your workday. Or, if the menu bar lights are in the way of your collection of open Chrome tabs, you could choose to adjust the drop height so the lights sit above the tabs, for instance.</p><p>The app, which requires macOS 14.6 or later, has to be enabled in the Mac’s Accessibility settings to work. (It’s a simple toggle switch, however). Afterwards, the lights are automatically added to your Mac and you can tweak their look and customize them to your preferences. To turn them off, you can just quit the app from the menu bar or dock.</p><p>The new app is available as a name-your-own-price download from the <a href=\"https://www.festivitas.app/\">Festivitas website</a>.</p><p>Støvring says users so far have been paying anywhere from €4-30 for the app.</p>', 'holiday-app-festivitas-puts-xmas-lights-on-your-macj', '1733487598-Screenshot-2024-12-05-at-2.42.42PM.webp', 7, 5, 14, '2024-12-06 06:49:58', '2024-12-27 00:15:45');
INSERT INTO `posts` (`id`, `title`, `content`, `slug`, `image`, `user_id`, `cat_id`, `views`, `created_at`, `updated_at`) VALUES
(8, 'Copilot Vision, Microsoft’s AI tool that can read your screen, launches in preview', '<p>Microsoft’s AI can now read your screen — or rather, the websites you’re browsing.</p><p>On Thursday, the company began <a href=\"https://www.microsoft.com/en-us/microsoft-copilot/blog/?p=3831&amp;preview=true&amp;_thumbnail_id=3834\">rolling out</a> a limited, U.S.-only preview of <a href=\"https://techcrunch.com/2024/10/01/microsoft-copilot-can-now-read-your-screen-think-deeper-and-speak-aloud-to-you/\">Copilot Vision</a>, a tool that can understand and respond to questions about sites you’re visiting using Microsoft Edge. Gated behind Copilot Labs, an opt-in program for experimental AI capabilities, Copilot Vision can analyze text and images on web pages to answer queries like “What’s the recipe for this lasagna?”</p><p>Note that Copilot Labs requires a subscription to Microsoft’s <a href=\"https://techcrunch.com/2024/01/15/microsoft-launches-a-pro-plan-for-copilot/\">Copilot Pro</a> plan, which costs $20 per month.</p><p>Beyond answering questions, Copilot Vision can summarize and translate text, and handle tasks like spotlighting discounted products in a store catalog. It can also serve as a game assistant, for example offering pointers during matches on Chess.com.</p><p>“When you choose to enable Copilot Vision, it sees the page you’re on, it reads along with you, and you can talk through the problem you’re facing together,” Microsoft wrote in the <a href=\"https://www.microsoft.com/en-us/microsoft-copilot/blog/2024/12/05/copilot-vision-now-in-preview-a-new-way-to-browse/?_thumbnail_id=3834\">blog post</a> shared with TechCrunch. “It’s a new way to invite AI along with you as you navigate the web, tucked neatly into the bottom of your Edge browser whenever you want to ask for help.”</p><figure class=\"image\"><img src=\"https://techcrunch.com/wp-content/uploads/2024/12/msft-copilot-labs-copilot-vision-video-latest_tbmnl_en-us.avif?w=680\" alt=\"Microsoft Copilot Vision\" srcset=\"https://techcrunch.com/wp-content/uploads/2024/12/msft-copilot-labs-copilot-vision-video-latest_tbmnl_en-us.avif 1280w, https://techcrunch.com/wp-content/uploads/2024/12/msft-copilot-labs-copilot-vision-video-latest_tbmnl_en-us.avif?resize=150,84 150w, https://techcrunch.com/wp-content/uploads/2024/12/msft-copilot-labs-copilot-vision-video-latest_tbmnl_en-us.avif?resize=300,169 300w, https://techcrunch.com/wp-content/uploads/2024/12/msft-copilot-labs-copilot-vision-video-latest_tbmnl_en-us.avif?resize=768,432 768w, https://techcrunch.com/wp-content/uploads/2024/12/msft-copilot-labs-copilot-vision-video-latest_tbmnl_en-us.avif?resize=680,383 680w, https://techcrunch.com/wp-content/uploads/2024/12/msft-copilot-labs-copilot-vision-video-latest_tbmnl_en-us.avif?resize=1200,675 1200w, https://techcrunch.com/wp-content/uploads/2024/12/msft-copilot-labs-copilot-vision-video-latest_tbmnl_en-us.avif?resize=430,242 430w, https://techcrunch.com/wp-content/uploads/2024/12/msft-copilot-labs-copilot-vision-video-latest_tbmnl_en-us.avif?resize=720,405 720w, https://techcrunch.com/wp-content/uploads/2024/12/msft-copilot-labs-copilot-vision-video-latest_tbmnl_en-us.avif?resize=900,506 900w, https://techcrunch.com/wp-content/uploads/2024/12/msft-copilot-labs-copilot-vision-video-latest_tbmnl_en-us.avif?resize=800,450 800w, https://techcrunch.com/wp-content/uploads/2024/12/msft-copilot-labs-copilot-vision-video-latest_tbmnl_en-us.avif?resize=668,375 668w, https://techcrunch.com/wp-content/uploads/2024/12/msft-copilot-labs-copilot-vision-video-latest_tbmnl_en-us.avif?resize=1097,617 1097w, https://techcrunch.com/wp-content/uploads/2024/12/msft-copilot-labs-copilot-vision-video-latest_tbmnl_en-us.avif?resize=708,398 708w\" sizes=\"100vw\" width=\"1280\"></figure><p><strong>Image Credits:</strong>Microsoft</p><p>No doubt eager to avoid&nbsp;<a href=\"https://arstechnica.com/gadgets/2024/09/microsoft-details-security-privacy-overhaul-for-windows-recall-ahead-of-relaunch/\">more bad press from AI privacy fumbles</a>, Microsoft is stressing that Copilot Vision deletes data following every session. Processed audio, images or text aren’t stored or used to train models, the company says — at least not in this preview release.</p><p>Copilot Vision is also limited in the types of websites it can view. For the time being, Microsoft’s blocking the feature from working on paywalled and “sensitive” content, limiting Vision to a pre-approved list of “popular” sites.</p><p>What’s “sensitive” entail, exactly? Porn? Graphic violence? Microsoft wouldn’t say.</p><p>“The list of allowed websites is determined by category and on a case-by-case basis,” a Microsoft spokesperson said. “We’re starting with a small list of sites we’ve thoroughly tested and will continue to add more sites over time.”</p><p>Microsoft’s cautious approach is partly the product of legal disputes with news outlets. In one ongoing suit, The New York Times&nbsp;<a href=\"https://techcrunch.com/2023/12/27/the-new-york-times-wants-openai-and-microsoft-to-pay-for-training-data/\">alleges</a>&nbsp;that Microsoft let users get around its paywall by serving NY Times articles through the&nbsp;<a href=\"https://techcrunch.com/2023/11/15/bing-chat-is-now-copilot/\">Copilot chatbot on Bing</a>.</p><p>Many major publishers have opted to block AI tools from trawling their websites not only out of fear their data will be used without permission, but also to prevent these tools from&nbsp;<a href=\"https://www.businessinsider.com/openai-anthropic-ai-bots-havoc-raise-cloud-costs-websites-2024-9#:~:text=Like%20digital%20locusts%2C%20OpenAI%20and,and%20raise%20costs%20for%20websites&amp;text=Edd%20Coates\'%20Game%20UI%20Database,because%20of%20AI%20botnet%20traffic.\">sending their server costs soaring</a>. Microsoft said that Copilot Vision will respect sites’ “machine-readable controls on AI,” like rules that disallow&nbsp;<a href=\"https://techcrunch.com/2024/09/23/cloudflares-new-marketplace-will-let-websites-charge-ai-bots-for-scraping/\">bots</a>&nbsp;from scraping data for AI training. However, the company hasn’t said&nbsp;<i>precisely</i>&nbsp;which controls Vision will respect; there are&nbsp;<a href=\"https://site.spawning.ai/spawning-ai-txt\">several</a>&nbsp;in&nbsp;<a href=\"https://searchengineland.com/google-extended-crawler-432636\">use</a>.</p><p>If the current trend holds, Copilot Vision may not work on some of the web’s&nbsp;<a href=\"https://www.newsguardtech.com/special-reports/67-percent-of-top-news-sites-block-ai-chatbots#:~:text=A%20NewsGuard%20analysis%20found%20that,chatbots%20to%20use%20their%20content.\">top news sites</a>. But Microsoft said it’s committed to “taking feedback” to allay publishers’ concerns.</p><p>“Some of those we’ve collaborated with are third-party publishers, who help us understand how Vision could be used to help people better engage and make decisions on their pages,” the company wrote in the blog. “These inputs will help us design Vision to be more helpful in how it interacts with web pages.”</p><p><i>TechCrunch has an AI-focused newsletter!&nbsp;</i><a href=\"https://techcrunch.com/newsletters/\"><i>Sign up here</i></a><i>&nbsp;to get it in your inbox every Wednesday.</i></p>', 'copilot-vision-microsofts-ai-tool-that-can-read-your-screen-launches-in-preview', '1733487664-Blog-Hero-Image.webp', 7, 1, 12, '2024-12-06 06:51:04', '2025-02-05 00:16:10'),
(9, 'After selling his last startup to IBM, this founder now wants to bring ‘agentic memory’ to enterprise data', '<p>Not everyone agrees on what an “<a href=\"https://techcrunch.com/2024/07/13/what-exactly-is-an-ai-agent/\">AI agent</a>” actually is, but they <a href=\"https://techcrunch.com/2024/11/20/h-the-ai-startup-that-raised-220m-launches-its-first-product-runner-h-for-agentic-applications/\">are all still the rage</a>. At a broad level, these so-called “agents” promise to go several steps beyond a mere chatbot, making decisions and taking actions on people’s behalf. Some might help you <a href=\"https://techcrunch.com/2024/12/02/the-race-is-on-to-make-ai-agents-do-your-online-shopping-for-you/\">do your online shopping</a>; others might <a href=\"https://techcrunch.com/2024/11/18/juna-ai-wants-to-use-ai-agents-to-make-factories-more-energy-efficient/\">make factories more efficient</a> — at varying degrees of autonomy.</p><p>It’s against such a backdrop that fledgling AI startup <a href=\"https://across.ai/\">Across AI</a> is coming out of stealth to develop a “dynamic memory system” for complex enterprise workflows. And it’s spearheaded by a founder who relatively recently sold his previous startup to IBM.</p><p>Across AI targets the likes of chief revenue officers and sales teams with a platform that connects with all their internal and external enterprise data sources. It then creates a shared “agentic memory” that can be used to identify and qualify fresh sales opportunities, spot risks, and suggest questions sales teams should be asking their customers.</p><p>“Sales teams often struggle with obtaining and utilizing the right information when they need it — whether that’s information about products, customers, competitors or optimal processes,” Across AI’s co-founder and CEO, <a href=\"https://www.linkedin.com/in/stevenmih/\">Steven Mih</a> (pictured above, center), told TechCrunch. “Critical knowledge often gets bottlenecked among a few experts or buried in vast amounts of unstructured data, leading to inefficiencies, delayed decisions, and costly errors. Existing AI solutions often fail to address this issue because they lack deep integration and contextual understanding, treating all data equally without the ability to prioritize or adapt to new information.”</p><p>Mih was previously co-founder and CEO of <a href=\"https://venturebeat.com/data-infrastructure/ahana-goes-deep-on-aws-to-help-presto-users-set-up-and-query-secure-data-lakes/\">Ahana</a>, a Google Ventures-backed company that built commercial services atop&nbsp;<a href=\"https://prestodb.io/\">Presto</a>, the open source&nbsp;SQL query engine that <a href=\"https://www.theregister.com/2013/11/06/facebook_presto_open_source/\">spun out of Facebook in 2013</a>. Mih <a href=\"https://prestodb.io/blog/2023/04/12/ibm-joins-presto-foundation/\">sold Ahana to IBM last year</a> for an undisclosed amount, and after a 14-month stint at the tech giant, Mih jumped ship in July to begin work on his latest startup.</p><p>He joined up with <a href=\"https://www.linkedin.com/in/nilou-salehi/\">Dr. Niloufar Salehi</a> (pictured above, left) and <a href=\"https://www.linkedin.com/in/afshin-nikzad/\">Dr. Afshin Nikzad</a> (pictured above, right), renowned professors from UC Berkeley and Stanford University, respectively, who have carried out <a href=\"https://aclanthology.org/2023.emnlp-main.712/\">research</a> on ways to improve the efficacy of AI systems in “high-stakes” settings.</p><p>Across AI is still embryonic — it’s refining its product with design partners in private. As it works toward a commercial launch in 2025, the company has now raised $5.75 million in a seed round of funding co-led by <a href=\"https://www.linkedin.com/in/bobby-yazdani-015a13a/\">Bobby Yazdani</a>‘s Cota Capital, and <a href=\"https://techcrunch.com/2018/03/16/village-global-fund/\">Village Global</a>, a venture capital firm that counts Bill Gates, Mark Zuckerberg, Jeff Bezos, and Reid Hoffman among its backers.</p><figure class=\"image\"><img src=\"https://techcrunch.com/wp-content/uploads/2024/12/unnamed-1.png?w=680\" alt=\"Across AI\" srcset=\"https://techcrunch.com/wp-content/uploads/2024/12/unnamed-1.png 1920w, https://techcrunch.com/wp-content/uploads/2024/12/unnamed-1.png?resize=150,127 150w, https://techcrunch.com/wp-content/uploads/2024/12/unnamed-1.png?resize=300,254 300w, https://techcrunch.com/wp-content/uploads/2024/12/unnamed-1.png?resize=768,650 768w, https://techcrunch.com/wp-content/uploads/2024/12/unnamed-1.png?resize=680,576 680w, https://techcrunch.com/wp-content/uploads/2024/12/unnamed-1.png?resize=1200,1016 1200w, https://techcrunch.com/wp-content/uploads/2024/12/unnamed-1.png?resize=1280,1083 1280w, https://techcrunch.com/wp-content/uploads/2024/12/unnamed-1.png?resize=430,364 430w, https://techcrunch.com/wp-content/uploads/2024/12/unnamed-1.png?resize=720,609 720w, https://techcrunch.com/wp-content/uploads/2024/12/unnamed-1.png?resize=900,762 900w, https://techcrunch.com/wp-content/uploads/2024/12/unnamed-1.png?resize=800,677 800w, https://techcrunch.com/wp-content/uploads/2024/12/unnamed-1.png?resize=1536,1300 1536w, https://techcrunch.com/wp-content/uploads/2024/12/unnamed-1.png?resize=668,565 668w, https://techcrunch.com/wp-content/uploads/2024/12/unnamed-1.png?resize=443,375 443w, https://techcrunch.com/wp-content/uploads/2024/12/unnamed-1.png?resize=729,617 729w, https://techcrunch.com/wp-content/uploads/2024/12/unnamed-1.png?resize=627,531 627w\" sizes=\"100vw\" width=\"1920\"></figure><p><strong>Image Credits:</strong>Across AI</p><h2>Building memories</h2><p>Across AI will be a web app and chatbot that connects to various parts of the enterprise stack — CRM systems, communication and collaboration tools, calendars, and all the rest — to build its memory and develop contextual understanding. It will then be on-hand to help wherever a user is working.</p><p>“By showing up where users already are, for example in Slack or [Microsoft] Team’s app, Across AI apps don’t break the user’s flow and instead provide just-in-time assistance in the context of the user’s existing workflows,” Mih said.</p><p>This memory, the company says, “continuously adapts,” and only retains what it deems to be relevant information while discarding outdated data. This raises questions around how it could determine what’s relevant, as this is highly dependent on the context and requirements of the people who will use it.</p><p>Mih says it achieves this by developing a “deep understanding of the workflow context.”</p><p>“The system actively tracks, timestamps, and monitors information updates, recognizing when data becomes outdated or conflicts with new information,” he said. “Unlike traditional AI systems that treat all data equally, our agentic memory system prioritizes information based on contextual importance. Where possible, the apps keep the inferences up to date themselves. Where ambiguity exists, determinations are escalated to a relevant person, such as a sales manager or product manager.”</p><p>Of course, enterprises have <a href=\"https://techcrunch.com/2024/01/11/generative-ai-enterprise-not-home-run/\">been slow to adopt</a> generative AI, as data privacy and security are still core concerns. The last thing a company wants to do is funnel all its proprietary and sensitive data off to a third party, which then does God knows what with it. As such, Mih says that data security is a “foundational aspect” of the startup’s agentic memory platform.</p><p>“Our memory system operates within the company’s secure environment, maintains access control over sensitive information, and does not expose data to external models for training,” Mih said. “We plan to offer both SaaS and cloud-premises deployment options to meet enterprise security and compliance requirements.”</p><p>There are subtle synergies between Mih’s previous startup and his latest venture. Ahana was all about enabling users to query vast amounts of data via Presto, with Ahana taking care of all the complexities around infrastructure setup and maintenance. Across AI is addressing the same problem, but through a different lens.</p><p>“I believe that a core differentiator for AI application companies will be their ability to help users analyze large amounts of data, quickly — that’s exactly what we specialized in at Ahana,” Mih said. “This experience deepened my understanding of the challenges enterprises face in making sense of complex data ecosystems that are often siloed and hard to navigate.”</p><p><i>TechCrunch has an AI-focused newsletter!&nbsp;</i><a href=\"https://techcrunch.com/newsletters/\"><i>Sign up here</i></a><i>&nbsp;to get it in your inbox every Wednesday.</i></p>', 'after-selling-his-last-startup-to-ibm-this-founder-now-wants-to-bring-agentic-memory-to-enterprise-data', '1733487763-Across_AI_Leadership_image-e1732628202113.webp', 3, 2, 24, '2024-12-06 06:52:43', '2025-02-05 00:16:04');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('1h3HJxrSSr8MRBfwuj4rQyK2QzFlkpmbv6aQIhrg', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZVBmOFNuaDBsTzk1OEVqZllBZDVRYWRJbmpCbWlGTmdrTGdEQThCVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU4OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXV0aC9nb29nbGUtY2FsbGJhY2s/YXV0aHVzZXI9MCZjb2RlPTQlMkYwQWVhblMwYmo3bko1Q3UyLTZNTDZ4TEU1cm90MHdmQk13S2NyN1hsYXZDYk1FNkFjMVFkdC1sdE9aUDlVbkowejgzNC1kdyZoZD1rbGl6b3MuY29tJnByb21wdD1ub25lJnNjb3BlPWVtYWlsJTIwcHJvZmlsZSUyMG9wZW5pZCUyMGh0dHBzJTNBJTJGJTJGd3d3Lmdvb2dsZWFwaXMuY29tJTJGYXV0aCUyRnVzZXJpbmZvLmVtYWlsJTIwaHR0cHMlM0ElMkYlMkZ3d3cuZ29vZ2xlYXBpcy5jb20lMkZhdXRoJTJGdXNlcmluZm8ucHJvZmlsZSZzdGF0ZT1RcUFUd1FuVkZvbzdxdEYyekdkTWsxRWY4NENWUVRFQnlYVGRQSkFqIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mzt9', 1733898662),
('4ikiiu21dHuOriZJdJ1hWGfbwYu8wC8hSK7j4VSA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibjlZemY0eDU4NEpiRzJCMTllN05VUWdid1pKV3JWNVE1ZzMxVDhMSyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fX0=', 1738734395),
('lIM2q9tMD2HL5tRYlMba4UDQs3YJEWp0kenMxZBe', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZ0J4Mm94djJDT3lycENPV1dweWNZN2R0U2c4b0tpN3pVVDhBSGlUSSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC91c2VyIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mzt9', 1734587555),
('OzzQa45pPREq6ja5b0WEqZ50W7PrZ4JcRcqyl46J', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoieGozS2lSZWh0akU0RnJ5V3dQWTdBY0VaM1pMODlkUFFONWZ5eXVTOCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jYXRlZ29yeSI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1736237622),
('Pzzgd76cjxSskjVKpIenk6abxo7kOBwFaKGZDJgF', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSTJWYWJENHdwVTRoeVlWeHBhWlVUSzhZdHJ4R1NTNWxmYXZaSmNGSSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXNoYm9hcmQ/cGFnZT0yIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1733903234),
('TtGnSYsljJdvbdG27GL7YaObHUgsG3wwl68hV3ff', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjJuRk1qNWxwS3RtQm9QSURsRHFvd0VOdGNzYmF1OXNGYXlkNFBoeiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fX0=', 1736852582),
('uvNHRgTiE6i2yIUzSrGHt83ar3swXW53RWIMoUHY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaDBSNGd5dEY1ck9tTW1ia0U5SkRlbTZQWG5kSXhLSnA4TUl5d2ZpZyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fX0=', 1735282112);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `google_id`, `image`, `role`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$12$Vs.ea.SrJw9vmDiuh26RheggbGdrXkZ/QmufJ82EYkl/INPMaxadm', NULL, NULL, 'admin', 'active', 'sLWKVkJzOSbe1eEhntZX5tZOQ67VGNdVqyYYeRW1rxLpzOqAaCAz1ROYlRW3', '2024-11-29 08:08:21', '2024-12-09 01:50:05'),
(3, 'Jayanta Pal', 'jayanta@klizos.com', NULL, '$2y$12$BYu7tY592esARaolalHPX.Dw1z5EynrLWO8Gw/oE7Li1AMMPPSf9e', '101999559832885646484', '1733732719.jpg', 'admin', 'active', NULL, '2024-12-02 00:17:34', '2025-02-05 00:16:00'),
(6, 'test 2', 'test2@gmail.com', NULL, '$2y$12$ER2BNVcXhWuCqq/QeVs3.OPlmE2hEmNkYq0JwVAx0X7tTaYXfQnwq', NULL, NULL, 'user', 'active', NULL, '2024-12-04 03:19:53', '2024-12-27 00:15:59'),
(7, 'user', 'user@gmail.com', NULL, '$2y$12$nOb7n9.UyvTnGl7AX2pDBOioCOySRddZJ7Ms6CQdYuMJ.9j9Ao2Aa', NULL, '1733732605.webp', 'user', 'active', NULL, '2024-12-06 00:46:43', '2024-12-10 01:40:23'),
(8, 'soum', 'soum@gmail.com', NULL, '$2y$12$b49KpLXmnHtIfgXk7hodqOLeoayvCzfuTHZ9BiiAggnyMpODRgzOe', NULL, NULL, 'user', 'active', NULL, '2024-12-06 07:50:13', '2024-12-10 01:40:33'),
(9, 'test', 'test123@gmail.com', NULL, '$2y$12$YRbctt7/tjFnk9TFN2Lw.eAN74LJtNPjcbPAHOc/lkA6oH90APOZa', NULL, '1733735936.jpg', 'user', 'active', NULL, '2024-12-09 00:30:42', '2025-02-05 00:16:25'),
(11, 'test1234', 'test1234@gmail.com', NULL, '$2y$12$KnsECZQ7Zlh374JGHMCci.yWaI1EOIrN4qI7e5fzQG2ZtdskXpZNK', NULL, '1733901969.webp', 'admin', 'active', NULL, '2024-12-09 04:00:09', '2025-02-05 00:16:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_cat_id_foreign` (`cat_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
