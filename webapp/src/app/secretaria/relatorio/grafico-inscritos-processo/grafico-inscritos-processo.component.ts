import { Component, OnInit } from '@angular/core';
import * as Highcharts from 'highcharts';
import HC_exporting from 'highcharts/modules/exporting';
import { GraficoService } from '../../services/grafico.service';
HC_exporting(Highcharts);

@Component({
  selector: 'app-grafico-inscritos-processo',
  templateUrl: './grafico-inscritos-processo.component.html',
  styleUrls: ['./grafico-inscritos-processo.component.scss']
})
export class GraficoInscritosProcessoComponent implements OnInit {

  constructor(private graficoService: GraficoService) { }

  ngOnInit(): void {
    this.graficoService.carregarInscritos().subscribe(res => {      
      if(res.ok && res.body) {        
        this.configuracaoGrafico.series[0].data = res.body;                
        Highcharts.chart('container', this.configuracaoGrafico);
      }
    });
  }

  configuracaoGrafico:any = {
    chart: {
      type: 'column'      
    },
    title: {
        text: 'Total de inscritos por processo seletivo'
    },
    credits: {
      enabled: false
    },
    tooltip: {
      pointFormat: 'Total de inscritos <b>{point.y:.1f}</b>'
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
      name: 'Inscritos',
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
