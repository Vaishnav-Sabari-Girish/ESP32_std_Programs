# LED Blink

## Outputs 

### Serial Monitors 

![mon](./led_blink.gif)

### Hardware

![hw](./led_hardware.gif)

## Code

```rust
use esp_idf_svc::hal::gpio::PinDriver;
use esp_idf_svc::hal::peripherals::Peripherals;
use esp_idf_svc::hal::delay;

fn main() {
    esp_idf_svc::sys::link_patches();

    esp_idf_svc::log::EspLogger::initialize_default();

    let peripherals = Peripherals::take().unwrap();

    let mut led = PinDriver::output(peripherals.pins.gpio2).unwrap();

    let delay = delay::Delay::new_default();
    loop {
        led.set_high().unwrap();
        log::info!("LED ON");

        delay.delay_ms(1000);

        led.set_low().unwrap();
        log::info!("LED OFF");

        delay.delay_ms(1000);
    }
}
```
