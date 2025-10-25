use lazy_static::lazy_static;
use regex::Regex;
use std::ffi::CString;
use std::os::raw::c_char;
use std::process::Command;

// Define our unit pairs
lazy_static! {
    static ref UNIT_PAIRS: Vec<(&'static str, &'static str)> = vec![
        ("C", "F"),
        ("°C", "°F"),
        ("cm", "inch"),
        ("m", "ft"),
        ("meters", "feet"),
        ("km", "mi"),
        ("kph", "mph"),
        ("km/h", "mph"),
        ("kilometers", "miles"),
        ("kg", "lb"),
        ("kilograms", "pounds"),
        ("g", "oz"),
        ("grams", "ounces"),
        ("L", "gal"),
        ("liters", "gallons"),
        ("ml", "floz"),
        ("milliliters", "fluid ounces"),
        ("m/s", "ft/s"),
        ("N", "lbf"),
        ("newtons", "pounds force"),
        ("Pa", "psi"),
        ("pascals", "pounds per square inch"),
    ];

    // Build our regexp dynamically from the unit pairs
    static ref CONVERSION_REGEX: Regex = {
        let mut units = Vec::new();
        for (unit1, unit2) in UNIT_PAIRS.iter() {
            units.push(*unit1);
            units.push(*unit2);
        }

        // Join all units with | and build the full pattern
        let pattern = format!(r"([\d.]+)\s*({})\s*$", units.join("|"));
        Regex::new(&pattern).unwrap()
    };
}

#[unsafe(no_mangle)]
pub fn get_timestamp() -> *mut c_char {
    use chrono::prelude::*;
    let local: DateTime<Local> = Local::now();
    let formatted = local.format("%Y-%m-%d %H:%M:%S (%z)").to_string();

    let c_str = CString::new(formatted).unwrap();

    // Give away the string's treasure map and tell Rust to forget about it
    c_str.into_raw()
}

#[unsafe(no_mangle)]
pub extern "C" fn free_timestamp(ptr: *mut c_char) {
    if ptr.is_null() {
        return;
    }
    unsafe {
        // Now we take back the treasure map and let Rust clean it up properly!
        let _ = CString::from_raw(ptr);
    }
}

#[unsafe(no_mangle)]
pub fn get_unit_conversion(input: *mut c_char) -> *mut c_char {
    if input.is_null() {
        return std::ptr::null_mut();
    }

    // Safely read the input string without taking ownership
    let c_str = unsafe { std::ffi::CStr::from_ptr(input) };

    // Safely convert to Rust string, with error handling
    let rust_str = match c_str.to_str() {
        Ok(s) => s,
        Err(_) => return std::ptr::null_mut(),
    };

    // Try to match our pattern
    let result = match CONVERSION_REGEX.captures(rust_str) {
        Some(caps) => {
            let number = &caps[1];
            let unit = &caps[2];

            let target_unit = UNIT_PAIRS
                .iter()
                .find_map(|(unit1, unit2)| {
                    if unit == *unit1 {
                        Some(*unit2)
                    } else if unit == *unit2 {
                        Some(*unit1)
                    } else {
                        None
                    }
                })
                .unwrap_or("unknown");

            // Call fend with our conversion expression, WITH ERROR HANDLING
            let fend_expr = format!("{} {} to {}", number, unit, target_unit);
            let conversion_result = match Command::new("fend").arg(&fend_expr).output() {
                Ok(output) => String::from_utf8_lossy(&output.stdout).trim().to_string(),
                Err(e) => format!("Error running command: {}", e),
            };

            // Format our final result
            format!(" ({})", conversion_result)
        }
        None => String::from(""),
    };

    // Create new C string to return
    match CString::new(result) {
        Ok(c_str) => c_str.into_raw(),
        Err(_) => std::ptr::null_mut(),
    }
}

#[unsafe(no_mangle)]
pub fn free_unit_conversion(ptr: *mut c_char) {
    if ptr.is_null() {
        return;
    }
    unsafe {
        // Now we take back the treasure map and let Rust clean it up properly!
        let _ = CString::from_raw(ptr);
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use regex::Regex;

    // Only test the format of the timestamp, not the actual value
    // Those tests are better suited for whoever maintains chrono
    #[test]
    fn it_works() {
        let timestamp_ptr = get_timestamp();
        assert!(!timestamp_ptr.is_null());

        // Convert back to Rust string for testing
        let c_str = unsafe { CString::from_raw(timestamp_ptr) };
        let rust_str = c_str.to_str().unwrap();

        // Create a regex pattern that matches our timestamp format
        let re = Regex::new(r"^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2} \([\+\- 0]\d{4}\)$").unwrap();
        assert!(
            re.is_match(rust_str),
            "Timestamp format does not match expected pattern"
        );

        // Free the memory allocated for the timestamp
        free_timestamp(c_str.into_raw());
    }
}
