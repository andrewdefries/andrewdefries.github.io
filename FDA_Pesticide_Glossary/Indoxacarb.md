---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.205166, 0.6185165, -1.525515, 1, 0, 0, 1,
-3.04021, -1.379983, -2.742493, 1, 0.007843138, 0, 1,
-2.856449, 0.3074017, -1.931189, 1, 0.01176471, 0, 1,
-2.738407, -0.7141679, -1.313468, 1, 0.01960784, 0, 1,
-2.689419, -0.9890114, -2.009892, 1, 0.02352941, 0, 1,
-2.595194, -1.439215, -1.686421, 1, 0.03137255, 0, 1,
-2.584094, 1.879096, -0.9512387, 1, 0.03529412, 0, 1,
-2.552248, -0.3795981, -0.9546521, 1, 0.04313726, 0, 1,
-2.550957, 0.2254266, -2.852266, 1, 0.04705882, 0, 1,
-2.415318, -1.326059, -2.846172, 1, 0.05490196, 0, 1,
-2.379848, 1.062098, -2.530385, 1, 0.05882353, 0, 1,
-2.33943, -1.222873, -1.860091, 1, 0.06666667, 0, 1,
-2.295592, -0.4578348, -2.02781, 1, 0.07058824, 0, 1,
-2.248555, 0.1243818, -3.77937, 1, 0.07843138, 0, 1,
-2.22516, -1.090919, -3.186307, 1, 0.08235294, 0, 1,
-2.222951, 0.3198957, -3.727965, 1, 0.09019608, 0, 1,
-2.220785, 1.544655, 0.1299862, 1, 0.09411765, 0, 1,
-2.196772, -0.08753062, -2.324923, 1, 0.1019608, 0, 1,
-2.180473, 0.02254181, -0.7830788, 1, 0.1098039, 0, 1,
-2.125743, -0.451027, -1.493626, 1, 0.1137255, 0, 1,
-2.105309, -0.829607, -2.963427, 1, 0.1215686, 0, 1,
-2.096977, 0.4985737, -2.250392, 1, 0.1254902, 0, 1,
-2.060493, 0.3174998, -1.780567, 1, 0.1333333, 0, 1,
-2.054823, -0.3452731, -2.138853, 1, 0.1372549, 0, 1,
-2.03834, 1.504168, -0.6867799, 1, 0.145098, 0, 1,
-2.020919, -1.006145, -2.907125, 1, 0.1490196, 0, 1,
-2.014111, 1.064063, -1.5226, 1, 0.1568628, 0, 1,
-1.999868, -0.3798485, -0.1235869, 1, 0.1607843, 0, 1,
-1.993675, -1.790522, -0.9265887, 1, 0.1686275, 0, 1,
-1.991184, -0.2459461, -0.4823098, 1, 0.172549, 0, 1,
-1.976562, -0.3959129, -2.394301, 1, 0.1803922, 0, 1,
-1.969873, 2.572417, -2.579827, 1, 0.1843137, 0, 1,
-1.953844, -0.06627242, -4.031804, 1, 0.1921569, 0, 1,
-1.949685, 0.5569236, 0.7346026, 1, 0.1960784, 0, 1,
-1.944734, 0.7967621, -1.102522, 1, 0.2039216, 0, 1,
-1.936952, 0.8606519, 0.5598144, 1, 0.2117647, 0, 1,
-1.919333, 0.5586665, -1.743209, 1, 0.2156863, 0, 1,
-1.892674, -0.8335227, -3.171769, 1, 0.2235294, 0, 1,
-1.884148, 0.8272507, -0.646188, 1, 0.227451, 0, 1,
-1.874378, -0.207192, -2.816638, 1, 0.2352941, 0, 1,
-1.871418, 0.1083948, -1.350016, 1, 0.2392157, 0, 1,
-1.870157, 0.01111993, -2.382087, 1, 0.2470588, 0, 1,
-1.865922, -0.5228777, -2.499788, 1, 0.2509804, 0, 1,
-1.864297, 0.4800791, 0.03528852, 1, 0.2588235, 0, 1,
-1.86175, 0.4326406, -2.355867, 1, 0.2627451, 0, 1,
-1.838905, -0.5210049, -1.442447, 1, 0.2705882, 0, 1,
-1.833833, -0.9351291, -0.9240327, 1, 0.2745098, 0, 1,
-1.820162, -0.4258159, -1.723652, 1, 0.282353, 0, 1,
-1.796991, -0.5600407, -0.8189815, 1, 0.2862745, 0, 1,
-1.796754, -0.3687756, -4.076637, 1, 0.2941177, 0, 1,
-1.766396, 0.7671292, -1.104408, 1, 0.3019608, 0, 1,
-1.754948, -0.1971601, 0.3506395, 1, 0.3058824, 0, 1,
-1.753845, -1.881856, -3.250963, 1, 0.3137255, 0, 1,
-1.751322, 0.1052235, -1.13274, 1, 0.3176471, 0, 1,
-1.718298, -0.2971648, -1.503496, 1, 0.3254902, 0, 1,
-1.711105, 0.4365408, 0.1974804, 1, 0.3294118, 0, 1,
-1.708456, 0.8989176, -1.944382, 1, 0.3372549, 0, 1,
-1.692149, -0.4985815, -1.691499, 1, 0.3411765, 0, 1,
-1.692, 0.7069709, -2.166339, 1, 0.3490196, 0, 1,
-1.688479, 0.5449515, -1.935479, 1, 0.3529412, 0, 1,
-1.678445, 0.3919747, -2.786159, 1, 0.3607843, 0, 1,
-1.676283, 1.884706, -1.569515, 1, 0.3647059, 0, 1,
-1.666229, 2.314339, 0.4038424, 1, 0.372549, 0, 1,
-1.663999, -0.006872415, -2.617661, 1, 0.3764706, 0, 1,
-1.632675, 1.628413, -1.38039, 1, 0.3843137, 0, 1,
-1.630896, 0.6506278, -1.957109, 1, 0.3882353, 0, 1,
-1.63003, -0.6807141, -0.5015224, 1, 0.3960784, 0, 1,
-1.623374, 0.3037149, -0.4198655, 1, 0.4039216, 0, 1,
-1.617766, -0.8608733, -3.33248, 1, 0.4078431, 0, 1,
-1.614336, -1.293151, -0.2503147, 1, 0.4156863, 0, 1,
-1.612817, -0.6733074, -2.39873, 1, 0.4196078, 0, 1,
-1.604279, 1.348505, -0.6207066, 1, 0.427451, 0, 1,
-1.598958, -0.2334579, -2.134892, 1, 0.4313726, 0, 1,
-1.598678, 1.126508, 0.3111442, 1, 0.4392157, 0, 1,
-1.592548, 0.1709846, -0.07008777, 1, 0.4431373, 0, 1,
-1.58679, -0.1883615, -1.848391, 1, 0.4509804, 0, 1,
-1.582965, 1.699812, -0.1887641, 1, 0.454902, 0, 1,
-1.579935, -1.377797, -0.4495759, 1, 0.4627451, 0, 1,
-1.575187, 0.2076832, -0.4064294, 1, 0.4666667, 0, 1,
-1.561743, -0.07011887, -1.146941, 1, 0.4745098, 0, 1,
-1.561498, 0.6130455, -1.236674, 1, 0.4784314, 0, 1,
-1.560427, 0.1403045, -1.157871, 1, 0.4862745, 0, 1,
-1.556895, -0.8507779, -1.962368, 1, 0.4901961, 0, 1,
-1.543594, -0.1783198, -3.518384, 1, 0.4980392, 0, 1,
-1.531317, -0.9953103, -2.667048, 1, 0.5058824, 0, 1,
-1.505087, 1.947664, -0.7672603, 1, 0.509804, 0, 1,
-1.502593, 0.443811, -0.7599846, 1, 0.5176471, 0, 1,
-1.499877, -0.4023123, -1.272323, 1, 0.5215687, 0, 1,
-1.490909, 0.2231807, -2.544615, 1, 0.5294118, 0, 1,
-1.436141, 0.8332544, -1.170357, 1, 0.5333334, 0, 1,
-1.423344, 0.4159434, -1.17106, 1, 0.5411765, 0, 1,
-1.416468, -0.7202796, -2.708675, 1, 0.5450981, 0, 1,
-1.415613, 0.006845482, -0.4933631, 1, 0.5529412, 0, 1,
-1.41255, -0.9286183, -3.438408, 1, 0.5568628, 0, 1,
-1.399781, -0.2882751, -0.6408284, 1, 0.5647059, 0, 1,
-1.393242, 0.707641, -1.993639, 1, 0.5686275, 0, 1,
-1.389929, -0.3881508, -1.137104, 1, 0.5764706, 0, 1,
-1.379298, -0.3364092, -1.996335, 1, 0.5803922, 0, 1,
-1.376406, 0.2501172, -2.597125, 1, 0.5882353, 0, 1,
-1.375102, 0.6404182, -0.5052972, 1, 0.5921569, 0, 1,
-1.373322, 0.3363657, -0.2490324, 1, 0.6, 0, 1,
-1.369523, 0.7666645, -0.4086318, 1, 0.6078432, 0, 1,
-1.368378, -0.4946848, -1.716383, 1, 0.6117647, 0, 1,
-1.367702, -0.1682075, -2.277245, 1, 0.6196079, 0, 1,
-1.365164, 0.1829006, -1.30399, 1, 0.6235294, 0, 1,
-1.362321, -0.3689424, -1.360895, 1, 0.6313726, 0, 1,
-1.357203, 0.5675924, -2.464338, 1, 0.6352941, 0, 1,
-1.344758, -0.3761385, -2.092129, 1, 0.6431373, 0, 1,
-1.342673, 0.7519153, -0.3216382, 1, 0.6470588, 0, 1,
-1.335798, 0.1806893, -1.295515, 1, 0.654902, 0, 1,
-1.330776, 0.3223677, -0.7200325, 1, 0.6588235, 0, 1,
-1.320387, 1.288517, -1.269601, 1, 0.6666667, 0, 1,
-1.314476, -1.690864, -2.008434, 1, 0.6705883, 0, 1,
-1.305272, 0.2963785, -2.037358, 1, 0.6784314, 0, 1,
-1.304701, -0.7229076, -1.508445, 1, 0.682353, 0, 1,
-1.287967, -1.96098, -2.559026, 1, 0.6901961, 0, 1,
-1.279088, -0.8161709, -3.248998, 1, 0.6941177, 0, 1,
-1.279039, -1.670213, -3.717809, 1, 0.7019608, 0, 1,
-1.264882, -0.3535774, -0.8143124, 1, 0.7098039, 0, 1,
-1.256833, 0.6776842, -2.515966, 1, 0.7137255, 0, 1,
-1.251449, 0.6751198, -0.5308223, 1, 0.7215686, 0, 1,
-1.250108, -1.03126, -3.232436, 1, 0.7254902, 0, 1,
-1.243728, 1.117342, -2.464863, 1, 0.7333333, 0, 1,
-1.23894, 0.6480688, -1.636013, 1, 0.7372549, 0, 1,
-1.238442, 1.055031, -0.6420017, 1, 0.7450981, 0, 1,
-1.232895, -0.998066, -2.819947, 1, 0.7490196, 0, 1,
-1.231652, 0.1203938, -1.696589, 1, 0.7568628, 0, 1,
-1.227836, -1.424177, -2.506571, 1, 0.7607843, 0, 1,
-1.224981, -0.2707259, -0.3181548, 1, 0.7686275, 0, 1,
-1.221859, -1.034875, -1.501968, 1, 0.772549, 0, 1,
-1.21929, 0.04250873, -1.766407, 1, 0.7803922, 0, 1,
-1.209039, -0.2021903, -1.540932, 1, 0.7843137, 0, 1,
-1.205999, 0.8966178, -0.4707403, 1, 0.7921569, 0, 1,
-1.203277, 0.3222742, -3.257091, 1, 0.7960784, 0, 1,
-1.193152, -1.269516, -2.764611, 1, 0.8039216, 0, 1,
-1.192844, 0.2285629, 0.2087163, 1, 0.8117647, 0, 1,
-1.191392, 2.309209, -1.381048, 1, 0.8156863, 0, 1,
-1.183025, 0.5836537, -0.888926, 1, 0.8235294, 0, 1,
-1.172259, 1.767437, 0.8082731, 1, 0.827451, 0, 1,
-1.170847, -0.6656125, -2.572478, 1, 0.8352941, 0, 1,
-1.165681, 1.025625, 0.2841574, 1, 0.8392157, 0, 1,
-1.156256, -0.4905488, -2.392447, 1, 0.8470588, 0, 1,
-1.147949, -1.894944, -2.20786, 1, 0.8509804, 0, 1,
-1.144933, -0.6833771, -2.750847, 1, 0.8588235, 0, 1,
-1.135004, 0.4987982, -2.435594, 1, 0.8627451, 0, 1,
-1.126666, 0.8976381, -0.7350081, 1, 0.8705882, 0, 1,
-1.124508, 1.510836, -1.435745, 1, 0.8745098, 0, 1,
-1.121284, -0.1185865, -0.6789292, 1, 0.8823529, 0, 1,
-1.114542, -0.9389437, -2.573075, 1, 0.8862745, 0, 1,
-1.105349, 1.813312, -0.3295039, 1, 0.8941177, 0, 1,
-1.103161, 0.7195087, -1.493673, 1, 0.8980392, 0, 1,
-1.102737, 0.5515895, 0.7507587, 1, 0.9058824, 0, 1,
-1.097154, 0.7742546, 0.3228855, 1, 0.9137255, 0, 1,
-1.089041, -1.041914, -4.362424, 1, 0.9176471, 0, 1,
-1.086124, 0.4385847, -0.423679, 1, 0.9254902, 0, 1,
-1.081079, -0.4746753, -1.880842, 1, 0.9294118, 0, 1,
-1.070783, -0.3952753, -2.941297, 1, 0.9372549, 0, 1,
-1.054417, -0.2539831, -0.7289035, 1, 0.9411765, 0, 1,
-1.053378, -0.3652482, 0.5819785, 1, 0.9490196, 0, 1,
-1.05207, -0.1960439, -1.497144, 1, 0.9529412, 0, 1,
-1.049926, -0.9649115, -1.573006, 1, 0.9607843, 0, 1,
-1.047133, 1.014823, 0.8903687, 1, 0.9647059, 0, 1,
-1.040741, 0.3239698, -2.11153, 1, 0.972549, 0, 1,
-1.036452, -1.00203, -1.041088, 1, 0.9764706, 0, 1,
-1.034719, -1.06064, -3.322045, 1, 0.9843137, 0, 1,
-1.029196, 1.1653, -0.6987108, 1, 0.9882353, 0, 1,
-1.026684, -0.404628, -3.228678, 1, 0.9960784, 0, 1,
-1.026463, -0.1308126, -1.947761, 0.9960784, 1, 0, 1,
-1.025952, 0.06087258, -1.133893, 0.9921569, 1, 0, 1,
-1.023728, 0.2183968, -0.8921841, 0.9843137, 1, 0, 1,
-1.015559, -0.7360136, -2.100769, 0.9803922, 1, 0, 1,
-1.014266, 0.5442384, -1.293551, 0.972549, 1, 0, 1,
-1.010779, 0.1225737, -0.8871626, 0.9686275, 1, 0, 1,
-0.9962704, 1.406939, -0.05162976, 0.9607843, 1, 0, 1,
-0.9958672, -0.9955266, -3.566041, 0.9568627, 1, 0, 1,
-0.9810088, 1.073424, -0.8792669, 0.9490196, 1, 0, 1,
-0.9766898, -0.2153059, -1.17657, 0.945098, 1, 0, 1,
-0.9745917, -0.9901461, -2.833777, 0.9372549, 1, 0, 1,
-0.9729529, -1.069446, -2.734325, 0.9333333, 1, 0, 1,
-0.9717135, -0.9427865, -3.713579, 0.9254902, 1, 0, 1,
-0.9608061, -1.437801, -1.322008, 0.9215686, 1, 0, 1,
-0.9597656, -2.053276, -3.388872, 0.9137255, 1, 0, 1,
-0.9593312, -0.8243577, -1.626932, 0.9098039, 1, 0, 1,
-0.9585391, 1.841378, 0.2175806, 0.9019608, 1, 0, 1,
-0.9553608, -0.754622, -2.012141, 0.8941177, 1, 0, 1,
-0.9544624, 1.677956, 0.08797185, 0.8901961, 1, 0, 1,
-0.9540421, 1.183366, 0.2059932, 0.8823529, 1, 0, 1,
-0.9491227, 0.2503355, -0.9080771, 0.8784314, 1, 0, 1,
-0.9480755, -0.1347154, -2.308286, 0.8705882, 1, 0, 1,
-0.9431598, -0.1059128, -1.451029, 0.8666667, 1, 0, 1,
-0.9375686, -0.6286491, -1.965614, 0.8588235, 1, 0, 1,
-0.9331928, -0.8361014, -2.63812, 0.854902, 1, 0, 1,
-0.9330837, 0.3949724, -2.366088, 0.8470588, 1, 0, 1,
-0.9312714, -0.3321943, -2.829149, 0.8431373, 1, 0, 1,
-0.9289895, 0.3323875, -1.554006, 0.8352941, 1, 0, 1,
-0.9269414, 0.3574086, -2.453352, 0.8313726, 1, 0, 1,
-0.925792, -0.7467323, -0.3321903, 0.8235294, 1, 0, 1,
-0.9219169, -1.374561, -2.21712, 0.8196079, 1, 0, 1,
-0.9211323, -0.5395309, -3.508581, 0.8117647, 1, 0, 1,
-0.9142408, 0.3633768, -2.412269, 0.8078431, 1, 0, 1,
-0.908757, 1.657218, -1.2156, 0.8, 1, 0, 1,
-0.9078125, -0.5965078, -2.303043, 0.7921569, 1, 0, 1,
-0.9049271, 0.1798216, -0.7256036, 0.7882353, 1, 0, 1,
-0.9017498, 0.802209, -0.5211877, 0.7803922, 1, 0, 1,
-0.8999618, 0.7851191, -2.438036, 0.7764706, 1, 0, 1,
-0.8993056, 0.2448285, 0.08372591, 0.7686275, 1, 0, 1,
-0.8910802, 0.04927806, -2.45511, 0.7647059, 1, 0, 1,
-0.887094, 0.2148355, -1.655654, 0.7568628, 1, 0, 1,
-0.8850179, 1.03889, -1.537392, 0.7529412, 1, 0, 1,
-0.8740749, 0.9521645, 0.8998808, 0.7450981, 1, 0, 1,
-0.8661246, -0.3750715, -1.632039, 0.7411765, 1, 0, 1,
-0.8660398, -1.658114, -1.951541, 0.7333333, 1, 0, 1,
-0.8646228, -2.40969, -3.098471, 0.7294118, 1, 0, 1,
-0.8594675, 1.096139, -1.649905, 0.7215686, 1, 0, 1,
-0.8560727, -1.916493, -2.918042, 0.7176471, 1, 0, 1,
-0.8552724, -1.189913, -2.782835, 0.7098039, 1, 0, 1,
-0.852451, -1.281511, -2.942777, 0.7058824, 1, 0, 1,
-0.8521921, -0.6529325, -2.004666, 0.6980392, 1, 0, 1,
-0.848992, 2.540424, 0.6035679, 0.6901961, 1, 0, 1,
-0.8348752, 3.275309, -2.160828, 0.6862745, 1, 0, 1,
-0.8301108, -0.3632547, -2.553053, 0.6784314, 1, 0, 1,
-0.8267887, -0.06698245, -1.25571, 0.6745098, 1, 0, 1,
-0.8083209, 1.074413, -0.3922495, 0.6666667, 1, 0, 1,
-0.8066656, 0.5091825, -1.16281, 0.6627451, 1, 0, 1,
-0.8009539, -0.7768232, -3.289213, 0.654902, 1, 0, 1,
-0.7979479, -0.8560074, -2.519413, 0.6509804, 1, 0, 1,
-0.7967421, 1.206917, -0.9719512, 0.6431373, 1, 0, 1,
-0.7946405, 0.6407104, -0.3685529, 0.6392157, 1, 0, 1,
-0.7897116, -1.132423, -3.40797, 0.6313726, 1, 0, 1,
-0.7878007, -0.8679075, -1.312429, 0.627451, 1, 0, 1,
-0.781391, 1.608357, -0.05918186, 0.6196079, 1, 0, 1,
-0.7800608, -1.36606, -2.695156, 0.6156863, 1, 0, 1,
-0.777172, 1.367337, -1.014812, 0.6078432, 1, 0, 1,
-0.7763758, -1.33148, -3.475214, 0.6039216, 1, 0, 1,
-0.7749795, 1.931098, -0.1760772, 0.5960785, 1, 0, 1,
-0.772951, 1.040254, -0.91017, 0.5882353, 1, 0, 1,
-0.7641945, -0.4287617, -2.69353, 0.5843138, 1, 0, 1,
-0.7619701, 0.2904956, -2.157687, 0.5764706, 1, 0, 1,
-0.7558299, -0.7982296, -2.879057, 0.572549, 1, 0, 1,
-0.7522834, -0.880219, -2.994224, 0.5647059, 1, 0, 1,
-0.7491282, -0.3820961, -1.658984, 0.5607843, 1, 0, 1,
-0.748449, -0.4158961, -1.893379, 0.5529412, 1, 0, 1,
-0.7443788, -1.09021, -3.171726, 0.5490196, 1, 0, 1,
-0.7431128, -1.317725, -3.494117, 0.5411765, 1, 0, 1,
-0.7428315, 0.7198232, -0.3796325, 0.5372549, 1, 0, 1,
-0.7414783, 1.128148, -0.5330233, 0.5294118, 1, 0, 1,
-0.7370304, 0.164135, -1.419476, 0.5254902, 1, 0, 1,
-0.7359012, -0.6992724, -1.724008, 0.5176471, 1, 0, 1,
-0.7342362, -0.8802926, -2.382129, 0.5137255, 1, 0, 1,
-0.7223722, -0.07923522, 0.05610897, 0.5058824, 1, 0, 1,
-0.7117026, 0.173068, -1.184767, 0.5019608, 1, 0, 1,
-0.7001845, 0.600033, -2.401567, 0.4941176, 1, 0, 1,
-0.6989612, 1.0015, -0.5838349, 0.4862745, 1, 0, 1,
-0.6839744, 2.057556, -1.485287, 0.4823529, 1, 0, 1,
-0.6817126, -0.5840434, -2.033537, 0.4745098, 1, 0, 1,
-0.6801299, -1.039394, -3.782484, 0.4705882, 1, 0, 1,
-0.6799486, -1.314452, -3.28331, 0.4627451, 1, 0, 1,
-0.6708494, 1.269842, -0.4735531, 0.4588235, 1, 0, 1,
-0.6668792, 0.05435774, -0.9930254, 0.4509804, 1, 0, 1,
-0.6649535, -0.3365995, -3.079844, 0.4470588, 1, 0, 1,
-0.6640081, -0.7920824, -2.490533, 0.4392157, 1, 0, 1,
-0.6531153, -0.384061, -2.373092, 0.4352941, 1, 0, 1,
-0.6522597, -1.324686, -2.159762, 0.427451, 1, 0, 1,
-0.6415064, 0.03697948, -2.224839, 0.4235294, 1, 0, 1,
-0.6369391, 1.495728, 1.099732, 0.4156863, 1, 0, 1,
-0.6368115, 0.4203317, -1.33316, 0.4117647, 1, 0, 1,
-0.6352916, 0.2792608, -1.334758, 0.4039216, 1, 0, 1,
-0.634991, 0.2264021, -3.567374, 0.3960784, 1, 0, 1,
-0.6339554, 1.572037, -0.6762284, 0.3921569, 1, 0, 1,
-0.6276365, -0.3432238, -1.779436, 0.3843137, 1, 0, 1,
-0.6252925, 0.6304591, -0.4712954, 0.3803922, 1, 0, 1,
-0.6251718, 0.6113176, -0.9305328, 0.372549, 1, 0, 1,
-0.6226555, 1.104355, -2.054182, 0.3686275, 1, 0, 1,
-0.6224105, -0.03353633, -3.579535, 0.3607843, 1, 0, 1,
-0.6207652, -0.01498953, -1.572438, 0.3568628, 1, 0, 1,
-0.6204379, 0.414078, -1.248939, 0.3490196, 1, 0, 1,
-0.6193811, 0.8729444, 0.7578928, 0.345098, 1, 0, 1,
-0.6184493, 0.3861469, -0.1402609, 0.3372549, 1, 0, 1,
-0.6168845, -0.6394479, -3.546099, 0.3333333, 1, 0, 1,
-0.6075516, -0.3793116, -1.725961, 0.3254902, 1, 0, 1,
-0.6049418, 0.6423848, -1.622153, 0.3215686, 1, 0, 1,
-0.6047873, -1.271924, -3.499776, 0.3137255, 1, 0, 1,
-0.5918081, 2.376062, -1.634786, 0.3098039, 1, 0, 1,
-0.5856908, 0.1831415, -2.250635, 0.3019608, 1, 0, 1,
-0.5800575, 1.270104, 1.945974, 0.2941177, 1, 0, 1,
-0.5722964, 1.920128, -1.958912, 0.2901961, 1, 0, 1,
-0.5715083, -0.3416921, -1.25073, 0.282353, 1, 0, 1,
-0.562843, -0.7792851, -1.428645, 0.2784314, 1, 0, 1,
-0.5597942, -1.377871, -2.454115, 0.2705882, 1, 0, 1,
-0.5547349, -0.9497657, -1.867602, 0.2666667, 1, 0, 1,
-0.5463373, -0.05651706, -0.7406356, 0.2588235, 1, 0, 1,
-0.5461215, 0.7764537, -0.5019125, 0.254902, 1, 0, 1,
-0.5383036, 0.4174075, -0.9891557, 0.2470588, 1, 0, 1,
-0.5380768, 0.3325149, -1.799417, 0.2431373, 1, 0, 1,
-0.5370195, 1.058091, -0.9125754, 0.2352941, 1, 0, 1,
-0.5342052, 0.7379264, 1.711948, 0.2313726, 1, 0, 1,
-0.5329326, -1.929306, -3.280748, 0.2235294, 1, 0, 1,
-0.5301082, -0.4400426, -2.0742, 0.2196078, 1, 0, 1,
-0.5243157, -1.039218, -3.305338, 0.2117647, 1, 0, 1,
-0.5212113, -0.7521926, -0.8472279, 0.2078431, 1, 0, 1,
-0.5186428, -0.7384079, -4.008268, 0.2, 1, 0, 1,
-0.5180187, 0.964999, -1.277838, 0.1921569, 1, 0, 1,
-0.517705, 0.7205735, -1.236363, 0.1882353, 1, 0, 1,
-0.512339, -0.1530278, -3.380428, 0.1803922, 1, 0, 1,
-0.5078897, -1.048913, -2.321169, 0.1764706, 1, 0, 1,
-0.4990166, -0.9708092, -3.033647, 0.1686275, 1, 0, 1,
-0.4898134, -1.564061, -2.071039, 0.1647059, 1, 0, 1,
-0.4879538, 0.5131456, -0.4175292, 0.1568628, 1, 0, 1,
-0.4849957, -0.06997061, -1.179024, 0.1529412, 1, 0, 1,
-0.48353, -1.182229, -3.799298, 0.145098, 1, 0, 1,
-0.4829547, -0.1281981, -2.247406, 0.1411765, 1, 0, 1,
-0.4827318, -0.1867318, -1.431249, 0.1333333, 1, 0, 1,
-0.4824349, 1.241077, 0.07270525, 0.1294118, 1, 0, 1,
-0.4820518, -0.6418899, -2.690209, 0.1215686, 1, 0, 1,
-0.4794957, 0.284163, -1.859476, 0.1176471, 1, 0, 1,
-0.4727299, -0.8439673, -1.601276, 0.1098039, 1, 0, 1,
-0.4716832, -0.1079215, -2.175641, 0.1058824, 1, 0, 1,
-0.4707407, -0.6793514, -2.256203, 0.09803922, 1, 0, 1,
-0.4646669, -1.0409, -3.545922, 0.09019608, 1, 0, 1,
-0.4625151, 1.421021, 0.2923111, 0.08627451, 1, 0, 1,
-0.461367, 2.483268, -1.370086, 0.07843138, 1, 0, 1,
-0.4549383, -0.1568183, -1.340811, 0.07450981, 1, 0, 1,
-0.4533913, 0.5306676, -0.8871735, 0.06666667, 1, 0, 1,
-0.4522493, -0.9800935, -4.983708, 0.0627451, 1, 0, 1,
-0.4446082, 0.6039519, -1.29831, 0.05490196, 1, 0, 1,
-0.4444423, 0.3555861, -1.808669, 0.05098039, 1, 0, 1,
-0.4428935, -1.811998, -1.596879, 0.04313726, 1, 0, 1,
-0.442033, -1.123332, -2.922271, 0.03921569, 1, 0, 1,
-0.4414371, 0.2761862, -0.5656024, 0.03137255, 1, 0, 1,
-0.4393062, 0.3465854, -1.245724, 0.02745098, 1, 0, 1,
-0.438614, 0.3347494, -1.669236, 0.01960784, 1, 0, 1,
-0.4366857, -0.3908651, -4.806824, 0.01568628, 1, 0, 1,
-0.4317265, -0.8174976, -2.169523, 0.007843138, 1, 0, 1,
-0.4298756, 2.245416, 0.9998991, 0.003921569, 1, 0, 1,
-0.4294478, -1.861436, -3.435497, 0, 1, 0.003921569, 1,
-0.425139, -1.162648, -2.578149, 0, 1, 0.01176471, 1,
-0.4229119, -0.4764534, -2.456729, 0, 1, 0.01568628, 1,
-0.4225034, 0.1781536, -0.740734, 0, 1, 0.02352941, 1,
-0.4183396, -0.4576147, -2.304836, 0, 1, 0.02745098, 1,
-0.4175582, -1.306608, -4.232994, 0, 1, 0.03529412, 1,
-0.413596, -1.028014, -2.454819, 0, 1, 0.03921569, 1,
-0.4134589, 0.4970529, 0.1613812, 0, 1, 0.04705882, 1,
-0.4121004, 0.2246665, -0.1531527, 0, 1, 0.05098039, 1,
-0.4070261, 0.6927363, 0.4791243, 0, 1, 0.05882353, 1,
-0.405708, -1.002927, -3.155851, 0, 1, 0.0627451, 1,
-0.3901688, 1.027901, -0.1672268, 0, 1, 0.07058824, 1,
-0.3886124, 0.5118418, -1.164172, 0, 1, 0.07450981, 1,
-0.3840892, 0.4878993, 0.1993941, 0, 1, 0.08235294, 1,
-0.3782783, 0.02865404, -0.8230814, 0, 1, 0.08627451, 1,
-0.3742571, -0.3186035, -2.052154, 0, 1, 0.09411765, 1,
-0.3705862, -0.8792821, -2.580541, 0, 1, 0.1019608, 1,
-0.3693755, -1.320579, -3.483234, 0, 1, 0.1058824, 1,
-0.368531, -1.9212, -3.272036, 0, 1, 0.1137255, 1,
-0.3675377, 1.805031, -0.9607637, 0, 1, 0.1176471, 1,
-0.3673427, -0.303933, -2.079343, 0, 1, 0.1254902, 1,
-0.3645055, -0.431992, -2.080513, 0, 1, 0.1294118, 1,
-0.3541206, 0.06903327, -2.863377, 0, 1, 0.1372549, 1,
-0.3537939, -0.2429204, -2.916771, 0, 1, 0.1411765, 1,
-0.3475756, -0.6494037, -2.868641, 0, 1, 0.1490196, 1,
-0.3458477, -0.5917544, -2.501892, 0, 1, 0.1529412, 1,
-0.341293, 0.3110043, -2.064748, 0, 1, 0.1607843, 1,
-0.3386299, 0.2875363, -1.761993, 0, 1, 0.1647059, 1,
-0.3376228, 0.1464627, -1.631, 0, 1, 0.172549, 1,
-0.3291968, -0.7979101, -5.011961, 0, 1, 0.1764706, 1,
-0.3282838, 1.634018, 0.1582863, 0, 1, 0.1843137, 1,
-0.325658, -0.7473228, -3.048816, 0, 1, 0.1882353, 1,
-0.3133812, -0.8345351, -3.166636, 0, 1, 0.1960784, 1,
-0.3124572, 0.04628592, -1.433844, 0, 1, 0.2039216, 1,
-0.3078744, 0.055143, -0.864324, 0, 1, 0.2078431, 1,
-0.3026226, -0.8175071, -1.005931, 0, 1, 0.2156863, 1,
-0.2981883, -0.09598153, -3.061379, 0, 1, 0.2196078, 1,
-0.296243, -0.435076, -1.665127, 0, 1, 0.227451, 1,
-0.2955137, 0.8296356, -1.190427, 0, 1, 0.2313726, 1,
-0.2945889, 0.6565424, -0.8679004, 0, 1, 0.2392157, 1,
-0.2911432, -1.779456, -2.139202, 0, 1, 0.2431373, 1,
-0.2906279, 0.5441862, -0.9489284, 0, 1, 0.2509804, 1,
-0.288423, -1.342413, -5.127868, 0, 1, 0.254902, 1,
-0.2880451, 0.460414, -0.2321994, 0, 1, 0.2627451, 1,
-0.28467, 1.73175, -0.6517685, 0, 1, 0.2666667, 1,
-0.281887, 0.7680295, 0.665267, 0, 1, 0.2745098, 1,
-0.2817711, -1.327867, -1.650039, 0, 1, 0.2784314, 1,
-0.279851, 1.229779, 1.04878, 0, 1, 0.2862745, 1,
-0.2795763, 0.7996897, -1.42138, 0, 1, 0.2901961, 1,
-0.2761863, 1.170095, 0.03259036, 0, 1, 0.2980392, 1,
-0.2748893, -0.2408635, -3.949248, 0, 1, 0.3058824, 1,
-0.2746396, 0.7539281, -0.9028678, 0, 1, 0.3098039, 1,
-0.2744984, -0.4270204, -2.947923, 0, 1, 0.3176471, 1,
-0.2725024, 0.4312356, -1.174477, 0, 1, 0.3215686, 1,
-0.2690162, 0.6290287, -0.00496207, 0, 1, 0.3294118, 1,
-0.2689244, 0.1130926, 0.2513221, 0, 1, 0.3333333, 1,
-0.2662967, 0.864908, 1.364345, 0, 1, 0.3411765, 1,
-0.250279, -1.085889, -3.176205, 0, 1, 0.345098, 1,
-0.2466116, 0.2908003, -0.3442315, 0, 1, 0.3529412, 1,
-0.2410069, 1.691827, 0.1825295, 0, 1, 0.3568628, 1,
-0.2409366, -1.289051, -2.980144, 0, 1, 0.3647059, 1,
-0.2399978, -1.004991, -3.369185, 0, 1, 0.3686275, 1,
-0.2382234, 0.1032954, -2.232386, 0, 1, 0.3764706, 1,
-0.2289558, -0.6984343, -3.203306, 0, 1, 0.3803922, 1,
-0.2255274, -1.246365, -2.383035, 0, 1, 0.3882353, 1,
-0.2217666, 0.03982636, -1.898135, 0, 1, 0.3921569, 1,
-0.2189582, 0.5086741, -1.063873, 0, 1, 0.4, 1,
-0.2178116, 1.151811, -0.1091832, 0, 1, 0.4078431, 1,
-0.2135518, -2.055258, -2.883416, 0, 1, 0.4117647, 1,
-0.2094034, -0.8388953, -3.905258, 0, 1, 0.4196078, 1,
-0.2031434, 1.191399, -0.9277295, 0, 1, 0.4235294, 1,
-0.2018722, -1.005181, -4.259607, 0, 1, 0.4313726, 1,
-0.1987126, -0.2871578, -1.98598, 0, 1, 0.4352941, 1,
-0.1952181, -0.8145092, -4.028557, 0, 1, 0.4431373, 1,
-0.1898509, -0.3640124, -4.212959, 0, 1, 0.4470588, 1,
-0.1880547, -0.2409686, -2.331378, 0, 1, 0.454902, 1,
-0.1835281, 1.181828, -1.648495, 0, 1, 0.4588235, 1,
-0.1830398, -0.2021395, -0.8979042, 0, 1, 0.4666667, 1,
-0.1823305, 0.8949018, 0.3743928, 0, 1, 0.4705882, 1,
-0.1794177, -0.2498397, -3.080062, 0, 1, 0.4784314, 1,
-0.1781156, -0.2763637, -3.776785, 0, 1, 0.4823529, 1,
-0.1765271, 1.765164, 0.04078441, 0, 1, 0.4901961, 1,
-0.1753095, -0.8654904, -4.140979, 0, 1, 0.4941176, 1,
-0.1748432, 1.804274, 0.9006118, 0, 1, 0.5019608, 1,
-0.173126, 1.57495, -1.606004, 0, 1, 0.509804, 1,
-0.1706595, 0.5743963, 0.4209298, 0, 1, 0.5137255, 1,
-0.1705582, 1.196282, 0.3302791, 0, 1, 0.5215687, 1,
-0.1685684, 0.9110099, -0.262878, 0, 1, 0.5254902, 1,
-0.1670003, 0.05750739, -0.7911903, 0, 1, 0.5333334, 1,
-0.1646378, -0.2625011, -2.041275, 0, 1, 0.5372549, 1,
-0.1643103, -0.8338004, -2.66356, 0, 1, 0.5450981, 1,
-0.1634741, 0.1060515, -0.5095521, 0, 1, 0.5490196, 1,
-0.1630331, 0.1092836, -1.309714, 0, 1, 0.5568628, 1,
-0.162744, 0.004402549, -0.8215944, 0, 1, 0.5607843, 1,
-0.1620524, 0.6184787, 0.5013886, 0, 1, 0.5686275, 1,
-0.1617334, 0.6230212, -0.503638, 0, 1, 0.572549, 1,
-0.1611448, 1.144202, -0.8086342, 0, 1, 0.5803922, 1,
-0.1551305, 1.292966, -0.3450388, 0, 1, 0.5843138, 1,
-0.1550958, 0.4799452, -1.445582, 0, 1, 0.5921569, 1,
-0.1543766, -0.7727347, -4.216165, 0, 1, 0.5960785, 1,
-0.1489905, -0.4088436, -2.747963, 0, 1, 0.6039216, 1,
-0.1486253, 0.7859397, -0.4454521, 0, 1, 0.6117647, 1,
-0.1475518, -0.9158703, -2.450409, 0, 1, 0.6156863, 1,
-0.1473996, -2.396747, -1.976609, 0, 1, 0.6235294, 1,
-0.1447731, -0.01829593, -1.145541, 0, 1, 0.627451, 1,
-0.1398635, 1.199244, -0.3074865, 0, 1, 0.6352941, 1,
-0.1392849, 1.02574, -2.062041, 0, 1, 0.6392157, 1,
-0.1382295, 0.4457805, 1.151952, 0, 1, 0.6470588, 1,
-0.1373252, -0.2295212, -2.60239, 0, 1, 0.6509804, 1,
-0.1371597, 0.1799162, 0.469795, 0, 1, 0.6588235, 1,
-0.1365052, 0.1923124, -1.931076, 0, 1, 0.6627451, 1,
-0.1275342, -1.161284, -3.38405, 0, 1, 0.6705883, 1,
-0.1251035, -0.4599267, -3.350264, 0, 1, 0.6745098, 1,
-0.1221162, 2.191554, -0.2132163, 0, 1, 0.682353, 1,
-0.1198549, -0.8048372, -3.29671, 0, 1, 0.6862745, 1,
-0.1152781, 0.6136983, 0.9078797, 0, 1, 0.6941177, 1,
-0.1149635, -1.745959, -2.988988, 0, 1, 0.7019608, 1,
-0.1132088, 0.1445197, -0.6057217, 0, 1, 0.7058824, 1,
-0.112688, 1.581679, -1.588092, 0, 1, 0.7137255, 1,
-0.1119369, -0.1986459, -2.463247, 0, 1, 0.7176471, 1,
-0.1103682, 0.4166164, -1.939243, 0, 1, 0.7254902, 1,
-0.1103614, -0.3490201, -2.927166, 0, 1, 0.7294118, 1,
-0.1023462, 0.09426097, 0.5620906, 0, 1, 0.7372549, 1,
-0.0988636, 0.3131402, 0.472146, 0, 1, 0.7411765, 1,
-0.09790201, 0.9219956, 0.3328064, 0, 1, 0.7490196, 1,
-0.09760166, 0.159345, -1.134499, 0, 1, 0.7529412, 1,
-0.09020129, -1.009073, -3.625679, 0, 1, 0.7607843, 1,
-0.08751341, 1.970756, -0.1702378, 0, 1, 0.7647059, 1,
-0.08547097, -1.282898, -4.868183, 0, 1, 0.772549, 1,
-0.08333498, 0.6434267, -1.876225, 0, 1, 0.7764706, 1,
-0.08195705, -1.041797, -2.89641, 0, 1, 0.7843137, 1,
-0.07918435, -1.51052, -4.680267, 0, 1, 0.7882353, 1,
-0.07806975, -0.1440433, -2.278295, 0, 1, 0.7960784, 1,
-0.07703482, -0.8591498, -1.077406, 0, 1, 0.8039216, 1,
-0.07421585, -1.268422, -3.007455, 0, 1, 0.8078431, 1,
-0.07386893, -1.246544, -3.798334, 0, 1, 0.8156863, 1,
-0.07233094, -0.6349826, -2.930759, 0, 1, 0.8196079, 1,
-0.06922967, 0.6926991, -1.295949, 0, 1, 0.827451, 1,
-0.06901827, 0.8468286, -0.4741386, 0, 1, 0.8313726, 1,
-0.0661187, 1.441953, -0.3021653, 0, 1, 0.8392157, 1,
-0.06458176, 0.7432793, 0.5597134, 0, 1, 0.8431373, 1,
-0.06074761, 0.3896876, -0.5886804, 0, 1, 0.8509804, 1,
-0.05892434, 0.4404634, 1.225371, 0, 1, 0.854902, 1,
-0.05684121, 0.49123, 0.6874898, 0, 1, 0.8627451, 1,
-0.0508349, 0.7548765, -0.5070608, 0, 1, 0.8666667, 1,
-0.04916002, -0.9597564, -2.817536, 0, 1, 0.8745098, 1,
-0.04214752, -0.03076648, -3.888065, 0, 1, 0.8784314, 1,
-0.03897905, 0.3601973, 1.049213, 0, 1, 0.8862745, 1,
-0.03780935, 0.5464909, -0.886603, 0, 1, 0.8901961, 1,
-0.03409284, -0.5162129, -1.824536, 0, 1, 0.8980392, 1,
-0.03100475, -0.04824365, -2.5714, 0, 1, 0.9058824, 1,
-0.02828125, -1.094856, -5.053032, 0, 1, 0.9098039, 1,
-0.02728301, 0.556659, -0.2758844, 0, 1, 0.9176471, 1,
-0.01493331, -0.9247959, -2.112903, 0, 1, 0.9215686, 1,
-0.01474282, -0.7539798, -2.478741, 0, 1, 0.9294118, 1,
-0.01275689, 0.4855925, -0.1949041, 0, 1, 0.9333333, 1,
-0.01261504, 0.08413059, 0.2406777, 0, 1, 0.9411765, 1,
-0.01225156, -0.439465, -2.398036, 0, 1, 0.945098, 1,
-0.008626811, -0.08322368, -2.922202, 0, 1, 0.9529412, 1,
0.0003015284, -0.9029357, 5.213229, 0, 1, 0.9568627, 1,
0.0003175657, -0.6291566, 2.398475, 0, 1, 0.9647059, 1,
0.001574577, -0.04155904, 1.401785, 0, 1, 0.9686275, 1,
0.003078635, -0.4446862, 3.859157, 0, 1, 0.9764706, 1,
0.007899773, -2.283982, 3.239559, 0, 1, 0.9803922, 1,
0.01132452, -0.2872699, 3.262846, 0, 1, 0.9882353, 1,
0.01198592, 1.918035, 0.5536633, 0, 1, 0.9921569, 1,
0.01541325, 0.1027426, 1.28104, 0, 1, 1, 1,
0.01954992, -1.246563, 3.93107, 0, 0.9921569, 1, 1,
0.02042314, 0.9750155, -0.522998, 0, 0.9882353, 1, 1,
0.02247288, 0.2197524, -0.915473, 0, 0.9803922, 1, 1,
0.02842472, 1.290493, -1.02501, 0, 0.9764706, 1, 1,
0.02936354, -1.202961, 4.842672, 0, 0.9686275, 1, 1,
0.03093604, -0.5700775, 2.502033, 0, 0.9647059, 1, 1,
0.03536272, 0.3140157, -1.06672, 0, 0.9568627, 1, 1,
0.0354878, -2.067316, 2.214526, 0, 0.9529412, 1, 1,
0.03573748, -0.3794226, 3.345798, 0, 0.945098, 1, 1,
0.03738715, 0.9239583, -0.06926785, 0, 0.9411765, 1, 1,
0.03765538, -0.08039814, 1.934852, 0, 0.9333333, 1, 1,
0.03853582, 0.303582, -1.26815, 0, 0.9294118, 1, 1,
0.04006442, -0.6449136, 4.377038, 0, 0.9215686, 1, 1,
0.04043298, -0.3258214, 3.399258, 0, 0.9176471, 1, 1,
0.04061581, 0.4098263, 0.4802158, 0, 0.9098039, 1, 1,
0.04185738, 0.2728242, 2.435815, 0, 0.9058824, 1, 1,
0.04186767, 1.410109, -0.7569621, 0, 0.8980392, 1, 1,
0.04234187, -1.626431, 2.653853, 0, 0.8901961, 1, 1,
0.04551618, -0.9897826, 1.459268, 0, 0.8862745, 1, 1,
0.05182478, -0.7336779, 3.543733, 0, 0.8784314, 1, 1,
0.05244249, -0.4027707, 1.795666, 0, 0.8745098, 1, 1,
0.05914574, -0.7903985, 4.820447, 0, 0.8666667, 1, 1,
0.05922745, -0.399311, 3.435656, 0, 0.8627451, 1, 1,
0.06023093, -0.566651, 3.883077, 0, 0.854902, 1, 1,
0.06175542, 0.2117851, 1.35797, 0, 0.8509804, 1, 1,
0.06386068, -0.9527335, 4.252285, 0, 0.8431373, 1, 1,
0.06919606, -1.721481, 1.059576, 0, 0.8392157, 1, 1,
0.07189616, -0.6028106, 2.64305, 0, 0.8313726, 1, 1,
0.07969636, 0.07668174, -0.1518172, 0, 0.827451, 1, 1,
0.086536, -0.4320677, 3.150095, 0, 0.8196079, 1, 1,
0.0872881, -1.449363, 4.100184, 0, 0.8156863, 1, 1,
0.09047081, 0.6986647, 2.148304, 0, 0.8078431, 1, 1,
0.09119687, 1.774381, 0.2541839, 0, 0.8039216, 1, 1,
0.09881418, -0.08103383, 2.903437, 0, 0.7960784, 1, 1,
0.09973568, 0.8517013, 0.5453905, 0, 0.7882353, 1, 1,
0.1017986, -1.012794, 2.750054, 0, 0.7843137, 1, 1,
0.1021075, -1.123736, 3.126137, 0, 0.7764706, 1, 1,
0.1032187, -1.419275, 1.762226, 0, 0.772549, 1, 1,
0.1077268, -0.3348839, 4.886929, 0, 0.7647059, 1, 1,
0.1089809, 0.4371239, 0.750468, 0, 0.7607843, 1, 1,
0.1177419, -0.1767437, 4.132656, 0, 0.7529412, 1, 1,
0.1222401, 0.3636419, -0.3769471, 0, 0.7490196, 1, 1,
0.1279718, -0.4775899, 1.383211, 0, 0.7411765, 1, 1,
0.1311208, -0.2116168, 1.743577, 0, 0.7372549, 1, 1,
0.1340618, 0.3176819, -1.574565, 0, 0.7294118, 1, 1,
0.1348418, -0.459813, 2.399819, 0, 0.7254902, 1, 1,
0.1351541, -0.8618258, 1.679727, 0, 0.7176471, 1, 1,
0.1358862, -0.2821963, 2.161835, 0, 0.7137255, 1, 1,
0.1426683, 0.1770248, 0.6915585, 0, 0.7058824, 1, 1,
0.1438125, 0.06630082, 1.807872, 0, 0.6980392, 1, 1,
0.1474366, 0.6872326, -0.8862218, 0, 0.6941177, 1, 1,
0.148572, -0.7085883, 2.125691, 0, 0.6862745, 1, 1,
0.1543379, -0.5195587, 3.393214, 0, 0.682353, 1, 1,
0.1555634, -0.2731043, 3.30472, 0, 0.6745098, 1, 1,
0.1576353, -1.631454, 3.018845, 0, 0.6705883, 1, 1,
0.1578834, -0.3413344, 2.719344, 0, 0.6627451, 1, 1,
0.1597741, 0.8807642, 0.2500945, 0, 0.6588235, 1, 1,
0.1623713, -1.074916, 4.448281, 0, 0.6509804, 1, 1,
0.1637303, 1.022864, 0.4913282, 0, 0.6470588, 1, 1,
0.1652217, 0.6836963, 0.2968937, 0, 0.6392157, 1, 1,
0.1692131, -1.293161, 1.176266, 0, 0.6352941, 1, 1,
0.1698939, 0.6996086, 1.197834, 0, 0.627451, 1, 1,
0.1714479, 0.4176937, 1.649846, 0, 0.6235294, 1, 1,
0.182214, 1.035386, -0.1445074, 0, 0.6156863, 1, 1,
0.1843948, -1.210133, 3.593614, 0, 0.6117647, 1, 1,
0.1923906, 0.187237, 1.186115, 0, 0.6039216, 1, 1,
0.1974108, 0.464513, -1.549217, 0, 0.5960785, 1, 1,
0.2013266, -0.04524073, 2.079989, 0, 0.5921569, 1, 1,
0.2013316, 0.5040734, 1.714303, 0, 0.5843138, 1, 1,
0.2028038, 1.642863, 1.102384, 0, 0.5803922, 1, 1,
0.2030469, -1.023894, 1.879245, 0, 0.572549, 1, 1,
0.2036117, 0.6837784, 0.6190125, 0, 0.5686275, 1, 1,
0.2048782, 0.6747392, 0.351695, 0, 0.5607843, 1, 1,
0.2069721, 0.6704792, 0.9434453, 0, 0.5568628, 1, 1,
0.2113331, -2.715022, 2.910133, 0, 0.5490196, 1, 1,
0.2174046, -0.4451704, 1.58478, 0, 0.5450981, 1, 1,
0.2253598, 1.248535, -0.01180876, 0, 0.5372549, 1, 1,
0.2274899, 1.417833, -0.5285836, 0, 0.5333334, 1, 1,
0.2338417, -0.783236, 3.332795, 0, 0.5254902, 1, 1,
0.2343853, 0.2824926, 0.006119366, 0, 0.5215687, 1, 1,
0.2351284, -1.45289, 2.324862, 0, 0.5137255, 1, 1,
0.2379799, 0.6999523, 0.09444384, 0, 0.509804, 1, 1,
0.2438647, -0.5916264, 2.104102, 0, 0.5019608, 1, 1,
0.2447271, 0.8691502, 0.3622444, 0, 0.4941176, 1, 1,
0.2457408, -1.583651, 1.43956, 0, 0.4901961, 1, 1,
0.2534162, 0.4597089, -0.1349585, 0, 0.4823529, 1, 1,
0.2534361, -1.599573, 1.271742, 0, 0.4784314, 1, 1,
0.2541381, -0.9707512, 4.930088, 0, 0.4705882, 1, 1,
0.2558996, 0.3974888, 0.9753325, 0, 0.4666667, 1, 1,
0.2560915, 0.07540496, 1.569723, 0, 0.4588235, 1, 1,
0.2603445, 0.6685482, 0.7298265, 0, 0.454902, 1, 1,
0.2629407, 1.704211, 0.9932529, 0, 0.4470588, 1, 1,
0.2629789, 0.29929, 1.120477, 0, 0.4431373, 1, 1,
0.2655601, -0.1921055, 3.098561, 0, 0.4352941, 1, 1,
0.2668911, -1.56414, 2.198503, 0, 0.4313726, 1, 1,
0.2693445, 0.7676654, 0.8915042, 0, 0.4235294, 1, 1,
0.2710669, -1.271441, 1.859185, 0, 0.4196078, 1, 1,
0.2733858, 0.8118512, 1.432095, 0, 0.4117647, 1, 1,
0.2738762, 0.8697968, 0.4791806, 0, 0.4078431, 1, 1,
0.2756059, -0.5340483, 1.815361, 0, 0.4, 1, 1,
0.2779722, -0.4639451, 1.439283, 0, 0.3921569, 1, 1,
0.2818358, 0.07850126, 1.651822, 0, 0.3882353, 1, 1,
0.2825892, -0.1617372, 2.439443, 0, 0.3803922, 1, 1,
0.2861969, -1.05002, 2.143342, 0, 0.3764706, 1, 1,
0.2873648, 0.664615, 1.423533, 0, 0.3686275, 1, 1,
0.2907563, -1.468806, 3.320524, 0, 0.3647059, 1, 1,
0.2936876, 0.8980073, 1.402524, 0, 0.3568628, 1, 1,
0.3076238, -0.4565364, 1.060316, 0, 0.3529412, 1, 1,
0.3162825, -0.004950607, 1.286569, 0, 0.345098, 1, 1,
0.3170756, -0.5750793, 2.646268, 0, 0.3411765, 1, 1,
0.3198036, -1.062312, 0.7998282, 0, 0.3333333, 1, 1,
0.3209558, 0.4127635, 0.2545566, 0, 0.3294118, 1, 1,
0.3212565, -0.008333972, 1.328915, 0, 0.3215686, 1, 1,
0.322795, 0.4190013, 2.12225, 0, 0.3176471, 1, 1,
0.3231636, 0.3976894, -0.5835748, 0, 0.3098039, 1, 1,
0.3243136, 0.1955237, 1.631236, 0, 0.3058824, 1, 1,
0.3337036, 0.363892, -0.5707364, 0, 0.2980392, 1, 1,
0.3338916, 0.834219, 0.4670978, 0, 0.2901961, 1, 1,
0.3339784, 0.008197475, 0.7195066, 0, 0.2862745, 1, 1,
0.3391392, -1.168337, 2.403401, 0, 0.2784314, 1, 1,
0.3425756, 1.060322, -0.1587278, 0, 0.2745098, 1, 1,
0.3436629, -0.8600657, 3.071859, 0, 0.2666667, 1, 1,
0.3470159, -1.897242, 4.221429, 0, 0.2627451, 1, 1,
0.3552442, 0.1052388, 2.016187, 0, 0.254902, 1, 1,
0.355373, -0.4664, 2.503382, 0, 0.2509804, 1, 1,
0.3617534, 0.5239562, 0.5387453, 0, 0.2431373, 1, 1,
0.368326, -0.01826847, 1.824479, 0, 0.2392157, 1, 1,
0.3725494, 0.1694008, 1.007147, 0, 0.2313726, 1, 1,
0.3759227, 1.237955, 2.032589, 0, 0.227451, 1, 1,
0.3762572, -0.1575464, 1.314299, 0, 0.2196078, 1, 1,
0.3802884, 0.06481049, 1.97131, 0, 0.2156863, 1, 1,
0.3812089, 0.6548738, 0.53035, 0, 0.2078431, 1, 1,
0.3813166, 1.049715, 0.5589525, 0, 0.2039216, 1, 1,
0.3821399, 0.7655522, -0.4577565, 0, 0.1960784, 1, 1,
0.389886, 0.6504368, -1.65899, 0, 0.1882353, 1, 1,
0.3912047, -0.178958, 2.549936, 0, 0.1843137, 1, 1,
0.392095, 1.412005, 0.461888, 0, 0.1764706, 1, 1,
0.3948964, 0.9655386, -0.7974472, 0, 0.172549, 1, 1,
0.3954615, -1.062926, 2.161515, 0, 0.1647059, 1, 1,
0.4017716, -0.2582544, 2.199883, 0, 0.1607843, 1, 1,
0.4115644, 0.4218841, 3.054255, 0, 0.1529412, 1, 1,
0.4118679, -0.5262891, 2.583481, 0, 0.1490196, 1, 1,
0.4140004, 0.5302329, 1.71763, 0, 0.1411765, 1, 1,
0.4146052, 1.090798, -0.6428908, 0, 0.1372549, 1, 1,
0.4155829, 1.860899, 0.4028855, 0, 0.1294118, 1, 1,
0.4191318, -0.9790069, 2.280772, 0, 0.1254902, 1, 1,
0.4247656, -0.4957615, 1.397195, 0, 0.1176471, 1, 1,
0.4248628, 0.5729214, 0.5740963, 0, 0.1137255, 1, 1,
0.4304445, 1.52308, 1.29168, 0, 0.1058824, 1, 1,
0.4306665, 0.8203062, 2.008449, 0, 0.09803922, 1, 1,
0.431224, -1.004529, 2.040067, 0, 0.09411765, 1, 1,
0.4359221, 0.9921407, 0.3679339, 0, 0.08627451, 1, 1,
0.4360567, -0.7711744, 1.342096, 0, 0.08235294, 1, 1,
0.4409365, -0.3839864, 3.428652, 0, 0.07450981, 1, 1,
0.4424357, 1.553024, 0.5450728, 0, 0.07058824, 1, 1,
0.4459785, 0.8003331, 0.1786596, 0, 0.0627451, 1, 1,
0.4513707, 0.5440605, 1.24581, 0, 0.05882353, 1, 1,
0.4541829, 0.1809191, 1.999656, 0, 0.05098039, 1, 1,
0.4569197, -0.8662958, 2.974637, 0, 0.04705882, 1, 1,
0.4628802, -0.8812306, 2.507928, 0, 0.03921569, 1, 1,
0.4662203, 1.516911, 0.3345619, 0, 0.03529412, 1, 1,
0.4666499, -0.4851771, 2.635597, 0, 0.02745098, 1, 1,
0.4669875, 0.9658229, 0.1022243, 0, 0.02352941, 1, 1,
0.4699941, 0.152853, 1.342736, 0, 0.01568628, 1, 1,
0.4769575, 0.04756717, 1.207725, 0, 0.01176471, 1, 1,
0.4835477, 0.1393119, -0.1414748, 0, 0.003921569, 1, 1,
0.4893839, 1.412649, 1.572646, 0.003921569, 0, 1, 1,
0.4899712, -0.2213842, 0.7076481, 0.007843138, 0, 1, 1,
0.4917043, 0.08670026, 2.022179, 0.01568628, 0, 1, 1,
0.4968525, 0.6603618, -0.05208075, 0.01960784, 0, 1, 1,
0.5017712, -1.928211, 1.825787, 0.02745098, 0, 1, 1,
0.5027342, -0.5446111, 1.882959, 0.03137255, 0, 1, 1,
0.5061325, 0.7774895, 1.760213, 0.03921569, 0, 1, 1,
0.5069095, 0.6075477, 1.572369, 0.04313726, 0, 1, 1,
0.5095512, -0.3949446, 1.204868, 0.05098039, 0, 1, 1,
0.5109124, -0.5452051, 3.540116, 0.05490196, 0, 1, 1,
0.5137463, 0.05361566, 0.9986761, 0.0627451, 0, 1, 1,
0.5144155, -0.6866457, 3.033714, 0.06666667, 0, 1, 1,
0.5160689, -0.3338541, 2.076493, 0.07450981, 0, 1, 1,
0.5175034, 1.220396, 0.003829201, 0.07843138, 0, 1, 1,
0.5183097, -0.635855, 3.266951, 0.08627451, 0, 1, 1,
0.5207257, -0.13383, 1.353518, 0.09019608, 0, 1, 1,
0.5209303, -0.2729398, 1.817876, 0.09803922, 0, 1, 1,
0.5311772, -0.6583794, -0.6875194, 0.1058824, 0, 1, 1,
0.5314912, -1.13344, 1.896144, 0.1098039, 0, 1, 1,
0.5341983, -1.044464, 1.835756, 0.1176471, 0, 1, 1,
0.5350947, -0.6260949, 1.154325, 0.1215686, 0, 1, 1,
0.5377396, -0.6140779, 5.08327, 0.1294118, 0, 1, 1,
0.5382761, -1.07678, 2.873747, 0.1333333, 0, 1, 1,
0.541153, 0.5753642, 0.7946581, 0.1411765, 0, 1, 1,
0.5424061, 0.4055961, 0.917004, 0.145098, 0, 1, 1,
0.5508521, -0.111004, 3.380652, 0.1529412, 0, 1, 1,
0.5580148, 0.5744079, 1.338497, 0.1568628, 0, 1, 1,
0.5616654, -1.480011, 3.897891, 0.1647059, 0, 1, 1,
0.5636076, 0.1756008, 0.9752033, 0.1686275, 0, 1, 1,
0.5651165, -1.02343, 2.449542, 0.1764706, 0, 1, 1,
0.5670388, 0.7231277, 0.2065819, 0.1803922, 0, 1, 1,
0.5674295, -0.481816, 1.319809, 0.1882353, 0, 1, 1,
0.5689839, 0.01225844, 1.643419, 0.1921569, 0, 1, 1,
0.5696162, 0.1129418, -0.6774079, 0.2, 0, 1, 1,
0.570552, 0.07817475, 1.699135, 0.2078431, 0, 1, 1,
0.5727085, -1.585603, 3.179975, 0.2117647, 0, 1, 1,
0.5755951, 1.263394, -0.5626295, 0.2196078, 0, 1, 1,
0.577782, -0.3298355, 1.235535, 0.2235294, 0, 1, 1,
0.5830407, -0.1012424, 2.304183, 0.2313726, 0, 1, 1,
0.5856697, 0.4649855, 3.45521, 0.2352941, 0, 1, 1,
0.5881833, 0.5066793, -0.04610557, 0.2431373, 0, 1, 1,
0.5909424, 1.833123, 1.367161, 0.2470588, 0, 1, 1,
0.5941547, 0.5626191, 0.1827899, 0.254902, 0, 1, 1,
0.5979818, 0.5388008, 0.5899062, 0.2588235, 0, 1, 1,
0.6017431, 0.8814185, -0.1067224, 0.2666667, 0, 1, 1,
0.6054233, 0.1103676, 0.9318575, 0.2705882, 0, 1, 1,
0.6061958, -1.003097, 3.859263, 0.2784314, 0, 1, 1,
0.6106218, 0.6265143, 2.539558, 0.282353, 0, 1, 1,
0.6117697, -0.8969846, 3.550721, 0.2901961, 0, 1, 1,
0.6162285, 0.3871055, 0.1628544, 0.2941177, 0, 1, 1,
0.6176208, 0.5943549, 0.2071758, 0.3019608, 0, 1, 1,
0.6209437, -1.563021, 3.299511, 0.3098039, 0, 1, 1,
0.6234018, -3.064628, 3.465947, 0.3137255, 0, 1, 1,
0.6269845, -0.07575332, 2.525326, 0.3215686, 0, 1, 1,
0.6296151, 0.6660419, 2.064177, 0.3254902, 0, 1, 1,
0.633275, 0.1286393, 1.644807, 0.3333333, 0, 1, 1,
0.6385701, -0.4792099, 1.736488, 0.3372549, 0, 1, 1,
0.6387737, 1.193135, 1.82768, 0.345098, 0, 1, 1,
0.6407239, -1.80514, 0.3567714, 0.3490196, 0, 1, 1,
0.6440668, -0.9271124, 2.040775, 0.3568628, 0, 1, 1,
0.6449127, 0.2050688, 1.250874, 0.3607843, 0, 1, 1,
0.6468416, 1.069906, -0.4904729, 0.3686275, 0, 1, 1,
0.6473742, 0.6107126, 1.160832, 0.372549, 0, 1, 1,
0.6483617, 1.059358, 0.8591707, 0.3803922, 0, 1, 1,
0.6508784, 1.096333, 0.8247564, 0.3843137, 0, 1, 1,
0.6523863, 1.56565, 2.093641, 0.3921569, 0, 1, 1,
0.6587111, -0.2297395, 1.118567, 0.3960784, 0, 1, 1,
0.6589137, 0.4802545, 1.143977, 0.4039216, 0, 1, 1,
0.66121, 1.446694, 1.168622, 0.4117647, 0, 1, 1,
0.6677903, 0.3582116, 0.7114652, 0.4156863, 0, 1, 1,
0.6757305, -1.135439, 2.08068, 0.4235294, 0, 1, 1,
0.6798044, 0.7345836, 0.8912683, 0.427451, 0, 1, 1,
0.6818975, 1.632921, 0.1401607, 0.4352941, 0, 1, 1,
0.6822487, 0.3371372, -0.2614402, 0.4392157, 0, 1, 1,
0.6845837, 0.84982, 0.9261359, 0.4470588, 0, 1, 1,
0.6896983, 0.06616002, 1.473639, 0.4509804, 0, 1, 1,
0.6899592, 1.485158, 0.4460238, 0.4588235, 0, 1, 1,
0.6953685, 0.2871107, 1.137208, 0.4627451, 0, 1, 1,
0.6957201, 0.1968855, 3.598106, 0.4705882, 0, 1, 1,
0.698456, 0.129646, 1.659049, 0.4745098, 0, 1, 1,
0.7049032, 1.154818, -2.749183, 0.4823529, 0, 1, 1,
0.7049198, 0.4336915, 0.1849852, 0.4862745, 0, 1, 1,
0.7065071, 0.16166, 2.790338, 0.4941176, 0, 1, 1,
0.7069329, -0.447836, 0.5160443, 0.5019608, 0, 1, 1,
0.7103867, -0.8917795, 1.801825, 0.5058824, 0, 1, 1,
0.7174527, 0.3830336, 0.0526589, 0.5137255, 0, 1, 1,
0.7201737, -1.156267, 2.993774, 0.5176471, 0, 1, 1,
0.7222803, 0.5990205, -0.002934526, 0.5254902, 0, 1, 1,
0.7228984, 1.021176, 0.7439871, 0.5294118, 0, 1, 1,
0.7261165, 1.693473, -0.8362462, 0.5372549, 0, 1, 1,
0.7289951, -1.289184, 1.634434, 0.5411765, 0, 1, 1,
0.7323819, 0.3611956, 2.057724, 0.5490196, 0, 1, 1,
0.7387614, -0.7655079, 2.106008, 0.5529412, 0, 1, 1,
0.7400561, -0.9714769, 1.557381, 0.5607843, 0, 1, 1,
0.7439703, 0.3128801, 1.167455, 0.5647059, 0, 1, 1,
0.7458814, -0.5789502, 1.056248, 0.572549, 0, 1, 1,
0.7464488, 0.579542, -0.06375463, 0.5764706, 0, 1, 1,
0.7483455, 0.2851618, 1.914194, 0.5843138, 0, 1, 1,
0.7546983, -0.0756927, 2.973679, 0.5882353, 0, 1, 1,
0.7580174, -0.6180219, 1.435623, 0.5960785, 0, 1, 1,
0.7599599, -0.5510897, 0.8403077, 0.6039216, 0, 1, 1,
0.7631044, 0.9852539, 1.05186, 0.6078432, 0, 1, 1,
0.7651836, 0.1661924, 2.182391, 0.6156863, 0, 1, 1,
0.7673653, 1.425704, -1.573316, 0.6196079, 0, 1, 1,
0.7685435, -0.2521967, 4.03815, 0.627451, 0, 1, 1,
0.7686419, -0.9278287, 0.9337343, 0.6313726, 0, 1, 1,
0.7701151, -1.140384, 2.548567, 0.6392157, 0, 1, 1,
0.7729269, -0.1293254, 2.54445, 0.6431373, 0, 1, 1,
0.7754875, -1.987158, 5.449907, 0.6509804, 0, 1, 1,
0.7820266, -0.6524276, 1.769131, 0.654902, 0, 1, 1,
0.7825202, 0.4494332, 3.373362, 0.6627451, 0, 1, 1,
0.7849583, 0.8047181, -0.4778423, 0.6666667, 0, 1, 1,
0.7862571, -0.9525095, 2.152073, 0.6745098, 0, 1, 1,
0.7900189, 0.2539423, 0.8922281, 0.6784314, 0, 1, 1,
0.7927659, 1.386083, 2.124802, 0.6862745, 0, 1, 1,
0.795878, -0.02475342, 3.430042, 0.6901961, 0, 1, 1,
0.79591, 1.146858, 0.9508151, 0.6980392, 0, 1, 1,
0.8157794, -1.285214, 2.377383, 0.7058824, 0, 1, 1,
0.8197944, 0.4862129, 0.362664, 0.7098039, 0, 1, 1,
0.8248516, -1.746629, 1.677036, 0.7176471, 0, 1, 1,
0.829169, 0.4190201, 0.3325419, 0.7215686, 0, 1, 1,
0.8395664, 1.231989, 0.9998182, 0.7294118, 0, 1, 1,
0.8429725, 0.249755, 3.009433, 0.7333333, 0, 1, 1,
0.8433151, 0.3312002, 2.134952, 0.7411765, 0, 1, 1,
0.8457024, 1.022613, -0.4113935, 0.7450981, 0, 1, 1,
0.8477217, 0.3922469, 1.771696, 0.7529412, 0, 1, 1,
0.8494784, 0.5999044, 0.9971277, 0.7568628, 0, 1, 1,
0.8501561, 1.116861, 2.357254, 0.7647059, 0, 1, 1,
0.8532822, 1.415694, -0.8882809, 0.7686275, 0, 1, 1,
0.8539313, -0.614686, 3.536914, 0.7764706, 0, 1, 1,
0.8652017, -0.293108, 2.356628, 0.7803922, 0, 1, 1,
0.8733412, -1.004436, 2.692387, 0.7882353, 0, 1, 1,
0.8754628, 0.179438, 2.987335, 0.7921569, 0, 1, 1,
0.8829123, -0.5231974, 1.674577, 0.8, 0, 1, 1,
0.8848706, 1.248376, 0.9078808, 0.8078431, 0, 1, 1,
0.8864351, -1.057076, 1.820455, 0.8117647, 0, 1, 1,
0.8869686, 0.7241021, 0.9625865, 0.8196079, 0, 1, 1,
0.8875399, -1.015282, 3.986997, 0.8235294, 0, 1, 1,
0.8945156, 2.27672, 1.464893, 0.8313726, 0, 1, 1,
0.8955912, 3.191486, 1.014182, 0.8352941, 0, 1, 1,
0.8960755, 0.47811, 0.8289966, 0.8431373, 0, 1, 1,
0.8967368, 0.5138747, -0.7932876, 0.8470588, 0, 1, 1,
0.9036867, -0.04483685, -0.4770698, 0.854902, 0, 1, 1,
0.9046522, -0.8637063, 1.008308, 0.8588235, 0, 1, 1,
0.9119748, -0.7573949, 1.466534, 0.8666667, 0, 1, 1,
0.9137747, -1.865632, 4.297616, 0.8705882, 0, 1, 1,
0.9138834, 1.986737, 1.437003, 0.8784314, 0, 1, 1,
0.9186031, -1.440733, 2.451597, 0.8823529, 0, 1, 1,
0.9219095, 0.778704, 2.272079, 0.8901961, 0, 1, 1,
0.9228288, -0.5663207, 1.65974, 0.8941177, 0, 1, 1,
0.9230976, -1.149441, 0.5970812, 0.9019608, 0, 1, 1,
0.924436, 1.038721, 1.77283, 0.9098039, 0, 1, 1,
0.9251613, -0.4503216, 1.521334, 0.9137255, 0, 1, 1,
0.9277295, -0.061469, 1.890465, 0.9215686, 0, 1, 1,
0.9291775, 0.5242811, 0.5337501, 0.9254902, 0, 1, 1,
0.9331034, -0.1855991, 1.831958, 0.9333333, 0, 1, 1,
0.9353835, 2.188666, 0.439489, 0.9372549, 0, 1, 1,
0.9380899, 0.5373242, 1.972102, 0.945098, 0, 1, 1,
0.9398735, 0.8378954, -0.143884, 0.9490196, 0, 1, 1,
0.9406682, -0.6342718, 1.142444, 0.9568627, 0, 1, 1,
0.9469998, -0.8946877, 3.126212, 0.9607843, 0, 1, 1,
0.950834, -1.817472, 3.239206, 0.9686275, 0, 1, 1,
0.9562874, 0.5066873, 1.154359, 0.972549, 0, 1, 1,
0.9620425, -0.7761866, 4.250769, 0.9803922, 0, 1, 1,
0.9629552, -0.2655659, 2.010104, 0.9843137, 0, 1, 1,
0.9704391, -0.7793268, 0.8115221, 0.9921569, 0, 1, 1,
0.9711101, -0.1024646, 1.621928, 0.9960784, 0, 1, 1,
0.9714037, 1.033204, 2.493032, 1, 0, 0.9960784, 1,
0.9757078, 1.569649, -1.045006, 1, 0, 0.9882353, 1,
0.9763156, -0.7219942, 2.817247, 1, 0, 0.9843137, 1,
0.9770007, -1.021304, 2.383669, 1, 0, 0.9764706, 1,
0.9801405, -1.055375, 1.382592, 1, 0, 0.972549, 1,
0.9845397, 0.1350028, 2.834059, 1, 0, 0.9647059, 1,
0.9845591, -2.240181, 1.958104, 1, 0, 0.9607843, 1,
0.9849187, -0.8155541, 2.170858, 1, 0, 0.9529412, 1,
0.9900236, -0.603856, 1.496832, 1, 0, 0.9490196, 1,
0.9901996, 0.03178099, -0.4342983, 1, 0, 0.9411765, 1,
0.9985445, 1.15616, 0.1763102, 1, 0, 0.9372549, 1,
0.9991376, -0.6131293, 3.160592, 1, 0, 0.9294118, 1,
1.002427, -0.5621569, 2.415657, 1, 0, 0.9254902, 1,
1.007388, 1.098982, 0.9325446, 1, 0, 0.9176471, 1,
1.019128, -3.550753, 3.335527, 1, 0, 0.9137255, 1,
1.020751, 0.7143224, 3.001844, 1, 0, 0.9058824, 1,
1.023031, -0.9950746, 1.995234, 1, 0, 0.9019608, 1,
1.028853, 0.7323042, -0.1181412, 1, 0, 0.8941177, 1,
1.03527, -0.6488769, 2.434019, 1, 0, 0.8862745, 1,
1.039966, 1.229624, 0.4702644, 1, 0, 0.8823529, 1,
1.044231, 0.4483231, 1.058925, 1, 0, 0.8745098, 1,
1.046384, -0.8132511, 2.266649, 1, 0, 0.8705882, 1,
1.047222, 1.006555, 1.627037, 1, 0, 0.8627451, 1,
1.047409, 0.5774459, 1.335159, 1, 0, 0.8588235, 1,
1.048907, -0.8486557, 1.439266, 1, 0, 0.8509804, 1,
1.050688, 1.269332, -1.488334, 1, 0, 0.8470588, 1,
1.061312, 0.5361494, 1.394348, 1, 0, 0.8392157, 1,
1.082826, 1.1717, -1.059564, 1, 0, 0.8352941, 1,
1.088691, -0.612464, 0.9395964, 1, 0, 0.827451, 1,
1.089409, 1.167845, -0.1052086, 1, 0, 0.8235294, 1,
1.090225, -0.1255406, 1.172574, 1, 0, 0.8156863, 1,
1.090447, 0.3773904, 2.281638, 1, 0, 0.8117647, 1,
1.091558, 1.285309, 1.523172, 1, 0, 0.8039216, 1,
1.093925, 0.5900966, -0.4026605, 1, 0, 0.7960784, 1,
1.105357, -1.602716, 2.526775, 1, 0, 0.7921569, 1,
1.109888, -0.2477186, 1.049526, 1, 0, 0.7843137, 1,
1.119976, -0.1447368, 2.835272, 1, 0, 0.7803922, 1,
1.123606, -0.916831, 2.931417, 1, 0, 0.772549, 1,
1.130988, -1.97773, 1.816129, 1, 0, 0.7686275, 1,
1.140984, -0.3899684, 1.056951, 1, 0, 0.7607843, 1,
1.15496, 0.4184795, 1.711558, 1, 0, 0.7568628, 1,
1.155317, 0.7729444, 0.2765646, 1, 0, 0.7490196, 1,
1.155451, 1.108253, 0.736718, 1, 0, 0.7450981, 1,
1.166551, 0.9831597, 0.4284341, 1, 0, 0.7372549, 1,
1.170718, -0.9908764, 1.177634, 1, 0, 0.7333333, 1,
1.174178, -0.0716323, 4.311266, 1, 0, 0.7254902, 1,
1.183297, 0.2047848, 3.180616, 1, 0, 0.7215686, 1,
1.184511, 0.1000241, 1.327781, 1, 0, 0.7137255, 1,
1.184648, 0.1539831, 0.6287969, 1, 0, 0.7098039, 1,
1.192083, -1.036382, 3.383305, 1, 0, 0.7019608, 1,
1.193135, -0.92881, 2.06574, 1, 0, 0.6941177, 1,
1.194927, -0.2824301, 3.57495, 1, 0, 0.6901961, 1,
1.200149, 0.5036902, 1.401269, 1, 0, 0.682353, 1,
1.200171, 0.08381719, 0.5916947, 1, 0, 0.6784314, 1,
1.202001, 0.1264572, 1.729066, 1, 0, 0.6705883, 1,
1.203897, -0.2267603, 2.768188, 1, 0, 0.6666667, 1,
1.21066, -0.3873405, 1.967461, 1, 0, 0.6588235, 1,
1.226364, 1.049368, 1.631998, 1, 0, 0.654902, 1,
1.249882, 0.1253537, 1.556529, 1, 0, 0.6470588, 1,
1.252757, -0.2362553, 2.643136, 1, 0, 0.6431373, 1,
1.264838, -0.5312017, 2.468595, 1, 0, 0.6352941, 1,
1.268379, 0.3563865, 2.079739, 1, 0, 0.6313726, 1,
1.268663, -1.193549, 3.798536, 1, 0, 0.6235294, 1,
1.270973, -2.146061, 3.42545, 1, 0, 0.6196079, 1,
1.287276, 1.066779, 0.1489214, 1, 0, 0.6117647, 1,
1.288417, 1.087025, 0.1877545, 1, 0, 0.6078432, 1,
1.303123, 1.392846, 0.8141046, 1, 0, 0.6, 1,
1.303589, -0.131738, 3.20358, 1, 0, 0.5921569, 1,
1.307506, -0.8744605, 4.423386, 1, 0, 0.5882353, 1,
1.310451, -1.608305, 2.083575, 1, 0, 0.5803922, 1,
1.319582, -2.285858, 1.687205, 1, 0, 0.5764706, 1,
1.323135, -0.6872033, 2.417054, 1, 0, 0.5686275, 1,
1.329877, -0.2280669, 2.261709, 1, 0, 0.5647059, 1,
1.330846, -0.1217509, 1.141456, 1, 0, 0.5568628, 1,
1.33286, 0.6087308, 1.565577, 1, 0, 0.5529412, 1,
1.33565, 0.9219313, -0.5698398, 1, 0, 0.5450981, 1,
1.343184, 1.227401, -0.7394968, 1, 0, 0.5411765, 1,
1.343324, 0.9199742, 3.058716, 1, 0, 0.5333334, 1,
1.354454, -1.231428, 2.144121, 1, 0, 0.5294118, 1,
1.355207, 2.27001, -0.3535064, 1, 0, 0.5215687, 1,
1.361329, 2.387417, 0.3668947, 1, 0, 0.5176471, 1,
1.362828, -2.377748, 1.458456, 1, 0, 0.509804, 1,
1.373284, 0.3784635, 2.444944, 1, 0, 0.5058824, 1,
1.37409, 0.8895713, 1.195398, 1, 0, 0.4980392, 1,
1.382399, -2.310217, 2.0954, 1, 0, 0.4901961, 1,
1.385064, -2.697455, 1.431205, 1, 0, 0.4862745, 1,
1.389973, 0.6674157, 0.03356415, 1, 0, 0.4784314, 1,
1.401478, 0.2478703, 2.285031, 1, 0, 0.4745098, 1,
1.409936, -1.273022, 2.952092, 1, 0, 0.4666667, 1,
1.416862, 0.7511535, 1.542715, 1, 0, 0.4627451, 1,
1.426897, -0.4595828, 0.5736526, 1, 0, 0.454902, 1,
1.442449, 1.13545, -0.5945058, 1, 0, 0.4509804, 1,
1.447386, 1.497185, 1.904217, 1, 0, 0.4431373, 1,
1.448408, 2.345865, -1.669568, 1, 0, 0.4392157, 1,
1.450481, 1.424261, 1.67978, 1, 0, 0.4313726, 1,
1.463229, -0.1249022, -0.5388421, 1, 0, 0.427451, 1,
1.466127, -0.05156443, 2.384558, 1, 0, 0.4196078, 1,
1.489642, 0.2299091, 1.626397, 1, 0, 0.4156863, 1,
1.507767, 1.212149, 0.0702819, 1, 0, 0.4078431, 1,
1.509804, -0.4374255, 1.857257, 1, 0, 0.4039216, 1,
1.512776, 1.512984, 0.7684476, 1, 0, 0.3960784, 1,
1.514166, -0.5434434, 1.43282, 1, 0, 0.3882353, 1,
1.51627, 0.1328043, 1.342883, 1, 0, 0.3843137, 1,
1.521316, -1.266779, 1.090328, 1, 0, 0.3764706, 1,
1.530713, 1.11138, 0.5469036, 1, 0, 0.372549, 1,
1.538337, -0.5445457, 1.01462, 1, 0, 0.3647059, 1,
1.545184, -0.8062159, 0.05250256, 1, 0, 0.3607843, 1,
1.545825, 1.121903, 1.987853, 1, 0, 0.3529412, 1,
1.55203, -0.2577986, 3.223451, 1, 0, 0.3490196, 1,
1.565653, 1.206834, 0.5716432, 1, 0, 0.3411765, 1,
1.597053, 0.03948019, 1.506093, 1, 0, 0.3372549, 1,
1.598617, -1.66018, 3.68281, 1, 0, 0.3294118, 1,
1.611948, -1.415589, 3.855385, 1, 0, 0.3254902, 1,
1.630822, 0.1960579, 3.776513, 1, 0, 0.3176471, 1,
1.63531, 0.6919377, 0.5439609, 1, 0, 0.3137255, 1,
1.648112, 1.831376, -0.7294763, 1, 0, 0.3058824, 1,
1.654276, 0.4423133, 0.005117008, 1, 0, 0.2980392, 1,
1.657498, -0.8465261, 2.778711, 1, 0, 0.2941177, 1,
1.658249, -0.6413393, 3.976576, 1, 0, 0.2862745, 1,
1.660807, -0.8847379, 3.491307, 1, 0, 0.282353, 1,
1.66328, 0.1801799, 1.331362, 1, 0, 0.2745098, 1,
1.674821, 0.2437543, 2.106573, 1, 0, 0.2705882, 1,
1.675655, 0.8005324, 1.065682, 1, 0, 0.2627451, 1,
1.689681, -0.5423849, 1.95114, 1, 0, 0.2588235, 1,
1.69021, -0.01259549, 1.255639, 1, 0, 0.2509804, 1,
1.690565, -0.1819183, -0.0917141, 1, 0, 0.2470588, 1,
1.697295, 0.3670928, 2.581785, 1, 0, 0.2392157, 1,
1.700268, 0.8565012, 1.820618, 1, 0, 0.2352941, 1,
1.709575, 1.129758, 0.529341, 1, 0, 0.227451, 1,
1.728217, 0.7839166, 1.340903, 1, 0, 0.2235294, 1,
1.729856, -1.963815, 1.05151, 1, 0, 0.2156863, 1,
1.730819, 2.576116, -0.2489759, 1, 0, 0.2117647, 1,
1.733276, 0.06914313, 1.650416, 1, 0, 0.2039216, 1,
1.758183, -1.488712, 2.56131, 1, 0, 0.1960784, 1,
1.765624, -0.2477306, 2.74896, 1, 0, 0.1921569, 1,
1.769328, -1.776893, 2.334461, 1, 0, 0.1843137, 1,
1.771808, -0.04050163, 2.469663, 1, 0, 0.1803922, 1,
1.773601, 1.89979, 2.248419, 1, 0, 0.172549, 1,
1.779371, 2.150629, -1.450622, 1, 0, 0.1686275, 1,
1.784446, -0.09442102, 3.446149, 1, 0, 0.1607843, 1,
1.805355, -0.8628768, -0.4506288, 1, 0, 0.1568628, 1,
1.807374, 0.8833774, -0.2927639, 1, 0, 0.1490196, 1,
1.807911, 0.2378553, 0.6444751, 1, 0, 0.145098, 1,
1.818386, 2.465419, -0.827121, 1, 0, 0.1372549, 1,
1.821505, 0.2640118, -0.7146904, 1, 0, 0.1333333, 1,
1.826201, 0.2362784, 2.179482, 1, 0, 0.1254902, 1,
1.881998, -0.07227334, 1.099072, 1, 0, 0.1215686, 1,
1.885415, 1.451443, -0.3351695, 1, 0, 0.1137255, 1,
1.88648, -1.354002, 1.478433, 1, 0, 0.1098039, 1,
1.919906, 1.105777, 0.9666255, 1, 0, 0.1019608, 1,
1.944788, 0.08245575, 1.014919, 1, 0, 0.09411765, 1,
1.952607, -0.4480959, 2.027333, 1, 0, 0.09019608, 1,
1.967583, -0.5329123, 2.566092, 1, 0, 0.08235294, 1,
1.97682, -0.1876354, 0.6033562, 1, 0, 0.07843138, 1,
1.999673, -0.7146378, 1.152858, 1, 0, 0.07058824, 1,
2.034261, -0.8321598, 2.074159, 1, 0, 0.06666667, 1,
2.039352, 1.349014, 1.53235, 1, 0, 0.05882353, 1,
2.125347, -1.271187, 1.907796, 1, 0, 0.05490196, 1,
2.147849, 0.1345724, 2.540644, 1, 0, 0.04705882, 1,
2.26574, -0.1190968, 1.911224, 1, 0, 0.04313726, 1,
2.297205, -2.163491, 2.185739, 1, 0, 0.03529412, 1,
2.362624, 1.345656, 0.8343231, 1, 0, 0.03137255, 1,
2.431329, -1.482198, 0.5536531, 1, 0, 0.02352941, 1,
2.486165, -1.342911, 1.71164, 1, 0, 0.01960784, 1,
2.676748, 0.3493689, 1.032394, 1, 0, 0.01176471, 1,
3.665982, 0.6435541, 0.804578, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
0.2304081, -4.70777, -6.920801, 0, -0.5, 0.5, 0.5,
0.2304081, -4.70777, -6.920801, 1, -0.5, 0.5, 0.5,
0.2304081, -4.70777, -6.920801, 1, 1.5, 0.5, 0.5,
0.2304081, -4.70777, -6.920801, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.369826, -0.1377218, -6.920801, 0, -0.5, 0.5, 0.5,
-4.369826, -0.1377218, -6.920801, 1, -0.5, 0.5, 0.5,
-4.369826, -0.1377218, -6.920801, 1, 1.5, 0.5, 0.5,
-4.369826, -0.1377218, -6.920801, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.369826, -4.70777, 0.1610196, 0, -0.5, 0.5, 0.5,
-4.369826, -4.70777, 0.1610196, 1, -0.5, 0.5, 0.5,
-4.369826, -4.70777, 0.1610196, 1, 1.5, 0.5, 0.5,
-4.369826, -4.70777, 0.1610196, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-3, -3.653144, -5.286534,
3, -3.653144, -5.286534,
-3, -3.653144, -5.286534,
-3, -3.828915, -5.558912,
-2, -3.653144, -5.286534,
-2, -3.828915, -5.558912,
-1, -3.653144, -5.286534,
-1, -3.828915, -5.558912,
0, -3.653144, -5.286534,
0, -3.828915, -5.558912,
1, -3.653144, -5.286534,
1, -3.828915, -5.558912,
2, -3.653144, -5.286534,
2, -3.828915, -5.558912,
3, -3.653144, -5.286534,
3, -3.828915, -5.558912
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3, -4.180457, -6.103667, 0, -0.5, 0.5, 0.5,
-3, -4.180457, -6.103667, 1, -0.5, 0.5, 0.5,
-3, -4.180457, -6.103667, 1, 1.5, 0.5, 0.5,
-3, -4.180457, -6.103667, 0, 1.5, 0.5, 0.5,
-2, -4.180457, -6.103667, 0, -0.5, 0.5, 0.5,
-2, -4.180457, -6.103667, 1, -0.5, 0.5, 0.5,
-2, -4.180457, -6.103667, 1, 1.5, 0.5, 0.5,
-2, -4.180457, -6.103667, 0, 1.5, 0.5, 0.5,
-1, -4.180457, -6.103667, 0, -0.5, 0.5, 0.5,
-1, -4.180457, -6.103667, 1, -0.5, 0.5, 0.5,
-1, -4.180457, -6.103667, 1, 1.5, 0.5, 0.5,
-1, -4.180457, -6.103667, 0, 1.5, 0.5, 0.5,
0, -4.180457, -6.103667, 0, -0.5, 0.5, 0.5,
0, -4.180457, -6.103667, 1, -0.5, 0.5, 0.5,
0, -4.180457, -6.103667, 1, 1.5, 0.5, 0.5,
0, -4.180457, -6.103667, 0, 1.5, 0.5, 0.5,
1, -4.180457, -6.103667, 0, -0.5, 0.5, 0.5,
1, -4.180457, -6.103667, 1, -0.5, 0.5, 0.5,
1, -4.180457, -6.103667, 1, 1.5, 0.5, 0.5,
1, -4.180457, -6.103667, 0, 1.5, 0.5, 0.5,
2, -4.180457, -6.103667, 0, -0.5, 0.5, 0.5,
2, -4.180457, -6.103667, 1, -0.5, 0.5, 0.5,
2, -4.180457, -6.103667, 1, 1.5, 0.5, 0.5,
2, -4.180457, -6.103667, 0, 1.5, 0.5, 0.5,
3, -4.180457, -6.103667, 0, -0.5, 0.5, 0.5,
3, -4.180457, -6.103667, 1, -0.5, 0.5, 0.5,
3, -4.180457, -6.103667, 1, 1.5, 0.5, 0.5,
3, -4.180457, -6.103667, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.308233, -3, -5.286534,
-3.308233, 3, -5.286534,
-3.308233, -3, -5.286534,
-3.485166, -3, -5.558912,
-3.308233, -2, -5.286534,
-3.485166, -2, -5.558912,
-3.308233, -1, -5.286534,
-3.485166, -1, -5.558912,
-3.308233, 0, -5.286534,
-3.485166, 0, -5.558912,
-3.308233, 1, -5.286534,
-3.485166, 1, -5.558912,
-3.308233, 2, -5.286534,
-3.485166, 2, -5.558912,
-3.308233, 3, -5.286534,
-3.485166, 3, -5.558912
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.83903, -3, -6.103667, 0, -0.5, 0.5, 0.5,
-3.83903, -3, -6.103667, 1, -0.5, 0.5, 0.5,
-3.83903, -3, -6.103667, 1, 1.5, 0.5, 0.5,
-3.83903, -3, -6.103667, 0, 1.5, 0.5, 0.5,
-3.83903, -2, -6.103667, 0, -0.5, 0.5, 0.5,
-3.83903, -2, -6.103667, 1, -0.5, 0.5, 0.5,
-3.83903, -2, -6.103667, 1, 1.5, 0.5, 0.5,
-3.83903, -2, -6.103667, 0, 1.5, 0.5, 0.5,
-3.83903, -1, -6.103667, 0, -0.5, 0.5, 0.5,
-3.83903, -1, -6.103667, 1, -0.5, 0.5, 0.5,
-3.83903, -1, -6.103667, 1, 1.5, 0.5, 0.5,
-3.83903, -1, -6.103667, 0, 1.5, 0.5, 0.5,
-3.83903, 0, -6.103667, 0, -0.5, 0.5, 0.5,
-3.83903, 0, -6.103667, 1, -0.5, 0.5, 0.5,
-3.83903, 0, -6.103667, 1, 1.5, 0.5, 0.5,
-3.83903, 0, -6.103667, 0, 1.5, 0.5, 0.5,
-3.83903, 1, -6.103667, 0, -0.5, 0.5, 0.5,
-3.83903, 1, -6.103667, 1, -0.5, 0.5, 0.5,
-3.83903, 1, -6.103667, 1, 1.5, 0.5, 0.5,
-3.83903, 1, -6.103667, 0, 1.5, 0.5, 0.5,
-3.83903, 2, -6.103667, 0, -0.5, 0.5, 0.5,
-3.83903, 2, -6.103667, 1, -0.5, 0.5, 0.5,
-3.83903, 2, -6.103667, 1, 1.5, 0.5, 0.5,
-3.83903, 2, -6.103667, 0, 1.5, 0.5, 0.5,
-3.83903, 3, -6.103667, 0, -0.5, 0.5, 0.5,
-3.83903, 3, -6.103667, 1, -0.5, 0.5, 0.5,
-3.83903, 3, -6.103667, 1, 1.5, 0.5, 0.5,
-3.83903, 3, -6.103667, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.308233, -3.653144, -4,
-3.308233, -3.653144, 4,
-3.308233, -3.653144, -4,
-3.485166, -3.828915, -4,
-3.308233, -3.653144, -2,
-3.485166, -3.828915, -2,
-3.308233, -3.653144, 0,
-3.485166, -3.828915, 0,
-3.308233, -3.653144, 2,
-3.485166, -3.828915, 2,
-3.308233, -3.653144, 4,
-3.485166, -3.828915, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.83903, -4.180457, -4, 0, -0.5, 0.5, 0.5,
-3.83903, -4.180457, -4, 1, -0.5, 0.5, 0.5,
-3.83903, -4.180457, -4, 1, 1.5, 0.5, 0.5,
-3.83903, -4.180457, -4, 0, 1.5, 0.5, 0.5,
-3.83903, -4.180457, -2, 0, -0.5, 0.5, 0.5,
-3.83903, -4.180457, -2, 1, -0.5, 0.5, 0.5,
-3.83903, -4.180457, -2, 1, 1.5, 0.5, 0.5,
-3.83903, -4.180457, -2, 0, 1.5, 0.5, 0.5,
-3.83903, -4.180457, 0, 0, -0.5, 0.5, 0.5,
-3.83903, -4.180457, 0, 1, -0.5, 0.5, 0.5,
-3.83903, -4.180457, 0, 1, 1.5, 0.5, 0.5,
-3.83903, -4.180457, 0, 0, 1.5, 0.5, 0.5,
-3.83903, -4.180457, 2, 0, -0.5, 0.5, 0.5,
-3.83903, -4.180457, 2, 1, -0.5, 0.5, 0.5,
-3.83903, -4.180457, 2, 1, 1.5, 0.5, 0.5,
-3.83903, -4.180457, 2, 0, 1.5, 0.5, 0.5,
-3.83903, -4.180457, 4, 0, -0.5, 0.5, 0.5,
-3.83903, -4.180457, 4, 1, -0.5, 0.5, 0.5,
-3.83903, -4.180457, 4, 1, 1.5, 0.5, 0.5,
-3.83903, -4.180457, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.308233, -3.653144, -5.286534,
-3.308233, 3.3777, -5.286534,
-3.308233, -3.653144, 5.608573,
-3.308233, 3.3777, 5.608573,
-3.308233, -3.653144, -5.286534,
-3.308233, -3.653144, 5.608573,
-3.308233, 3.3777, -5.286534,
-3.308233, 3.3777, 5.608573,
-3.308233, -3.653144, -5.286534,
3.76905, -3.653144, -5.286534,
-3.308233, -3.653144, 5.608573,
3.76905, -3.653144, 5.608573,
-3.308233, 3.3777, -5.286534,
3.76905, 3.3777, -5.286534,
-3.308233, 3.3777, 5.608573,
3.76905, 3.3777, 5.608573,
3.76905, -3.653144, -5.286534,
3.76905, 3.3777, -5.286534,
3.76905, -3.653144, 5.608573,
3.76905, 3.3777, 5.608573,
3.76905, -3.653144, -5.286534,
3.76905, -3.653144, 5.608573,
3.76905, 3.3777, -5.286534,
3.76905, 3.3777, 5.608573
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.88818;
var distance = 35.0954;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.2304081, 0.1377218, -0.1610196 );
mvMatrix.scale( 1.205103, 1.213063, 0.7828151 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.0954);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
Indoxacarb<-read.table("Indoxacarb.xyz")
```

```
## Error in read.table("Indoxacarb.xyz"): no lines available in input
```

```r
x<-Indoxacarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'Indoxacarb' not found
```

```r
y<-Indoxacarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'Indoxacarb' not found
```

```r
z<-Indoxacarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'Indoxacarb' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.205166, 0.6185165, -1.525515, 0, 0, 1, 1, 1,
-3.04021, -1.379983, -2.742493, 1, 0, 0, 1, 1,
-2.856449, 0.3074017, -1.931189, 1, 0, 0, 1, 1,
-2.738407, -0.7141679, -1.313468, 1, 0, 0, 1, 1,
-2.689419, -0.9890114, -2.009892, 1, 0, 0, 1, 1,
-2.595194, -1.439215, -1.686421, 1, 0, 0, 1, 1,
-2.584094, 1.879096, -0.9512387, 0, 0, 0, 1, 1,
-2.552248, -0.3795981, -0.9546521, 0, 0, 0, 1, 1,
-2.550957, 0.2254266, -2.852266, 0, 0, 0, 1, 1,
-2.415318, -1.326059, -2.846172, 0, 0, 0, 1, 1,
-2.379848, 1.062098, -2.530385, 0, 0, 0, 1, 1,
-2.33943, -1.222873, -1.860091, 0, 0, 0, 1, 1,
-2.295592, -0.4578348, -2.02781, 0, 0, 0, 1, 1,
-2.248555, 0.1243818, -3.77937, 1, 1, 1, 1, 1,
-2.22516, -1.090919, -3.186307, 1, 1, 1, 1, 1,
-2.222951, 0.3198957, -3.727965, 1, 1, 1, 1, 1,
-2.220785, 1.544655, 0.1299862, 1, 1, 1, 1, 1,
-2.196772, -0.08753062, -2.324923, 1, 1, 1, 1, 1,
-2.180473, 0.02254181, -0.7830788, 1, 1, 1, 1, 1,
-2.125743, -0.451027, -1.493626, 1, 1, 1, 1, 1,
-2.105309, -0.829607, -2.963427, 1, 1, 1, 1, 1,
-2.096977, 0.4985737, -2.250392, 1, 1, 1, 1, 1,
-2.060493, 0.3174998, -1.780567, 1, 1, 1, 1, 1,
-2.054823, -0.3452731, -2.138853, 1, 1, 1, 1, 1,
-2.03834, 1.504168, -0.6867799, 1, 1, 1, 1, 1,
-2.020919, -1.006145, -2.907125, 1, 1, 1, 1, 1,
-2.014111, 1.064063, -1.5226, 1, 1, 1, 1, 1,
-1.999868, -0.3798485, -0.1235869, 1, 1, 1, 1, 1,
-1.993675, -1.790522, -0.9265887, 0, 0, 1, 1, 1,
-1.991184, -0.2459461, -0.4823098, 1, 0, 0, 1, 1,
-1.976562, -0.3959129, -2.394301, 1, 0, 0, 1, 1,
-1.969873, 2.572417, -2.579827, 1, 0, 0, 1, 1,
-1.953844, -0.06627242, -4.031804, 1, 0, 0, 1, 1,
-1.949685, 0.5569236, 0.7346026, 1, 0, 0, 1, 1,
-1.944734, 0.7967621, -1.102522, 0, 0, 0, 1, 1,
-1.936952, 0.8606519, 0.5598144, 0, 0, 0, 1, 1,
-1.919333, 0.5586665, -1.743209, 0, 0, 0, 1, 1,
-1.892674, -0.8335227, -3.171769, 0, 0, 0, 1, 1,
-1.884148, 0.8272507, -0.646188, 0, 0, 0, 1, 1,
-1.874378, -0.207192, -2.816638, 0, 0, 0, 1, 1,
-1.871418, 0.1083948, -1.350016, 0, 0, 0, 1, 1,
-1.870157, 0.01111993, -2.382087, 1, 1, 1, 1, 1,
-1.865922, -0.5228777, -2.499788, 1, 1, 1, 1, 1,
-1.864297, 0.4800791, 0.03528852, 1, 1, 1, 1, 1,
-1.86175, 0.4326406, -2.355867, 1, 1, 1, 1, 1,
-1.838905, -0.5210049, -1.442447, 1, 1, 1, 1, 1,
-1.833833, -0.9351291, -0.9240327, 1, 1, 1, 1, 1,
-1.820162, -0.4258159, -1.723652, 1, 1, 1, 1, 1,
-1.796991, -0.5600407, -0.8189815, 1, 1, 1, 1, 1,
-1.796754, -0.3687756, -4.076637, 1, 1, 1, 1, 1,
-1.766396, 0.7671292, -1.104408, 1, 1, 1, 1, 1,
-1.754948, -0.1971601, 0.3506395, 1, 1, 1, 1, 1,
-1.753845, -1.881856, -3.250963, 1, 1, 1, 1, 1,
-1.751322, 0.1052235, -1.13274, 1, 1, 1, 1, 1,
-1.718298, -0.2971648, -1.503496, 1, 1, 1, 1, 1,
-1.711105, 0.4365408, 0.1974804, 1, 1, 1, 1, 1,
-1.708456, 0.8989176, -1.944382, 0, 0, 1, 1, 1,
-1.692149, -0.4985815, -1.691499, 1, 0, 0, 1, 1,
-1.692, 0.7069709, -2.166339, 1, 0, 0, 1, 1,
-1.688479, 0.5449515, -1.935479, 1, 0, 0, 1, 1,
-1.678445, 0.3919747, -2.786159, 1, 0, 0, 1, 1,
-1.676283, 1.884706, -1.569515, 1, 0, 0, 1, 1,
-1.666229, 2.314339, 0.4038424, 0, 0, 0, 1, 1,
-1.663999, -0.006872415, -2.617661, 0, 0, 0, 1, 1,
-1.632675, 1.628413, -1.38039, 0, 0, 0, 1, 1,
-1.630896, 0.6506278, -1.957109, 0, 0, 0, 1, 1,
-1.63003, -0.6807141, -0.5015224, 0, 0, 0, 1, 1,
-1.623374, 0.3037149, -0.4198655, 0, 0, 0, 1, 1,
-1.617766, -0.8608733, -3.33248, 0, 0, 0, 1, 1,
-1.614336, -1.293151, -0.2503147, 1, 1, 1, 1, 1,
-1.612817, -0.6733074, -2.39873, 1, 1, 1, 1, 1,
-1.604279, 1.348505, -0.6207066, 1, 1, 1, 1, 1,
-1.598958, -0.2334579, -2.134892, 1, 1, 1, 1, 1,
-1.598678, 1.126508, 0.3111442, 1, 1, 1, 1, 1,
-1.592548, 0.1709846, -0.07008777, 1, 1, 1, 1, 1,
-1.58679, -0.1883615, -1.848391, 1, 1, 1, 1, 1,
-1.582965, 1.699812, -0.1887641, 1, 1, 1, 1, 1,
-1.579935, -1.377797, -0.4495759, 1, 1, 1, 1, 1,
-1.575187, 0.2076832, -0.4064294, 1, 1, 1, 1, 1,
-1.561743, -0.07011887, -1.146941, 1, 1, 1, 1, 1,
-1.561498, 0.6130455, -1.236674, 1, 1, 1, 1, 1,
-1.560427, 0.1403045, -1.157871, 1, 1, 1, 1, 1,
-1.556895, -0.8507779, -1.962368, 1, 1, 1, 1, 1,
-1.543594, -0.1783198, -3.518384, 1, 1, 1, 1, 1,
-1.531317, -0.9953103, -2.667048, 0, 0, 1, 1, 1,
-1.505087, 1.947664, -0.7672603, 1, 0, 0, 1, 1,
-1.502593, 0.443811, -0.7599846, 1, 0, 0, 1, 1,
-1.499877, -0.4023123, -1.272323, 1, 0, 0, 1, 1,
-1.490909, 0.2231807, -2.544615, 1, 0, 0, 1, 1,
-1.436141, 0.8332544, -1.170357, 1, 0, 0, 1, 1,
-1.423344, 0.4159434, -1.17106, 0, 0, 0, 1, 1,
-1.416468, -0.7202796, -2.708675, 0, 0, 0, 1, 1,
-1.415613, 0.006845482, -0.4933631, 0, 0, 0, 1, 1,
-1.41255, -0.9286183, -3.438408, 0, 0, 0, 1, 1,
-1.399781, -0.2882751, -0.6408284, 0, 0, 0, 1, 1,
-1.393242, 0.707641, -1.993639, 0, 0, 0, 1, 1,
-1.389929, -0.3881508, -1.137104, 0, 0, 0, 1, 1,
-1.379298, -0.3364092, -1.996335, 1, 1, 1, 1, 1,
-1.376406, 0.2501172, -2.597125, 1, 1, 1, 1, 1,
-1.375102, 0.6404182, -0.5052972, 1, 1, 1, 1, 1,
-1.373322, 0.3363657, -0.2490324, 1, 1, 1, 1, 1,
-1.369523, 0.7666645, -0.4086318, 1, 1, 1, 1, 1,
-1.368378, -0.4946848, -1.716383, 1, 1, 1, 1, 1,
-1.367702, -0.1682075, -2.277245, 1, 1, 1, 1, 1,
-1.365164, 0.1829006, -1.30399, 1, 1, 1, 1, 1,
-1.362321, -0.3689424, -1.360895, 1, 1, 1, 1, 1,
-1.357203, 0.5675924, -2.464338, 1, 1, 1, 1, 1,
-1.344758, -0.3761385, -2.092129, 1, 1, 1, 1, 1,
-1.342673, 0.7519153, -0.3216382, 1, 1, 1, 1, 1,
-1.335798, 0.1806893, -1.295515, 1, 1, 1, 1, 1,
-1.330776, 0.3223677, -0.7200325, 1, 1, 1, 1, 1,
-1.320387, 1.288517, -1.269601, 1, 1, 1, 1, 1,
-1.314476, -1.690864, -2.008434, 0, 0, 1, 1, 1,
-1.305272, 0.2963785, -2.037358, 1, 0, 0, 1, 1,
-1.304701, -0.7229076, -1.508445, 1, 0, 0, 1, 1,
-1.287967, -1.96098, -2.559026, 1, 0, 0, 1, 1,
-1.279088, -0.8161709, -3.248998, 1, 0, 0, 1, 1,
-1.279039, -1.670213, -3.717809, 1, 0, 0, 1, 1,
-1.264882, -0.3535774, -0.8143124, 0, 0, 0, 1, 1,
-1.256833, 0.6776842, -2.515966, 0, 0, 0, 1, 1,
-1.251449, 0.6751198, -0.5308223, 0, 0, 0, 1, 1,
-1.250108, -1.03126, -3.232436, 0, 0, 0, 1, 1,
-1.243728, 1.117342, -2.464863, 0, 0, 0, 1, 1,
-1.23894, 0.6480688, -1.636013, 0, 0, 0, 1, 1,
-1.238442, 1.055031, -0.6420017, 0, 0, 0, 1, 1,
-1.232895, -0.998066, -2.819947, 1, 1, 1, 1, 1,
-1.231652, 0.1203938, -1.696589, 1, 1, 1, 1, 1,
-1.227836, -1.424177, -2.506571, 1, 1, 1, 1, 1,
-1.224981, -0.2707259, -0.3181548, 1, 1, 1, 1, 1,
-1.221859, -1.034875, -1.501968, 1, 1, 1, 1, 1,
-1.21929, 0.04250873, -1.766407, 1, 1, 1, 1, 1,
-1.209039, -0.2021903, -1.540932, 1, 1, 1, 1, 1,
-1.205999, 0.8966178, -0.4707403, 1, 1, 1, 1, 1,
-1.203277, 0.3222742, -3.257091, 1, 1, 1, 1, 1,
-1.193152, -1.269516, -2.764611, 1, 1, 1, 1, 1,
-1.192844, 0.2285629, 0.2087163, 1, 1, 1, 1, 1,
-1.191392, 2.309209, -1.381048, 1, 1, 1, 1, 1,
-1.183025, 0.5836537, -0.888926, 1, 1, 1, 1, 1,
-1.172259, 1.767437, 0.8082731, 1, 1, 1, 1, 1,
-1.170847, -0.6656125, -2.572478, 1, 1, 1, 1, 1,
-1.165681, 1.025625, 0.2841574, 0, 0, 1, 1, 1,
-1.156256, -0.4905488, -2.392447, 1, 0, 0, 1, 1,
-1.147949, -1.894944, -2.20786, 1, 0, 0, 1, 1,
-1.144933, -0.6833771, -2.750847, 1, 0, 0, 1, 1,
-1.135004, 0.4987982, -2.435594, 1, 0, 0, 1, 1,
-1.126666, 0.8976381, -0.7350081, 1, 0, 0, 1, 1,
-1.124508, 1.510836, -1.435745, 0, 0, 0, 1, 1,
-1.121284, -0.1185865, -0.6789292, 0, 0, 0, 1, 1,
-1.114542, -0.9389437, -2.573075, 0, 0, 0, 1, 1,
-1.105349, 1.813312, -0.3295039, 0, 0, 0, 1, 1,
-1.103161, 0.7195087, -1.493673, 0, 0, 0, 1, 1,
-1.102737, 0.5515895, 0.7507587, 0, 0, 0, 1, 1,
-1.097154, 0.7742546, 0.3228855, 0, 0, 0, 1, 1,
-1.089041, -1.041914, -4.362424, 1, 1, 1, 1, 1,
-1.086124, 0.4385847, -0.423679, 1, 1, 1, 1, 1,
-1.081079, -0.4746753, -1.880842, 1, 1, 1, 1, 1,
-1.070783, -0.3952753, -2.941297, 1, 1, 1, 1, 1,
-1.054417, -0.2539831, -0.7289035, 1, 1, 1, 1, 1,
-1.053378, -0.3652482, 0.5819785, 1, 1, 1, 1, 1,
-1.05207, -0.1960439, -1.497144, 1, 1, 1, 1, 1,
-1.049926, -0.9649115, -1.573006, 1, 1, 1, 1, 1,
-1.047133, 1.014823, 0.8903687, 1, 1, 1, 1, 1,
-1.040741, 0.3239698, -2.11153, 1, 1, 1, 1, 1,
-1.036452, -1.00203, -1.041088, 1, 1, 1, 1, 1,
-1.034719, -1.06064, -3.322045, 1, 1, 1, 1, 1,
-1.029196, 1.1653, -0.6987108, 1, 1, 1, 1, 1,
-1.026684, -0.404628, -3.228678, 1, 1, 1, 1, 1,
-1.026463, -0.1308126, -1.947761, 1, 1, 1, 1, 1,
-1.025952, 0.06087258, -1.133893, 0, 0, 1, 1, 1,
-1.023728, 0.2183968, -0.8921841, 1, 0, 0, 1, 1,
-1.015559, -0.7360136, -2.100769, 1, 0, 0, 1, 1,
-1.014266, 0.5442384, -1.293551, 1, 0, 0, 1, 1,
-1.010779, 0.1225737, -0.8871626, 1, 0, 0, 1, 1,
-0.9962704, 1.406939, -0.05162976, 1, 0, 0, 1, 1,
-0.9958672, -0.9955266, -3.566041, 0, 0, 0, 1, 1,
-0.9810088, 1.073424, -0.8792669, 0, 0, 0, 1, 1,
-0.9766898, -0.2153059, -1.17657, 0, 0, 0, 1, 1,
-0.9745917, -0.9901461, -2.833777, 0, 0, 0, 1, 1,
-0.9729529, -1.069446, -2.734325, 0, 0, 0, 1, 1,
-0.9717135, -0.9427865, -3.713579, 0, 0, 0, 1, 1,
-0.9608061, -1.437801, -1.322008, 0, 0, 0, 1, 1,
-0.9597656, -2.053276, -3.388872, 1, 1, 1, 1, 1,
-0.9593312, -0.8243577, -1.626932, 1, 1, 1, 1, 1,
-0.9585391, 1.841378, 0.2175806, 1, 1, 1, 1, 1,
-0.9553608, -0.754622, -2.012141, 1, 1, 1, 1, 1,
-0.9544624, 1.677956, 0.08797185, 1, 1, 1, 1, 1,
-0.9540421, 1.183366, 0.2059932, 1, 1, 1, 1, 1,
-0.9491227, 0.2503355, -0.9080771, 1, 1, 1, 1, 1,
-0.9480755, -0.1347154, -2.308286, 1, 1, 1, 1, 1,
-0.9431598, -0.1059128, -1.451029, 1, 1, 1, 1, 1,
-0.9375686, -0.6286491, -1.965614, 1, 1, 1, 1, 1,
-0.9331928, -0.8361014, -2.63812, 1, 1, 1, 1, 1,
-0.9330837, 0.3949724, -2.366088, 1, 1, 1, 1, 1,
-0.9312714, -0.3321943, -2.829149, 1, 1, 1, 1, 1,
-0.9289895, 0.3323875, -1.554006, 1, 1, 1, 1, 1,
-0.9269414, 0.3574086, -2.453352, 1, 1, 1, 1, 1,
-0.925792, -0.7467323, -0.3321903, 0, 0, 1, 1, 1,
-0.9219169, -1.374561, -2.21712, 1, 0, 0, 1, 1,
-0.9211323, -0.5395309, -3.508581, 1, 0, 0, 1, 1,
-0.9142408, 0.3633768, -2.412269, 1, 0, 0, 1, 1,
-0.908757, 1.657218, -1.2156, 1, 0, 0, 1, 1,
-0.9078125, -0.5965078, -2.303043, 1, 0, 0, 1, 1,
-0.9049271, 0.1798216, -0.7256036, 0, 0, 0, 1, 1,
-0.9017498, 0.802209, -0.5211877, 0, 0, 0, 1, 1,
-0.8999618, 0.7851191, -2.438036, 0, 0, 0, 1, 1,
-0.8993056, 0.2448285, 0.08372591, 0, 0, 0, 1, 1,
-0.8910802, 0.04927806, -2.45511, 0, 0, 0, 1, 1,
-0.887094, 0.2148355, -1.655654, 0, 0, 0, 1, 1,
-0.8850179, 1.03889, -1.537392, 0, 0, 0, 1, 1,
-0.8740749, 0.9521645, 0.8998808, 1, 1, 1, 1, 1,
-0.8661246, -0.3750715, -1.632039, 1, 1, 1, 1, 1,
-0.8660398, -1.658114, -1.951541, 1, 1, 1, 1, 1,
-0.8646228, -2.40969, -3.098471, 1, 1, 1, 1, 1,
-0.8594675, 1.096139, -1.649905, 1, 1, 1, 1, 1,
-0.8560727, -1.916493, -2.918042, 1, 1, 1, 1, 1,
-0.8552724, -1.189913, -2.782835, 1, 1, 1, 1, 1,
-0.852451, -1.281511, -2.942777, 1, 1, 1, 1, 1,
-0.8521921, -0.6529325, -2.004666, 1, 1, 1, 1, 1,
-0.848992, 2.540424, 0.6035679, 1, 1, 1, 1, 1,
-0.8348752, 3.275309, -2.160828, 1, 1, 1, 1, 1,
-0.8301108, -0.3632547, -2.553053, 1, 1, 1, 1, 1,
-0.8267887, -0.06698245, -1.25571, 1, 1, 1, 1, 1,
-0.8083209, 1.074413, -0.3922495, 1, 1, 1, 1, 1,
-0.8066656, 0.5091825, -1.16281, 1, 1, 1, 1, 1,
-0.8009539, -0.7768232, -3.289213, 0, 0, 1, 1, 1,
-0.7979479, -0.8560074, -2.519413, 1, 0, 0, 1, 1,
-0.7967421, 1.206917, -0.9719512, 1, 0, 0, 1, 1,
-0.7946405, 0.6407104, -0.3685529, 1, 0, 0, 1, 1,
-0.7897116, -1.132423, -3.40797, 1, 0, 0, 1, 1,
-0.7878007, -0.8679075, -1.312429, 1, 0, 0, 1, 1,
-0.781391, 1.608357, -0.05918186, 0, 0, 0, 1, 1,
-0.7800608, -1.36606, -2.695156, 0, 0, 0, 1, 1,
-0.777172, 1.367337, -1.014812, 0, 0, 0, 1, 1,
-0.7763758, -1.33148, -3.475214, 0, 0, 0, 1, 1,
-0.7749795, 1.931098, -0.1760772, 0, 0, 0, 1, 1,
-0.772951, 1.040254, -0.91017, 0, 0, 0, 1, 1,
-0.7641945, -0.4287617, -2.69353, 0, 0, 0, 1, 1,
-0.7619701, 0.2904956, -2.157687, 1, 1, 1, 1, 1,
-0.7558299, -0.7982296, -2.879057, 1, 1, 1, 1, 1,
-0.7522834, -0.880219, -2.994224, 1, 1, 1, 1, 1,
-0.7491282, -0.3820961, -1.658984, 1, 1, 1, 1, 1,
-0.748449, -0.4158961, -1.893379, 1, 1, 1, 1, 1,
-0.7443788, -1.09021, -3.171726, 1, 1, 1, 1, 1,
-0.7431128, -1.317725, -3.494117, 1, 1, 1, 1, 1,
-0.7428315, 0.7198232, -0.3796325, 1, 1, 1, 1, 1,
-0.7414783, 1.128148, -0.5330233, 1, 1, 1, 1, 1,
-0.7370304, 0.164135, -1.419476, 1, 1, 1, 1, 1,
-0.7359012, -0.6992724, -1.724008, 1, 1, 1, 1, 1,
-0.7342362, -0.8802926, -2.382129, 1, 1, 1, 1, 1,
-0.7223722, -0.07923522, 0.05610897, 1, 1, 1, 1, 1,
-0.7117026, 0.173068, -1.184767, 1, 1, 1, 1, 1,
-0.7001845, 0.600033, -2.401567, 1, 1, 1, 1, 1,
-0.6989612, 1.0015, -0.5838349, 0, 0, 1, 1, 1,
-0.6839744, 2.057556, -1.485287, 1, 0, 0, 1, 1,
-0.6817126, -0.5840434, -2.033537, 1, 0, 0, 1, 1,
-0.6801299, -1.039394, -3.782484, 1, 0, 0, 1, 1,
-0.6799486, -1.314452, -3.28331, 1, 0, 0, 1, 1,
-0.6708494, 1.269842, -0.4735531, 1, 0, 0, 1, 1,
-0.6668792, 0.05435774, -0.9930254, 0, 0, 0, 1, 1,
-0.6649535, -0.3365995, -3.079844, 0, 0, 0, 1, 1,
-0.6640081, -0.7920824, -2.490533, 0, 0, 0, 1, 1,
-0.6531153, -0.384061, -2.373092, 0, 0, 0, 1, 1,
-0.6522597, -1.324686, -2.159762, 0, 0, 0, 1, 1,
-0.6415064, 0.03697948, -2.224839, 0, 0, 0, 1, 1,
-0.6369391, 1.495728, 1.099732, 0, 0, 0, 1, 1,
-0.6368115, 0.4203317, -1.33316, 1, 1, 1, 1, 1,
-0.6352916, 0.2792608, -1.334758, 1, 1, 1, 1, 1,
-0.634991, 0.2264021, -3.567374, 1, 1, 1, 1, 1,
-0.6339554, 1.572037, -0.6762284, 1, 1, 1, 1, 1,
-0.6276365, -0.3432238, -1.779436, 1, 1, 1, 1, 1,
-0.6252925, 0.6304591, -0.4712954, 1, 1, 1, 1, 1,
-0.6251718, 0.6113176, -0.9305328, 1, 1, 1, 1, 1,
-0.6226555, 1.104355, -2.054182, 1, 1, 1, 1, 1,
-0.6224105, -0.03353633, -3.579535, 1, 1, 1, 1, 1,
-0.6207652, -0.01498953, -1.572438, 1, 1, 1, 1, 1,
-0.6204379, 0.414078, -1.248939, 1, 1, 1, 1, 1,
-0.6193811, 0.8729444, 0.7578928, 1, 1, 1, 1, 1,
-0.6184493, 0.3861469, -0.1402609, 1, 1, 1, 1, 1,
-0.6168845, -0.6394479, -3.546099, 1, 1, 1, 1, 1,
-0.6075516, -0.3793116, -1.725961, 1, 1, 1, 1, 1,
-0.6049418, 0.6423848, -1.622153, 0, 0, 1, 1, 1,
-0.6047873, -1.271924, -3.499776, 1, 0, 0, 1, 1,
-0.5918081, 2.376062, -1.634786, 1, 0, 0, 1, 1,
-0.5856908, 0.1831415, -2.250635, 1, 0, 0, 1, 1,
-0.5800575, 1.270104, 1.945974, 1, 0, 0, 1, 1,
-0.5722964, 1.920128, -1.958912, 1, 0, 0, 1, 1,
-0.5715083, -0.3416921, -1.25073, 0, 0, 0, 1, 1,
-0.562843, -0.7792851, -1.428645, 0, 0, 0, 1, 1,
-0.5597942, -1.377871, -2.454115, 0, 0, 0, 1, 1,
-0.5547349, -0.9497657, -1.867602, 0, 0, 0, 1, 1,
-0.5463373, -0.05651706, -0.7406356, 0, 0, 0, 1, 1,
-0.5461215, 0.7764537, -0.5019125, 0, 0, 0, 1, 1,
-0.5383036, 0.4174075, -0.9891557, 0, 0, 0, 1, 1,
-0.5380768, 0.3325149, -1.799417, 1, 1, 1, 1, 1,
-0.5370195, 1.058091, -0.9125754, 1, 1, 1, 1, 1,
-0.5342052, 0.7379264, 1.711948, 1, 1, 1, 1, 1,
-0.5329326, -1.929306, -3.280748, 1, 1, 1, 1, 1,
-0.5301082, -0.4400426, -2.0742, 1, 1, 1, 1, 1,
-0.5243157, -1.039218, -3.305338, 1, 1, 1, 1, 1,
-0.5212113, -0.7521926, -0.8472279, 1, 1, 1, 1, 1,
-0.5186428, -0.7384079, -4.008268, 1, 1, 1, 1, 1,
-0.5180187, 0.964999, -1.277838, 1, 1, 1, 1, 1,
-0.517705, 0.7205735, -1.236363, 1, 1, 1, 1, 1,
-0.512339, -0.1530278, -3.380428, 1, 1, 1, 1, 1,
-0.5078897, -1.048913, -2.321169, 1, 1, 1, 1, 1,
-0.4990166, -0.9708092, -3.033647, 1, 1, 1, 1, 1,
-0.4898134, -1.564061, -2.071039, 1, 1, 1, 1, 1,
-0.4879538, 0.5131456, -0.4175292, 1, 1, 1, 1, 1,
-0.4849957, -0.06997061, -1.179024, 0, 0, 1, 1, 1,
-0.48353, -1.182229, -3.799298, 1, 0, 0, 1, 1,
-0.4829547, -0.1281981, -2.247406, 1, 0, 0, 1, 1,
-0.4827318, -0.1867318, -1.431249, 1, 0, 0, 1, 1,
-0.4824349, 1.241077, 0.07270525, 1, 0, 0, 1, 1,
-0.4820518, -0.6418899, -2.690209, 1, 0, 0, 1, 1,
-0.4794957, 0.284163, -1.859476, 0, 0, 0, 1, 1,
-0.4727299, -0.8439673, -1.601276, 0, 0, 0, 1, 1,
-0.4716832, -0.1079215, -2.175641, 0, 0, 0, 1, 1,
-0.4707407, -0.6793514, -2.256203, 0, 0, 0, 1, 1,
-0.4646669, -1.0409, -3.545922, 0, 0, 0, 1, 1,
-0.4625151, 1.421021, 0.2923111, 0, 0, 0, 1, 1,
-0.461367, 2.483268, -1.370086, 0, 0, 0, 1, 1,
-0.4549383, -0.1568183, -1.340811, 1, 1, 1, 1, 1,
-0.4533913, 0.5306676, -0.8871735, 1, 1, 1, 1, 1,
-0.4522493, -0.9800935, -4.983708, 1, 1, 1, 1, 1,
-0.4446082, 0.6039519, -1.29831, 1, 1, 1, 1, 1,
-0.4444423, 0.3555861, -1.808669, 1, 1, 1, 1, 1,
-0.4428935, -1.811998, -1.596879, 1, 1, 1, 1, 1,
-0.442033, -1.123332, -2.922271, 1, 1, 1, 1, 1,
-0.4414371, 0.2761862, -0.5656024, 1, 1, 1, 1, 1,
-0.4393062, 0.3465854, -1.245724, 1, 1, 1, 1, 1,
-0.438614, 0.3347494, -1.669236, 1, 1, 1, 1, 1,
-0.4366857, -0.3908651, -4.806824, 1, 1, 1, 1, 1,
-0.4317265, -0.8174976, -2.169523, 1, 1, 1, 1, 1,
-0.4298756, 2.245416, 0.9998991, 1, 1, 1, 1, 1,
-0.4294478, -1.861436, -3.435497, 1, 1, 1, 1, 1,
-0.425139, -1.162648, -2.578149, 1, 1, 1, 1, 1,
-0.4229119, -0.4764534, -2.456729, 0, 0, 1, 1, 1,
-0.4225034, 0.1781536, -0.740734, 1, 0, 0, 1, 1,
-0.4183396, -0.4576147, -2.304836, 1, 0, 0, 1, 1,
-0.4175582, -1.306608, -4.232994, 1, 0, 0, 1, 1,
-0.413596, -1.028014, -2.454819, 1, 0, 0, 1, 1,
-0.4134589, 0.4970529, 0.1613812, 1, 0, 0, 1, 1,
-0.4121004, 0.2246665, -0.1531527, 0, 0, 0, 1, 1,
-0.4070261, 0.6927363, 0.4791243, 0, 0, 0, 1, 1,
-0.405708, -1.002927, -3.155851, 0, 0, 0, 1, 1,
-0.3901688, 1.027901, -0.1672268, 0, 0, 0, 1, 1,
-0.3886124, 0.5118418, -1.164172, 0, 0, 0, 1, 1,
-0.3840892, 0.4878993, 0.1993941, 0, 0, 0, 1, 1,
-0.3782783, 0.02865404, -0.8230814, 0, 0, 0, 1, 1,
-0.3742571, -0.3186035, -2.052154, 1, 1, 1, 1, 1,
-0.3705862, -0.8792821, -2.580541, 1, 1, 1, 1, 1,
-0.3693755, -1.320579, -3.483234, 1, 1, 1, 1, 1,
-0.368531, -1.9212, -3.272036, 1, 1, 1, 1, 1,
-0.3675377, 1.805031, -0.9607637, 1, 1, 1, 1, 1,
-0.3673427, -0.303933, -2.079343, 1, 1, 1, 1, 1,
-0.3645055, -0.431992, -2.080513, 1, 1, 1, 1, 1,
-0.3541206, 0.06903327, -2.863377, 1, 1, 1, 1, 1,
-0.3537939, -0.2429204, -2.916771, 1, 1, 1, 1, 1,
-0.3475756, -0.6494037, -2.868641, 1, 1, 1, 1, 1,
-0.3458477, -0.5917544, -2.501892, 1, 1, 1, 1, 1,
-0.341293, 0.3110043, -2.064748, 1, 1, 1, 1, 1,
-0.3386299, 0.2875363, -1.761993, 1, 1, 1, 1, 1,
-0.3376228, 0.1464627, -1.631, 1, 1, 1, 1, 1,
-0.3291968, -0.7979101, -5.011961, 1, 1, 1, 1, 1,
-0.3282838, 1.634018, 0.1582863, 0, 0, 1, 1, 1,
-0.325658, -0.7473228, -3.048816, 1, 0, 0, 1, 1,
-0.3133812, -0.8345351, -3.166636, 1, 0, 0, 1, 1,
-0.3124572, 0.04628592, -1.433844, 1, 0, 0, 1, 1,
-0.3078744, 0.055143, -0.864324, 1, 0, 0, 1, 1,
-0.3026226, -0.8175071, -1.005931, 1, 0, 0, 1, 1,
-0.2981883, -0.09598153, -3.061379, 0, 0, 0, 1, 1,
-0.296243, -0.435076, -1.665127, 0, 0, 0, 1, 1,
-0.2955137, 0.8296356, -1.190427, 0, 0, 0, 1, 1,
-0.2945889, 0.6565424, -0.8679004, 0, 0, 0, 1, 1,
-0.2911432, -1.779456, -2.139202, 0, 0, 0, 1, 1,
-0.2906279, 0.5441862, -0.9489284, 0, 0, 0, 1, 1,
-0.288423, -1.342413, -5.127868, 0, 0, 0, 1, 1,
-0.2880451, 0.460414, -0.2321994, 1, 1, 1, 1, 1,
-0.28467, 1.73175, -0.6517685, 1, 1, 1, 1, 1,
-0.281887, 0.7680295, 0.665267, 1, 1, 1, 1, 1,
-0.2817711, -1.327867, -1.650039, 1, 1, 1, 1, 1,
-0.279851, 1.229779, 1.04878, 1, 1, 1, 1, 1,
-0.2795763, 0.7996897, -1.42138, 1, 1, 1, 1, 1,
-0.2761863, 1.170095, 0.03259036, 1, 1, 1, 1, 1,
-0.2748893, -0.2408635, -3.949248, 1, 1, 1, 1, 1,
-0.2746396, 0.7539281, -0.9028678, 1, 1, 1, 1, 1,
-0.2744984, -0.4270204, -2.947923, 1, 1, 1, 1, 1,
-0.2725024, 0.4312356, -1.174477, 1, 1, 1, 1, 1,
-0.2690162, 0.6290287, -0.00496207, 1, 1, 1, 1, 1,
-0.2689244, 0.1130926, 0.2513221, 1, 1, 1, 1, 1,
-0.2662967, 0.864908, 1.364345, 1, 1, 1, 1, 1,
-0.250279, -1.085889, -3.176205, 1, 1, 1, 1, 1,
-0.2466116, 0.2908003, -0.3442315, 0, 0, 1, 1, 1,
-0.2410069, 1.691827, 0.1825295, 1, 0, 0, 1, 1,
-0.2409366, -1.289051, -2.980144, 1, 0, 0, 1, 1,
-0.2399978, -1.004991, -3.369185, 1, 0, 0, 1, 1,
-0.2382234, 0.1032954, -2.232386, 1, 0, 0, 1, 1,
-0.2289558, -0.6984343, -3.203306, 1, 0, 0, 1, 1,
-0.2255274, -1.246365, -2.383035, 0, 0, 0, 1, 1,
-0.2217666, 0.03982636, -1.898135, 0, 0, 0, 1, 1,
-0.2189582, 0.5086741, -1.063873, 0, 0, 0, 1, 1,
-0.2178116, 1.151811, -0.1091832, 0, 0, 0, 1, 1,
-0.2135518, -2.055258, -2.883416, 0, 0, 0, 1, 1,
-0.2094034, -0.8388953, -3.905258, 0, 0, 0, 1, 1,
-0.2031434, 1.191399, -0.9277295, 0, 0, 0, 1, 1,
-0.2018722, -1.005181, -4.259607, 1, 1, 1, 1, 1,
-0.1987126, -0.2871578, -1.98598, 1, 1, 1, 1, 1,
-0.1952181, -0.8145092, -4.028557, 1, 1, 1, 1, 1,
-0.1898509, -0.3640124, -4.212959, 1, 1, 1, 1, 1,
-0.1880547, -0.2409686, -2.331378, 1, 1, 1, 1, 1,
-0.1835281, 1.181828, -1.648495, 1, 1, 1, 1, 1,
-0.1830398, -0.2021395, -0.8979042, 1, 1, 1, 1, 1,
-0.1823305, 0.8949018, 0.3743928, 1, 1, 1, 1, 1,
-0.1794177, -0.2498397, -3.080062, 1, 1, 1, 1, 1,
-0.1781156, -0.2763637, -3.776785, 1, 1, 1, 1, 1,
-0.1765271, 1.765164, 0.04078441, 1, 1, 1, 1, 1,
-0.1753095, -0.8654904, -4.140979, 1, 1, 1, 1, 1,
-0.1748432, 1.804274, 0.9006118, 1, 1, 1, 1, 1,
-0.173126, 1.57495, -1.606004, 1, 1, 1, 1, 1,
-0.1706595, 0.5743963, 0.4209298, 1, 1, 1, 1, 1,
-0.1705582, 1.196282, 0.3302791, 0, 0, 1, 1, 1,
-0.1685684, 0.9110099, -0.262878, 1, 0, 0, 1, 1,
-0.1670003, 0.05750739, -0.7911903, 1, 0, 0, 1, 1,
-0.1646378, -0.2625011, -2.041275, 1, 0, 0, 1, 1,
-0.1643103, -0.8338004, -2.66356, 1, 0, 0, 1, 1,
-0.1634741, 0.1060515, -0.5095521, 1, 0, 0, 1, 1,
-0.1630331, 0.1092836, -1.309714, 0, 0, 0, 1, 1,
-0.162744, 0.004402549, -0.8215944, 0, 0, 0, 1, 1,
-0.1620524, 0.6184787, 0.5013886, 0, 0, 0, 1, 1,
-0.1617334, 0.6230212, -0.503638, 0, 0, 0, 1, 1,
-0.1611448, 1.144202, -0.8086342, 0, 0, 0, 1, 1,
-0.1551305, 1.292966, -0.3450388, 0, 0, 0, 1, 1,
-0.1550958, 0.4799452, -1.445582, 0, 0, 0, 1, 1,
-0.1543766, -0.7727347, -4.216165, 1, 1, 1, 1, 1,
-0.1489905, -0.4088436, -2.747963, 1, 1, 1, 1, 1,
-0.1486253, 0.7859397, -0.4454521, 1, 1, 1, 1, 1,
-0.1475518, -0.9158703, -2.450409, 1, 1, 1, 1, 1,
-0.1473996, -2.396747, -1.976609, 1, 1, 1, 1, 1,
-0.1447731, -0.01829593, -1.145541, 1, 1, 1, 1, 1,
-0.1398635, 1.199244, -0.3074865, 1, 1, 1, 1, 1,
-0.1392849, 1.02574, -2.062041, 1, 1, 1, 1, 1,
-0.1382295, 0.4457805, 1.151952, 1, 1, 1, 1, 1,
-0.1373252, -0.2295212, -2.60239, 1, 1, 1, 1, 1,
-0.1371597, 0.1799162, 0.469795, 1, 1, 1, 1, 1,
-0.1365052, 0.1923124, -1.931076, 1, 1, 1, 1, 1,
-0.1275342, -1.161284, -3.38405, 1, 1, 1, 1, 1,
-0.1251035, -0.4599267, -3.350264, 1, 1, 1, 1, 1,
-0.1221162, 2.191554, -0.2132163, 1, 1, 1, 1, 1,
-0.1198549, -0.8048372, -3.29671, 0, 0, 1, 1, 1,
-0.1152781, 0.6136983, 0.9078797, 1, 0, 0, 1, 1,
-0.1149635, -1.745959, -2.988988, 1, 0, 0, 1, 1,
-0.1132088, 0.1445197, -0.6057217, 1, 0, 0, 1, 1,
-0.112688, 1.581679, -1.588092, 1, 0, 0, 1, 1,
-0.1119369, -0.1986459, -2.463247, 1, 0, 0, 1, 1,
-0.1103682, 0.4166164, -1.939243, 0, 0, 0, 1, 1,
-0.1103614, -0.3490201, -2.927166, 0, 0, 0, 1, 1,
-0.1023462, 0.09426097, 0.5620906, 0, 0, 0, 1, 1,
-0.0988636, 0.3131402, 0.472146, 0, 0, 0, 1, 1,
-0.09790201, 0.9219956, 0.3328064, 0, 0, 0, 1, 1,
-0.09760166, 0.159345, -1.134499, 0, 0, 0, 1, 1,
-0.09020129, -1.009073, -3.625679, 0, 0, 0, 1, 1,
-0.08751341, 1.970756, -0.1702378, 1, 1, 1, 1, 1,
-0.08547097, -1.282898, -4.868183, 1, 1, 1, 1, 1,
-0.08333498, 0.6434267, -1.876225, 1, 1, 1, 1, 1,
-0.08195705, -1.041797, -2.89641, 1, 1, 1, 1, 1,
-0.07918435, -1.51052, -4.680267, 1, 1, 1, 1, 1,
-0.07806975, -0.1440433, -2.278295, 1, 1, 1, 1, 1,
-0.07703482, -0.8591498, -1.077406, 1, 1, 1, 1, 1,
-0.07421585, -1.268422, -3.007455, 1, 1, 1, 1, 1,
-0.07386893, -1.246544, -3.798334, 1, 1, 1, 1, 1,
-0.07233094, -0.6349826, -2.930759, 1, 1, 1, 1, 1,
-0.06922967, 0.6926991, -1.295949, 1, 1, 1, 1, 1,
-0.06901827, 0.8468286, -0.4741386, 1, 1, 1, 1, 1,
-0.0661187, 1.441953, -0.3021653, 1, 1, 1, 1, 1,
-0.06458176, 0.7432793, 0.5597134, 1, 1, 1, 1, 1,
-0.06074761, 0.3896876, -0.5886804, 1, 1, 1, 1, 1,
-0.05892434, 0.4404634, 1.225371, 0, 0, 1, 1, 1,
-0.05684121, 0.49123, 0.6874898, 1, 0, 0, 1, 1,
-0.0508349, 0.7548765, -0.5070608, 1, 0, 0, 1, 1,
-0.04916002, -0.9597564, -2.817536, 1, 0, 0, 1, 1,
-0.04214752, -0.03076648, -3.888065, 1, 0, 0, 1, 1,
-0.03897905, 0.3601973, 1.049213, 1, 0, 0, 1, 1,
-0.03780935, 0.5464909, -0.886603, 0, 0, 0, 1, 1,
-0.03409284, -0.5162129, -1.824536, 0, 0, 0, 1, 1,
-0.03100475, -0.04824365, -2.5714, 0, 0, 0, 1, 1,
-0.02828125, -1.094856, -5.053032, 0, 0, 0, 1, 1,
-0.02728301, 0.556659, -0.2758844, 0, 0, 0, 1, 1,
-0.01493331, -0.9247959, -2.112903, 0, 0, 0, 1, 1,
-0.01474282, -0.7539798, -2.478741, 0, 0, 0, 1, 1,
-0.01275689, 0.4855925, -0.1949041, 1, 1, 1, 1, 1,
-0.01261504, 0.08413059, 0.2406777, 1, 1, 1, 1, 1,
-0.01225156, -0.439465, -2.398036, 1, 1, 1, 1, 1,
-0.008626811, -0.08322368, -2.922202, 1, 1, 1, 1, 1,
0.0003015284, -0.9029357, 5.213229, 1, 1, 1, 1, 1,
0.0003175657, -0.6291566, 2.398475, 1, 1, 1, 1, 1,
0.001574577, -0.04155904, 1.401785, 1, 1, 1, 1, 1,
0.003078635, -0.4446862, 3.859157, 1, 1, 1, 1, 1,
0.007899773, -2.283982, 3.239559, 1, 1, 1, 1, 1,
0.01132452, -0.2872699, 3.262846, 1, 1, 1, 1, 1,
0.01198592, 1.918035, 0.5536633, 1, 1, 1, 1, 1,
0.01541325, 0.1027426, 1.28104, 1, 1, 1, 1, 1,
0.01954992, -1.246563, 3.93107, 1, 1, 1, 1, 1,
0.02042314, 0.9750155, -0.522998, 1, 1, 1, 1, 1,
0.02247288, 0.2197524, -0.915473, 1, 1, 1, 1, 1,
0.02842472, 1.290493, -1.02501, 0, 0, 1, 1, 1,
0.02936354, -1.202961, 4.842672, 1, 0, 0, 1, 1,
0.03093604, -0.5700775, 2.502033, 1, 0, 0, 1, 1,
0.03536272, 0.3140157, -1.06672, 1, 0, 0, 1, 1,
0.0354878, -2.067316, 2.214526, 1, 0, 0, 1, 1,
0.03573748, -0.3794226, 3.345798, 1, 0, 0, 1, 1,
0.03738715, 0.9239583, -0.06926785, 0, 0, 0, 1, 1,
0.03765538, -0.08039814, 1.934852, 0, 0, 0, 1, 1,
0.03853582, 0.303582, -1.26815, 0, 0, 0, 1, 1,
0.04006442, -0.6449136, 4.377038, 0, 0, 0, 1, 1,
0.04043298, -0.3258214, 3.399258, 0, 0, 0, 1, 1,
0.04061581, 0.4098263, 0.4802158, 0, 0, 0, 1, 1,
0.04185738, 0.2728242, 2.435815, 0, 0, 0, 1, 1,
0.04186767, 1.410109, -0.7569621, 1, 1, 1, 1, 1,
0.04234187, -1.626431, 2.653853, 1, 1, 1, 1, 1,
0.04551618, -0.9897826, 1.459268, 1, 1, 1, 1, 1,
0.05182478, -0.7336779, 3.543733, 1, 1, 1, 1, 1,
0.05244249, -0.4027707, 1.795666, 1, 1, 1, 1, 1,
0.05914574, -0.7903985, 4.820447, 1, 1, 1, 1, 1,
0.05922745, -0.399311, 3.435656, 1, 1, 1, 1, 1,
0.06023093, -0.566651, 3.883077, 1, 1, 1, 1, 1,
0.06175542, 0.2117851, 1.35797, 1, 1, 1, 1, 1,
0.06386068, -0.9527335, 4.252285, 1, 1, 1, 1, 1,
0.06919606, -1.721481, 1.059576, 1, 1, 1, 1, 1,
0.07189616, -0.6028106, 2.64305, 1, 1, 1, 1, 1,
0.07969636, 0.07668174, -0.1518172, 1, 1, 1, 1, 1,
0.086536, -0.4320677, 3.150095, 1, 1, 1, 1, 1,
0.0872881, -1.449363, 4.100184, 1, 1, 1, 1, 1,
0.09047081, 0.6986647, 2.148304, 0, 0, 1, 1, 1,
0.09119687, 1.774381, 0.2541839, 1, 0, 0, 1, 1,
0.09881418, -0.08103383, 2.903437, 1, 0, 0, 1, 1,
0.09973568, 0.8517013, 0.5453905, 1, 0, 0, 1, 1,
0.1017986, -1.012794, 2.750054, 1, 0, 0, 1, 1,
0.1021075, -1.123736, 3.126137, 1, 0, 0, 1, 1,
0.1032187, -1.419275, 1.762226, 0, 0, 0, 1, 1,
0.1077268, -0.3348839, 4.886929, 0, 0, 0, 1, 1,
0.1089809, 0.4371239, 0.750468, 0, 0, 0, 1, 1,
0.1177419, -0.1767437, 4.132656, 0, 0, 0, 1, 1,
0.1222401, 0.3636419, -0.3769471, 0, 0, 0, 1, 1,
0.1279718, -0.4775899, 1.383211, 0, 0, 0, 1, 1,
0.1311208, -0.2116168, 1.743577, 0, 0, 0, 1, 1,
0.1340618, 0.3176819, -1.574565, 1, 1, 1, 1, 1,
0.1348418, -0.459813, 2.399819, 1, 1, 1, 1, 1,
0.1351541, -0.8618258, 1.679727, 1, 1, 1, 1, 1,
0.1358862, -0.2821963, 2.161835, 1, 1, 1, 1, 1,
0.1426683, 0.1770248, 0.6915585, 1, 1, 1, 1, 1,
0.1438125, 0.06630082, 1.807872, 1, 1, 1, 1, 1,
0.1474366, 0.6872326, -0.8862218, 1, 1, 1, 1, 1,
0.148572, -0.7085883, 2.125691, 1, 1, 1, 1, 1,
0.1543379, -0.5195587, 3.393214, 1, 1, 1, 1, 1,
0.1555634, -0.2731043, 3.30472, 1, 1, 1, 1, 1,
0.1576353, -1.631454, 3.018845, 1, 1, 1, 1, 1,
0.1578834, -0.3413344, 2.719344, 1, 1, 1, 1, 1,
0.1597741, 0.8807642, 0.2500945, 1, 1, 1, 1, 1,
0.1623713, -1.074916, 4.448281, 1, 1, 1, 1, 1,
0.1637303, 1.022864, 0.4913282, 1, 1, 1, 1, 1,
0.1652217, 0.6836963, 0.2968937, 0, 0, 1, 1, 1,
0.1692131, -1.293161, 1.176266, 1, 0, 0, 1, 1,
0.1698939, 0.6996086, 1.197834, 1, 0, 0, 1, 1,
0.1714479, 0.4176937, 1.649846, 1, 0, 0, 1, 1,
0.182214, 1.035386, -0.1445074, 1, 0, 0, 1, 1,
0.1843948, -1.210133, 3.593614, 1, 0, 0, 1, 1,
0.1923906, 0.187237, 1.186115, 0, 0, 0, 1, 1,
0.1974108, 0.464513, -1.549217, 0, 0, 0, 1, 1,
0.2013266, -0.04524073, 2.079989, 0, 0, 0, 1, 1,
0.2013316, 0.5040734, 1.714303, 0, 0, 0, 1, 1,
0.2028038, 1.642863, 1.102384, 0, 0, 0, 1, 1,
0.2030469, -1.023894, 1.879245, 0, 0, 0, 1, 1,
0.2036117, 0.6837784, 0.6190125, 0, 0, 0, 1, 1,
0.2048782, 0.6747392, 0.351695, 1, 1, 1, 1, 1,
0.2069721, 0.6704792, 0.9434453, 1, 1, 1, 1, 1,
0.2113331, -2.715022, 2.910133, 1, 1, 1, 1, 1,
0.2174046, -0.4451704, 1.58478, 1, 1, 1, 1, 1,
0.2253598, 1.248535, -0.01180876, 1, 1, 1, 1, 1,
0.2274899, 1.417833, -0.5285836, 1, 1, 1, 1, 1,
0.2338417, -0.783236, 3.332795, 1, 1, 1, 1, 1,
0.2343853, 0.2824926, 0.006119366, 1, 1, 1, 1, 1,
0.2351284, -1.45289, 2.324862, 1, 1, 1, 1, 1,
0.2379799, 0.6999523, 0.09444384, 1, 1, 1, 1, 1,
0.2438647, -0.5916264, 2.104102, 1, 1, 1, 1, 1,
0.2447271, 0.8691502, 0.3622444, 1, 1, 1, 1, 1,
0.2457408, -1.583651, 1.43956, 1, 1, 1, 1, 1,
0.2534162, 0.4597089, -0.1349585, 1, 1, 1, 1, 1,
0.2534361, -1.599573, 1.271742, 1, 1, 1, 1, 1,
0.2541381, -0.9707512, 4.930088, 0, 0, 1, 1, 1,
0.2558996, 0.3974888, 0.9753325, 1, 0, 0, 1, 1,
0.2560915, 0.07540496, 1.569723, 1, 0, 0, 1, 1,
0.2603445, 0.6685482, 0.7298265, 1, 0, 0, 1, 1,
0.2629407, 1.704211, 0.9932529, 1, 0, 0, 1, 1,
0.2629789, 0.29929, 1.120477, 1, 0, 0, 1, 1,
0.2655601, -0.1921055, 3.098561, 0, 0, 0, 1, 1,
0.2668911, -1.56414, 2.198503, 0, 0, 0, 1, 1,
0.2693445, 0.7676654, 0.8915042, 0, 0, 0, 1, 1,
0.2710669, -1.271441, 1.859185, 0, 0, 0, 1, 1,
0.2733858, 0.8118512, 1.432095, 0, 0, 0, 1, 1,
0.2738762, 0.8697968, 0.4791806, 0, 0, 0, 1, 1,
0.2756059, -0.5340483, 1.815361, 0, 0, 0, 1, 1,
0.2779722, -0.4639451, 1.439283, 1, 1, 1, 1, 1,
0.2818358, 0.07850126, 1.651822, 1, 1, 1, 1, 1,
0.2825892, -0.1617372, 2.439443, 1, 1, 1, 1, 1,
0.2861969, -1.05002, 2.143342, 1, 1, 1, 1, 1,
0.2873648, 0.664615, 1.423533, 1, 1, 1, 1, 1,
0.2907563, -1.468806, 3.320524, 1, 1, 1, 1, 1,
0.2936876, 0.8980073, 1.402524, 1, 1, 1, 1, 1,
0.3076238, -0.4565364, 1.060316, 1, 1, 1, 1, 1,
0.3162825, -0.004950607, 1.286569, 1, 1, 1, 1, 1,
0.3170756, -0.5750793, 2.646268, 1, 1, 1, 1, 1,
0.3198036, -1.062312, 0.7998282, 1, 1, 1, 1, 1,
0.3209558, 0.4127635, 0.2545566, 1, 1, 1, 1, 1,
0.3212565, -0.008333972, 1.328915, 1, 1, 1, 1, 1,
0.322795, 0.4190013, 2.12225, 1, 1, 1, 1, 1,
0.3231636, 0.3976894, -0.5835748, 1, 1, 1, 1, 1,
0.3243136, 0.1955237, 1.631236, 0, 0, 1, 1, 1,
0.3337036, 0.363892, -0.5707364, 1, 0, 0, 1, 1,
0.3338916, 0.834219, 0.4670978, 1, 0, 0, 1, 1,
0.3339784, 0.008197475, 0.7195066, 1, 0, 0, 1, 1,
0.3391392, -1.168337, 2.403401, 1, 0, 0, 1, 1,
0.3425756, 1.060322, -0.1587278, 1, 0, 0, 1, 1,
0.3436629, -0.8600657, 3.071859, 0, 0, 0, 1, 1,
0.3470159, -1.897242, 4.221429, 0, 0, 0, 1, 1,
0.3552442, 0.1052388, 2.016187, 0, 0, 0, 1, 1,
0.355373, -0.4664, 2.503382, 0, 0, 0, 1, 1,
0.3617534, 0.5239562, 0.5387453, 0, 0, 0, 1, 1,
0.368326, -0.01826847, 1.824479, 0, 0, 0, 1, 1,
0.3725494, 0.1694008, 1.007147, 0, 0, 0, 1, 1,
0.3759227, 1.237955, 2.032589, 1, 1, 1, 1, 1,
0.3762572, -0.1575464, 1.314299, 1, 1, 1, 1, 1,
0.3802884, 0.06481049, 1.97131, 1, 1, 1, 1, 1,
0.3812089, 0.6548738, 0.53035, 1, 1, 1, 1, 1,
0.3813166, 1.049715, 0.5589525, 1, 1, 1, 1, 1,
0.3821399, 0.7655522, -0.4577565, 1, 1, 1, 1, 1,
0.389886, 0.6504368, -1.65899, 1, 1, 1, 1, 1,
0.3912047, -0.178958, 2.549936, 1, 1, 1, 1, 1,
0.392095, 1.412005, 0.461888, 1, 1, 1, 1, 1,
0.3948964, 0.9655386, -0.7974472, 1, 1, 1, 1, 1,
0.3954615, -1.062926, 2.161515, 1, 1, 1, 1, 1,
0.4017716, -0.2582544, 2.199883, 1, 1, 1, 1, 1,
0.4115644, 0.4218841, 3.054255, 1, 1, 1, 1, 1,
0.4118679, -0.5262891, 2.583481, 1, 1, 1, 1, 1,
0.4140004, 0.5302329, 1.71763, 1, 1, 1, 1, 1,
0.4146052, 1.090798, -0.6428908, 0, 0, 1, 1, 1,
0.4155829, 1.860899, 0.4028855, 1, 0, 0, 1, 1,
0.4191318, -0.9790069, 2.280772, 1, 0, 0, 1, 1,
0.4247656, -0.4957615, 1.397195, 1, 0, 0, 1, 1,
0.4248628, 0.5729214, 0.5740963, 1, 0, 0, 1, 1,
0.4304445, 1.52308, 1.29168, 1, 0, 0, 1, 1,
0.4306665, 0.8203062, 2.008449, 0, 0, 0, 1, 1,
0.431224, -1.004529, 2.040067, 0, 0, 0, 1, 1,
0.4359221, 0.9921407, 0.3679339, 0, 0, 0, 1, 1,
0.4360567, -0.7711744, 1.342096, 0, 0, 0, 1, 1,
0.4409365, -0.3839864, 3.428652, 0, 0, 0, 1, 1,
0.4424357, 1.553024, 0.5450728, 0, 0, 0, 1, 1,
0.4459785, 0.8003331, 0.1786596, 0, 0, 0, 1, 1,
0.4513707, 0.5440605, 1.24581, 1, 1, 1, 1, 1,
0.4541829, 0.1809191, 1.999656, 1, 1, 1, 1, 1,
0.4569197, -0.8662958, 2.974637, 1, 1, 1, 1, 1,
0.4628802, -0.8812306, 2.507928, 1, 1, 1, 1, 1,
0.4662203, 1.516911, 0.3345619, 1, 1, 1, 1, 1,
0.4666499, -0.4851771, 2.635597, 1, 1, 1, 1, 1,
0.4669875, 0.9658229, 0.1022243, 1, 1, 1, 1, 1,
0.4699941, 0.152853, 1.342736, 1, 1, 1, 1, 1,
0.4769575, 0.04756717, 1.207725, 1, 1, 1, 1, 1,
0.4835477, 0.1393119, -0.1414748, 1, 1, 1, 1, 1,
0.4893839, 1.412649, 1.572646, 1, 1, 1, 1, 1,
0.4899712, -0.2213842, 0.7076481, 1, 1, 1, 1, 1,
0.4917043, 0.08670026, 2.022179, 1, 1, 1, 1, 1,
0.4968525, 0.6603618, -0.05208075, 1, 1, 1, 1, 1,
0.5017712, -1.928211, 1.825787, 1, 1, 1, 1, 1,
0.5027342, -0.5446111, 1.882959, 0, 0, 1, 1, 1,
0.5061325, 0.7774895, 1.760213, 1, 0, 0, 1, 1,
0.5069095, 0.6075477, 1.572369, 1, 0, 0, 1, 1,
0.5095512, -0.3949446, 1.204868, 1, 0, 0, 1, 1,
0.5109124, -0.5452051, 3.540116, 1, 0, 0, 1, 1,
0.5137463, 0.05361566, 0.9986761, 1, 0, 0, 1, 1,
0.5144155, -0.6866457, 3.033714, 0, 0, 0, 1, 1,
0.5160689, -0.3338541, 2.076493, 0, 0, 0, 1, 1,
0.5175034, 1.220396, 0.003829201, 0, 0, 0, 1, 1,
0.5183097, -0.635855, 3.266951, 0, 0, 0, 1, 1,
0.5207257, -0.13383, 1.353518, 0, 0, 0, 1, 1,
0.5209303, -0.2729398, 1.817876, 0, 0, 0, 1, 1,
0.5311772, -0.6583794, -0.6875194, 0, 0, 0, 1, 1,
0.5314912, -1.13344, 1.896144, 1, 1, 1, 1, 1,
0.5341983, -1.044464, 1.835756, 1, 1, 1, 1, 1,
0.5350947, -0.6260949, 1.154325, 1, 1, 1, 1, 1,
0.5377396, -0.6140779, 5.08327, 1, 1, 1, 1, 1,
0.5382761, -1.07678, 2.873747, 1, 1, 1, 1, 1,
0.541153, 0.5753642, 0.7946581, 1, 1, 1, 1, 1,
0.5424061, 0.4055961, 0.917004, 1, 1, 1, 1, 1,
0.5508521, -0.111004, 3.380652, 1, 1, 1, 1, 1,
0.5580148, 0.5744079, 1.338497, 1, 1, 1, 1, 1,
0.5616654, -1.480011, 3.897891, 1, 1, 1, 1, 1,
0.5636076, 0.1756008, 0.9752033, 1, 1, 1, 1, 1,
0.5651165, -1.02343, 2.449542, 1, 1, 1, 1, 1,
0.5670388, 0.7231277, 0.2065819, 1, 1, 1, 1, 1,
0.5674295, -0.481816, 1.319809, 1, 1, 1, 1, 1,
0.5689839, 0.01225844, 1.643419, 1, 1, 1, 1, 1,
0.5696162, 0.1129418, -0.6774079, 0, 0, 1, 1, 1,
0.570552, 0.07817475, 1.699135, 1, 0, 0, 1, 1,
0.5727085, -1.585603, 3.179975, 1, 0, 0, 1, 1,
0.5755951, 1.263394, -0.5626295, 1, 0, 0, 1, 1,
0.577782, -0.3298355, 1.235535, 1, 0, 0, 1, 1,
0.5830407, -0.1012424, 2.304183, 1, 0, 0, 1, 1,
0.5856697, 0.4649855, 3.45521, 0, 0, 0, 1, 1,
0.5881833, 0.5066793, -0.04610557, 0, 0, 0, 1, 1,
0.5909424, 1.833123, 1.367161, 0, 0, 0, 1, 1,
0.5941547, 0.5626191, 0.1827899, 0, 0, 0, 1, 1,
0.5979818, 0.5388008, 0.5899062, 0, 0, 0, 1, 1,
0.6017431, 0.8814185, -0.1067224, 0, 0, 0, 1, 1,
0.6054233, 0.1103676, 0.9318575, 0, 0, 0, 1, 1,
0.6061958, -1.003097, 3.859263, 1, 1, 1, 1, 1,
0.6106218, 0.6265143, 2.539558, 1, 1, 1, 1, 1,
0.6117697, -0.8969846, 3.550721, 1, 1, 1, 1, 1,
0.6162285, 0.3871055, 0.1628544, 1, 1, 1, 1, 1,
0.6176208, 0.5943549, 0.2071758, 1, 1, 1, 1, 1,
0.6209437, -1.563021, 3.299511, 1, 1, 1, 1, 1,
0.6234018, -3.064628, 3.465947, 1, 1, 1, 1, 1,
0.6269845, -0.07575332, 2.525326, 1, 1, 1, 1, 1,
0.6296151, 0.6660419, 2.064177, 1, 1, 1, 1, 1,
0.633275, 0.1286393, 1.644807, 1, 1, 1, 1, 1,
0.6385701, -0.4792099, 1.736488, 1, 1, 1, 1, 1,
0.6387737, 1.193135, 1.82768, 1, 1, 1, 1, 1,
0.6407239, -1.80514, 0.3567714, 1, 1, 1, 1, 1,
0.6440668, -0.9271124, 2.040775, 1, 1, 1, 1, 1,
0.6449127, 0.2050688, 1.250874, 1, 1, 1, 1, 1,
0.6468416, 1.069906, -0.4904729, 0, 0, 1, 1, 1,
0.6473742, 0.6107126, 1.160832, 1, 0, 0, 1, 1,
0.6483617, 1.059358, 0.8591707, 1, 0, 0, 1, 1,
0.6508784, 1.096333, 0.8247564, 1, 0, 0, 1, 1,
0.6523863, 1.56565, 2.093641, 1, 0, 0, 1, 1,
0.6587111, -0.2297395, 1.118567, 1, 0, 0, 1, 1,
0.6589137, 0.4802545, 1.143977, 0, 0, 0, 1, 1,
0.66121, 1.446694, 1.168622, 0, 0, 0, 1, 1,
0.6677903, 0.3582116, 0.7114652, 0, 0, 0, 1, 1,
0.6757305, -1.135439, 2.08068, 0, 0, 0, 1, 1,
0.6798044, 0.7345836, 0.8912683, 0, 0, 0, 1, 1,
0.6818975, 1.632921, 0.1401607, 0, 0, 0, 1, 1,
0.6822487, 0.3371372, -0.2614402, 0, 0, 0, 1, 1,
0.6845837, 0.84982, 0.9261359, 1, 1, 1, 1, 1,
0.6896983, 0.06616002, 1.473639, 1, 1, 1, 1, 1,
0.6899592, 1.485158, 0.4460238, 1, 1, 1, 1, 1,
0.6953685, 0.2871107, 1.137208, 1, 1, 1, 1, 1,
0.6957201, 0.1968855, 3.598106, 1, 1, 1, 1, 1,
0.698456, 0.129646, 1.659049, 1, 1, 1, 1, 1,
0.7049032, 1.154818, -2.749183, 1, 1, 1, 1, 1,
0.7049198, 0.4336915, 0.1849852, 1, 1, 1, 1, 1,
0.7065071, 0.16166, 2.790338, 1, 1, 1, 1, 1,
0.7069329, -0.447836, 0.5160443, 1, 1, 1, 1, 1,
0.7103867, -0.8917795, 1.801825, 1, 1, 1, 1, 1,
0.7174527, 0.3830336, 0.0526589, 1, 1, 1, 1, 1,
0.7201737, -1.156267, 2.993774, 1, 1, 1, 1, 1,
0.7222803, 0.5990205, -0.002934526, 1, 1, 1, 1, 1,
0.7228984, 1.021176, 0.7439871, 1, 1, 1, 1, 1,
0.7261165, 1.693473, -0.8362462, 0, 0, 1, 1, 1,
0.7289951, -1.289184, 1.634434, 1, 0, 0, 1, 1,
0.7323819, 0.3611956, 2.057724, 1, 0, 0, 1, 1,
0.7387614, -0.7655079, 2.106008, 1, 0, 0, 1, 1,
0.7400561, -0.9714769, 1.557381, 1, 0, 0, 1, 1,
0.7439703, 0.3128801, 1.167455, 1, 0, 0, 1, 1,
0.7458814, -0.5789502, 1.056248, 0, 0, 0, 1, 1,
0.7464488, 0.579542, -0.06375463, 0, 0, 0, 1, 1,
0.7483455, 0.2851618, 1.914194, 0, 0, 0, 1, 1,
0.7546983, -0.0756927, 2.973679, 0, 0, 0, 1, 1,
0.7580174, -0.6180219, 1.435623, 0, 0, 0, 1, 1,
0.7599599, -0.5510897, 0.8403077, 0, 0, 0, 1, 1,
0.7631044, 0.9852539, 1.05186, 0, 0, 0, 1, 1,
0.7651836, 0.1661924, 2.182391, 1, 1, 1, 1, 1,
0.7673653, 1.425704, -1.573316, 1, 1, 1, 1, 1,
0.7685435, -0.2521967, 4.03815, 1, 1, 1, 1, 1,
0.7686419, -0.9278287, 0.9337343, 1, 1, 1, 1, 1,
0.7701151, -1.140384, 2.548567, 1, 1, 1, 1, 1,
0.7729269, -0.1293254, 2.54445, 1, 1, 1, 1, 1,
0.7754875, -1.987158, 5.449907, 1, 1, 1, 1, 1,
0.7820266, -0.6524276, 1.769131, 1, 1, 1, 1, 1,
0.7825202, 0.4494332, 3.373362, 1, 1, 1, 1, 1,
0.7849583, 0.8047181, -0.4778423, 1, 1, 1, 1, 1,
0.7862571, -0.9525095, 2.152073, 1, 1, 1, 1, 1,
0.7900189, 0.2539423, 0.8922281, 1, 1, 1, 1, 1,
0.7927659, 1.386083, 2.124802, 1, 1, 1, 1, 1,
0.795878, -0.02475342, 3.430042, 1, 1, 1, 1, 1,
0.79591, 1.146858, 0.9508151, 1, 1, 1, 1, 1,
0.8157794, -1.285214, 2.377383, 0, 0, 1, 1, 1,
0.8197944, 0.4862129, 0.362664, 1, 0, 0, 1, 1,
0.8248516, -1.746629, 1.677036, 1, 0, 0, 1, 1,
0.829169, 0.4190201, 0.3325419, 1, 0, 0, 1, 1,
0.8395664, 1.231989, 0.9998182, 1, 0, 0, 1, 1,
0.8429725, 0.249755, 3.009433, 1, 0, 0, 1, 1,
0.8433151, 0.3312002, 2.134952, 0, 0, 0, 1, 1,
0.8457024, 1.022613, -0.4113935, 0, 0, 0, 1, 1,
0.8477217, 0.3922469, 1.771696, 0, 0, 0, 1, 1,
0.8494784, 0.5999044, 0.9971277, 0, 0, 0, 1, 1,
0.8501561, 1.116861, 2.357254, 0, 0, 0, 1, 1,
0.8532822, 1.415694, -0.8882809, 0, 0, 0, 1, 1,
0.8539313, -0.614686, 3.536914, 0, 0, 0, 1, 1,
0.8652017, -0.293108, 2.356628, 1, 1, 1, 1, 1,
0.8733412, -1.004436, 2.692387, 1, 1, 1, 1, 1,
0.8754628, 0.179438, 2.987335, 1, 1, 1, 1, 1,
0.8829123, -0.5231974, 1.674577, 1, 1, 1, 1, 1,
0.8848706, 1.248376, 0.9078808, 1, 1, 1, 1, 1,
0.8864351, -1.057076, 1.820455, 1, 1, 1, 1, 1,
0.8869686, 0.7241021, 0.9625865, 1, 1, 1, 1, 1,
0.8875399, -1.015282, 3.986997, 1, 1, 1, 1, 1,
0.8945156, 2.27672, 1.464893, 1, 1, 1, 1, 1,
0.8955912, 3.191486, 1.014182, 1, 1, 1, 1, 1,
0.8960755, 0.47811, 0.8289966, 1, 1, 1, 1, 1,
0.8967368, 0.5138747, -0.7932876, 1, 1, 1, 1, 1,
0.9036867, -0.04483685, -0.4770698, 1, 1, 1, 1, 1,
0.9046522, -0.8637063, 1.008308, 1, 1, 1, 1, 1,
0.9119748, -0.7573949, 1.466534, 1, 1, 1, 1, 1,
0.9137747, -1.865632, 4.297616, 0, 0, 1, 1, 1,
0.9138834, 1.986737, 1.437003, 1, 0, 0, 1, 1,
0.9186031, -1.440733, 2.451597, 1, 0, 0, 1, 1,
0.9219095, 0.778704, 2.272079, 1, 0, 0, 1, 1,
0.9228288, -0.5663207, 1.65974, 1, 0, 0, 1, 1,
0.9230976, -1.149441, 0.5970812, 1, 0, 0, 1, 1,
0.924436, 1.038721, 1.77283, 0, 0, 0, 1, 1,
0.9251613, -0.4503216, 1.521334, 0, 0, 0, 1, 1,
0.9277295, -0.061469, 1.890465, 0, 0, 0, 1, 1,
0.9291775, 0.5242811, 0.5337501, 0, 0, 0, 1, 1,
0.9331034, -0.1855991, 1.831958, 0, 0, 0, 1, 1,
0.9353835, 2.188666, 0.439489, 0, 0, 0, 1, 1,
0.9380899, 0.5373242, 1.972102, 0, 0, 0, 1, 1,
0.9398735, 0.8378954, -0.143884, 1, 1, 1, 1, 1,
0.9406682, -0.6342718, 1.142444, 1, 1, 1, 1, 1,
0.9469998, -0.8946877, 3.126212, 1, 1, 1, 1, 1,
0.950834, -1.817472, 3.239206, 1, 1, 1, 1, 1,
0.9562874, 0.5066873, 1.154359, 1, 1, 1, 1, 1,
0.9620425, -0.7761866, 4.250769, 1, 1, 1, 1, 1,
0.9629552, -0.2655659, 2.010104, 1, 1, 1, 1, 1,
0.9704391, -0.7793268, 0.8115221, 1, 1, 1, 1, 1,
0.9711101, -0.1024646, 1.621928, 1, 1, 1, 1, 1,
0.9714037, 1.033204, 2.493032, 1, 1, 1, 1, 1,
0.9757078, 1.569649, -1.045006, 1, 1, 1, 1, 1,
0.9763156, -0.7219942, 2.817247, 1, 1, 1, 1, 1,
0.9770007, -1.021304, 2.383669, 1, 1, 1, 1, 1,
0.9801405, -1.055375, 1.382592, 1, 1, 1, 1, 1,
0.9845397, 0.1350028, 2.834059, 1, 1, 1, 1, 1,
0.9845591, -2.240181, 1.958104, 0, 0, 1, 1, 1,
0.9849187, -0.8155541, 2.170858, 1, 0, 0, 1, 1,
0.9900236, -0.603856, 1.496832, 1, 0, 0, 1, 1,
0.9901996, 0.03178099, -0.4342983, 1, 0, 0, 1, 1,
0.9985445, 1.15616, 0.1763102, 1, 0, 0, 1, 1,
0.9991376, -0.6131293, 3.160592, 1, 0, 0, 1, 1,
1.002427, -0.5621569, 2.415657, 0, 0, 0, 1, 1,
1.007388, 1.098982, 0.9325446, 0, 0, 0, 1, 1,
1.019128, -3.550753, 3.335527, 0, 0, 0, 1, 1,
1.020751, 0.7143224, 3.001844, 0, 0, 0, 1, 1,
1.023031, -0.9950746, 1.995234, 0, 0, 0, 1, 1,
1.028853, 0.7323042, -0.1181412, 0, 0, 0, 1, 1,
1.03527, -0.6488769, 2.434019, 0, 0, 0, 1, 1,
1.039966, 1.229624, 0.4702644, 1, 1, 1, 1, 1,
1.044231, 0.4483231, 1.058925, 1, 1, 1, 1, 1,
1.046384, -0.8132511, 2.266649, 1, 1, 1, 1, 1,
1.047222, 1.006555, 1.627037, 1, 1, 1, 1, 1,
1.047409, 0.5774459, 1.335159, 1, 1, 1, 1, 1,
1.048907, -0.8486557, 1.439266, 1, 1, 1, 1, 1,
1.050688, 1.269332, -1.488334, 1, 1, 1, 1, 1,
1.061312, 0.5361494, 1.394348, 1, 1, 1, 1, 1,
1.082826, 1.1717, -1.059564, 1, 1, 1, 1, 1,
1.088691, -0.612464, 0.9395964, 1, 1, 1, 1, 1,
1.089409, 1.167845, -0.1052086, 1, 1, 1, 1, 1,
1.090225, -0.1255406, 1.172574, 1, 1, 1, 1, 1,
1.090447, 0.3773904, 2.281638, 1, 1, 1, 1, 1,
1.091558, 1.285309, 1.523172, 1, 1, 1, 1, 1,
1.093925, 0.5900966, -0.4026605, 1, 1, 1, 1, 1,
1.105357, -1.602716, 2.526775, 0, 0, 1, 1, 1,
1.109888, -0.2477186, 1.049526, 1, 0, 0, 1, 1,
1.119976, -0.1447368, 2.835272, 1, 0, 0, 1, 1,
1.123606, -0.916831, 2.931417, 1, 0, 0, 1, 1,
1.130988, -1.97773, 1.816129, 1, 0, 0, 1, 1,
1.140984, -0.3899684, 1.056951, 1, 0, 0, 1, 1,
1.15496, 0.4184795, 1.711558, 0, 0, 0, 1, 1,
1.155317, 0.7729444, 0.2765646, 0, 0, 0, 1, 1,
1.155451, 1.108253, 0.736718, 0, 0, 0, 1, 1,
1.166551, 0.9831597, 0.4284341, 0, 0, 0, 1, 1,
1.170718, -0.9908764, 1.177634, 0, 0, 0, 1, 1,
1.174178, -0.0716323, 4.311266, 0, 0, 0, 1, 1,
1.183297, 0.2047848, 3.180616, 0, 0, 0, 1, 1,
1.184511, 0.1000241, 1.327781, 1, 1, 1, 1, 1,
1.184648, 0.1539831, 0.6287969, 1, 1, 1, 1, 1,
1.192083, -1.036382, 3.383305, 1, 1, 1, 1, 1,
1.193135, -0.92881, 2.06574, 1, 1, 1, 1, 1,
1.194927, -0.2824301, 3.57495, 1, 1, 1, 1, 1,
1.200149, 0.5036902, 1.401269, 1, 1, 1, 1, 1,
1.200171, 0.08381719, 0.5916947, 1, 1, 1, 1, 1,
1.202001, 0.1264572, 1.729066, 1, 1, 1, 1, 1,
1.203897, -0.2267603, 2.768188, 1, 1, 1, 1, 1,
1.21066, -0.3873405, 1.967461, 1, 1, 1, 1, 1,
1.226364, 1.049368, 1.631998, 1, 1, 1, 1, 1,
1.249882, 0.1253537, 1.556529, 1, 1, 1, 1, 1,
1.252757, -0.2362553, 2.643136, 1, 1, 1, 1, 1,
1.264838, -0.5312017, 2.468595, 1, 1, 1, 1, 1,
1.268379, 0.3563865, 2.079739, 1, 1, 1, 1, 1,
1.268663, -1.193549, 3.798536, 0, 0, 1, 1, 1,
1.270973, -2.146061, 3.42545, 1, 0, 0, 1, 1,
1.287276, 1.066779, 0.1489214, 1, 0, 0, 1, 1,
1.288417, 1.087025, 0.1877545, 1, 0, 0, 1, 1,
1.303123, 1.392846, 0.8141046, 1, 0, 0, 1, 1,
1.303589, -0.131738, 3.20358, 1, 0, 0, 1, 1,
1.307506, -0.8744605, 4.423386, 0, 0, 0, 1, 1,
1.310451, -1.608305, 2.083575, 0, 0, 0, 1, 1,
1.319582, -2.285858, 1.687205, 0, 0, 0, 1, 1,
1.323135, -0.6872033, 2.417054, 0, 0, 0, 1, 1,
1.329877, -0.2280669, 2.261709, 0, 0, 0, 1, 1,
1.330846, -0.1217509, 1.141456, 0, 0, 0, 1, 1,
1.33286, 0.6087308, 1.565577, 0, 0, 0, 1, 1,
1.33565, 0.9219313, -0.5698398, 1, 1, 1, 1, 1,
1.343184, 1.227401, -0.7394968, 1, 1, 1, 1, 1,
1.343324, 0.9199742, 3.058716, 1, 1, 1, 1, 1,
1.354454, -1.231428, 2.144121, 1, 1, 1, 1, 1,
1.355207, 2.27001, -0.3535064, 1, 1, 1, 1, 1,
1.361329, 2.387417, 0.3668947, 1, 1, 1, 1, 1,
1.362828, -2.377748, 1.458456, 1, 1, 1, 1, 1,
1.373284, 0.3784635, 2.444944, 1, 1, 1, 1, 1,
1.37409, 0.8895713, 1.195398, 1, 1, 1, 1, 1,
1.382399, -2.310217, 2.0954, 1, 1, 1, 1, 1,
1.385064, -2.697455, 1.431205, 1, 1, 1, 1, 1,
1.389973, 0.6674157, 0.03356415, 1, 1, 1, 1, 1,
1.401478, 0.2478703, 2.285031, 1, 1, 1, 1, 1,
1.409936, -1.273022, 2.952092, 1, 1, 1, 1, 1,
1.416862, 0.7511535, 1.542715, 1, 1, 1, 1, 1,
1.426897, -0.4595828, 0.5736526, 0, 0, 1, 1, 1,
1.442449, 1.13545, -0.5945058, 1, 0, 0, 1, 1,
1.447386, 1.497185, 1.904217, 1, 0, 0, 1, 1,
1.448408, 2.345865, -1.669568, 1, 0, 0, 1, 1,
1.450481, 1.424261, 1.67978, 1, 0, 0, 1, 1,
1.463229, -0.1249022, -0.5388421, 1, 0, 0, 1, 1,
1.466127, -0.05156443, 2.384558, 0, 0, 0, 1, 1,
1.489642, 0.2299091, 1.626397, 0, 0, 0, 1, 1,
1.507767, 1.212149, 0.0702819, 0, 0, 0, 1, 1,
1.509804, -0.4374255, 1.857257, 0, 0, 0, 1, 1,
1.512776, 1.512984, 0.7684476, 0, 0, 0, 1, 1,
1.514166, -0.5434434, 1.43282, 0, 0, 0, 1, 1,
1.51627, 0.1328043, 1.342883, 0, 0, 0, 1, 1,
1.521316, -1.266779, 1.090328, 1, 1, 1, 1, 1,
1.530713, 1.11138, 0.5469036, 1, 1, 1, 1, 1,
1.538337, -0.5445457, 1.01462, 1, 1, 1, 1, 1,
1.545184, -0.8062159, 0.05250256, 1, 1, 1, 1, 1,
1.545825, 1.121903, 1.987853, 1, 1, 1, 1, 1,
1.55203, -0.2577986, 3.223451, 1, 1, 1, 1, 1,
1.565653, 1.206834, 0.5716432, 1, 1, 1, 1, 1,
1.597053, 0.03948019, 1.506093, 1, 1, 1, 1, 1,
1.598617, -1.66018, 3.68281, 1, 1, 1, 1, 1,
1.611948, -1.415589, 3.855385, 1, 1, 1, 1, 1,
1.630822, 0.1960579, 3.776513, 1, 1, 1, 1, 1,
1.63531, 0.6919377, 0.5439609, 1, 1, 1, 1, 1,
1.648112, 1.831376, -0.7294763, 1, 1, 1, 1, 1,
1.654276, 0.4423133, 0.005117008, 1, 1, 1, 1, 1,
1.657498, -0.8465261, 2.778711, 1, 1, 1, 1, 1,
1.658249, -0.6413393, 3.976576, 0, 0, 1, 1, 1,
1.660807, -0.8847379, 3.491307, 1, 0, 0, 1, 1,
1.66328, 0.1801799, 1.331362, 1, 0, 0, 1, 1,
1.674821, 0.2437543, 2.106573, 1, 0, 0, 1, 1,
1.675655, 0.8005324, 1.065682, 1, 0, 0, 1, 1,
1.689681, -0.5423849, 1.95114, 1, 0, 0, 1, 1,
1.69021, -0.01259549, 1.255639, 0, 0, 0, 1, 1,
1.690565, -0.1819183, -0.0917141, 0, 0, 0, 1, 1,
1.697295, 0.3670928, 2.581785, 0, 0, 0, 1, 1,
1.700268, 0.8565012, 1.820618, 0, 0, 0, 1, 1,
1.709575, 1.129758, 0.529341, 0, 0, 0, 1, 1,
1.728217, 0.7839166, 1.340903, 0, 0, 0, 1, 1,
1.729856, -1.963815, 1.05151, 0, 0, 0, 1, 1,
1.730819, 2.576116, -0.2489759, 1, 1, 1, 1, 1,
1.733276, 0.06914313, 1.650416, 1, 1, 1, 1, 1,
1.758183, -1.488712, 2.56131, 1, 1, 1, 1, 1,
1.765624, -0.2477306, 2.74896, 1, 1, 1, 1, 1,
1.769328, -1.776893, 2.334461, 1, 1, 1, 1, 1,
1.771808, -0.04050163, 2.469663, 1, 1, 1, 1, 1,
1.773601, 1.89979, 2.248419, 1, 1, 1, 1, 1,
1.779371, 2.150629, -1.450622, 1, 1, 1, 1, 1,
1.784446, -0.09442102, 3.446149, 1, 1, 1, 1, 1,
1.805355, -0.8628768, -0.4506288, 1, 1, 1, 1, 1,
1.807374, 0.8833774, -0.2927639, 1, 1, 1, 1, 1,
1.807911, 0.2378553, 0.6444751, 1, 1, 1, 1, 1,
1.818386, 2.465419, -0.827121, 1, 1, 1, 1, 1,
1.821505, 0.2640118, -0.7146904, 1, 1, 1, 1, 1,
1.826201, 0.2362784, 2.179482, 1, 1, 1, 1, 1,
1.881998, -0.07227334, 1.099072, 0, 0, 1, 1, 1,
1.885415, 1.451443, -0.3351695, 1, 0, 0, 1, 1,
1.88648, -1.354002, 1.478433, 1, 0, 0, 1, 1,
1.919906, 1.105777, 0.9666255, 1, 0, 0, 1, 1,
1.944788, 0.08245575, 1.014919, 1, 0, 0, 1, 1,
1.952607, -0.4480959, 2.027333, 1, 0, 0, 1, 1,
1.967583, -0.5329123, 2.566092, 0, 0, 0, 1, 1,
1.97682, -0.1876354, 0.6033562, 0, 0, 0, 1, 1,
1.999673, -0.7146378, 1.152858, 0, 0, 0, 1, 1,
2.034261, -0.8321598, 2.074159, 0, 0, 0, 1, 1,
2.039352, 1.349014, 1.53235, 0, 0, 0, 1, 1,
2.125347, -1.271187, 1.907796, 0, 0, 0, 1, 1,
2.147849, 0.1345724, 2.540644, 0, 0, 0, 1, 1,
2.26574, -0.1190968, 1.911224, 1, 1, 1, 1, 1,
2.297205, -2.163491, 2.185739, 1, 1, 1, 1, 1,
2.362624, 1.345656, 0.8343231, 1, 1, 1, 1, 1,
2.431329, -1.482198, 0.5536531, 1, 1, 1, 1, 1,
2.486165, -1.342911, 1.71164, 1, 1, 1, 1, 1,
2.676748, 0.3493689, 1.032394, 1, 1, 1, 1, 1,
3.665982, 0.6435541, 0.804578, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.758387;
var distance = 34.27592;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.230408, 0.1377215, -0.1610196 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.27592);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
