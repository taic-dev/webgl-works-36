uniform float uR;
uniform float uG;
uniform float uB;
uniform vec3 uBackgroundColor;

varying vec3 vPosition;
varying vec3 vOldPosition;
varying vec3 vNewPosition;

void main() {
  vec3 position = vPosition;
  float l = length(position) * 2.;

  float oldArea = length(dFdx(vOldPosition)) * length(dFdy(vOldPosition));
  float newArea = length(dFdx(vNewPosition)) * length(dFdy(vNewPosition));
  float fianlArea = oldArea / newArea * 2.0;
  fianlArea = fianlArea * 10.;
  
  vec3 fianlAreas = vec3(fianlArea * uR, fianlArea * uG, fianlArea * uB);
  vec3 color = (fianlAreas + uBackgroundColor) + l;

  gl_FragColor = vec4(vec3(color), 1.);

}