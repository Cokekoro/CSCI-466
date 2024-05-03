<html>
<style>
table, th, td {
  border:1px solid black;
  border-collapse: collapse;
}
</style>
<?php
$host = "courses";
$dbname = "z1903538";
$username = "z1903538";
$password = "2002Jun27";
try {
    $dsn = "mysql:host=$host;dbname=$dbname";
    $pdo = new PDO ($dsn, $username, $password);
} catch (PDOexception $e) {
    echo "Connection to database failed: " . $e->getMessage();
}
$sqlLP = "SELECT RID, Queues.S_ID, Name FROM Queues, Song WHERE PRIO=0 AND Queues.S_ID=Song.S_ID";
$result = $pdo->query($sqlLP);
$row = $result->fetchAll(PDO::FETCH_NUM);
echo 'Queue:';
echo '<br><table>';
echo '<tr><th>RID</th>';
echo '<th>SID</th>';
echo '<th>Song Name</th>';
echo '</tr>';
foreach ($row as $key => $arr) {
    echo '<tr>';
    foreach ($arr as $s => $value) {
        echo '<td>' . $value . '</td>';
    }
    echo '</tr>';
}
echo '</table><br>';

$sqlHP = "SELECT RID, Queues.S_ID,Name FROM Queues, Song WHERE PRIO=1 AND Queues.S_ID=Song.S_ID";
$result = $pdo->query($sqlHP);
$row = $result->fetchAll(PDO::FETCH_NUM);
echo 'Priority Queue:';
echo '<br><table>';
echo '<tr><th>RID</th>';
echo '<th>SID</th>';
echo '<th>Song Name</th>';
echo '</tr>';
foreach ($row as $key => $arr) {
    echo '<tr>';
    foreach ($arr as $s => $value) {
        echo '<td>' . $value . '</td>';
    }
    echo '</tr>';
}
echo '</table><br>';
?>
<form action="" method=POST>
<input type="text" id="RID" name="RID" value="">
    <label for="RID"> Enter the RID of the requester. </label><br>
<input type="text" id="S_ID" name="S_ID" value="">
    <label for="S_ID"> Song ID to be removed from queue. </label><br>
<input type="checkbox" id="prio" name="prio" value="true">
    <label for="prio"> Remove from Priority Queue. </label><br>
<input type="submit" name="remove" value="Submit">
    <?php
    $rid = trim($_POST["RID"]);
    $sid = trim($_POST["S_ID"]);
    if($_POST["prio"]=="true"){
        $sqlR = "DELETE FROM Queues WHERE RID='$rid' AND S_ID='$sid' AND PRIO=1";
        $n = $pdo->exec($sqlR);
    } else {
        $sqlR = "DELETE FROM Queues WHERE RID='$rid' AND S_ID='$sid' AND PRIO=0";
        $n = $pdo->exec($sqlR);
    }
    ?>
</form>
<p> Refresh to update table. </p>
</html>