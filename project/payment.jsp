<html>
<head>
    <title>GujaratBus</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
    <jsp:include page="header.jsp"/>
<div class="container py-5">
    <div class="row mb-4">
        <div class="col-lg-8 mx-auto text-center">
            <h1 class="display-6">Payment Form</h1>
        </div>
    </div> <!-- End -->
    <div class="row">
        <div class="col-lg-6 mx-auto">
            <div class="card ">

                <div class="card-header">
                    <div class="tab-content">
              
                        <div id="credit-card" class="tab-pane fade show active pt-3">
                            <form action="Payment" method="post">
                                <div class="form-group"> <label for="username">
                                        <h6>Card Owner</h6>
                                    </label> <input type="text" name="cardOwner" placeholder="card owner name" required class="form-control "> </div>
                                <div class="form-group"> <label for="cardNumber">
                                        <h6>Card number</h6>
                                    </label>
                                    <div class="input-group"> <input type="text" minlength="16" maxlength="16" name="cardNumber" placeholder="xxxx xxxx xxxxxx" class="form-control " required>
                                        <div class="input-group-append"> <span class="input-group-text text-muted"> <i class="fab fa-cc-visa mx-1"></i> <i class="fab fa-cc-mastercard mx-1"></i> <i class="fab fa-cc-amex mx-1"></i> </span> </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-8">
                                        <div class="form-group"> 
                                            <label>
                                                <span class="hidden-xs">
                                                    <h6>Expiration Date</h6>
                                                </span>
                                            </label>
                                            <div class="input-group"> 
                                                <input type="number" min="1" max="12" placeholder="MM" name="Expiry_Month" class="form-control" required> 
                                                <input type="number" min="21" max="50" placeholder="YY" name="Expiry_Year" class="form-control" required> </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group mb-4"> <label data-toggle="tooltip" title="Three digit CV code on the back of your card">
                                                <h6>CVV <i class="fa fa-question-circle d-inline"></i></h6>
                                            </label> <input name="CVV" maxlength="3" minlength="3" placeholder="xxx" type="text" required class="form-control"> </div>
                                    </div>


                                    <div class="col-sm-4">
                                        <div class="form-group mb-4"> <label data-toggle="tooltip" title="Three digit CV code on the back of your card">
                                                <h6>amount <i class="fa fa-question-circle d-inline"></i></h6>
                                            
                                            </label> <input type="text" required class="form-control disableTag" readonly  name="Amount" value='<%=request.getAttribute("price")%>'> </div>
                                    </div>

                                </div>
                                <div class="card-footer"> 
                                <button type="submit" class="btn btn-primary btn-block shadow-sm shadeColor" > Confirm Payment </button>
                            </form>
                        </div>
                    </div> <!-- End -->
            
                    <!-- End -->
                </div>
            </div>
        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>