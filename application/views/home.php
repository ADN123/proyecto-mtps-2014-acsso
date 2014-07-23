<div class="row">
	<div class="col-sm-6 col-md-3">
		<div class="panel panel-success panel-stat">
			<div class="panel-heading">
				<div class="stat">
					<div class="row">
						<div class="col-xs-4">
							<img src="<?php echo base_url()?>images/is-user.png" alt="" />
                  		</div>
                  		<div class="col-xs-8">
                    		<small class="stat-label">promociones realizadas</small>
                    		<h1><?php echo $total_promociones[0]['total1']?></h1>
                  		</div>
                	</div><!-- row -->
                	<div class="mb15"></div>
                	<small class="stat-label">% del total de promociones asignadas</small>
                	<h4><?php echo number_format($total_promociones[0]['total2'], 2)."%" ?></h4>
              	</div><!-- stat -->
			</div><!-- panel-heading -->
		</div><!-- panel -->
	</div><!-- col-sm-6 -->
    
	<?php if($id_permiso==3) { ?>   
        <div class="col-sm-6 col-md-3">
            <div class="panel panel-danger panel-stat">
                <div class="panel-heading">
                    <div class="stat">
                        <div class="row">
                            <div class="col-xs-4">
                                <img src="<?php echo base_url()?>images/is-document.png" alt="" />
                            </div>
                            <div class="col-xs-8">
                                <small class="stat-label">% lugares de trabajo sin visita programada</small>
                                <h1><?php echo number_format(($total_sin_programaciones[0]['total']/$total_lugares_trabajo[0]['total']*100), 2)."%" ?></h1>
                            </div>
                        </div><!-- row -->
                        <div class="mb15"></div>
                        <small class="stat-label">total de lugares de trabajo registrados</small>
                        <h4><?php echo $total_lugares_trabajo[0]['total']?></h4>
                    </div><!-- stat -->
                </div><!-- panel-heading -->
            </div><!-- panel -->
        </div><!-- col-sm-6 -->
    <?php } ?>  
        
	<!--<div class="col-sm-6 col-md-3">
		<div class="panel panel-primary panel-stat">
			<div class="panel-heading">
				<div class="stat">
					<div class="row">
                  		<div class="col-xs-4">
                    		<img src="<?php echo base_url()?>images/is-document.png" alt="" />
                  		</div>
                  		<div class="col-xs-8">
                    		<small class="stat-label">Page Views</small>
                    		<h1>300k+</h1>
                  		</div>
                	</div>
                	<div class="mb15"></div>
                	<small class="stat-label">% Bounce Rate</small>
                	<h4>34.23%</h4>
              	</div>
			</div>
		</div>
	</div>
        
	<div class="col-sm-6 col-md-3">
		<div class="panel panel-dark panel-stat">
			<div class="panel-heading">
				<div class="stat">
					<div class="row">
                  		<div class="col-xs-4">
                    		<img src="<?php echo base_url()?>images/is-money.png" alt="" />
                  		</div>
                  		<div class="col-xs-8">
                    		<small class="stat-label">Today's Earnings</small>
                    		<h1>$655</h1>
                  		</div>
                	</div>
                	<div class="mb15"></div>
                	<div class="row">
                  		<div class="col-xs-6">
                    		<small class="stat-label">Last Week</small>
                    		<h4>$32,322</h4>
                  		</div>
                  		<div class="col-xs-6">
                    		<small class="stat-label">Last Month</small>
                    		<h4>$503,000</h4>
                  		</div>
                	</div>
				</div>
			</div>
		</div>
	</div>-->
</div>