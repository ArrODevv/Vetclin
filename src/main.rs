#[cfg_attr(not(debug_assertions), windows_subsytem = "windows")]

#[cfg(not(target_arch = "wasm32"))]
fn main() {
    
}

#[cfg(target_arch = "wasm32")]
fn main() {
    println!("Web is not yet supported!");
}
