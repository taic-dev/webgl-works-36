uniform vec2 uResolution;
uniform vec2 uMouse;
uniform float uTime;
uniform vec2 uPlanePos;
uniform vec2 uPlaneSize;

varying vec2 vUv;
varying vec3 vPosition;

#pragma glslify: noise2d = require('glsl-noise/simplex/2d');
#pragma glslify: noise3d = require('glsl-noise/simplex/3d');

void main() {
  vec2 uv = gl_FragCoord.xy / uResolution.xy;
  uv = uv - 0.5;
  uv.x *= (uResolution.x / uResolution.y);

  float d = length(uv);
  float s = step(0.1, d);

  vec4 red = vec4(1., 0., 0., 1.);
  vec4 green = vec4(0., 1., 0., 1.);
  vec4 blue = vec4(0., 0., 1., 1.);

  vec4 mixRedGreen = mix(red, green, 0.5);
  vec4 color = mix(blue, mixRedGreen, 0.5);

  gl_FragColor = vec4(vec3(s), 1.);
}