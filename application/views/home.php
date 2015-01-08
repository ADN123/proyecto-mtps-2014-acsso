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
                    </div>
                    <div class="mb15"></div>
                    <small class="stat-label">% del total de promociones asignadas</small>
                    <h4><?php echo number_format($total_promociones[0]['total2'], 2)."%" ?></h4>
                </div>
            </div>
        </div>
    </div>
    
    <?php if($id_permiso!=1) { ?>   
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
                        </div>
                        <div class="mb15"></div>
                        <small class="stat-label">total de lugares de trabajo registrados</small>
                        <h4><?php echo $total_lugares_trabajo[0]['total']?></h4>
                    </div>
                </div>
            </div>
        </div>
    <?php } ?>  
</div>
<?php if($id_permiso!=1) { ?>   
    <div class="row">
        <div class="col-sm-8 col-md-9">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <?php if($id_permiso==3) { $col=5;?> 
                            <div class="col-sm-7">
                                <h5 class="subtitle mb5">Promociones por Departamento </h5>
                                <p class="mb15">Cantidad de promociones de la ley realizadas en los diferentes departamentos de El Salvador</p>
                                <div id="barchart" style="width: 100%; height: 300px"></div>
                            </div>
                        <?php } else $col=12;?>
                        <div class="col-sm-<?=$col?>">
                            <h5 class="subtitle mb5">Promociones por CLAEES </h5>
                            <p class="mb15">Clasificaciones CLAEES más utilizadas</p>
                            
                            <?php 
                                $i=1;
                                $total=0;
                                foreach($total_promociones_clasificacion as $val) {
                                    $total=$total+$val['total'];
                                }
                                foreach($total_promociones_clasificacion as $val) {
                                    switch($i) {
                                        case 1:
                                            $css="warning";
                                            break;
                                        case 2:
                                            $css="success";
                                            break;
                                        case 3:
                                            $css="danger";
                                            break;
                                        case 4:
                                            $css="primary";
                                            break;
                                        case 5:
                                            $css="info";
                                            break;
                                        default:
                                            $css="warning";
                                    }
                            ?>
                                    <span class="sublabel"><?php echo $val['nombre_clasificacion']." (".number_format(($val['total']/$total*100),2)."%)"?></span>
                                    <div class="progress progress-sm">
                                        <div style="width: <?php echo number_format(($val['total']/$total*100),2)?>%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="40" role="progressbar" class="progress-bar progress-bar-<?php echo $css?>"></div>
                                    </div>
                            <?php
                                $i++;
                                }
                            ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            
        <div class="col-sm-4 col-md-3">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h5 class="subtitle mb5">Promociones por Sector</h5>
                    <p class="mb15">Cantidad de promociones de la ley realizadas en los diferentes sectores económicos</p>
                    <div id="donut-chart2" style="text-align: center; height: 298px;"></div>
                </div>
            </div>
        </div>
    </div>
<?php } ?>  
<script>
    jQuery(document).ready(function(){
        <?php 
            if($id_permiso==3) { 
                $cant='';
                foreach($total_promociones_departamento as $val) {
                    $cant.='["'.$val['codigo2'].'", '.$val['total'].'],';
                }
        ?>
                var bardata = [ <?php echo $cant ?> ];
        
                jQuery.plot("#barchart", 
                    [ 
                        { 
                            data: bardata,
                            label: "Promociones",
                            color: "#428BCA"
                        }
                    ], 
                    {
                    series: {
                        lines: {
                        lineWidth: 1  
                        },
                        bars: {
                            show: true,
                            barWidth: 0.5,
                            align: "center",
                            lineWidth: 0,
                            fillColor: "#428BCA"
                        }
                    },
                    grid: {
                        hoverable: true,
                        borderColor: '#ddd',
                        borderWidth: 1,
                        labelMargin: 10
                    },
                    xaxis: {
                        mode: "categories",
                        tickLength: 0
                    }
                });
                
                var previousPoint = null;
                jQuery("#barchart").bind("plothover", function (event, pos, item) {
                    jQuery("#x").text(pos.x.toFixed(2));
                    jQuery("#y").text(pos.y.toFixed(2));
                    
                    if(item) {
                        if (previousPoint != item.dataIndex) {
                            previousPoint = item.dataIndex;
                                
                            jQuery("#tooltip").remove();
                            var x = item.datapoint[0],
                            y = item.datapoint[1];
                            
                            switch(x) {
                                case 0:
                                    x="Ahuachapán"
                                    break;  
                                case 1:
                                    x="Cabañas"
                                    break;  
                                case 2:
                                    x="Chalatenango"
                                    break;  
                                case 3:
                                    x="Cuscatlán"
                                    break;  
                                case 4:
                                    x="La Libertad"
                                    break;  
                                case 5:
                                    x="La Paz"
                                    break;  
                                case 6:
                                    x="La Unión"
                                    break;  
                                case 7:
                                    x="Morazán"
                                    break;  
                                case 8:
                                    x="San Miguel"
                                    break;  
                                case 9:
                                    x="San Salvador"
                                    break;  
                                case 10:
                                    x="San Vicente"
                                    break;  
                                case 11:
                                    x="Santa Ana"
                                    break;  
                                case 12:
                                    x="Sonsonate"
                                    break;  
                                case 13:
                                    x="Usulután"
                                    break;                          
                            }
                        
                            showTooltip(item.pageX, item.pageY,
                                item.series.label + " en " + x + ": " + y);
                        }
                    
                    } 
                    else {
                      jQuery("#tooltip").remove();
                      previousPoint = null;            
                    }       
                });
        <?php } ?>  
        <?php if($id_permiso!=1) { ?> 
                new Morris.Donut({
                    element: 'donut-chart2',
                    data: [
                        <?php 
                            foreach($total_promociones_sector as $val) {
                                echo '{label: "'.$val['nombre_sector'].'", value: '.$val['total'].'},';
                            }
                        ?>
                    ],
                    colors: ['#666666','#5BC0DE','#f0ad4e','#D9534F','#1CAF9A','#428BCA','#428BCA']
                });
        <?php } ?> 
    });
</script>