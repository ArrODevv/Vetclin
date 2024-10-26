use eframe::{egui, CreationContext};

pub struct VetclinApp {}

impl Default for VetclinApp {
    fn default() -> Self {
        Self {}
    }
}

impl VetclinApp {
    pub fn new(_cc: &CreationContext) -> Self {
        Self {}
    }
}

impl eframe::App for VetclinApp {
    fn update(&mut self, ctx: &eframe::egui::Context, frame: &mut eframe::Frame) {
        egui::TopBottomPanel::top("top_panel_menu").show(ctx, |ui| {
            let is_web = cfg!(target_arch = "wasm32");
            if !is_web {
                ui.menu_button("File", |ui| {
                    if ui.button("Quit").clicked() {
                        ctx.send_viewport_cmd(egui::ViewportCommand::Close);
                    }
                });

                ui.add_space(16.0);
            }

            egui::widgets::global_theme_preference_buttons(ui);
        });

        egui::CentralPanel::default().show(ctx, |ui| {
            ui.heading("Idk test or some stuff");

            egui::warn_if_debug_build(ui);
        });
    }
}
