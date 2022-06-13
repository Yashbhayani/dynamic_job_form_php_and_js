<?php
$con =  mysqli_connect('localhost','root');
if($con){
    // echo "connection successful";
}else{
    echo " no connection";
}
?>



<?php

mysqli_select_db($con, 'job_application_form');
if(!empty($_POST['gender'])) {

//Basic Detail Form

    $firstname = $_POST['fname'];
    $lastname = $_POST['lname'];
    $email = $_POST['email'];
    $designation = $_POST['designation'];
    $address1 = $_POST['address1'];
    $address2 = $_POST['address2'];
    $gender = $_POST['gender'];
    $zipcode = $_POST['zipcode'];
    $city = $_POST['city'];
    $state = $_POST['state'];
    $RelationShip = $_POST['RelationShip'];
    $dob = $_POST['dob'];

    
    $q = "SELECT * FROM user_basic_detail WHERE firstname ='$firstname' and lastname ='$lastname' and email ='$email'";
    $result = mysqli_query($con,$q);
    $num = mysqli_num_rows($result);

        if($num == 0)
        { 

          //Add Basic Detail Form

           $qb = "insert into user_basic_detail(firstname, lastname, email, designation, address1, address2, gender, zipcode, city, state, relationship, dob) values ('$firstname', '$lastname', '$email', '$designation', '$address1', '$address2', '$gender', '$zipcode', '$city', '$state', '$RelationShip', '$dob')";
           mysqli_query($con,$qb);
          
           $q = "SELECT * FROM user_basic_detail WHERE firstname ='$firstname' and lastname ='$lastname' and email ='$email'";
           $result = mysqli_query($con,$q);

          if(mysqli_num_rows($result)>0){
                while($row = mysqli_fetch_assoc($result)){
                    $user_id = $row['user_id'];
                }
            }


            //education
            $education = $_POST['education'];
            $nameofbord = $_POST['nameofbord'];
            $caursename = $_POST['cau'];
            $univercity = $_POST['uni'];
            $passingyear = $_POST['passingyear'];
            $percentage = $_POST['percentage'];

            $count = 0;

            $ED = NULL;

            foreach ($education as $index) {

                if($index == "ssc" || $index == "hsc"){                        
                     $qb = "insert into user_eduction_detail(user_id, user_exams, name_of_board, course_name, univercity, passing_year, user_percentage) values ('$user_id', '$index', '$nameofbord[$count]',  '$ED', '$ED', '$passingyear[$count]', '$percentage[$count]')";        
                     mysqli_query($con,$qb);
                }else{

                     $qb = "insert into user_eduction_detail(user_id, user_exams, name_of_board, course_name, univercity, passing_year, user_percentage) values ('$user_id', '$index', '$ED', '$caursename[$count]', '$univercity[$count]', '$passingyear[$count]', '$percentage[$count]')";                    
                     mysqli_query($con,$qb);
                }
                $count++;
            }


            //WORK
            $comp_name = $_POST['comp_name'];
            $designation_comp = $_POST['designation_comp'];
            $fromdate = $_POST['fromdate'];
            $todate = $_POST['todate'];

            $count = 0;
            foreach ($comp_name as $index) {
                $qb = "insert into user_work_experience(user_id , company_name,  designation, from_date, to_date) values ('$user_id', '$index', '$designation_comp[$count]', '$fromdate[$count]', '$todate[$count]')";
                mysqli_query($con,$qb);
                $count++;      
            }


            //Language Known   

            $lan = NULL ;
            $read = NULL;
            $write = NULL;
            $speak = NULL;
            if(!empty($_POST['hindi'])){
                $hindi = $_POST['hindi']; 
                $arrLength_hindi_1 = count($hindi);

                foreach ($hindi as $index) {
                    
                    if($index == "hindi"){
                        $lan = $index;
                    }else if($index == "read"){
                        $read = $index;
                    }else if($index == "write"){
                        $write = $index;
                    }else if($index == "speak"){
                        $speak = $index; 
                    }
                }

                $qb = "INSERT INTO `user_language_known` (`user_id`, `language`, `read`, `write`, `speak`) VALUES ($user_id,'$lan','$read','$write','$speak')";
                mysqli_query($con,$qb);
            }



            $lan = NULL ;
            $read = NULL;
            $write = NULL;
            $speak = NULL;

            if(!empty($_POST['english'])){
                $english = $_POST['english'];  
                $arrLength_english_2 = count($english);

                foreach ($english as $index) {

                     if($index == "english"){
                        $lan = $index;
                    }else if($index == "read"){
                        $read = $index;
                    }else if($index == "write"){
                        $write = $index;
                    }else if($index == "speak"){
                        $speak = $index; 
                    }

                }

                $qb = "INSERT INTO `user_language_known` (`user_id`, `language`, `read`, `write`, `speak`) VALUES ($user_id,'$lan','$read','$write','$speak')";
                mysqli_query($con,$qb);
            }


            $lan = NULL ;
            $read = NULL;
            $write = NULL;
            $speak = NULL;
            
            if(!empty($_POST['Gujarati'])){
                $gujarati = $_POST['Gujarati'];
                $arrLength_gujarati_3 = count($gujarati);

                foreach ($gujarati as $index) {

                    if($index == "gujarati"){
                        $lan = $index;
                    }else if($index == "read"){
                        $read = $index;
                    }else if($index == "write"){
                        $write = $index;
                    }else if($index == "speak"){
                        $speak = $index; 
                    }
                }

                $qb = "INSERT INTO `user_language_known` (`user_id`, `language`, `read`, `write`, `speak`) VALUES ($user_id,'$lan','$read','$write','$speak')";
                mysqli_query($con,$qb);
            }
            echo "<br>";



            //Technologies youo know

            $lan = "";
            $teckno = "";
            $count = 0;
            if(!empty($_POST['php'])){
                $php = $_POST['php'];
                $arrLength_php_1 = count($php);

                if($arrLength_php_1 == 2)
                {
                    foreach ($php as $index) {
                        if($count == 0){
                            $lan = $index;
                        }else{
                            $teckno = $index;
                        }
                        $count++;
                    }

                    $qb = "insert into user_technology_knows(user_id, technology, technology_level) values ('$user_id', '$lan', '$teckno')";
                    mysqli_query($con,$qb);
                }else{
                    $alert = "<script>alert('Data is not Valid!');</script>";
                    echo $alert;
                }
            }


            //sql
            $lan = "";
            $teckno = "";
            $count = 0;
            if(!empty($_POST['mysql'])){
                $mysql = $_POST['mysql'];
                $arrLength_mysql_1 = count($mysql);

                if($arrLength_mysql_1 == 2)
                {
                    foreach ($mysql as $index) {
                        if($count == 0){
                            $lan = $index;
                        }else{
                            $teckno = $index;
                        }
                        $count++;
                    }
                    $qb = "insert into user_technology_knows(user_id, technology, technology_level) values ('$user_id', '$lan', '$teckno')";
                    mysqli_query($con,$qb);
                }else{
                    $alert = "<script>alert('Data is not Valid!');</script>";
                    echo $alert;
                }
            }



            //laravel
            $lan = "";
            $teckno = "";
            $count = 0;
            if(!empty($_POST['laravel'])){
                $laravel = $_POST['laravel'];
                $arrLength_laravel_1 = count($laravel);

                if($arrLength_laravel_1 == 2)
                {
                    foreach ($laravel as $index) {
                        if($count == 0){
                            $lan = $index;
                        }else{
                            $teckno = $index;
                        }
                        $count++;
                    }
                    $qb = "insert into user_technology_knows(user_id, technology, technology_level) values ('$user_id', '$lan', '$teckno')";
                    mysqli_query($con,$qb);

                }else{
                    $alert = "<script>alert('Data is not Valid!');</script>";
                    echo $alert;
                }
            }


            //Referance Contact
            $refname = $_POST['refname'];
            $refnumber = $_POST['refnumber'];
            $ref_relation = $_POST['ref_relation'];

            $arrLength_1 = count($refname);
            $arrLength_2 = count($refnumber);
            $arrLength_3 = count($ref_relation);


                if($arrLength_1 == $arrLength_2 && $arrLength_2 == $arrLength_3){
                    $count = 0;
                    foreach ($refname as $index) {
                        $qb = "insert into user_referance_contact(user_id, ref_name, ref_number, ref_relation) values ('$user_id', '$index', '$refnumber[$count]', '$ref_relation[$count]')";
                        mysqli_query($con,$qb);
                        $count++;
                    }
                }else{
                    $alert = "<script>alert('Data is not Valid!');</script>";
                    echo $alert;
                }


            //Preferances:
            $location = $_POST['location'];
            $noticepriod = $_POST['noticepriod'];
            $expacted_ctc = $_POST['expacted_ctc'];
            $current_ctc = $_POST['current_ctc'];
            
            $qb = "insert into user_preferances(user_id, preferd_location, notice_period, expacted_ctc, current_ctc) values ('$user_id', '$location', '$noticepriod', '$expacted_ctc', '$current_ctc')";
            mysqli_query($con,$qb);

            header('location:home.html');
        }else{
            $alert = "<script>alert('Data is Already Registered');</script>";
            echo $alert;
        }
}else{
    echo "sdnlkdsfn";
}
?>
