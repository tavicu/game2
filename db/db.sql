-- --------------------------------------------------------
-- Host:                         eos-all6081-ro-dev.mwp2.c.emag.network
-- Server version:               5.7.14-8-log - Percona Server (GPL), Release 8, Revision 1f84ccd
-- Server OS:                    Linux
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table game.games
CREATE TABLE IF NOT EXISTS `games` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table game.games: ~6 rows (approximately)
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` (`id`, `name`) VALUES
	(1, 'Scala / Java syntax'),
	(2, 'Big Data Tehnologies'),
	(3, 'SQL'),
	(4, 'PHP'),
	(5, 'Agile Metodology'),
	(6, 'Emag Technologies');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;

-- Dumping structure for table game.leaderboard
CREATE TABLE IF NOT EXISTS `leaderboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `highscore` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table game.leaderboard: ~8 rows (approximately)
/*!40000 ALTER TABLE `leaderboard` DISABLE KEYS */;
INSERT INTO `leaderboard` (`id`, `name`, `highscore`) VALUES
	(1, 'Bogdan', 10),
	(2, 'Ovidiu', 20),
	(3, 'Octavian', 5),
	(4, 'Ciprian', 0),
	(5, 'Daniel', 120),
	(6, 'Cristi', 0),
	(7, 'Cristi4', 0),
	(8, 'Bartolomeu', 0);
/*!40000 ALTER TABLE `leaderboard` ENABLE KEYS */;

