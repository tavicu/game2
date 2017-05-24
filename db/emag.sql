-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.1.21-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for emag
CREATE DATABASE IF NOT EXISTS `emag` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `emag`;

-- Dumping structure for table emag.php_elephant_answers
CREATE TABLE IF NOT EXISTS `php_elephant_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT '0',
  `answer_code` text,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table emag.php_elephant_answers: ~6 rows (approximately)
DELETE FROM `php_elephant_answers`;
/*!40000 ALTER TABLE `php_elephant_answers` DISABLE KEYS */;
INSERT INTO `php_elephant_answers` (`id`, `question_id`, `answer_code`, `timestamp`) VALUES
	(1, 7, '$float_num = 0.0456;\r\n$exponent_part = (floor(log($float_num, 2)) + 1);\r\n$mantissa_part = ($float_num * pow(2, -$exponent_part));\r\n\r\n$arr = array(\r\n        \'floating_value\' => $float_num, \r\n        \'exponent_part\' => $exponent_part, \r\n        \'mantissa_part\' => $mantissa_part,\r\n    );\r\n\r\necho json_encode($arr);', '2017-05-24 17:43:10'),
	(2, 2, 'function quicksort($my_array)\r\n{\r\n    $loe = $gt = array();\r\n    if (count($my_array) < 2) {\r\n        return $my_array;\r\n    }\r\n    $pivot_key = key($my_array);\r\n    $pivot = array_shift($my_array);\r\n    foreach ($my_array as $val) {\r\n        if ($val <= $pivot) {\r\n            $loe[] = $value;\r\n        } elseif ($val > $pivot) {\r\n            $gt[] = $value;\r\n        }\r\n    }\r\n    return array_merge(quick_sort($loe), array($pivot_key => $pivot), quick_sort($gt));\r\n}\r\n\r\n$my_array = array(3, 0, 2, 5, -1, 4, 1);\r\n\r\n$my_array = quick_sort($my_array);\r\n\r\necho \'Sorted Array : \' . implode(\',\', $my_array);', '2017-05-24 17:43:13'),
	(3, 4, 'function password_generate($chars)\r\n{\r\n    $data = \'1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcefghijklmnopqrstuvwxyz\';\r\n    return substr(str_shuffle($data), 0, $chars);\r\n}\r\n\r\necho strlen(password_generate(11));', '2017-05-24 17:43:39'),
	(4, 1, 'function quadraticEcuation($a, $b, $c)\r\n{\r\n    $d = pow($b, 2) - 4 * $a * $c;\r\n    if ($d < 0) {\r\n        return NULL;\r\n    } else if ($d == 0) {\r\n        $result = (-$b / 2 * $a);\r\n        return $result;\r\n    } else {\r\n        $result = array();\r\n        $result[] = (-$b + sqrt($d)) / (2 * $a); \r\n        $result[] = (-$b - sqrt($d)) / (2 * $a);\r\n        return $result;\r\n    }\r\n}\r\n\r\n$x = quadraticEcuation(1, -8, 15);\r\n\r\nif (is_array($x)) {\r\n    echo sprintf("x1 = %.2f; x2 = %.2f", $x[0], $x[1]);\r\n} elseif (!is_null($x)) {\r\n    echo sprintf("x1 = x2 = %.2f", $x);\r\n} else {\r\n    echo "No real solutions found";\r\n}\r\n', '2017-05-24 17:44:27'),
	(5, 7, '$float_num = 0.0456;\r\n$exponent_part = (floor(log($float_num, 2)) + 1);\r\n$mantissa_part = ($floatnum * pow(2, -$exponent_part));\r\n\r\n$arr = array(\r\n        \'floating_value\' => $float_num, \r\n        \'exponent_part\' => $exponent_part, \r\n        \'mantissa_part\' => $mantissa_part,\r\n    );\r\n\r\necho jsonencode($arr);', '2017-05-24 17:44:33'),
	(6, 6, 'class PilesHeap extends SplMinHeap\r\n{\r\n    public function compare($pile1, $pile2)\r\n    {\r\n        return parent::compare($pile1->top(), $pile2->top());\r\n    }\r\n}\r\n\r\nfunction patience_sort($n)\r\n{\r\n    $piles = array();\r\n    foreach ($n as $x) {\r\n        $low = 0;\r\n        $high = count($piles) - 1;\r\n        while ($low <= $high) {\r\n            $mid = (int)(($low + $high) / 2);\r\n            if ($piles[$mid]->top() >= $x) $high = $mid - 1; else $low = $mid + 1;\r\n        }\r\n        $i = $low;\r\n        if ($i == count($piles)) $piles[] = new SplStack();\r\n        $piles[$i]->push($x)\r\n\r\n}\r\n    $heap = new PilesHeap();\r\n    foreach ($piles as $pile) $heap->insert($pile);\r\n    for ($c = 0; $c < count($n); $c++) {\r\n        $smallPile = $heap->extract();\r\n        $n[$c] = $smallPile->pop();\r\n        if (!$smallPile->isEmpty()) $heap->insert($smallPile);\r\n    }\r\n    assert($heap->isEmpty());\r\n}\r\n\r\n$a = array(100, 54, 7, 2, 5, 4, 1);\r\npatience_sort($a);\r\n\r\necho json_encode($a);', '2017-05-24 17:44:39');
/*!40000 ALTER TABLE `php_elephant_answers` ENABLE KEYS */;

-- Dumping structure for table emag.php_elephant_questions
CREATE TABLE IF NOT EXISTS `php_elephant_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `code` text NOT NULL,
  `answer_return` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table emag.php_elephant_questions: ~7 rows (approximately)
