import { Component, OnInit } from '@angular/core';
import * as Highcharts from 'highcharts';
import HC_exporting from 'highcharts/modules/exporting';
import { GraficoService } from '../../services/grafico.service';
HC_exporting(Highcharts);

@Component({
  selector: 'app-grafico-efetivados-encaminhados',
  templateUrl: './grafico-efetivados-encaminhados.component.html',
  styleUrls: ['./grafico-efetivados-encaminhados.component.scss']
})
export class GraficoEfetivadosEncaminhadosComponent implements OnInit {

  constructor(private graficoService: GraficoService) { }

  ngOnInit(): void {
    this.graficoService.carregarEfetivadosEncaminhados().subscribe(res => {      
      if(res.ok && res.body) {        
        this.configuracaoGrafico.series[0].data = res.body;                
        Highcharts.chart('efetivados-encaminhados', this.configuracaoGrafico);
      }
    });
  }

  configuracaoGrafico:any = {
    chart: {      
      type: 'pie'
    },
    credits: {
      enabled: false
    },
    title: {
        text: 'Encaminhados por escolas'
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
