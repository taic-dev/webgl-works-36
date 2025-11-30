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

  float d = length(uv);


  float edge1 = smoothstep(0.0, 0.5, d);
  float edge2 = smoothstep(0.4, 0.5, d);
  float ring = edge1 - edge2;

  float n = noise2d(uv);
  float nEdge1 = smoothstep(0.5, 0.2, n);
  float nEdge2 = smoothstep(0.2, 0.3, n);
  float nRing = nEdge1 - nEdge2;

  float h = (edge1);
  float s = (edge1 * 0.2);
  float l = 1.;
  vec3 rainbow = hsv2rgb(vec3(h, s, l));
  float edge3 = smoothstep(0.1, 0.2, n);


  gl_FragColor = vec4(vec3(rainbow), 1.);
}