DELETE FROM `php_elephant_questions`;
/*!40000 ALTER TABLE `php_elephant_questions` DISABLE KEYS */;
INSERT INTO `php_elephant_questions` (`id`, `question`, `code`, `answer_return`) VALUES
	(1, '<h2>Quadritic Equation</h2>\r\n<p>On the right side of the screen you can find the PHP code that solves a quadratic equation.</p>\r\n<p><em>eg. x<sup>2</sup>-8x+15=0</em></p>\r\n', 'function quadraticEcuation($a, $b)\r\n{\r\n    $d = pow($b, 2) - 4 * $a * $c;\r\n    if ($d < 0) {\r\n        return NULL;\r\n    } else if ($d == 0) {\r\n        $result = (-$b / 2 * $a);\r\n        return $result;\r\n    } else {\r\n        $result = array();\r\n        $result[] = (-$b + sqrt($d)) / (2 * $a); \r\n        $result[] = (-$b - sqrt($d)) / (2 * $a);\r\n        return $result;\r\n    }\r\n}\r\n\r\n$x = quadraticEcuation(1, -8, 15);\r\n\r\nif (is_array($x)) {\r\n    echo sprintf("x1 = %.2f; x2 = %.2f", $x[0], $x[1]);\r\n} elseif (!is_null($x)) {\r\n    echo sprintf("x1 = x2 = %.2f", $x);\r\n} else {\r\n    echo "No real solutions found";\r\n}\r\n', 'x1 = 5.00; x2 = 3.00'),
	(2, '<h2>Write a PHP program to sort a list of elements using Quick Sort</h2>\r\n', 'function quicksort($my_array)\r\n{\r\n    $loe = $gt = array();\r\n    if (count($my_array) < 2) {\r\n        return $my_array;\r\n    }\r\n    $pivot_key = key($my_array);\r\n    $pivot = array_shift($my_array);\r\n    foreach ($my_array as $val) {\r\n        if ($val <= $pivot) {\r\n            $loe[] = $value;\r\n        } elseif ($val > $pivot) {\r\n            $gt[] = $value;\r\n        }\r\n    }\r\n    return array_merge(quick_sort($loe), array($pivot_key => $pivot), quick_sort($gt));\r\n}\r\n\r\n$my_array = array(3, 0, 2, 5, -1, 4, 1);\r\n\r\n$my_array = quick_sort($my_array);\r\n\r\necho \'Sorted Array : \' . implode(\',\', $my_array);', 'Sorted Array : -1,0,1,2,3,4,5'),
	(3, '<h2>Write a function to check if a number is prime or not</h2>\r\n<p>Please find the bug and fix it so the code will produce a text that says “47 is a prime number”</p>', '$checkIfPrime = 47;\r\n\r\nfunction IsPrime($n)\r\n{\r\n    for ($x = 2; $x <= sqrt($n); $x++) {\r\n        if ($n % $x == 0) {\r\n            return true;\r\n        }\r\n    }\r\n    return false;\r\n}\r\n\r\n$a = IsPrime($checkIfPrime);\r\nif ($a == 0) {\r\n    echo $checkIfPrime . \' is not a Prime Number\';\r\n} else {\r\n    echo $checkIfPrime . \' is a Prime Number\';\r\n}', '47 is a Prime Number'),
	(4, '<h2>Write a PHP script to generate a simple, random password</h2>\r\n<ul>\r\n<li>Don’t use rand() function from a given string</li>\r\n<li>Sample string: 1234567890 ABCDEFGHIJKLMNOPQRSTUVXYZ abcefghijklmnopqrstuvwxyz</li>\r\n<li>Note: Password length may be 11 characters</li>\r\n</ul>', 'function password_generate($chars)\r\n{\r\n    $data = \'1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcefghijklmnopqrstuvwxyz\';\r\n    return substr(str_shuffle($data), 0, (int)$data);\r\n}\r\n\r\necho strlen(password_generate(7));', '11'),
	(5, '<h2>Write a PHP program to sort a list of elements using Strand sort</h2>', '$lst = new SplDoublyLinkedList();\r\nforeach (array(100, 0, 2, 5, -1, 4, 1) as $v)\r\n    $lst->push($v);\r\n$newArray = array();\r\nforeach (strandSort($lst) as $v)\r\n    $newArray[] = $v;\r\n\r\necho implode($newArray, \',\');\r\n\r\n\r\nfunction strandSort(SplDoublyLinkedList $lst)\r\n{\r\n    $result = new SplDoublyLinkedList();\r\n    while (!$lst->isEmpty()) {\r\n        $sorted = new SplDoublyLinkedList();\r\n        $remain = new SplDoublyLinkedList();\r\n        $sorted->push($lst->shift());\r\n        foreach ($lst as $item) {\r\n            if ($sorted->top() <= $item) {\r\n                $sorted->push($item);\r\n            } else {\r\n                $remain->push($item);\r\n            }\r\n        }\r\n        $result = _merge($sorted, $result);\r\n        $lst = $remain;\r\n    }\r\n    return $result;\r\n}  \r\n  \r\nfunction _merge(SplDoublyLinkedList left, SplDoublyLinkedList right)\r\n{\r\n    $res = new SplDoublyLinkedList();\r\n    while (!$left->isEmpty() && !$right->isEmpty()) {\r\n        if ($left->bottom() <= $right->bottom()) \r\n            $res->push($left->shift())\r\n        } else {\r\n            $res->push($right->shift());\r\n        }\r\n    }\r\n    foreach ($left as $v) $res->push($v);\r\n    foreach ($right as $v) $res->push($v);\r\n    return $res;\r\n}  ', '-1,0,1,2,4,5,100'),
	(6, '<h2>Write a PHP program to sort a list of elements using Patience sort</h2>\r\n<p>Find the errors and fix them. The sort algorithm shall produce this output: [100,54,7,2,5,4,1].</p>', 'class PilesHeap extends SplMinHeap\r\n{\r\n    public function compare($pile1, $pile2)\r\n    {\r\n        return parent::compare($pile1->top(), $pile2->top());\r\n    }\r\n}\r\n\r\nfunction patience_sort($n)\r\n{\r\n    $piles = array();\r\n    foreach ($n as $x) {\r\n        $low = 0;\r\n        $high = count($piles) - 1;\r\n        while ($low <= $high) {\r\n            $mid = (int)(($low + $high) / 2);\r\n            if ($piles[$mid]->top() >= $x) $high = $mid - 1; else $low = $mid + 1;\r\n        }\r\n        $i = $low;\r\n        if ($i == count($piles)) $piles[] = new SplStack();\r\n        $piles[$i]->push($x)\r\n\r\n}\r\n    $heap = new PilesHeap();\r\n    foreach ($piles as $pile) $heap->insert($pile);\r\n    for ($c = 0; $c < count($n); $c++) {\r\n        $smallPile = $heap->extract();\r\n        $n[$c] = $smallPile->pop();\r\n        if (!$smallPile->isEmpty()) $heap->insert($smallPile);\r\n    }\r\n    assert($heap->isEmpty());\r\n}\r\n\r\n$a = array(100, 54, 7, 2, 5, 4, 1);\r\npatience_sort($a);\r\n\r\necho json_encode($a);', '[100,54,7,2,5,4,1]'),
	(7, '<h2>Write a PHP script to extract mantissa and exponent from a floating point value</h2>', '$float_num = 0.0456;\r\n$exponent_part = (floor(log($float_num, 2)) + 1);\r\n$mantissa_part = ($floatnum * pow(2, -$exponent_part));\r\n\r\n$arr = array(\r\n        \'floating_value\' => $float_num, \r\n        \'exponent_part\' => $exponent_part, \r\n        \'mantissa_part\' => $mantissa_part,\r\n    );\r\n\r\necho jsonencode($arr);', '{"floating_value":0.0456,"exponent_part":-4,"mantissa_part":0.7296}');
/*!40000 ALTER TABLE `php_elephant_questions` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
