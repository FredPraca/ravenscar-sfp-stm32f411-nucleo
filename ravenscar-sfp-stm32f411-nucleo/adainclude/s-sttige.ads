with Interfaces;

package System.STM32F4.Timers.GeneralPurpose is

   TIM5_Base    : constant := APB1_Peripheral_Base + 16#0C00#;
   TIM4_Base    : constant := APB1_Peripheral_Base + 16#0800#;
   TIM3_Base    : constant := APB1_Peripheral_Base + 16#0400#;
   TIM2_Base    : constant := APB1_Peripheral_Base + 16#0000#;

   type Counter_Direction is (UPCOUNTING, DOWNCOUNTING) with
        Size => 1;
   for Counter_Direction use (UPCOUNTING => 0, DOWNCOUNTING => 1);

   type Center_Aligned_Mode is
     (EDGE_ALIGNED,
      CENTER_ALIGNED_MODE_1,
      CENTER_ALIGNED_MODE_2,
      CENTER_ALIGNED_MODE_3) with
        Size => Bits_2'Size;
   for Center_Aligned_Mode use
   (EDGE_ALIGNED          => 2#00#,
    CENTER_ALIGNED_MODE_1 => 2#01#,
    CENTER_ALIGNED_MODE_2 => 2#10#,
    CENTER_ALIGNED_MODE_3 => 2#11#);

   type Clock_Division is (IDENTICAL, DIVIDED_BY_2, DIVIDED_BY_4) with
        Size => Bits_2'Size;
   for Clock_Division use
   (IDENTICAL    => 2#00#,
    DIVIDED_BY_2 => 2#01#,
    DIVIDED_BY_4 => 2#10#);

   type Control_Register_1 is record
      Counter_Enable            : Boolean;
      Update_Disable            : Boolean;
      Update_Request_Source     : Boolean;
      One_Pulse_Mode            : Boolean;
      Direction                 : Counter_Direction;
      CMS                       : Center_Aligned_Mode;
      Autoreload_preload_enable : Boolean;
      CKD                       : Clock_Division;
   end record with Size => Bits_16'Size;
   for Control_Register_1 use
      record
         Counter_enable at 0 range 0 .. 0;
         Update_Disable at 0 range 1 .. 1;
         Update_Request_Source at 0 range 2 .. 2;
         One_Pulse_Mode at 0 range 3 .. 3;
         Direction at 0 range 4 .. 4;
         CMS at 0 range 5 .. 6;
         Autoreload_preload_enable at 0 range 7 .. 7;
         CKD at 0 range 8 .. 9;
      end record;

   type DMA_Selection is (ON_CCX_EVENT, ON_UPDATE_EVENT) with
        Size => Bits_1'Size;
   for DMA_Selection use (ON_CCX_EVENT => 0, ON_UPDATE_EVENT => 1);

   type Master_Mode_Selection is
     (RESET,
      ENABLE,
      UPDATE,
      COMPARE_PULSE,
      COMPARE_OC1REF,
      COMPARE_OC2REF,
      COMPARE_OC3REF,
      COMPARE_OC4REF) with
        Size => Bits_3'Size;
   for Master_Mode_Selection use
   (RESET          => 2#000#,
    ENABLE         => 2#001#,
    UPDATE         => 2#010#,
    COMPARE_PULSE  => 2#011#,
    COMPARE_OC1REF => 2#100#,
    COMPARE_OC2REF => 2#101#,
    COMPARE_OC3REF => 2#110#,
    COMPARE_OC4REF => 2#111#);

   type TI1_Selection is (CHANNEL_1_CONNECTED, ALL_CHANNELS_CONNECTED) with
        Size => Bits_1'Size;
   for TI1_Selection use
   (CHANNEL_1_CONNECTED    => 0,
    ALL_CHANNELS_CONNECTED => 1);

   type Control_Register_2 is record
      CCDS     : DMA_Selection;
      MMS      : Master_Mode_Selection;
      TI1S     : TI1_Selection;
   end record with Size => Bits_16'Size;
   for Control_Register_2 use
      record
         CCDS at 0 range 3 .. 3;
         MMS at 0 range 4 .. 6;
         TI1S at 0 range 7 .. 7;
      end record;

   type Slave_Mode_Selection is
     (DISABLED,
      ENCODER_MODE_1,
      ENCODER_MODE_2,
      ENCODER_MODE_3,
      RESET_MODE,
      GATED_MODE,
      TRIGGER_MODE,
      EXTERNAL_CLOCK_MODE) with
        Size => Bits_3'Size;
   for Slave_Mode_Selection use
   (DISABLED            => 2#000#,
    ENCODER_MODE_1      => 2#001#,
    ENCODER_MODE_2      => 2#010#,
    ENCODER_MODE_3      => 2#011#,
    RESET_MODE          => 2#100#,
    GATED_MODE          => 2#101#,
    TRIGGER_MODE        => 2#110#,
    EXTERNAL_CLOCK_MODE => 2#111#);

   type Trigger_Selection is
     (ITR0,
      ITR1,
      ITR2,
      ITR3,
      TI1_EDGE_DETECTOR,
      FILTERED_TI1,
      FILTERED_TI2,
      EXTERNAL_TRIGGER_INPUT) with
        Size => Bits_3'Size;
   for Trigger_Selection use
   (ITR0                   => 2#000#,
    ITR1                   => 2#001#,
    ITR2                   => 2#010#,
    ITR3                   => 2#011#,
    TI1_EDGE_DETECTOR      => 2#100#,
    FILTERED_TI1           => 2#101#,
    FILTERED_TI2           => 2#110#,
    EXTERNAL_TRIGGER_INPUT => 2#111#);

   type Slave_Mode is (NO_ACTION, DELAYED) with
        Size => Bits_1'Size;
   for Slave_Mode use (NO_ACTION => 0, DELAYED => 1);

   type External_Trigger_Filter is
     (NO_FILTER,
      TWO_TIMES_INTERNAL,
      FOUR_TIMES_INTERNAL,
      EIGHT_TIMES_INTERNAL,
      SIX_TIMES_DTS_DIVIDED_BY_2,
      EIGHT_TIMES_DTS_DIVIDED_BY_2,
      SIX_TIMES_DTS_DIVIDED_BY_4,
      EIGHT_TIMES_DTS_DIVIDED_BY_4,
      SIX_TIMES_DTS_DIVIDED_BY_8,
      EIGHT_TIMES_DTS_DIVIDED_BY_8,
      FIVE_TIMES_DTS_DIVIDED_BY_16,
      SIX_TIMES_DTS_DIVIDED_BY_16,
      EIGHT_TIMES_DTS_DIVIDED_BY_16,
      FIVE_TIMES_DTS_DIVIDED_BY_32,
      SIX_TIMES_DTS_DIVIDED_BY_32,
      EIGHT_TIMES_DTS_DIVIDED_BY_32) with
        Size => Bits_4'Size;
   for External_Trigger_Filter use
   (NO_FILTER                     => 2#0000#,
    TWO_TIMES_INTERNAL            => 2#0001#,
    FOUR_TIMES_INTERNAL           => 2#0010#,
    EIGHT_TIMES_INTERNAL          => 2#0011#,
    SIX_TIMES_DTS_DIVIDED_BY_2    => 2#0100#,
    EIGHT_TIMES_DTS_DIVIDED_BY_2  => 2#0101#,
    SIX_TIMES_DTS_DIVIDED_BY_4    => 2#0110#,
    EIGHT_TIMES_DTS_DIVIDED_BY_4  => 2#0111#,
    SIX_TIMES_DTS_DIVIDED_BY_8    => 2#1000#,
    EIGHT_TIMES_DTS_DIVIDED_BY_8  => 2#1001#,
    FIVE_TIMES_DTS_DIVIDED_BY_16  => 2#1010#,
    SIX_TIMES_DTS_DIVIDED_BY_16   => 2#1011#,
    EIGHT_TIMES_DTS_DIVIDED_BY_16 => 2#1100#,
    FIVE_TIMES_DTS_DIVIDED_BY_32  => 2#1101#,
    SIX_TIMES_DTS_DIVIDED_BY_32   => 2#1110#,
    EIGHT_TIMES_DTS_DIVIDED_BY_32 => 2#1111#);

   type External_Trigger_Prescaler is
     (OFF, DIVIDED_BY_2, DIVIDED_BY_4, DIVIDED_BY_8) with
        Size => Bits_2'Size;
   for External_Trigger_Prescaler use
   (OFF          => 2#00#,
    DIVIDED_BY_2 => 2#01#,
    DIVIDED_BY_4 => 2#10#,
    DIVIDED_BY_8 => 2#11#);

   type External_Trigger_Polarity is (NON_INVERTED, INVERTED) with
        Size => Bits_1'Size;
   for External_Trigger_Polarity use (NON_INVERTED => 0, INVERTED => 1);

   type Slave_Mode_Control_Register is record
      SMS     : Slave_Mode_Selection;
      TS      : Trigger_Selection;
      MSM     : Slave_Mode;
      ETF     : External_Trigger_Filter;
      ETPS    : External_Trigger_Prescaler;
      ECE     : Boolean;
      ETP     : External_Trigger_Polarity;
   end record with Size => Bits_16'Size;
   for Slave_Mode_Control_Register use
      record
         SMS at 0 range 0 .. 2;
         TS at 0 range 4 .. 6;
         MSM at 0 range 7 .. 7;
         ETF at 0 range 8 .. 11;
         ETPS at 0 range 12 .. 13;
         ECE at 0 range 14 .. 14;
         ETP at 0 range 15 .. 15;
      end record;

   type DMA_Interrupt_Enable_Register is record
      Update_Interrupt    : Boolean;
      CC1IE               : Boolean;
      CC2IE               : Boolean;
      CC3IE               : Boolean;
      CC4IE               : Boolean;
      Trigger_Interrupt   : Boolean;
      Update_DMA          : Boolean;
      CC1DE               : Boolean;
      CC2DE               : Boolean;
      CC3DE               : Boolean;
      CC4DE               : Boolean;
      Trigger_DMA_Request : Boolean;
   end record with Size => Bits_16'Size;
   for DMA_Interrupt_Enable_Register use
      record
         Update_Interrupt at 0 range 0 .. 0;
         CC1IE at 0 range 1 .. 1;
         CC2IE at 0 range 2 .. 2;
         CC3IE at 0 range 3 .. 3;
         CC4IE at 0 range 4 .. 4;
         Trigger_Interrupt at 0 range 6 .. 6;
         Update_DMA at 0 range 8 .. 8;
         CC1DE at 0 range 9 .. 9;
         CC2DE at 0 range 10 .. 10;
         CC3DE at 0 range 11 .. 11;
         CC4DE at 0 range 12 .. 12;
         Trigger_DMA_Request at 0 range 14 .. 14;
      end record;

   type Status_Register is record
      Update_Interrupt_Flag  : Boolean;
      CC1IF                  : Boolean;
      CC2IF                  : Boolean;
      CC3IF                  : Boolean;
      CC4IF                  : Boolean;
      Trigger_Interrupt_Flag : Boolean;
      CC1OF                  : Boolean;
      CC2OF                  : Boolean;
      CC3OF                  : Boolean;
      CC4OF                  : Boolean;
   end record with Size => Bits_16'Size;
   for Status_Register use
      record
         Update_Interrupt_Flag at 0 range 0 .. 0;
         CC1IF at 0 range 1 .. 1;
         CC2IF at 0 range 2 .. 2;
         CC3IF at 0 range 3 .. 3;
         CC4IF at 0 range 4 .. 4;
         Trigger_Interrupt_Flag at 0 range 6 .. 6;
         CC1OF at 0 range 9 .. 9;
         CC2OF at 0 range 10 .. 10;
         CC3OF at 0 range 11 .. 11;
         CC4OF at 0 range 12 .. 12;
      end record;

   type Event_Generation_Register is record
      Update_Generation  : Boolean;
      CC1G               : Boolean;
      CC2G               : Boolean;
      CC3G               : Boolean;
      CC4G               : Boolean;
      Trigger_Generation : Boolean;
   end record with Size => Bits_16'Size;
   for Event_Generation_Register use
      record
         Update_Generation at 0 range 0 .. 0;
         CC1G at 0 range 1 .. 1;
         CC2G at 0 range 2 .. 2;
         CC3G at 0 range 3 .. 3;
         CC4G at 0 range 4 .. 4;
         Trigger_Generation at 0 range 6 .. 6;
      end record;

   --  TODO : Find a better way to name type
   type Capture_Compare_Selection is
     (OUTPUT,
      INPUT_MAPPED_ON_SAME_TI,
      INPUT_MAPPED_ON_OTHER_TI,
      INPUT_MAPPED_ON_TRC) with
        Size => Bits_2'Size;
   for Capture_Compare_Selection use
   (OUTPUT                   => 2#00#,
    INPUT_MAPPED_ON_SAME_TI  => 2#01#,
    INPUT_MAPPED_ON_OTHER_TI => 2#10#,
    INPUT_MAPPED_ON_TRC      => 2#11#);

   type Output_Compare_Mode is
     (FROZEN,
      ACTIVE_ON_MATCH,
      INACTIVE_ON_MATCH,
      TOGGLE,
      FORCE_INACTIVE,
      FORCE_ACTIVE,
      PWM_MODE_1,
      PWM_MODE_2) with
        Size => Bits_3'Size;
   for Output_Compare_Mode use
   (FROZEN            => 2#000#,
    ACTIVE_ON_MATCH   => 2#001#,
    INACTIVE_ON_MATCH => 2#010#,
    TOGGLE            => 2#011#,
    FORCE_INACTIVE    => 2#100#,
    FORCE_ACTIVE      => 2#101#,
    PWM_MODE_1        => 2#110#,
    PWM_MODE_2        => 2#111#);

   type Input_Capture_Filter is new External_Trigger_Filter;

   type Prescaler_Ratio is
     (NO_PRESCALER, EVERY_2_EVENTS, EVERY_4_EVENTS, EVERY_8_EVENTS) with
        Size => Bits_2'Size;
   for Prescaler_Ratio use
   (NO_PRESCALER   => 2#00#,
    EVERY_2_EVENTS => 2#01#,
    EVERY_4_EVENTS => 2#10#,
    EVERY_8_EVENTS => 2#11#);

   type Capture_Compare_Element (Mode : Capture_Compare_Selection
                                 := OUTPUT) is
      record
        case Mode is

         when OUTPUT =>
            OCFE : Boolean;
            OCPE : Boolean;
            OCM  : Output_Compare_Mode;
            OCCE : Boolean;
         when INPUT_MAPPED_ON_SAME_TI |
              INPUT_MAPPED_ON_OTHER_TI |
              INPUT_MAPPED_ON_TRC =>
            ICPSC : Prescaler_Ratio;
            ICF   : Input_Capture_Filter;
        end case;
      end record;
   for Capture_Compare_Element use
      record
         Mode at 0 range 0 .. 1;
         OCFE at 0 range 2 .. 2;
         OCPE at 0 range 3 .. 3;
         ICPSC at 0 range 2 .. 3;
         OCM at 0 range 4 .. 6;
         OCCE at 0 range 7 .. 7;
         ICF at 0 range 4 .. 7;
      end record;

   type Capture_Compare_Mode_Register is
      record
         CC1_Element : Capture_Compare_Element;
         CC2_Element : Capture_Compare_Element;
   end record;

   type Output_Level is (HIGH, LOW) with Size => Bits_1'Size;
   for Output_Level use (HIGH => 0,
                         LOW => 1);

   type Capture_Compare_Enable_Register is
      record
         CC1E : Boolean;
         CC1P : Output_Level;
         CC1NP : Boolean;
         CC2E : Boolean;
         CC2P : Output_Level;
         CC2NP : Boolean;
         CC3E : Boolean;
         CC3P : Output_Level;
         CC3NP : Boolean;
         CC4E : Boolean;
         CC4P : Output_Level;
         CC4NP : Boolean;
      end record with Size => Bits_16'Size;
   for Capture_Compare_Enable_Register use
      record
         CC1E at 0 range 0 .. 0;
         CC1P at 0 range 1 .. 1;
         CC1NP at 0 range 3 .. 3;
         CC2E at 0 range 4 .. 4;
         CC2P at 0 range 5 .. 5;
         CC2NP at 0 range 7 .. 7;
         CC3E at 0 range 8 .. 8;
         CC3P at 0 range 9 .. 9;
         CC3NP at 0 range 11 .. 11;
         CC4E at 0 range 12 .. 12;
         CC4P at 0 range 13 .. 13;
         CC4NP at 0 range 15 .. 15;
      end record;

   type Burst_Length is range 1 .. 18 with Size => Bits_5'Size;

   type DMA_Control_Register is
      record
         Base_Address : Bits_5;
         DMA_Burst_Length : Burst_Length;
      end record with Size => Bits_16'Size;
   for DMA_Control_Register use
      record
         Base_Address at 0 range 0 .. 4;
         DMA_Burst_Length at 0 range 8 .. 12;
      end record;

   type DMA_Address is new Interfaces.Unsigned_16;

   type Trigger_Remap is (PTP, FS, HS) with Size => Bits_2'Size;
   for Trigger_Remap use (PTP => 2#01#,
                          FS => 2#10#,
                          HS => 2#11#);

   type Timer2_Option_Register is
      record
         ITR1_RMP : Trigger_Remap;
      end record with Size => Bits_16'Size;
   for Timer2_Option_Register use
      record
         ITR1_RMP at 0 range 10 .. 11;
      end record;

   type Trigger_Input_Remap is (GPIO, LSI, LSE, RTC) with Size => Bits_2'Size;
   for Trigger_Input_Remap use (GPIO => 2#00#,
                                LSI => 2#01#,
                                LSE => 2#10#,
                                RTC => 2#11#);

   type Timer5_Option_Register is
      record
         TI4_RMP : Trigger_Input_Remap;
      end record with Size => Bits_16'Size;
   for Timer5_Option_Register use
      record
         TI4_RMP at 0 range 6 .. 7;
      end record;

   type Timer_Prescaler is new Interfaces.Unsigned_16;

   type CCR_Index is range 1 .. 4;

   --  Generic package to deal with the fat that TIM2 and TIM5 use 32 bits for
   --  Counter instead of the 16 bits like for TIM3 and TIM4
   generic
      type Counter is mod <>;
      type CCR is private;
      type CCR_Array is array (CCR_Index) of CCR;
   package Timer_Registers is

      type Timer_Register is
         record
            TIM_CR1 : Control_Register_1;
            TIM_CR2 : Control_Register_2;
            TIM_SMCR : Slave_Mode_Control_Register;
            TIM_DIER : DMA_Interrupt_Enable_Register;
            TIM_SR : Status_Register;
            TIM_EGR : Event_Generation_Register;
            TIM_CCMR1 : Capture_Compare_Mode_Register;
            TIM_CCMR2 : Capture_Compare_Mode_Register;
            TIM_CCER : Capture_Compare_Enable_Register;
            TIM_CNT : Counter;
            TIM_PSC : Timer_Prescaler;
            TIM_ARR : Counter;
            TIM_CCRs : CCR_Array;
            TIM_DCR : DMA_Control_Register;
            TIM_DMAR : DMA_Address;
            TIM2_OR : Timer2_Option_Register;
         end record with Size => 21 * Bits_32'Size;
      for Timer_Register use
         record
            TIM_CR1 at 0 range 0 .. 15;
            TIM_CR2 at 1 * Offset_Size range 0 .. 15;
            TIM_SMCR at 2 * Offset_Size range 0 .. 15;
            TIM_DIER at 3 * Offset_Size range 0 .. 15;
            TIM_SR at 4 * Offset_Size range 0 .. 15;
            TIM_EGR at 5 * Offset_Size range 0 .. 15;
            TIM_CCMR1 at 6 * Offset_Size range 0 .. 15;
            TIM_CCMR2 at 7 * Offset_Size range 0 .. 15;
            TIM_CCER at 8 * Offset_Size range 0 .. 15;
            TIM_CNT at 9 * Offset_Size range 0 .. 31;
            TIM_PSC at 10 * Offset_Size range 0 .. 15;
            TIM_ARR at 11 * Offset_Size range 0 .. 31;
            TIM_CCRs at 13 * Offset_Size range 0 .. 127;
            TIM_DCR at 18 * Offset_Size range 0 .. 15;
            TIM_DMAR at 19 * Offset_Size range 0 .. 15;
            TIM2_OR at 20 * Offset_Size range 0 .. 15;
         end record;
   end Timer_Registers;

   --  Preparing types for generic instanciation
   type CCR_16 is
      record
         Value : Interfaces.Unsigned_16;
      end record with Size => 32;
   for CCR_16 use
      record
         Value at 0 range 0 .. 15;
      end record;

   type CCR_Array_16 is array (CCR_Index) of CCR_16 with Size => 4 * 32;

   --  Instanciation for the 16 bits timers
   package Timer_Registers_16 is
     new Timer_Registers (Counter => Interfaces.Unsigned_16,
                          CCR => CCR_16,
                          CCR_Array => CCR_Array_16);

   --  Preparing types for generic instanciation
   type CCR_32 is
      record
         Value : Interfaces.Unsigned_32;
      end record with Size => 32;
   for CCR_32 use
      record
         Value at 0 range 0 .. 31;
      end record;

   type CCR_Array_32 is array (CCR_Index) of CCR_32 with Size => 4 * 32;

   --  Instanciation for the 32 bits timers
   package Timer_Registers_32 is
     new Timer_Registers (Counter => Interfaces.Unsigned_32,
                          CCR => CCR_32,
                         CCR_Array => CCR_Array_32);

   TIM2 : Timer_Registers_32.Timer_Register
     with Volatile, Address => System'To_Address (TIM2_Base);

   pragma Import (Ada, TIM2);

   TIM3 : Timer_Registers_16.Timer_Register
     with Volatile, Address => System'To_Address (TIM3_Base);

   pragma Import (Ada, TIM3);

   TIM4 : Timer_Registers_16.Timer_Register
     with Volatile, Address => System'To_Address (TIM4_Base);

   pragma Import (Ada, TIM4);

   TIM5 : Timer_Registers_32.Timer_Register
     with Volatile, Address => System'To_Address (TIM5_Base);

   pragma Import (Ada, TIM5);

end System.STM32F4.Timers.GeneralPurpose;
