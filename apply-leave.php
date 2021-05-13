<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['emplogin'])==0)
{
    header('location:index.php');
}
else{
    if(isset($_POST['apply']))
    {
        $empid=$_SESSION['eid'];
        $leavetype=$_POST['leavetype'];
        $fromdate=$_POST['fromdate'];
        $todate=$_POST['todate'];
        $numdays=$_POST['numdays'];
        $description=$_POST['description'];
        $status=0;
        $isread=0;
        $Hr_status=0;
        $Hr_isread=0;
        if($fromdate > $todate){
            $error=" ToDate should be greater than FromDate ";
        }else{
            //check if there is another leave within the same time
            $eid=$_SESSION['eid'];
            $sql = "SELECT * from tblleaves where empid=:eid and FromDate>='".$fromdate."' and ToDate<='".$todate."'";
            $query = $dbh -> prepare($sql);
            $query->bindParam(':eid',$eid,PDO::PARAM_STR);
            $query->execute();
            $results=$query->fetchAll(PDO::FETCH_OBJ);
            $cnt=1;
            if($query->rowCount() > 0)
            {
                foreach($results as $result)
                {           
                    $error=" You already have another leave scheduled within the selected dates. Description:".$result->Description." From:".$result->FromDate." To:".$result->ToDate;
                }
            } else{
            //done checking
            //Checking number of days
            
                
                
                
                
              //Done checking  
        $sql="INSERT INTO tblleaves(LeaveType,ToDate,FromDate,Description,Status,IsRead,Hr_Status,hr_IsRead,empid) VALUES(:leavetype,:fromdate,:todate,:description,:status,:isread,'".$Hr_status."','".$Hr_isread."',:empid)";
        $query = $dbh->prepare($sql);
        $query->bindParam(':leavetype',$leavetype,PDO::PARAM_STR);
        $query->bindParam(':todate',$fromdate,PDO::PARAM_STR);
        $query->bindParam(':fromdate',$todate,PDO::PARAM_STR);
        $query->bindParam(':description',$description,PDO::PARAM_STR);
        $query->bindParam(':status',$status,PDO::PARAM_STR);
        $query->bindParam(':isread',$isread,PDO::PARAM_STR);
        $query->bindParam(':empid',$empid,PDO::PARAM_STR);
        $query->execute();
        $lastInsertId = $dbh->lastInsertId();
        if($lastInsertId)
        {
            //Update employee table with the number of days
           
            //done updating
            $msg="Leave applied successfully";
            header("location: leavehistory.php");
        }
        else
        {
            $error="Something went wrong. Please try again";
        }
        
            }}}
    
    ?>

<!DOCTYPE html>
<html lang="en">
    <head>
        
        <!-- Title -->
        <title>Employee | Apply Leave</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
        <meta charset="UTF-8">
        <meta name="description" content="Responsive Admin Dashboard Template" />
        <meta name="keywords" content="admin,dashboard" />
        <meta name="author" content="Steelcoders" />
        
        <!-- Styles -->
        <link type="text/css" rel="stylesheet" href="assets/plugins/materialize/css/materialize.min.css"/>
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="assets/plugins/material-preloader/css/materialPreloader.min.css" rel="stylesheet"> 
        <link href="assets/css/alpha.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
  <style>
        .errorWrap {
    padding: 10px;
    margin: 0 0 20px 0;
    background: #fff;
    border-left: 4px solid #dd3d36;
    -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
.succWrap{
    padding: 10px;
    margin: 0 0 20px 0;
    background: #fff;
    border-left: 4px solid #5cb85c;
    -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
        </style>
 


    </head>
    <body>
  <?php include('includes/header.php');?>
            
       <?php include('includes/sidebar.php');?>
   <main class="mn-inner">
                <div class="row">
                    <div class="col s12">
                        <div class="page-title">Apply for Leave</div>
                    </div>
                    <div class="col s12 m12 l8">
                        <div class="card">
                            <div class="card-content">
                                <form id="example-form" method="post" name="addemp">
                                    <div>
                                        <h3>Apply for Leave</h3>
                                        <section>
                                            <div class="wizard-content">
                                                <div class="row">
                                                    <div class="col m12">
                                                        <div class="row">
     <?php if($error){?><div class="errorWrap"><strong>ERROR </strong>:<?php echo htmlentities($error); ?> </div><?php } 
                else if($msg){?><div class="succWrap"><strong>SUCCESS</strong>:<?php echo htmlentities($msg); ?> </div><?php }?>


 <div class="input-field col  s12">
<select  name="leavetype" autocomplete="off" required>
<option value="">Select leave type...</option>
<?php $sql = "SELECT  LeaveType from tblleavetype";
$query = $dbh -> prepare($sql);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $result)
{  
    
    $gender = $_SESSION['gender'];
    if ($gender=='Male' && $result->LeaveType=='Maternity'){
        echo "<option disabled>Maternity not allowed</option>";
    }
    else if($gender =='Female' && $result->LeaveType=='Paternity'){
        echo "<option disabled>Paternity not allowed</option>";
    }else{
    ?>                                            
<option value="<?php echo htmlentities($result->LeaveType);?>"><?php echo htmlentities($result->LeaveType);?></option>
<?php }}} ?>
</select>
</div>
<div id="reserve_form">

    <div id="pickup_date"><p><label class="form">From Date:</label><input type="date" class="textbox" id="pick_date" name="fromdate" onchange="cal()"</p></div>

    <div id="dropoff_date"><p><label class="form">To Date:</label><input type="date" class="textbox" id="drop_date" name="todate" onchange="cal()"/></p></div>

    <div id="numdays"><label class="form">Number of days:</label><input type="text" class="textbox" id="numdays2" name="numdays" readonly/></div>

    </div>

<!--  <div class="input-field col m6 s12">
<label for="fromdate">From  Date</label>
<input placeholder="" id="mask1" name="fromdate" class="masked" type="date" required>
</div>
<div class="input-field col m6 s12">
<label for="todate">To Date</label>
<input placeholder="" id="mask1" name="todate" class="masked" type="date" required>
</div>
<div class="input-field col m12 s12">
<label for="birthdate">Number of Days Requesting</label> 
<input type="text" id="textarea1" name="description" length="3" readonly></input>   
</div> -->
<div class="input-field col m12 s12">
<label for="birthdate">Description</label>    

<textarea id="textarea1" name="description" class="materialize-textarea" length="500" required></textarea>
</div>
</div>

      <button type="submit" name="apply" id="apply" class="waves-effect waves-light btn indigo m-b-xs">Apply</button>                                             

                                                </div>
                                            </div>
                                        </section>
                                     
                                    
                                        </section>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <div class="left-sidebar-hover"></div>
        
        <!-- Javascripts -->
        <script src="assets/js/date.js"></script>
        <script src="assets/plugins/jquery/jquery-2.2.0.min.js"></script>
        <script src="assets/plugins/materialize/js/materialize.min.js"></script>
        <script src="assets/plugins/material-preloader/js/materialPreloader.min.js"></script>
        <script src="assets/plugins/jquery-blockui/jquery.blockui.js"></script>
        <script src="assets/js/alpha.min.js"></script>
        <script src="assets/js/pages/form_elements.js"></script>
          <script src="assets/js/pages/form-input-mask.js"></script>
                <script src="assets/plugins/jquery-inputmask/jquery.inputmask.bundle.js"></script>
    </body>
</html>
<?php } ?> 