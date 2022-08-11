<?php

    $servername = "localhost";
    $username = "web5_project";
    $password = "MjTfxBBmt";
    $dbname = "web5_project";
    $table = "user";

    $action = $_POST["action"];
    $where = $_POST["where"];

    $conn = new mysqli($servername, $username, $password, $dbname);

    if($conn->connect_error){
        die("Connection Failed:" . $conn->connect_error);
        return;
    }

    if("CREATE_TABLE" == $action){
        $sql = "CREATE TABLE IF NOT EXISTE $table(
            user_id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
            user_name VARCHAR(255) NOT NULL,
            user_surname VARCHAR(255) NOT NULL,
            user_phone VARCHAR(10) NOT NULL,
            user_email VARCHAR(255) NOT NULL,
            user_password VARCHER(255) NOT NULL,
            user_latitude VARCHER(255),
            user_longitude VARCHER(255), 
            user_role VARCHER(255)       )";

        if($conn->query($sql) == TRUE){
            echo "success";
        }
        else{
            echo "error";
        }
        $conn->close();
        return;

    }

    if("GET_ALL" == $action){
        $db_data = array();
        $sql = "SELECT * from $table";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }

            echo json_encode($db_data);
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }

    if("GET_ALL_PRODUCT" == $action){
        $db_data = array();
        $sql = "SELECT * from product ";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }

            echo json_encode($db_data);
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }

    if("GET_ONLY_PRODUCT" == $action){
        $db_data = array();
        $sql = "SELECT * FROM product WHERE product_type_id = $where";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }

            echo json_encode($db_data);
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }

    if("GET_ALL_SOURCE" == $action){
        $db_data = array();
        $sql = "SELECT * from source ";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }

            echo json_encode($db_data);
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }

    if("GET_IMPORT_PRODUCT" == $action){
        $db_data = array();
        $sql = "SELECT *
        FROM import_order
        INNER JOIN source
        ON import_order.Import_source_id = source.source_id where import_order.Import_status = '$where'";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }

            echo json_encode($db_data);
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }


    if("GET_IMPORT_PRODUCTDETAI" == $action){
        $db_data = array();
        $sql = "SELECT import_order.Import_order_id,import_order.Import_product_pricetotal,product.product_name,product.product_image,product.product_price,import_order_detail.basket_product_quantity,import_order_detail.basket_product_pricetotal FROM import_order INNER JOIN source ON import_order.Import_source_id = source.source_id INNER JOIN import_order_detail ON import_order.Import_order_id = import_order_detail.Import_order_id INNER JOIN product ON import_order_detail.basket_product_id = product.product_id
        WHERE import_order.Import_order_id = '$where' ";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }

            echo json_encode($db_data);
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }

    if("GET_ADMIN_BASKET" == $action){
        $db_data = array();
        $sql = "SELECT *
        FROM basket
        INNER JOIN product
        ON basket.basket_product_id = product.product_id;";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }

            echo json_encode($db_data);
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }


    if("GET_EXPORT_PRODUCT" == $action){
        $db_data = array();
        $sql = "SELECT * FROM user_order";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }

            echo json_encode($db_data);
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }

    if("GET_ORDER_DETAIL" == $action){
        $db_data = array();
        $sql = "SELECT user_order.order_id,user_order.order_by,user_order.order_responsible_person,user_order.total_price,user_order.order_status,user_order_detail.product_amount,product.product_name,product.product_image,product.product_price FROM user_order
        INNER JOIN user_order_detail
        ON user_order.order_id = user_order_detail.order_id
        INNER JOIN product
        ON user_order_detail.product_id = product.product_id";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }

            echo json_encode($db_data);
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }

    if("ADD_BASKET" == $action){
        $basket_product_id = $_POST['basket_product_id'];
        $basket_product_quantity = $_POST['basket_product_quantity'];
        $basket_product_pricetotal = $_POST['basket_product_pricetotal'];
        $source_id = $_POST['source_id'];

        $sql = "INSERT INTO basket (basket_product_id, basket_product_quantity, basket_product_pricetotal,basket_product_source) VALUES ('$basket_product_id','$basket_product_quantity','$basket_product_pricetotal','$source_id')";
        $result = $conn->query($sql);
        echo "success";
        
        $conn->close();
        return;
    }

    if("ADD_USER_BASKET" == $action){
        $basket_product_id = $_POST['basket_product_id'];
        $basket_product_quantity = $_POST['basket_product_quantity'];
        $basket_product_pricetotal = $_POST['basket_product_pricetotal'];
        $source_id = $_POST['email'];

        $sql = "INSERT INTO user_basket (user_basket_product_id, user_basket_quantity, user_basket_pricetotal,user_basket_email) VALUES ('$basket_product_id','$basket_product_quantity','$basket_product_pricetotal','$source_id')";
        $result = $conn->query($sql);
        echo "success";
        
        $conn->close();
        return;
    }

    if("ADD_EMP" == $action){
        $user_name = $_POST['user_name'];
        $user_surname = $_POST['user_surname'];
        $user_phone = $_POST['user_phone'];
        $user_email = $_POST['user_email'];
        $user_password = $_POST['user_password'];
        $user_latitude = '';
        $user_longitude = '';
        $user_role = "customer";
        $sql = "INSERT INTO $table (user_name, user_surname, user_phone, user_email, user_password, user_role) VALUES ('$user_name','$user_surname','$user_phone','$user_email','$user_password','$user_role')";
        $result = $conn->query($sql);
        echo "success";
        $conn->close();
        return;

    }

    if("UPDATE_EMP" == $action){
        $user_id = $_POST['user_id'];
        $user_name = $_POST['user_name'];
        $user_surname = $_POST['user_surname'];
        $user_phone = $_POST['user_phone'];
        $user_email = $_POST['user_email'];
        $user_password = $_POST['user_password'];
        $sql = "UPDATE $table SET user_name = '$user_name',user_surname = '$user_surname',user_phone = '$user_phone',user_email = '$user_email', user_password = '$user_password'";
        if($conn->query($sql) === TRUE){
            echo "success";
        }else{
            echo "error";
        }
        $conn->close();
        return;
        
    }

    if("UPDATE_USER" == $action){
        $username = $_POST['username'];
        $usersurname = $_POST['usersurname'];
        $useremail = $_POST['useremail'];
        $userrole = $_POST['userrole'];
        $userphone = $_POST['userphone'];
        $sql = "UPDATE user SET user_name='$username',user_surname='$usersurname',user_phone='$userphone',user_email='$useremail',user_role='$userrole' WHERE user_id = $where";
        if($conn->query($sql) === TRUE){
            echo "success";
        }else{
            echo "error";
        }
        $conn->close();
        return;
        
    }


    if('DELETE_EMP' == $action){
        $user_id = $_POST['user_id'];
        $sql = "DELETE FROM $table WHERE id = $user_id ";
        if($conn->query($sql) === TRUE){
            echo "success";
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }

    if('DELETE_ORDER' == $action){
        $where = $_POST['where'];
        $sql = "DELETE FROM import_order WHERE import_order.Import_order_id = '$where'";
        if($conn->query($sql) === TRUE){
            echo "success";
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }

    if('DELETE_ORDERDETAIL' == $action){
        $where = $_POST['where'];
        $sql = "DELETE FROM import_order_detail WHERE import_order_detail.Import_order_id = '$where'";
        if($conn->query($sql) === TRUE){
            echo "success";
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }

    if("ADD_USER_ORDER" == $action){
        $order_id = $_POST['order_id'];
        $order_by = $_POST['order_by'];
        $user_latitude = $_POST['user_latitude'];
        $user_longitude = $_POST['user_latitude'];
        $order_responsible_person = $_POST['order_responsible_person'];
        $total_price = $_POST['total_price'];
        $order_status = $_POST['order_status'];

        $sql = "INSERT INTO user_order(order_id,order_by,user_latitude,user_longitude,order_responsible_person,total_price,order_status) VALUES ('$order_id','$order_by','$user_latitude','$user_longitude','$order_responsible_person','$total_price','$order_status')";
        $result = $conn->query($sql);
        echo "success";
        $conn->close();
        return;

    }
    if("_LOGIN_ACTION" == $action){   
        $db_data = array();
        $useremail = $_POST['useremail'];
        $password = $_POST['password'];
        $sql = "SELECT * FROM user WHERE user.user_email = '$useremail' AND user.user_password = '$password'";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            echo json_encode($db_data);
        }else{
            echo "error";
        }
        $conn->close();
        return;

    }


    if("ADD_PRODUCT" == $action){
        $product_name = $_POST['product_name'];
        $product_detail = $_POST['product_detail'];
        $product_image = $_POST['product_image'];
        $product_price = $_POST['product_price'];
        $product_quantity = $_POST['product_quantity'];
        $export_product = $_POST['export_product'];
        $import_product = $_POST['import_product'];

        $sql = "INSERT INTO product(product_name,product_detail,product_image,product_price,product_quantity,export_product,import_product) VALUES ('$product_name','$product_detail','$product_image','$product_price','$product_quantity','$export_product','$import_product')";
        $result = $conn->query($sql);
        echo "success";
        $conn->close();
        return;
    }

    if("ADD_ORDERDETAIL" == $action){
        $order_id = $_POST['order_id'];
        $product_id = $_POST['product_id'];
        $product_amount = $_POST['product_amount'];
        $product_per_pice = $_POST['product_per_pice'];
        $total = $_POST['total'];

        $sql = "INSERT INTO user_order_detail(order_id,product_id,product_amount,product_per_price,total) VALUES ('$order_id','$product_id','$product_amount','$product_per_pice','$total')";
        $result = $conn->query($sql);
        echo "success";
        $conn->close();
        return;
    }

    if("_ADD_IMPORTPRODUCT_DETAIL" == $action){
        $Import_order_id = $_POST['Import_order_id'];
        $basket_product_id = $_POST['basket_product_id'];
        $basket_product_quantity = $_POST['basket_product_quantity'];
        $basket_product_pricetotal = $_POST['basket_product_pricetotal'];
        $DateTime = $_POST['DateTime'];

        $sql = "INSERT INTO import_order_detail(Import_order_id,basket_product_id,basket_product_quantity,basket_product_pricetotal,DateTime) VALUES ('$Import_order_id','$basket_product_id','$basket_product_quantity','$basket_product_pricetotal','$DateTime')";
        $result = $conn->query($sql);
        echo "success";
        $conn->close();
        return;
    }

    if("_ADD_IMPORTPRODUCT" == $action){
        $Import_order_id = $_POST['Import_order_id'];
        $Import_product_pricetotal = $_POST['Import_totalprice'];
        $Import_date = $_POST['DateTime'];
        $Import_status = 'สินค้ายังไม่ครบ';
        $source_id = $_POST['source_id'];

        $sql = "INSERT INTO import_order(Import_order_id,Import_product_pricetotal,Import_date,Import_status,Import_source_id) VALUES ('$Import_order_id','$Import_product_pricetotal','$Import_date','$Import_status','$source_id')";
        $result = $conn->query($sql);
        echo "success";
        $conn->close();
        return;

    }

    if("DELETE_BASKET" == $action){ 
        $sql = "DELETE FROM basket";
        $result = $conn->query($sql);
        echo "success";
        $conn->close();
        return;
    }

    if("ORDER_SUBMIT" == $action){ 
        $sql = "UPDATE import_order SET Import_status= 'ส่งแล้ว' WHERE Import_order_id = '$where'";
        $result = $conn->query($sql);
        echo "success";
        $conn->close();
        return;
    }


?>