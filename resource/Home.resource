*** Settings ***
Library  SudsLibrary

*** Variable ***
${URL}  http://automationpractice.com
${BROWSER}  Chrome
${ip}             150.162.2.1



*** Keywords ***
Consultar IP
  Create Soap Client  http://ws.cdyne.com/ip2geo/ip2geo.asmx?wsdl
  ${result}    Call Soap Method    ResolveIP    ${ip}    null
  ${country}    Get Wsdl Object Attribute    ${result}    Country
  ${Latitude}    Get Wsdl Object Attribute    ${result}    Latitude
  ${Longitude}    Get Wsdl Object Attribute    ${result}    Longitude
  ${area_code}    Get Wsdl Object Attribute    ${result}    AreaCode
  ${has_day_light_savings}    Get Wsdl Object Attribute    ${result}    HasDaylightSavings
  ${certainty}    Get Wsdl Object Attribute    ${result}      Certainty
  ${regionName}    Get Wsdl Object Attribute    ${result}      RegionName
  log    The IP ${ip} belongs to the country ${country}, Latitude: ${Latitude} Longitude: ${Longitude}, AreaCode: ${area_code}, ${has_day_light_savings}, ${certainty}, ${regionName}
