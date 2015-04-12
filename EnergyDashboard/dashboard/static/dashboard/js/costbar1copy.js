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
            // plotBackgroundImage: 'http://localhost:8000/dashboard/static/dashboard/images/1460361.png',
        },

        title: {
            text: 'POWER CONSUMPTION FOR DIFFERENT CHANNELS',
            style: {
                    color: '#aaaaaa'
            }
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
            color: '#B2DFEE',
            data: [50]
        },{
            name: 'Channel 2',
            color: "#CDC9C9",
            data: [170]
        },{
            name: 'Channel 3',
            color: "#F4A460",
            data: [80]
        },{
            name: 'Channel 4',
            color: "#BCED91",
            data: [180]
        }]
    });
});
