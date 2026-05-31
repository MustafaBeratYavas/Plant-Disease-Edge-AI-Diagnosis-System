<div align="center">
  <img src="docs/assets/app.gif" width="100%" alt="GreenHealer Demo">
  <h1>PLANT DISEASE EDGE AI DIAGNOSIS SYSTEM</h1>
  <p>
    <strong>Project Focus:</strong> Deep learning-based plant disease diagnosis, offline mobile inference, and field-ready agricultural decision support.
  </p>

  <p>
    <a href="https://www.python.org/">
      <img src="https://img.shields.io/badge/Python-3.11--3.13-3776AB?logo=python&logoColor=white" alt="Python 3.11-3.13">
    </a>
    <a href="https://www.tensorflow.org/">
      <img src="https://img.shields.io/badge/TensorFlow-2.x-FF6F00?logo=tensorflow&logoColor=white" alt="TensorFlow">
    </a>
    <a href="https://flutter.dev/">
      <img src="https://img.shields.io/badge/Flutter-Mobile%20App-02569B?logo=flutter&logoColor=white" alt="Flutter mobile app">
    </a>
    <a href="https://github.com/MustafaBeratYavas/plant-disease-edge-ai-diagnosis-system/actions/workflows/ci.yml">
      <img src="https://github.com/MustafaBeratYavas/plant-disease-edge-ai-diagnosis-system/actions/workflows/ci.yml/badge.svg" alt="CI">
    </a>
    <a href="./Dockerfile">
      <img src="https://img.shields.io/badge/Docker-Ready-2496ED?logo=docker&logoColor=white" alt="Docker ready">
    </a>
    <a href="https://docs.astral.sh/ruff/">
      <img src="https://img.shields.io/badge/Ruff-Lint%20%26%20Format-D7FF64?logo=ruff&logoColor=black" alt="Ruff lint and format">
    </a>
    <a href="https://mypy-lang.org/">
      <img src="https://img.shields.io/badge/mypy-Type%20Checked-2A6DB2" alt="mypy type checked">
    </a>
    <a href="./LICENSE">
      <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License">
    </a>
  </p>
</div>

GreenHealer is an offline-first plant disease diagnosis system built with a MobileNetV3Large-based deep learning pipeline and a Flutter mobile application. The model is trained on 38 PlantVillage classes across 14 crop species, exported to TensorFlow Lite, and packaged for on-device inference, enabling rapid diagnostic support in low-connectivity field environments.

Developed as part of the **United Nations Development Programme (UNDP) & Samsung Innovation Campus** program, the project explores practical edge AI for sustainable agriculture. It is designed to support early screening, treatment guidance, and field-level decision-making, not to replace professional plant pathology expertise.

### Sustainability Context

*   **SDG 2 (Zero Hunger):** Supporting earlier crop health intervention before disease damage escalates.
*   **SDG 10 (Reduced Inequalities):** Making AI-assisted diagnosis more accessible to smallholder farmers and remote users.
*   **SDG 12 (Responsible Consumption):** Encouraging more targeted treatment decisions and reducing unnecessary chemical use.
*   **SDG 15 (Life on Land):** Helping preserve plant health through faster, field-ready disease awareness.

<details>
<summary><b>Click to expand project structure details</b></summary>

