# melos.yaml Configuration File Structure Example
name: enterprise_monorepo
packages:
  - packages/**
  - apps/**

scripts:
  analyze:
    run: melos exec -- "flutter analyze"
    description: Run analysis across all packages in monorepo simultaneously.