$(function () {
    $('#graph-container5').highcharts({

        chart: {
            type: 'gauge',
            alignTicks: false,
            plotBackgroundColor: null,
            plotBackgroundImage: null,
            plotBorderWidth: 0,
            plotShadow: false
        },

        title: {
            text: 'Instantaneous Energy Consumption'
        },
        subtitle: {
            text: 'Your energy consumption as of 10 minutes ago'
        },
        pane: {
            startAngle: -150,
            endAngle: 150
        },

        yAxis: [{
            min: 0,
            max: 200,
            lineColor: '#339',
            tickColor: '#339',
            minorTickColor: '#339',
            offset: -25,
            lineWidth: 2,
            labels: {
                distance: -20,
                rotation: 'auto'
            },
            tickLength: 5,
            minorTickLength: 5,
            endOnTick: false
        }, {
            min: 100,
            max: 0,
            tickPosition: 'outside',
            lineColor: '#933',
            lineWidth: 2,
            minorTickPosition: 'outside',
            tickColor: '#933',
            minorTickColor: '#933',
            tickLength: 5,
            minorTickLength: 5,
            labels: {
                distance: 12,
                rotation: 'auto'
            },
            offset: -20,
            endOnTick: false
        }],

        series: [{
            name: 'Energy Consumption',
            data: [80],
            dataLabels: {
                formatter: function () {
                    var kmh = this.y,
                        mph = Math.round(Math.abs(kmh/2 - 100));
                    return '<span style="color:#339; font-size:12pt">' + kmh + ' kwh</span><br/>' +
                        '<span style="color:#933; font-size:12pt">' + mph + ' %-ile</span>';
                },
                backgroundColor: {
                    linearGradient: {
                        x1: 0,
                        y1: 0,
                        x2: 0,
                        y2: 1
                    },
                    stops: [
                        [0, '#DDD'],
                        [1, '#FFF']
                    ]
                }
            },
            tooltip: {
                valueSuffix: ' kwh',
                pointFormat: '<span style="color:{point.color}">\u25CF</span> {series.name}: <b>{point.y}</b><br/>'
            }
        }]

    },
        // Add some life
        function (chart) {
            setInterval(function () {
                var point = chart.series[0].points[0],
                    newVal,
                    inc = Math.round((Math.random() - 0.5) * 20);

                newVal = point.y + inc;
                if (newVal < 0 || newVal > 200) {
                    newVal = point.y - inc;
                }

                point.update(newVal);

            }, 10000);

        });
});
