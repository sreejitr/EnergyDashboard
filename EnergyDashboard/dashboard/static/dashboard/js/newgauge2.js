$(function () {

    $('#graph-container9').highcharts({

        chart: {
            type: 'gauge',
            backgroundColor: null,
            plotBackgroundColor: null,
            plotBackgroundImage: null,
            plotBorderWidth: 0,
            plotShadow: false,
            spacingLeft: 15,
            spacingRight: 15,
            spacingTop: 25,
            spacingBottom: 25
        },

        title: {
            text: ''
        },
        plotOptions: {
            gauge: {
                color: '#FFFFFF',
                dial: {
                    radius: '100%',
                    backgroundColor: 'white',
                    borderColor: 'black',
                    borderWidth: 1,
                    baseWidth: 6,
                    topWidth: 1,
                    baseLength: '90%', // of radius
                    rearLength: '0%'
                },
                pivot: {
                    radius: 10,
                    borderWidth: 1,
                    borderColor: 'gray',
                    backgroundColor: {
                        linearGradient: { x1: 0, y1: 0, x2: 1, y2: 1 },
                        stops: [
                            [0, 'white'],
                            [1, 'gray']
                        ]
                    }
                }
            }
        },
        pane: {
            startAngle: -150,
            endAngle: 150,
            background: [{
                backgroundColor: {
                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                    stops: [
                        [0, '#CDCDCD'],
                        [1, '#000']
                    ]
                },
                borderWidth: 0,
                outerRadius: '125%'
            }, {
                backgroundColor: {
                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                    stops: [
                        [0, '#000'],
                        [1, '#333']
                    ]
                },
                borderWidth: 10,
                outerRadius: '110%'
            }, {
                // default background
            }, {
                backgroundColor: {
                    linearGradient: { x1: 0.25, y1: 0, x2: 0.15, y2: 0.5 },
                    stops: [
                        [0, '#236b8e'],
                        [1, '#000']
                    ]
                },
                borderWidth: 8,
                borderColor: '#10303f',
                outerRadius: '115%',
                innerRadius: '0%'
            }]
        },

        // the value axis
        yAxis: {
            min: 0,
            max: 100,

            minorTickInterval: 'auto',
            minorTickWidth: 1,
            minorTickLength: 15,
            minorTickPosition: 'outside',
            minorTickColor: '#666',

            tickPixelInterval: 30,
            tickWidth: 2,
            tickPosition: 'outside',
            tickLength: 20,
            tickColor: '#FFF',
            labels: {
                step: 4,
                padding: 1,
                rotation: 'auto',
                style: {
                    fontSize: '18px',
                    color: '#FFFFFF'
                }
            },
            title: {
                text: 'Cummulative Energy Consumption',
                style: {
                    fontSize: '15px'
                }
            },
            plotBands: [{
                from: 0,
                to: 40,
                color: '#7CFC00' // green
            }, {
                from: 40,
                to: 70,
                color: '#FFE600' // yellow
            }, {
                from: 70,
                to: 100,
                color: '#FF0000' // red
            }]
        },

        series: [{
            name: 'Cummulative Energy Consumed',
            data: [80],
            dataLabels: {
	            formatter: function () {
                    return '<p style="color:#FFFFF; font-size:12px;">'+ this.y + ' kilo-watts</p>';
	            }
            },
            tooltip: {
                valueSuffix: ' watts',
                pointFormat: '<span style="color:{point.color}">\u25CF</span> {series.name}: <b>{point.y}</b><br/>'
            }
        }]

    },
        // Add some life
        function (chart) {
            if (!chart.renderer.forExport) {
                setInterval(function () {
                    var point = chart.series[0].points[0],
                        newVal,
                        inc = Math.round((Math.random() - 0.5) * 10);

                    newVal = point.y + inc;
                    if (newVal < 0 || newVal > 100) {
                        newVal = point.y - inc;
                    }

                    point.update(newVal);

                }, 3000);
            }
        });
});