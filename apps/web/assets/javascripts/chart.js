window.onload = function () {
  let spectrum = JSON.parse($('#spectrum')[0].innerHTML);
  let data = []; let dataSeries = { type: "line" };
  dataSeries.dataPoints = spectrum.map(function(point) {
    return {
      x: parseFloat(point[0]),
      y: parseFloat(point[1]),
    }
  });
  data.push(dataSeries);
  console.log(data);

  let chart = new CanvasJS.Chart("chartContainer", {
    zoomEnabled: true,
    title:{
      text: "Spectrum"
    },
    axisY:{
      includeZero: false
    },
    data: data,
  });
  chart.render();
}