```text
.
|-- .github
|   |-- dependabot.yml                       # Dependency update automation for Actions, Docker, Python, and Flutter
|   `-- workflows
|       `-- ci.yml                           # GitHub Actions quality gates for Python, Flutter, and Docker smoke checks
|-- configs
|   `-- config.yaml                          # Training, data, model, and artifact path configuration
|-- datasets
|   |-- raw                                  # Raw PlantVillage dataset location (.gitkeep only in fresh clones)
|   `-- split                                # Generated train/validation/test split location (.gitkeep only in fresh clones)
|-- docs
|   `-- assets                               # Documentation and showcase assets (videos, screenshots)
|-- logs                                     # Generated execution logs (ignored except .gitkeep)
|-- mobile
|   |-- android                              # Native Android project shell and platform configuration
|   |-- assets                               # Mobile assets, bundled disease data, labels, and TFLite model
|   |-- ios                                  # Native iOS project shell and platform configuration
|   |-- lib                                  # GreenHealer mobile application source code (Dart/Flutter)
|   |-- test                                 # Flutter widget, model, utility, repository, and error handling tests
|   |-- analysis_options.yaml                # Flutter analyzer and lint configuration
|   |-- l10n.yaml                            # Flutter localization generation configuration
|   |-- pubspec.lock                         # Locked Flutter dependency graph for reproducible builds
|   `-- pubspec.yaml                         # Flutter package metadata, dependencies, and assets
|-- outputs                                  # Generated versioned model artifacts (ignored except .gitkeep)
|-- scripts
|   |-- download_dataset.py                  # Kaggle dataset download and repository directory normalization
|   `-- prepare_data.py                      # Dataset validation, splitting, and manifest generation
|-- src
|   |-- analysis                             # Evaluation logic and visualization utilities
|   |-- cli                                  # Packaged command-line entrypoints
|   |-- core                                 # Configuration validation and path management
|   |-- data                                 # Dataset loading and TensorFlow data pipeline
|   `-- modeling                             # MobileNetV3 architecture and training loop
|-- tests
|   |-- conftest.py                          # Pytest configuration and shared fixtures
|   |-- integration                          # Dataset and bundled mobile model contract tests
|   `-- unit                                 # Fast isolated Python unit tests
|-- .dockerignore                            # Docker build context exclusions for data, caches, artifacts, and mobile files
|-- .editorconfig                            # Cross-editor formatting defaults
|-- .gitattributes                           # Line-ending normalization and binary file rules
|-- .gitignore                               # Git tracking exclusions
|-- .pre-commit-config.yaml                  # Local quality hooks for Python, metadata files, and Flutter checks
|-- Dockerfile                               # Minimal Python ML container image for reproducible quality gates
|-- docker-compose.yml                       # Docker Compose service for Python ML CI and dataset tasks
|-- LICENSE                                  # MIT License
|-- Makefile                                 # Local, CI, Docker, dataset, and mobile command shortcuts
|-- pyproject.toml                           # Python package metadata, dependencies, and tool configs
|-- README.md                                # Project main documentation
|-- requirements.lock                        # Pinned Python dependency constraints for reproducible installs
|-- setup.bat                                # Windows setup bootstrap
`-- setup.sh                                 # Linux/macOS setup bootstrap
```

</details>

<details>
<summary><b>Click to expand technology stack details</b></summary>

| Component | Technology | Purpose |
|:---|:---|:---|
| Python Runtime | Python 3.11+ | Supported runtime for the ML pipeline, tests, packaging, and Docker image |
| Core ML Framework | TensorFlow / Keras | Model training, evaluation, inference, and TensorFlow Lite export pipeline |
| Backbone | MobileNetV3Large | ImageNet-pretrained feature extraction for plant disease classification |
| Data Pipeline | tf.data / Keras utilities | Deterministic Train/Val/Test loading and MobileNetV3 preprocessing |
| Quantization | TensorFlow Lite PTQ | Representative-dataset calibration with int8 internals and a float32 mobile I/O contract |
| Mobile Runtime | tflite_flutter / TensorFlow Lite | On-device inference without a network dependency |
| Mobile App | Flutter 3.35.0 / Dart 3.9+ | Cross-platform diagnosis workflow, result presentation, localization, and local history |
| Packaging | pyproject.toml / requirements.lock | Python package metadata plus pinned dependency constraints for reproducible installs |
| Containerization | Docker / Docker Compose | Reproducible Python ML environment for quality gates, dataset tasks, and artifact workflows |
| Testing | Pytest / Flutter Test | Python pipeline coverage and mobile-side regression tests |
| Quality & CI | Ruff, MyPy, pre-commit, GitHub Actions | Static checks, formatting, package build validation, and Docker smoke checks |

</details>

<details>
<summary><b>Click to expand technical pipeline details</b></summary>

### Model Pipeline

The model architecture is designed to keep feature extraction efficient while adding a compact classifier head for PlantVillage-specific disease categories.

| Component | Configuration | Purpose |
|:---|:---|:---|
| Input | 224 x 224 x 3 RGB images | Standardized leaf image shape for training, export, and mobile inference |
| Backbone | MobileNetV3Large, ImageNet weights, include_top=False | Efficient feature extraction for mobile-oriented classification |
| Preprocessing | MobileNetV3 preprocessing embedded in the model graph | Keeps Python, TFLite, and Flutter inference aligned on raw RGB float32 inputs |
| Pooling | GlobalAveragePooling2D | Converts spatial feature maps into compact class features |
| Regularization | Dropout(0.2) | Reduces overfitting in the custom classifier head |
| Output Head | Dense(38, activation="softmax") | Predicts one of the 38 PlantVillage classes |

