import { Component, OnInit } from '@angular/core';
import { GraficoService } from '../../services/grafico.service';
import * as Highcharts from 'highcharts';
import HC_exporting from 'highcharts/modules/exporting';
HC_exporting(Highcharts);

@Component({
  selector: 'app-grafico-demanda',
  templateUrl: './grafico-demanda.component.html',
  styleUrls: ['./grafico-demanda.component.scss']
})
export class GraficoDemandaComponent implements OnInit {
  constructor(private graficoService: GraficoService) {}  

  ngOnInit(): void {
    this.graficoService.carregarDemandas().subscribe(res => {      
      if(res.ok && res.body) {        
        this.pizza.series[0].data = res.body;                
        Highcharts.chart('pizza',this.pizza);
      }
    });
  }

  pizza: any = {
    chart: {      
      type: 'pie'
    },
    credits: {
      enabled: false
    },
    title: {
        text: 'Demanda por escolas'
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    accessibility: {
        point: {
            valueSuffix: '%'
        }
    },
    plotOptions: {
        pie: {            
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.y:.1f}'
            }
        }
    },
    series: [{
        name: 'Quantidade',        
        data: []
    }]
  }

}
