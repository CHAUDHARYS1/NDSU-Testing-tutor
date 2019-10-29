<?php include('heading2.php'); ?>
<style>
    .feedbackFileName {
        background: #E7E9EB;
    }

    .feedbackFileName,
    .score {
        padding: 15px;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
    }
    .score {
        background: #F0B65F;
    }
    .codeTxt{
        color: #414141;
        padding: 20px;
    }

</style>
<div class="container mt-5 mb-5">
    <div class="text-center">
        <h3>Feedback<i class="material-icons icons">playlist_add_check</i></h3>
        <p>You can see the scores of your submission here.</p>
    </div>

    <p><i class="material-icons icons">insert_drive_file</i>File Name:</p>
    <div class="row">

        <div class="col-md-10">
            <div class="feedbackFileName border"><label>filename.js</label><i class="material-icons icons">arrow_drop_down</i></div>
            <div class="border p-2">
                <!-- THE CODE INSIDE THE FILE WILL SHOW HERE -->
                <p class="codeTxt">import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="yourusername",
  passwd="yourpassword",
  database="mydatabase"
)

mycursor = mydb.cursor()

sql = "DELETE FROM customers WHERE address = 'Mountain 21'"

mycursor.execute(sql)

mydb.commit()

print(mycursor.rowcount, "record(s) deleted")</p>
            </div>
        </div>
        <div class="col-md-2">
            <div class="score text-center">
                <label>SCORE<i class="material-icons icons">stars</i></label>
            </div>
            <div class="border p-2">   
                <label>filename.js</label><i class="material-icons icons">arrow_drop_down</i>
                <label>ERROR(s):</label><label>NONE FOUND</label>
                <label>SCORE:</label><label>10/10</label>
                <label>PROBLEMS</label><label>NONE</label>
            </div>
        </div>

    </div>
</div>


<?php include('footer.php'); ?>
