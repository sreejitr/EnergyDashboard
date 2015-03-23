$(function () {
    $('#graph-container8').highcharts({
        chart: {
            type: 'column',
            margin: 75,
            options3d: {
                enabled: true,
                alpha: 10,
                beta: 25,
                depth: 70
            }
        },
        title: {
            text: 'POWER CONSUMPTION FOR DIFFERENT CHANNELS'
        },
        plotOptions: {
            column: {
                depth: 25
            }
        },
        tooltip: {
            valueSuffix: ' WATTS',
            pointFormat: '<span style="color:{point.color}">\u25CF</span> {series.name}: <b>{point.y}</b><br/>'
        },
        xAxis: {
            categories: ['Channels'],
            labels: {
                style: {
                    fontSize:'15px'
                }
            }
        },
        yAxis: {
            title: {
                text: 'POWER IN WATTS',
                style: {
                    fontSize:'15px'
                }
            },
            labels: {
                style: {
                    fontSize:'15px'
                }
            }
        },
        legend: {
            //layout: 'vertical',
            //align: 'right',
            //verticalAlign: 'middle',
            borderWidth: 0,
            itemStyle: {
                 fontSize:'15px',
                 font: '15px UNICA ONE, sans-serif',
                 color: '#A0A0A0'
              }
        },

        series: [{
            name: 'Channel 1',
            color: '#82CFFD',
            data: [50]
        },{
            name: 'Channel 2',
            color: "#AAAAFF",
            data: [170]
        },{
            name: 'Channel 3',
            color: "#AAAAAF",
            data: [80]
        },{
            name: 'Channel 4',
            color: "#e59400",
            data: [180]
        }]
    });
});
