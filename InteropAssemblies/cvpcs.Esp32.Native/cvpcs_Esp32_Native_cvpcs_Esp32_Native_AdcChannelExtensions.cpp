//-----------------------------------------------------------------------------
//
//                   ** WARNING! ** 
//    This file was generated automatically by a tool.
//    Re-running the tool will overwrite this file.
//    You should copy this file to a custom location
//    before adding any customization in the copy to
//    prevent loss of your changes when the tool is
//    re-run.
//
//-----------------------------------------------------------------------------

#include "cvpcs_Esp32_Native.h"
#include "cvpcs_Esp32_Native_cvpcs_Esp32_Native_AdcChannelExtensions.h"

#include <adc.h>
#include <esp_adc_cal.h>

#define DEFAULT_VREF 1100

using namespace cvpcs_Esp32_Native::cvpcs_Esp32_Native;

signed int AdcChannelExtensions::NativeCalRawToVoltage( signed int channelNumber, signed int raw, HRESULT &hr )
{
    (void)channelNumber;
    (void)raw;
    (void)hr;
    signed int retValue = 0;

    ////////////////////////////////
    // implementation starts here //
    
    esp_adc_cal_characteristics_t adc_chars = {};
    esp_adc_cal_characterize(channelNumber < SOC_ADC_MAX_CHANNEL_NUM ? ADC_UNIT_1 : ADC_UNIT_2, ADC_ATTEN_DB_11, ADC_WIDTH_BIT_12, DEFAULT_VREF, &adc_chars);
    retValue = esp_adc_cal_raw_to_voltage(raw, &adc_chars);
    
    // implementation ends here   //
    ////////////////////////////////

    return retValue;
}
