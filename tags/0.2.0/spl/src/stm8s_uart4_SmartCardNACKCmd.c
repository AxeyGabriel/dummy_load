
/**
  ********************************************************************************
  * @file    stm8s_uart4_SmartCardNACKCmd.c
  * @author  MCD Application Team
  * @version V2.2.0
  * @date    30-September-2014
  * @brief   This file contains all the functions for the UART1 peripheral.
   ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software
  * distributed under the License is distributed on an "AS IS" BASIS,
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "stm8s_uart4.h"

/** @addtogroup STM8S_StdPeriph_Driver
  * @{
  */

/** @}
  * @addtogroup UART4_Public_Functions
  * @{
  */

/**
  * @brief  Enables or disables NACK transmission.
  * @param  NewState: new state of the Smart Card mode.
  *         This parameter can be: ENABLE or DISABLE.
  * @retval None
  */
void UART4_SmartCardNACKCmd(FunctionalState NewState)
{
  /* Check parameters */
  assert_param(IS_FUNCTIONALSTATE_OK(NewState));
  
  if(NewState != DISABLE)
  {
    /* Enable the NACK transmission by setting the NACK bit in the CR5 register */
    UART4->CR5 |= UART4_CR5_NACK;
  }
  else
  {
    /* Disable the NACK transmission by clearing the NACK bit in the CR5 register */
    UART4->CR5 &= ((uint8_t)~(UART4_CR5_NACK));
  }
}

/**
  * @}
  */

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
