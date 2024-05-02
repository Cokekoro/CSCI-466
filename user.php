<?php
$hostname = "courses"; 
$dbname = "z2014189"; 
$username = "z2014189"; 
$password = "2002Sep17"; 

try {
    
    $dsn = "mysql:host=$hostname;dbname=$dbname";
    $pdo = new PDO($dsn, $username, $password);
    
    // Set PDO to throw exceptions on error
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    // Function to search for songs by artist, title, or contributor name
    function searchSongs($pdo, $keyword) {
        $keyword = "%$keyword%";
        $sql = "SELECT * FROM Song WHERE Name LIKE :keyword OR Artist LIKE :keyword";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':keyword', $keyword, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    // Function to insert requester into Requester table
    function insertRequester($pdo, $name, $rid) {
        $sql = "INSERT INTO Requester (RID, RNAME) VALUES (:rid, :rname)";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':rid', $rid, PDO::PARAM_STR);
        $stmt->bindParam(':rname', $name, PDO::PARAM_STR);
        return $stmt->execute();
    }
    
    // Function to insert into Queues table
    function insertIntoQueue($pdo, $rid, $sid, $priority) {
        $did = "987654321";
        $sql = "INSERT INTO Queues(RID, DID, S_ID, PRIO) VALUES (:rid, :did, :s_id, :prio)";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':rid', $rid, PDO::PARAM_STR);
        $stmt->bindParam(':did', $did, PDO::PARAM_STR);
        $stmt->bindParam(':s_id', $sid, PDO::PARAM_STR);
        //$stmt->bindParam(':queueType', $queueType, PDO::PARAM_STR);
        $stmt->bindParam(':prio', $priority, PDO::PARAM_INT);
        return $stmt->execute();
    }
    
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Song Search and Queues</title>
</head>
<body>
    <h2>Song Search</h2>
    <form action="" method="GET">
        <input type="text" name="keyword" placeholder="Search by artist, title, or contributor">
        <button type="submit">Search</button>
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['keyword'])) {
        $keyword = $_GET['keyword'];
        $songs = searchSongs($pdo, $keyword);
        if ($songs) {
            echo "<h3>Search Results:</h3>";
            echo "<form action='' method='POST'>";
            echo "<input type='text' name='name' placeholder='Your Name'><br>";
            echo "<input type='text' name='rid' placeholder='Your RID'><br>";
            echo "<input type='checkbox' id='prio' name='prio' value='true'>";
            echo "<label for='prio'> Enter ID and check if returning user. </label><br>";
            echo "<select name='songId'>";
            foreach ($songs as $song) {
                echo "<option value='{$song['S_ID']}'>{$song['Name']} by {$song['Artist']}</option>";
            }
            echo "</select><br>";
            echo "<select name='queueType'>";
            echo "<option value='Free'>Free Queue</option>";
            echo "<option value='Accelerated'>Pay to Go First</option>";
            echo "</select><br>";
            echo "<button type='submit'>Join Queue</button>";
            echo "</form>";
        } else {
            echo "<p>No results found.</p>";
        }
    }

    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['name']) && isset($_POST['rid']) && isset($_POST['songId']) && isset($_POST['queueType'])) {
        $name = $_POST['name'];
        $rid = $_POST['rid'];
        if ($_POST['prio']=='true') {
            $sid = $_POST['songId'];
            $queueType = $_POST['queueType'];
            $priority = ($queueType == 'Accelerated') ? 1 : 0; // Set priority based on queue type
            if (insertIntoQueue($pdo, $rid, $sid, $priority)) {
                echo "<p>Your song request has been added to the $queueType queue.</p>";
            } else {
                echo "<p>Error adding song request to the queue.</p>";
            }
        } else if (insertRequester($pdo, $name, $rid)) {
            $sid = $_POST['songId'];
            $queueType = $_POST['queueType'];
            $priority = ($queueType == 'Accelerated') ? 1 : 0; // Set priority based on queue type
            if (insertIntoQueue($pdo, $rid, $sid, $priority)) {
                echo "<p>Your song request has been added to the $queueType queue.</p>";
            } else {
                echo "<p>Error adding song request to the queue.</p>";
            }
        }
    }
    ?>
</body>
</html>

