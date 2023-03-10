# packages install
.PHONY: dependencies
dependencies:
	fvm flutter pub get

# packages upgrade
.PHONY: upgrade
upgrade:
	fvm flutter packages upgrade

# packages clean
.PHONY: clean
clean:
	fvm flutter clean

.PHONY: run
run:
	fvm flutter run

.PHONY: run-dev
run-dev:
	fvm flutter run --debug

# code generate
.PHONY: build_runner
build_runner:
	fvm flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: analyze
analyze:
	fvm flutter analyze

.PHONY: format
format:
	fvm flutter format .

.PHONY: pod-install
pod-install:
	@cd ios && \
	arch -x86_64 pod install --repo-update

# firebaseの構成ファイルを最新の状態にする
.PHONY: firebase
firebase:
	flutterfire configure