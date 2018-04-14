<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="transactions">
    <html>
      <head>
        <script>

          <xsl:variable name="total" select="count(//transactions/transaction)"/>
          <xsl:variable name="assurance" select="count(//transactions/transaction/ServiceArea[text() = ' Automobile'])"/>
          <xsl:variable name="clothStores" select="count(//transactions/transaction/ServiceArea[text() = ' cloth stores'])"/>
          <xsl:variable name="misc" select="count(//transactions/transaction/ServiceArea[text() = ' misc'])"/>
          <xsl:variable name="wholesaleDistributer" select="count(//transactions/transaction/ServiceArea[text() = ' wholesale distributor'])"/>
          <xsl:variable name="transportation" select="count(//transactions/transaction/ServiceArea[text() = ' transportation'])"/>
          <xsl:variable name="rentalCar" select="count(//transactions/transaction/ServiceArea[text() = ' rental car'])"/>
          <xsl:variable name="retailsStore" select="count(//transactions/transaction/ServiceArea[text() = ' Retails Store'])"/>
          <xsl:variable name="airlines" select="count(//transactions/transaction/ServiceArea[text() = ' airlines'])"/>
          <xsl:variable name="hotel" select="count(//transactions/transaction/ServiceArea[text() = ' hotel'])"/>
          <xsl:variable name="utilities" select="count(//transactions/transaction/ServiceArea[text() = ' utilities'])"/>

          <xsl:variable name="assuranceP" select='$assurance div $total * 100' />
          <xsl:variable name="clothStoresP" select='$clothStores div $total * 100' />
          <xsl:variable name="miscP" select='$misc div $total * 100' />
          <xsl:variable name="wholesaleDistributerP" select='$wholesaleDistributer div $total * 100' />
          <xsl:variable name="transportationP" select='$transportation div $total * 100' />
          <xsl:variable name="rentalCarP" select='$rentalCar div $total * 100' />
          <xsl:variable name="retailsStoreP" select='$retailsStore div $total * 100' />
          <xsl:variable name="airlinesP" select='$airlines div $total * 100' />
          <xsl:variable name="hotelP" select='$hotel div $total * 100' />
          <xsl:variable name="utilitiesP"  select='$utilities div $total * 100' /> 
          window.onload = function() {

          var chart = new CanvasJS.Chart("chartContainer", {
          theme: "light2",
          exportEnabled: true,
          animationEnabled: true,
          title: {
          text: "<xsl:value-of select="//transactions/@name"/> Spending via Credit Card"
          },
        <!--
          toolTip:{
          content: "Promotion \n Beer - 90% Discount \n Kickapoo - Buy 1 free 1 <br/> Dutchlady milk - Vouchers",
          },
          toolTipContent: "<b>{label}</b>: {y} <b>({percentage}%)</b>",
          toolTipContent: "Promotion <br/> Beer - 90% Discount <br/> Kickapoo - Buy 1 free 1 <br/> Dutchlady milk - Vouchers",
          toolTipContent: "{label}: Just {y}%",
          toolTipContent: "<table><tr><th>one</th><th>two</th></tr><tr><td>A</td><td>B</td></tr><tr><td>1</td><td>2</td></tr></table>",
        -->
        toolTip: {
        content: "Click for more {label} promotions",
        backgroundColor: "#FFFF",
        animationEnabled: true,
        cornerRadius: 3,
        enabled: true
        },
        data: [{
        type: "pie",
        startAngle: 25,
        click: onClick,
        indexLabelFontSize: 16,
        indexLabel: "{label} - {y}%",
        dataPoints: [
        <xsl:choose>
          <xsl:when test="$assuranceP > 0">
            { y: <xsl:value-of select="format-number($assuranceP,'0.00')"/>, label: "Automobile", promo: "Hankook Tyres: 2 Years \nBrothers Audio: Discount 40% for all disc player \nFree Windscreen Tint For 5 Windows Tint Package purchased" },
          </xsl:when>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="$clothStoresP > 0">
            { y: <xsl:value-of select="format-number($clothStoresP,'0.00')"/>, label: "cloth stores", promo: "Jakel: New! Satin From Persia \nGulatis: Baju Melayu Sulam For Free with Sampin Purchase \nNagoya: Discount for all Local textiles" },
          </xsl:when>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="$miscP > 0">
            { y: <xsl:value-of select="format-number($miscP,'0.00')"/>, label: "misc", promo: "Klinik Dr Ko: Free Eye Test \nCarpet Benggali Sdn Bhd: Carpet and Floor mat discount \nPom Pom Pillow: Free Blue Pillow for each Red Pillow bought" },
          </xsl:when>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="$wholesaleDistributerP > 0">
            { y: <xsl:value-of select="format-number($wholesaleDistributerP,'0.00')"/>, label: "wholesale distributer", promo: "TESCO: Voucher RM500 for Puchase over RM1000 \n Carrefour: Chicken Fest Buy Egg Free Drumstick \nDave Grocer: Petrol Voucher worth RM500" },
          </xsl:when>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="$transportationP > 0">
            { y: <xsl:value-of select="format-number($transportationP,'0.00')"/>, label: "Transportation", promo: "KTM: Free Ride for Kids \nETS: 50% Discount Student ride \nMRT: Free KFC voucher for ride more than RM5" },
          </xsl:when>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="$rentalCarP > 0">
            { y: <xsl:value-of select="format-number($rentalCarP,'0.00')"/>, label: "rental car", promo: "HERTZ: 500 Loyalty Point for A Session \nRentacar: No Deposit Promo \nYoCar: 30% Discount on rides" },
          </xsl:when>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="$retailsStoreP > 0">
            { y: <xsl:value-of select="format-number($retailsStoreP,'0.00')"/>, label: "Retails Store", promo: "Jaya Grocer: Free Delivery worth RM50 \n99SpeedMart: Free Delivery worth RM150 \nK-Mart Looyalty card 3X multiplier" },
          </xsl:when>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="$airlinesP > 0">
            { y: <xsl:value-of select="format-number($airlinesP,'0.00')"/>, label: "airlines", promo: "Air Asia: 3X loyalty point \nMalindo: Free Meal for Day Travel \nFirefly: Free 40kg Luggage " },
          </xsl:when>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="$hotelP > 0">
            { y: <xsl:value-of select="format-number($hotelP,'0.00')"/>, label: "hotel", promo: "Sheraton: Free Tea Time for two \nWestin: Free Spa Session worth RM450 \nSunway Hotel: 30% Discount on all mocktails in Sunway Bar" },
          </xsl:when>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="$utilitiesP > 0">
            { y: <xsl:value-of select="format-number($utilitiesP,'0.00')"/>, label: "utilities", promo: "TNB: Rebate 40% for early payment \nRebate 10% with online payment \nSyabas: Free Mineral Water for all bill paid in full" }
          </xsl:when>
        </xsl:choose>
          ]
            }]
            });
            chart.render();

            function onClick(e) {
            alert(e.dataPoint.promo);
            }

            }
          </script>
        </head>
        <body>


          <div id="chartContainer" style="height: 370px; width: 100%;"></div>
          <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

