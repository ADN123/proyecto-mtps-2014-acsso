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
                                <p class="mb15">Cantidad de promociones de la ley realizadas en los diferentes departamentos de El Salvador en los últimos 6 meses</p>
                                <div id="barchart" style="width: 100%; height: 300px"></div>
                            </div>
                        <?php } else $col=12;?>
                        <div class="col-sm-<?=$col?>">
                            <h5 class="subtitle mb5">Promociones por CLAEES </h5>
                            <p class="mb15">Clasificaciones CLAEES más utilizadas en los últimos 6 meses</p>
                            
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
                    <p class="mb15">Cantidad de promociones de la ley realizadas por sector económico en los últimos 6 meses</p>
                    <div id="donut-chart2" style="text-align: center; height: 298px;"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="panel">
                <div class="panel-heading">
                    <h5 class="subtitle mb5">Capacitaciones</h5>
                    <p class="mb15">Estadísticas de capacitaciones realizadas en los últimos 6 meses</p>
                  	<div id="basicflot" style="width: 100%; height: 300px; margin-bottom: 20px"></div>
                </div>
                <div class="panel-body">
                    <div class="tinystat pull-left">
                        <div id="sparkline" class="chart mt5"></div>
                        <div class="datainfo">
                            <span class="text-muted">Capacitados</span>
                            <h4 id="tc">33 Trabajadores</h4>
                        </div>
                    </div>
                    <div class="tinystat pull-right">
                        <div id="sparkline2" class="chart mt5"></div>
                        <div class="datainfo">
                            <span class="text-muted">Beneficiados</span>
                            <h4 id="tb">127 Trabajadores</h4>
                        </div>
                    </div>
                </div>
            </div>          
        </div>
 	</div>
    
    <div class="row">
        <div class="col-sm-7">
            <div class="panel">
                <div class="panel-heading">
                    <h5 class="subtitle mb5">Acreditaciones</h5>
                    <p class="mb15">Acreditaciones entregas en los últimos 6 meses según sexo</p>
                  	<div id="stacked-chart" style="height: 300px;"></div>
                </div>
            </div>          
        </div>
        <div class="col-sm-5">
            <div class="panel">
                <div class="panel-heading">
                    <h5 class="subtitle mb5">Verificaciones</h5>
                    <p class="mb15">Estado de las verificaciones hechas en los últimos 6 meses</p>
                  	<div id="piechart" style="width: 100%; height: 300px"></div>
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

		<?php
			$cant3='';
			$cant2='';
			$cant32='';
			$cant22='';
			$stc=0;
			$stb=0;
			foreach($total_capacitaciones_ultimos_meses as $val) {
				switch($val['mes']) {
					case 1: 
						$mes="Enero";
						break;
					case 2:
						$mes="Febreo";
						break;
					case 3: 
						$mes="Marzo";
						break;
					case 4: 
						$mes="Abril";
						break;
					case 5: 
						$mes="Mayo";
						break;
					case 6: 
						$mes="Junio";
						break;
					case 7: 
						$mes="Julio";
						break;
					case 8: 
						$mes="Agosto";
						break;
					case 9: 
						$mes="Septiembre";
						break;
					case 10: 
						$mes="Octubre";
						break;
					case 11: 
						$mes="Noviembre";
						break;
					case 12: 
						$mes="Diciembre";
						break;
				}
				$cant3.='["'.$mes." ".$val['anio'].'", '.$val['capacitados'].'],';
				$cant2.='["'.$mes." ".$val['anio'].'", '.$val['beneficiados'].'],';
				$cant32.=''.$val['capacitados'].',';
				$cant22.=''.$val['beneficiados'].',';
				$stc=$stc+$val['capacitados'];
				$stb=$stb+$val['beneficiados'];
			}
		?>
		$("#tc").text("<?=$stc?> Trabajadores");
		$("#tb").text("<?=$stb?> Trabajadores");
        var trabajadores_beneficiados = [<?=$cant2?>];
        var trabajadores_capacitados = [<?=$cant3?>];
    
        var plot = jQuery.plot(jQuery("#basicflot"),
            [
                { 
                    data: trabajadores_beneficiados,
                    label: "Trabajadores Beneficiados",
                    color: "#D9534F",
					points: {
						symbol: "square"
					}
                },
                { 
                    data: trabajadores_capacitados,
                    label: "Trabajadores Capacitados",
                    color: "#428BCA",
					lines: {
						fill: true
					},
					points: {
						symbol: 'diamond',
						lineWidth: 2
					}
                }
            ],
      		{
				series: {
					lines: {
						show: true,
						lineWidth: 2
					},
					points: {
						show: true
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
					color: '#eee'
				},
				xaxis: {
					color: '#eee',
					mode: "categories",
					tickLength: 0
				}
            }
        );

        var previousPoint = null;
     	jQuery("#basicflot").bind("plothover", function (event, pos, item) {
      		jQuery("#x").text(pos.x.toFixed(2));
      		jQuery("#y").text(pos.y.toFixed(2));
            
        	if(item) {
          		if(previousPoint != item.dataIndex) {
             		previousPoint = item.dataIndex;
                        
             		jQuery("#tooltip").remove();
             		var x = item.datapoint[0].toFixed(0),
             		y = item.datapoint[1].toFixed(0);
                
             		showTooltip(item.pageX, item.pageY,
                  	item.series.label + ": " + y);
          		}
        	} 
			else {
          		jQuery("#tooltip").remove();
          		previousPoint = null;            
        	}
		});
        
		jQuery("#basicflot").bind("plotclick", function (event, pos, item) {
			if (item) {
				plot.highlight(item.series, item.datapoint);
			}
		});

        jQuery('#sparkline').sparkline([<?=$cant32?>], {
            type: 'bar', 
            height:'30px',
            barColor: '#428BCA'
        });    
    
        jQuery('#sparkline2').sparkline([<?=$cant22?>], {
            type: 'bar', 
            height:'30px',
            barColor: '#1CAF9A'
        });		
		
		<?php
			$cant4='';
			foreach($total_acreditaciones_ultimos_meses as $val) {
				switch($val['mes']) {
					case 1: 
						$mes="Ene";
						break;
					case 2:
						$mes="Feb";
						break;
					case 3: 
						$mes="Mar";
						break;
					case 4: 
						$mes="Abr";
						break;
					case 5: 
						$mes="May";
						break;
					case 6: 
						$mes="Jun";
						break;
					case 7: 
						$mes="Jul";
						break;
					case 8: 
						$mes="Ago";
						break;
					case 9: 
						$mes="Sep";
						break;
					case 10: 
						$mes="Oct";
						break;
					case 11: 
						$mes="Nov";
						break;
					case 12: 
						$mes="Dic";
						break;
				}
				$cant4.='{ y: "'.$mes." ".substr($val['anio'],2,2).'", a: '.$val['acreditados_hombres'].', b: '.$val['acreditados_mujeres'].'},';
			}
		?>
		
		new Morris.Bar({
			element: 'stacked-chart',
			data: [<?=$cant4?>
			],
			xkey: 'y',
			ykeys: ['a', 'b'],
			labels: ['Hombres', 'Mujeres'],
			barColors: ['#428BCA', '#F0AD4E'],
			lineWidth: '1px',
			fillOpacity: 0.8,
			smooth: false,
			stacked: true,
			hideHover: true
		});
		
		<?php
			$cant5='';
			$col=0;
			$color[]='#F0AD4E';
			$color[]='#5BC0DE';
			$color[]='#D9534F';
			foreach($total_verifcaciones_ultimos_meses as $val) {
				$cant5.='{ label: "'.$val['estado'].'", data: '.$val['total'].', color: "'.$color[$col].'"},';
				$col++;
			}
		?>
		
		var piedata = [
			<?=$cant5?>
		];
		
		jQuery.plot('#piechart', piedata, {
			series: {
				pie: {
					show: true,
					radius: 1,
					label: {
						show: true,
						radius: 2/3,
						formatter: labelFormatter,
						threshold: 0.1
					}
				}
			},
			grid: {
				hoverable: true,
				clickable: true
			}
		});
		
		function labelFormatter(label, series) {
			return "<div style='font-size:8pt; text-align:center; padding:2px; color:white;'>" + label + "<br/>" + Math.round(series.percent) + "%</div>";
		}
        <?php } ?> 
    });
</script>