import $ from "jquery";
import loader from "./loader.js";

let responses = {
    createUser: { 
        id: 1,
        user: "Ionut Popescu", 
        isValid: true
    },
    getQuestion: {
        1: [
            {
                id: 1,
                answer: "4",
                title: "What’s the most efficient way to append the character “c” to: Seq(“a”, “b”)?",
                option1: `Seq(“a”, “b”) += “c”`,
                option2: `Seq(“a”, “b”) ++ Seq(“c”)`,
                option3: `Seq(“a”, “b”) += Seq(“c”)`,
                option4: `Seq(“a”, “b”) :+ “c”`
            },
            {
                id: 2,
                answer: "1",
                options: [
                    `Prints “true”`,
                    `Returns an error for the second function, no return clause`,
                    `Returns an error, the first function is not correctly defined`,
                    `Prints “false”`
                ],
                code: `var inm = (x: Int, y:Int) => x*y
                    def mul  (x: Int, y: Int): Int = {
                        var inm = x*y
                        inm
                    }
                    println((inm(3, 4) == mul(2, 6)))`
            },
            {
                id: 3,
                answer: "2",
                options: [
                    `Prints the string “foo bar”`,
                    `Error. Fix is in the line: val str = ""`,
                    `Error. Fix is in the line: str= x + " " + y`,
                    `Error. Fix is in the line: val c = func(a, b)`,
                ],
                code: `var a = "foo"
                    var b = "bar"
                    def func (x: String, y:String): String = {
                        val str = ""
                        str= x + " " + y
                        str
                    }
                    val c = func(a, b)
                    println(c)`
            }
        ],
        2: [
            {
                id: 1,
                answer: "2",
                title: "What is a Spark executor?",
                options: [
                    `A process that creates the SparkContext and runs the main() function`,
                    `A high rank in the Protoss Templar Caste`,
                    `A node that can run application code in the cluster`,
                    `A process launched by an application that runs tasks.`
                ]
            },
        ],
        3: [
            {
                id: 1,
                answer: "3",
                title: "In order to partition a table in MSSQL, you need the following pre-requisites:",
                options: [
                    `A partition function`,
                    `A partition schema`,
                    `A partition column`,
                    `All of above`
                ]
            },
        ],
        4: [
            {
                id: 1,
                answer: "4",
                title: "Write a PHP program to sort a list of elements using Quick Sort",
                code: "function quicksort($my_array)\r\n{\r\n    $loe = $gt = array();\r\n    if (count($my_array) < 2) {\r\n        return $my_array;\r\n    }\r\n    $pivot_key = key($my_array);\r\n    $pivot = array_shift($my_array);\r\n    foreach ($my_array as $val) {\r\n        if ($val <= $pivot) {\r\n            $loe[] = $value;\r\n        } elseif ($val > $pivot) {\r\n            $gt[] = $value;\r\n        }\r\n    }\r\n    return array_merge(quick_sort($loe), array($pivot_key => $pivot), quick_sort($gt));\r\n}\r\n\r\n$my_array = array(3, 0, 2, 5, -1, 4, 1);\r\n\r\n$my_array = quick_sort($my_array);\r\n\r\necho 'Sorted Array : ' . implode(',', $my_array);"
            },
        ],
        5: [
            {
                id: 1,
                answer: "2",
                title: "What’s the most efficient way to append the character “c” to: Seq(“a”, “b”)?",
                options: [
                    `Seq(“a”, “b”) += “c”`,
                    `Seq(“a”, “b”) ++ Seq(“c”)`,
                    `Seq(“a”, “b”) += Seq(“c”)`,
                    `Seq(“a”, “b”) :+ “c”`
                ]
            },
        ],
        6: [
            {
                id: 1,
                answer: "1",
                title: "What’s the most efficient way to append the character “c” to: Seq(“a”, “b”)?",
                options: [
                    `Seq(“a”, “b”) += “c”`,
                    `Seq(“a”, “b”) ++ Seq(“c”)`,
                    `Seq(“a”, “b”) += Seq(“c”)`,
                    `Seq(“a”, “b”) :+ “c”`
                ]
            },
        ],
    },
    getLeaderboard: [{"id":"2","name":"Ovidiu","highscore":"20"},{"id":"1","name":"Bogdan","highscore":"10"},{"id":"3","name":"Octavian","highscore":"5"},{"id":"4","name":"Ciprian","highscore":"0"},{"id":"5","name":"Daniel","highscore":"0"}]
};

let fakeAjax = (url, data) => {
    loader.show();
    return new Promise((resolve) => {
        setTimeout(() => {
            loader.hide();
            resolve(data ? responses[url][data] : responses[url]); 
        }, 1000);
    })
};

let ajaxHelper = (url, method="GET", data) => {
    loader.show();
    return $.ajax({
        url: url,
        method: method,
        data: data,
    }).then( (data) => {
        loader.hide();
        return data;
    }).fail( () => loader.hide() );
};

export {fakeAjax, ajaxHelper};