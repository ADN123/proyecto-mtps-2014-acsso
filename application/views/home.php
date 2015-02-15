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
                            <small class="stat-label">promociones de ley realizadas</small>
                            <h1><?php echo $total_promociones[0]['total1']?></h1>
                        </div>
                    </div>
                    <div class="mb15"></div>
                    <small class="stat-label">% promociones asignadas</small>
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
                                <small class="stat-label">lugares de trabajo asingados</small>
                                <h1><?php echo $total_lugares_trabajo[0]['total']?></h1>
                            </div>
                        </div>
                        <div class="mb15"></div>
                        <small class="stat-label">% lugares de trabajo no programados</small>
                        <h4><?php echo number_format(($total_sin_programaciones[0]['total']/$total_lugares_trabajo[0]['total']*100), 2)."%" ?></h4>
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
                    <p class="mb15">Cantidad de promociones de la ley realizadas por sector económico</p>
                    <div id="donut-chart2" style="text-align: center; height: 298px;"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="panel">
                <div class="panel-heading">
                    <h5 class="subtitle mb5">Promociones por Sector</h5>
                    <p class="mb15">Cantidad de promociones de la ley realizadas por sector económico</p>
                  <div id="basicflot" style="width: 100%; height: 300px; margin-bottom: 20px"></div>
                </div>
                <div class="panel-body">
                    <div class="tinystat pull-left">
                        <div id="sparkline" class="chart mt5"></div>
                        <div class="datainfo">
                            <span class="text-muted">Average Sales1</span>
                            <h4>$630,201</h4>
                        </div>
                    </div>
                    <div class="tinystat pull-left">
                        <div id="sparkline" class="chart mt5"></div>
                        <div class="datainfo">
                            <span class="text-muted">Average Sales2</span>
                            <h4>$630,201</h4>
                        </div>
                    </div>
                    <div class="tinystat pull-right">
                        <div id="sparkline2" class="chart mt5"></div>
                        <div class="datainfo">
                            <span class="text-muted">Total Sales</span>
                            <h4>$139,201</h4>
                        </div>
                    </div>
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

        /*new Morris.Line({
            // ID of the element in which to draw the chart.
            element: 'line-chart',
            // Chart data records -- each entry in this array corresponds to a point on
            // the chart.
            data: [
                { y: '2006', a: 50, b: 0 },
                { y: '2007', a: 60,  b: 25 },
                { y: '2008', a: 45,  b: 30 },
                { y: '2009', a: 40,  b: 20 },
                { y: '2010', a: 50,  b: 35 },
                { y: '2011', a: 60,  b: 50 },
                { y: '2012', a: 65, b: 55 }
            ],
            xkey: 'y',
            ykeys: ['a', 'b'],
            labels: ['Series A', 'Series B'],
            gridTextColor: 'rgba(255,255,255,0.5)',
            lineColors: ['#fff', '#fdd2a4'],
            lineWidth: '2px',
            hideHover: 'always',
            smooth: false,
            grid: false
        });*/

        var uploads = [["Sep 14", 13], ["Oct 14", 5], ["Nov 14", 2], ["Dic 14", 6], ["Ene 15",3], ["Feb 15", 8]];
        var downloads = [["Sep 14", 5], ["Oct 14", 4], ["Nov 14",4], ["Dic 14", 1], ["Ene 15", 9], ["Feb 15", 10]];
    
        var plot = jQuery.plot(jQuery("#basicflot"),
            [
                { 
                    data: uploads,
                    label: "Uploads",
                    color: "#1CAF9A"
                },
                { 
                    data: downloads,
                    label: "Downloads",
                    color: "#428BCA"
                }
            ],
            {
                series: {
                    lines: {
                        show: true,
                        fill: true,
                        lineWidth: 1,
                        fillColor: {
                            colors: [ 
                                { 
                                    opacity: 0.5
                                },
                                { 
                                    opacity: 0.5 
                                }
                            ]
                        }
                    },
                    points: {
                        //show: true
                    },
                    shadowSize: 0
                },
                legend: {
                    position: 'nw'
                },
                grid: {
                    hoverable: true,
                    clickable: true,
                    borderColor: '#ddd',
                    borderWidth: 1,
                    labelMargin: 10,
                    backgroundColor: '#fff'
                },
                yaxis: {
                    min: 0,
                    max: 15,
                    color: '#eee'
                },
                xaxis: {
                    color: '#eee'
                }
            }
        );

        var previousPoint = null;
     jQuery("#basicflot").bind("plothover", function (event, pos, item) {
      jQuery("#x").text(pos.x.toFixed(2));
      jQuery("#y").text(pos.y.toFixed(2));
            
        if(item) {
          if (previousPoint != item.dataIndex) {
             previousPoint = item.dataIndex;
                        
             jQuery("#tooltip").remove();
             var x = item.datapoint[0].toFixed(2),
             y = item.datapoint[1].toFixed(2);
                
             showTooltip(item.pageX, item.pageY,
                  item.series.label + " of " + x + " = " + y);
          }
            
        } else {
          jQuery("#tooltip").remove();
          previousPoint = null;            
        }
        
     });
        
     jQuery("#basicflot").bind("plotclick", function (event, pos, item) {
        if (item) {
          plot.highlight(item.series, item.datapoint);
        }
     });

        jQuery('#sparkline').sparkline([4,3,3,1,4,3,2,2,3,10,9,6], {
            type: 'bar', 
            height:'30px',
            barColor: '#428BCA'
        });    
    
        jQuery('#sparkline2').sparkline([9,8,8,6,9,10,6,5,6,3,4,2], {
            type: 'bar', 
            height:'30px',
            barColor: '#999'
        });

    });
</script>