# Egui Learning Note

Notes for learning [egui](https://github.com/emilk/egui)

## Overview

<!--@START_MENU_TOKEN@-->Text<!--@END_MENU_TOKEN@-->

## Topics

### <!--@START_MENU_TOKEN@-->Group<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->``Symbol``<!--@END_MENU_TOKEN@-->

```swift

struct GlowWinitRunning {
    integration: EpiIntegration,
    app: Box<dyn App>,

    // These needs to be shared with the immediate viewport renderer, hence the Rc/Arc/RefCells:
    glutin: Rc<RefCell<GlutinWindowContext>>,

    // NOTE: one painter shared by all viewports.
    painter: Rc<RefCell<egui_glow::Painter>>,
}


<!--glow_integration-->
egui.glow_integration

GlowWinitApp

GlowWinitRunning
run_ui_and_paint
        full_output = integration.update(app, viewport, raw_input)
        let clipped_primitives = integration.egui_ctx.tessellate(shapes, pixels_per_point);

        painter(: egui_glow::Painter).paint_and_update_textures(
            screen_size_in_pixels,
            pixels_per_point,
            &clipped_primitives,
            &textures_delta,
        );

let full_output = self.egui_ctx.run(raw_input, |egui_ctx| {
    if let Some(viewport_ui_cb) = viewport_ui_cb {
        // Child viewport
        crate::profile_scope!("viewport_callback");
        viewport_ui_cb(egui_ctx);
    } else {
        crate::profile_scope!("App::update");
        app.update(egui_ctx, &mut self.frame);
    }
});

egui_ctx: end_frame


```
