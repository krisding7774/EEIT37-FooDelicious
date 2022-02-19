<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<head>
    <link rel="stylesheet" href="../../../css/backendAge.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
</head>
<body>
<!-- Button trigger modal -->
<a data-bs-toggle="modal" data-bs-target="#staticBackdrop">
    Launch static backdrop modal
</a>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">優惠加購</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <!-- 這裡是新增加的，其它都是網上的-->
                <div class="container">
                    <div class="card">
                        <div class="container-fliud">
                            <div class="wrapper row">
                                    <div class="preview col-md-6">
                                        <div class="preview-pic tab-content">
                                            <div class="tab-pane active" id="pic-1">
                                                <img  src="/img/checken.png" />
                                            </div>
                                        </div>
                                    </div>
                            </div>
                            <div class="wrapper ">
                                    <div class="details col-md-6">
                                        <h2 id="company" class="product-conpany"></h2>
                                        <h3 id="title" class="product-title"></h3>
                                        <p id="description" class="product-description"></p>
                                        <h4 class="price">
                                            商品甜甜價 : <span id="price"></span>
                                        </h4>

                                    </div>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- 這裡是新增加的，其它都是網上的-->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary">新增至購物車</button>
            </div>
        </div>
    </div>
</div>


<script>
    window.onload = function(){

        urlString = "http://localhost:8080/bkproducts/find/11";
        // alert(urlString);
        $.ajax({
            url: urlString,
            type: "GET",
            success: function(productFood){
                $("#company").text(productFood.productCompany);
                $("#title").text(productFood.productName);
                $("#description").text(productFood.productContent);
                $("#price").text(productFood.productPrice);

            }
        });
    };

</script>


</body>
</html>