-- Dumping structure for table game.questions
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL DEFAULT '0',
  `title` text NOT NULL,
  `option1` text NOT NULL,
  `option2` text NOT NULL,
  `option3` text NOT NULL,
  `option4` text,
  `answer` tinyint(4) NOT NULL,
  `code` text,
  `run_code_answer` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- Dumping data for table game.questions: ~26 rows (approximately)
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`id`, `game_id`, `title`, `option1`, `option2`, `option3`, `option4`, `answer`, `code`, `run_code_answer`) VALUES
	(1, 5, '<h2>Which concept is NOT defined in the Scrum Framework?</h2>', 'Scrum Master', 'Project Manager', 'Daily Scrum', '', 2, NULL, NULL),
	(2, 5, '<h2>Where are the customer requirements stored?</h2>', 'In the Product Backlog', 'In the Sprint Backlog', 'Nowhere. The Scrum Product Owner knows them', '', 1, NULL, NULL),
	(3, 5, '<h2>What does NOT belong to cornerstones of the agile manifesto?</h2>', 'Responding to change over following a plan', 'Working software over comprehensive documentation', 'Processes over people', '', 3, NULL, NULL),
	(4, 5, '<h2>How is the Product Backlog ordered by:</h2>', 'Small items at the top to large items at the bottom', 'Safer items at the top to riskier items at the bottom', 'Whatever the Product Owner deems most appropriate', '', 3, NULL, NULL),
	(5, 5, '<h2>What is the recommended size for a Development Team (within the Scrum Team)?</h2>', 'At least 7', '3 to 9', '7 plus or minus 2', '', 2, NULL, NULL),
	(6, 6, '<h2>Which concept is NOT defined in the Scrum Framework?</h2>', 'Scrum Master', 'Project Manager', 'Daily Scrum', '', 2, NULL, NULL),
	(7, 6, '<h2>Where are the customer requirements stored?</h2>', 'In the Product Backlog', 'In the Sprint Backlog', 'Nowhere. The Scrum Product Owner knows them', '', 1, NULL, NULL),
	(8, 6, '<h2>What does NOT belong to cornerstones of the agile manifesto?</h2>', 'Responding to change over following a plan', 'Working software over comprehensive documentation', 'Processes over people', '', 3, NULL, NULL),
	(9, 6, '<h2>How is the Product Backlog ordered by:</h2>', 'Small items at the top to large items at the bottom', 'Safer items at the top to riskier items at the bottom', 'Whatever the Product Owner deems most appropriate', '', 3, NULL, NULL),
	(10, 6, '<h2>What is the recommended size for a Development Team (within the Scrum Team)?</h2>', 'At least 7', '3 to 9', '7 plus or minus 2', '', 2, NULL, NULL),
	(11, 1, '<h2>What’s the most efficient way to append the character “c” to: Seq(“a”, “b”)</h2>', 'Seq(“a”, “b”) += “c”', 'Seq(“a”, “b”) ++ Seq(“c”)', 'Seq(“a”, “b”) += Seq(“c”)', 'Seq(“a”, “b”) :+ “c”', 4, NULL, NULL),
	(12, 1, '', 'Prints “true”', 'Returns an error for the second function, no return clause', 'Returns an error, the first function is not correctly defined', 'Prints “false”', 1, 'var inm = (x: Int, y:Int) => x*y\r\ndef mul  (x: Int, y: Int): Int = {\r\n                var inm = x*y\r\n                inm\r\n}\r\nprintln((inm(3, 4) == mul(2, 6)))', NULL),
	(13, 1, '', 'Prints the string “foo bar”', 'Error. Fix is in the line: val str = ""', 'Error. Fix is in the line: str= x + " " + y', 'Error. Fix is in the line: val c = func(a, b)', 2, 'var a = "foo"\r\nvar b = "bar"\r\ndef func (x: String, y:String): String = {\r\n    val str = ""\r\n    str= x + " " + y\r\n    str\r\n}\r\nval c = func(a, b)\r\nprintln(c)', NULL),
	(14, 2, '<h2>What is a Spark executor?</h2>', 'A process that creates the SparkContext and runs the main() function', 'A high rank in the Protoss Templar Caste', 'A node that can run application code in the cluster', 'A process launched by an application that runs tasks.', 4, NULL, NULL),
	(15, 2, '<h2>What is not true about a Hadoop FS block?</h2>', 'It’s easy to replicate between DataNodes, providing fault tolerance', 'Simplifies storage as all metadata is stored by the NameNone, DataNodes just store them', 'Its size is set to 64MB for all Hadoop clusters', 'Partitioning files in blocks makes it possible to store files larger than a hard drive', 3, NULL, NULL),
	(16, 2, 'Kafka is a distributed messaging system. It runs in a cluster and each node is called a Kafka broker. All Kafka messages are structured into topics which are divided into partitions. The number of partitions is equal to the number of brokers for any topic. Partitions can be replicated across multiple brokers. However, only one broker is the leader for a partition at any given time. Topics can have different replication factors. A topic can be consumed by multiple consumer groups comprised of multiple consumers. But consumers in a group are limited to no more than one per partition.\r\nWhich sentence is wrong?', 'It runs in a cluster and each node is called a Kafka broker', 'The number of partitions is equal to the number of brokers for any topic', 'However, only one broker is the leader for a partition at any given time', 'But consumers in a group are limited to no more than one per partition', 2, NULL, NULL),
	(17, 3, '<h2>In order to partition a table in MSSQL, you need the following pre-requisites:</h2>', 'A partition function', 'A partition schema', 'A partition column', 'All of above', 4, NULL, NULL),
	(18, 3, '<h2>In a SQL statement, what is the logical query processing order?</h2>', 'SELECT, WHERE,  FROM, HAVING, GROUP BY, ORDER BY', 'FROM, SELECT, WHERE,  HAVING, GROUP BY, ORDER BY', 'SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY', 'FROM, WHERE, GROUP BY, HAVING, SELECT, ORDER BY', 4, NULL, NULL),
	(19, 3, 'Select the strings to fill the gaps in the code in order for it to work and retrieve the total nr of orders each customer had in the past year in Romania (RO) from the Order Header table. The country must be specified before hand in a variable in order to access the correct table. Each Order Header table contains the subfix of the country at the end', '1. VARCHAR(100) = \'ROMANIA\' // 2. CUSTOMER_ID, SUM(ORDER_ID) AS ORDER_NR // 3. @COUNTRY_SUBFIX // 4.  ORDER_DATE = YEAR(GETDATE())  // 5. CUSTOMER_ID, ORDER_ID', '1. = \'RO\' // 2. CUSTOMER_ID, MAX(ORDER_ID) AS ORDER_NR  // 3. \'\'\' + @COUNTRY_SUBFIX + \'\'\' // 4.  ORDER_DATE = GETDATE()  // 5. CUSTOMER_ID, ORDER_ID', '1. VARCHAR() = \'RO\' // 2.  CUSTOMER_ID, COUNT(*) AS ORDER_NR // 3. \' + @COUNTRY_SUBFIX + \' // 4. YEAR(ORDER_DATE) = YEAR(GETDATE())  // 5. CUSTOMER_ID', '1. VARCHAR(100) = \'RO,PL,BG,HU\' // 2. CUSTOMER_ID, ORDER_ID, COUNT(*) AS ORDER_NR // 3. \'\' @COUNTRY_SUBFIX \'\' // 4.  YEAR(ORDER_DATE) = GETDATE()  // 5. CUSTOMER_ID, ORDER_ID', 3, 'DECLARE @SQL VARCHAR(MAX) = \'\'\r\nDECLARE @COUNTRY_SUBFIX VARCHAR(100) = \'RO\' --1\r\n\r\nSET @SQL = \'\r\nSELECT CUSTOMER_ID, COUNT(*) AS ORDER_NR --2\r\nFROM DATAWAREHOUSE.dbo.ORDER_HEADER_\' + @COUNTRY_SUBFIX + \' --3\r\nWHERE YEAR(ORDER_DATE) = YEAR(GETDATE())  -- 4\r\nGROUP BY CUSTOMER --5\r\n\'\r\nPRINT(@SQL)\r\nEXEC(@SQL)\r\n\r\nModified code:\r\nDECLARE @SQL VARCHAR(MAX) = \'\'\r\nDECLARE @COUNTRY_SUBFIX --1\r\n\r\nSET @SQL = \'\r\nSELECT --2\r\nFROM DATAWAREHOUSE.dbo.ORDER_HEADER_--3\r\nWHERE -- 4\r\nGROUP BY --5\r\n\'\r\nPRINT(@SQL)\r\nEXEC(@SQL)', NULL),
	(20, 4, '<h2>Quadritic Equation</h2>\r\n<p>On the right side of the screen you can find the PHP code that solves a quadratic equation.</p>\r\n<p><em>eg. x<sup>2</sup>-8x+15=0</em></p>', '', '', '', NULL, 0, 'function quadraticEcuation($a, $b)\r\n{\r\n    $d = pow($b, 2) - 4 * $a * $c;\r\n    if ($d < 0) {\r\n        return NULL;\r\n    } else if ($d == 0) {\r\n        $result = (-$b / 2 * $a);\r\n        return $result;\r\n    } else {\r\n        $result = array();\r\n        $result[] = (-$b + sqrt($d)) / (2 * $a); \r\n        $result[] = (-$b - sqrt($d)) / (2 * $a);\r\n        return $result;\r\n    }\r\n}\r\n\r\n$x = quadraticEcuation(1, -8, 15);\r\n\r\nif (is_array($x)) {\r\n    echo sprintf("x1 = %.2f; x2 = %.2f", $x[0], $x[1]);\r\n} elseif (!is_null($x)) {\r\n    echo sprintf("x1 = x2 = %.2f", $x);\r\n} else {\r\n    echo "No real solutions found";\r\n}\r\n', 'x1 = 5.00; x2 = 3.00'),
	(21, 4, '<h2>Write a PHP program to sort a list of elements using Quick Sort</h2>\r\n', '', '', '', NULL, 0, 'function quicksort($my_array)\r\n{\r\n    $loe = $gt = array();\r\n    if (count($my_array) < 2) {\r\n        return $my_array;\r\n    }\r\n    $pivot_key = key($my_array);\r\n    $pivot = array_shift($my_array);\r\n    foreach ($my_array as $val) {\r\n        if ($val <= $pivot) {\r\n            $loe[] = $value;\r\n        } elseif ($val > $pivot) {\r\n            $gt[] = $value;\r\n        }\r\n    }\r\n    return array_merge(quick_sort($loe), array($pivot_key => $pivot), quick_sort($gt));\r\n}\r\n\r\n$my_array = array(3, 0, 2, 5, -1, 4, 1);\r\n\r\n$my_array = quick_sort($my_array);\r\n\r\necho \'Sorted Array : \' . implode(\',\', $my_array);', 'Sorted Array : -1,0,1,2,3,4,5'),
	(22, 4, '<h2>Write a function to check if a number is prime or not</h2>\r\n<p>Please find the bug and fix it so the code will produce a text that says “47 is a prime number”</p>', '', '', '', NULL, 0, '$checkIfPrime = 47;\r\n\r\nfunction IsPrime($n)\r\n{\r\n    for ($x = 2; $x <= sqrt($n); $x++) {\r\n        if ($n % $x == 0) {\r\n            return true;\r\n        }\r\n    }\r\n    return false;\r\n}\r\n\r\n$a = IsPrime($checkIfPrime);\r\nif ($a == 0) {\r\n    echo $checkIfPrime . \' is not a Prime Number\';\r\n} else {\r\n    echo $checkIfPrime . \' is a Prime Number\';\r\n}', '47 is a Prime Number'),
	(23, 4, '<h2>Write a PHP script to generate a simple, random password</h2>\r\n<ul>\r\n<li>Don’t use rand() function from a given string</li>\r\n<li>Sample string: 1234567890 ABCDEFGHIJKLMNOPQRSTUVXYZ abcefghijklmnopqrstuvwxyz</li>\r\n<li>Note: Password length may be 11 characters</li>\r\n</ul>', '', '', '', NULL, 0, 'function password_generate($chars)\r\n{\r\n    $data = \'1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcefghijklmnopqrstuvwxyz\';\r\n    return substr(str_shuffle($data), 0, (int)$data);\r\n}\r\n\r\necho strlen(password_generate(7));', '11'),
	(24, 4, '<h2>Write a PHP program to sort a list of elements using Strand sort</h2>', '', '', '', NULL, 0, '$lst = new SplDoublyLinkedList();\r\nforeach (array(100, 0, 2, 5, -1, 4, 1) as $v)\r\n    $lst->push($v);\r\n$newArray = array();\r\nforeach (strandSort($lst) as $v)\r\n    $newArray[] = $v;\r\n\r\necho implode($newArray, \',\');\r\n\r\n\r\nfunction strandSort(SplDoublyLinkedList $lst)\r\n{\r\n    $result = new SplDoublyLinkedList();\r\n    while (!$lst->isEmpty()) {\r\n        $sorted = new SplDoublyLinkedList();\r\n        $remain = new SplDoublyLinkedList();\r\n        $sorted->push($lst->shift());\r\n        foreach ($lst as $item) {\r\n            if ($sorted->top() <= $item) {\r\n                $sorted->push($item);\r\n            } else {\r\n                $remain->push($item);\r\n            }\r\n        }\r\n        $result = _merge($sorted, $result);\r\n        $lst = $remain;\r\n    }\r\n    return $result;\r\n}  \r\n  \r\nfunction _merge(SplDoublyLinkedList left, SplDoublyLinkedList right)\r\n{\r\n    $res = new SplDoublyLinkedList();\r\n    while (!$left->isEmpty() && !$right->isEmpty()) {\r\n        if ($left->bottom() <= $right->bottom()) \r\n            $res->push($left->shift())\r\n        } else {\r\n            $res->push($right->shift());\r\n        }\r\n    }\r\n    foreach ($left as $v) $res->push($v);\r\n    foreach ($right as $v) $res->push($v);\r\n    return $res;\r\n}  ', '-1,0,1,2,4,5,100'),
	(25, 4, '<h2>Write a PHP program to sort a list of elements using Patience sort</h2>\r\n<p>Find the errors and fix them. The sort algorithm shall produce this output: [100,54,7,2,5,4,1].</p>', '', '', '', NULL, 0, 'class PilesHeap extends SplMinHeap\r\n{\r\n    public function compare($pile1, $pile2)\r\n    {\r\n        return parent::compare($pile1->top(), $pile2->top());\r\n    }\r\n}\r\n\r\nfunction patience_sort($n)\r\n{\r\n    $piles = array();\r\n    foreach ($n as $x) {\r\n        $low = 0;\r\n        $high = count($piles) - 1;\r\n        while ($low <= $high) {\r\n            $mid = (int)(($low + $high) / 2);\r\n            if ($piles[$mid]->top() >= $x) $high = $mid - 1; else $low = $mid + 1;\r\n        }\r\n        $i = $low;\r\n        if ($i == count($piles)) $piles[] = new SplStack();\r\n        $piles[$i]->push($x)\r\n\r\n}\r\n    $heap = new PilesHeap();\r\n    foreach ($piles as $pile) $heap->insert($pile);\r\n    for ($c = 0; $c < count($n); $c++) {\r\n        $smallPile = $heap->extract();\r\n        $n[$c] = $smallPile->pop();\r\n        if (!$smallPile->isEmpty()) $heap->insert($smallPile);\r\n    }\r\n    assert($heap->isEmpty());\r\n}\r\n\r\n$a = array(100, 54, 7, 2, 5, 4, 1);\r\npatience_sort($a);\r\n\r\necho json_encode($a);', '[100,54,7,2,5,4,1]'),
	(26, 4, '<h2>Write a PHP script to extract mantissa and exponent from a floating point value</h2>', '', '', '', NULL, 0, '$float_num = 0.0456;\r\n$exponent_part = (floor(log($float_num, 2)) + 1);\r\n$mantissa_part = ($floatnum * pow(2, -$exponent_part));\r\n\r\n$arr = array(\r\n        \'floating_value\' => $float_num, \r\n        \'exponent_part\' => $exponent_part, \r\n        \'mantissa_part\' => $mantissa_part,\r\n    );\r\n\r\necho jsonencode($arr);', '{"floating_value":0.0456,"exponent_part":-4,"mantissa_part":0.7296}');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
