use std::ffi::CString;
use std::os::raw::c_char;

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
    if ptr.is_null() { return }
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
        assert!(re.is_match(rust_str), "Timestamp format does not match expected pattern");

        // Free the memory allocated for the timestamp
        free_timestamp(c_str.into_raw());
    }
}
