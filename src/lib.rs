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

/*
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let result = add(2, 2);
        assert_eq!(result, 4);
    }
}
*/