### Training Strategy

Training is split into a warm-up phase for the classifier head and a fine-tuning phase for selected pretrained visual features.

| Stage | Trainable Scope | Learning Rate | Epochs | Goal |
|:---|:---|:---|:---|:---|
| Head Warm-up | Custom classifier head | 1e-3 | 15 | Learn class-specific decision boundaries while the backbone is frozen |
| Fine-tuning | Last 30% of backbone layers except BatchNorm | 1e-4 | 30 | Refine high-level visual features without destabilizing pretrained normalization statistics |

### Data Strategy

The data pipeline keeps training, evaluation, export, and mobile inference aligned around the same image preprocessing and label-index contract.

| Area | Approach |
|:---|:---|
| Dataset Layout | Raw images are split into deterministic train, validation, and test directories |
| Split Policy | 80/10/10 split with seed 42, as defined in `configs/config.yaml` |
| Preprocessing | Raw RGB pixels (0..255) are passed through the pipeline; MobileNetV3 preprocessing lives inside the model graph |
| Augmentation | Random flip, rotation, zoom, and contrast improve robustness to field-like variation |
| Class Balance | Inverse-frequency class weights reduce bias toward overrepresented classes |
| Label Contract | labels.csv and labels.txt preserve class-index consistency across training, evaluation, export, and mobile inference |

### Mobile Optimization

The export flow produces the artifacts required by the Flutter app to run predictions locally and map model outputs back to readable class names.

| Artifact | Format | Consumer | Purpose |
|:---|:---|:---|:---|
| best_model.keras | Keras model | Python evaluation/export | Full model artifact used for reports and conversion |
| best_model.tflite | TensorFlow Lite FP32 | Python export audit | Baseline converted artifact used for size and conversion comparison |
| best_model_quantized.tflite | TensorFlow Lite PTQ | Flutter mobile app | Lightweight on-device inference artifact with int8 internals and float32 public I/O |
| labels.txt | Plain text labels | Flutter mobile app | Maps model output indices back to user-facing class names |

</details>

