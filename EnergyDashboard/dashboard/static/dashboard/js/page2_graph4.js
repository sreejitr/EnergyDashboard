$(function () {

    var gaugeOptions = {

        chart: {
            type: 'solidgauge'
        },

        title: {
            text: 'Instantaneous Energy Consumption in watts'
        },
        
        pane: {
            center: ['50%', '85%'],
            size: '100%',
            startAngle: -90,
            endAngle: 90,
            background: {
                backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',
                innerRadius: '60%',
                outerRadius: '100%',
                shape: 'arc'
            }
        },

        tooltip: {
            enabled: false
        },

        // the value axis
        yAxis: {
            stops: [
                [0.1, '#55BF3B'], // green
                [0.5, '#DDDF0D'], // yellow
                [0.9, '#DF5353'] // red
            ],
            lineWidth: 0,
            minorTickInterval: null,
            tickPixelInterval: 400,
            tickWidth: 0,
            title: {
                y: -70
            },
            labels: {
                y: 16
            }
        },

        plotOptions: {
            solidgauge: {
                dataLabels: {
                    y: 5,
                    borderWidth: 0,
                    useHTML: true
                }
            }
        }
    };

    // The speed gauge
    $('#graph-container5').highcharts(Highcharts.merge(gaugeOptions, {
        yAxis: {
            min: 0,
            max: 100,
            title: {
                text: null
            }
        },

        credits: {
            enabled: false
        },

        series: [{
            name: 'Speed',
            data: [40],
            dataLabels: {
                format: '<div style="text-align:center"><span style="font-size:25px;color:' +
                    ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
                       '<span style="font-size:15px;color:silver">WATTS</span></div>'
            },
            tooltip: {
                valueSuffix: ' th'
            }
        }]

    }));

    // // The RPM gauge
    // $('#graph-container5').highcharts(Highcharts.merge(gaugeOptions, {
    //     yAxis: {
    //         min: 0,
    //         max: 5,
    //         title: {
    //             text: 'RPM'
    //         }
    //     },

    //     series: [{
    //         name: 'RPM',
    //         data: [1],
    //         dataLabels: {
    //             format: '<div style="text-align:center"><span style="font-size:25px;color:' +
    //                 ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y:.1f}</span><br/>' +
    //                    '<span style="font-size:12px;color:silver">* 1000 / min</span></div>'
    //         },
    //         tooltip: {
    //             valueSuffix: ' revolutions/min'
    //         }
    //     }]

    // }));

    // Bring life to the dials
    setInterval(function () {
        // Speed
        var chart = $('#graph-container5').highcharts(),
            point,
            newVal,
            inc;

        if (chart) {
            point = chart.series[0].points[0];
            inc = Math.round((Math.random() - 0.5) * 5);
            newVal = point.y + inc;

            if (newVal < 0 || newVal > 100) {
                newVal = point.y - inc;
            }

            point.update(newVal);
        }

        // // RPM
        // chart = $('#graph-container5').highcharts();
        // if (chart) {
        //     point = chart.series[0].points[0];
        //     inc = Math.random() - 0.5;
        //     newVal = point.y + inc;

        //     if (newVal < 0 || newVal > 5) {
        //         newVal = point.y - inc;
        //     }

        //     point.update(newVal);
        // }
    }, 10000);


});