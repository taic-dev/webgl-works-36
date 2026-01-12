uniform vec2 uResolution;
uniform vec2 uMouse;
uniform float uTime;
uniform vec2 uPlanePos;
uniform vec2 uPlaneSize;

varying vec2 vUv;
varying vec3 vPosition;

#pragma glslify: noise2d = require('glsl-noise/simplex/2d');
#pragma glslify: noise3d = require('glsl-noise/simplex/3d');

vec3 hsv2rgb(vec3 c) {
  vec4 K = vec4(1.0, 2.0/3.0, 1.0/3.0, 3.0);
  vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
  return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void main() {
  vec2 uv = gl_FragCoord.xy / uResolution.xy;
  uv = uv - 0.5;
  uv.x *= (uResolution.x / uResolution.y);

  gl_FragColor = vec4(uv, uv.x, 1.);
}