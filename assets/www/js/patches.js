(function patchThrowPropsPerformance() {
  const waitForGSDefine = () => {
    if (!window._gsDefine || !window._gsDefine.globals) {
      return setTimeout(waitForGSDefine, 50);
    }

    const globals = window._gsDefine.globals;
    const plugin = globals?.ThrowPropsPlugin;
    const tracker = globals?.VelocityTracker;
    const ease = globals?.Ease;

    if (!plugin) return setTimeout(waitForGSDefine, 50);

    console.log("✅ Found ThrowPropsPlugin. Applying performance patches...");

    if (ease?.map && ease?.linear) {
      Object.keys(ease.map).forEach((key) => {
        ease.map[key] = ease.linear;
      });
      console.log("⚡ Replaced easing functions with linear.");
    }

    const origCalculateChange = plugin.prototype._calculateChange;
    const VELOCITY_THRESHOLD = 0.2;

    plugin.prototype._calculateChange = function (
      start,
      velocity,
      max,
      min,
      resistance
    ) {
      if (Math.abs(velocity) < VELOCITY_THRESHOLD) {
        return 0;
      }
      return origCalculateChange.call(
        this,
        start,
        velocity,
        max,
        min,
        resistance
      );
    };

    const origUpdate = plugin.prototype._update;
    let frameCounter = 0;
    const SKIP_EVERY_N_FRAMES = 2;

    plugin.prototype._update = function (ratio) {
      frameCounter++;
      if (frameCounter % SKIP_EVERY_N_FRAMES !== 0) return;
      return origUpdate.call(this, ratio);
    };

    if (tracker?.prototype?.update) {
      const origTrackerUpdate = tracker.prototype.update;
      let lastUpdateTime = 0;
      const MIN_UPDATE_INTERVAL_MS = 30;

      tracker.prototype.update = function () {
        const now = Date.now();
        if (now - lastUpdateTime < MIN_UPDATE_INTERVAL_MS) return;
        lastUpdateTime = now;
        return origTrackerUpdate.call(this);
      };
      console.log("🧠 VelocityTracker.update throttled to 30ms");
    }

    if (tracker?.track) {
      const origTrack = tracker.track;
      tracker.track = function (target, props) {
        const filtered = props.filter((p) => p === "x" || p === "y");
        return origTrack.call(this, target, filtered);
      };
      console.log("🎯 VelocityTracker.track limited to x/y");
    }

    console.log(
      "✅ Applied Patches to ThrowPropsPlugin to resolve performance issues."
    );

  };

  waitForGSDefine();
})();

(function monitorCanvasPerformance(threshold = 2) {
  const ctxProto = CanvasRenderingContext2D.prototype;

  const wrapMethod = (name) => {
    const orig = ctxProto[name];
    if (typeof orig !== "function") return;

    ctxProto[name] = function (...args) {
      const start = performance.now();
      const result = orig.apply(this, args);
      const duration = performance.now() - start;
      if (duration > threshold) {
        console.warn(`🎨 canvas.${name} took ${duration.toFixed(2)}ms`, { args });
      }
      return result;
    };
  };

  const methodsToWrap = [
    "fillRect",
    "strokeRect",
    "clearRect",
    "fillText",
    "strokeText",
    "drawImage",
    "putImageData",
    "getImageData",
    "fill",
    "stroke",
    "beginPath",
    "arc",
    "moveTo",
    "lineTo",
    "bezierCurveTo",
    "quadraticCurveTo",
  ];

  methodsToWrap.forEach(wrapMethod);
  console.log("🛠️ CanvasRenderingContext2D methods wrapped for performance monitoring.");
})();

(function monitorFrameRenderTime(threshold = 16) {
  const origRAF = window.requestAnimationFrame;

  window.requestAnimationFrame = function (callback) {
    return origRAF.call(window, function (timestamp) {
      const start = performance.now();
      callback(timestamp);
      const duration = performance.now() - start;
      if (duration > threshold) {
        console.warn(`🖼️ Frame render took ${duration.toFixed(2)}ms`);
      }
    });
  };
})();


(function warnOnFrequentCanvasResize(threshold = 200) {
  const resizeTimes = new Map();
  const ctxProto = HTMLCanvasElement.prototype;

  const setSize = (el, prop, val) => {
    const now = performance.now();
    const last = resizeTimes.get(el) || 0;
    if (now - last < threshold) {
      console.warn(`📏 Canvas ${prop} resized too often: ${now - last}ms apart`);
    }
    resizeTimes.set(el, now);
    return val;
  };

  Object.defineProperty(ctxProto, "width", {
    set(val) {
      return setSize(this, "width", val);
    },
  });

  Object.defineProperty(ctxProto, "height", {
    set(val) {
      return setSize(this, "height", val);
    },
  });

  console.log("📐 Canvas resize monitoring enabled.");
})();
