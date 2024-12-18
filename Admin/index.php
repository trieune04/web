<?php 
  include('../middleware/adminmiddleware.php');
  include('includes/header.php'); 
?>
<div class="container-fluid py-4">
  <div class="row">
    <!-- Card 1: Today's Money -->
    <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
      <div class="card shadow-lg rounded-3 bg-primary">
        <div class="card-header p-3 pt-2">
          <div class="icon icon-lg icon-shape bg-light text-center border-radius-xl mt-n4 position-absolute">
            <i class="material-icons opacity-10 text-dark">weekend</i>
          </div>
          <div class="text-end pt-1 text-white">
            <p class="text-sm mb-0 text-capitalize">Today's Money</p>
            <h4 class="mb-0">$53k</h4>
          </div>
        </div>
        <hr class="dark horizontal my-0">
        <div class="card-footer p-3 bg-dark text-white">
          <p class="mb-0"><span class="text-success text-sm font-weight-bolder">+55% </span>than last week</p>
        </div>
      </div>
    </div>

    <!-- Card 2: Today's Users -->
    <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
      <div class="card shadow-lg rounded-3 bg-warning">
        <div class="card-header p-3 pt-2">
          <div class="icon icon-lg icon-shape bg-light text-center border-radius-xl mt-n4 position-absolute">
            <i class="material-icons opacity-10 text-dark">person</i>
          </div>
          <div class="text-end pt-1 text-white">
            <p class="text-sm mb-0 text-capitalize">Today's Users</p>
            <h4 class="mb-0">2,300</h4>
          </div>
        </div>
        <hr class="dark horizontal my-0">
        <div class="card-footer p-3 bg-dark text-white">
          <p class="mb-0"><span class="text-success text-sm font-weight-bolder">+3% </span>than last month</p>
        </div>
      </div>
    </div>

    <!-- Card 3: New Clients (Change color to blue) -->
    <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
      <div class="card shadow-lg rounded-3 bg-info"> <!-- Changed to bg-info for blue color -->
        <div class="card-header p-3 pt-2">
          <div class="icon icon-lg icon-shape bg-light text-center border-radius-xl mt-n4 position-absolute">
            <i class="material-icons opacity-10 text-dark">person_add</i>
          </div>
          <div class="text-end pt-1 text-white">
            <p class="text-sm mb-0 text-capitalize">New Clients</p>
            <h4 class="mb-0">3,462</h4>
          </div>
        </div>
        <hr class="dark horizontal my-0">
        <div class="card-footer p-3 bg-dark text-white">
          <p class="mb-0"><span class="text-danger text-sm font-weight-bolder">-2%</span> than yesterday</p>
        </div>
      </div>
    </div>

    <!-- Card 4: Sales -->
    <div class="col-xl-3 col-sm-6">
      <div class="card shadow-lg rounded-3 bg-info">
        <div class="card-header p-3 pt-2">
          <div class="icon icon-lg icon-shape bg-light text-center border-radius-xl mt-n4 position-absolute">
            <i class="material-icons opacity-10 text-dark">monetization_on</i>
          </div>
          <div class="text-end pt-1 text-white">
            <p class="text-sm mb-0 text-capitalize">Sales</p>
            <h4 class="mb-0">$103,430</h4>
          </div>
        </div>
        <hr class="dark horizontal my-0">
        <div class="card-footer p-3 bg-dark text-white">
          <p class="mb-0"><span class="text-success text-sm font-weight-bolder">+5% </span>than yesterday</p>
        </div>
      </div>
    </div>
  </div>
</div>

<?php include('includes/footer.php'); ?>
