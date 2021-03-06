$(function () {
    $('#graph-container6').highcharts({
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45
            }
        },
        title: {
            text: 'Band Distribution: Percentage of users in each Band'
        },
        subtitle: {
            text: 'Band is determined by comparing individual energy usage to historical average'
        },
        plotOptions: {
            pie: {
                innerSize: 100,
                depth: 45,
                showInLegend: true,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}',
                    style: {
                    fontSize:'15px'
                    }
                }
            }
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        legend: {
            enabled: true,
            useHTML: true,
            layout: 'vertical',
            align: 'right',
            width: 200,
            verticalAlign: 'middle',
            labelFormatter: function() {
                var bandmap = {"Band:Red":"Red: High usage", "Band:Yellow":"Yellow: Medium usage", "Band:Green":"Green: Low usage"};
                var range = bandmap[this.name];
                return '<div style="text-align: left; width:130px; font-size:1.15em;">' + range +'</div>';
   }
        },
        series: [{
            name: 'Percentage of users',
            data: [
                {
                    name: 'Band:Red',
                    y: 27.5,
                    color: "#f45b5b"
                },
                {
                    name: 'Band:Yellow',
                    y: 26.8,
                    color: "#FFFF66"
                },
                {
                    name: 'Band:Green',
                    y: 45.7,
                    color: "#90ee7e"
                }
            ]
        }]
    });
});