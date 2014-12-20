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
-3.115481, -0.05894001, -1.446746, 1, 0, 0, 1,
-3.012292, -0.06029779, -1.662714, 1, 0.007843138, 0, 1,
-2.960429, -1.501798, -2.339303, 1, 0.01176471, 0, 1,
-2.804853, 1.331771, -1.0823, 1, 0.01960784, 0, 1,
-2.664777, 0.7499424, -0.572656, 1, 0.02352941, 0, 1,
-2.602592, -0.1227502, -1.652833, 1, 0.03137255, 0, 1,
-2.529213, -0.4778584, -1.554988, 1, 0.03529412, 0, 1,
-2.430249, -0.2580693, 0.241515, 1, 0.04313726, 0, 1,
-2.418677, 0.176265, -1.615578, 1, 0.04705882, 0, 1,
-2.365452, 0.3182063, -1.182042, 1, 0.05490196, 0, 1,
-2.302465, 0.09085789, -1.745598, 1, 0.05882353, 0, 1,
-2.287893, -1.010445, -1.25343, 1, 0.06666667, 0, 1,
-2.286699, -1.658166, -1.742581, 1, 0.07058824, 0, 1,
-2.277689, 2.452789, -0.9156282, 1, 0.07843138, 0, 1,
-2.267242, 0.8173468, -2.407866, 1, 0.08235294, 0, 1,
-2.129656, 1.07438, -1.054503, 1, 0.09019608, 0, 1,
-2.103691, 1.333442, 0.1883008, 1, 0.09411765, 0, 1,
-2.087934, 0.4980381, -0.6931381, 1, 0.1019608, 0, 1,
-2.08762, 0.4573368, -2.456286, 1, 0.1098039, 0, 1,
-2.068919, -1.245866, -2.202567, 1, 0.1137255, 0, 1,
-2.018107, -1.476446, -1.807647, 1, 0.1215686, 0, 1,
-2.00633, -0.0677202, -1.485022, 1, 0.1254902, 0, 1,
-1.976549, -1.197148, -1.977402, 1, 0.1333333, 0, 1,
-1.974812, 0.5425537, -3.034369, 1, 0.1372549, 0, 1,
-1.943394, -1.076949, -1.501477, 1, 0.145098, 0, 1,
-1.94234, -0.06990423, -1.318565, 1, 0.1490196, 0, 1,
-1.872873, 0.4157224, -2.412177, 1, 0.1568628, 0, 1,
-1.852266, -1.585167, -1.059911, 1, 0.1607843, 0, 1,
-1.83738, 0.02509022, -2.32264, 1, 0.1686275, 0, 1,
-1.823302, -1.171871, -1.479188, 1, 0.172549, 0, 1,
-1.817454, 0.5677615, -0.8676043, 1, 0.1803922, 0, 1,
-1.775597, -0.6607329, -0.6766657, 1, 0.1843137, 0, 1,
-1.767662, 0.2070661, -1.704165, 1, 0.1921569, 0, 1,
-1.764034, 1.618143, -1.059761, 1, 0.1960784, 0, 1,
-1.75083, 1.037385, -1.21162, 1, 0.2039216, 0, 1,
-1.74346, -0.02643024, -1.013357, 1, 0.2117647, 0, 1,
-1.7226, 0.6003985, -1.302026, 1, 0.2156863, 0, 1,
-1.721233, 0.1869211, -1.197755, 1, 0.2235294, 0, 1,
-1.709038, -1.894251, -1.491137, 1, 0.227451, 0, 1,
-1.704681, 0.6965197, 0.002259503, 1, 0.2352941, 0, 1,
-1.702881, -1.129617, -0.9093559, 1, 0.2392157, 0, 1,
-1.702775, -0.579536, -3.072286, 1, 0.2470588, 0, 1,
-1.681036, 0.3209539, -2.385406, 1, 0.2509804, 0, 1,
-1.648661, -0.2013085, -1.361632, 1, 0.2588235, 0, 1,
-1.629126, -0.6208501, -1.440866, 1, 0.2627451, 0, 1,
-1.610721, 0.103761, -3.090364, 1, 0.2705882, 0, 1,
-1.587307, 0.8599191, -1.668457, 1, 0.2745098, 0, 1,
-1.575361, 0.7660202, -0.8934962, 1, 0.282353, 0, 1,
-1.540833, -0.5372051, -1.302202, 1, 0.2862745, 0, 1,
-1.528149, -0.8118245, -1.016474, 1, 0.2941177, 0, 1,
-1.526514, 1.529626, -0.2041566, 1, 0.3019608, 0, 1,
-1.510176, -0.05715588, -1.854766, 1, 0.3058824, 0, 1,
-1.494115, 0.9316423, 2.316615, 1, 0.3137255, 0, 1,
-1.485579, 2.453608, -0.8396746, 1, 0.3176471, 0, 1,
-1.481717, -0.3497529, -2.086178, 1, 0.3254902, 0, 1,
-1.46347, 0.08549064, -2.521728, 1, 0.3294118, 0, 1,
-1.460195, 0.9250629, -1.420239, 1, 0.3372549, 0, 1,
-1.439175, 0.8768409, 0.0860008, 1, 0.3411765, 0, 1,
-1.429827, 0.3805085, -0.6468904, 1, 0.3490196, 0, 1,
-1.421373, -1.155647, -1.199309, 1, 0.3529412, 0, 1,
-1.405984, -1.584896, -2.636988, 1, 0.3607843, 0, 1,
-1.396957, -0.1382032, -2.231694, 1, 0.3647059, 0, 1,
-1.393789, -0.6325784, -0.6178778, 1, 0.372549, 0, 1,
-1.388923, 1.82352, -0.7274423, 1, 0.3764706, 0, 1,
-1.377643, 1.494049, 1.285105, 1, 0.3843137, 0, 1,
-1.372763, -1.042911, -1.86, 1, 0.3882353, 0, 1,
-1.365873, 1.625005, -2.134371, 1, 0.3960784, 0, 1,
-1.344932, 0.5624698, -1.812436, 1, 0.4039216, 0, 1,
-1.337959, 1.364776, -0.9340523, 1, 0.4078431, 0, 1,
-1.337669, 0.06481189, -0.3880055, 1, 0.4156863, 0, 1,
-1.328136, -0.3971082, -3.304489, 1, 0.4196078, 0, 1,
-1.327519, 0.6774202, 0.6418214, 1, 0.427451, 0, 1,
-1.325646, -0.5155413, -3.855913, 1, 0.4313726, 0, 1,
-1.324163, 0.4039742, -0.4030643, 1, 0.4392157, 0, 1,
-1.323544, 0.6949004, -0.5946438, 1, 0.4431373, 0, 1,
-1.317122, -1.418981, -2.125691, 1, 0.4509804, 0, 1,
-1.314775, -1.520177, -0.9391186, 1, 0.454902, 0, 1,
-1.301274, -1.033604, -2.344329, 1, 0.4627451, 0, 1,
-1.299839, 0.7937843, -1.812691, 1, 0.4666667, 0, 1,
-1.298589, -0.1920997, -3.643246, 1, 0.4745098, 0, 1,
-1.298584, 0.5149294, -1.851034, 1, 0.4784314, 0, 1,
-1.290196, -1.444771, -2.452988, 1, 0.4862745, 0, 1,
-1.288884, 1.505088, -0.7795953, 1, 0.4901961, 0, 1,
-1.284549, 1.338533, -0.8232996, 1, 0.4980392, 0, 1,
-1.284288, -1.136909, -1.945641, 1, 0.5058824, 0, 1,
-1.27818, 0.8562397, -0.5812007, 1, 0.509804, 0, 1,
-1.274612, -0.5147272, -1.510067, 1, 0.5176471, 0, 1,
-1.261701, -0.2554651, -2.735785, 1, 0.5215687, 0, 1,
-1.258008, -0.04647414, -0.3878908, 1, 0.5294118, 0, 1,
-1.253445, -0.9217212, -2.158296, 1, 0.5333334, 0, 1,
-1.238422, -0.9729962, -2.985363, 1, 0.5411765, 0, 1,
-1.23169, -0.4955271, -0.1132185, 1, 0.5450981, 0, 1,
-1.22804, -0.7017344, -4.544644, 1, 0.5529412, 0, 1,
-1.211557, 0.9896576, -0.2516467, 1, 0.5568628, 0, 1,
-1.203737, 0.03458126, -2.535208, 1, 0.5647059, 0, 1,
-1.202341, 1.487268, -0.7412055, 1, 0.5686275, 0, 1,
-1.201187, 1.795115, -0.3883993, 1, 0.5764706, 0, 1,
-1.196866, 0.6935742, -0.5279143, 1, 0.5803922, 0, 1,
-1.184648, -0.6167675, -2.459496, 1, 0.5882353, 0, 1,
-1.181328, -0.09164385, -1.01504, 1, 0.5921569, 0, 1,
-1.176033, 1.360091, -0.7573013, 1, 0.6, 0, 1,
-1.161327, 0.02686056, -1.708572, 1, 0.6078432, 0, 1,
-1.138109, -0.2490311, 0.2675749, 1, 0.6117647, 0, 1,
-1.133195, -0.8725746, -2.924361, 1, 0.6196079, 0, 1,
-1.131874, 0.6975713, 0.1549503, 1, 0.6235294, 0, 1,
-1.124827, -0.3842814, -0.4283591, 1, 0.6313726, 0, 1,
-1.118261, 0.1060408, -2.122134, 1, 0.6352941, 0, 1,
-1.116705, 0.5944873, -2.589325, 1, 0.6431373, 0, 1,
-1.111412, 1.755484, -2.456774, 1, 0.6470588, 0, 1,
-1.111222, -0.5501705, -2.999385, 1, 0.654902, 0, 1,
-1.110347, -0.9650117, -2.390053, 1, 0.6588235, 0, 1,
-1.107123, -0.4744853, -2.739816, 1, 0.6666667, 0, 1,
-1.106627, -0.03166474, -1.708979, 1, 0.6705883, 0, 1,
-1.104955, 0.9942938, -0.4915331, 1, 0.6784314, 0, 1,
-1.097774, 0.4152451, -1.705427, 1, 0.682353, 0, 1,
-1.094827, 0.6794647, -2.458792, 1, 0.6901961, 0, 1,
-1.093302, 1.422031, -1.622808, 1, 0.6941177, 0, 1,
-1.084603, 0.1463645, -0.5402934, 1, 0.7019608, 0, 1,
-1.079697, 0.1606187, -2.54555, 1, 0.7098039, 0, 1,
-1.07936, -1.316684, -1.451174, 1, 0.7137255, 0, 1,
-1.073838, -0.7945059, -1.82716, 1, 0.7215686, 0, 1,
-1.065099, 0.3477748, -1.60272, 1, 0.7254902, 0, 1,
-1.063277, 0.8508884, 0.1775243, 1, 0.7333333, 0, 1,
-1.050018, -0.5012819, -1.586063, 1, 0.7372549, 0, 1,
-1.049906, -0.4555902, -0.7436932, 1, 0.7450981, 0, 1,
-1.048465, 0.3205633, -1.023088, 1, 0.7490196, 0, 1,
-1.040078, 0.2205212, -0.5957299, 1, 0.7568628, 0, 1,
-1.037035, 0.4741127, -0.4970621, 1, 0.7607843, 0, 1,
-1.034158, 0.6630359, -0.145263, 1, 0.7686275, 0, 1,
-1.026318, 0.4410606, -2.242377, 1, 0.772549, 0, 1,
-1.021842, 0.1176482, -0.08496694, 1, 0.7803922, 0, 1,
-1.015918, -0.1837203, -1.863009, 1, 0.7843137, 0, 1,
-1.006372, -0.8295416, -1.835979, 1, 0.7921569, 0, 1,
-1.004039, 0.8523894, -1.695579, 1, 0.7960784, 0, 1,
-1.002898, 0.396777, -3.200408, 1, 0.8039216, 0, 1,
-1.001662, 0.4060066, -2.089614, 1, 0.8117647, 0, 1,
-0.9992734, 1.3477, -3.206269, 1, 0.8156863, 0, 1,
-0.9982297, 0.5645265, 0.7326129, 1, 0.8235294, 0, 1,
-0.9922119, -0.07468843, -0.8167959, 1, 0.827451, 0, 1,
-0.9892473, -0.05045299, -0.8793543, 1, 0.8352941, 0, 1,
-0.9842761, -0.02389855, -1.586293, 1, 0.8392157, 0, 1,
-0.9839694, -1.798807, -3.293484, 1, 0.8470588, 0, 1,
-0.9797929, -1.434129, -2.752447, 1, 0.8509804, 0, 1,
-0.977281, -1.219152, -2.925613, 1, 0.8588235, 0, 1,
-0.9768053, 0.9332832, -2.887326, 1, 0.8627451, 0, 1,
-0.9743696, 0.4720019, 0.4454511, 1, 0.8705882, 0, 1,
-0.972405, 0.07558902, -0.6822444, 1, 0.8745098, 0, 1,
-0.9714984, -0.1805258, -3.594428, 1, 0.8823529, 0, 1,
-0.9707057, 2.829955, -0.782468, 1, 0.8862745, 0, 1,
-0.9687269, -0.6935535, -3.198646, 1, 0.8941177, 0, 1,
-0.9686084, 0.5402128, -1.056375, 1, 0.8980392, 0, 1,
-0.9599161, 0.8502719, -0.5520361, 1, 0.9058824, 0, 1,
-0.9593093, 0.3249915, -1.240204, 1, 0.9137255, 0, 1,
-0.9579782, 0.4311942, -2.631899, 1, 0.9176471, 0, 1,
-0.95444, -0.2376041, -0.9418611, 1, 0.9254902, 0, 1,
-0.94671, -0.2928954, -2.137919, 1, 0.9294118, 0, 1,
-0.9461751, -0.4237601, -1.855756, 1, 0.9372549, 0, 1,
-0.9394668, -0.0683737, -2.29422, 1, 0.9411765, 0, 1,
-0.9384204, 1.052414, -0.341109, 1, 0.9490196, 0, 1,
-0.9358032, 0.7593662, -1.944241, 1, 0.9529412, 0, 1,
-0.9304689, 0.4368652, -0.4129665, 1, 0.9607843, 0, 1,
-0.9268236, -0.3345405, -1.911441, 1, 0.9647059, 0, 1,
-0.9165154, -0.1598388, 0.4605654, 1, 0.972549, 0, 1,
-0.9133828, 1.452091, 0.5948477, 1, 0.9764706, 0, 1,
-0.9117024, -0.5421962, -1.901565, 1, 0.9843137, 0, 1,
-0.9109394, 0.815339, 0.1013956, 1, 0.9882353, 0, 1,
-0.9081852, 1.22837, -1.118032, 1, 0.9960784, 0, 1,
-0.8983504, -0.2031883, -3.122657, 0.9960784, 1, 0, 1,
-0.8974256, 0.7544903, -1.849133, 0.9921569, 1, 0, 1,
-0.8929804, -1.045564, -1.800063, 0.9843137, 1, 0, 1,
-0.8906967, -0.8021621, -1.464786, 0.9803922, 1, 0, 1,
-0.8902694, -0.2628411, 0.2198993, 0.972549, 1, 0, 1,
-0.8876984, 1.983045, -1.191375, 0.9686275, 1, 0, 1,
-0.884254, 0.8012444, 0.04015771, 0.9607843, 1, 0, 1,
-0.8828768, -0.8396786, -1.763036, 0.9568627, 1, 0, 1,
-0.8817542, -1.057025, -1.458354, 0.9490196, 1, 0, 1,
-0.8812801, -0.1643748, -0.4621845, 0.945098, 1, 0, 1,
-0.8788792, -0.652047, -0.7975658, 0.9372549, 1, 0, 1,
-0.8784518, -0.01038546, -1.530367, 0.9333333, 1, 0, 1,
-0.8762085, -1.366165, -2.518167, 0.9254902, 1, 0, 1,
-0.874965, -1.36841, -2.928826, 0.9215686, 1, 0, 1,
-0.871992, -1.498625, -0.7377288, 0.9137255, 1, 0, 1,
-0.8654028, 1.590358, -0.5991648, 0.9098039, 1, 0, 1,
-0.861114, 1.151852, -1.159379, 0.9019608, 1, 0, 1,
-0.8591847, -1.33224, -3.562365, 0.8941177, 1, 0, 1,
-0.8577536, 0.9746252, -0.23857, 0.8901961, 1, 0, 1,
-0.8528193, 0.3695693, -1.290662, 0.8823529, 1, 0, 1,
-0.8514098, -1.238831, -3.24018, 0.8784314, 1, 0, 1,
-0.8510393, -0.2735003, -1.979939, 0.8705882, 1, 0, 1,
-0.8402286, -0.03402907, -1.331957, 0.8666667, 1, 0, 1,
-0.8375472, 1.585257, 0.4406892, 0.8588235, 1, 0, 1,
-0.8365875, 0.72077, 0.2099919, 0.854902, 1, 0, 1,
-0.8347331, 0.1076555, -0.7031964, 0.8470588, 1, 0, 1,
-0.833868, -0.6396946, -0.8043709, 0.8431373, 1, 0, 1,
-0.8319097, -0.8838394, -0.4366246, 0.8352941, 1, 0, 1,
-0.8317906, -0.1606658, -2.822989, 0.8313726, 1, 0, 1,
-0.830999, -0.4281941, -1.752948, 0.8235294, 1, 0, 1,
-0.8289793, -0.616722, -2.889693, 0.8196079, 1, 0, 1,
-0.8289394, -1.649338, -1.687174, 0.8117647, 1, 0, 1,
-0.8175415, 1.349948, -2.297528, 0.8078431, 1, 0, 1,
-0.8143762, -0.9503703, -0.8952367, 0.8, 1, 0, 1,
-0.8134755, -1.588224, -3.067924, 0.7921569, 1, 0, 1,
-0.8101012, 0.5109257, 0.2400171, 0.7882353, 1, 0, 1,
-0.8085197, 0.5229736, -0.6094673, 0.7803922, 1, 0, 1,
-0.8058284, 1.000596, -0.8976106, 0.7764706, 1, 0, 1,
-0.8057408, -1.019805, -0.4741591, 0.7686275, 1, 0, 1,
-0.8055932, 0.2775986, 0.2491351, 0.7647059, 1, 0, 1,
-0.800163, -0.246152, -2.333151, 0.7568628, 1, 0, 1,
-0.7977085, 1.83954, 0.3449606, 0.7529412, 1, 0, 1,
-0.7972577, -0.7406855, -1.556941, 0.7450981, 1, 0, 1,
-0.7939122, -0.9022746, -1.95805, 0.7411765, 1, 0, 1,
-0.7917723, -0.7762256, -2.855572, 0.7333333, 1, 0, 1,
-0.7882062, 0.4298417, -2.450995, 0.7294118, 1, 0, 1,
-0.7867799, -2.142531, -2.393892, 0.7215686, 1, 0, 1,
-0.7831098, -0.08403061, -1.572939, 0.7176471, 1, 0, 1,
-0.782746, 1.038284, -0.1875874, 0.7098039, 1, 0, 1,
-0.7781518, 1.365736, 0.3667195, 0.7058824, 1, 0, 1,
-0.7716638, -0.5190702, -1.616649, 0.6980392, 1, 0, 1,
-0.7668095, 0.2222569, -1.951391, 0.6901961, 1, 0, 1,
-0.7661934, 1.530236, -0.834664, 0.6862745, 1, 0, 1,
-0.7648817, -0.2566467, 0.5679711, 0.6784314, 1, 0, 1,
-0.7628676, -0.775422, -3.51588, 0.6745098, 1, 0, 1,
-0.7571358, -1.927437, -3.478426, 0.6666667, 1, 0, 1,
-0.7557156, -0.618829, -2.313492, 0.6627451, 1, 0, 1,
-0.7468425, -0.0052734, -0.4404228, 0.654902, 1, 0, 1,
-0.7463668, -1.90993, -3.997162, 0.6509804, 1, 0, 1,
-0.7456971, -0.5074717, -2.448159, 0.6431373, 1, 0, 1,
-0.7434423, -1.022419, -2.907033, 0.6392157, 1, 0, 1,
-0.7432911, 0.8952207, -1.130728, 0.6313726, 1, 0, 1,
-0.7346618, 1.942743, 1.463776, 0.627451, 1, 0, 1,
-0.7346614, 1.29595, 0.5284858, 0.6196079, 1, 0, 1,
-0.7341978, -0.059417, -2.061039, 0.6156863, 1, 0, 1,
-0.731694, 1.677755, -0.1261089, 0.6078432, 1, 0, 1,
-0.730196, -1.038218, -2.520224, 0.6039216, 1, 0, 1,
-0.7283905, -1.275688, -3.115113, 0.5960785, 1, 0, 1,
-0.725796, 0.06295738, -1.671521, 0.5882353, 1, 0, 1,
-0.7239826, -0.004865777, 0.05973958, 0.5843138, 1, 0, 1,
-0.7236202, -0.005408163, -1.161806, 0.5764706, 1, 0, 1,
-0.720215, -0.04805576, -2.847625, 0.572549, 1, 0, 1,
-0.7161337, 0.8900384, -1.265807, 0.5647059, 1, 0, 1,
-0.7070475, 0.1304771, -1.016355, 0.5607843, 1, 0, 1,
-0.7055892, 0.8832885, -0.2158534, 0.5529412, 1, 0, 1,
-0.7048532, -0.1964994, -0.775122, 0.5490196, 1, 0, 1,
-0.7014433, -2.102316, -4.403879, 0.5411765, 1, 0, 1,
-0.6986106, 2.426999, -0.2254625, 0.5372549, 1, 0, 1,
-0.696512, 0.3215512, -1.135604, 0.5294118, 1, 0, 1,
-0.6960242, -0.4989893, -1.023327, 0.5254902, 1, 0, 1,
-0.6949069, 0.586199, 1.054582, 0.5176471, 1, 0, 1,
-0.6914059, 0.9149401, 0.07244204, 0.5137255, 1, 0, 1,
-0.6884534, 1.272036, 0.7552993, 0.5058824, 1, 0, 1,
-0.6793962, -0.4569413, -2.277628, 0.5019608, 1, 0, 1,
-0.6766406, -1.945202, -3.104049, 0.4941176, 1, 0, 1,
-0.6749111, -0.6657363, -2.71869, 0.4862745, 1, 0, 1,
-0.6697988, 0.5237938, -2.819604, 0.4823529, 1, 0, 1,
-0.6665033, 0.2698673, -2.588527, 0.4745098, 1, 0, 1,
-0.666172, -1.242528, -2.5453, 0.4705882, 1, 0, 1,
-0.665309, 0.8801383, -1.118408, 0.4627451, 1, 0, 1,
-0.6623355, -0.114371, -2.050829, 0.4588235, 1, 0, 1,
-0.6574942, -1.011111, -1.992549, 0.4509804, 1, 0, 1,
-0.6535231, 0.8252432, 0.911253, 0.4470588, 1, 0, 1,
-0.6453829, -0.2918954, -0.2407867, 0.4392157, 1, 0, 1,
-0.6446771, 0.1614517, -1.731725, 0.4352941, 1, 0, 1,
-0.6433606, 0.6744473, -0.4835134, 0.427451, 1, 0, 1,
-0.6390158, 1.17418, 1.401924, 0.4235294, 1, 0, 1,
-0.6267928, 1.27049, 0.5964866, 0.4156863, 1, 0, 1,
-0.6264288, 0.4538898, -0.073639, 0.4117647, 1, 0, 1,
-0.625661, -0.006942862, -0.9537048, 0.4039216, 1, 0, 1,
-0.6243694, -0.8795676, -2.704176, 0.3960784, 1, 0, 1,
-0.6229322, -0.7740959, -4.123356, 0.3921569, 1, 0, 1,
-0.6219245, 0.2036593, -1.180752, 0.3843137, 1, 0, 1,
-0.6211435, 0.1972077, 0.604341, 0.3803922, 1, 0, 1,
-0.6184328, -1.383071, -2.006739, 0.372549, 1, 0, 1,
-0.6176817, -1.13404, -1.298928, 0.3686275, 1, 0, 1,
-0.6139539, 0.82312, -0.3154055, 0.3607843, 1, 0, 1,
-0.6069561, -0.5043293, -1.281298, 0.3568628, 1, 0, 1,
-0.6065351, 1.468551, 0.7008981, 0.3490196, 1, 0, 1,
-0.6043094, 0.9106839, -0.1152564, 0.345098, 1, 0, 1,
-0.60259, -1.554088, -1.879625, 0.3372549, 1, 0, 1,
-0.6005388, 0.4955015, -3.407684, 0.3333333, 1, 0, 1,
-0.5961899, 0.3736804, -1.115727, 0.3254902, 1, 0, 1,
-0.5952497, -0.2876517, -1.873972, 0.3215686, 1, 0, 1,
-0.5919942, 0.7730364, 0.1347844, 0.3137255, 1, 0, 1,
-0.5918627, 0.3313856, -1.732156, 0.3098039, 1, 0, 1,
-0.5909669, 0.003345571, -2.499534, 0.3019608, 1, 0, 1,
-0.5869408, 1.602838, 0.7846053, 0.2941177, 1, 0, 1,
-0.5861521, 0.7256632, -0.5293876, 0.2901961, 1, 0, 1,
-0.5796273, -0.8963715, -2.003653, 0.282353, 1, 0, 1,
-0.5785089, 1.183938, -0.1184372, 0.2784314, 1, 0, 1,
-0.5764123, -0.8601201, -4.40212, 0.2705882, 1, 0, 1,
-0.5763438, -0.03997324, -2.28024, 0.2666667, 1, 0, 1,
-0.5740978, -0.9658349, -0.2672309, 0.2588235, 1, 0, 1,
-0.5708824, 0.8617147, -0.3307374, 0.254902, 1, 0, 1,
-0.558866, 0.3508435, -0.3349451, 0.2470588, 1, 0, 1,
-0.5554069, 2.03181, -0.8448462, 0.2431373, 1, 0, 1,
-0.5543764, 0.1964999, 0.9652564, 0.2352941, 1, 0, 1,
-0.5499165, -1.134987, -1.950468, 0.2313726, 1, 0, 1,
-0.5486492, 0.8672075, 0.1876384, 0.2235294, 1, 0, 1,
-0.5418285, 1.200825, 0.8371946, 0.2196078, 1, 0, 1,
-0.539192, -0.1435361, -2.734089, 0.2117647, 1, 0, 1,
-0.5378845, 0.9566486, 0.395387, 0.2078431, 1, 0, 1,
-0.5375805, -1.249141, -4.148019, 0.2, 1, 0, 1,
-0.5324775, -0.6812783, -2.799601, 0.1921569, 1, 0, 1,
-0.5306387, 1.532897, -1.91737, 0.1882353, 1, 0, 1,
-0.5268743, 0.5411232, 0.2354594, 0.1803922, 1, 0, 1,
-0.5259209, 1.965342, -0.08521383, 0.1764706, 1, 0, 1,
-0.525755, 0.3039786, -0.6382467, 0.1686275, 1, 0, 1,
-0.5173191, 1.51122, -0.6230193, 0.1647059, 1, 0, 1,
-0.5165222, -0.5246927, -2.796557, 0.1568628, 1, 0, 1,
-0.5143682, -0.4814113, -2.818387, 0.1529412, 1, 0, 1,
-0.512117, 0.748378, 1.952111, 0.145098, 1, 0, 1,
-0.5117544, -0.2182468, -0.3385288, 0.1411765, 1, 0, 1,
-0.5096095, -1.081866, -2.887808, 0.1333333, 1, 0, 1,
-0.509576, -0.92, -0.8159541, 0.1294118, 1, 0, 1,
-0.5043656, -1.216562, -5.449324, 0.1215686, 1, 0, 1,
-0.5021681, 0.6297373, -0.9161484, 0.1176471, 1, 0, 1,
-0.4968704, 0.05046459, 0.6240594, 0.1098039, 1, 0, 1,
-0.4957829, 1.147599, -0.2323572, 0.1058824, 1, 0, 1,
-0.4940867, -0.5152943, 0.3647025, 0.09803922, 1, 0, 1,
-0.4939855, 0.5446112, -0.1780196, 0.09019608, 1, 0, 1,
-0.4938084, -1.126128, -2.583047, 0.08627451, 1, 0, 1,
-0.489062, 0.7431657, -1.941499, 0.07843138, 1, 0, 1,
-0.4838904, -1.520059, -2.283964, 0.07450981, 1, 0, 1,
-0.4830897, 0.6079342, -0.8430257, 0.06666667, 1, 0, 1,
-0.4755967, -0.4879198, -2.953096, 0.0627451, 1, 0, 1,
-0.4751518, 2.043605, 1.046687, 0.05490196, 1, 0, 1,
-0.4703699, 0.8223263, 1.820833, 0.05098039, 1, 0, 1,
-0.4703075, -0.4858466, -4.256089, 0.04313726, 1, 0, 1,
-0.4667622, -0.6402382, -0.7152717, 0.03921569, 1, 0, 1,
-0.4663463, 2.511713, 1.319911, 0.03137255, 1, 0, 1,
-0.46192, -0.4853328, -2.107857, 0.02745098, 1, 0, 1,
-0.4525734, 0.4587554, -1.567845, 0.01960784, 1, 0, 1,
-0.447648, 1.755106, 0.1444055, 0.01568628, 1, 0, 1,
-0.447104, 1.439236, -2.307194, 0.007843138, 1, 0, 1,
-0.4469467, -1.528483, -2.816504, 0.003921569, 1, 0, 1,
-0.4427345, -1.894241, -1.041299, 0, 1, 0.003921569, 1,
-0.4386135, 0.08123056, -2.613096, 0, 1, 0.01176471, 1,
-0.4352377, 0.2784044, 0.4231984, 0, 1, 0.01568628, 1,
-0.434812, 0.2863271, -0.4005564, 0, 1, 0.02352941, 1,
-0.4342256, 1.622446, 0.943651, 0, 1, 0.02745098, 1,
-0.4249515, -0.197294, -4.173145, 0, 1, 0.03529412, 1,
-0.4227787, -1.886187, -2.394553, 0, 1, 0.03921569, 1,
-0.420059, -0.5432895, -2.459654, 0, 1, 0.04705882, 1,
-0.4187406, 0.04242712, -2.998975, 0, 1, 0.05098039, 1,
-0.4111713, 1.239389, 1.901461, 0, 1, 0.05882353, 1,
-0.4099043, 0.3211148, -1.504769, 0, 1, 0.0627451, 1,
-0.4098233, -0.3759908, -2.994155, 0, 1, 0.07058824, 1,
-0.407333, 1.656388, 0.1622929, 0, 1, 0.07450981, 1,
-0.4063236, -0.6845472, -2.852903, 0, 1, 0.08235294, 1,
-0.4052215, -1.421858, -3.29074, 0, 1, 0.08627451, 1,
-0.3969552, 0.3068859, -0.5145071, 0, 1, 0.09411765, 1,
-0.3962188, -1.471768, -3.114508, 0, 1, 0.1019608, 1,
-0.3924531, 0.5600094, 1.541506, 0, 1, 0.1058824, 1,
-0.3898754, -0.4789499, -2.51056, 0, 1, 0.1137255, 1,
-0.3897302, -0.4380054, -1.463362, 0, 1, 0.1176471, 1,
-0.3880202, 1.84944, 0.7506222, 0, 1, 0.1254902, 1,
-0.3874507, -1.462856, -2.94885, 0, 1, 0.1294118, 1,
-0.3872199, -0.7750061, -2.318234, 0, 1, 0.1372549, 1,
-0.3867609, 0.1732037, -1.902539, 0, 1, 0.1411765, 1,
-0.3855764, -0.09810703, -2.310945, 0, 1, 0.1490196, 1,
-0.3832731, -0.5608004, -3.088802, 0, 1, 0.1529412, 1,
-0.3819467, -1.234059, -3.191853, 0, 1, 0.1607843, 1,
-0.3818942, -0.08583709, -3.51663, 0, 1, 0.1647059, 1,
-0.3814692, -0.3507892, -1.154807, 0, 1, 0.172549, 1,
-0.3760266, 0.08539854, -2.518859, 0, 1, 0.1764706, 1,
-0.3727551, -0.4142151, -2.923289, 0, 1, 0.1843137, 1,
-0.3724824, 1.422198, -0.1216439, 0, 1, 0.1882353, 1,
-0.3701321, 0.6576724, -2.403367, 0, 1, 0.1960784, 1,
-0.366477, -0.383161, -1.497176, 0, 1, 0.2039216, 1,
-0.3663092, 1.30131, -1.194531, 0, 1, 0.2078431, 1,
-0.3630683, -1.010143, -0.9012918, 0, 1, 0.2156863, 1,
-0.3620023, 1.139447, 1.301466, 0, 1, 0.2196078, 1,
-0.3582425, -0.2191817, -2.507716, 0, 1, 0.227451, 1,
-0.3570759, 0.4650384, -2.030924, 0, 1, 0.2313726, 1,
-0.3498866, -0.9350115, -2.867649, 0, 1, 0.2392157, 1,
-0.3483792, -0.7805821, -3.079601, 0, 1, 0.2431373, 1,
-0.3457943, -0.2834529, -1.831138, 0, 1, 0.2509804, 1,
-0.3448688, -1.598706, -3.598741, 0, 1, 0.254902, 1,
-0.3436687, 1.561512, 0.5399064, 0, 1, 0.2627451, 1,
-0.3387177, 0.1068985, -1.857618, 0, 1, 0.2666667, 1,
-0.3350206, 0.4090337, -0.9494022, 0, 1, 0.2745098, 1,
-0.3337493, 0.1152326, 0.15283, 0, 1, 0.2784314, 1,
-0.3325484, 0.4373829, -0.1868138, 0, 1, 0.2862745, 1,
-0.3284481, 0.4537004, -0.4405749, 0, 1, 0.2901961, 1,
-0.3248706, 0.2793451, -1.231959, 0, 1, 0.2980392, 1,
-0.3150147, -0.5063105, -2.795966, 0, 1, 0.3058824, 1,
-0.3092765, -0.2432264, -2.462789, 0, 1, 0.3098039, 1,
-0.3065583, -1.052701, -3.022985, 0, 1, 0.3176471, 1,
-0.3015534, -0.1909102, -1.799863, 0, 1, 0.3215686, 1,
-0.3004018, 1.823229, -0.08532669, 0, 1, 0.3294118, 1,
-0.2843508, 0.9280321, 0.7991427, 0, 1, 0.3333333, 1,
-0.2843194, -0.6718189, -2.82987, 0, 1, 0.3411765, 1,
-0.2837142, -1.464652, -0.8113729, 0, 1, 0.345098, 1,
-0.2825602, 0.1039407, -2.249815, 0, 1, 0.3529412, 1,
-0.2786528, 0.7609579, -0.04420345, 0, 1, 0.3568628, 1,
-0.2778499, -0.8436324, -4.330427, 0, 1, 0.3647059, 1,
-0.2620512, -1.52879, -2.383555, 0, 1, 0.3686275, 1,
-0.2544845, 0.460318, -0.01092314, 0, 1, 0.3764706, 1,
-0.2528182, 2.102239, 1.75354, 0, 1, 0.3803922, 1,
-0.2528071, 0.2435116, -0.3932561, 0, 1, 0.3882353, 1,
-0.252651, -0.3348765, -2.786617, 0, 1, 0.3921569, 1,
-0.2507708, -0.4620778, -2.798442, 0, 1, 0.4, 1,
-0.2495393, 0.3046949, -0.4673268, 0, 1, 0.4078431, 1,
-0.2491927, -1.326818, -4.088723, 0, 1, 0.4117647, 1,
-0.2474586, -1.810411, -2.388976, 0, 1, 0.4196078, 1,
-0.2343731, 0.5492362, 1.418201, 0, 1, 0.4235294, 1,
-0.2333556, 0.3750637, 0.04148684, 0, 1, 0.4313726, 1,
-0.2207248, 0.6898561, 0.5087113, 0, 1, 0.4352941, 1,
-0.2199632, -1.458409, -4.260161, 0, 1, 0.4431373, 1,
-0.218955, -0.2461071, -2.185152, 0, 1, 0.4470588, 1,
-0.2178987, 0.5061498, -0.2238745, 0, 1, 0.454902, 1,
-0.2140304, -0.01549859, -2.268842, 0, 1, 0.4588235, 1,
-0.2116859, -0.3396164, -1.95815, 0, 1, 0.4666667, 1,
-0.2112896, -1.735055, -3.062059, 0, 1, 0.4705882, 1,
-0.2083282, -0.8881502, -2.690467, 0, 1, 0.4784314, 1,
-0.207601, -1.270355, -2.719301, 0, 1, 0.4823529, 1,
-0.2045099, 0.4856097, -1.86746, 0, 1, 0.4901961, 1,
-0.2036232, -0.4220963, -2.76293, 0, 1, 0.4941176, 1,
-0.1914104, 1.147495, 0.1302682, 0, 1, 0.5019608, 1,
-0.1899139, -0.9288146, -2.156621, 0, 1, 0.509804, 1,
-0.1892707, 0.5275493, 0.04352064, 0, 1, 0.5137255, 1,
-0.188313, 0.7661422, 1.03106, 0, 1, 0.5215687, 1,
-0.1878196, -0.1040045, -1.505343, 0, 1, 0.5254902, 1,
-0.1876386, -0.2190809, -2.664649, 0, 1, 0.5333334, 1,
-0.1874527, 0.5059815, -0.7110524, 0, 1, 0.5372549, 1,
-0.1826362, -0.1865489, -1.740264, 0, 1, 0.5450981, 1,
-0.1813991, 0.7785249, 1.721463, 0, 1, 0.5490196, 1,
-0.1733077, 0.1419867, -1.748551, 0, 1, 0.5568628, 1,
-0.1720989, -0.3720674, -2.68714, 0, 1, 0.5607843, 1,
-0.165427, -0.2463243, -2.959827, 0, 1, 0.5686275, 1,
-0.1652945, 0.452552, 0.3068864, 0, 1, 0.572549, 1,
-0.1652891, 0.01855251, -0.3939935, 0, 1, 0.5803922, 1,
-0.1652218, -0.7315802, -3.462755, 0, 1, 0.5843138, 1,
-0.1650992, -1.157975, -2.928138, 0, 1, 0.5921569, 1,
-0.165038, -0.5225488, -0.7993301, 0, 1, 0.5960785, 1,
-0.1614107, -1.612372, -2.107532, 0, 1, 0.6039216, 1,
-0.1592102, 1.374876, -0.02782094, 0, 1, 0.6117647, 1,
-0.1508991, -0.6997384, -2.951952, 0, 1, 0.6156863, 1,
-0.1424451, 0.01060176, 1.247415, 0, 1, 0.6235294, 1,
-0.1361308, 0.2132477, 1.652165, 0, 1, 0.627451, 1,
-0.1254394, 0.6656214, -2.327376, 0, 1, 0.6352941, 1,
-0.1246143, 0.2771796, -0.4915076, 0, 1, 0.6392157, 1,
-0.1161625, 0.9771852, 0.2798431, 0, 1, 0.6470588, 1,
-0.1128833, 1.685064, -0.4410575, 0, 1, 0.6509804, 1,
-0.1103476, 0.4480339, -0.1877539, 0, 1, 0.6588235, 1,
-0.1099594, -0.5432045, -3.066311, 0, 1, 0.6627451, 1,
-0.1092233, -0.4222313, -2.963902, 0, 1, 0.6705883, 1,
-0.1063743, -0.2154459, -1.02979, 0, 1, 0.6745098, 1,
-0.1047472, 0.7734798, 0.2127208, 0, 1, 0.682353, 1,
-0.1026907, -0.1608036, -1.775693, 0, 1, 0.6862745, 1,
-0.0980309, 0.8040469, -0.8595865, 0, 1, 0.6941177, 1,
-0.09642448, 0.9978017, -1.55595, 0, 1, 0.7019608, 1,
-0.09241576, 0.2018096, -0.0754279, 0, 1, 0.7058824, 1,
-0.08828498, 0.6885298, -1.213451, 0, 1, 0.7137255, 1,
-0.08062652, 0.9246714, 0.2106057, 0, 1, 0.7176471, 1,
-0.07986712, 0.1361243, -0.3198589, 0, 1, 0.7254902, 1,
-0.0786846, -1.379374, -2.395975, 0, 1, 0.7294118, 1,
-0.07531919, -1.522436, -3.208597, 0, 1, 0.7372549, 1,
-0.07311211, -0.4687931, -1.835561, 0, 1, 0.7411765, 1,
-0.06478511, -1.624479, -5.262341, 0, 1, 0.7490196, 1,
-0.06463752, -0.9666225, -1.594702, 0, 1, 0.7529412, 1,
-0.06423749, -0.2728568, -1.543957, 0, 1, 0.7607843, 1,
-0.06216227, 1.550571, 0.2583704, 0, 1, 0.7647059, 1,
-0.06124558, -0.8445619, -2.22343, 0, 1, 0.772549, 1,
-0.05998712, 0.5337174, -0.3993009, 0, 1, 0.7764706, 1,
-0.05746748, 1.329617, 0.4650668, 0, 1, 0.7843137, 1,
-0.05617692, -2.510149, -1.599594, 0, 1, 0.7882353, 1,
-0.05482976, -0.1488452, -2.944448, 0, 1, 0.7960784, 1,
-0.05174541, -0.5836598, -1.473614, 0, 1, 0.8039216, 1,
-0.0489006, -0.5291013, -2.091336, 0, 1, 0.8078431, 1,
-0.04436725, 1.223408, -0.8039091, 0, 1, 0.8156863, 1,
-0.04365805, 0.7198367, 0.4823954, 0, 1, 0.8196079, 1,
-0.04113419, 0.01892565, -1.806566, 0, 1, 0.827451, 1,
-0.03513696, 0.8339928, 1.324847, 0, 1, 0.8313726, 1,
-0.03126055, -0.5496606, -3.91308, 0, 1, 0.8392157, 1,
-0.02897286, -0.6309315, -2.508916, 0, 1, 0.8431373, 1,
-0.02824745, -0.1596834, -4.00129, 0, 1, 0.8509804, 1,
-0.02719233, 0.7542956, 2.196914, 0, 1, 0.854902, 1,
-0.02711398, 0.2864293, -1.195736, 0, 1, 0.8627451, 1,
-0.02671297, 1.557209, -0.1631857, 0, 1, 0.8666667, 1,
-0.02627999, 0.2915898, 0.1098491, 0, 1, 0.8745098, 1,
-0.022636, -0.4550435, -2.330657, 0, 1, 0.8784314, 1,
-0.02244953, -0.922692, -4.294551, 0, 1, 0.8862745, 1,
-0.02175224, 0.2664384, 0.7804097, 0, 1, 0.8901961, 1,
-0.01724803, -0.3530399, -2.883607, 0, 1, 0.8980392, 1,
-0.01268836, 3.154433, 2.303026, 0, 1, 0.9058824, 1,
-0.01027394, 0.02802274, -1.089503, 0, 1, 0.9098039, 1,
-0.001789048, 2.355186, -1.035278, 0, 1, 0.9176471, 1,
0.002397871, -1.294453, 3.607713, 0, 1, 0.9215686, 1,
0.003102879, -0.1943336, 0.7144577, 0, 1, 0.9294118, 1,
0.004626352, -0.9070822, 4.476553, 0, 1, 0.9333333, 1,
0.006196787, -0.2799966, 3.687902, 0, 1, 0.9411765, 1,
0.006843449, -0.8103851, 3.599349, 0, 1, 0.945098, 1,
0.008054777, 0.984731, 2.416667, 0, 1, 0.9529412, 1,
0.008240605, 0.9268054, 3.500265, 0, 1, 0.9568627, 1,
0.009322301, -0.6544155, 1.977223, 0, 1, 0.9647059, 1,
0.02184363, -0.949131, 2.413985, 0, 1, 0.9686275, 1,
0.0230854, 1.86539, -0.7948206, 0, 1, 0.9764706, 1,
0.02590823, 0.4063823, 1.527429, 0, 1, 0.9803922, 1,
0.02608017, -0.6644512, 4.244154, 0, 1, 0.9882353, 1,
0.02884959, 0.3893054, 0.9512679, 0, 1, 0.9921569, 1,
0.02906095, 0.6069719, 0.8507326, 0, 1, 1, 1,
0.0310724, 0.1071195, 0.553524, 0, 0.9921569, 1, 1,
0.03111343, -0.3357815, 3.545712, 0, 0.9882353, 1, 1,
0.03258197, -0.4049885, 3.060753, 0, 0.9803922, 1, 1,
0.03530388, 1.062848, -0.4377952, 0, 0.9764706, 1, 1,
0.03560448, -0.7208182, 3.162252, 0, 0.9686275, 1, 1,
0.03752076, -1.840708, 2.537996, 0, 0.9647059, 1, 1,
0.04080758, 0.1648657, -0.8942106, 0, 0.9568627, 1, 1,
0.04116566, 0.04512887, -0.1298284, 0, 0.9529412, 1, 1,
0.04201104, 0.6601937, 1.072505, 0, 0.945098, 1, 1,
0.04552019, 0.7894912, -0.142243, 0, 0.9411765, 1, 1,
0.04854166, 0.1710087, 0.6476406, 0, 0.9333333, 1, 1,
0.05962271, -0.2762064, 3.118742, 0, 0.9294118, 1, 1,
0.06373782, 0.07077426, 1.355953, 0, 0.9215686, 1, 1,
0.06960081, -0.7533283, 3.21505, 0, 0.9176471, 1, 1,
0.07012171, -0.6323612, 5.989606, 0, 0.9098039, 1, 1,
0.07470151, -1.060339, 2.736273, 0, 0.9058824, 1, 1,
0.07575693, -1.484762, 3.396928, 0, 0.8980392, 1, 1,
0.07898044, 0.8075086, 0.2092927, 0, 0.8901961, 1, 1,
0.08237071, 0.05817569, 1.291065, 0, 0.8862745, 1, 1,
0.08509061, -1.088314, 2.19747, 0, 0.8784314, 1, 1,
0.08567344, 1.114544, 0.4188532, 0, 0.8745098, 1, 1,
0.0862729, 0.5113475, 0.6358899, 0, 0.8666667, 1, 1,
0.08687419, 0.1187807, 2.441461, 0, 0.8627451, 1, 1,
0.09178878, 1.373835, -1.396405, 0, 0.854902, 1, 1,
0.0967912, 1.307654, -0.3682716, 0, 0.8509804, 1, 1,
0.1010806, -0.1887437, 2.497936, 0, 0.8431373, 1, 1,
0.1058877, -0.8662944, 2.113607, 0, 0.8392157, 1, 1,
0.1071545, 1.365098, 0.3532252, 0, 0.8313726, 1, 1,
0.1072891, -0.1175434, 2.223147, 0, 0.827451, 1, 1,
0.1099562, -1.668045, 2.070935, 0, 0.8196079, 1, 1,
0.1108342, -0.9546086, 2.468502, 0, 0.8156863, 1, 1,
0.1137207, 2.596589, 0.1506984, 0, 0.8078431, 1, 1,
0.1181892, -0.1548174, 1.932934, 0, 0.8039216, 1, 1,
0.1212856, 0.4499447, -0.02349134, 0, 0.7960784, 1, 1,
0.1250903, 3.016804, 0.2966998, 0, 0.7882353, 1, 1,
0.1276107, 0.2114072, 0.1697599, 0, 0.7843137, 1, 1,
0.1291315, -0.5089946, 4.38621, 0, 0.7764706, 1, 1,
0.1407427, 0.9530912, -0.02779465, 0, 0.772549, 1, 1,
0.1433999, 1.222425, -0.9901977, 0, 0.7647059, 1, 1,
0.1459504, -0.6011602, 3.749649, 0, 0.7607843, 1, 1,
0.1466054, 0.7317133, 1.380197, 0, 0.7529412, 1, 1,
0.1481627, -0.719382, 3.799824, 0, 0.7490196, 1, 1,
0.149142, -0.6160962, 4.21317, 0, 0.7411765, 1, 1,
0.1497589, 1.007322, 0.5066595, 0, 0.7372549, 1, 1,
0.1536852, -0.924342, 1.953399, 0, 0.7294118, 1, 1,
0.1552272, 2.39886, -0.5038851, 0, 0.7254902, 1, 1,
0.1554242, -0.9441871, 2.113331, 0, 0.7176471, 1, 1,
0.1554677, -0.1089817, 0.8067163, 0, 0.7137255, 1, 1,
0.1562371, -0.0641775, 2.468179, 0, 0.7058824, 1, 1,
0.1573061, -1.820807, 4.054357, 0, 0.6980392, 1, 1,
0.1650047, 1.40219, -0.1018151, 0, 0.6941177, 1, 1,
0.165013, -1.434462, 1.970227, 0, 0.6862745, 1, 1,
0.167706, -0.1304331, 2.547762, 0, 0.682353, 1, 1,
0.171617, -0.1239676, 1.588563, 0, 0.6745098, 1, 1,
0.1749307, 1.162634, 1.13149, 0, 0.6705883, 1, 1,
0.1761835, -1.749704, 2.912151, 0, 0.6627451, 1, 1,
0.1767731, 1.21326, 0.940325, 0, 0.6588235, 1, 1,
0.1773431, 2.445391, -0.5971258, 0, 0.6509804, 1, 1,
0.1814044, 0.3589082, 0.5038381, 0, 0.6470588, 1, 1,
0.1842024, -1.058547, 3.939462, 0, 0.6392157, 1, 1,
0.185415, 1.251971, 1.439472, 0, 0.6352941, 1, 1,
0.1880591, 1.039391, -0.1722495, 0, 0.627451, 1, 1,
0.1894365, -0.9416356, 2.312301, 0, 0.6235294, 1, 1,
0.1992919, -1.072259, 1.571389, 0, 0.6156863, 1, 1,
0.2031803, 0.1754662, 0.05727342, 0, 0.6117647, 1, 1,
0.20358, -1.153837, 3.475385, 0, 0.6039216, 1, 1,
0.2058581, 0.6978815, 0.1643818, 0, 0.5960785, 1, 1,
0.206195, -0.6319419, 3.179591, 0, 0.5921569, 1, 1,
0.2065656, -0.3193841, 1.984728, 0, 0.5843138, 1, 1,
0.2194862, 0.140027, 0.1182254, 0, 0.5803922, 1, 1,
0.2204756, 0.1961984, 1.746686, 0, 0.572549, 1, 1,
0.2207072, -0.3012236, 3.07989, 0, 0.5686275, 1, 1,
0.221472, 1.004837, 0.8887499, 0, 0.5607843, 1, 1,
0.2223997, 0.4367371, 0.9438319, 0, 0.5568628, 1, 1,
0.2227313, 0.2291786, 0.240929, 0, 0.5490196, 1, 1,
0.22528, -0.638125, 3.765388, 0, 0.5450981, 1, 1,
0.2255668, -0.3227394, 2.36096, 0, 0.5372549, 1, 1,
0.238987, 0.6148134, 1.663349, 0, 0.5333334, 1, 1,
0.2400599, -0.5001708, 3.281489, 0, 0.5254902, 1, 1,
0.2414445, 0.5656976, 2.956374, 0, 0.5215687, 1, 1,
0.2416038, 0.2722429, -0.05454394, 0, 0.5137255, 1, 1,
0.2429399, 0.431044, 1.551798, 0, 0.509804, 1, 1,
0.2468883, 0.01639568, 0.3613692, 0, 0.5019608, 1, 1,
0.2483154, 0.2488167, 2.495881, 0, 0.4941176, 1, 1,
0.2510198, -0.8694186, 3.537021, 0, 0.4901961, 1, 1,
0.2550175, -0.3736818, 2.359356, 0, 0.4823529, 1, 1,
0.2571978, 1.238478, 0.6423997, 0, 0.4784314, 1, 1,
0.2572043, 2.1262, 0.9616532, 0, 0.4705882, 1, 1,
0.2584204, 0.8373485, 0.1606577, 0, 0.4666667, 1, 1,
0.2601271, 0.2120923, 0.5420453, 0, 0.4588235, 1, 1,
0.2606326, -0.3735772, 2.738259, 0, 0.454902, 1, 1,
0.2612285, -2.215103, 2.251559, 0, 0.4470588, 1, 1,
0.2619713, 0.6128688, 0.4188555, 0, 0.4431373, 1, 1,
0.2620063, 0.3413026, -0.4912478, 0, 0.4352941, 1, 1,
0.2680348, 1.445435, 0.340282, 0, 0.4313726, 1, 1,
0.2698025, 0.102272, 0.4228692, 0, 0.4235294, 1, 1,
0.2702301, -0.3917331, 2.270914, 0, 0.4196078, 1, 1,
0.2713051, 0.8998765, 0.1280065, 0, 0.4117647, 1, 1,
0.2715576, -0.4833053, 2.03382, 0, 0.4078431, 1, 1,
0.2715768, 1.045501, -0.3373762, 0, 0.4, 1, 1,
0.272065, -0.06419034, 2.866471, 0, 0.3921569, 1, 1,
0.2743524, -0.132315, 2.336571, 0, 0.3882353, 1, 1,
0.2775307, 1.547042, 2.325039, 0, 0.3803922, 1, 1,
0.2783324, -0.5230335, 2.493815, 0, 0.3764706, 1, 1,
0.2795754, 1.421861, -0.1801915, 0, 0.3686275, 1, 1,
0.2830597, 0.2780536, -1.404122, 0, 0.3647059, 1, 1,
0.2842113, 0.933256, 0.8063501, 0, 0.3568628, 1, 1,
0.2913781, 0.1477225, 0.525816, 0, 0.3529412, 1, 1,
0.2954495, -0.1373056, 1.962874, 0, 0.345098, 1, 1,
0.2966661, 0.6702676, 0.9938857, 0, 0.3411765, 1, 1,
0.303878, 0.5756298, 1.850603, 0, 0.3333333, 1, 1,
0.3046739, 0.1104819, 1.795427, 0, 0.3294118, 1, 1,
0.3119206, -0.4870955, 3.034223, 0, 0.3215686, 1, 1,
0.3142303, -0.8181099, 2.659098, 0, 0.3176471, 1, 1,
0.3156486, 0.1059038, 2.204628, 0, 0.3098039, 1, 1,
0.3158609, -0.02453468, 1.086309, 0, 0.3058824, 1, 1,
0.3170016, -0.2024802, 1.969155, 0, 0.2980392, 1, 1,
0.317073, 1.300166, 0.2616558, 0, 0.2901961, 1, 1,
0.3178815, 1.342911, 1.843217, 0, 0.2862745, 1, 1,
0.3192137, -0.4704535, 2.006678, 0, 0.2784314, 1, 1,
0.3200538, -0.1437857, 3.186836, 0, 0.2745098, 1, 1,
0.3203997, -0.3571783, 1.547635, 0, 0.2666667, 1, 1,
0.3241108, -1.495017, 3.825681, 0, 0.2627451, 1, 1,
0.3250262, 0.514473, 1.868109, 0, 0.254902, 1, 1,
0.3263046, -0.3768876, 1.505278, 0, 0.2509804, 1, 1,
0.33176, 0.5762677, 1.663132, 0, 0.2431373, 1, 1,
0.3332728, -0.8564644, 4.216332, 0, 0.2392157, 1, 1,
0.333283, 1.630073, 0.6608727, 0, 0.2313726, 1, 1,
0.3371004, -0.09986763, 1.370408, 0, 0.227451, 1, 1,
0.3420416, 0.3038071, 0.5830688, 0, 0.2196078, 1, 1,
0.3447299, -0.362, 3.323719, 0, 0.2156863, 1, 1,
0.3448555, 0.9879713, -0.2426033, 0, 0.2078431, 1, 1,
0.3462263, -1.996331, 2.343683, 0, 0.2039216, 1, 1,
0.3472337, -0.732168, 1.626672, 0, 0.1960784, 1, 1,
0.3512397, -0.7902867, 1.768643, 0, 0.1882353, 1, 1,
0.3553561, 0.3449158, 0.2274996, 0, 0.1843137, 1, 1,
0.3558308, 1.913739, 1.07905, 0, 0.1764706, 1, 1,
0.3622079, 0.01470135, 2.700879, 0, 0.172549, 1, 1,
0.3640848, -0.2586979, 1.119172, 0, 0.1647059, 1, 1,
0.3670896, 0.5320399, 0.2814209, 0, 0.1607843, 1, 1,
0.3686053, 0.3313788, 1.624707, 0, 0.1529412, 1, 1,
0.3713821, 1.21726, -0.6140458, 0, 0.1490196, 1, 1,
0.373887, 1.629936, 0.6461123, 0, 0.1411765, 1, 1,
0.3747091, 1.203587, -0.4934174, 0, 0.1372549, 1, 1,
0.3784443, -1.416002, 5.277293, 0, 0.1294118, 1, 1,
0.3793623, -0.2874354, 0.2612287, 0, 0.1254902, 1, 1,
0.3813492, -0.6571075, 3.516259, 0, 0.1176471, 1, 1,
0.385858, 0.02688957, 1.161724, 0, 0.1137255, 1, 1,
0.3887877, 0.1964387, -0.5861871, 0, 0.1058824, 1, 1,
0.3944868, 0.4695535, -0.1170533, 0, 0.09803922, 1, 1,
0.4013993, 0.2354947, 0.7197759, 0, 0.09411765, 1, 1,
0.4015943, -0.6972905, 1.921751, 0, 0.08627451, 1, 1,
0.4036904, 1.00727, 1.373462, 0, 0.08235294, 1, 1,
0.4065638, 1.69213, -0.2447274, 0, 0.07450981, 1, 1,
0.4068406, -1.710939, 3.91141, 0, 0.07058824, 1, 1,
0.4102831, -0.4438759, 4.720924, 0, 0.0627451, 1, 1,
0.4105887, -0.6615456, 3.059706, 0, 0.05882353, 1, 1,
0.4184605, -0.7880647, 1.033857, 0, 0.05098039, 1, 1,
0.4246817, -1.448579, 2.47115, 0, 0.04705882, 1, 1,
0.4313328, -1.652993, 4.3361, 0, 0.03921569, 1, 1,
0.431737, -1.139652, 3.147828, 0, 0.03529412, 1, 1,
0.4343587, 0.8817005, 0.3900619, 0, 0.02745098, 1, 1,
0.4375117, 1.609545, 0.1004364, 0, 0.02352941, 1, 1,
0.4438095, -1.058234, 1.869057, 0, 0.01568628, 1, 1,
0.4501421, -0.5492952, 3.317811, 0, 0.01176471, 1, 1,
0.453833, 0.2126883, 1.543316, 0, 0.003921569, 1, 1,
0.4564823, 0.318944, 1.214824, 0.003921569, 0, 1, 1,
0.457391, -0.3469689, 3.093305, 0.007843138, 0, 1, 1,
0.462724, -0.5632506, 2.566001, 0.01568628, 0, 1, 1,
0.4659315, -1.082266, 3.314404, 0.01960784, 0, 1, 1,
0.4659826, 2.222056, 0.7320397, 0.02745098, 0, 1, 1,
0.4722264, 0.5343664, 1.567114, 0.03137255, 0, 1, 1,
0.4753972, 0.06756583, 1.415107, 0.03921569, 0, 1, 1,
0.4763706, 0.2343441, 0.7912441, 0.04313726, 0, 1, 1,
0.4768439, -0.04744236, 2.607003, 0.05098039, 0, 1, 1,
0.4788544, -0.1080406, 1.276891, 0.05490196, 0, 1, 1,
0.480507, 2.41988, 0.7921777, 0.0627451, 0, 1, 1,
0.4810229, -0.1806174, 3.529296, 0.06666667, 0, 1, 1,
0.481461, 0.3215873, 1.485076, 0.07450981, 0, 1, 1,
0.4845304, 0.9357191, -0.4834155, 0.07843138, 0, 1, 1,
0.484533, 1.367086, 0.06599292, 0.08627451, 0, 1, 1,
0.4846358, -1.122685, 1.850921, 0.09019608, 0, 1, 1,
0.4862838, 3.023804, 0.6471268, 0.09803922, 0, 1, 1,
0.4868818, -1.081505, 2.444924, 0.1058824, 0, 1, 1,
0.493413, 0.03221786, 0.698247, 0.1098039, 0, 1, 1,
0.4991102, 0.6355914, -0.3392655, 0.1176471, 0, 1, 1,
0.5093173, -0.5381112, 2.003275, 0.1215686, 0, 1, 1,
0.5116493, 0.7711253, 0.8054981, 0.1294118, 0, 1, 1,
0.5119348, -0.3893391, 1.924419, 0.1333333, 0, 1, 1,
0.5124227, -0.4143191, 1.715665, 0.1411765, 0, 1, 1,
0.5192682, 0.6292136, 0.5506691, 0.145098, 0, 1, 1,
0.519884, 0.1184863, 2.101559, 0.1529412, 0, 1, 1,
0.5283307, 1.221018, -0.2115912, 0.1568628, 0, 1, 1,
0.5291892, -1.302363, 3.01734, 0.1647059, 0, 1, 1,
0.5292258, 0.09582234, 1.518583, 0.1686275, 0, 1, 1,
0.5372591, -0.3005691, 3.69065, 0.1764706, 0, 1, 1,
0.5457646, -0.02839459, 1.479578, 0.1803922, 0, 1, 1,
0.5484964, -0.7856404, 2.713706, 0.1882353, 0, 1, 1,
0.5506616, 0.1269225, 0.8911485, 0.1921569, 0, 1, 1,
0.5521366, 1.176277, 0.2158363, 0.2, 0, 1, 1,
0.5561281, 0.9521253, 1.306013, 0.2078431, 0, 1, 1,
0.5563934, -0.782553, 2.135957, 0.2117647, 0, 1, 1,
0.5568034, 1.094067, 0.08013916, 0.2196078, 0, 1, 1,
0.5572852, -1.070903, 1.908856, 0.2235294, 0, 1, 1,
0.5581555, 0.04204446, 1.783733, 0.2313726, 0, 1, 1,
0.5588096, 0.1055105, 2.292814, 0.2352941, 0, 1, 1,
0.5601348, -0.2936354, 1.56184, 0.2431373, 0, 1, 1,
0.5609739, 0.8184641, 0.4025501, 0.2470588, 0, 1, 1,
0.5611867, -0.5036443, 3.817293, 0.254902, 0, 1, 1,
0.565329, 1.451541, 1.016636, 0.2588235, 0, 1, 1,
0.5662527, -0.587139, 2.245866, 0.2666667, 0, 1, 1,
0.5710856, 0.663585, -0.1558728, 0.2705882, 0, 1, 1,
0.5782079, -1.059675, 3.070336, 0.2784314, 0, 1, 1,
0.5787295, 1.720821, 0.965905, 0.282353, 0, 1, 1,
0.5803439, -0.05811178, 1.047929, 0.2901961, 0, 1, 1,
0.5931528, 0.2094559, 1.470791, 0.2941177, 0, 1, 1,
0.5934875, -0.04831982, 1.133769, 0.3019608, 0, 1, 1,
0.5993862, 0.09309923, 2.114211, 0.3098039, 0, 1, 1,
0.6028647, 0.2205069, -0.5439752, 0.3137255, 0, 1, 1,
0.6032705, -0.4166548, 2.138691, 0.3215686, 0, 1, 1,
0.6061832, -0.2838308, 2.315374, 0.3254902, 0, 1, 1,
0.6109784, -0.7431768, 1.218692, 0.3333333, 0, 1, 1,
0.6112549, 0.5424524, -0.135311, 0.3372549, 0, 1, 1,
0.6120675, -0.8288434, 1.487668, 0.345098, 0, 1, 1,
0.6127672, -0.05766678, 1.597908, 0.3490196, 0, 1, 1,
0.6151946, 1.010481, -1.832676, 0.3568628, 0, 1, 1,
0.6154343, -0.7549146, 4.322408, 0.3607843, 0, 1, 1,
0.6179698, -0.7714667, 3.111827, 0.3686275, 0, 1, 1,
0.6189137, -0.1111195, 1.927596, 0.372549, 0, 1, 1,
0.6240697, 0.5976571, 1.043183, 0.3803922, 0, 1, 1,
0.6243204, 0.672428, 1.85248, 0.3843137, 0, 1, 1,
0.6253455, 1.275258, -0.6177354, 0.3921569, 0, 1, 1,
0.6278475, -0.09138889, 1.093305, 0.3960784, 0, 1, 1,
0.6330512, -0.886808, 2.483583, 0.4039216, 0, 1, 1,
0.6335713, -1.160577, 3.57351, 0.4117647, 0, 1, 1,
0.6358476, 2.791728, 0.3947426, 0.4156863, 0, 1, 1,
0.6375086, -0.1537534, 3.485237, 0.4235294, 0, 1, 1,
0.6421269, -1.051171, 3.072065, 0.427451, 0, 1, 1,
0.6478738, -0.8640544, 1.373179, 0.4352941, 0, 1, 1,
0.6485896, -1.099831, 2.859381, 0.4392157, 0, 1, 1,
0.6487206, 0.7710193, -1.45234, 0.4470588, 0, 1, 1,
0.6513039, 0.3728994, 1.632754, 0.4509804, 0, 1, 1,
0.6528848, 0.02110293, 3.251912, 0.4588235, 0, 1, 1,
0.6539572, 0.9680755, -0.266955, 0.4627451, 0, 1, 1,
0.6549941, 0.4731893, 0.2632577, 0.4705882, 0, 1, 1,
0.6579544, 0.1486423, 1.06846, 0.4745098, 0, 1, 1,
0.6601858, 1.873757, -1.01069, 0.4823529, 0, 1, 1,
0.6661783, 1.181009, 1.004146, 0.4862745, 0, 1, 1,
0.6739552, -0.506062, 2.151404, 0.4941176, 0, 1, 1,
0.6743252, -2.037726, 1.811532, 0.5019608, 0, 1, 1,
0.6813975, -0.09546855, 0.4618279, 0.5058824, 0, 1, 1,
0.681641, -0.4329895, 2.471789, 0.5137255, 0, 1, 1,
0.6834662, -0.475757, 0.8925159, 0.5176471, 0, 1, 1,
0.6839693, 0.2247979, -0.04692537, 0.5254902, 0, 1, 1,
0.684382, 1.421431, -1.22555, 0.5294118, 0, 1, 1,
0.6860343, -1.41778, 1.569879, 0.5372549, 0, 1, 1,
0.6900541, -2.623534, 3.508349, 0.5411765, 0, 1, 1,
0.6904126, 0.1032723, 1.196299, 0.5490196, 0, 1, 1,
0.7092463, -0.5367067, 2.096823, 0.5529412, 0, 1, 1,
0.711044, 0.5258051, 1.229696, 0.5607843, 0, 1, 1,
0.7160006, 1.272372, 0.7500234, 0.5647059, 0, 1, 1,
0.7191641, -1.359072, 1.040583, 0.572549, 0, 1, 1,
0.7217174, -0.4017649, 0.3864986, 0.5764706, 0, 1, 1,
0.7259624, 0.5774761, 0.7918607, 0.5843138, 0, 1, 1,
0.7263273, 0.7775292, 0.6634197, 0.5882353, 0, 1, 1,
0.7279583, 0.3183599, -0.8329666, 0.5960785, 0, 1, 1,
0.7361575, 1.001333, 2.870464, 0.6039216, 0, 1, 1,
0.7369682, 1.949906, -0.5247258, 0.6078432, 0, 1, 1,
0.7379306, -0.6087217, 2.175082, 0.6156863, 0, 1, 1,
0.744038, 0.1662591, 2.762785, 0.6196079, 0, 1, 1,
0.744486, 0.462196, -0.1400039, 0.627451, 0, 1, 1,
0.7450471, -2.043888, 1.963088, 0.6313726, 0, 1, 1,
0.7454797, -1.139788, 3.369384, 0.6392157, 0, 1, 1,
0.7496726, -0.2999988, 1.92534, 0.6431373, 0, 1, 1,
0.7555792, 1.118263, -0.225675, 0.6509804, 0, 1, 1,
0.7580965, -1.493349, 3.141425, 0.654902, 0, 1, 1,
0.7623229, -1.996209, 2.114381, 0.6627451, 0, 1, 1,
0.7640643, 0.8595987, 1.20609, 0.6666667, 0, 1, 1,
0.7693776, 0.7203806, 0.03633635, 0.6745098, 0, 1, 1,
0.7802225, 0.2237469, 0.4422659, 0.6784314, 0, 1, 1,
0.7813817, -0.5937123, 0.8150236, 0.6862745, 0, 1, 1,
0.7822461, -1.329414, 3.57688, 0.6901961, 0, 1, 1,
0.7861017, -2.260031, 4.134504, 0.6980392, 0, 1, 1,
0.7889141, -1.036873, 2.526687, 0.7058824, 0, 1, 1,
0.7900224, -0.4232823, 0.7230974, 0.7098039, 0, 1, 1,
0.7987738, 1.809703, -0.2003321, 0.7176471, 0, 1, 1,
0.7997068, -0.1304103, 0.8416111, 0.7215686, 0, 1, 1,
0.8060875, -0.2878193, 1.423528, 0.7294118, 0, 1, 1,
0.8089285, 0.7780185, 0.5934565, 0.7333333, 0, 1, 1,
0.8099896, -0.101925, 0.8172708, 0.7411765, 0, 1, 1,
0.8115989, -0.5198314, 2.070518, 0.7450981, 0, 1, 1,
0.818058, 1.276261, 2.34126, 0.7529412, 0, 1, 1,
0.8239656, -2.028674, 3.999221, 0.7568628, 0, 1, 1,
0.8270507, 0.6685522, 0.5558349, 0.7647059, 0, 1, 1,
0.832678, 0.9890077, -0.484462, 0.7686275, 0, 1, 1,
0.8335021, -0.5953487, 1.093863, 0.7764706, 0, 1, 1,
0.837728, -1.055257, 2.011457, 0.7803922, 0, 1, 1,
0.8380754, 0.2689945, 1.344965, 0.7882353, 0, 1, 1,
0.8404182, -2.580798, 3.334866, 0.7921569, 0, 1, 1,
0.8408369, 0.9487062, 0.3333293, 0.8, 0, 1, 1,
0.8482544, 0.4236165, 1.34629, 0.8078431, 0, 1, 1,
0.8521934, -0.4357554, 3.703894, 0.8117647, 0, 1, 1,
0.8570514, 2.271323, 0.7212351, 0.8196079, 0, 1, 1,
0.8634589, -0.716728, 2.069727, 0.8235294, 0, 1, 1,
0.86375, -2.048915, 3.164006, 0.8313726, 0, 1, 1,
0.8666375, 0.4969282, 1.571608, 0.8352941, 0, 1, 1,
0.8702208, -0.4536136, 2.79732, 0.8431373, 0, 1, 1,
0.871501, -0.6781667, 3.914186, 0.8470588, 0, 1, 1,
0.8735872, -0.4674025, 3.593032, 0.854902, 0, 1, 1,
0.8741076, -0.2738167, 2.601844, 0.8588235, 0, 1, 1,
0.8865169, 1.038269, 0.4585645, 0.8666667, 0, 1, 1,
0.8883669, 2.166015, -0.5519679, 0.8705882, 0, 1, 1,
0.8919495, 0.03415096, 0.2624832, 0.8784314, 0, 1, 1,
0.8940777, -0.1408394, 1.999746, 0.8823529, 0, 1, 1,
0.8999227, -0.1410559, 2.213803, 0.8901961, 0, 1, 1,
0.9010494, 0.3217611, 1.369157, 0.8941177, 0, 1, 1,
0.9018474, -0.6194701, 2.866802, 0.9019608, 0, 1, 1,
0.9036089, 0.8973801, -0.05545369, 0.9098039, 0, 1, 1,
0.9078843, -0.1188151, 2.674351, 0.9137255, 0, 1, 1,
0.9085025, -0.0165986, 3.198758, 0.9215686, 0, 1, 1,
0.916082, -0.2144749, 2.299008, 0.9254902, 0, 1, 1,
0.9179707, 0.119721, 2.306091, 0.9333333, 0, 1, 1,
0.9207931, -0.7248899, 2.28529, 0.9372549, 0, 1, 1,
0.9212689, -2.021102, 2.595829, 0.945098, 0, 1, 1,
0.9233949, 1.028158, 1.8979, 0.9490196, 0, 1, 1,
0.9278172, -1.534408, 4.946706, 0.9568627, 0, 1, 1,
0.9283863, -0.18167, 1.907052, 0.9607843, 0, 1, 1,
0.9432859, 0.8399382, 0.7677912, 0.9686275, 0, 1, 1,
0.9435193, 0.8492022, 2.431104, 0.972549, 0, 1, 1,
0.9507255, 0.2366881, -0.108885, 0.9803922, 0, 1, 1,
0.9512274, 0.2775805, 1.154356, 0.9843137, 0, 1, 1,
0.9515258, 1.025666, 0.02878757, 0.9921569, 0, 1, 1,
0.9522023, 0.187623, -0.4115393, 0.9960784, 0, 1, 1,
0.9524438, -0.07410998, 1.197879, 1, 0, 0.9960784, 1,
0.9541027, 2.052668, -0.3099421, 1, 0, 0.9882353, 1,
0.9556689, -0.4892392, 2.063214, 1, 0, 0.9843137, 1,
0.9559472, 0.9592515, 0.6874993, 1, 0, 0.9764706, 1,
0.9620345, 0.09829605, 0.5187863, 1, 0, 0.972549, 1,
0.9637631, -2.261357, 3.270759, 1, 0, 0.9647059, 1,
0.9743664, -0.1590032, 2.228949, 1, 0, 0.9607843, 1,
0.9805852, -0.5780917, 1.068206, 1, 0, 0.9529412, 1,
0.9809945, -0.1776173, 2.058474, 1, 0, 0.9490196, 1,
0.9850045, 0.507813, 1.906612, 1, 0, 0.9411765, 1,
0.9935141, 0.06923542, 1.796259, 1, 0, 0.9372549, 1,
0.9976535, -0.2999177, 0.9541535, 1, 0, 0.9294118, 1,
1.009753, 0.6891761, -0.5162431, 1, 0, 0.9254902, 1,
1.012509, 1.582476, 0.3589509, 1, 0, 0.9176471, 1,
1.016487, 0.7871946, 2.420599, 1, 0, 0.9137255, 1,
1.024451, 0.4291533, 1.165426, 1, 0, 0.9058824, 1,
1.032575, -0.1069095, 0.6256503, 1, 0, 0.9019608, 1,
1.033894, -1.247406, 3.258622, 1, 0, 0.8941177, 1,
1.036036, 0.299338, 2.475615, 1, 0, 0.8862745, 1,
1.036093, 0.8261877, -0.3351177, 1, 0, 0.8823529, 1,
1.037044, -0.4591671, 3.441295, 1, 0, 0.8745098, 1,
1.039587, -0.2315659, 3.286295, 1, 0, 0.8705882, 1,
1.041846, 0.2865318, 2.772108, 1, 0, 0.8627451, 1,
1.044976, -1.056305, 1.473323, 1, 0, 0.8588235, 1,
1.049552, -0.03925029, 1.483937, 1, 0, 0.8509804, 1,
1.053736, -0.6323934, 0.6316392, 1, 0, 0.8470588, 1,
1.057253, 0.8079286, 2.716029, 1, 0, 0.8392157, 1,
1.059385, 1.458901, 1.424368, 1, 0, 0.8352941, 1,
1.072471, 0.1228493, 1.072881, 1, 0, 0.827451, 1,
1.083752, 0.8421933, 1.989463, 1, 0, 0.8235294, 1,
1.085253, 0.4750787, 1.914846, 1, 0, 0.8156863, 1,
1.092656, -0.7237193, 2.77002, 1, 0, 0.8117647, 1,
1.097012, 0.3047952, 0.2234727, 1, 0, 0.8039216, 1,
1.097953, 0.2729219, 0.7820163, 1, 0, 0.7960784, 1,
1.125725, 1.212462, 0.7184063, 1, 0, 0.7921569, 1,
1.127815, 1.125958, 0.3008831, 1, 0, 0.7843137, 1,
1.129869, -0.1501451, 2.643945, 1, 0, 0.7803922, 1,
1.138365, -0.4133279, 0.2072801, 1, 0, 0.772549, 1,
1.143867, -0.2108965, 1.610796, 1, 0, 0.7686275, 1,
1.15056, -0.148518, 2.66693, 1, 0, 0.7607843, 1,
1.150616, 1.286884, 0.6564479, 1, 0, 0.7568628, 1,
1.168264, 0.1255189, 1.798068, 1, 0, 0.7490196, 1,
1.175889, 0.2868888, 2.510148, 1, 0, 0.7450981, 1,
1.17963, 1.119873, 0.6982433, 1, 0, 0.7372549, 1,
1.180902, -0.6673123, 1.396576, 1, 0, 0.7333333, 1,
1.187737, -0.8101234, 0.8696285, 1, 0, 0.7254902, 1,
1.192038, -1.536011, 3.903685, 1, 0, 0.7215686, 1,
1.194335, 0.2931426, 1.513951, 1, 0, 0.7137255, 1,
1.194431, -0.8656757, 1.260181, 1, 0, 0.7098039, 1,
1.201155, -0.2088053, 0.2329673, 1, 0, 0.7019608, 1,
1.206168, 2.369275, 0.9130511, 1, 0, 0.6941177, 1,
1.220405, 0.7107086, -0.9228444, 1, 0, 0.6901961, 1,
1.221694, 0.3656428, 1.219059, 1, 0, 0.682353, 1,
1.238606, -1.57795, 3.305545, 1, 0, 0.6784314, 1,
1.245497, 0.8892883, -0.4499531, 1, 0, 0.6705883, 1,
1.267973, -0.08861933, 2.94576, 1, 0, 0.6666667, 1,
1.271318, 0.7839956, 1.405319, 1, 0, 0.6588235, 1,
1.271469, -1.21019, 6.471387, 1, 0, 0.654902, 1,
1.273819, 0.2710052, 1.349202, 1, 0, 0.6470588, 1,
1.275694, -2.058648, 3.366233, 1, 0, 0.6431373, 1,
1.280967, 0.2927149, 1.757735, 1, 0, 0.6352941, 1,
1.282382, -1.067848, 4.805353, 1, 0, 0.6313726, 1,
1.283684, 0.4984277, 2.275742, 1, 0, 0.6235294, 1,
1.285958, -1.037813, 2.707232, 1, 0, 0.6196079, 1,
1.295859, -0.7957113, 0.3085491, 1, 0, 0.6117647, 1,
1.297743, 0.2170709, 0.9833629, 1, 0, 0.6078432, 1,
1.304573, 0.4217609, 0.8237261, 1, 0, 0.6, 1,
1.305502, 0.06054459, 3.107439, 1, 0, 0.5921569, 1,
1.322496, -0.6874099, 2.324989, 1, 0, 0.5882353, 1,
1.329354, 0.08422863, 1.644963, 1, 0, 0.5803922, 1,
1.329799, 0.7742436, -1.13072, 1, 0, 0.5764706, 1,
1.335502, 0.8099066, 0.9065248, 1, 0, 0.5686275, 1,
1.337562, 0.8872313, 1.014124, 1, 0, 0.5647059, 1,
1.341803, -0.7757407, 1.317455, 1, 0, 0.5568628, 1,
1.345768, -0.1904588, 0.5211683, 1, 0, 0.5529412, 1,
1.352775, -0.07261992, 3.390087, 1, 0, 0.5450981, 1,
1.35395, -0.7313555, 2.146892, 1, 0, 0.5411765, 1,
1.369907, 0.5728573, 0.9759291, 1, 0, 0.5333334, 1,
1.384789, -1.249858, 2.603173, 1, 0, 0.5294118, 1,
1.385801, -0.0430081, 1.462081, 1, 0, 0.5215687, 1,
1.399337, 0.3184969, 2.609561, 1, 0, 0.5176471, 1,
1.400503, -0.118975, 3.472843, 1, 0, 0.509804, 1,
1.402155, 0.02403449, 0.115582, 1, 0, 0.5058824, 1,
1.408939, -0.15969, 1.823812, 1, 0, 0.4980392, 1,
1.411457, -0.3537316, 3.558422, 1, 0, 0.4901961, 1,
1.42448, -1.762366, 2.958745, 1, 0, 0.4862745, 1,
1.428259, 0.1997302, 0.6286044, 1, 0, 0.4784314, 1,
1.428531, -1.758341, 2.314841, 1, 0, 0.4745098, 1,
1.431103, 0.6381359, 2.563532, 1, 0, 0.4666667, 1,
1.432274, 0.06371335, 1.805415, 1, 0, 0.4627451, 1,
1.433219, -0.5502185, 1.611861, 1, 0, 0.454902, 1,
1.448915, -0.6550844, 4.299349, 1, 0, 0.4509804, 1,
1.450245, 2.291997, -0.8559982, 1, 0, 0.4431373, 1,
1.462291, -2.682201, 3.697109, 1, 0, 0.4392157, 1,
1.472228, 1.480866, 1.071955, 1, 0, 0.4313726, 1,
1.472669, -1.164593, 1.089882, 1, 0, 0.427451, 1,
1.490556, -0.5844006, 2.307757, 1, 0, 0.4196078, 1,
1.490819, -0.02335079, 1.767327, 1, 0, 0.4156863, 1,
1.493494, 0.4285609, 1.440936, 1, 0, 0.4078431, 1,
1.494594, -2.547037, 0.9812192, 1, 0, 0.4039216, 1,
1.498499, -0.337661, 0.432389, 1, 0, 0.3960784, 1,
1.504879, -0.01578565, 1.223705, 1, 0, 0.3882353, 1,
1.505688, 1.738414, 1.093485, 1, 0, 0.3843137, 1,
1.520599, -0.6059458, 1.035411, 1, 0, 0.3764706, 1,
1.520618, -0.8320308, 2.295584, 1, 0, 0.372549, 1,
1.535709, 0.7040517, 1.928505, 1, 0, 0.3647059, 1,
1.555965, 0.3031892, 1.793856, 1, 0, 0.3607843, 1,
1.567102, 0.2351852, 0.281178, 1, 0, 0.3529412, 1,
1.607964, 0.01704916, 0.01787214, 1, 0, 0.3490196, 1,
1.611595, 0.3979751, 0.9500772, 1, 0, 0.3411765, 1,
1.611904, 0.0790344, 0.8716746, 1, 0, 0.3372549, 1,
1.613238, -0.1108214, 3.098456, 1, 0, 0.3294118, 1,
1.61329, 0.2477756, 1.335556, 1, 0, 0.3254902, 1,
1.625843, 2.339722, -0.1418354, 1, 0, 0.3176471, 1,
1.643933, -1.653088, 1.245594, 1, 0, 0.3137255, 1,
1.649307, -1.196291, 3.479291, 1, 0, 0.3058824, 1,
1.65712, -0.0954697, 1.787666, 1, 0, 0.2980392, 1,
1.658715, -0.2311507, 2.146627, 1, 0, 0.2941177, 1,
1.662046, 0.1851009, 1.304114, 1, 0, 0.2862745, 1,
1.666278, -0.1350215, 3.224446, 1, 0, 0.282353, 1,
1.669115, -1.245931, 1.641156, 1, 0, 0.2745098, 1,
1.675301, 0.7444195, 2.561656, 1, 0, 0.2705882, 1,
1.678638, -0.3052146, 1.246872, 1, 0, 0.2627451, 1,
1.679056, -0.2201898, 1.825142, 1, 0, 0.2588235, 1,
1.691034, 0.8145148, 0.01679515, 1, 0, 0.2509804, 1,
1.693749, 0.8557671, 2.401339, 1, 0, 0.2470588, 1,
1.709561, -0.05076818, -0.6940448, 1, 0, 0.2392157, 1,
1.728727, 0.9350474, 1.772034, 1, 0, 0.2352941, 1,
1.729388, -0.08485679, 0.1901736, 1, 0, 0.227451, 1,
1.745934, 0.8863246, 0.4854976, 1, 0, 0.2235294, 1,
1.757289, -0.5968967, 2.71832, 1, 0, 0.2156863, 1,
1.778948, -0.7811611, 1.563689, 1, 0, 0.2117647, 1,
1.782827, -0.2684554, 1.115217, 1, 0, 0.2039216, 1,
1.82558, 0.4097269, 2.367267, 1, 0, 0.1960784, 1,
1.840839, 0.9893173, -0.06195584, 1, 0, 0.1921569, 1,
1.847851, 1.572446, 1.736978, 1, 0, 0.1843137, 1,
1.867274, 0.136731, 0.2171786, 1, 0, 0.1803922, 1,
1.936562, -0.286548, 3.236499, 1, 0, 0.172549, 1,
1.939342, 0.4777477, 2.108884, 1, 0, 0.1686275, 1,
1.986898, -1.954105, 1.626648, 1, 0, 0.1607843, 1,
1.999463, -0.4559833, 2.864346, 1, 0, 0.1568628, 1,
2.003085, -1.485569, 1.235511, 1, 0, 0.1490196, 1,
2.021971, 0.107331, 1.052137, 1, 0, 0.145098, 1,
2.047054, 0.3182425, 2.287645, 1, 0, 0.1372549, 1,
2.074991, 0.1483696, 1.861258, 1, 0, 0.1333333, 1,
2.085135, 0.8336645, 2.778918, 1, 0, 0.1254902, 1,
2.094589, 1.259722, 1.006919, 1, 0, 0.1215686, 1,
2.114644, 0.5914545, 0.8401145, 1, 0, 0.1137255, 1,
2.13233, 0.2730677, 1.631257, 1, 0, 0.1098039, 1,
2.133402, 1.471844, 2.852022, 1, 0, 0.1019608, 1,
2.15372, -0.695231, 0.7249683, 1, 0, 0.09411765, 1,
2.159772, -1.244898, 0.8949308, 1, 0, 0.09019608, 1,
2.190919, -2.116378, 2.118221, 1, 0, 0.08235294, 1,
2.279037, 0.9407507, 2.019245, 1, 0, 0.07843138, 1,
2.350115, 0.2888899, -0.02942203, 1, 0, 0.07058824, 1,
2.371373, -0.05489312, 1.534373, 1, 0, 0.06666667, 1,
2.438446, 0.7769188, 0.09021622, 1, 0, 0.05882353, 1,
2.450413, -0.6197003, 2.089354, 1, 0, 0.05490196, 1,
2.471356, 0.1833317, 3.381081, 1, 0, 0.04705882, 1,
2.516026, 0.2979385, 2.55684, 1, 0, 0.04313726, 1,
2.607661, 1.437274, 1.140484, 1, 0, 0.03529412, 1,
2.622191, -1.45679, 0.9529365, 1, 0, 0.03137255, 1,
2.699054, -0.03839746, 0.932758, 1, 0, 0.02352941, 1,
2.83419, -0.7007411, 1.680322, 1, 0, 0.01960784, 1,
3.057615, 1.118745, 1.265209, 1, 0, 0.01176471, 1,
3.639202, -0.4063289, 2.202291, 1, 0, 0.007843138, 1
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
0.2618606, -3.67151, -7.469885, 0, -0.5, 0.5, 0.5,
0.2618606, -3.67151, -7.469885, 1, -0.5, 0.5, 0.5,
0.2618606, -3.67151, -7.469885, 1, 1.5, 0.5, 0.5,
0.2618606, -3.67151, -7.469885, 0, 1.5, 0.5, 0.5
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
-4.260399, 0.2361161, -7.469885, 0, -0.5, 0.5, 0.5,
-4.260399, 0.2361161, -7.469885, 1, -0.5, 0.5, 0.5,
-4.260399, 0.2361161, -7.469885, 1, 1.5, 0.5, 0.5,
-4.260399, 0.2361161, -7.469885, 0, 1.5, 0.5, 0.5
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
-4.260399, -3.67151, 0.5110316, 0, -0.5, 0.5, 0.5,
-4.260399, -3.67151, 0.5110316, 1, -0.5, 0.5, 0.5,
-4.260399, -3.67151, 0.5110316, 1, 1.5, 0.5, 0.5,
-4.260399, -3.67151, 0.5110316, 0, 1.5, 0.5, 0.5
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
-3, -2.76975, -5.628135,
3, -2.76975, -5.628135,
-3, -2.76975, -5.628135,
-3, -2.920043, -5.935093,
-2, -2.76975, -5.628135,
-2, -2.920043, -5.935093,
-1, -2.76975, -5.628135,
-1, -2.920043, -5.935093,
0, -2.76975, -5.628135,
0, -2.920043, -5.935093,
1, -2.76975, -5.628135,
1, -2.920043, -5.935093,
2, -2.76975, -5.628135,
2, -2.920043, -5.935093,
3, -2.76975, -5.628135,
3, -2.920043, -5.935093
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
-3, -3.22063, -6.54901, 0, -0.5, 0.5, 0.5,
-3, -3.22063, -6.54901, 1, -0.5, 0.5, 0.5,
-3, -3.22063, -6.54901, 1, 1.5, 0.5, 0.5,
-3, -3.22063, -6.54901, 0, 1.5, 0.5, 0.5,
-2, -3.22063, -6.54901, 0, -0.5, 0.5, 0.5,
-2, -3.22063, -6.54901, 1, -0.5, 0.5, 0.5,
-2, -3.22063, -6.54901, 1, 1.5, 0.5, 0.5,
-2, -3.22063, -6.54901, 0, 1.5, 0.5, 0.5,
-1, -3.22063, -6.54901, 0, -0.5, 0.5, 0.5,
-1, -3.22063, -6.54901, 1, -0.5, 0.5, 0.5,
-1, -3.22063, -6.54901, 1, 1.5, 0.5, 0.5,
-1, -3.22063, -6.54901, 0, 1.5, 0.5, 0.5,
0, -3.22063, -6.54901, 0, -0.5, 0.5, 0.5,
0, -3.22063, -6.54901, 1, -0.5, 0.5, 0.5,
0, -3.22063, -6.54901, 1, 1.5, 0.5, 0.5,
0, -3.22063, -6.54901, 0, 1.5, 0.5, 0.5,
1, -3.22063, -6.54901, 0, -0.5, 0.5, 0.5,
1, -3.22063, -6.54901, 1, -0.5, 0.5, 0.5,
1, -3.22063, -6.54901, 1, 1.5, 0.5, 0.5,
1, -3.22063, -6.54901, 0, 1.5, 0.5, 0.5,
2, -3.22063, -6.54901, 0, -0.5, 0.5, 0.5,
2, -3.22063, -6.54901, 1, -0.5, 0.5, 0.5,
2, -3.22063, -6.54901, 1, 1.5, 0.5, 0.5,
2, -3.22063, -6.54901, 0, 1.5, 0.5, 0.5,
3, -3.22063, -6.54901, 0, -0.5, 0.5, 0.5,
3, -3.22063, -6.54901, 1, -0.5, 0.5, 0.5,
3, -3.22063, -6.54901, 1, 1.5, 0.5, 0.5,
3, -3.22063, -6.54901, 0, 1.5, 0.5, 0.5
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
-3.216801, -2, -5.628135,
-3.216801, 3, -5.628135,
-3.216801, -2, -5.628135,
-3.390734, -2, -5.935093,
-3.216801, -1, -5.628135,
-3.390734, -1, -5.935093,
-3.216801, 0, -5.628135,
-3.390734, 0, -5.935093,
-3.216801, 1, -5.628135,
-3.390734, 1, -5.935093,
-3.216801, 2, -5.628135,
-3.390734, 2, -5.935093,
-3.216801, 3, -5.628135,
-3.390734, 3, -5.935093
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
-3.7386, -2, -6.54901, 0, -0.5, 0.5, 0.5,
-3.7386, -2, -6.54901, 1, -0.5, 0.5, 0.5,
-3.7386, -2, -6.54901, 1, 1.5, 0.5, 0.5,
-3.7386, -2, -6.54901, 0, 1.5, 0.5, 0.5,
-3.7386, -1, -6.54901, 0, -0.5, 0.5, 0.5,
-3.7386, -1, -6.54901, 1, -0.5, 0.5, 0.5,
-3.7386, -1, -6.54901, 1, 1.5, 0.5, 0.5,
-3.7386, -1, -6.54901, 0, 1.5, 0.5, 0.5,
-3.7386, 0, -6.54901, 0, -0.5, 0.5, 0.5,
-3.7386, 0, -6.54901, 1, -0.5, 0.5, 0.5,
-3.7386, 0, -6.54901, 1, 1.5, 0.5, 0.5,
-3.7386, 0, -6.54901, 0, 1.5, 0.5, 0.5,
-3.7386, 1, -6.54901, 0, -0.5, 0.5, 0.5,
-3.7386, 1, -6.54901, 1, -0.5, 0.5, 0.5,
-3.7386, 1, -6.54901, 1, 1.5, 0.5, 0.5,
-3.7386, 1, -6.54901, 0, 1.5, 0.5, 0.5,
-3.7386, 2, -6.54901, 0, -0.5, 0.5, 0.5,
-3.7386, 2, -6.54901, 1, -0.5, 0.5, 0.5,
-3.7386, 2, -6.54901, 1, 1.5, 0.5, 0.5,
-3.7386, 2, -6.54901, 0, 1.5, 0.5, 0.5,
-3.7386, 3, -6.54901, 0, -0.5, 0.5, 0.5,
-3.7386, 3, -6.54901, 1, -0.5, 0.5, 0.5,
-3.7386, 3, -6.54901, 1, 1.5, 0.5, 0.5,
-3.7386, 3, -6.54901, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
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
20, 21, 22, 20, 22, 23
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
-3.216801, -2.76975, -4,
-3.216801, -2.76975, 6,
-3.216801, -2.76975, -4,
-3.390734, -2.920043, -4,
-3.216801, -2.76975, -2,
-3.390734, -2.920043, -2,
-3.216801, -2.76975, 0,
-3.390734, -2.920043, 0,
-3.216801, -2.76975, 2,
-3.390734, -2.920043, 2,
-3.216801, -2.76975, 4,
-3.390734, -2.920043, 4,
-3.216801, -2.76975, 6,
-3.390734, -2.920043, 6
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
"4",
"6"
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
-3.7386, -3.22063, -4, 0, -0.5, 0.5, 0.5,
-3.7386, -3.22063, -4, 1, -0.5, 0.5, 0.5,
-3.7386, -3.22063, -4, 1, 1.5, 0.5, 0.5,
-3.7386, -3.22063, -4, 0, 1.5, 0.5, 0.5,
-3.7386, -3.22063, -2, 0, -0.5, 0.5, 0.5,
-3.7386, -3.22063, -2, 1, -0.5, 0.5, 0.5,
-3.7386, -3.22063, -2, 1, 1.5, 0.5, 0.5,
-3.7386, -3.22063, -2, 0, 1.5, 0.5, 0.5,
-3.7386, -3.22063, 0, 0, -0.5, 0.5, 0.5,
-3.7386, -3.22063, 0, 1, -0.5, 0.5, 0.5,
-3.7386, -3.22063, 0, 1, 1.5, 0.5, 0.5,
-3.7386, -3.22063, 0, 0, 1.5, 0.5, 0.5,
-3.7386, -3.22063, 2, 0, -0.5, 0.5, 0.5,
-3.7386, -3.22063, 2, 1, -0.5, 0.5, 0.5,
-3.7386, -3.22063, 2, 1, 1.5, 0.5, 0.5,
-3.7386, -3.22063, 2, 0, 1.5, 0.5, 0.5,
-3.7386, -3.22063, 4, 0, -0.5, 0.5, 0.5,
-3.7386, -3.22063, 4, 1, -0.5, 0.5, 0.5,
-3.7386, -3.22063, 4, 1, 1.5, 0.5, 0.5,
-3.7386, -3.22063, 4, 0, 1.5, 0.5, 0.5,
-3.7386, -3.22063, 6, 0, -0.5, 0.5, 0.5,
-3.7386, -3.22063, 6, 1, -0.5, 0.5, 0.5,
-3.7386, -3.22063, 6, 1, 1.5, 0.5, 0.5,
-3.7386, -3.22063, 6, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
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
20, 21, 22, 20, 22, 23
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
-3.216801, -2.76975, -5.628135,
-3.216801, 3.241982, -5.628135,
-3.216801, -2.76975, 6.650198,
-3.216801, 3.241982, 6.650198,
-3.216801, -2.76975, -5.628135,
-3.216801, -2.76975, 6.650198,
-3.216801, 3.241982, -5.628135,
-3.216801, 3.241982, 6.650198,
-3.216801, -2.76975, -5.628135,
3.740522, -2.76975, -5.628135,
-3.216801, -2.76975, 6.650198,
3.740522, -2.76975, 6.650198,
-3.216801, 3.241982, -5.628135,
3.740522, 3.241982, -5.628135,
-3.216801, 3.241982, 6.650198,
3.740522, 3.241982, 6.650198,
3.740522, -2.76975, -5.628135,
3.740522, 3.241982, -5.628135,
3.740522, -2.76975, 6.650198,
3.740522, 3.241982, 6.650198,
3.740522, -2.76975, -5.628135,
3.740522, -2.76975, 6.650198,
3.740522, 3.241982, -5.628135,
3.740522, 3.241982, 6.650198
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
var radius = 8.191038;
var distance = 36.44285;
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
mvMatrix.translate( -0.2618606, -0.2361161, -0.5110316 );
mvMatrix.scale( 1.272948, 1.473171, 0.7212959 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.44285);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Inositols<-read.table("Inositols.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Inositols$V2
```

```
## Error in eval(expr, envir, enclos): object 'Inositols' not found
```

```r
y<-Inositols$V3
```

```
## Error in eval(expr, envir, enclos): object 'Inositols' not found
```

```r
z<-Inositols$V4
```

```
## Error in eval(expr, envir, enclos): object 'Inositols' not found
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
-3.115481, -0.05894001, -1.446746, 0, 0, 1, 1, 1,
-3.012292, -0.06029779, -1.662714, 1, 0, 0, 1, 1,
-2.960429, -1.501798, -2.339303, 1, 0, 0, 1, 1,
-2.804853, 1.331771, -1.0823, 1, 0, 0, 1, 1,
-2.664777, 0.7499424, -0.572656, 1, 0, 0, 1, 1,
-2.602592, -0.1227502, -1.652833, 1, 0, 0, 1, 1,
-2.529213, -0.4778584, -1.554988, 0, 0, 0, 1, 1,
-2.430249, -0.2580693, 0.241515, 0, 0, 0, 1, 1,
-2.418677, 0.176265, -1.615578, 0, 0, 0, 1, 1,
-2.365452, 0.3182063, -1.182042, 0, 0, 0, 1, 1,
-2.302465, 0.09085789, -1.745598, 0, 0, 0, 1, 1,
-2.287893, -1.010445, -1.25343, 0, 0, 0, 1, 1,
-2.286699, -1.658166, -1.742581, 0, 0, 0, 1, 1,
-2.277689, 2.452789, -0.9156282, 1, 1, 1, 1, 1,
-2.267242, 0.8173468, -2.407866, 1, 1, 1, 1, 1,
-2.129656, 1.07438, -1.054503, 1, 1, 1, 1, 1,
-2.103691, 1.333442, 0.1883008, 1, 1, 1, 1, 1,
-2.087934, 0.4980381, -0.6931381, 1, 1, 1, 1, 1,
-2.08762, 0.4573368, -2.456286, 1, 1, 1, 1, 1,
-2.068919, -1.245866, -2.202567, 1, 1, 1, 1, 1,
-2.018107, -1.476446, -1.807647, 1, 1, 1, 1, 1,
-2.00633, -0.0677202, -1.485022, 1, 1, 1, 1, 1,
-1.976549, -1.197148, -1.977402, 1, 1, 1, 1, 1,
-1.974812, 0.5425537, -3.034369, 1, 1, 1, 1, 1,
-1.943394, -1.076949, -1.501477, 1, 1, 1, 1, 1,
-1.94234, -0.06990423, -1.318565, 1, 1, 1, 1, 1,
-1.872873, 0.4157224, -2.412177, 1, 1, 1, 1, 1,
-1.852266, -1.585167, -1.059911, 1, 1, 1, 1, 1,
-1.83738, 0.02509022, -2.32264, 0, 0, 1, 1, 1,
-1.823302, -1.171871, -1.479188, 1, 0, 0, 1, 1,
-1.817454, 0.5677615, -0.8676043, 1, 0, 0, 1, 1,
-1.775597, -0.6607329, -0.6766657, 1, 0, 0, 1, 1,
-1.767662, 0.2070661, -1.704165, 1, 0, 0, 1, 1,
-1.764034, 1.618143, -1.059761, 1, 0, 0, 1, 1,
-1.75083, 1.037385, -1.21162, 0, 0, 0, 1, 1,
-1.74346, -0.02643024, -1.013357, 0, 0, 0, 1, 1,
-1.7226, 0.6003985, -1.302026, 0, 0, 0, 1, 1,
-1.721233, 0.1869211, -1.197755, 0, 0, 0, 1, 1,
-1.709038, -1.894251, -1.491137, 0, 0, 0, 1, 1,
-1.704681, 0.6965197, 0.002259503, 0, 0, 0, 1, 1,
-1.702881, -1.129617, -0.9093559, 0, 0, 0, 1, 1,
-1.702775, -0.579536, -3.072286, 1, 1, 1, 1, 1,
-1.681036, 0.3209539, -2.385406, 1, 1, 1, 1, 1,
-1.648661, -0.2013085, -1.361632, 1, 1, 1, 1, 1,
-1.629126, -0.6208501, -1.440866, 1, 1, 1, 1, 1,
-1.610721, 0.103761, -3.090364, 1, 1, 1, 1, 1,
-1.587307, 0.8599191, -1.668457, 1, 1, 1, 1, 1,
-1.575361, 0.7660202, -0.8934962, 1, 1, 1, 1, 1,
-1.540833, -0.5372051, -1.302202, 1, 1, 1, 1, 1,
-1.528149, -0.8118245, -1.016474, 1, 1, 1, 1, 1,
-1.526514, 1.529626, -0.2041566, 1, 1, 1, 1, 1,
-1.510176, -0.05715588, -1.854766, 1, 1, 1, 1, 1,
-1.494115, 0.9316423, 2.316615, 1, 1, 1, 1, 1,
-1.485579, 2.453608, -0.8396746, 1, 1, 1, 1, 1,
-1.481717, -0.3497529, -2.086178, 1, 1, 1, 1, 1,
-1.46347, 0.08549064, -2.521728, 1, 1, 1, 1, 1,
-1.460195, 0.9250629, -1.420239, 0, 0, 1, 1, 1,
-1.439175, 0.8768409, 0.0860008, 1, 0, 0, 1, 1,
-1.429827, 0.3805085, -0.6468904, 1, 0, 0, 1, 1,
-1.421373, -1.155647, -1.199309, 1, 0, 0, 1, 1,
-1.405984, -1.584896, -2.636988, 1, 0, 0, 1, 1,
-1.396957, -0.1382032, -2.231694, 1, 0, 0, 1, 1,
-1.393789, -0.6325784, -0.6178778, 0, 0, 0, 1, 1,
-1.388923, 1.82352, -0.7274423, 0, 0, 0, 1, 1,
-1.377643, 1.494049, 1.285105, 0, 0, 0, 1, 1,
-1.372763, -1.042911, -1.86, 0, 0, 0, 1, 1,
-1.365873, 1.625005, -2.134371, 0, 0, 0, 1, 1,
-1.344932, 0.5624698, -1.812436, 0, 0, 0, 1, 1,
-1.337959, 1.364776, -0.9340523, 0, 0, 0, 1, 1,
-1.337669, 0.06481189, -0.3880055, 1, 1, 1, 1, 1,
-1.328136, -0.3971082, -3.304489, 1, 1, 1, 1, 1,
-1.327519, 0.6774202, 0.6418214, 1, 1, 1, 1, 1,
-1.325646, -0.5155413, -3.855913, 1, 1, 1, 1, 1,
-1.324163, 0.4039742, -0.4030643, 1, 1, 1, 1, 1,
-1.323544, 0.6949004, -0.5946438, 1, 1, 1, 1, 1,
-1.317122, -1.418981, -2.125691, 1, 1, 1, 1, 1,
-1.314775, -1.520177, -0.9391186, 1, 1, 1, 1, 1,
-1.301274, -1.033604, -2.344329, 1, 1, 1, 1, 1,
-1.299839, 0.7937843, -1.812691, 1, 1, 1, 1, 1,
-1.298589, -0.1920997, -3.643246, 1, 1, 1, 1, 1,
-1.298584, 0.5149294, -1.851034, 1, 1, 1, 1, 1,
-1.290196, -1.444771, -2.452988, 1, 1, 1, 1, 1,
-1.288884, 1.505088, -0.7795953, 1, 1, 1, 1, 1,
-1.284549, 1.338533, -0.8232996, 1, 1, 1, 1, 1,
-1.284288, -1.136909, -1.945641, 0, 0, 1, 1, 1,
-1.27818, 0.8562397, -0.5812007, 1, 0, 0, 1, 1,
-1.274612, -0.5147272, -1.510067, 1, 0, 0, 1, 1,
-1.261701, -0.2554651, -2.735785, 1, 0, 0, 1, 1,
-1.258008, -0.04647414, -0.3878908, 1, 0, 0, 1, 1,
-1.253445, -0.9217212, -2.158296, 1, 0, 0, 1, 1,
-1.238422, -0.9729962, -2.985363, 0, 0, 0, 1, 1,
-1.23169, -0.4955271, -0.1132185, 0, 0, 0, 1, 1,
-1.22804, -0.7017344, -4.544644, 0, 0, 0, 1, 1,
-1.211557, 0.9896576, -0.2516467, 0, 0, 0, 1, 1,
-1.203737, 0.03458126, -2.535208, 0, 0, 0, 1, 1,
-1.202341, 1.487268, -0.7412055, 0, 0, 0, 1, 1,
-1.201187, 1.795115, -0.3883993, 0, 0, 0, 1, 1,
-1.196866, 0.6935742, -0.5279143, 1, 1, 1, 1, 1,
-1.184648, -0.6167675, -2.459496, 1, 1, 1, 1, 1,
-1.181328, -0.09164385, -1.01504, 1, 1, 1, 1, 1,
-1.176033, 1.360091, -0.7573013, 1, 1, 1, 1, 1,
-1.161327, 0.02686056, -1.708572, 1, 1, 1, 1, 1,
-1.138109, -0.2490311, 0.2675749, 1, 1, 1, 1, 1,
-1.133195, -0.8725746, -2.924361, 1, 1, 1, 1, 1,
-1.131874, 0.6975713, 0.1549503, 1, 1, 1, 1, 1,
-1.124827, -0.3842814, -0.4283591, 1, 1, 1, 1, 1,
-1.118261, 0.1060408, -2.122134, 1, 1, 1, 1, 1,
-1.116705, 0.5944873, -2.589325, 1, 1, 1, 1, 1,
-1.111412, 1.755484, -2.456774, 1, 1, 1, 1, 1,
-1.111222, -0.5501705, -2.999385, 1, 1, 1, 1, 1,
-1.110347, -0.9650117, -2.390053, 1, 1, 1, 1, 1,
-1.107123, -0.4744853, -2.739816, 1, 1, 1, 1, 1,
-1.106627, -0.03166474, -1.708979, 0, 0, 1, 1, 1,
-1.104955, 0.9942938, -0.4915331, 1, 0, 0, 1, 1,
-1.097774, 0.4152451, -1.705427, 1, 0, 0, 1, 1,
-1.094827, 0.6794647, -2.458792, 1, 0, 0, 1, 1,
-1.093302, 1.422031, -1.622808, 1, 0, 0, 1, 1,
-1.084603, 0.1463645, -0.5402934, 1, 0, 0, 1, 1,
-1.079697, 0.1606187, -2.54555, 0, 0, 0, 1, 1,
-1.07936, -1.316684, -1.451174, 0, 0, 0, 1, 1,
-1.073838, -0.7945059, -1.82716, 0, 0, 0, 1, 1,
-1.065099, 0.3477748, -1.60272, 0, 0, 0, 1, 1,
-1.063277, 0.8508884, 0.1775243, 0, 0, 0, 1, 1,
-1.050018, -0.5012819, -1.586063, 0, 0, 0, 1, 1,
-1.049906, -0.4555902, -0.7436932, 0, 0, 0, 1, 1,
-1.048465, 0.3205633, -1.023088, 1, 1, 1, 1, 1,
-1.040078, 0.2205212, -0.5957299, 1, 1, 1, 1, 1,
-1.037035, 0.4741127, -0.4970621, 1, 1, 1, 1, 1,
-1.034158, 0.6630359, -0.145263, 1, 1, 1, 1, 1,
-1.026318, 0.4410606, -2.242377, 1, 1, 1, 1, 1,
-1.021842, 0.1176482, -0.08496694, 1, 1, 1, 1, 1,
-1.015918, -0.1837203, -1.863009, 1, 1, 1, 1, 1,
-1.006372, -0.8295416, -1.835979, 1, 1, 1, 1, 1,
-1.004039, 0.8523894, -1.695579, 1, 1, 1, 1, 1,
-1.002898, 0.396777, -3.200408, 1, 1, 1, 1, 1,
-1.001662, 0.4060066, -2.089614, 1, 1, 1, 1, 1,
-0.9992734, 1.3477, -3.206269, 1, 1, 1, 1, 1,
-0.9982297, 0.5645265, 0.7326129, 1, 1, 1, 1, 1,
-0.9922119, -0.07468843, -0.8167959, 1, 1, 1, 1, 1,
-0.9892473, -0.05045299, -0.8793543, 1, 1, 1, 1, 1,
-0.9842761, -0.02389855, -1.586293, 0, 0, 1, 1, 1,
-0.9839694, -1.798807, -3.293484, 1, 0, 0, 1, 1,
-0.9797929, -1.434129, -2.752447, 1, 0, 0, 1, 1,
-0.977281, -1.219152, -2.925613, 1, 0, 0, 1, 1,
-0.9768053, 0.9332832, -2.887326, 1, 0, 0, 1, 1,
-0.9743696, 0.4720019, 0.4454511, 1, 0, 0, 1, 1,
-0.972405, 0.07558902, -0.6822444, 0, 0, 0, 1, 1,
-0.9714984, -0.1805258, -3.594428, 0, 0, 0, 1, 1,
-0.9707057, 2.829955, -0.782468, 0, 0, 0, 1, 1,
-0.9687269, -0.6935535, -3.198646, 0, 0, 0, 1, 1,
-0.9686084, 0.5402128, -1.056375, 0, 0, 0, 1, 1,
-0.9599161, 0.8502719, -0.5520361, 0, 0, 0, 1, 1,
-0.9593093, 0.3249915, -1.240204, 0, 0, 0, 1, 1,
-0.9579782, 0.4311942, -2.631899, 1, 1, 1, 1, 1,
-0.95444, -0.2376041, -0.9418611, 1, 1, 1, 1, 1,
-0.94671, -0.2928954, -2.137919, 1, 1, 1, 1, 1,
-0.9461751, -0.4237601, -1.855756, 1, 1, 1, 1, 1,
-0.9394668, -0.0683737, -2.29422, 1, 1, 1, 1, 1,
-0.9384204, 1.052414, -0.341109, 1, 1, 1, 1, 1,
-0.9358032, 0.7593662, -1.944241, 1, 1, 1, 1, 1,
-0.9304689, 0.4368652, -0.4129665, 1, 1, 1, 1, 1,
-0.9268236, -0.3345405, -1.911441, 1, 1, 1, 1, 1,
-0.9165154, -0.1598388, 0.4605654, 1, 1, 1, 1, 1,
-0.9133828, 1.452091, 0.5948477, 1, 1, 1, 1, 1,
-0.9117024, -0.5421962, -1.901565, 1, 1, 1, 1, 1,
-0.9109394, 0.815339, 0.1013956, 1, 1, 1, 1, 1,
-0.9081852, 1.22837, -1.118032, 1, 1, 1, 1, 1,
-0.8983504, -0.2031883, -3.122657, 1, 1, 1, 1, 1,
-0.8974256, 0.7544903, -1.849133, 0, 0, 1, 1, 1,
-0.8929804, -1.045564, -1.800063, 1, 0, 0, 1, 1,
-0.8906967, -0.8021621, -1.464786, 1, 0, 0, 1, 1,
-0.8902694, -0.2628411, 0.2198993, 1, 0, 0, 1, 1,
-0.8876984, 1.983045, -1.191375, 1, 0, 0, 1, 1,
-0.884254, 0.8012444, 0.04015771, 1, 0, 0, 1, 1,
-0.8828768, -0.8396786, -1.763036, 0, 0, 0, 1, 1,
-0.8817542, -1.057025, -1.458354, 0, 0, 0, 1, 1,
-0.8812801, -0.1643748, -0.4621845, 0, 0, 0, 1, 1,
-0.8788792, -0.652047, -0.7975658, 0, 0, 0, 1, 1,
-0.8784518, -0.01038546, -1.530367, 0, 0, 0, 1, 1,
-0.8762085, -1.366165, -2.518167, 0, 0, 0, 1, 1,
-0.874965, -1.36841, -2.928826, 0, 0, 0, 1, 1,
-0.871992, -1.498625, -0.7377288, 1, 1, 1, 1, 1,
-0.8654028, 1.590358, -0.5991648, 1, 1, 1, 1, 1,
-0.861114, 1.151852, -1.159379, 1, 1, 1, 1, 1,
-0.8591847, -1.33224, -3.562365, 1, 1, 1, 1, 1,
-0.8577536, 0.9746252, -0.23857, 1, 1, 1, 1, 1,
-0.8528193, 0.3695693, -1.290662, 1, 1, 1, 1, 1,
-0.8514098, -1.238831, -3.24018, 1, 1, 1, 1, 1,
-0.8510393, -0.2735003, -1.979939, 1, 1, 1, 1, 1,
-0.8402286, -0.03402907, -1.331957, 1, 1, 1, 1, 1,
-0.8375472, 1.585257, 0.4406892, 1, 1, 1, 1, 1,
-0.8365875, 0.72077, 0.2099919, 1, 1, 1, 1, 1,
-0.8347331, 0.1076555, -0.7031964, 1, 1, 1, 1, 1,
-0.833868, -0.6396946, -0.8043709, 1, 1, 1, 1, 1,
-0.8319097, -0.8838394, -0.4366246, 1, 1, 1, 1, 1,
-0.8317906, -0.1606658, -2.822989, 1, 1, 1, 1, 1,
-0.830999, -0.4281941, -1.752948, 0, 0, 1, 1, 1,
-0.8289793, -0.616722, -2.889693, 1, 0, 0, 1, 1,
-0.8289394, -1.649338, -1.687174, 1, 0, 0, 1, 1,
-0.8175415, 1.349948, -2.297528, 1, 0, 0, 1, 1,
-0.8143762, -0.9503703, -0.8952367, 1, 0, 0, 1, 1,
-0.8134755, -1.588224, -3.067924, 1, 0, 0, 1, 1,
-0.8101012, 0.5109257, 0.2400171, 0, 0, 0, 1, 1,
-0.8085197, 0.5229736, -0.6094673, 0, 0, 0, 1, 1,
-0.8058284, 1.000596, -0.8976106, 0, 0, 0, 1, 1,
-0.8057408, -1.019805, -0.4741591, 0, 0, 0, 1, 1,
-0.8055932, 0.2775986, 0.2491351, 0, 0, 0, 1, 1,
-0.800163, -0.246152, -2.333151, 0, 0, 0, 1, 1,
-0.7977085, 1.83954, 0.3449606, 0, 0, 0, 1, 1,
-0.7972577, -0.7406855, -1.556941, 1, 1, 1, 1, 1,
-0.7939122, -0.9022746, -1.95805, 1, 1, 1, 1, 1,
-0.7917723, -0.7762256, -2.855572, 1, 1, 1, 1, 1,
-0.7882062, 0.4298417, -2.450995, 1, 1, 1, 1, 1,
-0.7867799, -2.142531, -2.393892, 1, 1, 1, 1, 1,
-0.7831098, -0.08403061, -1.572939, 1, 1, 1, 1, 1,
-0.782746, 1.038284, -0.1875874, 1, 1, 1, 1, 1,
-0.7781518, 1.365736, 0.3667195, 1, 1, 1, 1, 1,
-0.7716638, -0.5190702, -1.616649, 1, 1, 1, 1, 1,
-0.7668095, 0.2222569, -1.951391, 1, 1, 1, 1, 1,
-0.7661934, 1.530236, -0.834664, 1, 1, 1, 1, 1,
-0.7648817, -0.2566467, 0.5679711, 1, 1, 1, 1, 1,
-0.7628676, -0.775422, -3.51588, 1, 1, 1, 1, 1,
-0.7571358, -1.927437, -3.478426, 1, 1, 1, 1, 1,
-0.7557156, -0.618829, -2.313492, 1, 1, 1, 1, 1,
-0.7468425, -0.0052734, -0.4404228, 0, 0, 1, 1, 1,
-0.7463668, -1.90993, -3.997162, 1, 0, 0, 1, 1,
-0.7456971, -0.5074717, -2.448159, 1, 0, 0, 1, 1,
-0.7434423, -1.022419, -2.907033, 1, 0, 0, 1, 1,
-0.7432911, 0.8952207, -1.130728, 1, 0, 0, 1, 1,
-0.7346618, 1.942743, 1.463776, 1, 0, 0, 1, 1,
-0.7346614, 1.29595, 0.5284858, 0, 0, 0, 1, 1,
-0.7341978, -0.059417, -2.061039, 0, 0, 0, 1, 1,
-0.731694, 1.677755, -0.1261089, 0, 0, 0, 1, 1,
-0.730196, -1.038218, -2.520224, 0, 0, 0, 1, 1,
-0.7283905, -1.275688, -3.115113, 0, 0, 0, 1, 1,
-0.725796, 0.06295738, -1.671521, 0, 0, 0, 1, 1,
-0.7239826, -0.004865777, 0.05973958, 0, 0, 0, 1, 1,
-0.7236202, -0.005408163, -1.161806, 1, 1, 1, 1, 1,
-0.720215, -0.04805576, -2.847625, 1, 1, 1, 1, 1,
-0.7161337, 0.8900384, -1.265807, 1, 1, 1, 1, 1,
-0.7070475, 0.1304771, -1.016355, 1, 1, 1, 1, 1,
-0.7055892, 0.8832885, -0.2158534, 1, 1, 1, 1, 1,
-0.7048532, -0.1964994, -0.775122, 1, 1, 1, 1, 1,
-0.7014433, -2.102316, -4.403879, 1, 1, 1, 1, 1,
-0.6986106, 2.426999, -0.2254625, 1, 1, 1, 1, 1,
-0.696512, 0.3215512, -1.135604, 1, 1, 1, 1, 1,
-0.6960242, -0.4989893, -1.023327, 1, 1, 1, 1, 1,
-0.6949069, 0.586199, 1.054582, 1, 1, 1, 1, 1,
-0.6914059, 0.9149401, 0.07244204, 1, 1, 1, 1, 1,
-0.6884534, 1.272036, 0.7552993, 1, 1, 1, 1, 1,
-0.6793962, -0.4569413, -2.277628, 1, 1, 1, 1, 1,
-0.6766406, -1.945202, -3.104049, 1, 1, 1, 1, 1,
-0.6749111, -0.6657363, -2.71869, 0, 0, 1, 1, 1,
-0.6697988, 0.5237938, -2.819604, 1, 0, 0, 1, 1,
-0.6665033, 0.2698673, -2.588527, 1, 0, 0, 1, 1,
-0.666172, -1.242528, -2.5453, 1, 0, 0, 1, 1,
-0.665309, 0.8801383, -1.118408, 1, 0, 0, 1, 1,
-0.6623355, -0.114371, -2.050829, 1, 0, 0, 1, 1,
-0.6574942, -1.011111, -1.992549, 0, 0, 0, 1, 1,
-0.6535231, 0.8252432, 0.911253, 0, 0, 0, 1, 1,
-0.6453829, -0.2918954, -0.2407867, 0, 0, 0, 1, 1,
-0.6446771, 0.1614517, -1.731725, 0, 0, 0, 1, 1,
-0.6433606, 0.6744473, -0.4835134, 0, 0, 0, 1, 1,
-0.6390158, 1.17418, 1.401924, 0, 0, 0, 1, 1,
-0.6267928, 1.27049, 0.5964866, 0, 0, 0, 1, 1,
-0.6264288, 0.4538898, -0.073639, 1, 1, 1, 1, 1,
-0.625661, -0.006942862, -0.9537048, 1, 1, 1, 1, 1,
-0.6243694, -0.8795676, -2.704176, 1, 1, 1, 1, 1,
-0.6229322, -0.7740959, -4.123356, 1, 1, 1, 1, 1,
-0.6219245, 0.2036593, -1.180752, 1, 1, 1, 1, 1,
-0.6211435, 0.1972077, 0.604341, 1, 1, 1, 1, 1,
-0.6184328, -1.383071, -2.006739, 1, 1, 1, 1, 1,
-0.6176817, -1.13404, -1.298928, 1, 1, 1, 1, 1,
-0.6139539, 0.82312, -0.3154055, 1, 1, 1, 1, 1,
-0.6069561, -0.5043293, -1.281298, 1, 1, 1, 1, 1,
-0.6065351, 1.468551, 0.7008981, 1, 1, 1, 1, 1,
-0.6043094, 0.9106839, -0.1152564, 1, 1, 1, 1, 1,
-0.60259, -1.554088, -1.879625, 1, 1, 1, 1, 1,
-0.6005388, 0.4955015, -3.407684, 1, 1, 1, 1, 1,
-0.5961899, 0.3736804, -1.115727, 1, 1, 1, 1, 1,
-0.5952497, -0.2876517, -1.873972, 0, 0, 1, 1, 1,
-0.5919942, 0.7730364, 0.1347844, 1, 0, 0, 1, 1,
-0.5918627, 0.3313856, -1.732156, 1, 0, 0, 1, 1,
-0.5909669, 0.003345571, -2.499534, 1, 0, 0, 1, 1,
-0.5869408, 1.602838, 0.7846053, 1, 0, 0, 1, 1,
-0.5861521, 0.7256632, -0.5293876, 1, 0, 0, 1, 1,
-0.5796273, -0.8963715, -2.003653, 0, 0, 0, 1, 1,
-0.5785089, 1.183938, -0.1184372, 0, 0, 0, 1, 1,
-0.5764123, -0.8601201, -4.40212, 0, 0, 0, 1, 1,
-0.5763438, -0.03997324, -2.28024, 0, 0, 0, 1, 1,
-0.5740978, -0.9658349, -0.2672309, 0, 0, 0, 1, 1,
-0.5708824, 0.8617147, -0.3307374, 0, 0, 0, 1, 1,
-0.558866, 0.3508435, -0.3349451, 0, 0, 0, 1, 1,
-0.5554069, 2.03181, -0.8448462, 1, 1, 1, 1, 1,
-0.5543764, 0.1964999, 0.9652564, 1, 1, 1, 1, 1,
-0.5499165, -1.134987, -1.950468, 1, 1, 1, 1, 1,
-0.5486492, 0.8672075, 0.1876384, 1, 1, 1, 1, 1,
-0.5418285, 1.200825, 0.8371946, 1, 1, 1, 1, 1,
-0.539192, -0.1435361, -2.734089, 1, 1, 1, 1, 1,
-0.5378845, 0.9566486, 0.395387, 1, 1, 1, 1, 1,
-0.5375805, -1.249141, -4.148019, 1, 1, 1, 1, 1,
-0.5324775, -0.6812783, -2.799601, 1, 1, 1, 1, 1,
-0.5306387, 1.532897, -1.91737, 1, 1, 1, 1, 1,
-0.5268743, 0.5411232, 0.2354594, 1, 1, 1, 1, 1,
-0.5259209, 1.965342, -0.08521383, 1, 1, 1, 1, 1,
-0.525755, 0.3039786, -0.6382467, 1, 1, 1, 1, 1,
-0.5173191, 1.51122, -0.6230193, 1, 1, 1, 1, 1,
-0.5165222, -0.5246927, -2.796557, 1, 1, 1, 1, 1,
-0.5143682, -0.4814113, -2.818387, 0, 0, 1, 1, 1,
-0.512117, 0.748378, 1.952111, 1, 0, 0, 1, 1,
-0.5117544, -0.2182468, -0.3385288, 1, 0, 0, 1, 1,
-0.5096095, -1.081866, -2.887808, 1, 0, 0, 1, 1,
-0.509576, -0.92, -0.8159541, 1, 0, 0, 1, 1,
-0.5043656, -1.216562, -5.449324, 1, 0, 0, 1, 1,
-0.5021681, 0.6297373, -0.9161484, 0, 0, 0, 1, 1,
-0.4968704, 0.05046459, 0.6240594, 0, 0, 0, 1, 1,
-0.4957829, 1.147599, -0.2323572, 0, 0, 0, 1, 1,
-0.4940867, -0.5152943, 0.3647025, 0, 0, 0, 1, 1,
-0.4939855, 0.5446112, -0.1780196, 0, 0, 0, 1, 1,
-0.4938084, -1.126128, -2.583047, 0, 0, 0, 1, 1,
-0.489062, 0.7431657, -1.941499, 0, 0, 0, 1, 1,
-0.4838904, -1.520059, -2.283964, 1, 1, 1, 1, 1,
-0.4830897, 0.6079342, -0.8430257, 1, 1, 1, 1, 1,
-0.4755967, -0.4879198, -2.953096, 1, 1, 1, 1, 1,
-0.4751518, 2.043605, 1.046687, 1, 1, 1, 1, 1,
-0.4703699, 0.8223263, 1.820833, 1, 1, 1, 1, 1,
-0.4703075, -0.4858466, -4.256089, 1, 1, 1, 1, 1,
-0.4667622, -0.6402382, -0.7152717, 1, 1, 1, 1, 1,
-0.4663463, 2.511713, 1.319911, 1, 1, 1, 1, 1,
-0.46192, -0.4853328, -2.107857, 1, 1, 1, 1, 1,
-0.4525734, 0.4587554, -1.567845, 1, 1, 1, 1, 1,
-0.447648, 1.755106, 0.1444055, 1, 1, 1, 1, 1,
-0.447104, 1.439236, -2.307194, 1, 1, 1, 1, 1,
-0.4469467, -1.528483, -2.816504, 1, 1, 1, 1, 1,
-0.4427345, -1.894241, -1.041299, 1, 1, 1, 1, 1,
-0.4386135, 0.08123056, -2.613096, 1, 1, 1, 1, 1,
-0.4352377, 0.2784044, 0.4231984, 0, 0, 1, 1, 1,
-0.434812, 0.2863271, -0.4005564, 1, 0, 0, 1, 1,
-0.4342256, 1.622446, 0.943651, 1, 0, 0, 1, 1,
-0.4249515, -0.197294, -4.173145, 1, 0, 0, 1, 1,
-0.4227787, -1.886187, -2.394553, 1, 0, 0, 1, 1,
-0.420059, -0.5432895, -2.459654, 1, 0, 0, 1, 1,
-0.4187406, 0.04242712, -2.998975, 0, 0, 0, 1, 1,
-0.4111713, 1.239389, 1.901461, 0, 0, 0, 1, 1,
-0.4099043, 0.3211148, -1.504769, 0, 0, 0, 1, 1,
-0.4098233, -0.3759908, -2.994155, 0, 0, 0, 1, 1,
-0.407333, 1.656388, 0.1622929, 0, 0, 0, 1, 1,
-0.4063236, -0.6845472, -2.852903, 0, 0, 0, 1, 1,
-0.4052215, -1.421858, -3.29074, 0, 0, 0, 1, 1,
-0.3969552, 0.3068859, -0.5145071, 1, 1, 1, 1, 1,
-0.3962188, -1.471768, -3.114508, 1, 1, 1, 1, 1,
-0.3924531, 0.5600094, 1.541506, 1, 1, 1, 1, 1,
-0.3898754, -0.4789499, -2.51056, 1, 1, 1, 1, 1,
-0.3897302, -0.4380054, -1.463362, 1, 1, 1, 1, 1,
-0.3880202, 1.84944, 0.7506222, 1, 1, 1, 1, 1,
-0.3874507, -1.462856, -2.94885, 1, 1, 1, 1, 1,
-0.3872199, -0.7750061, -2.318234, 1, 1, 1, 1, 1,
-0.3867609, 0.1732037, -1.902539, 1, 1, 1, 1, 1,
-0.3855764, -0.09810703, -2.310945, 1, 1, 1, 1, 1,
-0.3832731, -0.5608004, -3.088802, 1, 1, 1, 1, 1,
-0.3819467, -1.234059, -3.191853, 1, 1, 1, 1, 1,
-0.3818942, -0.08583709, -3.51663, 1, 1, 1, 1, 1,
-0.3814692, -0.3507892, -1.154807, 1, 1, 1, 1, 1,
-0.3760266, 0.08539854, -2.518859, 1, 1, 1, 1, 1,
-0.3727551, -0.4142151, -2.923289, 0, 0, 1, 1, 1,
-0.3724824, 1.422198, -0.1216439, 1, 0, 0, 1, 1,
-0.3701321, 0.6576724, -2.403367, 1, 0, 0, 1, 1,
-0.366477, -0.383161, -1.497176, 1, 0, 0, 1, 1,
-0.3663092, 1.30131, -1.194531, 1, 0, 0, 1, 1,
-0.3630683, -1.010143, -0.9012918, 1, 0, 0, 1, 1,
-0.3620023, 1.139447, 1.301466, 0, 0, 0, 1, 1,
-0.3582425, -0.2191817, -2.507716, 0, 0, 0, 1, 1,
-0.3570759, 0.4650384, -2.030924, 0, 0, 0, 1, 1,
-0.3498866, -0.9350115, -2.867649, 0, 0, 0, 1, 1,
-0.3483792, -0.7805821, -3.079601, 0, 0, 0, 1, 1,
-0.3457943, -0.2834529, -1.831138, 0, 0, 0, 1, 1,
-0.3448688, -1.598706, -3.598741, 0, 0, 0, 1, 1,
-0.3436687, 1.561512, 0.5399064, 1, 1, 1, 1, 1,
-0.3387177, 0.1068985, -1.857618, 1, 1, 1, 1, 1,
-0.3350206, 0.4090337, -0.9494022, 1, 1, 1, 1, 1,
-0.3337493, 0.1152326, 0.15283, 1, 1, 1, 1, 1,
-0.3325484, 0.4373829, -0.1868138, 1, 1, 1, 1, 1,
-0.3284481, 0.4537004, -0.4405749, 1, 1, 1, 1, 1,
-0.3248706, 0.2793451, -1.231959, 1, 1, 1, 1, 1,
-0.3150147, -0.5063105, -2.795966, 1, 1, 1, 1, 1,
-0.3092765, -0.2432264, -2.462789, 1, 1, 1, 1, 1,
-0.3065583, -1.052701, -3.022985, 1, 1, 1, 1, 1,
-0.3015534, -0.1909102, -1.799863, 1, 1, 1, 1, 1,
-0.3004018, 1.823229, -0.08532669, 1, 1, 1, 1, 1,
-0.2843508, 0.9280321, 0.7991427, 1, 1, 1, 1, 1,
-0.2843194, -0.6718189, -2.82987, 1, 1, 1, 1, 1,
-0.2837142, -1.464652, -0.8113729, 1, 1, 1, 1, 1,
-0.2825602, 0.1039407, -2.249815, 0, 0, 1, 1, 1,
-0.2786528, 0.7609579, -0.04420345, 1, 0, 0, 1, 1,
-0.2778499, -0.8436324, -4.330427, 1, 0, 0, 1, 1,
-0.2620512, -1.52879, -2.383555, 1, 0, 0, 1, 1,
-0.2544845, 0.460318, -0.01092314, 1, 0, 0, 1, 1,
-0.2528182, 2.102239, 1.75354, 1, 0, 0, 1, 1,
-0.2528071, 0.2435116, -0.3932561, 0, 0, 0, 1, 1,
-0.252651, -0.3348765, -2.786617, 0, 0, 0, 1, 1,
-0.2507708, -0.4620778, -2.798442, 0, 0, 0, 1, 1,
-0.2495393, 0.3046949, -0.4673268, 0, 0, 0, 1, 1,
-0.2491927, -1.326818, -4.088723, 0, 0, 0, 1, 1,
-0.2474586, -1.810411, -2.388976, 0, 0, 0, 1, 1,
-0.2343731, 0.5492362, 1.418201, 0, 0, 0, 1, 1,
-0.2333556, 0.3750637, 0.04148684, 1, 1, 1, 1, 1,
-0.2207248, 0.6898561, 0.5087113, 1, 1, 1, 1, 1,
-0.2199632, -1.458409, -4.260161, 1, 1, 1, 1, 1,
-0.218955, -0.2461071, -2.185152, 1, 1, 1, 1, 1,
-0.2178987, 0.5061498, -0.2238745, 1, 1, 1, 1, 1,
-0.2140304, -0.01549859, -2.268842, 1, 1, 1, 1, 1,
-0.2116859, -0.3396164, -1.95815, 1, 1, 1, 1, 1,
-0.2112896, -1.735055, -3.062059, 1, 1, 1, 1, 1,
-0.2083282, -0.8881502, -2.690467, 1, 1, 1, 1, 1,
-0.207601, -1.270355, -2.719301, 1, 1, 1, 1, 1,
-0.2045099, 0.4856097, -1.86746, 1, 1, 1, 1, 1,
-0.2036232, -0.4220963, -2.76293, 1, 1, 1, 1, 1,
-0.1914104, 1.147495, 0.1302682, 1, 1, 1, 1, 1,
-0.1899139, -0.9288146, -2.156621, 1, 1, 1, 1, 1,
-0.1892707, 0.5275493, 0.04352064, 1, 1, 1, 1, 1,
-0.188313, 0.7661422, 1.03106, 0, 0, 1, 1, 1,
-0.1878196, -0.1040045, -1.505343, 1, 0, 0, 1, 1,
-0.1876386, -0.2190809, -2.664649, 1, 0, 0, 1, 1,
-0.1874527, 0.5059815, -0.7110524, 1, 0, 0, 1, 1,
-0.1826362, -0.1865489, -1.740264, 1, 0, 0, 1, 1,
-0.1813991, 0.7785249, 1.721463, 1, 0, 0, 1, 1,
-0.1733077, 0.1419867, -1.748551, 0, 0, 0, 1, 1,
-0.1720989, -0.3720674, -2.68714, 0, 0, 0, 1, 1,
-0.165427, -0.2463243, -2.959827, 0, 0, 0, 1, 1,
-0.1652945, 0.452552, 0.3068864, 0, 0, 0, 1, 1,
-0.1652891, 0.01855251, -0.3939935, 0, 0, 0, 1, 1,
-0.1652218, -0.7315802, -3.462755, 0, 0, 0, 1, 1,
-0.1650992, -1.157975, -2.928138, 0, 0, 0, 1, 1,
-0.165038, -0.5225488, -0.7993301, 1, 1, 1, 1, 1,
-0.1614107, -1.612372, -2.107532, 1, 1, 1, 1, 1,
-0.1592102, 1.374876, -0.02782094, 1, 1, 1, 1, 1,
-0.1508991, -0.6997384, -2.951952, 1, 1, 1, 1, 1,
-0.1424451, 0.01060176, 1.247415, 1, 1, 1, 1, 1,
-0.1361308, 0.2132477, 1.652165, 1, 1, 1, 1, 1,
-0.1254394, 0.6656214, -2.327376, 1, 1, 1, 1, 1,
-0.1246143, 0.2771796, -0.4915076, 1, 1, 1, 1, 1,
-0.1161625, 0.9771852, 0.2798431, 1, 1, 1, 1, 1,
-0.1128833, 1.685064, -0.4410575, 1, 1, 1, 1, 1,
-0.1103476, 0.4480339, -0.1877539, 1, 1, 1, 1, 1,
-0.1099594, -0.5432045, -3.066311, 1, 1, 1, 1, 1,
-0.1092233, -0.4222313, -2.963902, 1, 1, 1, 1, 1,
-0.1063743, -0.2154459, -1.02979, 1, 1, 1, 1, 1,
-0.1047472, 0.7734798, 0.2127208, 1, 1, 1, 1, 1,
-0.1026907, -0.1608036, -1.775693, 0, 0, 1, 1, 1,
-0.0980309, 0.8040469, -0.8595865, 1, 0, 0, 1, 1,
-0.09642448, 0.9978017, -1.55595, 1, 0, 0, 1, 1,
-0.09241576, 0.2018096, -0.0754279, 1, 0, 0, 1, 1,
-0.08828498, 0.6885298, -1.213451, 1, 0, 0, 1, 1,
-0.08062652, 0.9246714, 0.2106057, 1, 0, 0, 1, 1,
-0.07986712, 0.1361243, -0.3198589, 0, 0, 0, 1, 1,
-0.0786846, -1.379374, -2.395975, 0, 0, 0, 1, 1,
-0.07531919, -1.522436, -3.208597, 0, 0, 0, 1, 1,
-0.07311211, -0.4687931, -1.835561, 0, 0, 0, 1, 1,
-0.06478511, -1.624479, -5.262341, 0, 0, 0, 1, 1,
-0.06463752, -0.9666225, -1.594702, 0, 0, 0, 1, 1,
-0.06423749, -0.2728568, -1.543957, 0, 0, 0, 1, 1,
-0.06216227, 1.550571, 0.2583704, 1, 1, 1, 1, 1,
-0.06124558, -0.8445619, -2.22343, 1, 1, 1, 1, 1,
-0.05998712, 0.5337174, -0.3993009, 1, 1, 1, 1, 1,
-0.05746748, 1.329617, 0.4650668, 1, 1, 1, 1, 1,
-0.05617692, -2.510149, -1.599594, 1, 1, 1, 1, 1,
-0.05482976, -0.1488452, -2.944448, 1, 1, 1, 1, 1,
-0.05174541, -0.5836598, -1.473614, 1, 1, 1, 1, 1,
-0.0489006, -0.5291013, -2.091336, 1, 1, 1, 1, 1,
-0.04436725, 1.223408, -0.8039091, 1, 1, 1, 1, 1,
-0.04365805, 0.7198367, 0.4823954, 1, 1, 1, 1, 1,
-0.04113419, 0.01892565, -1.806566, 1, 1, 1, 1, 1,
-0.03513696, 0.8339928, 1.324847, 1, 1, 1, 1, 1,
-0.03126055, -0.5496606, -3.91308, 1, 1, 1, 1, 1,
-0.02897286, -0.6309315, -2.508916, 1, 1, 1, 1, 1,
-0.02824745, -0.1596834, -4.00129, 1, 1, 1, 1, 1,
-0.02719233, 0.7542956, 2.196914, 0, 0, 1, 1, 1,
-0.02711398, 0.2864293, -1.195736, 1, 0, 0, 1, 1,
-0.02671297, 1.557209, -0.1631857, 1, 0, 0, 1, 1,
-0.02627999, 0.2915898, 0.1098491, 1, 0, 0, 1, 1,
-0.022636, -0.4550435, -2.330657, 1, 0, 0, 1, 1,
-0.02244953, -0.922692, -4.294551, 1, 0, 0, 1, 1,
-0.02175224, 0.2664384, 0.7804097, 0, 0, 0, 1, 1,
-0.01724803, -0.3530399, -2.883607, 0, 0, 0, 1, 1,
-0.01268836, 3.154433, 2.303026, 0, 0, 0, 1, 1,
-0.01027394, 0.02802274, -1.089503, 0, 0, 0, 1, 1,
-0.001789048, 2.355186, -1.035278, 0, 0, 0, 1, 1,
0.002397871, -1.294453, 3.607713, 0, 0, 0, 1, 1,
0.003102879, -0.1943336, 0.7144577, 0, 0, 0, 1, 1,
0.004626352, -0.9070822, 4.476553, 1, 1, 1, 1, 1,
0.006196787, -0.2799966, 3.687902, 1, 1, 1, 1, 1,
0.006843449, -0.8103851, 3.599349, 1, 1, 1, 1, 1,
0.008054777, 0.984731, 2.416667, 1, 1, 1, 1, 1,
0.008240605, 0.9268054, 3.500265, 1, 1, 1, 1, 1,
0.009322301, -0.6544155, 1.977223, 1, 1, 1, 1, 1,
0.02184363, -0.949131, 2.413985, 1, 1, 1, 1, 1,
0.0230854, 1.86539, -0.7948206, 1, 1, 1, 1, 1,
0.02590823, 0.4063823, 1.527429, 1, 1, 1, 1, 1,
0.02608017, -0.6644512, 4.244154, 1, 1, 1, 1, 1,
0.02884959, 0.3893054, 0.9512679, 1, 1, 1, 1, 1,
0.02906095, 0.6069719, 0.8507326, 1, 1, 1, 1, 1,
0.0310724, 0.1071195, 0.553524, 1, 1, 1, 1, 1,
0.03111343, -0.3357815, 3.545712, 1, 1, 1, 1, 1,
0.03258197, -0.4049885, 3.060753, 1, 1, 1, 1, 1,
0.03530388, 1.062848, -0.4377952, 0, 0, 1, 1, 1,
0.03560448, -0.7208182, 3.162252, 1, 0, 0, 1, 1,
0.03752076, -1.840708, 2.537996, 1, 0, 0, 1, 1,
0.04080758, 0.1648657, -0.8942106, 1, 0, 0, 1, 1,
0.04116566, 0.04512887, -0.1298284, 1, 0, 0, 1, 1,
0.04201104, 0.6601937, 1.072505, 1, 0, 0, 1, 1,
0.04552019, 0.7894912, -0.142243, 0, 0, 0, 1, 1,
0.04854166, 0.1710087, 0.6476406, 0, 0, 0, 1, 1,
0.05962271, -0.2762064, 3.118742, 0, 0, 0, 1, 1,
0.06373782, 0.07077426, 1.355953, 0, 0, 0, 1, 1,
0.06960081, -0.7533283, 3.21505, 0, 0, 0, 1, 1,
0.07012171, -0.6323612, 5.989606, 0, 0, 0, 1, 1,
0.07470151, -1.060339, 2.736273, 0, 0, 0, 1, 1,
0.07575693, -1.484762, 3.396928, 1, 1, 1, 1, 1,
0.07898044, 0.8075086, 0.2092927, 1, 1, 1, 1, 1,
0.08237071, 0.05817569, 1.291065, 1, 1, 1, 1, 1,
0.08509061, -1.088314, 2.19747, 1, 1, 1, 1, 1,
0.08567344, 1.114544, 0.4188532, 1, 1, 1, 1, 1,
0.0862729, 0.5113475, 0.6358899, 1, 1, 1, 1, 1,
0.08687419, 0.1187807, 2.441461, 1, 1, 1, 1, 1,
0.09178878, 1.373835, -1.396405, 1, 1, 1, 1, 1,
0.0967912, 1.307654, -0.3682716, 1, 1, 1, 1, 1,
0.1010806, -0.1887437, 2.497936, 1, 1, 1, 1, 1,
0.1058877, -0.8662944, 2.113607, 1, 1, 1, 1, 1,
0.1071545, 1.365098, 0.3532252, 1, 1, 1, 1, 1,
0.1072891, -0.1175434, 2.223147, 1, 1, 1, 1, 1,
0.1099562, -1.668045, 2.070935, 1, 1, 1, 1, 1,
0.1108342, -0.9546086, 2.468502, 1, 1, 1, 1, 1,
0.1137207, 2.596589, 0.1506984, 0, 0, 1, 1, 1,
0.1181892, -0.1548174, 1.932934, 1, 0, 0, 1, 1,
0.1212856, 0.4499447, -0.02349134, 1, 0, 0, 1, 1,
0.1250903, 3.016804, 0.2966998, 1, 0, 0, 1, 1,
0.1276107, 0.2114072, 0.1697599, 1, 0, 0, 1, 1,
0.1291315, -0.5089946, 4.38621, 1, 0, 0, 1, 1,
0.1407427, 0.9530912, -0.02779465, 0, 0, 0, 1, 1,
0.1433999, 1.222425, -0.9901977, 0, 0, 0, 1, 1,
0.1459504, -0.6011602, 3.749649, 0, 0, 0, 1, 1,
0.1466054, 0.7317133, 1.380197, 0, 0, 0, 1, 1,
0.1481627, -0.719382, 3.799824, 0, 0, 0, 1, 1,
0.149142, -0.6160962, 4.21317, 0, 0, 0, 1, 1,
0.1497589, 1.007322, 0.5066595, 0, 0, 0, 1, 1,
0.1536852, -0.924342, 1.953399, 1, 1, 1, 1, 1,
0.1552272, 2.39886, -0.5038851, 1, 1, 1, 1, 1,
0.1554242, -0.9441871, 2.113331, 1, 1, 1, 1, 1,
0.1554677, -0.1089817, 0.8067163, 1, 1, 1, 1, 1,
0.1562371, -0.0641775, 2.468179, 1, 1, 1, 1, 1,
0.1573061, -1.820807, 4.054357, 1, 1, 1, 1, 1,
0.1650047, 1.40219, -0.1018151, 1, 1, 1, 1, 1,
0.165013, -1.434462, 1.970227, 1, 1, 1, 1, 1,
0.167706, -0.1304331, 2.547762, 1, 1, 1, 1, 1,
0.171617, -0.1239676, 1.588563, 1, 1, 1, 1, 1,
0.1749307, 1.162634, 1.13149, 1, 1, 1, 1, 1,
0.1761835, -1.749704, 2.912151, 1, 1, 1, 1, 1,
0.1767731, 1.21326, 0.940325, 1, 1, 1, 1, 1,
0.1773431, 2.445391, -0.5971258, 1, 1, 1, 1, 1,
0.1814044, 0.3589082, 0.5038381, 1, 1, 1, 1, 1,
0.1842024, -1.058547, 3.939462, 0, 0, 1, 1, 1,
0.185415, 1.251971, 1.439472, 1, 0, 0, 1, 1,
0.1880591, 1.039391, -0.1722495, 1, 0, 0, 1, 1,
0.1894365, -0.9416356, 2.312301, 1, 0, 0, 1, 1,
0.1992919, -1.072259, 1.571389, 1, 0, 0, 1, 1,
0.2031803, 0.1754662, 0.05727342, 1, 0, 0, 1, 1,
0.20358, -1.153837, 3.475385, 0, 0, 0, 1, 1,
0.2058581, 0.6978815, 0.1643818, 0, 0, 0, 1, 1,
0.206195, -0.6319419, 3.179591, 0, 0, 0, 1, 1,
0.2065656, -0.3193841, 1.984728, 0, 0, 0, 1, 1,
0.2194862, 0.140027, 0.1182254, 0, 0, 0, 1, 1,
0.2204756, 0.1961984, 1.746686, 0, 0, 0, 1, 1,
0.2207072, -0.3012236, 3.07989, 0, 0, 0, 1, 1,
0.221472, 1.004837, 0.8887499, 1, 1, 1, 1, 1,
0.2223997, 0.4367371, 0.9438319, 1, 1, 1, 1, 1,
0.2227313, 0.2291786, 0.240929, 1, 1, 1, 1, 1,
0.22528, -0.638125, 3.765388, 1, 1, 1, 1, 1,
0.2255668, -0.3227394, 2.36096, 1, 1, 1, 1, 1,
0.238987, 0.6148134, 1.663349, 1, 1, 1, 1, 1,
0.2400599, -0.5001708, 3.281489, 1, 1, 1, 1, 1,
0.2414445, 0.5656976, 2.956374, 1, 1, 1, 1, 1,
0.2416038, 0.2722429, -0.05454394, 1, 1, 1, 1, 1,
0.2429399, 0.431044, 1.551798, 1, 1, 1, 1, 1,
0.2468883, 0.01639568, 0.3613692, 1, 1, 1, 1, 1,
0.2483154, 0.2488167, 2.495881, 1, 1, 1, 1, 1,
0.2510198, -0.8694186, 3.537021, 1, 1, 1, 1, 1,
0.2550175, -0.3736818, 2.359356, 1, 1, 1, 1, 1,
0.2571978, 1.238478, 0.6423997, 1, 1, 1, 1, 1,
0.2572043, 2.1262, 0.9616532, 0, 0, 1, 1, 1,
0.2584204, 0.8373485, 0.1606577, 1, 0, 0, 1, 1,
0.2601271, 0.2120923, 0.5420453, 1, 0, 0, 1, 1,
0.2606326, -0.3735772, 2.738259, 1, 0, 0, 1, 1,
0.2612285, -2.215103, 2.251559, 1, 0, 0, 1, 1,
0.2619713, 0.6128688, 0.4188555, 1, 0, 0, 1, 1,
0.2620063, 0.3413026, -0.4912478, 0, 0, 0, 1, 1,
0.2680348, 1.445435, 0.340282, 0, 0, 0, 1, 1,
0.2698025, 0.102272, 0.4228692, 0, 0, 0, 1, 1,
0.2702301, -0.3917331, 2.270914, 0, 0, 0, 1, 1,
0.2713051, 0.8998765, 0.1280065, 0, 0, 0, 1, 1,
0.2715576, -0.4833053, 2.03382, 0, 0, 0, 1, 1,
0.2715768, 1.045501, -0.3373762, 0, 0, 0, 1, 1,
0.272065, -0.06419034, 2.866471, 1, 1, 1, 1, 1,
0.2743524, -0.132315, 2.336571, 1, 1, 1, 1, 1,
0.2775307, 1.547042, 2.325039, 1, 1, 1, 1, 1,
0.2783324, -0.5230335, 2.493815, 1, 1, 1, 1, 1,
0.2795754, 1.421861, -0.1801915, 1, 1, 1, 1, 1,
0.2830597, 0.2780536, -1.404122, 1, 1, 1, 1, 1,
0.2842113, 0.933256, 0.8063501, 1, 1, 1, 1, 1,
0.2913781, 0.1477225, 0.525816, 1, 1, 1, 1, 1,
0.2954495, -0.1373056, 1.962874, 1, 1, 1, 1, 1,
0.2966661, 0.6702676, 0.9938857, 1, 1, 1, 1, 1,
0.303878, 0.5756298, 1.850603, 1, 1, 1, 1, 1,
0.3046739, 0.1104819, 1.795427, 1, 1, 1, 1, 1,
0.3119206, -0.4870955, 3.034223, 1, 1, 1, 1, 1,
0.3142303, -0.8181099, 2.659098, 1, 1, 1, 1, 1,
0.3156486, 0.1059038, 2.204628, 1, 1, 1, 1, 1,
0.3158609, -0.02453468, 1.086309, 0, 0, 1, 1, 1,
0.3170016, -0.2024802, 1.969155, 1, 0, 0, 1, 1,
0.317073, 1.300166, 0.2616558, 1, 0, 0, 1, 1,
0.3178815, 1.342911, 1.843217, 1, 0, 0, 1, 1,
0.3192137, -0.4704535, 2.006678, 1, 0, 0, 1, 1,
0.3200538, -0.1437857, 3.186836, 1, 0, 0, 1, 1,
0.3203997, -0.3571783, 1.547635, 0, 0, 0, 1, 1,
0.3241108, -1.495017, 3.825681, 0, 0, 0, 1, 1,
0.3250262, 0.514473, 1.868109, 0, 0, 0, 1, 1,
0.3263046, -0.3768876, 1.505278, 0, 0, 0, 1, 1,
0.33176, 0.5762677, 1.663132, 0, 0, 0, 1, 1,
0.3332728, -0.8564644, 4.216332, 0, 0, 0, 1, 1,
0.333283, 1.630073, 0.6608727, 0, 0, 0, 1, 1,
0.3371004, -0.09986763, 1.370408, 1, 1, 1, 1, 1,
0.3420416, 0.3038071, 0.5830688, 1, 1, 1, 1, 1,
0.3447299, -0.362, 3.323719, 1, 1, 1, 1, 1,
0.3448555, 0.9879713, -0.2426033, 1, 1, 1, 1, 1,
0.3462263, -1.996331, 2.343683, 1, 1, 1, 1, 1,
0.3472337, -0.732168, 1.626672, 1, 1, 1, 1, 1,
0.3512397, -0.7902867, 1.768643, 1, 1, 1, 1, 1,
0.3553561, 0.3449158, 0.2274996, 1, 1, 1, 1, 1,
0.3558308, 1.913739, 1.07905, 1, 1, 1, 1, 1,
0.3622079, 0.01470135, 2.700879, 1, 1, 1, 1, 1,
0.3640848, -0.2586979, 1.119172, 1, 1, 1, 1, 1,
0.3670896, 0.5320399, 0.2814209, 1, 1, 1, 1, 1,
0.3686053, 0.3313788, 1.624707, 1, 1, 1, 1, 1,
0.3713821, 1.21726, -0.6140458, 1, 1, 1, 1, 1,
0.373887, 1.629936, 0.6461123, 1, 1, 1, 1, 1,
0.3747091, 1.203587, -0.4934174, 0, 0, 1, 1, 1,
0.3784443, -1.416002, 5.277293, 1, 0, 0, 1, 1,
0.3793623, -0.2874354, 0.2612287, 1, 0, 0, 1, 1,
0.3813492, -0.6571075, 3.516259, 1, 0, 0, 1, 1,
0.385858, 0.02688957, 1.161724, 1, 0, 0, 1, 1,
0.3887877, 0.1964387, -0.5861871, 1, 0, 0, 1, 1,
0.3944868, 0.4695535, -0.1170533, 0, 0, 0, 1, 1,
0.4013993, 0.2354947, 0.7197759, 0, 0, 0, 1, 1,
0.4015943, -0.6972905, 1.921751, 0, 0, 0, 1, 1,
0.4036904, 1.00727, 1.373462, 0, 0, 0, 1, 1,
0.4065638, 1.69213, -0.2447274, 0, 0, 0, 1, 1,
0.4068406, -1.710939, 3.91141, 0, 0, 0, 1, 1,
0.4102831, -0.4438759, 4.720924, 0, 0, 0, 1, 1,
0.4105887, -0.6615456, 3.059706, 1, 1, 1, 1, 1,
0.4184605, -0.7880647, 1.033857, 1, 1, 1, 1, 1,
0.4246817, -1.448579, 2.47115, 1, 1, 1, 1, 1,
0.4313328, -1.652993, 4.3361, 1, 1, 1, 1, 1,
0.431737, -1.139652, 3.147828, 1, 1, 1, 1, 1,
0.4343587, 0.8817005, 0.3900619, 1, 1, 1, 1, 1,
0.4375117, 1.609545, 0.1004364, 1, 1, 1, 1, 1,
0.4438095, -1.058234, 1.869057, 1, 1, 1, 1, 1,
0.4501421, -0.5492952, 3.317811, 1, 1, 1, 1, 1,
0.453833, 0.2126883, 1.543316, 1, 1, 1, 1, 1,
0.4564823, 0.318944, 1.214824, 1, 1, 1, 1, 1,
0.457391, -0.3469689, 3.093305, 1, 1, 1, 1, 1,
0.462724, -0.5632506, 2.566001, 1, 1, 1, 1, 1,
0.4659315, -1.082266, 3.314404, 1, 1, 1, 1, 1,
0.4659826, 2.222056, 0.7320397, 1, 1, 1, 1, 1,
0.4722264, 0.5343664, 1.567114, 0, 0, 1, 1, 1,
0.4753972, 0.06756583, 1.415107, 1, 0, 0, 1, 1,
0.4763706, 0.2343441, 0.7912441, 1, 0, 0, 1, 1,
0.4768439, -0.04744236, 2.607003, 1, 0, 0, 1, 1,
0.4788544, -0.1080406, 1.276891, 1, 0, 0, 1, 1,
0.480507, 2.41988, 0.7921777, 1, 0, 0, 1, 1,
0.4810229, -0.1806174, 3.529296, 0, 0, 0, 1, 1,
0.481461, 0.3215873, 1.485076, 0, 0, 0, 1, 1,
0.4845304, 0.9357191, -0.4834155, 0, 0, 0, 1, 1,
0.484533, 1.367086, 0.06599292, 0, 0, 0, 1, 1,
0.4846358, -1.122685, 1.850921, 0, 0, 0, 1, 1,
0.4862838, 3.023804, 0.6471268, 0, 0, 0, 1, 1,
0.4868818, -1.081505, 2.444924, 0, 0, 0, 1, 1,
0.493413, 0.03221786, 0.698247, 1, 1, 1, 1, 1,
0.4991102, 0.6355914, -0.3392655, 1, 1, 1, 1, 1,
0.5093173, -0.5381112, 2.003275, 1, 1, 1, 1, 1,
0.5116493, 0.7711253, 0.8054981, 1, 1, 1, 1, 1,
0.5119348, -0.3893391, 1.924419, 1, 1, 1, 1, 1,
0.5124227, -0.4143191, 1.715665, 1, 1, 1, 1, 1,
0.5192682, 0.6292136, 0.5506691, 1, 1, 1, 1, 1,
0.519884, 0.1184863, 2.101559, 1, 1, 1, 1, 1,
0.5283307, 1.221018, -0.2115912, 1, 1, 1, 1, 1,
0.5291892, -1.302363, 3.01734, 1, 1, 1, 1, 1,
0.5292258, 0.09582234, 1.518583, 1, 1, 1, 1, 1,
0.5372591, -0.3005691, 3.69065, 1, 1, 1, 1, 1,
0.5457646, -0.02839459, 1.479578, 1, 1, 1, 1, 1,
0.5484964, -0.7856404, 2.713706, 1, 1, 1, 1, 1,
0.5506616, 0.1269225, 0.8911485, 1, 1, 1, 1, 1,
0.5521366, 1.176277, 0.2158363, 0, 0, 1, 1, 1,
0.5561281, 0.9521253, 1.306013, 1, 0, 0, 1, 1,
0.5563934, -0.782553, 2.135957, 1, 0, 0, 1, 1,
0.5568034, 1.094067, 0.08013916, 1, 0, 0, 1, 1,
0.5572852, -1.070903, 1.908856, 1, 0, 0, 1, 1,
0.5581555, 0.04204446, 1.783733, 1, 0, 0, 1, 1,
0.5588096, 0.1055105, 2.292814, 0, 0, 0, 1, 1,
0.5601348, -0.2936354, 1.56184, 0, 0, 0, 1, 1,
0.5609739, 0.8184641, 0.4025501, 0, 0, 0, 1, 1,
0.5611867, -0.5036443, 3.817293, 0, 0, 0, 1, 1,
0.565329, 1.451541, 1.016636, 0, 0, 0, 1, 1,
0.5662527, -0.587139, 2.245866, 0, 0, 0, 1, 1,
0.5710856, 0.663585, -0.1558728, 0, 0, 0, 1, 1,
0.5782079, -1.059675, 3.070336, 1, 1, 1, 1, 1,
0.5787295, 1.720821, 0.965905, 1, 1, 1, 1, 1,
0.5803439, -0.05811178, 1.047929, 1, 1, 1, 1, 1,
0.5931528, 0.2094559, 1.470791, 1, 1, 1, 1, 1,
0.5934875, -0.04831982, 1.133769, 1, 1, 1, 1, 1,
0.5993862, 0.09309923, 2.114211, 1, 1, 1, 1, 1,
0.6028647, 0.2205069, -0.5439752, 1, 1, 1, 1, 1,
0.6032705, -0.4166548, 2.138691, 1, 1, 1, 1, 1,
0.6061832, -0.2838308, 2.315374, 1, 1, 1, 1, 1,
0.6109784, -0.7431768, 1.218692, 1, 1, 1, 1, 1,
0.6112549, 0.5424524, -0.135311, 1, 1, 1, 1, 1,
0.6120675, -0.8288434, 1.487668, 1, 1, 1, 1, 1,
0.6127672, -0.05766678, 1.597908, 1, 1, 1, 1, 1,
0.6151946, 1.010481, -1.832676, 1, 1, 1, 1, 1,
0.6154343, -0.7549146, 4.322408, 1, 1, 1, 1, 1,
0.6179698, -0.7714667, 3.111827, 0, 0, 1, 1, 1,
0.6189137, -0.1111195, 1.927596, 1, 0, 0, 1, 1,
0.6240697, 0.5976571, 1.043183, 1, 0, 0, 1, 1,
0.6243204, 0.672428, 1.85248, 1, 0, 0, 1, 1,
0.6253455, 1.275258, -0.6177354, 1, 0, 0, 1, 1,
0.6278475, -0.09138889, 1.093305, 1, 0, 0, 1, 1,
0.6330512, -0.886808, 2.483583, 0, 0, 0, 1, 1,
0.6335713, -1.160577, 3.57351, 0, 0, 0, 1, 1,
0.6358476, 2.791728, 0.3947426, 0, 0, 0, 1, 1,
0.6375086, -0.1537534, 3.485237, 0, 0, 0, 1, 1,
0.6421269, -1.051171, 3.072065, 0, 0, 0, 1, 1,
0.6478738, -0.8640544, 1.373179, 0, 0, 0, 1, 1,
0.6485896, -1.099831, 2.859381, 0, 0, 0, 1, 1,
0.6487206, 0.7710193, -1.45234, 1, 1, 1, 1, 1,
0.6513039, 0.3728994, 1.632754, 1, 1, 1, 1, 1,
0.6528848, 0.02110293, 3.251912, 1, 1, 1, 1, 1,
0.6539572, 0.9680755, -0.266955, 1, 1, 1, 1, 1,
0.6549941, 0.4731893, 0.2632577, 1, 1, 1, 1, 1,
0.6579544, 0.1486423, 1.06846, 1, 1, 1, 1, 1,
0.6601858, 1.873757, -1.01069, 1, 1, 1, 1, 1,
0.6661783, 1.181009, 1.004146, 1, 1, 1, 1, 1,
0.6739552, -0.506062, 2.151404, 1, 1, 1, 1, 1,
0.6743252, -2.037726, 1.811532, 1, 1, 1, 1, 1,
0.6813975, -0.09546855, 0.4618279, 1, 1, 1, 1, 1,
0.681641, -0.4329895, 2.471789, 1, 1, 1, 1, 1,
0.6834662, -0.475757, 0.8925159, 1, 1, 1, 1, 1,
0.6839693, 0.2247979, -0.04692537, 1, 1, 1, 1, 1,
0.684382, 1.421431, -1.22555, 1, 1, 1, 1, 1,
0.6860343, -1.41778, 1.569879, 0, 0, 1, 1, 1,
0.6900541, -2.623534, 3.508349, 1, 0, 0, 1, 1,
0.6904126, 0.1032723, 1.196299, 1, 0, 0, 1, 1,
0.7092463, -0.5367067, 2.096823, 1, 0, 0, 1, 1,
0.711044, 0.5258051, 1.229696, 1, 0, 0, 1, 1,
0.7160006, 1.272372, 0.7500234, 1, 0, 0, 1, 1,
0.7191641, -1.359072, 1.040583, 0, 0, 0, 1, 1,
0.7217174, -0.4017649, 0.3864986, 0, 0, 0, 1, 1,
0.7259624, 0.5774761, 0.7918607, 0, 0, 0, 1, 1,
0.7263273, 0.7775292, 0.6634197, 0, 0, 0, 1, 1,
0.7279583, 0.3183599, -0.8329666, 0, 0, 0, 1, 1,
0.7361575, 1.001333, 2.870464, 0, 0, 0, 1, 1,
0.7369682, 1.949906, -0.5247258, 0, 0, 0, 1, 1,
0.7379306, -0.6087217, 2.175082, 1, 1, 1, 1, 1,
0.744038, 0.1662591, 2.762785, 1, 1, 1, 1, 1,
0.744486, 0.462196, -0.1400039, 1, 1, 1, 1, 1,
0.7450471, -2.043888, 1.963088, 1, 1, 1, 1, 1,
0.7454797, -1.139788, 3.369384, 1, 1, 1, 1, 1,
0.7496726, -0.2999988, 1.92534, 1, 1, 1, 1, 1,
0.7555792, 1.118263, -0.225675, 1, 1, 1, 1, 1,
0.7580965, -1.493349, 3.141425, 1, 1, 1, 1, 1,
0.7623229, -1.996209, 2.114381, 1, 1, 1, 1, 1,
0.7640643, 0.8595987, 1.20609, 1, 1, 1, 1, 1,
0.7693776, 0.7203806, 0.03633635, 1, 1, 1, 1, 1,
0.7802225, 0.2237469, 0.4422659, 1, 1, 1, 1, 1,
0.7813817, -0.5937123, 0.8150236, 1, 1, 1, 1, 1,
0.7822461, -1.329414, 3.57688, 1, 1, 1, 1, 1,
0.7861017, -2.260031, 4.134504, 1, 1, 1, 1, 1,
0.7889141, -1.036873, 2.526687, 0, 0, 1, 1, 1,
0.7900224, -0.4232823, 0.7230974, 1, 0, 0, 1, 1,
0.7987738, 1.809703, -0.2003321, 1, 0, 0, 1, 1,
0.7997068, -0.1304103, 0.8416111, 1, 0, 0, 1, 1,
0.8060875, -0.2878193, 1.423528, 1, 0, 0, 1, 1,
0.8089285, 0.7780185, 0.5934565, 1, 0, 0, 1, 1,
0.8099896, -0.101925, 0.8172708, 0, 0, 0, 1, 1,
0.8115989, -0.5198314, 2.070518, 0, 0, 0, 1, 1,
0.818058, 1.276261, 2.34126, 0, 0, 0, 1, 1,
0.8239656, -2.028674, 3.999221, 0, 0, 0, 1, 1,
0.8270507, 0.6685522, 0.5558349, 0, 0, 0, 1, 1,
0.832678, 0.9890077, -0.484462, 0, 0, 0, 1, 1,
0.8335021, -0.5953487, 1.093863, 0, 0, 0, 1, 1,
0.837728, -1.055257, 2.011457, 1, 1, 1, 1, 1,
0.8380754, 0.2689945, 1.344965, 1, 1, 1, 1, 1,
0.8404182, -2.580798, 3.334866, 1, 1, 1, 1, 1,
0.8408369, 0.9487062, 0.3333293, 1, 1, 1, 1, 1,
0.8482544, 0.4236165, 1.34629, 1, 1, 1, 1, 1,
0.8521934, -0.4357554, 3.703894, 1, 1, 1, 1, 1,
0.8570514, 2.271323, 0.7212351, 1, 1, 1, 1, 1,
0.8634589, -0.716728, 2.069727, 1, 1, 1, 1, 1,
0.86375, -2.048915, 3.164006, 1, 1, 1, 1, 1,
0.8666375, 0.4969282, 1.571608, 1, 1, 1, 1, 1,
0.8702208, -0.4536136, 2.79732, 1, 1, 1, 1, 1,
0.871501, -0.6781667, 3.914186, 1, 1, 1, 1, 1,
0.8735872, -0.4674025, 3.593032, 1, 1, 1, 1, 1,
0.8741076, -0.2738167, 2.601844, 1, 1, 1, 1, 1,
0.8865169, 1.038269, 0.4585645, 1, 1, 1, 1, 1,
0.8883669, 2.166015, -0.5519679, 0, 0, 1, 1, 1,
0.8919495, 0.03415096, 0.2624832, 1, 0, 0, 1, 1,
0.8940777, -0.1408394, 1.999746, 1, 0, 0, 1, 1,
0.8999227, -0.1410559, 2.213803, 1, 0, 0, 1, 1,
0.9010494, 0.3217611, 1.369157, 1, 0, 0, 1, 1,
0.9018474, -0.6194701, 2.866802, 1, 0, 0, 1, 1,
0.9036089, 0.8973801, -0.05545369, 0, 0, 0, 1, 1,
0.9078843, -0.1188151, 2.674351, 0, 0, 0, 1, 1,
0.9085025, -0.0165986, 3.198758, 0, 0, 0, 1, 1,
0.916082, -0.2144749, 2.299008, 0, 0, 0, 1, 1,
0.9179707, 0.119721, 2.306091, 0, 0, 0, 1, 1,
0.9207931, -0.7248899, 2.28529, 0, 0, 0, 1, 1,
0.9212689, -2.021102, 2.595829, 0, 0, 0, 1, 1,
0.9233949, 1.028158, 1.8979, 1, 1, 1, 1, 1,
0.9278172, -1.534408, 4.946706, 1, 1, 1, 1, 1,
0.9283863, -0.18167, 1.907052, 1, 1, 1, 1, 1,
0.9432859, 0.8399382, 0.7677912, 1, 1, 1, 1, 1,
0.9435193, 0.8492022, 2.431104, 1, 1, 1, 1, 1,
0.9507255, 0.2366881, -0.108885, 1, 1, 1, 1, 1,
0.9512274, 0.2775805, 1.154356, 1, 1, 1, 1, 1,
0.9515258, 1.025666, 0.02878757, 1, 1, 1, 1, 1,
0.9522023, 0.187623, -0.4115393, 1, 1, 1, 1, 1,
0.9524438, -0.07410998, 1.197879, 1, 1, 1, 1, 1,
0.9541027, 2.052668, -0.3099421, 1, 1, 1, 1, 1,
0.9556689, -0.4892392, 2.063214, 1, 1, 1, 1, 1,
0.9559472, 0.9592515, 0.6874993, 1, 1, 1, 1, 1,
0.9620345, 0.09829605, 0.5187863, 1, 1, 1, 1, 1,
0.9637631, -2.261357, 3.270759, 1, 1, 1, 1, 1,
0.9743664, -0.1590032, 2.228949, 0, 0, 1, 1, 1,
0.9805852, -0.5780917, 1.068206, 1, 0, 0, 1, 1,
0.9809945, -0.1776173, 2.058474, 1, 0, 0, 1, 1,
0.9850045, 0.507813, 1.906612, 1, 0, 0, 1, 1,
0.9935141, 0.06923542, 1.796259, 1, 0, 0, 1, 1,
0.9976535, -0.2999177, 0.9541535, 1, 0, 0, 1, 1,
1.009753, 0.6891761, -0.5162431, 0, 0, 0, 1, 1,
1.012509, 1.582476, 0.3589509, 0, 0, 0, 1, 1,
1.016487, 0.7871946, 2.420599, 0, 0, 0, 1, 1,
1.024451, 0.4291533, 1.165426, 0, 0, 0, 1, 1,
1.032575, -0.1069095, 0.6256503, 0, 0, 0, 1, 1,
1.033894, -1.247406, 3.258622, 0, 0, 0, 1, 1,
1.036036, 0.299338, 2.475615, 0, 0, 0, 1, 1,
1.036093, 0.8261877, -0.3351177, 1, 1, 1, 1, 1,
1.037044, -0.4591671, 3.441295, 1, 1, 1, 1, 1,
1.039587, -0.2315659, 3.286295, 1, 1, 1, 1, 1,
1.041846, 0.2865318, 2.772108, 1, 1, 1, 1, 1,
1.044976, -1.056305, 1.473323, 1, 1, 1, 1, 1,
1.049552, -0.03925029, 1.483937, 1, 1, 1, 1, 1,
1.053736, -0.6323934, 0.6316392, 1, 1, 1, 1, 1,
1.057253, 0.8079286, 2.716029, 1, 1, 1, 1, 1,
1.059385, 1.458901, 1.424368, 1, 1, 1, 1, 1,
1.072471, 0.1228493, 1.072881, 1, 1, 1, 1, 1,
1.083752, 0.8421933, 1.989463, 1, 1, 1, 1, 1,
1.085253, 0.4750787, 1.914846, 1, 1, 1, 1, 1,
1.092656, -0.7237193, 2.77002, 1, 1, 1, 1, 1,
1.097012, 0.3047952, 0.2234727, 1, 1, 1, 1, 1,
1.097953, 0.2729219, 0.7820163, 1, 1, 1, 1, 1,
1.125725, 1.212462, 0.7184063, 0, 0, 1, 1, 1,
1.127815, 1.125958, 0.3008831, 1, 0, 0, 1, 1,
1.129869, -0.1501451, 2.643945, 1, 0, 0, 1, 1,
1.138365, -0.4133279, 0.2072801, 1, 0, 0, 1, 1,
1.143867, -0.2108965, 1.610796, 1, 0, 0, 1, 1,
1.15056, -0.148518, 2.66693, 1, 0, 0, 1, 1,
1.150616, 1.286884, 0.6564479, 0, 0, 0, 1, 1,
1.168264, 0.1255189, 1.798068, 0, 0, 0, 1, 1,
1.175889, 0.2868888, 2.510148, 0, 0, 0, 1, 1,
1.17963, 1.119873, 0.6982433, 0, 0, 0, 1, 1,
1.180902, -0.6673123, 1.396576, 0, 0, 0, 1, 1,
1.187737, -0.8101234, 0.8696285, 0, 0, 0, 1, 1,
1.192038, -1.536011, 3.903685, 0, 0, 0, 1, 1,
1.194335, 0.2931426, 1.513951, 1, 1, 1, 1, 1,
1.194431, -0.8656757, 1.260181, 1, 1, 1, 1, 1,
1.201155, -0.2088053, 0.2329673, 1, 1, 1, 1, 1,
1.206168, 2.369275, 0.9130511, 1, 1, 1, 1, 1,
1.220405, 0.7107086, -0.9228444, 1, 1, 1, 1, 1,
1.221694, 0.3656428, 1.219059, 1, 1, 1, 1, 1,
1.238606, -1.57795, 3.305545, 1, 1, 1, 1, 1,
1.245497, 0.8892883, -0.4499531, 1, 1, 1, 1, 1,
1.267973, -0.08861933, 2.94576, 1, 1, 1, 1, 1,
1.271318, 0.7839956, 1.405319, 1, 1, 1, 1, 1,
1.271469, -1.21019, 6.471387, 1, 1, 1, 1, 1,
1.273819, 0.2710052, 1.349202, 1, 1, 1, 1, 1,
1.275694, -2.058648, 3.366233, 1, 1, 1, 1, 1,
1.280967, 0.2927149, 1.757735, 1, 1, 1, 1, 1,
1.282382, -1.067848, 4.805353, 1, 1, 1, 1, 1,
1.283684, 0.4984277, 2.275742, 0, 0, 1, 1, 1,
1.285958, -1.037813, 2.707232, 1, 0, 0, 1, 1,
1.295859, -0.7957113, 0.3085491, 1, 0, 0, 1, 1,
1.297743, 0.2170709, 0.9833629, 1, 0, 0, 1, 1,
1.304573, 0.4217609, 0.8237261, 1, 0, 0, 1, 1,
1.305502, 0.06054459, 3.107439, 1, 0, 0, 1, 1,
1.322496, -0.6874099, 2.324989, 0, 0, 0, 1, 1,
1.329354, 0.08422863, 1.644963, 0, 0, 0, 1, 1,
1.329799, 0.7742436, -1.13072, 0, 0, 0, 1, 1,
1.335502, 0.8099066, 0.9065248, 0, 0, 0, 1, 1,
1.337562, 0.8872313, 1.014124, 0, 0, 0, 1, 1,
1.341803, -0.7757407, 1.317455, 0, 0, 0, 1, 1,
1.345768, -0.1904588, 0.5211683, 0, 0, 0, 1, 1,
1.352775, -0.07261992, 3.390087, 1, 1, 1, 1, 1,
1.35395, -0.7313555, 2.146892, 1, 1, 1, 1, 1,
1.369907, 0.5728573, 0.9759291, 1, 1, 1, 1, 1,
1.384789, -1.249858, 2.603173, 1, 1, 1, 1, 1,
1.385801, -0.0430081, 1.462081, 1, 1, 1, 1, 1,
1.399337, 0.3184969, 2.609561, 1, 1, 1, 1, 1,
1.400503, -0.118975, 3.472843, 1, 1, 1, 1, 1,
1.402155, 0.02403449, 0.115582, 1, 1, 1, 1, 1,
1.408939, -0.15969, 1.823812, 1, 1, 1, 1, 1,
1.411457, -0.3537316, 3.558422, 1, 1, 1, 1, 1,
1.42448, -1.762366, 2.958745, 1, 1, 1, 1, 1,
1.428259, 0.1997302, 0.6286044, 1, 1, 1, 1, 1,
1.428531, -1.758341, 2.314841, 1, 1, 1, 1, 1,
1.431103, 0.6381359, 2.563532, 1, 1, 1, 1, 1,
1.432274, 0.06371335, 1.805415, 1, 1, 1, 1, 1,
1.433219, -0.5502185, 1.611861, 0, 0, 1, 1, 1,
1.448915, -0.6550844, 4.299349, 1, 0, 0, 1, 1,
1.450245, 2.291997, -0.8559982, 1, 0, 0, 1, 1,
1.462291, -2.682201, 3.697109, 1, 0, 0, 1, 1,
1.472228, 1.480866, 1.071955, 1, 0, 0, 1, 1,
1.472669, -1.164593, 1.089882, 1, 0, 0, 1, 1,
1.490556, -0.5844006, 2.307757, 0, 0, 0, 1, 1,
1.490819, -0.02335079, 1.767327, 0, 0, 0, 1, 1,
1.493494, 0.4285609, 1.440936, 0, 0, 0, 1, 1,
1.494594, -2.547037, 0.9812192, 0, 0, 0, 1, 1,
1.498499, -0.337661, 0.432389, 0, 0, 0, 1, 1,
1.504879, -0.01578565, 1.223705, 0, 0, 0, 1, 1,
1.505688, 1.738414, 1.093485, 0, 0, 0, 1, 1,
1.520599, -0.6059458, 1.035411, 1, 1, 1, 1, 1,
1.520618, -0.8320308, 2.295584, 1, 1, 1, 1, 1,
1.535709, 0.7040517, 1.928505, 1, 1, 1, 1, 1,
1.555965, 0.3031892, 1.793856, 1, 1, 1, 1, 1,
1.567102, 0.2351852, 0.281178, 1, 1, 1, 1, 1,
1.607964, 0.01704916, 0.01787214, 1, 1, 1, 1, 1,
1.611595, 0.3979751, 0.9500772, 1, 1, 1, 1, 1,
1.611904, 0.0790344, 0.8716746, 1, 1, 1, 1, 1,
1.613238, -0.1108214, 3.098456, 1, 1, 1, 1, 1,
1.61329, 0.2477756, 1.335556, 1, 1, 1, 1, 1,
1.625843, 2.339722, -0.1418354, 1, 1, 1, 1, 1,
1.643933, -1.653088, 1.245594, 1, 1, 1, 1, 1,
1.649307, -1.196291, 3.479291, 1, 1, 1, 1, 1,
1.65712, -0.0954697, 1.787666, 1, 1, 1, 1, 1,
1.658715, -0.2311507, 2.146627, 1, 1, 1, 1, 1,
1.662046, 0.1851009, 1.304114, 0, 0, 1, 1, 1,
1.666278, -0.1350215, 3.224446, 1, 0, 0, 1, 1,
1.669115, -1.245931, 1.641156, 1, 0, 0, 1, 1,
1.675301, 0.7444195, 2.561656, 1, 0, 0, 1, 1,
1.678638, -0.3052146, 1.246872, 1, 0, 0, 1, 1,
1.679056, -0.2201898, 1.825142, 1, 0, 0, 1, 1,
1.691034, 0.8145148, 0.01679515, 0, 0, 0, 1, 1,
1.693749, 0.8557671, 2.401339, 0, 0, 0, 1, 1,
1.709561, -0.05076818, -0.6940448, 0, 0, 0, 1, 1,
1.728727, 0.9350474, 1.772034, 0, 0, 0, 1, 1,
1.729388, -0.08485679, 0.1901736, 0, 0, 0, 1, 1,
1.745934, 0.8863246, 0.4854976, 0, 0, 0, 1, 1,
1.757289, -0.5968967, 2.71832, 0, 0, 0, 1, 1,
1.778948, -0.7811611, 1.563689, 1, 1, 1, 1, 1,
1.782827, -0.2684554, 1.115217, 1, 1, 1, 1, 1,
1.82558, 0.4097269, 2.367267, 1, 1, 1, 1, 1,
1.840839, 0.9893173, -0.06195584, 1, 1, 1, 1, 1,
1.847851, 1.572446, 1.736978, 1, 1, 1, 1, 1,
1.867274, 0.136731, 0.2171786, 1, 1, 1, 1, 1,
1.936562, -0.286548, 3.236499, 1, 1, 1, 1, 1,
1.939342, 0.4777477, 2.108884, 1, 1, 1, 1, 1,
1.986898, -1.954105, 1.626648, 1, 1, 1, 1, 1,
1.999463, -0.4559833, 2.864346, 1, 1, 1, 1, 1,
2.003085, -1.485569, 1.235511, 1, 1, 1, 1, 1,
2.021971, 0.107331, 1.052137, 1, 1, 1, 1, 1,
2.047054, 0.3182425, 2.287645, 1, 1, 1, 1, 1,
2.074991, 0.1483696, 1.861258, 1, 1, 1, 1, 1,
2.085135, 0.8336645, 2.778918, 1, 1, 1, 1, 1,
2.094589, 1.259722, 1.006919, 0, 0, 1, 1, 1,
2.114644, 0.5914545, 0.8401145, 1, 0, 0, 1, 1,
2.13233, 0.2730677, 1.631257, 1, 0, 0, 1, 1,
2.133402, 1.471844, 2.852022, 1, 0, 0, 1, 1,
2.15372, -0.695231, 0.7249683, 1, 0, 0, 1, 1,
2.159772, -1.244898, 0.8949308, 1, 0, 0, 1, 1,
2.190919, -2.116378, 2.118221, 0, 0, 0, 1, 1,
2.279037, 0.9407507, 2.019245, 0, 0, 0, 1, 1,
2.350115, 0.2888899, -0.02942203, 0, 0, 0, 1, 1,
2.371373, -0.05489312, 1.534373, 0, 0, 0, 1, 1,
2.438446, 0.7769188, 0.09021622, 0, 0, 0, 1, 1,
2.450413, -0.6197003, 2.089354, 0, 0, 0, 1, 1,
2.471356, 0.1833317, 3.381081, 0, 0, 0, 1, 1,
2.516026, 0.2979385, 2.55684, 1, 1, 1, 1, 1,
2.607661, 1.437274, 1.140484, 1, 1, 1, 1, 1,
2.622191, -1.45679, 0.9529365, 1, 1, 1, 1, 1,
2.699054, -0.03839746, 0.932758, 1, 1, 1, 1, 1,
2.83419, -0.7007411, 1.680322, 1, 1, 1, 1, 1,
3.057615, 1.118745, 1.265209, 1, 1, 1, 1, 1,
3.639202, -0.4063289, 2.202291, 1, 1, 1, 1, 1
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
var radius = 10.01911;
var distance = 35.19172;
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
mvMatrix.translate( -0.2618608, -0.2361161, -0.5110316 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.19172);
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