<!--     <br/><xsl:value-of select="count(//transactions/transaction)"/>
    <br/><xsl:value-of select="count(//transactions/transaction/ServiceArea[text() = ' Automobile'])"/> Automobile
    <br/><xsl:value-of select="count(//transactions/transaction/ServiceArea[text() = ' cloth stores'])"/> cloth stores
    <br/><xsl:value-of select="count(//transactions/transaction/ServiceArea[text() = ' misc'])"/> misc
    <br/><xsl:value-of select="count(//transactions/transaction/ServiceArea[text() = ' wholesale distributor'])"/> wholesale distributo
    <br/><xsl:value-of select="count(//transactions/transaction/ServiceArea[text() = ' transportation'])"/> transportation
    <br/><xsl:value-of select="count(//transactions/transaction/ServiceArea[text() = ' rental car'])"/> rental car
    <br/><xsl:value-of select="count(//transactions/transaction/ServiceArea[text() = ' Retails Store'])"/> Retails Store
    <br/><xsl:value-of select="count(//transactions/transaction/ServiceArea[text() = ' airlines'])"/> airlines
    <br/><xsl:value-of select="count(//transactions/transaction/ServiceArea[text() = ' hotel'])"/> hotel
    <br/><xsl:value-of select="count(//transactions/transaction/ServiceArea[text() = ' utilities'])"/> utilities -->

  </body>
</html>
</xsl:template>

</xsl:stylesheet> 