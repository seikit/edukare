import { Component, OnInit } from '@angular/core';
import * as Highcharts from 'highcharts';
import HC_exporting from 'highcharts/modules/exporting';
import { GraficoService } from '../../services/grafico.service';
HC_exporting(Highcharts);

@Component({
  selector: 'app-grafico-efetivados',
  templateUrl: './grafico-efetivados.component.html',
  styleUrls: ['./grafico-efetivados.component.scss']
})
export class GraficoEfetivadosComponent implements OnInit {

  constructor(private graficoService: GraficoService) { }

  ngOnInit(): void {
    this.graficoService.carregarEfetivados().subscribe(res => {      
      if(res.ok && res.body) {        
        this.configuracaoGrafico.series[0].data = res.body;        
        Highcharts.chart('efetivados', this.configuracaoGrafico);
      }
    });
  }

  configuracaoGrafico:any = {
    chart: {
      type: 'column'
    },
    title: {
        text: 'Total de efetivados por processo seletivo'
    },
    credits: {
      enabled: false
    },
    tooltip: {
      pointFormat: 'Total de efetivados <b>{point.y:.1f}</b>'
    },
    xAxis: {
      type: 'category',
      labels: {
          rotation: -45,
          style: {
              fontSize: '13px',
              fontFamily: 'Verdana, sans-serif'
          }
      }
    },
    yAxis: {
        min: 0,
        title: {
            text: 'Quantidade'
        }
    },
    series: [{
      name: 'Efetivados',
      data: [],
      dataLabels: {
          enabled: true,
          rotation: -90,
          color: '#FFFFFF',
          align: 'right',
          format: '{point.y:.1f}', // one decimal
          y: 10, // 10 pixels down from the top
          style: {
              fontSize: '13px',
              fontFamily: 'Verdana, sans-serif'
          }
      }
    }]
  }

}
