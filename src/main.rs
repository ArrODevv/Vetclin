#[cfg_attr(not(debug_assertions), windows_subsytem = "windows")]

use vetclin::VetclinApp;

#[cfg(not(target_arch = "wasm32"))]
fn main() -> eframe::Result {
    let native_opts = eframe::NativeOptions {
        viewport: eframe::egui::ViewportBuilder::default()
            .with_inner_size([400.0, 300.0])
            .with_min_inner_size([300.0, 220.0]),
        ..Default::default()
    };
    eframe::run_native(
        &format!("Vetclin {}", env!("CARGO_PKG_VERSION")),
        native_opts,
        Box::new(|cc| Ok(Box::new(VetclinApp::new(cc))))
    )
}

#[cfg(target_arch = "wasm32")]
fn main() {
    println!("Web is not yet supported!");
}
