$(function() {
  let measurment_id = $("#find-similar").attr("data-id");
  let similarList = $("#similar")
  let spectrum = JSON.parse($('#spectrum')[0].innerHTML);
  let chartData = [];
  let originalchartData = [];
  chartData.push(chartSeries(spectrum));

  renderChart(chartData);

  $("#find-similar").click(function() {
    $.get("find_similar", { id: measurment_id }, function(data) {
      measurments = JSON.parse(data)
      similarList.html("");
      addMeasurmentsToChartData(measurments);
      renderChart(chartData);
    });
  });

  $("#similar").on("change", ".similar-spectrum", function() {
    let index = $(this).attr("data-index");
    if ($(this).find("input")[0].checked) {
      chartData[index].dataPoints = originalchartData[index - 1];
    } else {
      chartData[index].dataPoints = [];
    }
    renderChart(chartData);
  });

  function addMeasurmentsToChartData(measurments) {
    measurments.forEach(function(measurment, i) {
      similarList.append(
        listItem(
          i, measurment.pen_name + " | " + measurment.device_name + " | " + measurment.type
        )
      );
      chartData.push(chartSeries(measurment.spectrum));
      originalchartData.push(mapSpectrum(measurment.spectrum));
    });
  };

  function listItem(index, text) {
    return $('<li class="similar-spectrum" data-index=' + (index + 1) + '>'
      + '<label><input type="checkbox" checked=true /> ' + text + '</label>'
      + '</li>');
  }
});
