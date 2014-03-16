// $(function(){
//   var w = 600;
//   var h = 200;
//   var maxValue = 25;
//   var barPadding = 0.05;
//   var randomNum = function(value){
//     return Math.floor(Math.random() * value) + 1;
//   };

//   var dataset = [];
//   for (var i = 0; i < 25; i++){
//     var newNumber = randomNum(maxValue);
//     dataset.push(newNumber);
//   }

//   var xScale = d3.scale.ordinal()
//                  .domain(d3.range(dataset.length))
//                  .rangeRoundBands([0,w], barPadding);

//   var yScale = d3.scale.linear()
//                   .domain([0, d3.max(dataset)])
//                   .rangeRound([0,h]);

//   var svg = d3.select("body")
//             .append("svg")
//             .attr({
//               width: w,
//               height: h
//             });

//   svg.selectAll("rect")
//      .data(dataset)
//      .enter()
//      .append("rect")
//      .attr({
//         x: function(d, i){ return xScale(i);},
//         y: function(d){ return h - yScale(d);},
//         width: xScale.rangeBand(),
//         height: function(d){ return yScale(d); },
//         fill: function(d){ return "rgb(0, 0, " + Math.floor(d*10) + ")"; }
//      })
//      .on('mouseover',function(d){
//         d3.select(this)
//           .transition()
//           .duration(250)
//           .attr("fill","rgb(" + Math.floor(4000/d) + ",0,0)");
//      })
//      .on('mouseout',function(d){
//         d3.select(this)
//           .transition()
//           .duration(250)
//           .attr("fill","rgb(0, 0, " + Math.floor(d*10) + ")");
//      });

//   svg.selectAll("text")
//      .data(dataset)
//      .enter()
//      .append('text')
//      .text(function(d){
//         return d;
//      })
//      .attr({
//       "text-anchor": "middle",
//       "font-size": "11",
//       "font-family": "sans-serif",
//       x: function(d, i){ return xScale(i) + xScale.rangeBand()/2;},
//       y: function(d){ return h - yScale(d) + 2 * xScale.rangeBand()/3; },
//       fill: "white"
//      });

//   d3.select('a')
//     .on('click', function(){
//       d3.event.preventDefault();

//       var dataset = [];
//       for (var i = 0; i < 25; i++){
//         var newNumber = randomNum(maxValue);
//         dataset.push(newNumber);
//       }

//       yScale.domain([0, d3.max(dataset)]);
//       xScale.domain(d3.range(dataset.length));

//       svg.selectAll("rect")
//          .data(dataset)
//          .transition()
//          .delay(function(d,i){
//             return i / dataset.length * 1000;
//          })
//          .duration(500)
//          .attr({
//             y: function(d){ return h - yScale(d); },
//             height: function(d){ return yScale(d) + xScale.rangeBand(); },
//             fill: function(d){ return "rgb(0, 0, " + Math.floor(d*10) + ")";}
//          });

//       svg.selectAll("text")
//          .data(dataset)
//          .transition()
//          .delay(function(d,i){
//             return i / dataset.length * 1000;
//          })
//          .duration(500)
//          .text(function(d){
//             return d;
//          })
//          .attr({
//             x: function(d, i){ return xScale(i) + xScale.rangeBand()/2; },
//             y: function(d){ return h - yScale(d) + 2 * xScale.rangeBand()/3;}
//          });
//     });

// });