# Full-stack Flutter & DRF Advanced Topics

This repository contains organized Flutter advanced-topic examples and architecture/testing patterns.
The folder structure is designed so a recruiter or reviewer can quickly understand where each topic is located.

## Repository structure

- `RenderObject.dart`
  - Single file focused on Flutter render object concepts.

- `advanced_concepts/`
  - `01_widget_element_render_tree.dart` — Widget, Element, RenderObject lifecycle and tree.
  - `02_build_owner_and_pipeline_owner.dart` — BuildOwner, PipelineOwner, and frame pipeline internals.
  - `03_custom_render_object_widget.dart` — Custom RenderObjectWidget implementation details.
  - `04_render_shifted_box_layout.dart` — RenderShiftedBox layout behavior.
  - `05_gesture_arena_hit_testing.dart` — Gesture arena and hit testing flow.
  - `06_dart_generational_gc_optimization.dart` — Dart GC generational optimization techniques.
  - `07_weak_reference_and_finalizer.dart` — WeakReference and Finalizer usage in Dart.
  - `08_isolate_spawn_and_run.dart` — Isolate spawning and execution patterns.
  - `09_transferable_typed_data_isolates.dart` — TransferableTypedData across isolates.
  - `10_memory_leak_detection_patterns.dart` — Memory leak detection and prevention patterns.

- `advance_concept_flutter/`
  - `10_feature_flag_dynamic_rollout.dart` — Feature flags and dynamic rollout.
  - `11_animation_controller_ticker.dart` — AnimationController, Ticker and frame scheduling.
  - `12_custom_painter_animator.dart` — CustomPainter animation techniques.
  - `13_custom_clipper_path.dart` — CustomClipper and path clipping.
  - `14_shader_masking_agsl.dart` — ShaderMask, AGSL and advanced shading.
  - `15_rive_lottie_optimization.dart` — Rive/Lottie performance optimization.
  - `16_impeller_vs_skia_mechanics.dart` — Impeller vs Skia rendering mechanics.
  - `17_platform_channels_native.dart` — Platform channels and native integration.
  - `18_dart_ffi_c_integration.dart` — Dart FFI integration with C.
  - `19_pigeon_typesafe_channel.dart` — Pigeon type-safe platform channel generation.
  - `20_declarative_navigation_router_v2.dart` — Declarative navigation with Router API v2.
  - `21_gorouter_auth_guards.dart` — GoRouter authentication guard patterns.
  - `22_shell_route_nested_nav.dart` — ShellRoute and nested navigation.
  - `23_gorouter_transitions_params.dart` — GoRouter transitions and parameter handling.

- `advanced_riverpod_learning/`
  - `01_notifier_vs_statenotifier.dart` — Notifier vs StateNotifier comparison.
  - `02_ref_extensions_and_lifecycle.dart` — Ref extensions and provider lifecycle.
  - `03_provider_scope_overrides.dart` — ProviderScope overrides and dependency injection.
  - `04_family_modifier_custom_keys.dart` — Family modifier and custom provider keys.
  - `05_riverpod_unit_and_widget_testing.dart` — Riverpod unit and widget testing.
  - `06_feature_first_architecture.dart` — Feature-first architecture with Riverpod.
  - `07_repository_data_source_abstraction.dart` — Repository and data source abstraction.
  - `08_offline_caching_riverpod.dart` — Offline caching patterns with Riverpod.
  - `09_side_effect_mutation_patterns.dart` — Side effect and mutation management.

- `flutter_advanced_topics/`
  - `10_error_and_loading_normalization.dart` — Error/loading state normalization.
  - `11_performance_overlay_and_devtools.dart` — Performance overlay and DevTools debugging.
  - `12_repaint_boundary_and_layer_tree.dart` — RepaintBoundary and layer tree optimization.
  - `13_const_constructors_and_keys.dart` — Const constructors and widget keys.
  - `14_image_and_svg_optimization.dart` — Image and SVG optimization techniques.
  - `15_deferred_loading_code_splitting.dart` — Deferred loading and code splitting.
  - `16_mocking_api_calls.dart` — Mocking API calls for tests.
  - `17_testing_asyncvalue_riverpod.dart` — AsyncValue testing in Riverpod.
  - `18_test_coverage_ci.dart` — Test coverage and CI setup.
  - `19_test_doubles_strategies.dart` — Test doubles and stubbing strategies.
  - `20_platform_channel_testing.dart` — Testing platform channel flows.

- `testing_and_architecture/`
  - `21_widget_tester_pump_and_clock.dart` — WidgetTester pump and fake clock control.
  - `22_golden_toolkit_visual_testing.dart` — Golden testing with Golden Toolkit.
  - `23_accessibility_and_screensize_testing.dart` — Accessibility and screen-size testing.
  - `24_gesture_simulations_testing.dart` — Gesture simulation tests.
  - `25_custom_painter_testing.dart` — Testing CustomPainter output.
  - `26_integration_test_setup.dart` — Integration test setup patterns.
  - `27_firebase_test_lab_runner.dart` — Firebase Test Lab runner integration.
  - `28_page_object_pattern.dart` — Page object pattern for Flutter tests.
  - `29_integration_performance_profiling.dart` — Integration performance profiling.
  - `30_cicd_test_automation.dart` — CI/CD test automation.
  - `31_app_size_reduction_strategies.dart` — App size reduction strategies.
  - `32_dart_obfuscation.dart` — Dart obfuscation techniques.
  - `33_symbolicating_crash_stack_traces.dart` — Crash stack trace symbolication.
  - `34_app_size_analysis.dart` — App size analysis.
  - `35_unused_asset_pruning.dart` — Unused asset pruning.
  - `36_monorepo_melos_architecture.dart` — Monorepo and Melos architecture.
  - `37_micro_frontend_modular_design.dart` — Micro-frontend and modular design.
  - `38_service_locator_di_boundaries.dart` — Service locator and DI boundaries.
  - `39_event_bus_vs_scoped_streams.dart` — EventBus vs scoped streams patterns.

## How to use this repository

- Start by reading the folder titles for the domain you need.
- Open the numbered Dart file to see the topic and implementation details.
- The file name describes the exact advanced concept or architecture/testing pattern covered.

> This README is intended to help recruiters and reviewers quickly understand which folder contains which advanced Flutter topic.
