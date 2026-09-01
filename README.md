# Objective-C Method Cache Observation Demo

A runnable macOS benchmark that compares one observed Objective-C message dispatch with one million repeated dispatches while verifying the business result.

```bash
git clone https://github.com/2252408699/objc-method-cache-observation-demo.git
cd objc-method-cache-observation-demo
make run
```

Expected: `Checksum verification: PASS`.

The timing is observational. It is not a cache-hit counter and cannot isolate class initialization, scheduler noise, timer resolution, CPU state, or other Runtime work. Run multiple times and profile a real workload before drawing performance conclusions.