## Table of Contents
- [Interface & Showcases](#interface--showcases)
- [Dependencies](#dependencies)
- [Quickstart](#quickstart)
- [Docker Setup and Execution](#docker-setup-and-execution)
- [Results & Metrics](#results--metrics)
- [Limitations & Disclaimers](#limitations--disclaimers)
- [References](#references)
- [License](#license)

## Interface & Showcases

GreenHealer turns plant disease screening into a practical mobile workflow. Users can capture or select a leaf image, run the TensorFlow Lite model directly on the device, and review the result without depending on a cloud connection.

---

<table width="100%">
  <tr align="center" valign="top">
    <td width="33%">
      <b>Interactive Onboarding</b><br><br>
      <img src="docs/assets/app-faq-screen.png" width="100%" alt="How it Works FAQ">
    </td>
    <td width="33%">
      <b>On-Device Analysis</b><br><br>
      <img src="docs/assets/app-showcase-home-analyzing.png" width="100%" alt="Scanning Plant">
    </td>
    <td width="33%">
      <b>Diagnosis Results</b><br><br>
      <img src="docs/assets/app-showcase-diagnosis-result.png" width="100%" alt="Diagnosis Result">
    </td>
  </tr>
</table>

The diagnosis flow keeps the technical complexity behind the scenes. The app guides users from image selection to local analysis and presents a clear prediction with a confidence score.

---

<table width="100%">
  <tr align="center" valign="top">
    <td width="33%">
      <b>Symptom Analysis</b><br><br>
      <img src="docs/assets/app-showcase-library-symptoms.png" width="100%" alt="Disease Symptoms">
    </td>
    <td width="33%">
      <b>Precision Treatment</b><br><br>
      <img src="docs/assets/app-showcase-library-treatment.png" width="100%" alt="Treatment Details">
    </td>
    <td width="33%">
      <b>Prevention Protocols</b><br><br>
      <img src="docs/assets/app-showcase-library-prevention.png" width="100%" alt="Prevention Tips">
    </td>
  </tr>
</table>

Alongside prediction, the mobile experience connects users with disease information, symptom notes, treatment guidance, and prevention tips. This makes the result more actionable than a class label alone and helps users move from recognition toward informed crop-care decisions.

## Dependencies

To ensure reproducibility and isolate dependencies, it is recommended to use a virtual environment.

### Step 1 - Create Virtual Environment:

```bash
python -m venv .venv
```

### Step 2 - Activate Virtual Environment:

```bash
# Linux/macOS
source .venv/bin/activate

# Windows
.venv\Scripts\activate
```

### Step 3 - Upgrade pip:

```bash
python -m pip install --upgrade pip
```

### Step 4 - Install Project Dependencies:

Install only the runtime dependencies using the locked dependency constraints:

```bash
python -m pip install --constraint requirements.lock .
```

Install the development extras using the same locked dependency constraints:

```bash
python -m pip install --constraint requirements.lock ".[dev]"
```

*Runtime dependencies: `tensorflow`, `keras`, `opencv-python-headless`, `pandas`, `numpy`, `scikit-learn`, `matplotlib`, `seaborn`, `PyYAML`, `tqdm`, `Pillow`, `kagglehub`.*

*Development dependencies: `pytest`, `pytest-cov`, `ruff`, `mypy`, `pre-commit`.*

## Quickstart

### Prerequisites

* **Python:** Python 3.11+ available on your `PATH`.
* **Dataset access:** Kaggle access may be required for the configured PlantVillage dataset package.
* **Hardware:** NVIDIA GPU is recommended for training; CPU is sufficient for dataset preparation, evaluation, export, and single-image inference.

### 1. Environment Setup and Dataset Download

Run the setup script for your operating system. It creates the Python virtual environment, installs the required Python tooling, downloads or validates the PlantVillage dataset from Kaggle through `kagglehub`, and normalizes it into the expected `datasets/raw` and `datasets/split` directories.

```bash
chmod +x setup.sh
./setup.sh
```

```bat
setup.bat
```

### 2. Optional Split Regeneration

The Kaggle package may already include a prepared train/validation/test split. If you want to rebuild the split from `datasets/raw` using the ratios in `configs/config.yaml`, run:

Regenerating the split can change the exact per-split sample counts, so benchmark numbers should be compared against the same split definition used for evaluation.

```bash
python scripts/prepare_data.py
```

### 3. Training the Model

Initiate the two-stage training process: classifier-head warm-up followed by fine-tuning. On a fresh clone, artifacts such as checkpoints, labels, tables, and figures are saved to `outputs/model_v1/`; later training runs automatically use the next available versioned directory.

```bash
python -m src.cli.train
```

### 4. Evaluation

Evaluate the best-performing model on the held-out test set to generate the confusion matrix and classification report.

```bash
python -m src.cli.evaluate --model outputs/model_v1/checkpoints/best_model.keras
```

### 5. TFLite Conversion

Convert the trained Keras model into TensorFlow Lite artifacts for deployment. The export flow writes a baseline FP32 model and an internally int8-optimized model while keeping a float32 public input contract (`0..255` RGB), matching the Python and Flutter inference paths. The script also copies the quantized model to `mobile/assets/models/` and writes labels to `mobile/assets/labels.txt`.

```bash
python -m src.cli.export --model outputs/model_v1/checkpoints/best_model.keras
```

### 6. Running Inference

Run inference on a single image using the quantized TensorFlow Lite model generated in the previous step.

> **Note:** Replace the image path with any valid sample from your test set.

```bash
python -m src.cli.inference \
  --image "datasets/split/test/Tomato___Early_blight/00c5c908-fc25-4710-a109-db143da23112___RS_Erly.B 7778.JPG" \
  --model outputs/model_v1/checkpoints/best_model_quantized.tflite
```

## Docker Setup and Execution

Docker is the recommended runtime when you want a reproducible Python ML environment without installing TensorFlow, Keras, OpenCV, and quality tooling directly on the host machine. The container is intentionally scoped to the Python ML pipeline: quality gates, dataset preparation, training/evaluation/export commands, and model artifact workflows. The Flutter mobile app is validated outside the Docker image.

### 1. Build the Image

Build the Python ML image defined by `Dockerfile` and make it available to the Compose service.

```bash
docker compose build
```

### 2. Prepare the Dataset

Download or validate the configured PlantVillage dataset inside the container, then normalize it into `datasets/raw` and `datasets/split`.

```bash
docker compose run --rm ml make dataset
```

### 3. Optional Split Regeneration

Rebuild `datasets/split` from the current `datasets/raw` contents using the split ratios and seed defined in `configs/config.yaml`.

```bash
docker compose run --rm ml make prepare-data
```

### 4. Train the Model

Run the two-stage training workflow inside the container and write versioned artifacts under `outputs/`.

```bash
docker compose run --rm ml make train
```

### 5. Evaluate the Model

Evaluate the default trained model configured in `configs/config.yaml` against the prepared test split.

```bash
docker compose run --rm ml make evaluate
```

### 6. Export TensorFlow Lite Artifacts

Export the default trained model to TensorFlow Lite artifacts, then publish the quantized model and labels into the Flutter asset layout.

```bash
docker compose run --rm ml make export
```

### 7. Optional Quality Gates

Run the same Python formatting, linting, type-checking, package-build, and test coverage gates used by CI.

```bash
docker compose run --rm ml
```

## Results & Metrics

The system was benchmarked on the held-out test set (5,459 images) using a standard CPU environment to simulate edge capability.

| Metric | Score | Significance |
| :--- | :--- | :--- |
| Accuracy | 99.21% | High classification accuracy on the PlantVillage test set (5,416/5,459 correct). |
| Weighted Precision | 0.9924 | High reliability; minimizes false positives across classes. |
| Macro F1 | 0.9910 | Demonstrates balanced learning across all 38 classes. |
| Avg. Latency | 5.58 ms | Real-time performance suitable for live camera feeds (~179 FPS). |
| Model Size | 3.0 MB | Lightweight internally quantized TFLite artifact, enabling OTA updates. |
| Model Parameters | 3,032,870 | Highly efficient MobileNetV3Large backbone. |

## Limitations & Disclaimers

> **Important:** This section is critical for understanding the real-world applicability of the reported metrics.

### Dataset Scope and Domain Considerations

- **Controlled image conditions:** PlantVillage images are largely captured in curated environments, while field images may include soil, neighboring plants, tools, hands, or other visual distractions.
- **Environmental variability:** Real-world lighting, shadows, blur, camera quality, and weather conditions can differ substantially from the training distribution.
- **Leaf presentation variability:** Leaf angle, partial occlusion, distance from the camera, and image framing can affect model confidence and prediction quality.
- **Disease stage coverage:** Very early, late-stage, or atypical symptoms may not visually match the dataset examples used during training.
- **Multi-condition samples:** The model assumes one dominant class per image and is not designed to diagnose multiple simultaneous diseases on the same leaf.

### Statistical Limitations

- Results are based on a **single train/validation/test split** (no k-fold cross-validation)
- The dataset does not cover all known plant diseases or all crop species globally
- Performance on crop varieties not represented in the dataset is unknown

### Intended Use

- The system is intended as a **decision-support and early-screening tool** for farmers, students, researchers, and agronomy-focused users who need fast offline guidance from leaf images.
- Predictions should be treated as preliminary assessments. For production-critical decisions, chemical treatment planning, or uncertain cases, users should consult qualified agronomists or plant pathology professionals.
- The model is optimized for the 14 crop species and 38 PlantVillage classes represented in the training data; images outside this scope may produce unreliable or overconfident predictions.

## References

The PlantVillage dataset and image-based plant disease classification context are based on the following study:

```bibtex
@article{mohanty2016using,
  title={Using Deep Learning for Image-Based Plant Disease Detection},
  author={Mohanty, Sharada P. and Hughes, David P. and Salath{\'e}, Marcel},
  journal={Frontiers in Plant Science},
  volume={7},
  pages={1419},
  year={2016},
  publisher={Frontiers Media SA},
  doi={10.3389/fpls.2016.01419}
}
```

The MobileNetV3 architecture used in this project is based on the following research:

```bibtex
@inproceedings{howard2019searching,
  title={Searching for MobileNetV3},
  author={Howard, Andrew and Sandler, Mark and Chu, Grace and Chen, Liang-Chieh and Chen, Bo and Tan, Mingxing and Wang, Weijun and Zhu, Yukun and Pang, Ruoming and Vasudevan, Vijay and others},
  booktitle={Proceedings of the IEEE/CVF International Conference on Computer Vision},
  pages={1314--1324},
  year={2019}
}
```

## License

This project is licensed under the **MIT License** - see the [LICENSE](./LICENSE) file for full terms.

Copyright (c) 2026 **Mustafa Berat Yavas**
