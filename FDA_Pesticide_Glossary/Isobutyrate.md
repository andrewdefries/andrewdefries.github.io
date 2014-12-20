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
-3.69055, 0.2923419, -1.384625, 1, 0, 0, 1,
-3.006635, -0.6837105, -1.388891, 1, 0.007843138, 0, 1,
-2.90244, 0.6561466, -0.06185463, 1, 0.01176471, 0, 1,
-2.631614, -0.02838151, -1.751366, 1, 0.01960784, 0, 1,
-2.6017, 0.2727961, -3.167342, 1, 0.02352941, 0, 1,
-2.585577, 1.777467, -2.385, 1, 0.03137255, 0, 1,
-2.550945, 0.3998616, 0.1307517, 1, 0.03529412, 0, 1,
-2.498869, 0.8586681, -1.243399, 1, 0.04313726, 0, 1,
-2.43871, 0.4079674, 0.07127968, 1, 0.04705882, 0, 1,
-2.406028, -1.084825, -2.103074, 1, 0.05490196, 0, 1,
-2.304838, 0.1487015, 1.208915, 1, 0.05882353, 0, 1,
-2.267608, 2.057368, -2.363948, 1, 0.06666667, 0, 1,
-2.234316, 1.494939, -1.150643, 1, 0.07058824, 0, 1,
-2.226513, -0.5370824, -2.916512, 1, 0.07843138, 0, 1,
-2.192282, -0.2792839, -1.387854, 1, 0.08235294, 0, 1,
-2.160125, -0.7162837, -2.770222, 1, 0.09019608, 0, 1,
-2.098526, 0.5544669, -2.015947, 1, 0.09411765, 0, 1,
-2.072569, 0.3715331, -0.3535452, 1, 0.1019608, 0, 1,
-2.06534, -1.179245, -1.664672, 1, 0.1098039, 0, 1,
-2.057561, 0.8401607, 0.6265919, 1, 0.1137255, 0, 1,
-2.005843, 0.01153784, -1.71667, 1, 0.1215686, 0, 1,
-1.997953, 0.5680059, -0.9984663, 1, 0.1254902, 0, 1,
-1.997909, -0.5859072, -2.104026, 1, 0.1333333, 0, 1,
-1.960598, 2.717438, -0.3181022, 1, 0.1372549, 0, 1,
-1.914581, -1.167535, -0.4382465, 1, 0.145098, 0, 1,
-1.913078, 0.5864256, -2.782815, 1, 0.1490196, 0, 1,
-1.909375, 1.652694, 0.6398566, 1, 0.1568628, 0, 1,
-1.893404, -0.6897089, -1.298964, 1, 0.1607843, 0, 1,
-1.892528, 0.629319, -1.383936, 1, 0.1686275, 0, 1,
-1.869988, 0.9695494, -3.138871, 1, 0.172549, 0, 1,
-1.864995, -1.153836, -2.805297, 1, 0.1803922, 0, 1,
-1.852337, -0.888517, -2.17943, 1, 0.1843137, 0, 1,
-1.851839, 0.5172783, -0.7105263, 1, 0.1921569, 0, 1,
-1.848116, -0.2552067, -2.502703, 1, 0.1960784, 0, 1,
-1.827782, -0.2859461, -0.8558805, 1, 0.2039216, 0, 1,
-1.792925, 0.2802901, -2.446169, 1, 0.2117647, 0, 1,
-1.773676, -0.2483282, -2.331267, 1, 0.2156863, 0, 1,
-1.758172, 0.5716349, -0.8780697, 1, 0.2235294, 0, 1,
-1.74823, 0.9933221, -1.019907, 1, 0.227451, 0, 1,
-1.727915, -0.3066991, -0.6049019, 1, 0.2352941, 0, 1,
-1.722895, -0.6073782, -1.985533, 1, 0.2392157, 0, 1,
-1.719639, -0.7765812, -0.912524, 1, 0.2470588, 0, 1,
-1.699876, -1.899369, -2.886776, 1, 0.2509804, 0, 1,
-1.689553, 3.491537, -1.839431, 1, 0.2588235, 0, 1,
-1.688752, 0.7503963, -0.724353, 1, 0.2627451, 0, 1,
-1.662837, 2.353383, 0.7103475, 1, 0.2705882, 0, 1,
-1.648893, -0.7318853, -0.8649476, 1, 0.2745098, 0, 1,
-1.648089, -0.4969448, -2.065064, 1, 0.282353, 0, 1,
-1.635739, -0.4000923, 0.3666555, 1, 0.2862745, 0, 1,
-1.634828, -0.22998, -2.165359, 1, 0.2941177, 0, 1,
-1.618882, 1.006089, -0.5197738, 1, 0.3019608, 0, 1,
-1.603321, 0.2037243, -0.3041454, 1, 0.3058824, 0, 1,
-1.588889, -0.07976508, -0.2247703, 1, 0.3137255, 0, 1,
-1.568565, 0.01303454, -2.103893, 1, 0.3176471, 0, 1,
-1.56516, -0.3642758, -1.438008, 1, 0.3254902, 0, 1,
-1.565027, 0.4778197, -0.7006323, 1, 0.3294118, 0, 1,
-1.558493, 0.2248992, -0.1595089, 1, 0.3372549, 0, 1,
-1.55253, 0.1111346, -3.363197, 1, 0.3411765, 0, 1,
-1.542632, 0.71028, -0.9932026, 1, 0.3490196, 0, 1,
-1.54222, 0.8244733, -1.368518, 1, 0.3529412, 0, 1,
-1.53631, 0.1454284, -1.706868, 1, 0.3607843, 0, 1,
-1.520827, -1.040149, -1.235728, 1, 0.3647059, 0, 1,
-1.50321, -0.5579841, -1.653738, 1, 0.372549, 0, 1,
-1.493765, -1.336295, -2.099615, 1, 0.3764706, 0, 1,
-1.488927, 0.3018511, -2.156102, 1, 0.3843137, 0, 1,
-1.487071, -0.4099054, -0.9008086, 1, 0.3882353, 0, 1,
-1.48048, 0.1719489, -2.341019, 1, 0.3960784, 0, 1,
-1.479757, -1.959175, -5.058131, 1, 0.4039216, 0, 1,
-1.479313, -0.1726712, -1.380451, 1, 0.4078431, 0, 1,
-1.478827, 0.2005738, -2.259286, 1, 0.4156863, 0, 1,
-1.471151, -1.115302, -3.440292, 1, 0.4196078, 0, 1,
-1.470837, -0.8258705, -2.443483, 1, 0.427451, 0, 1,
-1.470056, -0.06853925, -1.832918, 1, 0.4313726, 0, 1,
-1.469533, -0.3930035, -1.174675, 1, 0.4392157, 0, 1,
-1.450708, -0.6813711, -3.065381, 1, 0.4431373, 0, 1,
-1.437374, 1.183715, -0.7967666, 1, 0.4509804, 0, 1,
-1.435607, 0.148599, 0.7877078, 1, 0.454902, 0, 1,
-1.435491, 0.4057908, -2.887483, 1, 0.4627451, 0, 1,
-1.42399, 0.2525889, -2.850819, 1, 0.4666667, 0, 1,
-1.416309, 0.6181093, -2.809579, 1, 0.4745098, 0, 1,
-1.41543, -0.2788962, -0.737734, 1, 0.4784314, 0, 1,
-1.414842, 0.4383151, -1.328823, 1, 0.4862745, 0, 1,
-1.403088, -1.052571, -0.8577498, 1, 0.4901961, 0, 1,
-1.400278, -1.809238, -1.994268, 1, 0.4980392, 0, 1,
-1.389131, -0.1324247, -2.001258, 1, 0.5058824, 0, 1,
-1.385324, -0.6834885, -1.834377, 1, 0.509804, 0, 1,
-1.382839, 2.085244, -1.064941, 1, 0.5176471, 0, 1,
-1.3712, 1.053026, 0.128842, 1, 0.5215687, 0, 1,
-1.367806, -0.8417032, -2.848573, 1, 0.5294118, 0, 1,
-1.36559, 0.6122796, -0.3835066, 1, 0.5333334, 0, 1,
-1.361986, -0.2333651, -1.683455, 1, 0.5411765, 0, 1,
-1.351531, -0.2135811, -0.9531115, 1, 0.5450981, 0, 1,
-1.3455, 1.456027, 0.5751594, 1, 0.5529412, 0, 1,
-1.34341, 1.825066, -0.522298, 1, 0.5568628, 0, 1,
-1.341848, -0.6812924, -1.525284, 1, 0.5647059, 0, 1,
-1.340235, -0.2810917, -1.622714, 1, 0.5686275, 0, 1,
-1.334977, -0.7837308, -1.886625, 1, 0.5764706, 0, 1,
-1.325063, -3.652812, -2.257497, 1, 0.5803922, 0, 1,
-1.320406, -1.458464, -2.91725, 1, 0.5882353, 0, 1,
-1.319719, 0.1968129, -1.785238, 1, 0.5921569, 0, 1,
-1.317452, 0.5385807, -1.823096, 1, 0.6, 0, 1,
-1.310582, -0.5458071, -0.9231095, 1, 0.6078432, 0, 1,
-1.304083, -0.9194815, -3.135654, 1, 0.6117647, 0, 1,
-1.302501, 1.743866, -0.6714132, 1, 0.6196079, 0, 1,
-1.283879, 0.8799559, -0.1128252, 1, 0.6235294, 0, 1,
-1.27552, -1.378964, -4.47722, 1, 0.6313726, 0, 1,
-1.27508, -0.9148514, -2.642587, 1, 0.6352941, 0, 1,
-1.264805, 0.4587015, -1.374846, 1, 0.6431373, 0, 1,
-1.262539, 0.7420708, -2.242671, 1, 0.6470588, 0, 1,
-1.241604, 1.071569, -0.4012468, 1, 0.654902, 0, 1,
-1.222779, -0.6484102, 0.4142606, 1, 0.6588235, 0, 1,
-1.21597, 0.5585775, -1.941169, 1, 0.6666667, 0, 1,
-1.215132, -1.36867, -0.9343503, 1, 0.6705883, 0, 1,
-1.212632, -0.8491575, -2.092522, 1, 0.6784314, 0, 1,
-1.210868, -0.3618407, -0.6161482, 1, 0.682353, 0, 1,
-1.206911, 1.371278, -0.5360476, 1, 0.6901961, 0, 1,
-1.197912, -0.9616401, -2.916515, 1, 0.6941177, 0, 1,
-1.195693, -0.3024102, -1.920611, 1, 0.7019608, 0, 1,
-1.195488, -0.209145, -2.669589, 1, 0.7098039, 0, 1,
-1.192888, 0.02373892, -1.271571, 1, 0.7137255, 0, 1,
-1.190956, -0.1942217, -1.48294, 1, 0.7215686, 0, 1,
-1.181542, 1.012172, 1.177075, 1, 0.7254902, 0, 1,
-1.180049, 0.8880947, -1.451112, 1, 0.7333333, 0, 1,
-1.179404, -0.16142, -3.4162, 1, 0.7372549, 0, 1,
-1.177217, 1.126, -0.8677878, 1, 0.7450981, 0, 1,
-1.171866, 0.2080465, -0.1583857, 1, 0.7490196, 0, 1,
-1.171692, -0.9159334, -3.436316, 1, 0.7568628, 0, 1,
-1.167321, 0.8347932, -2.324864, 1, 0.7607843, 0, 1,
-1.155483, -0.7534513, -3.302599, 1, 0.7686275, 0, 1,
-1.130636, 0.2930306, -1.431627, 1, 0.772549, 0, 1,
-1.122447, 2.036818, -0.3410197, 1, 0.7803922, 0, 1,
-1.118626, -0.5820809, -0.7191666, 1, 0.7843137, 0, 1,
-1.116922, 0.3517377, -1.042007, 1, 0.7921569, 0, 1,
-1.114878, 0.7672683, 0.2272599, 1, 0.7960784, 0, 1,
-1.111563, -0.08485319, -1.459454, 1, 0.8039216, 0, 1,
-1.105751, -0.5520186, -1.335843, 1, 0.8117647, 0, 1,
-1.102534, 0.370128, -1.129439, 1, 0.8156863, 0, 1,
-1.09437, 0.6772816, -2.060381, 1, 0.8235294, 0, 1,
-1.094175, -0.1773526, -0.7821712, 1, 0.827451, 0, 1,
-1.091771, 1.387696, -2.907774, 1, 0.8352941, 0, 1,
-1.086675, 0.8708345, -0.01500298, 1, 0.8392157, 0, 1,
-1.08117, -0.04058245, -0.6425236, 1, 0.8470588, 0, 1,
-1.071061, -0.08133883, -1.54767, 1, 0.8509804, 0, 1,
-1.057637, 2.149956, 0.08584809, 1, 0.8588235, 0, 1,
-1.054278, 0.4070068, -0.9167833, 1, 0.8627451, 0, 1,
-1.052357, -1.107132, -3.024033, 1, 0.8705882, 0, 1,
-1.035143, -0.5776954, -1.060018, 1, 0.8745098, 0, 1,
-1.031679, -0.9246086, -3.279532, 1, 0.8823529, 0, 1,
-1.031281, 0.4561169, -1.91731, 1, 0.8862745, 0, 1,
-1.02804, -0.1967588, -1.436611, 1, 0.8941177, 0, 1,
-1.027203, 1.423296, 0.8554108, 1, 0.8980392, 0, 1,
-1.027182, -0.4678124, -0.8698887, 1, 0.9058824, 0, 1,
-1.026934, -0.3872062, -1.15451, 1, 0.9137255, 0, 1,
-1.022733, 0.8168939, 0.05870895, 1, 0.9176471, 0, 1,
-1.019904, -3.010906, -5.383162, 1, 0.9254902, 0, 1,
-1.018589, 2.823062, -0.1887865, 1, 0.9294118, 0, 1,
-1.016337, 0.07768241, -1.040202, 1, 0.9372549, 0, 1,
-1.016097, 0.4889123, 0.3268501, 1, 0.9411765, 0, 1,
-1.007207, -1.284701, -3.133827, 1, 0.9490196, 0, 1,
-1.00466, 0.9476781, -0.1280269, 1, 0.9529412, 0, 1,
-1.001011, -1.267235, -2.076888, 1, 0.9607843, 0, 1,
-0.9809375, -1.833379, -3.027373, 1, 0.9647059, 0, 1,
-0.9786976, -1.266101, -1.58982, 1, 0.972549, 0, 1,
-0.9762017, -1.457422, -3.148876, 1, 0.9764706, 0, 1,
-0.9676372, 1.413614, 0.2327287, 1, 0.9843137, 0, 1,
-0.9536313, 1.428628, -1.294339, 1, 0.9882353, 0, 1,
-0.9474542, -0.5196573, -1.821642, 1, 0.9960784, 0, 1,
-0.9396437, 0.04068427, 0.02782701, 0.9960784, 1, 0, 1,
-0.9387428, 0.6415318, -0.3204378, 0.9921569, 1, 0, 1,
-0.9335535, -0.2035401, -1.896272, 0.9843137, 1, 0, 1,
-0.9300087, -0.6175388, -2.39693, 0.9803922, 1, 0, 1,
-0.9296463, 2.014094, -2.421672, 0.972549, 1, 0, 1,
-0.9262066, -1.33941, -2.325711, 0.9686275, 1, 0, 1,
-0.9254196, 1.474588, -0.3684364, 0.9607843, 1, 0, 1,
-0.9244936, 1.845588, 0.9815377, 0.9568627, 1, 0, 1,
-0.9167153, -1.521968, -3.050159, 0.9490196, 1, 0, 1,
-0.9103719, -0.4397849, -2.957553, 0.945098, 1, 0, 1,
-0.9085844, -0.9203136, -2.713073, 0.9372549, 1, 0, 1,
-0.9045932, 1.022503, -0.1621031, 0.9333333, 1, 0, 1,
-0.9004688, -0.1796225, -1.301595, 0.9254902, 1, 0, 1,
-0.8988107, 0.2359539, -1.572388, 0.9215686, 1, 0, 1,
-0.898496, -0.4316902, -2.603473, 0.9137255, 1, 0, 1,
-0.8884924, -0.04548344, -1.339022, 0.9098039, 1, 0, 1,
-0.8850679, -1.195293, -3.855532, 0.9019608, 1, 0, 1,
-0.8815005, 0.5060334, -0.1946647, 0.8941177, 1, 0, 1,
-0.878669, 0.232053, -2.69399, 0.8901961, 1, 0, 1,
-0.8695106, -0.01836725, -2.904058, 0.8823529, 1, 0, 1,
-0.8658056, -1.389443, -2.690633, 0.8784314, 1, 0, 1,
-0.864786, -0.8182837, -2.176423, 0.8705882, 1, 0, 1,
-0.8506995, 0.9109018, -2.667455, 0.8666667, 1, 0, 1,
-0.8480366, 0.739764, -1.154204, 0.8588235, 1, 0, 1,
-0.847096, -0.1194879, -2.341696, 0.854902, 1, 0, 1,
-0.845955, -0.9035037, -4.280466, 0.8470588, 1, 0, 1,
-0.8453194, 0.04769508, -2.165555, 0.8431373, 1, 0, 1,
-0.84448, -1.973616, -0.94244, 0.8352941, 1, 0, 1,
-0.8314193, 2.003486, -1.290087, 0.8313726, 1, 0, 1,
-0.8279104, 0.09648067, -2.319941, 0.8235294, 1, 0, 1,
-0.8228738, 1.000599, -0.896508, 0.8196079, 1, 0, 1,
-0.820488, 0.4252372, -1.489459, 0.8117647, 1, 0, 1,
-0.8191391, 2.164923, 0.2742659, 0.8078431, 1, 0, 1,
-0.818473, -1.21934, -2.375234, 0.8, 1, 0, 1,
-0.8129432, 0.959079, -0.8498918, 0.7921569, 1, 0, 1,
-0.8105515, -0.907958, -3.255049, 0.7882353, 1, 0, 1,
-0.8079263, 0.1991957, -1.307615, 0.7803922, 1, 0, 1,
-0.8065176, -0.04929253, -0.989992, 0.7764706, 1, 0, 1,
-0.8034385, -0.5047309, -3.816977, 0.7686275, 1, 0, 1,
-0.7937748, 0.03604645, -2.658706, 0.7647059, 1, 0, 1,
-0.7915003, 0.03361065, -0.1050594, 0.7568628, 1, 0, 1,
-0.7910518, -0.531621, -1.852286, 0.7529412, 1, 0, 1,
-0.7906064, 0.443259, -0.9986309, 0.7450981, 1, 0, 1,
-0.7849547, -0.3550948, -1.734368, 0.7411765, 1, 0, 1,
-0.7844383, -1.212527, -2.153369, 0.7333333, 1, 0, 1,
-0.784177, 0.5880247, -0.6284207, 0.7294118, 1, 0, 1,
-0.7802038, 1.065124, 0.2893778, 0.7215686, 1, 0, 1,
-0.7614988, 0.7171906, -0.3802871, 0.7176471, 1, 0, 1,
-0.75885, -1.405207, -2.075743, 0.7098039, 1, 0, 1,
-0.7577472, 0.8769419, -0.6654912, 0.7058824, 1, 0, 1,
-0.7551602, -0.8885424, -3.183688, 0.6980392, 1, 0, 1,
-0.7529184, -0.9019542, -4.159116, 0.6901961, 1, 0, 1,
-0.7494574, 1.475311, -1.034458, 0.6862745, 1, 0, 1,
-0.7450355, 0.02410544, -1.31266, 0.6784314, 1, 0, 1,
-0.7431408, 0.08712789, -1.533305, 0.6745098, 1, 0, 1,
-0.7430857, 0.798148, 0.348375, 0.6666667, 1, 0, 1,
-0.7375111, -0.7815685, -1.881044, 0.6627451, 1, 0, 1,
-0.7328062, -0.1586141, -3.219587, 0.654902, 1, 0, 1,
-0.7321505, 0.5283403, -2.314152, 0.6509804, 1, 0, 1,
-0.7317851, 0.3484504, -1.638044, 0.6431373, 1, 0, 1,
-0.7312645, -0.6835554, -3.742562, 0.6392157, 1, 0, 1,
-0.7312107, 1.01532, 0.3644612, 0.6313726, 1, 0, 1,
-0.7250233, 1.741208, 1.46609, 0.627451, 1, 0, 1,
-0.7183794, -0.3601583, -3.378208, 0.6196079, 1, 0, 1,
-0.7178889, -0.4834428, -3.526569, 0.6156863, 1, 0, 1,
-0.7166368, -0.04201656, -0.4830424, 0.6078432, 1, 0, 1,
-0.713658, 0.7328954, -0.821574, 0.6039216, 1, 0, 1,
-0.7084964, -0.8309516, -4.805904, 0.5960785, 1, 0, 1,
-0.7082716, 1.116594, -1.662374, 0.5882353, 1, 0, 1,
-0.7028841, -0.03561338, -0.1122768, 0.5843138, 1, 0, 1,
-0.7023603, -0.652945, -1.119718, 0.5764706, 1, 0, 1,
-0.6948085, -0.9507168, -2.022446, 0.572549, 1, 0, 1,
-0.6874184, -0.5889997, -0.7089859, 0.5647059, 1, 0, 1,
-0.6872048, -0.8484533, -2.743754, 0.5607843, 1, 0, 1,
-0.6853085, 0.3156883, -1.09244, 0.5529412, 1, 0, 1,
-0.6833012, 0.861983, -2.028789, 0.5490196, 1, 0, 1,
-0.6826734, 1.451612, 1.213328, 0.5411765, 1, 0, 1,
-0.6822429, -0.4200768, -2.678217, 0.5372549, 1, 0, 1,
-0.6820795, -0.1189719, -0.7517318, 0.5294118, 1, 0, 1,
-0.6738175, -1.131202, -2.97005, 0.5254902, 1, 0, 1,
-0.6716865, 0.7243111, 0.8999688, 0.5176471, 1, 0, 1,
-0.6694471, -0.4831525, -1.14645, 0.5137255, 1, 0, 1,
-0.6683443, 1.207206, -0.9765577, 0.5058824, 1, 0, 1,
-0.6667714, 1.629338, 0.7426449, 0.5019608, 1, 0, 1,
-0.6591564, -0.2631057, -2.204298, 0.4941176, 1, 0, 1,
-0.6548049, -1.103405, -1.921942, 0.4862745, 1, 0, 1,
-0.6520446, 0.01756893, -1.120103, 0.4823529, 1, 0, 1,
-0.6514896, -0.8216462, -2.877755, 0.4745098, 1, 0, 1,
-0.650748, -0.582945, -1.724976, 0.4705882, 1, 0, 1,
-0.6504763, 1.035956, -0.6938087, 0.4627451, 1, 0, 1,
-0.6474328, -0.3174286, -1.671033, 0.4588235, 1, 0, 1,
-0.6474252, 1.737309, -1.566073, 0.4509804, 1, 0, 1,
-0.6453914, 0.3085631, -0.6278944, 0.4470588, 1, 0, 1,
-0.6452475, -1.173825, -3.161433, 0.4392157, 1, 0, 1,
-0.63657, -0.1181368, -2.033859, 0.4352941, 1, 0, 1,
-0.6360471, 1.326009, -1.352814, 0.427451, 1, 0, 1,
-0.6320645, 0.1696249, -2.648767, 0.4235294, 1, 0, 1,
-0.6317019, 1.281874, 1.237225, 0.4156863, 1, 0, 1,
-0.6300387, 1.568947, 0.2185188, 0.4117647, 1, 0, 1,
-0.626793, 0.1589957, -1.179486, 0.4039216, 1, 0, 1,
-0.6254597, -1.29389, -4.048028, 0.3960784, 1, 0, 1,
-0.6219455, -0.1713507, -0.8075228, 0.3921569, 1, 0, 1,
-0.6202421, 1.075222, -1.677837, 0.3843137, 1, 0, 1,
-0.6163005, -1.113831, -3.032391, 0.3803922, 1, 0, 1,
-0.6144964, 0.6607168, -1.218779, 0.372549, 1, 0, 1,
-0.6096984, 0.6756358, -0.5208144, 0.3686275, 1, 0, 1,
-0.6093516, -0.6445595, -2.318101, 0.3607843, 1, 0, 1,
-0.6048411, 0.3269983, -1.234783, 0.3568628, 1, 0, 1,
-0.600145, -1.156949, -2.755018, 0.3490196, 1, 0, 1,
-0.599722, 0.2010901, -1.44574, 0.345098, 1, 0, 1,
-0.5971384, -0.6271165, -4.934854, 0.3372549, 1, 0, 1,
-0.597005, 0.3053797, -0.6777167, 0.3333333, 1, 0, 1,
-0.5921767, 0.01447674, -1.643913, 0.3254902, 1, 0, 1,
-0.5865018, -0.2186366, -2.412684, 0.3215686, 1, 0, 1,
-0.5846066, -0.9064494, -3.14816, 0.3137255, 1, 0, 1,
-0.575152, 0.5813227, -0.5254087, 0.3098039, 1, 0, 1,
-0.5726624, -1.292617, -2.974596, 0.3019608, 1, 0, 1,
-0.571721, -0.8790949, -2.133091, 0.2941177, 1, 0, 1,
-0.5692145, -0.07561611, -3.647109, 0.2901961, 1, 0, 1,
-0.5689204, -1.187901, -3.690229, 0.282353, 1, 0, 1,
-0.5606287, 0.07351848, -1.039334, 0.2784314, 1, 0, 1,
-0.5570874, 0.995949, -0.4081156, 0.2705882, 1, 0, 1,
-0.5524364, -0.541009, -3.120648, 0.2666667, 1, 0, 1,
-0.5499458, 0.283458, -1.928773, 0.2588235, 1, 0, 1,
-0.5484141, -0.7139117, -2.231601, 0.254902, 1, 0, 1,
-0.5470395, -1.161015, -3.138165, 0.2470588, 1, 0, 1,
-0.5467324, -0.1576128, -1.824803, 0.2431373, 1, 0, 1,
-0.5447322, -0.4637422, -2.843831, 0.2352941, 1, 0, 1,
-0.5437247, 0.2369372, -0.002416356, 0.2313726, 1, 0, 1,
-0.5436512, -1.419789, -4.820632, 0.2235294, 1, 0, 1,
-0.5403181, 0.941655, -0.07617993, 0.2196078, 1, 0, 1,
-0.5341354, 0.04719084, -1.350788, 0.2117647, 1, 0, 1,
-0.5286791, -0.5248452, -2.064571, 0.2078431, 1, 0, 1,
-0.5216246, 1.289406, -0.6365964, 0.2, 1, 0, 1,
-0.5214732, -0.3923607, -3.029376, 0.1921569, 1, 0, 1,
-0.5121093, -0.451017, -1.635213, 0.1882353, 1, 0, 1,
-0.5069677, -0.5171111, -2.856786, 0.1803922, 1, 0, 1,
-0.5059599, -1.156446, -3.994257, 0.1764706, 1, 0, 1,
-0.5054157, 1.095787, 0.3977739, 0.1686275, 1, 0, 1,
-0.5035324, 2.311343, -0.4449912, 0.1647059, 1, 0, 1,
-0.5015959, -0.3520053, -0.8942618, 0.1568628, 1, 0, 1,
-0.5008655, 0.3038558, -1.182991, 0.1529412, 1, 0, 1,
-0.5006676, -1.085752, -2.912066, 0.145098, 1, 0, 1,
-0.4918835, 1.365673, -0.2049305, 0.1411765, 1, 0, 1,
-0.4898971, 0.177276, -1.566495, 0.1333333, 1, 0, 1,
-0.4897629, 0.8390067, 0.3966165, 0.1294118, 1, 0, 1,
-0.4871872, 0.5620767, -0.6646019, 0.1215686, 1, 0, 1,
-0.4866312, -0.5270284, -2.18394, 0.1176471, 1, 0, 1,
-0.479846, -1.402314, -2.346069, 0.1098039, 1, 0, 1,
-0.4737651, -0.212121, -0.8147866, 0.1058824, 1, 0, 1,
-0.4727411, 0.9394997, 0.67536, 0.09803922, 1, 0, 1,
-0.4704348, 0.03729789, -2.625401, 0.09019608, 1, 0, 1,
-0.4702873, 0.5127308, -1.343224, 0.08627451, 1, 0, 1,
-0.4696248, -0.03034243, -0.9654408, 0.07843138, 1, 0, 1,
-0.4685622, -0.2377816, -0.8295817, 0.07450981, 1, 0, 1,
-0.4685494, 1.338338, -1.451952, 0.06666667, 1, 0, 1,
-0.468406, 0.05617845, -1.327835, 0.0627451, 1, 0, 1,
-0.4652366, -0.7062163, -2.278433, 0.05490196, 1, 0, 1,
-0.4639372, 1.036004, 0.01258916, 0.05098039, 1, 0, 1,
-0.4637115, 1.079075, -2.254735, 0.04313726, 1, 0, 1,
-0.4596568, -0.2586657, -3.024642, 0.03921569, 1, 0, 1,
-0.458713, -0.007737395, -1.34086, 0.03137255, 1, 0, 1,
-0.4526864, -0.7041627, -2.394188, 0.02745098, 1, 0, 1,
-0.4514058, 0.4213878, -2.518905, 0.01960784, 1, 0, 1,
-0.4442381, 0.2389656, -1.559172, 0.01568628, 1, 0, 1,
-0.4414687, 2.030058, 2.395833, 0.007843138, 1, 0, 1,
-0.4403785, -1.951189, -2.075456, 0.003921569, 1, 0, 1,
-0.4364915, -1.006101, -5.141369, 0, 1, 0.003921569, 1,
-0.4325064, 1.542196, 1.100723, 0, 1, 0.01176471, 1,
-0.4220938, 0.6864246, -0.3266372, 0, 1, 0.01568628, 1,
-0.4197393, -0.6846962, -2.965389, 0, 1, 0.02352941, 1,
-0.4186725, 1.207489, 1.14564, 0, 1, 0.02745098, 1,
-0.4181776, -0.1819343, -2.861055, 0, 1, 0.03529412, 1,
-0.415301, 1.258619, -0.06655995, 0, 1, 0.03921569, 1,
-0.4128272, 1.158719, 0.2718374, 0, 1, 0.04705882, 1,
-0.4122841, 0.7291577, -1.015562, 0, 1, 0.05098039, 1,
-0.407523, -1.459178, -1.764856, 0, 1, 0.05882353, 1,
-0.4036994, 0.1099117, -2.029591, 0, 1, 0.0627451, 1,
-0.4036155, -0.5807107, -2.753017, 0, 1, 0.07058824, 1,
-0.4029261, 0.5102815, -1.353526, 0, 1, 0.07450981, 1,
-0.4024207, -0.4023246, -2.384472, 0, 1, 0.08235294, 1,
-0.4005917, -1.171157, -3.021554, 0, 1, 0.08627451, 1,
-0.3981954, -0.7036263, -2.917608, 0, 1, 0.09411765, 1,
-0.3974668, 1.95896, 1.173834, 0, 1, 0.1019608, 1,
-0.3966845, 0.01331209, -1.634254, 0, 1, 0.1058824, 1,
-0.3956762, -0.316402, -2.125789, 0, 1, 0.1137255, 1,
-0.386758, 0.7045824, -1.103306, 0, 1, 0.1176471, 1,
-0.3859074, -0.59433, -1.769134, 0, 1, 0.1254902, 1,
-0.3852349, -1.099637, -2.840082, 0, 1, 0.1294118, 1,
-0.3843505, 1.115246, 0.4945076, 0, 1, 0.1372549, 1,
-0.3806016, 1.569941, 1.907765, 0, 1, 0.1411765, 1,
-0.3790833, 1.103597, 0.3040412, 0, 1, 0.1490196, 1,
-0.3769702, 1.076182, -0.5953634, 0, 1, 0.1529412, 1,
-0.3745014, -2.811558, -3.670735, 0, 1, 0.1607843, 1,
-0.3636474, 0.1308016, -0.3477105, 0, 1, 0.1647059, 1,
-0.3602941, 0.6430095, -0.09196751, 0, 1, 0.172549, 1,
-0.3593335, -0.6452453, -3.069934, 0, 1, 0.1764706, 1,
-0.3542463, -2.059153, -1.511747, 0, 1, 0.1843137, 1,
-0.3506288, -1.204026, -3.313952, 0, 1, 0.1882353, 1,
-0.3498439, 0.7394482, 0.04857285, 0, 1, 0.1960784, 1,
-0.3488317, 0.2134024, -1.471898, 0, 1, 0.2039216, 1,
-0.3449412, 1.163722, -0.4001687, 0, 1, 0.2078431, 1,
-0.3397447, -0.5692069, -3.143298, 0, 1, 0.2156863, 1,
-0.3368322, 0.4583994, -0.4657932, 0, 1, 0.2196078, 1,
-0.336015, 1.595043, -0.7446783, 0, 1, 0.227451, 1,
-0.334125, 0.3748801, -0.4735877, 0, 1, 0.2313726, 1,
-0.329585, 0.3948272, 0.06892647, 0, 1, 0.2392157, 1,
-0.3292778, -0.3401681, -1.992538, 0, 1, 0.2431373, 1,
-0.3281862, 0.1580761, 0.4389022, 0, 1, 0.2509804, 1,
-0.3275232, -1.664922, -4.087539, 0, 1, 0.254902, 1,
-0.3255998, -0.147309, -1.216283, 0, 1, 0.2627451, 1,
-0.3250773, 1.289082, -0.861388, 0, 1, 0.2666667, 1,
-0.3249475, -0.06655113, -0.9552024, 0, 1, 0.2745098, 1,
-0.3234846, 1.019674, 1.217817, 0, 1, 0.2784314, 1,
-0.3223842, -0.9227482, -1.210231, 0, 1, 0.2862745, 1,
-0.3220796, -1.640302, -2.828794, 0, 1, 0.2901961, 1,
-0.32179, 0.4216191, 0.4399599, 0, 1, 0.2980392, 1,
-0.313136, -0.3167614, -1.411847, 0, 1, 0.3058824, 1,
-0.3124945, -0.1031151, -1.767334, 0, 1, 0.3098039, 1,
-0.3118171, 1.657567, 0.5771374, 0, 1, 0.3176471, 1,
-0.3115045, -0.9096346, -3.399717, 0, 1, 0.3215686, 1,
-0.3095558, 1.087213, 1.481281, 0, 1, 0.3294118, 1,
-0.3089734, -2.224978, -3.752737, 0, 1, 0.3333333, 1,
-0.3088833, -0.2217621, -2.75864, 0, 1, 0.3411765, 1,
-0.308824, -0.167695, -3.384718, 0, 1, 0.345098, 1,
-0.3070705, 1.263962, -0.267405, 0, 1, 0.3529412, 1,
-0.3028734, 0.7052536, -0.02714263, 0, 1, 0.3568628, 1,
-0.2951691, 0.3224752, -0.8812265, 0, 1, 0.3647059, 1,
-0.2948439, -1.594372, -2.703316, 0, 1, 0.3686275, 1,
-0.2921904, -1.243851, -2.683879, 0, 1, 0.3764706, 1,
-0.2756065, 0.6481778, -1.488957, 0, 1, 0.3803922, 1,
-0.2752083, -0.7682156, -2.344589, 0, 1, 0.3882353, 1,
-0.2730179, -0.1498216, 0.6046835, 0, 1, 0.3921569, 1,
-0.2711011, -0.238723, -3.287758, 0, 1, 0.4, 1,
-0.2705334, -0.5259307, -2.151695, 0, 1, 0.4078431, 1,
-0.2671868, -0.9833046, -4.439987, 0, 1, 0.4117647, 1,
-0.2664331, 0.1264926, -0.2568074, 0, 1, 0.4196078, 1,
-0.2660467, -0.7974191, -2.094021, 0, 1, 0.4235294, 1,
-0.2653299, -1.016019, -3.438107, 0, 1, 0.4313726, 1,
-0.2633451, 1.195385, -0.7189141, 0, 1, 0.4352941, 1,
-0.2611974, 1.030356, 0.7516647, 0, 1, 0.4431373, 1,
-0.2602713, 1.328277, 0.6127916, 0, 1, 0.4470588, 1,
-0.2583125, -1.007551, -1.847623, 0, 1, 0.454902, 1,
-0.2550696, -1.814788, -3.174964, 0, 1, 0.4588235, 1,
-0.2480759, -1.017438, -3.730201, 0, 1, 0.4666667, 1,
-0.2435422, -0.816662, -1.547728, 0, 1, 0.4705882, 1,
-0.2433491, -0.04434664, -3.256317, 0, 1, 0.4784314, 1,
-0.2422207, 1.18641, 0.1442778, 0, 1, 0.4823529, 1,
-0.2388057, -0.275559, -2.933537, 0, 1, 0.4901961, 1,
-0.2365468, -1.678185, -4.959725, 0, 1, 0.4941176, 1,
-0.2360928, 1.055491, -0.8288602, 0, 1, 0.5019608, 1,
-0.2345055, 0.699985, -0.2259541, 0, 1, 0.509804, 1,
-0.2330371, -1.582967, -3.291882, 0, 1, 0.5137255, 1,
-0.2319792, -1.014985, -4.300475, 0, 1, 0.5215687, 1,
-0.2302519, -2.215395, -4.169641, 0, 1, 0.5254902, 1,
-0.2290405, -0.5207535, -2.55486, 0, 1, 0.5333334, 1,
-0.2162691, -1.280394, -4.407542, 0, 1, 0.5372549, 1,
-0.2148832, -0.6479817, -2.75517, 0, 1, 0.5450981, 1,
-0.2100888, -0.5335432, -2.282761, 0, 1, 0.5490196, 1,
-0.2047731, 0.7082489, 0.2329243, 0, 1, 0.5568628, 1,
-0.2010587, -0.242217, -2.708776, 0, 1, 0.5607843, 1,
-0.200839, 1.146204, 1.605636, 0, 1, 0.5686275, 1,
-0.2005163, -0.1738518, 0.7641557, 0, 1, 0.572549, 1,
-0.1963206, 1.239185, 0.07901887, 0, 1, 0.5803922, 1,
-0.1934783, -1.64084, -3.467281, 0, 1, 0.5843138, 1,
-0.193227, -1.109563, -2.352377, 0, 1, 0.5921569, 1,
-0.1918974, -0.7714288, -3.316018, 0, 1, 0.5960785, 1,
-0.1850136, -1.370874, -1.564952, 0, 1, 0.6039216, 1,
-0.1849934, -0.2224602, -1.515241, 0, 1, 0.6117647, 1,
-0.1738463, 1.390438, -1.729429, 0, 1, 0.6156863, 1,
-0.1716677, 2.166452, 1.137568, 0, 1, 0.6235294, 1,
-0.1707288, -0.9561915, -4.685172, 0, 1, 0.627451, 1,
-0.1667515, -0.3483829, -3.427968, 0, 1, 0.6352941, 1,
-0.1664346, 0.3719864, -0.6928367, 0, 1, 0.6392157, 1,
-0.1619064, 0.505503, 0.3034943, 0, 1, 0.6470588, 1,
-0.1595805, -0.4745952, -2.495938, 0, 1, 0.6509804, 1,
-0.1583734, 0.2298755, -0.4473574, 0, 1, 0.6588235, 1,
-0.1547173, 1.170785, -0.05006852, 0, 1, 0.6627451, 1,
-0.1532203, 0.6340193, -0.8776084, 0, 1, 0.6705883, 1,
-0.1457638, 0.4969711, -0.1922985, 0, 1, 0.6745098, 1,
-0.1418351, 0.4171011, -1.245965, 0, 1, 0.682353, 1,
-0.1414859, -0.5388991, -3.929656, 0, 1, 0.6862745, 1,
-0.1397575, 0.7191853, 1.702116, 0, 1, 0.6941177, 1,
-0.138654, 0.5872697, -1.195951, 0, 1, 0.7019608, 1,
-0.1336854, -0.1860683, -0.6494849, 0, 1, 0.7058824, 1,
-0.1327376, 0.8100781, 0.1528695, 0, 1, 0.7137255, 1,
-0.1322265, 0.5488641, -0.03299649, 0, 1, 0.7176471, 1,
-0.12967, -1.512672, -3.731163, 0, 1, 0.7254902, 1,
-0.1294684, 0.4542726, -0.8410178, 0, 1, 0.7294118, 1,
-0.1268596, 0.4634251, -0.3218258, 0, 1, 0.7372549, 1,
-0.1265119, -0.2546595, -3.292516, 0, 1, 0.7411765, 1,
-0.1249034, 0.706511, -1.249436, 0, 1, 0.7490196, 1,
-0.1231257, 1.700742, -0.8727601, 0, 1, 0.7529412, 1,
-0.1197614, -1.250125, -1.579967, 0, 1, 0.7607843, 1,
-0.1194055, -1.020882, -3.569435, 0, 1, 0.7647059, 1,
-0.1052795, -0.9550831, -5.182193, 0, 1, 0.772549, 1,
-0.1047974, 0.3393619, -2.721581, 0, 1, 0.7764706, 1,
-0.1044536, 1.101725, 0.5374693, 0, 1, 0.7843137, 1,
-0.1040308, 0.8191924, -0.3092634, 0, 1, 0.7882353, 1,
-0.1027334, -0.1733565, -2.976227, 0, 1, 0.7960784, 1,
-0.09838138, -0.759882, -2.285448, 0, 1, 0.8039216, 1,
-0.09383854, 1.345827, -0.2537371, 0, 1, 0.8078431, 1,
-0.08998105, -2.130399, -3.174658, 0, 1, 0.8156863, 1,
-0.08943456, 0.09872121, -0.1375853, 0, 1, 0.8196079, 1,
-0.08809821, -0.6955612, -3.754781, 0, 1, 0.827451, 1,
-0.08596671, 0.03563391, -0.1455694, 0, 1, 0.8313726, 1,
-0.08387505, 0.04510912, -0.5836963, 0, 1, 0.8392157, 1,
-0.08009612, -0.05568212, -2.13306, 0, 1, 0.8431373, 1,
-0.07748532, 1.309786, -0.5203001, 0, 1, 0.8509804, 1,
-0.07743151, -1.156791, -3.969092, 0, 1, 0.854902, 1,
-0.07653862, 1.353272, -0.454452, 0, 1, 0.8627451, 1,
-0.07486279, 0.2519198, -2.00162, 0, 1, 0.8666667, 1,
-0.07436508, 0.8072239, -0.4049121, 0, 1, 0.8745098, 1,
-0.06832646, 0.3827063, -1.989736, 0, 1, 0.8784314, 1,
-0.06560583, -0.3393918, -3.341743, 0, 1, 0.8862745, 1,
-0.06544722, 0.4897636, 1.327649, 0, 1, 0.8901961, 1,
-0.06465821, 0.3698865, 0.5335855, 0, 1, 0.8980392, 1,
-0.05904095, 0.9634224, 1.70917, 0, 1, 0.9058824, 1,
-0.05315077, -0.7755821, -3.022907, 0, 1, 0.9098039, 1,
-0.05119525, -0.7504511, -2.590476, 0, 1, 0.9176471, 1,
-0.0493223, 0.03066923, -1.809585, 0, 1, 0.9215686, 1,
-0.04932182, -1.069281, -3.398379, 0, 1, 0.9294118, 1,
-0.0476381, -0.6879121, -1.827395, 0, 1, 0.9333333, 1,
-0.0417289, -0.4889061, -1.653691, 0, 1, 0.9411765, 1,
-0.03945843, 1.095992, 0.3773721, 0, 1, 0.945098, 1,
-0.03879971, -0.01993637, -1.390431, 0, 1, 0.9529412, 1,
-0.03265649, 1.770982, -0.9300087, 0, 1, 0.9568627, 1,
-0.02781238, -1.120673, -2.906535, 0, 1, 0.9647059, 1,
-0.02664027, -0.2285764, -6.198379, 0, 1, 0.9686275, 1,
-0.02387301, 0.1728848, 0.555911, 0, 1, 0.9764706, 1,
-0.02236273, -0.8817747, -3.867139, 0, 1, 0.9803922, 1,
-0.0185793, 1.314755, -0.9770719, 0, 1, 0.9882353, 1,
-0.01810026, 1.322663, -0.6409585, 0, 1, 0.9921569, 1,
-0.01747863, -1.268917, -2.849265, 0, 1, 1, 1,
-0.01565374, 0.4633583, -0.3927993, 0, 0.9921569, 1, 1,
-0.01333359, -2.092536, -2.704799, 0, 0.9882353, 1, 1,
-0.01065363, -1.16163, -3.061243, 0, 0.9803922, 1, 1,
-0.0008843747, 1.187838, 0.836613, 0, 0.9764706, 1, 1,
-0.0003629114, -0.3190765, -2.412913, 0, 0.9686275, 1, 1,
0.0009430359, 0.3642957, 0.6643935, 0, 0.9647059, 1, 1,
0.002342778, -0.4583202, 3.16939, 0, 0.9568627, 1, 1,
0.003193631, -0.1279495, 0.9233218, 0, 0.9529412, 1, 1,
0.005871579, -0.4125437, 3.109093, 0, 0.945098, 1, 1,
0.009831629, 0.5344906, 0.3627551, 0, 0.9411765, 1, 1,
0.01231054, -1.377784, 3.23269, 0, 0.9333333, 1, 1,
0.01536637, -0.3175533, 2.778841, 0, 0.9294118, 1, 1,
0.01795528, 1.148097, -0.7263155, 0, 0.9215686, 1, 1,
0.01848681, 0.4606177, -0.7158621, 0, 0.9176471, 1, 1,
0.01936861, 0.3331625, 0.2110076, 0, 0.9098039, 1, 1,
0.01998535, -3.212843, 1.182752, 0, 0.9058824, 1, 1,
0.02412966, -1.52039, 3.208875, 0, 0.8980392, 1, 1,
0.0266903, 2.028893, -1.470514, 0, 0.8901961, 1, 1,
0.02985605, -0.08506892, 3.687433, 0, 0.8862745, 1, 1,
0.03186493, -0.6704572, 2.532488, 0, 0.8784314, 1, 1,
0.03213421, 0.3282816, -0.4967361, 0, 0.8745098, 1, 1,
0.03497351, 1.633849, -1.826221, 0, 0.8666667, 1, 1,
0.03572255, 1.172759, 1.141996, 0, 0.8627451, 1, 1,
0.04129316, -0.5527957, 4.516526, 0, 0.854902, 1, 1,
0.0437545, 1.555783, 1.663182, 0, 0.8509804, 1, 1,
0.04380862, 1.31508, -1.4034, 0, 0.8431373, 1, 1,
0.04618128, 0.1929763, 0.6006764, 0, 0.8392157, 1, 1,
0.04761558, 0.3841935, 0.04981691, 0, 0.8313726, 1, 1,
0.05138855, 0.610672, 0.7641408, 0, 0.827451, 1, 1,
0.05368695, 1.598813, -0.4970361, 0, 0.8196079, 1, 1,
0.05597398, 0.859816, 1.220989, 0, 0.8156863, 1, 1,
0.0569342, -0.5119718, 1.908307, 0, 0.8078431, 1, 1,
0.05928607, -0.5484658, 1.541254, 0, 0.8039216, 1, 1,
0.06773224, 0.4346485, 0.6560168, 0, 0.7960784, 1, 1,
0.07863694, 1.695011, -1.046659, 0, 0.7882353, 1, 1,
0.07868937, 0.4278318, 1.579947, 0, 0.7843137, 1, 1,
0.08156999, -1.590805, 2.921665, 0, 0.7764706, 1, 1,
0.08371644, 0.1011805, 0.5585697, 0, 0.772549, 1, 1,
0.08756789, 0.06505901, 2.86214, 0, 0.7647059, 1, 1,
0.08771908, 0.5137817, 1.649495, 0, 0.7607843, 1, 1,
0.08893929, 0.6552073, -0.05059708, 0, 0.7529412, 1, 1,
0.1015541, -1.544515, 3.081222, 0, 0.7490196, 1, 1,
0.1031439, -1.175042, 4.858099, 0, 0.7411765, 1, 1,
0.1063597, -0.1589085, 2.163572, 0, 0.7372549, 1, 1,
0.1073822, 1.522713, -1.101336, 0, 0.7294118, 1, 1,
0.1093142, 1.033671, 0.07165977, 0, 0.7254902, 1, 1,
0.1116353, -0.3432209, 3.487724, 0, 0.7176471, 1, 1,
0.1118619, 1.337174, -0.2292411, 0, 0.7137255, 1, 1,
0.1200823, 0.5214044, -0.9680238, 0, 0.7058824, 1, 1,
0.1229312, 0.2507853, 0.8457111, 0, 0.6980392, 1, 1,
0.1282262, 0.6297709, -1.048205, 0, 0.6941177, 1, 1,
0.1292013, -0.5448682, 3.54662, 0, 0.6862745, 1, 1,
0.1306319, -0.6816285, 4.257162, 0, 0.682353, 1, 1,
0.1323849, 0.8887501, 1.228888, 0, 0.6745098, 1, 1,
0.1340303, -0.3223769, 1.186776, 0, 0.6705883, 1, 1,
0.1369777, -0.4504114, 3.248445, 0, 0.6627451, 1, 1,
0.1386141, -1.235328, 2.456358, 0, 0.6588235, 1, 1,
0.1462892, 1.913671, -1.533682, 0, 0.6509804, 1, 1,
0.1464451, -0.02486779, 0.52031, 0, 0.6470588, 1, 1,
0.1478626, 0.798119, 0.2562027, 0, 0.6392157, 1, 1,
0.147974, 0.2774539, -1.118115, 0, 0.6352941, 1, 1,
0.1532272, -0.195708, 1.605358, 0, 0.627451, 1, 1,
0.1543463, -0.8091446, 2.973295, 0, 0.6235294, 1, 1,
0.1550326, -0.06897584, 1.744202, 0, 0.6156863, 1, 1,
0.1567646, 0.721855, 1.281539, 0, 0.6117647, 1, 1,
0.1567886, -1.128994, 2.724609, 0, 0.6039216, 1, 1,
0.1568561, 1.433829, -0.8357042, 0, 0.5960785, 1, 1,
0.1599149, -0.2091687, 3.182234, 0, 0.5921569, 1, 1,
0.1704102, -3.054161, 1.501751, 0, 0.5843138, 1, 1,
0.1712663, 0.2707785, 1.090531, 0, 0.5803922, 1, 1,
0.1719681, 0.3608293, 0.9631607, 0, 0.572549, 1, 1,
0.1725555, -2.075784, 2.100371, 0, 0.5686275, 1, 1,
0.1756915, -0.2492225, 1.731487, 0, 0.5607843, 1, 1,
0.1788645, 0.9242363, 1.023913, 0, 0.5568628, 1, 1,
0.1792986, 2.320731, -0.947655, 0, 0.5490196, 1, 1,
0.1819796, -0.7007632, 2.655257, 0, 0.5450981, 1, 1,
0.1824606, 0.4412351, -1.756146, 0, 0.5372549, 1, 1,
0.1826394, 0.04399745, 2.39204, 0, 0.5333334, 1, 1,
0.1833844, 0.63162, -0.5566773, 0, 0.5254902, 1, 1,
0.1872702, 0.7214369, 0.01308907, 0, 0.5215687, 1, 1,
0.18839, 0.316304, -1.75523, 0, 0.5137255, 1, 1,
0.19093, -1.416979, 4.47188, 0, 0.509804, 1, 1,
0.1951063, 0.7880173, -0.4327295, 0, 0.5019608, 1, 1,
0.1961093, -0.6845684, 2.488411, 0, 0.4941176, 1, 1,
0.196737, 0.1502507, 2.254195, 0, 0.4901961, 1, 1,
0.2015427, -1.664255, 4.712753, 0, 0.4823529, 1, 1,
0.2070781, 0.4123177, -1.328888, 0, 0.4784314, 1, 1,
0.2157511, -1.610621, 2.145368, 0, 0.4705882, 1, 1,
0.2160393, 1.169926, 1.232683, 0, 0.4666667, 1, 1,
0.2161181, -0.8338774, 3.841573, 0, 0.4588235, 1, 1,
0.2168283, 0.4197351, 0.7781777, 0, 0.454902, 1, 1,
0.2183638, 0.2022564, 1.710735, 0, 0.4470588, 1, 1,
0.2192235, 0.7123445, 0.96584, 0, 0.4431373, 1, 1,
0.2262859, -1.964544, 2.312011, 0, 0.4352941, 1, 1,
0.2423363, -0.0004250843, 1.132268, 0, 0.4313726, 1, 1,
0.2426671, 0.07563334, 0.8580579, 0, 0.4235294, 1, 1,
0.2470076, 3.06567, -0.7585338, 0, 0.4196078, 1, 1,
0.2565675, -0.3481183, 1.993575, 0, 0.4117647, 1, 1,
0.2617143, -0.6096762, 0.5380493, 0, 0.4078431, 1, 1,
0.2621075, -2.000664, 2.178728, 0, 0.4, 1, 1,
0.2622103, -1.354417, 2.37642, 0, 0.3921569, 1, 1,
0.2699772, 1.405877, 0.7144102, 0, 0.3882353, 1, 1,
0.2713288, -1.159815, 2.569085, 0, 0.3803922, 1, 1,
0.2831964, 0.3301338, 2.547614, 0, 0.3764706, 1, 1,
0.2851996, -0.1859333, 0.5403967, 0, 0.3686275, 1, 1,
0.2867641, 0.400216, 2.83013, 0, 0.3647059, 1, 1,
0.2871979, -1.006612, 2.212591, 0, 0.3568628, 1, 1,
0.2924131, -1.716522, 1.333692, 0, 0.3529412, 1, 1,
0.2935138, 0.381772, -0.8021866, 0, 0.345098, 1, 1,
0.2981753, 1.26511, -0.5566995, 0, 0.3411765, 1, 1,
0.3033439, 1.772095, -0.003541635, 0, 0.3333333, 1, 1,
0.3038324, 0.182803, 2.724107, 0, 0.3294118, 1, 1,
0.307245, 0.2170504, 1.676018, 0, 0.3215686, 1, 1,
0.3104907, -1.070793, 2.396094, 0, 0.3176471, 1, 1,
0.3120483, 0.3668496, -0.6008247, 0, 0.3098039, 1, 1,
0.313844, 0.08081611, 1.418266, 0, 0.3058824, 1, 1,
0.3142066, 0.2129863, 1.341689, 0, 0.2980392, 1, 1,
0.3157634, -0.7054078, 3.969016, 0, 0.2901961, 1, 1,
0.3191652, -0.4419449, 2.665931, 0, 0.2862745, 1, 1,
0.3204399, -0.1271178, 2.277817, 0, 0.2784314, 1, 1,
0.3262419, 1.076635, -1.683408, 0, 0.2745098, 1, 1,
0.3265393, -0.4174005, 2.442207, 0, 0.2666667, 1, 1,
0.32734, 0.5419466, 0.8227044, 0, 0.2627451, 1, 1,
0.3321709, 1.478027, -0.8028306, 0, 0.254902, 1, 1,
0.3327444, -1.632219, 2.124713, 0, 0.2509804, 1, 1,
0.3367071, 0.5914753, -1.534496, 0, 0.2431373, 1, 1,
0.3370526, 0.0007269433, 1.496539, 0, 0.2392157, 1, 1,
0.3415192, -0.5468001, 2.832257, 0, 0.2313726, 1, 1,
0.3440863, 0.9510404, -1.577149, 0, 0.227451, 1, 1,
0.3466062, -1.196373, 3.56038, 0, 0.2196078, 1, 1,
0.3471952, 1.277199, 1.470237, 0, 0.2156863, 1, 1,
0.3536676, -1.122992, 0.3857843, 0, 0.2078431, 1, 1,
0.3552699, -1.444731, 2.863377, 0, 0.2039216, 1, 1,
0.3563162, 0.1462301, 0.9690019, 0, 0.1960784, 1, 1,
0.3607236, -0.6229959, 2.915188, 0, 0.1882353, 1, 1,
0.3613697, -0.6719365, 1.852693, 0, 0.1843137, 1, 1,
0.3663234, 0.6810212, 1.181131, 0, 0.1764706, 1, 1,
0.3672686, 2.057053, 0.4325478, 0, 0.172549, 1, 1,
0.3697107, 0.07679128, 2.484336, 0, 0.1647059, 1, 1,
0.3717197, -0.05980617, 2.39202, 0, 0.1607843, 1, 1,
0.3791061, 1.08958, 1.093408, 0, 0.1529412, 1, 1,
0.3817536, -0.1955089, 3.033646, 0, 0.1490196, 1, 1,
0.3871535, -1.335209, 1.564967, 0, 0.1411765, 1, 1,
0.3875668, -0.1268158, 2.777618, 0, 0.1372549, 1, 1,
0.3909536, -0.856301, 3.334334, 0, 0.1294118, 1, 1,
0.394368, 0.2021384, -0.1926183, 0, 0.1254902, 1, 1,
0.3945711, 1.198673, -0.3932467, 0, 0.1176471, 1, 1,
0.4030258, -0.08215278, 2.796539, 0, 0.1137255, 1, 1,
0.4045925, -0.01178043, 1.597751, 0, 0.1058824, 1, 1,
0.4053992, 0.7509081, -0.2389781, 0, 0.09803922, 1, 1,
0.4054775, 1.764938, 0.2879799, 0, 0.09411765, 1, 1,
0.4054971, -0.8250487, 2.259783, 0, 0.08627451, 1, 1,
0.4057522, 0.5204449, 0.6493304, 0, 0.08235294, 1, 1,
0.4084923, -0.1203932, 1.833684, 0, 0.07450981, 1, 1,
0.4093197, -1.43778, 1.778075, 0, 0.07058824, 1, 1,
0.4096487, -0.8153412, 1.532054, 0, 0.0627451, 1, 1,
0.4202664, -0.4056588, 2.108555, 0, 0.05882353, 1, 1,
0.4210206, 0.5541458, 1.363772, 0, 0.05098039, 1, 1,
0.4249995, 0.8216838, 1.161461, 0, 0.04705882, 1, 1,
0.4287132, -0.7573934, 3.148996, 0, 0.03921569, 1, 1,
0.4303424, 0.09813169, 0.06629672, 0, 0.03529412, 1, 1,
0.4303707, 0.2879226, -0.1301602, 0, 0.02745098, 1, 1,
0.4310163, -0.688625, 3.497169, 0, 0.02352941, 1, 1,
0.431573, 0.5938204, 0.2841638, 0, 0.01568628, 1, 1,
0.4330693, -2.008332, 2.091042, 0, 0.01176471, 1, 1,
0.4357638, -0.5018461, 2.280641, 0, 0.003921569, 1, 1,
0.4358214, -0.5949737, 1.169724, 0.003921569, 0, 1, 1,
0.4402966, 1.113986, 1.095247, 0.007843138, 0, 1, 1,
0.4435159, 0.3441295, 0.9823925, 0.01568628, 0, 1, 1,
0.4456878, -0.5297526, 2.050927, 0.01960784, 0, 1, 1,
0.4493239, 0.4131597, 1.198282, 0.02745098, 0, 1, 1,
0.4573476, 1.276078, 0.953705, 0.03137255, 0, 1, 1,
0.4577918, 1.178362, -1.356293, 0.03921569, 0, 1, 1,
0.4612488, 0.6128778, 0.2461326, 0.04313726, 0, 1, 1,
0.463114, 0.9961181, 1.045538, 0.05098039, 0, 1, 1,
0.463488, 0.6897466, 0.2539715, 0.05490196, 0, 1, 1,
0.4635423, 0.8269091, -0.5448033, 0.0627451, 0, 1, 1,
0.4645348, -0.08240565, 1.634442, 0.06666667, 0, 1, 1,
0.4669457, 2.31709, -1.04203, 0.07450981, 0, 1, 1,
0.4708531, -1.003467, 3.779413, 0.07843138, 0, 1, 1,
0.4710529, 1.323305, 0.8310982, 0.08627451, 0, 1, 1,
0.4713168, -0.3451295, 1.804689, 0.09019608, 0, 1, 1,
0.474559, 0.7908695, 1.071128, 0.09803922, 0, 1, 1,
0.4778546, 0.6357426, 2.189252, 0.1058824, 0, 1, 1,
0.4787734, -0.2052393, 2.053314, 0.1098039, 0, 1, 1,
0.4800823, -0.619337, 2.914062, 0.1176471, 0, 1, 1,
0.4842635, 0.1803896, 1.546825, 0.1215686, 0, 1, 1,
0.4871006, -2.223792, 2.892088, 0.1294118, 0, 1, 1,
0.4907802, -0.9418629, 2.747343, 0.1333333, 0, 1, 1,
0.4937467, 0.4234156, 0.3721762, 0.1411765, 0, 1, 1,
0.4976052, 2.025489, 0.06107686, 0.145098, 0, 1, 1,
0.4989168, 1.26056, -0.4684245, 0.1529412, 0, 1, 1,
0.5010515, 0.5862711, 0.08885115, 0.1568628, 0, 1, 1,
0.5030999, -0.5625593, 2.401174, 0.1647059, 0, 1, 1,
0.5090206, -0.9847255, 2.571948, 0.1686275, 0, 1, 1,
0.5168336, 0.3271441, 1.034223, 0.1764706, 0, 1, 1,
0.5170411, 0.1733506, 0.09968975, 0.1803922, 0, 1, 1,
0.5172084, -1.011875, 4.276566, 0.1882353, 0, 1, 1,
0.5183745, 0.2189285, 1.369405, 0.1921569, 0, 1, 1,
0.5190274, 0.1521881, -0.1879301, 0.2, 0, 1, 1,
0.5209139, 0.3119601, -0.2746457, 0.2078431, 0, 1, 1,
0.522325, 1.237544, -0.1510558, 0.2117647, 0, 1, 1,
0.5230011, 1.011742, 2.052155, 0.2196078, 0, 1, 1,
0.5262815, 0.03752251, 0.4155887, 0.2235294, 0, 1, 1,
0.5308173, -2.993425, 3.172767, 0.2313726, 0, 1, 1,
0.5403479, -1.48857, 2.915295, 0.2352941, 0, 1, 1,
0.5413908, -0.7434469, 3.129547, 0.2431373, 0, 1, 1,
0.546732, 0.3114042, -0.4362002, 0.2470588, 0, 1, 1,
0.5513416, -1.763103, 2.32199, 0.254902, 0, 1, 1,
0.5518878, 0.3988769, 1.131692, 0.2588235, 0, 1, 1,
0.5531107, -0.3837954, 1.965602, 0.2666667, 0, 1, 1,
0.5533622, 0.51095, 0.09543672, 0.2705882, 0, 1, 1,
0.5619769, -1.131943, 2.745928, 0.2784314, 0, 1, 1,
0.5629231, 2.681365, -0.137077, 0.282353, 0, 1, 1,
0.5630724, -0.3983852, 2.454463, 0.2901961, 0, 1, 1,
0.5644552, -0.02616778, 1.410135, 0.2941177, 0, 1, 1,
0.5737538, -0.3727266, 2.087937, 0.3019608, 0, 1, 1,
0.5782738, -0.01279014, 2.463883, 0.3098039, 0, 1, 1,
0.5796489, 0.8641461, -0.2486028, 0.3137255, 0, 1, 1,
0.5830441, 1.570698, 1.431821, 0.3215686, 0, 1, 1,
0.5846985, -0.1620431, 1.448677, 0.3254902, 0, 1, 1,
0.5850198, 1.233693, 0.01991757, 0.3333333, 0, 1, 1,
0.5883306, -0.5322143, 2.397708, 0.3372549, 0, 1, 1,
0.5896544, 0.7835244, 2.534953, 0.345098, 0, 1, 1,
0.5925658, -1.147895, 3.457163, 0.3490196, 0, 1, 1,
0.5926323, -1.043998, 3.407057, 0.3568628, 0, 1, 1,
0.5940844, 0.09332918, 0.08520517, 0.3607843, 0, 1, 1,
0.5943706, 0.6547295, 0.4184614, 0.3686275, 0, 1, 1,
0.5977588, 1.052531, -0.4844451, 0.372549, 0, 1, 1,
0.5982944, 0.3226713, 0.3696024, 0.3803922, 0, 1, 1,
0.6003484, -0.2184908, 1.911239, 0.3843137, 0, 1, 1,
0.6011293, 0.03203731, 1.457518, 0.3921569, 0, 1, 1,
0.606134, -0.6889418, 2.173932, 0.3960784, 0, 1, 1,
0.6099114, 1.530658, 2.598154, 0.4039216, 0, 1, 1,
0.6108635, -1.886913, 2.211829, 0.4117647, 0, 1, 1,
0.6199512, -0.6149689, 2.946048, 0.4156863, 0, 1, 1,
0.6224316, 0.1190156, 0.6227897, 0.4235294, 0, 1, 1,
0.6224734, -0.5488995, 0.9285489, 0.427451, 0, 1, 1,
0.6247162, -0.2885787, 3.146066, 0.4352941, 0, 1, 1,
0.6294164, 0.2199614, 1.863498, 0.4392157, 0, 1, 1,
0.6322951, -1.177841, 4.029781, 0.4470588, 0, 1, 1,
0.64879, 0.2582299, 1.192894, 0.4509804, 0, 1, 1,
0.6504558, 0.6354377, 1.123736, 0.4588235, 0, 1, 1,
0.6507553, 1.634223, -0.004291527, 0.4627451, 0, 1, 1,
0.6584409, -2.795114, 2.51185, 0.4705882, 0, 1, 1,
0.6636288, -0.7157203, 1.684696, 0.4745098, 0, 1, 1,
0.6666004, 1.046014, 0.7775694, 0.4823529, 0, 1, 1,
0.6710806, 0.8877696, -1.156777, 0.4862745, 0, 1, 1,
0.6716079, -1.434746, 2.45348, 0.4941176, 0, 1, 1,
0.6728338, -0.308164, 0.1846925, 0.5019608, 0, 1, 1,
0.6785046, -0.6213396, 4.345919, 0.5058824, 0, 1, 1,
0.6802859, 0.8321665, 2.191021, 0.5137255, 0, 1, 1,
0.692306, -1.049089, 1.363644, 0.5176471, 0, 1, 1,
0.696188, 0.1180323, 0.8192345, 0.5254902, 0, 1, 1,
0.6965377, 2.169841, 0.9293917, 0.5294118, 0, 1, 1,
0.7114128, 0.9227312, -1.42262, 0.5372549, 0, 1, 1,
0.7117089, -0.0519167, 1.098367, 0.5411765, 0, 1, 1,
0.7117091, -0.8046266, 3.291713, 0.5490196, 0, 1, 1,
0.7148394, -1.407824, 0.9445881, 0.5529412, 0, 1, 1,
0.717182, -0.5091277, 3.039326, 0.5607843, 0, 1, 1,
0.7205522, 0.0332156, 1.317238, 0.5647059, 0, 1, 1,
0.7301849, 0.8029106, 1.652301, 0.572549, 0, 1, 1,
0.7354326, -1.788641, 1.953283, 0.5764706, 0, 1, 1,
0.7402756, 2.163441, -0.05168204, 0.5843138, 0, 1, 1,
0.7405854, 0.6309053, -0.8941281, 0.5882353, 0, 1, 1,
0.744135, 1.860283, 1.254191, 0.5960785, 0, 1, 1,
0.745919, 0.2320108, 1.203091, 0.6039216, 0, 1, 1,
0.7486573, -0.1434325, 0.02115674, 0.6078432, 0, 1, 1,
0.7558203, -0.2691334, 2.93091, 0.6156863, 0, 1, 1,
0.7615893, 0.9913083, -0.390755, 0.6196079, 0, 1, 1,
0.7626117, 1.341767, -1.479955, 0.627451, 0, 1, 1,
0.7630668, -0.1222579, 1.943296, 0.6313726, 0, 1, 1,
0.7646194, -0.514035, 2.040387, 0.6392157, 0, 1, 1,
0.7663418, -1.927572, 2.530934, 0.6431373, 0, 1, 1,
0.7682239, -0.2232664, 3.539036, 0.6509804, 0, 1, 1,
0.7719903, 0.5651899, 2.092262, 0.654902, 0, 1, 1,
0.7776897, -0.500293, 1.878596, 0.6627451, 0, 1, 1,
0.780184, -0.4327509, 3.846179, 0.6666667, 0, 1, 1,
0.7830156, -0.1839145, 0.8100258, 0.6745098, 0, 1, 1,
0.7871829, -0.2646677, 1.993393, 0.6784314, 0, 1, 1,
0.789579, 0.995011, 0.4262074, 0.6862745, 0, 1, 1,
0.7930366, -0.4017615, 0.6239353, 0.6901961, 0, 1, 1,
0.7944252, -0.5960351, 2.582759, 0.6980392, 0, 1, 1,
0.7945852, 0.784161, 1.433823, 0.7058824, 0, 1, 1,
0.8017925, -0.667582, 2.457381, 0.7098039, 0, 1, 1,
0.8038295, 0.4262044, -0.5081929, 0.7176471, 0, 1, 1,
0.8070982, -0.5496058, 1.220387, 0.7215686, 0, 1, 1,
0.8073366, 0.1416418, 1.672944, 0.7294118, 0, 1, 1,
0.8083159, -1.596376, 1.774465, 0.7333333, 0, 1, 1,
0.814387, 2.039303, -1.33066, 0.7411765, 0, 1, 1,
0.8163007, -0.02191462, 0.7849603, 0.7450981, 0, 1, 1,
0.8163245, -1.239847, 3.483721, 0.7529412, 0, 1, 1,
0.8167984, 1.936908, 0.4188316, 0.7568628, 0, 1, 1,
0.8171297, 0.1070688, 0.7164581, 0.7647059, 0, 1, 1,
0.8196967, -0.5050868, 1.853385, 0.7686275, 0, 1, 1,
0.8226882, 0.5219339, 1.675028, 0.7764706, 0, 1, 1,
0.8260938, -0.5599047, 1.413532, 0.7803922, 0, 1, 1,
0.8344528, -0.6448154, 2.738554, 0.7882353, 0, 1, 1,
0.8347354, -1.45286, 1.989796, 0.7921569, 0, 1, 1,
0.8497512, 0.1628966, 3.112133, 0.8, 0, 1, 1,
0.8561857, -0.2506157, 2.274491, 0.8078431, 0, 1, 1,
0.8587661, 0.2123393, 2.845747, 0.8117647, 0, 1, 1,
0.860912, -1.208151, 1.888382, 0.8196079, 0, 1, 1,
0.880019, 0.6068892, 2.885666, 0.8235294, 0, 1, 1,
0.882037, 0.0456738, 1.149534, 0.8313726, 0, 1, 1,
0.8823634, 0.001775938, 1.735999, 0.8352941, 0, 1, 1,
0.8924034, 1.582036, 2.345343, 0.8431373, 0, 1, 1,
0.894228, 0.574182, 1.400241, 0.8470588, 0, 1, 1,
0.8950691, -0.2766283, 2.628877, 0.854902, 0, 1, 1,
0.8962963, 0.4707507, 2.085046, 0.8588235, 0, 1, 1,
0.8965477, 2.294699, 0.5945697, 0.8666667, 0, 1, 1,
0.8987207, -0.6474084, 4.361115, 0.8705882, 0, 1, 1,
0.8992401, -0.4200952, 1.240247, 0.8784314, 0, 1, 1,
0.906837, 0.7818652, 0.4870173, 0.8823529, 0, 1, 1,
0.9100319, 0.5319138, 1.298966, 0.8901961, 0, 1, 1,
0.9129565, -0.4636439, 1.192614, 0.8941177, 0, 1, 1,
0.9142003, 0.3614542, 1.844222, 0.9019608, 0, 1, 1,
0.916618, -0.2284411, 1.453767, 0.9098039, 0, 1, 1,
0.9329847, 0.7554205, 1.696766, 0.9137255, 0, 1, 1,
0.9348743, 0.2214176, 0.4691432, 0.9215686, 0, 1, 1,
0.943009, -0.3828841, 3.982594, 0.9254902, 0, 1, 1,
0.9463217, -1.796021, 3.766472, 0.9333333, 0, 1, 1,
0.9476392, 0.3327214, 2.249972, 0.9372549, 0, 1, 1,
0.9500664, 1.083952, -0.6191352, 0.945098, 0, 1, 1,
0.9603983, 1.04101, -0.9653282, 0.9490196, 0, 1, 1,
0.9685218, -1.983257, 1.008209, 0.9568627, 0, 1, 1,
0.9717263, -1.125864, 3.497941, 0.9607843, 0, 1, 1,
0.9742348, -0.1865843, 1.879774, 0.9686275, 0, 1, 1,
0.9743339, -0.9622231, 1.657846, 0.972549, 0, 1, 1,
0.9765075, -0.4768364, 0.9061053, 0.9803922, 0, 1, 1,
0.9773384, 0.9558451, 1.480449, 0.9843137, 0, 1, 1,
0.9791141, -0.3861538, 1.057597, 0.9921569, 0, 1, 1,
0.9868236, 0.2648923, 0.5829723, 0.9960784, 0, 1, 1,
0.9917581, -0.6528123, 1.351328, 1, 0, 0.9960784, 1,
0.9926919, -0.2419697, 1.889323, 1, 0, 0.9882353, 1,
0.9952083, 0.2512378, 0.7626898, 1, 0, 0.9843137, 1,
0.9989949, 0.07633178, 2.449471, 1, 0, 0.9764706, 1,
1.00018, 0.606036, -0.2421709, 1, 0, 0.972549, 1,
1.001778, -0.578815, 2.082557, 1, 0, 0.9647059, 1,
1.009632, 1.433342, -0.8599379, 1, 0, 0.9607843, 1,
1.011729, 0.7242277, 0.823988, 1, 0, 0.9529412, 1,
1.018525, -0.5217577, 3.049865, 1, 0, 0.9490196, 1,
1.01854, -0.6824323, 3.054908, 1, 0, 0.9411765, 1,
1.019238, -0.5093166, 3.375659, 1, 0, 0.9372549, 1,
1.021096, -0.1992916, 1.193388, 1, 0, 0.9294118, 1,
1.022367, -2.121701, 1.812603, 1, 0, 0.9254902, 1,
1.024832, -0.111671, 0.946512, 1, 0, 0.9176471, 1,
1.0277, 1.287989, 0.7578912, 1, 0, 0.9137255, 1,
1.029985, 0.6109064, 2.416634, 1, 0, 0.9058824, 1,
1.034747, 0.423755, 0.2064054, 1, 0, 0.9019608, 1,
1.035266, 0.5090203, 1.309792, 1, 0, 0.8941177, 1,
1.039988, -1.236039, 3.249679, 1, 0, 0.8862745, 1,
1.041693, 0.7255208, 1.481962, 1, 0, 0.8823529, 1,
1.046768, -0.8906918, 1.50984, 1, 0, 0.8745098, 1,
1.058403, 0.6367992, 0.6520104, 1, 0, 0.8705882, 1,
1.060368, 0.9784303, 1.033047, 1, 0, 0.8627451, 1,
1.061206, 0.7733339, 3.064325, 1, 0, 0.8588235, 1,
1.06146, -1.845732, 4.644621, 1, 0, 0.8509804, 1,
1.06417, 0.4363521, 2.736004, 1, 0, 0.8470588, 1,
1.064726, -1.180513, 2.099192, 1, 0, 0.8392157, 1,
1.082264, -0.165216, 2.035797, 1, 0, 0.8352941, 1,
1.083476, 0.8797282, 0.819604, 1, 0, 0.827451, 1,
1.084232, 1.867267, -1.116188, 1, 0, 0.8235294, 1,
1.097397, 1.394012, 1.345707, 1, 0, 0.8156863, 1,
1.099792, -0.2229338, 2.90588, 1, 0, 0.8117647, 1,
1.101673, 2.326985, 2.472533, 1, 0, 0.8039216, 1,
1.103423, 0.7805572, 0.5292626, 1, 0, 0.7960784, 1,
1.114101, 0.9211069, 1.12317, 1, 0, 0.7921569, 1,
1.126485, 0.4194147, 1.73322, 1, 0, 0.7843137, 1,
1.127961, 0.5887929, 0.3976667, 1, 0, 0.7803922, 1,
1.134371, -0.9218255, 2.342805, 1, 0, 0.772549, 1,
1.138623, 1.193362, 2.20947, 1, 0, 0.7686275, 1,
1.144887, -0.02780168, -1.45344, 1, 0, 0.7607843, 1,
1.146408, 0.07232495, 1.941592, 1, 0, 0.7568628, 1,
1.153936, 1.643291, 0.1867825, 1, 0, 0.7490196, 1,
1.157474, 1.80734, 1.450873, 1, 0, 0.7450981, 1,
1.161643, -0.3704438, 2.543753, 1, 0, 0.7372549, 1,
1.162861, 0.3393112, 0.3474043, 1, 0, 0.7333333, 1,
1.179099, 0.3043301, 0.3000729, 1, 0, 0.7254902, 1,
1.192711, 0.9335084, 1.386786, 1, 0, 0.7215686, 1,
1.193118, -0.2619646, 2.579877, 1, 0, 0.7137255, 1,
1.195338, -0.05786541, 1.014912, 1, 0, 0.7098039, 1,
1.195988, 0.9389348, 2.232201, 1, 0, 0.7019608, 1,
1.201957, 0.1853827, -0.1899105, 1, 0, 0.6941177, 1,
1.215283, -2.011328, 2.921615, 1, 0, 0.6901961, 1,
1.221504, -0.0323296, 2.488369, 1, 0, 0.682353, 1,
1.225582, 1.030818, 0.4695463, 1, 0, 0.6784314, 1,
1.226077, -0.2097605, 0.3532305, 1, 0, 0.6705883, 1,
1.229682, 0.1617936, 1.166006, 1, 0, 0.6666667, 1,
1.231391, 0.7105182, 3.196208, 1, 0, 0.6588235, 1,
1.236433, -0.2302536, 1.159353, 1, 0, 0.654902, 1,
1.243143, 1.012435, 0.1215273, 1, 0, 0.6470588, 1,
1.254712, 0.2354919, 0.1577074, 1, 0, 0.6431373, 1,
1.256256, -1.428295, 1.687711, 1, 0, 0.6352941, 1,
1.271892, 0.6705961, 0.370555, 1, 0, 0.6313726, 1,
1.286072, -1.310978, 1.484504, 1, 0, 0.6235294, 1,
1.288141, 0.1978652, 2.41452, 1, 0, 0.6196079, 1,
1.297047, 1.654426, -0.520763, 1, 0, 0.6117647, 1,
1.304805, -1.995181, 3.322124, 1, 0, 0.6078432, 1,
1.309666, 0.2435711, 2.737949, 1, 0, 0.6, 1,
1.312387, -0.04348325, 1.715521, 1, 0, 0.5921569, 1,
1.3139, -1.838609, 2.427142, 1, 0, 0.5882353, 1,
1.314144, 0.453081, 2.186696, 1, 0, 0.5803922, 1,
1.320571, 1.056256, 0.7074255, 1, 0, 0.5764706, 1,
1.321531, -0.6546235, 1.189229, 1, 0, 0.5686275, 1,
1.322218, 1.375705, 1.989749, 1, 0, 0.5647059, 1,
1.323886, 0.8402705, 3.479124, 1, 0, 0.5568628, 1,
1.347698, 1.084839, 2.100125, 1, 0, 0.5529412, 1,
1.370248, 0.4407897, 1.256586, 1, 0, 0.5450981, 1,
1.371594, 0.1325642, 2.526382, 1, 0, 0.5411765, 1,
1.384791, -0.2464508, 1.890935, 1, 0, 0.5333334, 1,
1.384828, 1.477992, -0.7553976, 1, 0, 0.5294118, 1,
1.385203, -1.141862, 2.788293, 1, 0, 0.5215687, 1,
1.389418, -1.235551, 2.59853, 1, 0, 0.5176471, 1,
1.393299, -1.357508, 2.594776, 1, 0, 0.509804, 1,
1.394174, 0.2488692, 1.046383, 1, 0, 0.5058824, 1,
1.399242, 0.05312901, 1.940878, 1, 0, 0.4980392, 1,
1.400185, -0.3884833, 3.804471, 1, 0, 0.4901961, 1,
1.414442, -1.051673, 4.271976, 1, 0, 0.4862745, 1,
1.418921, -1.658295, 2.066093, 1, 0, 0.4784314, 1,
1.420634, -0.3030545, 0.9019978, 1, 0, 0.4745098, 1,
1.428452, -0.1557897, 2.432897, 1, 0, 0.4666667, 1,
1.433156, 0.3360246, -0.2065635, 1, 0, 0.4627451, 1,
1.443167, -0.3665652, 0.6481923, 1, 0, 0.454902, 1,
1.45307, 0.2888877, 0.04461976, 1, 0, 0.4509804, 1,
1.474798, 0.8193321, 0.7116684, 1, 0, 0.4431373, 1,
1.476147, 1.22823, 2.777609, 1, 0, 0.4392157, 1,
1.482004, -1.061903, 1.368544, 1, 0, 0.4313726, 1,
1.491049, -0.1052153, 2.055565, 1, 0, 0.427451, 1,
1.506095, -0.9744893, 1.479903, 1, 0, 0.4196078, 1,
1.528996, 0.08109703, 0.463485, 1, 0, 0.4156863, 1,
1.537247, 0.3734173, 0.7231982, 1, 0, 0.4078431, 1,
1.54146, 0.6513656, -0.8466155, 1, 0, 0.4039216, 1,
1.555864, -0.3076986, 2.458959, 1, 0, 0.3960784, 1,
1.571686, 0.5627915, 2.259722, 1, 0, 0.3882353, 1,
1.575349, -1.003385, 0.640618, 1, 0, 0.3843137, 1,
1.576842, -1.022097, 2.512398, 1, 0, 0.3764706, 1,
1.583957, 1.230282, -0.089446, 1, 0, 0.372549, 1,
1.585056, 0.1409599, 2.570967, 1, 0, 0.3647059, 1,
1.592732, -0.4714141, 1.25917, 1, 0, 0.3607843, 1,
1.60016, -1.074194, 0.490416, 1, 0, 0.3529412, 1,
1.605474, 0.4067403, 3.055637, 1, 0, 0.3490196, 1,
1.609335, 1.577408, 1.348886, 1, 0, 0.3411765, 1,
1.6136, 1.588214, -0.276059, 1, 0, 0.3372549, 1,
1.613634, 1.05031, -0.6353466, 1, 0, 0.3294118, 1,
1.637946, -1.05015, 1.563475, 1, 0, 0.3254902, 1,
1.650102, -0.3055673, 2.955508, 1, 0, 0.3176471, 1,
1.662822, -1.679597, 2.174792, 1, 0, 0.3137255, 1,
1.667977, 0.3630808, 2.122964, 1, 0, 0.3058824, 1,
1.669713, 0.5414538, 1.686238, 1, 0, 0.2980392, 1,
1.670132, 0.4610665, 1.162799, 1, 0, 0.2941177, 1,
1.681399, -2.405374, 1.931641, 1, 0, 0.2862745, 1,
1.683972, 1.292888, 1.635677, 1, 0, 0.282353, 1,
1.688039, 0.3520194, 0.4388808, 1, 0, 0.2745098, 1,
1.690276, 0.4902655, 1.951267, 1, 0, 0.2705882, 1,
1.722329, 0.7419558, 0.3328601, 1, 0, 0.2627451, 1,
1.726856, 0.5558657, 0.5513982, 1, 0, 0.2588235, 1,
1.736148, -1.039751, 2.863455, 1, 0, 0.2509804, 1,
1.739504, 0.8664916, 0.4043667, 1, 0, 0.2470588, 1,
1.75442, 0.6402752, -0.1153512, 1, 0, 0.2392157, 1,
1.75823, 0.8246884, 1.427913, 1, 0, 0.2352941, 1,
1.760997, -0.3946631, 1.843461, 1, 0, 0.227451, 1,
1.763561, 1.011703, 2.659342, 1, 0, 0.2235294, 1,
1.765008, 0.7698784, 1.406096, 1, 0, 0.2156863, 1,
1.777195, 0.2768279, 0.4454722, 1, 0, 0.2117647, 1,
1.792753, 0.7108141, 1.056086, 1, 0, 0.2039216, 1,
1.794965, 0.5281219, 0.2111914, 1, 0, 0.1960784, 1,
1.80633, -0.8848732, 0.5774334, 1, 0, 0.1921569, 1,
1.824538, -0.4766767, 1.301, 1, 0, 0.1843137, 1,
1.840862, -0.9479256, 1.370298, 1, 0, 0.1803922, 1,
1.850213, 1.843522, -0.08541477, 1, 0, 0.172549, 1,
1.894994, 0.01954536, 0.4508829, 1, 0, 0.1686275, 1,
1.91501, 0.002399054, 0.2673528, 1, 0, 0.1607843, 1,
1.941156, -0.2676779, 2.070452, 1, 0, 0.1568628, 1,
1.951514, -0.9793358, 1.858531, 1, 0, 0.1490196, 1,
1.964286, -0.1608201, 3.679109, 1, 0, 0.145098, 1,
1.994049, -2.033421, 3.603146, 1, 0, 0.1372549, 1,
2.007024, -0.4573789, 1.732108, 1, 0, 0.1333333, 1,
2.042385, 0.2379331, 0.4432167, 1, 0, 0.1254902, 1,
2.075832, 1.63238, 1.317377, 1, 0, 0.1215686, 1,
2.097656, 0.6820168, 2.049161, 1, 0, 0.1137255, 1,
2.114133, 0.1203817, 2.626282, 1, 0, 0.1098039, 1,
2.118313, -1.39768, 4.662006, 1, 0, 0.1019608, 1,
2.141111, -0.3345965, 0.3608943, 1, 0, 0.09411765, 1,
2.156703, 0.659431, 0.2572512, 1, 0, 0.09019608, 1,
2.214544, 0.2758152, 2.463047, 1, 0, 0.08235294, 1,
2.354989, 0.3468521, 3.265601, 1, 0, 0.07843138, 1,
2.393131, -1.975469, 2.441992, 1, 0, 0.07058824, 1,
2.402752, -0.9863331, 2.717168, 1, 0, 0.06666667, 1,
2.418527, 2.710659, 2.150561, 1, 0, 0.05882353, 1,
2.429663, 0.8905262, 1.209897, 1, 0, 0.05490196, 1,
2.474568, -0.8484609, 1.22762, 1, 0, 0.04705882, 1,
2.572977, 1.278254, 0.3895967, 1, 0, 0.04313726, 1,
2.574537, -0.77727, 3.271348, 1, 0, 0.03529412, 1,
2.805449, -0.2372503, 1.132145, 1, 0, 0.03137255, 1,
2.87857, 0.5980443, 0.6633082, 1, 0, 0.02352941, 1,
2.96706, 0.1816696, 1.626006, 1, 0, 0.01960784, 1,
3.160551, -0.02067138, 1.429108, 1, 0, 0.01176471, 1,
3.453226, -0.9318972, 0.67, 1, 0, 0.007843138, 1
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
-0.1186622, -4.86378, -8.072452, 0, -0.5, 0.5, 0.5,
-0.1186622, -4.86378, -8.072452, 1, -0.5, 0.5, 0.5,
-0.1186622, -4.86378, -8.072452, 1, 1.5, 0.5, 0.5,
-0.1186622, -4.86378, -8.072452, 0, 1.5, 0.5, 0.5
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
-4.901421, -0.08063745, -8.072452, 0, -0.5, 0.5, 0.5,
-4.901421, -0.08063745, -8.072452, 1, -0.5, 0.5, 0.5,
-4.901421, -0.08063745, -8.072452, 1, 1.5, 0.5, 0.5,
-4.901421, -0.08063745, -8.072452, 0, 1.5, 0.5, 0.5
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
-4.901421, -4.86378, -0.67014, 0, -0.5, 0.5, 0.5,
-4.901421, -4.86378, -0.67014, 1, -0.5, 0.5, 0.5,
-4.901421, -4.86378, -0.67014, 1, 1.5, 0.5, 0.5,
-4.901421, -4.86378, -0.67014, 0, 1.5, 0.5, 0.5
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
-2, -3.759978, -6.364226,
2, -3.759978, -6.364226,
-2, -3.759978, -6.364226,
-2, -3.943944, -6.648931,
0, -3.759978, -6.364226,
0, -3.943944, -6.648931,
2, -3.759978, -6.364226,
2, -3.943944, -6.648931
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
"-2",
"0",
"2"
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
-2, -4.311879, -7.218339, 0, -0.5, 0.5, 0.5,
-2, -4.311879, -7.218339, 1, -0.5, 0.5, 0.5,
-2, -4.311879, -7.218339, 1, 1.5, 0.5, 0.5,
-2, -4.311879, -7.218339, 0, 1.5, 0.5, 0.5,
0, -4.311879, -7.218339, 0, -0.5, 0.5, 0.5,
0, -4.311879, -7.218339, 1, -0.5, 0.5, 0.5,
0, -4.311879, -7.218339, 1, 1.5, 0.5, 0.5,
0, -4.311879, -7.218339, 0, 1.5, 0.5, 0.5,
2, -4.311879, -7.218339, 0, -0.5, 0.5, 0.5,
2, -4.311879, -7.218339, 1, -0.5, 0.5, 0.5,
2, -4.311879, -7.218339, 1, 1.5, 0.5, 0.5,
2, -4.311879, -7.218339, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.797707, -2, -6.364226,
-3.797707, 2, -6.364226,
-3.797707, -2, -6.364226,
-3.981659, -2, -6.648931,
-3.797707, 0, -6.364226,
-3.981659, 0, -6.648931,
-3.797707, 2, -6.364226,
-3.981659, 2, -6.648931
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
"0",
"2"
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
-4.349564, -2, -7.218339, 0, -0.5, 0.5, 0.5,
-4.349564, -2, -7.218339, 1, -0.5, 0.5, 0.5,
-4.349564, -2, -7.218339, 1, 1.5, 0.5, 0.5,
-4.349564, -2, -7.218339, 0, 1.5, 0.5, 0.5,
-4.349564, 0, -7.218339, 0, -0.5, 0.5, 0.5,
-4.349564, 0, -7.218339, 1, -0.5, 0.5, 0.5,
-4.349564, 0, -7.218339, 1, 1.5, 0.5, 0.5,
-4.349564, 0, -7.218339, 0, 1.5, 0.5, 0.5,
-4.349564, 2, -7.218339, 0, -0.5, 0.5, 0.5,
-4.349564, 2, -7.218339, 1, -0.5, 0.5, 0.5,
-4.349564, 2, -7.218339, 1, 1.5, 0.5, 0.5,
-4.349564, 2, -7.218339, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.797707, -3.759978, -6,
-3.797707, -3.759978, 4,
-3.797707, -3.759978, -6,
-3.981659, -3.943944, -6,
-3.797707, -3.759978, -4,
-3.981659, -3.943944, -4,
-3.797707, -3.759978, -2,
-3.981659, -3.943944, -2,
-3.797707, -3.759978, 0,
-3.981659, -3.943944, 0,
-3.797707, -3.759978, 2,
-3.981659, -3.943944, 2,
-3.797707, -3.759978, 4,
-3.981659, -3.943944, 4
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
"-6",
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
-4.349564, -4.311879, -6, 0, -0.5, 0.5, 0.5,
-4.349564, -4.311879, -6, 1, -0.5, 0.5, 0.5,
-4.349564, -4.311879, -6, 1, 1.5, 0.5, 0.5,
-4.349564, -4.311879, -6, 0, 1.5, 0.5, 0.5,
-4.349564, -4.311879, -4, 0, -0.5, 0.5, 0.5,
-4.349564, -4.311879, -4, 1, -0.5, 0.5, 0.5,
-4.349564, -4.311879, -4, 1, 1.5, 0.5, 0.5,
-4.349564, -4.311879, -4, 0, 1.5, 0.5, 0.5,
-4.349564, -4.311879, -2, 0, -0.5, 0.5, 0.5,
-4.349564, -4.311879, -2, 1, -0.5, 0.5, 0.5,
-4.349564, -4.311879, -2, 1, 1.5, 0.5, 0.5,
-4.349564, -4.311879, -2, 0, 1.5, 0.5, 0.5,
-4.349564, -4.311879, 0, 0, -0.5, 0.5, 0.5,
-4.349564, -4.311879, 0, 1, -0.5, 0.5, 0.5,
-4.349564, -4.311879, 0, 1, 1.5, 0.5, 0.5,
-4.349564, -4.311879, 0, 0, 1.5, 0.5, 0.5,
-4.349564, -4.311879, 2, 0, -0.5, 0.5, 0.5,
-4.349564, -4.311879, 2, 1, -0.5, 0.5, 0.5,
-4.349564, -4.311879, 2, 1, 1.5, 0.5, 0.5,
-4.349564, -4.311879, 2, 0, 1.5, 0.5, 0.5,
-4.349564, -4.311879, 4, 0, -0.5, 0.5, 0.5,
-4.349564, -4.311879, 4, 1, -0.5, 0.5, 0.5,
-4.349564, -4.311879, 4, 1, 1.5, 0.5, 0.5,
-4.349564, -4.311879, 4, 0, 1.5, 0.5, 0.5
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
-3.797707, -3.759978, -6.364226,
-3.797707, 3.598703, -6.364226,
-3.797707, -3.759978, 5.023946,
-3.797707, 3.598703, 5.023946,
-3.797707, -3.759978, -6.364226,
-3.797707, -3.759978, 5.023946,
-3.797707, 3.598703, -6.364226,
-3.797707, 3.598703, 5.023946,
-3.797707, -3.759978, -6.364226,
3.560383, -3.759978, -6.364226,
-3.797707, -3.759978, 5.023946,
3.560383, -3.759978, 5.023946,
-3.797707, 3.598703, -6.364226,
3.560383, 3.598703, -6.364226,
-3.797707, 3.598703, 5.023946,
3.560383, 3.598703, 5.023946,
3.560383, -3.759978, -6.364226,
3.560383, 3.598703, -6.364226,
3.560383, -3.759978, 5.023946,
3.560383, 3.598703, 5.023946,
3.560383, -3.759978, -6.364226,
3.560383, -3.759978, 5.023946,
3.560383, 3.598703, -6.364226,
3.560383, 3.598703, 5.023946
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
var radius = 8.237542;
var distance = 36.64976;
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
mvMatrix.translate( 0.1186622, 0.08063745, 0.67014 );
mvMatrix.scale( 1.210449, 1.210352, 0.7820914 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.64976);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Isobutyrate<-read.table("Isobutyrate.xyz")
```

```
## Error in read.table("Isobutyrate.xyz"): no lines available in input
```

```r
x<-Isobutyrate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Isobutyrate' not found
```

```r
y<-Isobutyrate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Isobutyrate' not found
```

```r
z<-Isobutyrate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Isobutyrate' not found
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
-3.69055, 0.2923419, -1.384625, 0, 0, 1, 1, 1,
-3.006635, -0.6837105, -1.388891, 1, 0, 0, 1, 1,
-2.90244, 0.6561466, -0.06185463, 1, 0, 0, 1, 1,
-2.631614, -0.02838151, -1.751366, 1, 0, 0, 1, 1,
-2.6017, 0.2727961, -3.167342, 1, 0, 0, 1, 1,
-2.585577, 1.777467, -2.385, 1, 0, 0, 1, 1,
-2.550945, 0.3998616, 0.1307517, 0, 0, 0, 1, 1,
-2.498869, 0.8586681, -1.243399, 0, 0, 0, 1, 1,
-2.43871, 0.4079674, 0.07127968, 0, 0, 0, 1, 1,
-2.406028, -1.084825, -2.103074, 0, 0, 0, 1, 1,
-2.304838, 0.1487015, 1.208915, 0, 0, 0, 1, 1,
-2.267608, 2.057368, -2.363948, 0, 0, 0, 1, 1,
-2.234316, 1.494939, -1.150643, 0, 0, 0, 1, 1,
-2.226513, -0.5370824, -2.916512, 1, 1, 1, 1, 1,
-2.192282, -0.2792839, -1.387854, 1, 1, 1, 1, 1,
-2.160125, -0.7162837, -2.770222, 1, 1, 1, 1, 1,
-2.098526, 0.5544669, -2.015947, 1, 1, 1, 1, 1,
-2.072569, 0.3715331, -0.3535452, 1, 1, 1, 1, 1,
-2.06534, -1.179245, -1.664672, 1, 1, 1, 1, 1,
-2.057561, 0.8401607, 0.6265919, 1, 1, 1, 1, 1,
-2.005843, 0.01153784, -1.71667, 1, 1, 1, 1, 1,
-1.997953, 0.5680059, -0.9984663, 1, 1, 1, 1, 1,
-1.997909, -0.5859072, -2.104026, 1, 1, 1, 1, 1,
-1.960598, 2.717438, -0.3181022, 1, 1, 1, 1, 1,
-1.914581, -1.167535, -0.4382465, 1, 1, 1, 1, 1,
-1.913078, 0.5864256, -2.782815, 1, 1, 1, 1, 1,
-1.909375, 1.652694, 0.6398566, 1, 1, 1, 1, 1,
-1.893404, -0.6897089, -1.298964, 1, 1, 1, 1, 1,
-1.892528, 0.629319, -1.383936, 0, 0, 1, 1, 1,
-1.869988, 0.9695494, -3.138871, 1, 0, 0, 1, 1,
-1.864995, -1.153836, -2.805297, 1, 0, 0, 1, 1,
-1.852337, -0.888517, -2.17943, 1, 0, 0, 1, 1,
-1.851839, 0.5172783, -0.7105263, 1, 0, 0, 1, 1,
-1.848116, -0.2552067, -2.502703, 1, 0, 0, 1, 1,
-1.827782, -0.2859461, -0.8558805, 0, 0, 0, 1, 1,
-1.792925, 0.2802901, -2.446169, 0, 0, 0, 1, 1,
-1.773676, -0.2483282, -2.331267, 0, 0, 0, 1, 1,
-1.758172, 0.5716349, -0.8780697, 0, 0, 0, 1, 1,
-1.74823, 0.9933221, -1.019907, 0, 0, 0, 1, 1,
-1.727915, -0.3066991, -0.6049019, 0, 0, 0, 1, 1,
-1.722895, -0.6073782, -1.985533, 0, 0, 0, 1, 1,
-1.719639, -0.7765812, -0.912524, 1, 1, 1, 1, 1,
-1.699876, -1.899369, -2.886776, 1, 1, 1, 1, 1,
-1.689553, 3.491537, -1.839431, 1, 1, 1, 1, 1,
-1.688752, 0.7503963, -0.724353, 1, 1, 1, 1, 1,
-1.662837, 2.353383, 0.7103475, 1, 1, 1, 1, 1,
-1.648893, -0.7318853, -0.8649476, 1, 1, 1, 1, 1,
-1.648089, -0.4969448, -2.065064, 1, 1, 1, 1, 1,
-1.635739, -0.4000923, 0.3666555, 1, 1, 1, 1, 1,
-1.634828, -0.22998, -2.165359, 1, 1, 1, 1, 1,
-1.618882, 1.006089, -0.5197738, 1, 1, 1, 1, 1,
-1.603321, 0.2037243, -0.3041454, 1, 1, 1, 1, 1,
-1.588889, -0.07976508, -0.2247703, 1, 1, 1, 1, 1,
-1.568565, 0.01303454, -2.103893, 1, 1, 1, 1, 1,
-1.56516, -0.3642758, -1.438008, 1, 1, 1, 1, 1,
-1.565027, 0.4778197, -0.7006323, 1, 1, 1, 1, 1,
-1.558493, 0.2248992, -0.1595089, 0, 0, 1, 1, 1,
-1.55253, 0.1111346, -3.363197, 1, 0, 0, 1, 1,
-1.542632, 0.71028, -0.9932026, 1, 0, 0, 1, 1,
-1.54222, 0.8244733, -1.368518, 1, 0, 0, 1, 1,
-1.53631, 0.1454284, -1.706868, 1, 0, 0, 1, 1,
-1.520827, -1.040149, -1.235728, 1, 0, 0, 1, 1,
-1.50321, -0.5579841, -1.653738, 0, 0, 0, 1, 1,
-1.493765, -1.336295, -2.099615, 0, 0, 0, 1, 1,
-1.488927, 0.3018511, -2.156102, 0, 0, 0, 1, 1,
-1.487071, -0.4099054, -0.9008086, 0, 0, 0, 1, 1,
-1.48048, 0.1719489, -2.341019, 0, 0, 0, 1, 1,
-1.479757, -1.959175, -5.058131, 0, 0, 0, 1, 1,
-1.479313, -0.1726712, -1.380451, 0, 0, 0, 1, 1,
-1.478827, 0.2005738, -2.259286, 1, 1, 1, 1, 1,
-1.471151, -1.115302, -3.440292, 1, 1, 1, 1, 1,
-1.470837, -0.8258705, -2.443483, 1, 1, 1, 1, 1,
-1.470056, -0.06853925, -1.832918, 1, 1, 1, 1, 1,
-1.469533, -0.3930035, -1.174675, 1, 1, 1, 1, 1,
-1.450708, -0.6813711, -3.065381, 1, 1, 1, 1, 1,
-1.437374, 1.183715, -0.7967666, 1, 1, 1, 1, 1,
-1.435607, 0.148599, 0.7877078, 1, 1, 1, 1, 1,
-1.435491, 0.4057908, -2.887483, 1, 1, 1, 1, 1,
-1.42399, 0.2525889, -2.850819, 1, 1, 1, 1, 1,
-1.416309, 0.6181093, -2.809579, 1, 1, 1, 1, 1,
-1.41543, -0.2788962, -0.737734, 1, 1, 1, 1, 1,
-1.414842, 0.4383151, -1.328823, 1, 1, 1, 1, 1,
-1.403088, -1.052571, -0.8577498, 1, 1, 1, 1, 1,
-1.400278, -1.809238, -1.994268, 1, 1, 1, 1, 1,
-1.389131, -0.1324247, -2.001258, 0, 0, 1, 1, 1,
-1.385324, -0.6834885, -1.834377, 1, 0, 0, 1, 1,
-1.382839, 2.085244, -1.064941, 1, 0, 0, 1, 1,
-1.3712, 1.053026, 0.128842, 1, 0, 0, 1, 1,
-1.367806, -0.8417032, -2.848573, 1, 0, 0, 1, 1,
-1.36559, 0.6122796, -0.3835066, 1, 0, 0, 1, 1,
-1.361986, -0.2333651, -1.683455, 0, 0, 0, 1, 1,
-1.351531, -0.2135811, -0.9531115, 0, 0, 0, 1, 1,
-1.3455, 1.456027, 0.5751594, 0, 0, 0, 1, 1,
-1.34341, 1.825066, -0.522298, 0, 0, 0, 1, 1,
-1.341848, -0.6812924, -1.525284, 0, 0, 0, 1, 1,
-1.340235, -0.2810917, -1.622714, 0, 0, 0, 1, 1,
-1.334977, -0.7837308, -1.886625, 0, 0, 0, 1, 1,
-1.325063, -3.652812, -2.257497, 1, 1, 1, 1, 1,
-1.320406, -1.458464, -2.91725, 1, 1, 1, 1, 1,
-1.319719, 0.1968129, -1.785238, 1, 1, 1, 1, 1,
-1.317452, 0.5385807, -1.823096, 1, 1, 1, 1, 1,
-1.310582, -0.5458071, -0.9231095, 1, 1, 1, 1, 1,
-1.304083, -0.9194815, -3.135654, 1, 1, 1, 1, 1,
-1.302501, 1.743866, -0.6714132, 1, 1, 1, 1, 1,
-1.283879, 0.8799559, -0.1128252, 1, 1, 1, 1, 1,
-1.27552, -1.378964, -4.47722, 1, 1, 1, 1, 1,
-1.27508, -0.9148514, -2.642587, 1, 1, 1, 1, 1,
-1.264805, 0.4587015, -1.374846, 1, 1, 1, 1, 1,
-1.262539, 0.7420708, -2.242671, 1, 1, 1, 1, 1,
-1.241604, 1.071569, -0.4012468, 1, 1, 1, 1, 1,
-1.222779, -0.6484102, 0.4142606, 1, 1, 1, 1, 1,
-1.21597, 0.5585775, -1.941169, 1, 1, 1, 1, 1,
-1.215132, -1.36867, -0.9343503, 0, 0, 1, 1, 1,
-1.212632, -0.8491575, -2.092522, 1, 0, 0, 1, 1,
-1.210868, -0.3618407, -0.6161482, 1, 0, 0, 1, 1,
-1.206911, 1.371278, -0.5360476, 1, 0, 0, 1, 1,
-1.197912, -0.9616401, -2.916515, 1, 0, 0, 1, 1,
-1.195693, -0.3024102, -1.920611, 1, 0, 0, 1, 1,
-1.195488, -0.209145, -2.669589, 0, 0, 0, 1, 1,
-1.192888, 0.02373892, -1.271571, 0, 0, 0, 1, 1,
-1.190956, -0.1942217, -1.48294, 0, 0, 0, 1, 1,
-1.181542, 1.012172, 1.177075, 0, 0, 0, 1, 1,
-1.180049, 0.8880947, -1.451112, 0, 0, 0, 1, 1,
-1.179404, -0.16142, -3.4162, 0, 0, 0, 1, 1,
-1.177217, 1.126, -0.8677878, 0, 0, 0, 1, 1,
-1.171866, 0.2080465, -0.1583857, 1, 1, 1, 1, 1,
-1.171692, -0.9159334, -3.436316, 1, 1, 1, 1, 1,
-1.167321, 0.8347932, -2.324864, 1, 1, 1, 1, 1,
-1.155483, -0.7534513, -3.302599, 1, 1, 1, 1, 1,
-1.130636, 0.2930306, -1.431627, 1, 1, 1, 1, 1,
-1.122447, 2.036818, -0.3410197, 1, 1, 1, 1, 1,
-1.118626, -0.5820809, -0.7191666, 1, 1, 1, 1, 1,
-1.116922, 0.3517377, -1.042007, 1, 1, 1, 1, 1,
-1.114878, 0.7672683, 0.2272599, 1, 1, 1, 1, 1,
-1.111563, -0.08485319, -1.459454, 1, 1, 1, 1, 1,
-1.105751, -0.5520186, -1.335843, 1, 1, 1, 1, 1,
-1.102534, 0.370128, -1.129439, 1, 1, 1, 1, 1,
-1.09437, 0.6772816, -2.060381, 1, 1, 1, 1, 1,
-1.094175, -0.1773526, -0.7821712, 1, 1, 1, 1, 1,
-1.091771, 1.387696, -2.907774, 1, 1, 1, 1, 1,
-1.086675, 0.8708345, -0.01500298, 0, 0, 1, 1, 1,
-1.08117, -0.04058245, -0.6425236, 1, 0, 0, 1, 1,
-1.071061, -0.08133883, -1.54767, 1, 0, 0, 1, 1,
-1.057637, 2.149956, 0.08584809, 1, 0, 0, 1, 1,
-1.054278, 0.4070068, -0.9167833, 1, 0, 0, 1, 1,
-1.052357, -1.107132, -3.024033, 1, 0, 0, 1, 1,
-1.035143, -0.5776954, -1.060018, 0, 0, 0, 1, 1,
-1.031679, -0.9246086, -3.279532, 0, 0, 0, 1, 1,
-1.031281, 0.4561169, -1.91731, 0, 0, 0, 1, 1,
-1.02804, -0.1967588, -1.436611, 0, 0, 0, 1, 1,
-1.027203, 1.423296, 0.8554108, 0, 0, 0, 1, 1,
-1.027182, -0.4678124, -0.8698887, 0, 0, 0, 1, 1,
-1.026934, -0.3872062, -1.15451, 0, 0, 0, 1, 1,
-1.022733, 0.8168939, 0.05870895, 1, 1, 1, 1, 1,
-1.019904, -3.010906, -5.383162, 1, 1, 1, 1, 1,
-1.018589, 2.823062, -0.1887865, 1, 1, 1, 1, 1,
-1.016337, 0.07768241, -1.040202, 1, 1, 1, 1, 1,
-1.016097, 0.4889123, 0.3268501, 1, 1, 1, 1, 1,
-1.007207, -1.284701, -3.133827, 1, 1, 1, 1, 1,
-1.00466, 0.9476781, -0.1280269, 1, 1, 1, 1, 1,
-1.001011, -1.267235, -2.076888, 1, 1, 1, 1, 1,
-0.9809375, -1.833379, -3.027373, 1, 1, 1, 1, 1,
-0.9786976, -1.266101, -1.58982, 1, 1, 1, 1, 1,
-0.9762017, -1.457422, -3.148876, 1, 1, 1, 1, 1,
-0.9676372, 1.413614, 0.2327287, 1, 1, 1, 1, 1,
-0.9536313, 1.428628, -1.294339, 1, 1, 1, 1, 1,
-0.9474542, -0.5196573, -1.821642, 1, 1, 1, 1, 1,
-0.9396437, 0.04068427, 0.02782701, 1, 1, 1, 1, 1,
-0.9387428, 0.6415318, -0.3204378, 0, 0, 1, 1, 1,
-0.9335535, -0.2035401, -1.896272, 1, 0, 0, 1, 1,
-0.9300087, -0.6175388, -2.39693, 1, 0, 0, 1, 1,
-0.9296463, 2.014094, -2.421672, 1, 0, 0, 1, 1,
-0.9262066, -1.33941, -2.325711, 1, 0, 0, 1, 1,
-0.9254196, 1.474588, -0.3684364, 1, 0, 0, 1, 1,
-0.9244936, 1.845588, 0.9815377, 0, 0, 0, 1, 1,
-0.9167153, -1.521968, -3.050159, 0, 0, 0, 1, 1,
-0.9103719, -0.4397849, -2.957553, 0, 0, 0, 1, 1,
-0.9085844, -0.9203136, -2.713073, 0, 0, 0, 1, 1,
-0.9045932, 1.022503, -0.1621031, 0, 0, 0, 1, 1,
-0.9004688, -0.1796225, -1.301595, 0, 0, 0, 1, 1,
-0.8988107, 0.2359539, -1.572388, 0, 0, 0, 1, 1,
-0.898496, -0.4316902, -2.603473, 1, 1, 1, 1, 1,
-0.8884924, -0.04548344, -1.339022, 1, 1, 1, 1, 1,
-0.8850679, -1.195293, -3.855532, 1, 1, 1, 1, 1,
-0.8815005, 0.5060334, -0.1946647, 1, 1, 1, 1, 1,
-0.878669, 0.232053, -2.69399, 1, 1, 1, 1, 1,
-0.8695106, -0.01836725, -2.904058, 1, 1, 1, 1, 1,
-0.8658056, -1.389443, -2.690633, 1, 1, 1, 1, 1,
-0.864786, -0.8182837, -2.176423, 1, 1, 1, 1, 1,
-0.8506995, 0.9109018, -2.667455, 1, 1, 1, 1, 1,
-0.8480366, 0.739764, -1.154204, 1, 1, 1, 1, 1,
-0.847096, -0.1194879, -2.341696, 1, 1, 1, 1, 1,
-0.845955, -0.9035037, -4.280466, 1, 1, 1, 1, 1,
-0.8453194, 0.04769508, -2.165555, 1, 1, 1, 1, 1,
-0.84448, -1.973616, -0.94244, 1, 1, 1, 1, 1,
-0.8314193, 2.003486, -1.290087, 1, 1, 1, 1, 1,
-0.8279104, 0.09648067, -2.319941, 0, 0, 1, 1, 1,
-0.8228738, 1.000599, -0.896508, 1, 0, 0, 1, 1,
-0.820488, 0.4252372, -1.489459, 1, 0, 0, 1, 1,
-0.8191391, 2.164923, 0.2742659, 1, 0, 0, 1, 1,
-0.818473, -1.21934, -2.375234, 1, 0, 0, 1, 1,
-0.8129432, 0.959079, -0.8498918, 1, 0, 0, 1, 1,
-0.8105515, -0.907958, -3.255049, 0, 0, 0, 1, 1,
-0.8079263, 0.1991957, -1.307615, 0, 0, 0, 1, 1,
-0.8065176, -0.04929253, -0.989992, 0, 0, 0, 1, 1,
-0.8034385, -0.5047309, -3.816977, 0, 0, 0, 1, 1,
-0.7937748, 0.03604645, -2.658706, 0, 0, 0, 1, 1,
-0.7915003, 0.03361065, -0.1050594, 0, 0, 0, 1, 1,
-0.7910518, -0.531621, -1.852286, 0, 0, 0, 1, 1,
-0.7906064, 0.443259, -0.9986309, 1, 1, 1, 1, 1,
-0.7849547, -0.3550948, -1.734368, 1, 1, 1, 1, 1,
-0.7844383, -1.212527, -2.153369, 1, 1, 1, 1, 1,
-0.784177, 0.5880247, -0.6284207, 1, 1, 1, 1, 1,
-0.7802038, 1.065124, 0.2893778, 1, 1, 1, 1, 1,
-0.7614988, 0.7171906, -0.3802871, 1, 1, 1, 1, 1,
-0.75885, -1.405207, -2.075743, 1, 1, 1, 1, 1,
-0.7577472, 0.8769419, -0.6654912, 1, 1, 1, 1, 1,
-0.7551602, -0.8885424, -3.183688, 1, 1, 1, 1, 1,
-0.7529184, -0.9019542, -4.159116, 1, 1, 1, 1, 1,
-0.7494574, 1.475311, -1.034458, 1, 1, 1, 1, 1,
-0.7450355, 0.02410544, -1.31266, 1, 1, 1, 1, 1,
-0.7431408, 0.08712789, -1.533305, 1, 1, 1, 1, 1,
-0.7430857, 0.798148, 0.348375, 1, 1, 1, 1, 1,
-0.7375111, -0.7815685, -1.881044, 1, 1, 1, 1, 1,
-0.7328062, -0.1586141, -3.219587, 0, 0, 1, 1, 1,
-0.7321505, 0.5283403, -2.314152, 1, 0, 0, 1, 1,
-0.7317851, 0.3484504, -1.638044, 1, 0, 0, 1, 1,
-0.7312645, -0.6835554, -3.742562, 1, 0, 0, 1, 1,
-0.7312107, 1.01532, 0.3644612, 1, 0, 0, 1, 1,
-0.7250233, 1.741208, 1.46609, 1, 0, 0, 1, 1,
-0.7183794, -0.3601583, -3.378208, 0, 0, 0, 1, 1,
-0.7178889, -0.4834428, -3.526569, 0, 0, 0, 1, 1,
-0.7166368, -0.04201656, -0.4830424, 0, 0, 0, 1, 1,
-0.713658, 0.7328954, -0.821574, 0, 0, 0, 1, 1,
-0.7084964, -0.8309516, -4.805904, 0, 0, 0, 1, 1,
-0.7082716, 1.116594, -1.662374, 0, 0, 0, 1, 1,
-0.7028841, -0.03561338, -0.1122768, 0, 0, 0, 1, 1,
-0.7023603, -0.652945, -1.119718, 1, 1, 1, 1, 1,
-0.6948085, -0.9507168, -2.022446, 1, 1, 1, 1, 1,
-0.6874184, -0.5889997, -0.7089859, 1, 1, 1, 1, 1,
-0.6872048, -0.8484533, -2.743754, 1, 1, 1, 1, 1,
-0.6853085, 0.3156883, -1.09244, 1, 1, 1, 1, 1,
-0.6833012, 0.861983, -2.028789, 1, 1, 1, 1, 1,
-0.6826734, 1.451612, 1.213328, 1, 1, 1, 1, 1,
-0.6822429, -0.4200768, -2.678217, 1, 1, 1, 1, 1,
-0.6820795, -0.1189719, -0.7517318, 1, 1, 1, 1, 1,
-0.6738175, -1.131202, -2.97005, 1, 1, 1, 1, 1,
-0.6716865, 0.7243111, 0.8999688, 1, 1, 1, 1, 1,
-0.6694471, -0.4831525, -1.14645, 1, 1, 1, 1, 1,
-0.6683443, 1.207206, -0.9765577, 1, 1, 1, 1, 1,
-0.6667714, 1.629338, 0.7426449, 1, 1, 1, 1, 1,
-0.6591564, -0.2631057, -2.204298, 1, 1, 1, 1, 1,
-0.6548049, -1.103405, -1.921942, 0, 0, 1, 1, 1,
-0.6520446, 0.01756893, -1.120103, 1, 0, 0, 1, 1,
-0.6514896, -0.8216462, -2.877755, 1, 0, 0, 1, 1,
-0.650748, -0.582945, -1.724976, 1, 0, 0, 1, 1,
-0.6504763, 1.035956, -0.6938087, 1, 0, 0, 1, 1,
-0.6474328, -0.3174286, -1.671033, 1, 0, 0, 1, 1,
-0.6474252, 1.737309, -1.566073, 0, 0, 0, 1, 1,
-0.6453914, 0.3085631, -0.6278944, 0, 0, 0, 1, 1,
-0.6452475, -1.173825, -3.161433, 0, 0, 0, 1, 1,
-0.63657, -0.1181368, -2.033859, 0, 0, 0, 1, 1,
-0.6360471, 1.326009, -1.352814, 0, 0, 0, 1, 1,
-0.6320645, 0.1696249, -2.648767, 0, 0, 0, 1, 1,
-0.6317019, 1.281874, 1.237225, 0, 0, 0, 1, 1,
-0.6300387, 1.568947, 0.2185188, 1, 1, 1, 1, 1,
-0.626793, 0.1589957, -1.179486, 1, 1, 1, 1, 1,
-0.6254597, -1.29389, -4.048028, 1, 1, 1, 1, 1,
-0.6219455, -0.1713507, -0.8075228, 1, 1, 1, 1, 1,
-0.6202421, 1.075222, -1.677837, 1, 1, 1, 1, 1,
-0.6163005, -1.113831, -3.032391, 1, 1, 1, 1, 1,
-0.6144964, 0.6607168, -1.218779, 1, 1, 1, 1, 1,
-0.6096984, 0.6756358, -0.5208144, 1, 1, 1, 1, 1,
-0.6093516, -0.6445595, -2.318101, 1, 1, 1, 1, 1,
-0.6048411, 0.3269983, -1.234783, 1, 1, 1, 1, 1,
-0.600145, -1.156949, -2.755018, 1, 1, 1, 1, 1,
-0.599722, 0.2010901, -1.44574, 1, 1, 1, 1, 1,
-0.5971384, -0.6271165, -4.934854, 1, 1, 1, 1, 1,
-0.597005, 0.3053797, -0.6777167, 1, 1, 1, 1, 1,
-0.5921767, 0.01447674, -1.643913, 1, 1, 1, 1, 1,
-0.5865018, -0.2186366, -2.412684, 0, 0, 1, 1, 1,
-0.5846066, -0.9064494, -3.14816, 1, 0, 0, 1, 1,
-0.575152, 0.5813227, -0.5254087, 1, 0, 0, 1, 1,
-0.5726624, -1.292617, -2.974596, 1, 0, 0, 1, 1,
-0.571721, -0.8790949, -2.133091, 1, 0, 0, 1, 1,
-0.5692145, -0.07561611, -3.647109, 1, 0, 0, 1, 1,
-0.5689204, -1.187901, -3.690229, 0, 0, 0, 1, 1,
-0.5606287, 0.07351848, -1.039334, 0, 0, 0, 1, 1,
-0.5570874, 0.995949, -0.4081156, 0, 0, 0, 1, 1,
-0.5524364, -0.541009, -3.120648, 0, 0, 0, 1, 1,
-0.5499458, 0.283458, -1.928773, 0, 0, 0, 1, 1,
-0.5484141, -0.7139117, -2.231601, 0, 0, 0, 1, 1,
-0.5470395, -1.161015, -3.138165, 0, 0, 0, 1, 1,
-0.5467324, -0.1576128, -1.824803, 1, 1, 1, 1, 1,
-0.5447322, -0.4637422, -2.843831, 1, 1, 1, 1, 1,
-0.5437247, 0.2369372, -0.002416356, 1, 1, 1, 1, 1,
-0.5436512, -1.419789, -4.820632, 1, 1, 1, 1, 1,
-0.5403181, 0.941655, -0.07617993, 1, 1, 1, 1, 1,
-0.5341354, 0.04719084, -1.350788, 1, 1, 1, 1, 1,
-0.5286791, -0.5248452, -2.064571, 1, 1, 1, 1, 1,
-0.5216246, 1.289406, -0.6365964, 1, 1, 1, 1, 1,
-0.5214732, -0.3923607, -3.029376, 1, 1, 1, 1, 1,
-0.5121093, -0.451017, -1.635213, 1, 1, 1, 1, 1,
-0.5069677, -0.5171111, -2.856786, 1, 1, 1, 1, 1,
-0.5059599, -1.156446, -3.994257, 1, 1, 1, 1, 1,
-0.5054157, 1.095787, 0.3977739, 1, 1, 1, 1, 1,
-0.5035324, 2.311343, -0.4449912, 1, 1, 1, 1, 1,
-0.5015959, -0.3520053, -0.8942618, 1, 1, 1, 1, 1,
-0.5008655, 0.3038558, -1.182991, 0, 0, 1, 1, 1,
-0.5006676, -1.085752, -2.912066, 1, 0, 0, 1, 1,
-0.4918835, 1.365673, -0.2049305, 1, 0, 0, 1, 1,
-0.4898971, 0.177276, -1.566495, 1, 0, 0, 1, 1,
-0.4897629, 0.8390067, 0.3966165, 1, 0, 0, 1, 1,
-0.4871872, 0.5620767, -0.6646019, 1, 0, 0, 1, 1,
-0.4866312, -0.5270284, -2.18394, 0, 0, 0, 1, 1,
-0.479846, -1.402314, -2.346069, 0, 0, 0, 1, 1,
-0.4737651, -0.212121, -0.8147866, 0, 0, 0, 1, 1,
-0.4727411, 0.9394997, 0.67536, 0, 0, 0, 1, 1,
-0.4704348, 0.03729789, -2.625401, 0, 0, 0, 1, 1,
-0.4702873, 0.5127308, -1.343224, 0, 0, 0, 1, 1,
-0.4696248, -0.03034243, -0.9654408, 0, 0, 0, 1, 1,
-0.4685622, -0.2377816, -0.8295817, 1, 1, 1, 1, 1,
-0.4685494, 1.338338, -1.451952, 1, 1, 1, 1, 1,
-0.468406, 0.05617845, -1.327835, 1, 1, 1, 1, 1,
-0.4652366, -0.7062163, -2.278433, 1, 1, 1, 1, 1,
-0.4639372, 1.036004, 0.01258916, 1, 1, 1, 1, 1,
-0.4637115, 1.079075, -2.254735, 1, 1, 1, 1, 1,
-0.4596568, -0.2586657, -3.024642, 1, 1, 1, 1, 1,
-0.458713, -0.007737395, -1.34086, 1, 1, 1, 1, 1,
-0.4526864, -0.7041627, -2.394188, 1, 1, 1, 1, 1,
-0.4514058, 0.4213878, -2.518905, 1, 1, 1, 1, 1,
-0.4442381, 0.2389656, -1.559172, 1, 1, 1, 1, 1,
-0.4414687, 2.030058, 2.395833, 1, 1, 1, 1, 1,
-0.4403785, -1.951189, -2.075456, 1, 1, 1, 1, 1,
-0.4364915, -1.006101, -5.141369, 1, 1, 1, 1, 1,
-0.4325064, 1.542196, 1.100723, 1, 1, 1, 1, 1,
-0.4220938, 0.6864246, -0.3266372, 0, 0, 1, 1, 1,
-0.4197393, -0.6846962, -2.965389, 1, 0, 0, 1, 1,
-0.4186725, 1.207489, 1.14564, 1, 0, 0, 1, 1,
-0.4181776, -0.1819343, -2.861055, 1, 0, 0, 1, 1,
-0.415301, 1.258619, -0.06655995, 1, 0, 0, 1, 1,
-0.4128272, 1.158719, 0.2718374, 1, 0, 0, 1, 1,
-0.4122841, 0.7291577, -1.015562, 0, 0, 0, 1, 1,
-0.407523, -1.459178, -1.764856, 0, 0, 0, 1, 1,
-0.4036994, 0.1099117, -2.029591, 0, 0, 0, 1, 1,
-0.4036155, -0.5807107, -2.753017, 0, 0, 0, 1, 1,
-0.4029261, 0.5102815, -1.353526, 0, 0, 0, 1, 1,
-0.4024207, -0.4023246, -2.384472, 0, 0, 0, 1, 1,
-0.4005917, -1.171157, -3.021554, 0, 0, 0, 1, 1,
-0.3981954, -0.7036263, -2.917608, 1, 1, 1, 1, 1,
-0.3974668, 1.95896, 1.173834, 1, 1, 1, 1, 1,
-0.3966845, 0.01331209, -1.634254, 1, 1, 1, 1, 1,
-0.3956762, -0.316402, -2.125789, 1, 1, 1, 1, 1,
-0.386758, 0.7045824, -1.103306, 1, 1, 1, 1, 1,
-0.3859074, -0.59433, -1.769134, 1, 1, 1, 1, 1,
-0.3852349, -1.099637, -2.840082, 1, 1, 1, 1, 1,
-0.3843505, 1.115246, 0.4945076, 1, 1, 1, 1, 1,
-0.3806016, 1.569941, 1.907765, 1, 1, 1, 1, 1,
-0.3790833, 1.103597, 0.3040412, 1, 1, 1, 1, 1,
-0.3769702, 1.076182, -0.5953634, 1, 1, 1, 1, 1,
-0.3745014, -2.811558, -3.670735, 1, 1, 1, 1, 1,
-0.3636474, 0.1308016, -0.3477105, 1, 1, 1, 1, 1,
-0.3602941, 0.6430095, -0.09196751, 1, 1, 1, 1, 1,
-0.3593335, -0.6452453, -3.069934, 1, 1, 1, 1, 1,
-0.3542463, -2.059153, -1.511747, 0, 0, 1, 1, 1,
-0.3506288, -1.204026, -3.313952, 1, 0, 0, 1, 1,
-0.3498439, 0.7394482, 0.04857285, 1, 0, 0, 1, 1,
-0.3488317, 0.2134024, -1.471898, 1, 0, 0, 1, 1,
-0.3449412, 1.163722, -0.4001687, 1, 0, 0, 1, 1,
-0.3397447, -0.5692069, -3.143298, 1, 0, 0, 1, 1,
-0.3368322, 0.4583994, -0.4657932, 0, 0, 0, 1, 1,
-0.336015, 1.595043, -0.7446783, 0, 0, 0, 1, 1,
-0.334125, 0.3748801, -0.4735877, 0, 0, 0, 1, 1,
-0.329585, 0.3948272, 0.06892647, 0, 0, 0, 1, 1,
-0.3292778, -0.3401681, -1.992538, 0, 0, 0, 1, 1,
-0.3281862, 0.1580761, 0.4389022, 0, 0, 0, 1, 1,
-0.3275232, -1.664922, -4.087539, 0, 0, 0, 1, 1,
-0.3255998, -0.147309, -1.216283, 1, 1, 1, 1, 1,
-0.3250773, 1.289082, -0.861388, 1, 1, 1, 1, 1,
-0.3249475, -0.06655113, -0.9552024, 1, 1, 1, 1, 1,
-0.3234846, 1.019674, 1.217817, 1, 1, 1, 1, 1,
-0.3223842, -0.9227482, -1.210231, 1, 1, 1, 1, 1,
-0.3220796, -1.640302, -2.828794, 1, 1, 1, 1, 1,
-0.32179, 0.4216191, 0.4399599, 1, 1, 1, 1, 1,
-0.313136, -0.3167614, -1.411847, 1, 1, 1, 1, 1,
-0.3124945, -0.1031151, -1.767334, 1, 1, 1, 1, 1,
-0.3118171, 1.657567, 0.5771374, 1, 1, 1, 1, 1,
-0.3115045, -0.9096346, -3.399717, 1, 1, 1, 1, 1,
-0.3095558, 1.087213, 1.481281, 1, 1, 1, 1, 1,
-0.3089734, -2.224978, -3.752737, 1, 1, 1, 1, 1,
-0.3088833, -0.2217621, -2.75864, 1, 1, 1, 1, 1,
-0.308824, -0.167695, -3.384718, 1, 1, 1, 1, 1,
-0.3070705, 1.263962, -0.267405, 0, 0, 1, 1, 1,
-0.3028734, 0.7052536, -0.02714263, 1, 0, 0, 1, 1,
-0.2951691, 0.3224752, -0.8812265, 1, 0, 0, 1, 1,
-0.2948439, -1.594372, -2.703316, 1, 0, 0, 1, 1,
-0.2921904, -1.243851, -2.683879, 1, 0, 0, 1, 1,
-0.2756065, 0.6481778, -1.488957, 1, 0, 0, 1, 1,
-0.2752083, -0.7682156, -2.344589, 0, 0, 0, 1, 1,
-0.2730179, -0.1498216, 0.6046835, 0, 0, 0, 1, 1,
-0.2711011, -0.238723, -3.287758, 0, 0, 0, 1, 1,
-0.2705334, -0.5259307, -2.151695, 0, 0, 0, 1, 1,
-0.2671868, -0.9833046, -4.439987, 0, 0, 0, 1, 1,
-0.2664331, 0.1264926, -0.2568074, 0, 0, 0, 1, 1,
-0.2660467, -0.7974191, -2.094021, 0, 0, 0, 1, 1,
-0.2653299, -1.016019, -3.438107, 1, 1, 1, 1, 1,
-0.2633451, 1.195385, -0.7189141, 1, 1, 1, 1, 1,
-0.2611974, 1.030356, 0.7516647, 1, 1, 1, 1, 1,
-0.2602713, 1.328277, 0.6127916, 1, 1, 1, 1, 1,
-0.2583125, -1.007551, -1.847623, 1, 1, 1, 1, 1,
-0.2550696, -1.814788, -3.174964, 1, 1, 1, 1, 1,
-0.2480759, -1.017438, -3.730201, 1, 1, 1, 1, 1,
-0.2435422, -0.816662, -1.547728, 1, 1, 1, 1, 1,
-0.2433491, -0.04434664, -3.256317, 1, 1, 1, 1, 1,
-0.2422207, 1.18641, 0.1442778, 1, 1, 1, 1, 1,
-0.2388057, -0.275559, -2.933537, 1, 1, 1, 1, 1,
-0.2365468, -1.678185, -4.959725, 1, 1, 1, 1, 1,
-0.2360928, 1.055491, -0.8288602, 1, 1, 1, 1, 1,
-0.2345055, 0.699985, -0.2259541, 1, 1, 1, 1, 1,
-0.2330371, -1.582967, -3.291882, 1, 1, 1, 1, 1,
-0.2319792, -1.014985, -4.300475, 0, 0, 1, 1, 1,
-0.2302519, -2.215395, -4.169641, 1, 0, 0, 1, 1,
-0.2290405, -0.5207535, -2.55486, 1, 0, 0, 1, 1,
-0.2162691, -1.280394, -4.407542, 1, 0, 0, 1, 1,
-0.2148832, -0.6479817, -2.75517, 1, 0, 0, 1, 1,
-0.2100888, -0.5335432, -2.282761, 1, 0, 0, 1, 1,
-0.2047731, 0.7082489, 0.2329243, 0, 0, 0, 1, 1,
-0.2010587, -0.242217, -2.708776, 0, 0, 0, 1, 1,
-0.200839, 1.146204, 1.605636, 0, 0, 0, 1, 1,
-0.2005163, -0.1738518, 0.7641557, 0, 0, 0, 1, 1,
-0.1963206, 1.239185, 0.07901887, 0, 0, 0, 1, 1,
-0.1934783, -1.64084, -3.467281, 0, 0, 0, 1, 1,
-0.193227, -1.109563, -2.352377, 0, 0, 0, 1, 1,
-0.1918974, -0.7714288, -3.316018, 1, 1, 1, 1, 1,
-0.1850136, -1.370874, -1.564952, 1, 1, 1, 1, 1,
-0.1849934, -0.2224602, -1.515241, 1, 1, 1, 1, 1,
-0.1738463, 1.390438, -1.729429, 1, 1, 1, 1, 1,
-0.1716677, 2.166452, 1.137568, 1, 1, 1, 1, 1,
-0.1707288, -0.9561915, -4.685172, 1, 1, 1, 1, 1,
-0.1667515, -0.3483829, -3.427968, 1, 1, 1, 1, 1,
-0.1664346, 0.3719864, -0.6928367, 1, 1, 1, 1, 1,
-0.1619064, 0.505503, 0.3034943, 1, 1, 1, 1, 1,
-0.1595805, -0.4745952, -2.495938, 1, 1, 1, 1, 1,
-0.1583734, 0.2298755, -0.4473574, 1, 1, 1, 1, 1,
-0.1547173, 1.170785, -0.05006852, 1, 1, 1, 1, 1,
-0.1532203, 0.6340193, -0.8776084, 1, 1, 1, 1, 1,
-0.1457638, 0.4969711, -0.1922985, 1, 1, 1, 1, 1,
-0.1418351, 0.4171011, -1.245965, 1, 1, 1, 1, 1,
-0.1414859, -0.5388991, -3.929656, 0, 0, 1, 1, 1,
-0.1397575, 0.7191853, 1.702116, 1, 0, 0, 1, 1,
-0.138654, 0.5872697, -1.195951, 1, 0, 0, 1, 1,
-0.1336854, -0.1860683, -0.6494849, 1, 0, 0, 1, 1,
-0.1327376, 0.8100781, 0.1528695, 1, 0, 0, 1, 1,
-0.1322265, 0.5488641, -0.03299649, 1, 0, 0, 1, 1,
-0.12967, -1.512672, -3.731163, 0, 0, 0, 1, 1,
-0.1294684, 0.4542726, -0.8410178, 0, 0, 0, 1, 1,
-0.1268596, 0.4634251, -0.3218258, 0, 0, 0, 1, 1,
-0.1265119, -0.2546595, -3.292516, 0, 0, 0, 1, 1,
-0.1249034, 0.706511, -1.249436, 0, 0, 0, 1, 1,
-0.1231257, 1.700742, -0.8727601, 0, 0, 0, 1, 1,
-0.1197614, -1.250125, -1.579967, 0, 0, 0, 1, 1,
-0.1194055, -1.020882, -3.569435, 1, 1, 1, 1, 1,
-0.1052795, -0.9550831, -5.182193, 1, 1, 1, 1, 1,
-0.1047974, 0.3393619, -2.721581, 1, 1, 1, 1, 1,
-0.1044536, 1.101725, 0.5374693, 1, 1, 1, 1, 1,
-0.1040308, 0.8191924, -0.3092634, 1, 1, 1, 1, 1,
-0.1027334, -0.1733565, -2.976227, 1, 1, 1, 1, 1,
-0.09838138, -0.759882, -2.285448, 1, 1, 1, 1, 1,
-0.09383854, 1.345827, -0.2537371, 1, 1, 1, 1, 1,
-0.08998105, -2.130399, -3.174658, 1, 1, 1, 1, 1,
-0.08943456, 0.09872121, -0.1375853, 1, 1, 1, 1, 1,
-0.08809821, -0.6955612, -3.754781, 1, 1, 1, 1, 1,
-0.08596671, 0.03563391, -0.1455694, 1, 1, 1, 1, 1,
-0.08387505, 0.04510912, -0.5836963, 1, 1, 1, 1, 1,
-0.08009612, -0.05568212, -2.13306, 1, 1, 1, 1, 1,
-0.07748532, 1.309786, -0.5203001, 1, 1, 1, 1, 1,
-0.07743151, -1.156791, -3.969092, 0, 0, 1, 1, 1,
-0.07653862, 1.353272, -0.454452, 1, 0, 0, 1, 1,
-0.07486279, 0.2519198, -2.00162, 1, 0, 0, 1, 1,
-0.07436508, 0.8072239, -0.4049121, 1, 0, 0, 1, 1,
-0.06832646, 0.3827063, -1.989736, 1, 0, 0, 1, 1,
-0.06560583, -0.3393918, -3.341743, 1, 0, 0, 1, 1,
-0.06544722, 0.4897636, 1.327649, 0, 0, 0, 1, 1,
-0.06465821, 0.3698865, 0.5335855, 0, 0, 0, 1, 1,
-0.05904095, 0.9634224, 1.70917, 0, 0, 0, 1, 1,
-0.05315077, -0.7755821, -3.022907, 0, 0, 0, 1, 1,
-0.05119525, -0.7504511, -2.590476, 0, 0, 0, 1, 1,
-0.0493223, 0.03066923, -1.809585, 0, 0, 0, 1, 1,
-0.04932182, -1.069281, -3.398379, 0, 0, 0, 1, 1,
-0.0476381, -0.6879121, -1.827395, 1, 1, 1, 1, 1,
-0.0417289, -0.4889061, -1.653691, 1, 1, 1, 1, 1,
-0.03945843, 1.095992, 0.3773721, 1, 1, 1, 1, 1,
-0.03879971, -0.01993637, -1.390431, 1, 1, 1, 1, 1,
-0.03265649, 1.770982, -0.9300087, 1, 1, 1, 1, 1,
-0.02781238, -1.120673, -2.906535, 1, 1, 1, 1, 1,
-0.02664027, -0.2285764, -6.198379, 1, 1, 1, 1, 1,
-0.02387301, 0.1728848, 0.555911, 1, 1, 1, 1, 1,
-0.02236273, -0.8817747, -3.867139, 1, 1, 1, 1, 1,
-0.0185793, 1.314755, -0.9770719, 1, 1, 1, 1, 1,
-0.01810026, 1.322663, -0.6409585, 1, 1, 1, 1, 1,
-0.01747863, -1.268917, -2.849265, 1, 1, 1, 1, 1,
-0.01565374, 0.4633583, -0.3927993, 1, 1, 1, 1, 1,
-0.01333359, -2.092536, -2.704799, 1, 1, 1, 1, 1,
-0.01065363, -1.16163, -3.061243, 1, 1, 1, 1, 1,
-0.0008843747, 1.187838, 0.836613, 0, 0, 1, 1, 1,
-0.0003629114, -0.3190765, -2.412913, 1, 0, 0, 1, 1,
0.0009430359, 0.3642957, 0.6643935, 1, 0, 0, 1, 1,
0.002342778, -0.4583202, 3.16939, 1, 0, 0, 1, 1,
0.003193631, -0.1279495, 0.9233218, 1, 0, 0, 1, 1,
0.005871579, -0.4125437, 3.109093, 1, 0, 0, 1, 1,
0.009831629, 0.5344906, 0.3627551, 0, 0, 0, 1, 1,
0.01231054, -1.377784, 3.23269, 0, 0, 0, 1, 1,
0.01536637, -0.3175533, 2.778841, 0, 0, 0, 1, 1,
0.01795528, 1.148097, -0.7263155, 0, 0, 0, 1, 1,
0.01848681, 0.4606177, -0.7158621, 0, 0, 0, 1, 1,
0.01936861, 0.3331625, 0.2110076, 0, 0, 0, 1, 1,
0.01998535, -3.212843, 1.182752, 0, 0, 0, 1, 1,
0.02412966, -1.52039, 3.208875, 1, 1, 1, 1, 1,
0.0266903, 2.028893, -1.470514, 1, 1, 1, 1, 1,
0.02985605, -0.08506892, 3.687433, 1, 1, 1, 1, 1,
0.03186493, -0.6704572, 2.532488, 1, 1, 1, 1, 1,
0.03213421, 0.3282816, -0.4967361, 1, 1, 1, 1, 1,
0.03497351, 1.633849, -1.826221, 1, 1, 1, 1, 1,
0.03572255, 1.172759, 1.141996, 1, 1, 1, 1, 1,
0.04129316, -0.5527957, 4.516526, 1, 1, 1, 1, 1,
0.0437545, 1.555783, 1.663182, 1, 1, 1, 1, 1,
0.04380862, 1.31508, -1.4034, 1, 1, 1, 1, 1,
0.04618128, 0.1929763, 0.6006764, 1, 1, 1, 1, 1,
0.04761558, 0.3841935, 0.04981691, 1, 1, 1, 1, 1,
0.05138855, 0.610672, 0.7641408, 1, 1, 1, 1, 1,
0.05368695, 1.598813, -0.4970361, 1, 1, 1, 1, 1,
0.05597398, 0.859816, 1.220989, 1, 1, 1, 1, 1,
0.0569342, -0.5119718, 1.908307, 0, 0, 1, 1, 1,
0.05928607, -0.5484658, 1.541254, 1, 0, 0, 1, 1,
0.06773224, 0.4346485, 0.6560168, 1, 0, 0, 1, 1,
0.07863694, 1.695011, -1.046659, 1, 0, 0, 1, 1,
0.07868937, 0.4278318, 1.579947, 1, 0, 0, 1, 1,
0.08156999, -1.590805, 2.921665, 1, 0, 0, 1, 1,
0.08371644, 0.1011805, 0.5585697, 0, 0, 0, 1, 1,
0.08756789, 0.06505901, 2.86214, 0, 0, 0, 1, 1,
0.08771908, 0.5137817, 1.649495, 0, 0, 0, 1, 1,
0.08893929, 0.6552073, -0.05059708, 0, 0, 0, 1, 1,
0.1015541, -1.544515, 3.081222, 0, 0, 0, 1, 1,
0.1031439, -1.175042, 4.858099, 0, 0, 0, 1, 1,
0.1063597, -0.1589085, 2.163572, 0, 0, 0, 1, 1,
0.1073822, 1.522713, -1.101336, 1, 1, 1, 1, 1,
0.1093142, 1.033671, 0.07165977, 1, 1, 1, 1, 1,
0.1116353, -0.3432209, 3.487724, 1, 1, 1, 1, 1,
0.1118619, 1.337174, -0.2292411, 1, 1, 1, 1, 1,
0.1200823, 0.5214044, -0.9680238, 1, 1, 1, 1, 1,
0.1229312, 0.2507853, 0.8457111, 1, 1, 1, 1, 1,
0.1282262, 0.6297709, -1.048205, 1, 1, 1, 1, 1,
0.1292013, -0.5448682, 3.54662, 1, 1, 1, 1, 1,
0.1306319, -0.6816285, 4.257162, 1, 1, 1, 1, 1,
0.1323849, 0.8887501, 1.228888, 1, 1, 1, 1, 1,
0.1340303, -0.3223769, 1.186776, 1, 1, 1, 1, 1,
0.1369777, -0.4504114, 3.248445, 1, 1, 1, 1, 1,
0.1386141, -1.235328, 2.456358, 1, 1, 1, 1, 1,
0.1462892, 1.913671, -1.533682, 1, 1, 1, 1, 1,
0.1464451, -0.02486779, 0.52031, 1, 1, 1, 1, 1,
0.1478626, 0.798119, 0.2562027, 0, 0, 1, 1, 1,
0.147974, 0.2774539, -1.118115, 1, 0, 0, 1, 1,
0.1532272, -0.195708, 1.605358, 1, 0, 0, 1, 1,
0.1543463, -0.8091446, 2.973295, 1, 0, 0, 1, 1,
0.1550326, -0.06897584, 1.744202, 1, 0, 0, 1, 1,
0.1567646, 0.721855, 1.281539, 1, 0, 0, 1, 1,
0.1567886, -1.128994, 2.724609, 0, 0, 0, 1, 1,
0.1568561, 1.433829, -0.8357042, 0, 0, 0, 1, 1,
0.1599149, -0.2091687, 3.182234, 0, 0, 0, 1, 1,
0.1704102, -3.054161, 1.501751, 0, 0, 0, 1, 1,
0.1712663, 0.2707785, 1.090531, 0, 0, 0, 1, 1,
0.1719681, 0.3608293, 0.9631607, 0, 0, 0, 1, 1,
0.1725555, -2.075784, 2.100371, 0, 0, 0, 1, 1,
0.1756915, -0.2492225, 1.731487, 1, 1, 1, 1, 1,
0.1788645, 0.9242363, 1.023913, 1, 1, 1, 1, 1,
0.1792986, 2.320731, -0.947655, 1, 1, 1, 1, 1,
0.1819796, -0.7007632, 2.655257, 1, 1, 1, 1, 1,
0.1824606, 0.4412351, -1.756146, 1, 1, 1, 1, 1,
0.1826394, 0.04399745, 2.39204, 1, 1, 1, 1, 1,
0.1833844, 0.63162, -0.5566773, 1, 1, 1, 1, 1,
0.1872702, 0.7214369, 0.01308907, 1, 1, 1, 1, 1,
0.18839, 0.316304, -1.75523, 1, 1, 1, 1, 1,
0.19093, -1.416979, 4.47188, 1, 1, 1, 1, 1,
0.1951063, 0.7880173, -0.4327295, 1, 1, 1, 1, 1,
0.1961093, -0.6845684, 2.488411, 1, 1, 1, 1, 1,
0.196737, 0.1502507, 2.254195, 1, 1, 1, 1, 1,
0.2015427, -1.664255, 4.712753, 1, 1, 1, 1, 1,
0.2070781, 0.4123177, -1.328888, 1, 1, 1, 1, 1,
0.2157511, -1.610621, 2.145368, 0, 0, 1, 1, 1,
0.2160393, 1.169926, 1.232683, 1, 0, 0, 1, 1,
0.2161181, -0.8338774, 3.841573, 1, 0, 0, 1, 1,
0.2168283, 0.4197351, 0.7781777, 1, 0, 0, 1, 1,
0.2183638, 0.2022564, 1.710735, 1, 0, 0, 1, 1,
0.2192235, 0.7123445, 0.96584, 1, 0, 0, 1, 1,
0.2262859, -1.964544, 2.312011, 0, 0, 0, 1, 1,
0.2423363, -0.0004250843, 1.132268, 0, 0, 0, 1, 1,
0.2426671, 0.07563334, 0.8580579, 0, 0, 0, 1, 1,
0.2470076, 3.06567, -0.7585338, 0, 0, 0, 1, 1,
0.2565675, -0.3481183, 1.993575, 0, 0, 0, 1, 1,
0.2617143, -0.6096762, 0.5380493, 0, 0, 0, 1, 1,
0.2621075, -2.000664, 2.178728, 0, 0, 0, 1, 1,
0.2622103, -1.354417, 2.37642, 1, 1, 1, 1, 1,
0.2699772, 1.405877, 0.7144102, 1, 1, 1, 1, 1,
0.2713288, -1.159815, 2.569085, 1, 1, 1, 1, 1,
0.2831964, 0.3301338, 2.547614, 1, 1, 1, 1, 1,
0.2851996, -0.1859333, 0.5403967, 1, 1, 1, 1, 1,
0.2867641, 0.400216, 2.83013, 1, 1, 1, 1, 1,
0.2871979, -1.006612, 2.212591, 1, 1, 1, 1, 1,
0.2924131, -1.716522, 1.333692, 1, 1, 1, 1, 1,
0.2935138, 0.381772, -0.8021866, 1, 1, 1, 1, 1,
0.2981753, 1.26511, -0.5566995, 1, 1, 1, 1, 1,
0.3033439, 1.772095, -0.003541635, 1, 1, 1, 1, 1,
0.3038324, 0.182803, 2.724107, 1, 1, 1, 1, 1,
0.307245, 0.2170504, 1.676018, 1, 1, 1, 1, 1,
0.3104907, -1.070793, 2.396094, 1, 1, 1, 1, 1,
0.3120483, 0.3668496, -0.6008247, 1, 1, 1, 1, 1,
0.313844, 0.08081611, 1.418266, 0, 0, 1, 1, 1,
0.3142066, 0.2129863, 1.341689, 1, 0, 0, 1, 1,
0.3157634, -0.7054078, 3.969016, 1, 0, 0, 1, 1,
0.3191652, -0.4419449, 2.665931, 1, 0, 0, 1, 1,
0.3204399, -0.1271178, 2.277817, 1, 0, 0, 1, 1,
0.3262419, 1.076635, -1.683408, 1, 0, 0, 1, 1,
0.3265393, -0.4174005, 2.442207, 0, 0, 0, 1, 1,
0.32734, 0.5419466, 0.8227044, 0, 0, 0, 1, 1,
0.3321709, 1.478027, -0.8028306, 0, 0, 0, 1, 1,
0.3327444, -1.632219, 2.124713, 0, 0, 0, 1, 1,
0.3367071, 0.5914753, -1.534496, 0, 0, 0, 1, 1,
0.3370526, 0.0007269433, 1.496539, 0, 0, 0, 1, 1,
0.3415192, -0.5468001, 2.832257, 0, 0, 0, 1, 1,
0.3440863, 0.9510404, -1.577149, 1, 1, 1, 1, 1,
0.3466062, -1.196373, 3.56038, 1, 1, 1, 1, 1,
0.3471952, 1.277199, 1.470237, 1, 1, 1, 1, 1,
0.3536676, -1.122992, 0.3857843, 1, 1, 1, 1, 1,
0.3552699, -1.444731, 2.863377, 1, 1, 1, 1, 1,
0.3563162, 0.1462301, 0.9690019, 1, 1, 1, 1, 1,
0.3607236, -0.6229959, 2.915188, 1, 1, 1, 1, 1,
0.3613697, -0.6719365, 1.852693, 1, 1, 1, 1, 1,
0.3663234, 0.6810212, 1.181131, 1, 1, 1, 1, 1,
0.3672686, 2.057053, 0.4325478, 1, 1, 1, 1, 1,
0.3697107, 0.07679128, 2.484336, 1, 1, 1, 1, 1,
0.3717197, -0.05980617, 2.39202, 1, 1, 1, 1, 1,
0.3791061, 1.08958, 1.093408, 1, 1, 1, 1, 1,
0.3817536, -0.1955089, 3.033646, 1, 1, 1, 1, 1,
0.3871535, -1.335209, 1.564967, 1, 1, 1, 1, 1,
0.3875668, -0.1268158, 2.777618, 0, 0, 1, 1, 1,
0.3909536, -0.856301, 3.334334, 1, 0, 0, 1, 1,
0.394368, 0.2021384, -0.1926183, 1, 0, 0, 1, 1,
0.3945711, 1.198673, -0.3932467, 1, 0, 0, 1, 1,
0.4030258, -0.08215278, 2.796539, 1, 0, 0, 1, 1,
0.4045925, -0.01178043, 1.597751, 1, 0, 0, 1, 1,
0.4053992, 0.7509081, -0.2389781, 0, 0, 0, 1, 1,
0.4054775, 1.764938, 0.2879799, 0, 0, 0, 1, 1,
0.4054971, -0.8250487, 2.259783, 0, 0, 0, 1, 1,
0.4057522, 0.5204449, 0.6493304, 0, 0, 0, 1, 1,
0.4084923, -0.1203932, 1.833684, 0, 0, 0, 1, 1,
0.4093197, -1.43778, 1.778075, 0, 0, 0, 1, 1,
0.4096487, -0.8153412, 1.532054, 0, 0, 0, 1, 1,
0.4202664, -0.4056588, 2.108555, 1, 1, 1, 1, 1,
0.4210206, 0.5541458, 1.363772, 1, 1, 1, 1, 1,
0.4249995, 0.8216838, 1.161461, 1, 1, 1, 1, 1,
0.4287132, -0.7573934, 3.148996, 1, 1, 1, 1, 1,
0.4303424, 0.09813169, 0.06629672, 1, 1, 1, 1, 1,
0.4303707, 0.2879226, -0.1301602, 1, 1, 1, 1, 1,
0.4310163, -0.688625, 3.497169, 1, 1, 1, 1, 1,
0.431573, 0.5938204, 0.2841638, 1, 1, 1, 1, 1,
0.4330693, -2.008332, 2.091042, 1, 1, 1, 1, 1,
0.4357638, -0.5018461, 2.280641, 1, 1, 1, 1, 1,
0.4358214, -0.5949737, 1.169724, 1, 1, 1, 1, 1,
0.4402966, 1.113986, 1.095247, 1, 1, 1, 1, 1,
0.4435159, 0.3441295, 0.9823925, 1, 1, 1, 1, 1,
0.4456878, -0.5297526, 2.050927, 1, 1, 1, 1, 1,
0.4493239, 0.4131597, 1.198282, 1, 1, 1, 1, 1,
0.4573476, 1.276078, 0.953705, 0, 0, 1, 1, 1,
0.4577918, 1.178362, -1.356293, 1, 0, 0, 1, 1,
0.4612488, 0.6128778, 0.2461326, 1, 0, 0, 1, 1,
0.463114, 0.9961181, 1.045538, 1, 0, 0, 1, 1,
0.463488, 0.6897466, 0.2539715, 1, 0, 0, 1, 1,
0.4635423, 0.8269091, -0.5448033, 1, 0, 0, 1, 1,
0.4645348, -0.08240565, 1.634442, 0, 0, 0, 1, 1,
0.4669457, 2.31709, -1.04203, 0, 0, 0, 1, 1,
0.4708531, -1.003467, 3.779413, 0, 0, 0, 1, 1,
0.4710529, 1.323305, 0.8310982, 0, 0, 0, 1, 1,
0.4713168, -0.3451295, 1.804689, 0, 0, 0, 1, 1,
0.474559, 0.7908695, 1.071128, 0, 0, 0, 1, 1,
0.4778546, 0.6357426, 2.189252, 0, 0, 0, 1, 1,
0.4787734, -0.2052393, 2.053314, 1, 1, 1, 1, 1,
0.4800823, -0.619337, 2.914062, 1, 1, 1, 1, 1,
0.4842635, 0.1803896, 1.546825, 1, 1, 1, 1, 1,
0.4871006, -2.223792, 2.892088, 1, 1, 1, 1, 1,
0.4907802, -0.9418629, 2.747343, 1, 1, 1, 1, 1,
0.4937467, 0.4234156, 0.3721762, 1, 1, 1, 1, 1,
0.4976052, 2.025489, 0.06107686, 1, 1, 1, 1, 1,
0.4989168, 1.26056, -0.4684245, 1, 1, 1, 1, 1,
0.5010515, 0.5862711, 0.08885115, 1, 1, 1, 1, 1,
0.5030999, -0.5625593, 2.401174, 1, 1, 1, 1, 1,
0.5090206, -0.9847255, 2.571948, 1, 1, 1, 1, 1,
0.5168336, 0.3271441, 1.034223, 1, 1, 1, 1, 1,
0.5170411, 0.1733506, 0.09968975, 1, 1, 1, 1, 1,
0.5172084, -1.011875, 4.276566, 1, 1, 1, 1, 1,
0.5183745, 0.2189285, 1.369405, 1, 1, 1, 1, 1,
0.5190274, 0.1521881, -0.1879301, 0, 0, 1, 1, 1,
0.5209139, 0.3119601, -0.2746457, 1, 0, 0, 1, 1,
0.522325, 1.237544, -0.1510558, 1, 0, 0, 1, 1,
0.5230011, 1.011742, 2.052155, 1, 0, 0, 1, 1,
0.5262815, 0.03752251, 0.4155887, 1, 0, 0, 1, 1,
0.5308173, -2.993425, 3.172767, 1, 0, 0, 1, 1,
0.5403479, -1.48857, 2.915295, 0, 0, 0, 1, 1,
0.5413908, -0.7434469, 3.129547, 0, 0, 0, 1, 1,
0.546732, 0.3114042, -0.4362002, 0, 0, 0, 1, 1,
0.5513416, -1.763103, 2.32199, 0, 0, 0, 1, 1,
0.5518878, 0.3988769, 1.131692, 0, 0, 0, 1, 1,
0.5531107, -0.3837954, 1.965602, 0, 0, 0, 1, 1,
0.5533622, 0.51095, 0.09543672, 0, 0, 0, 1, 1,
0.5619769, -1.131943, 2.745928, 1, 1, 1, 1, 1,
0.5629231, 2.681365, -0.137077, 1, 1, 1, 1, 1,
0.5630724, -0.3983852, 2.454463, 1, 1, 1, 1, 1,
0.5644552, -0.02616778, 1.410135, 1, 1, 1, 1, 1,
0.5737538, -0.3727266, 2.087937, 1, 1, 1, 1, 1,
0.5782738, -0.01279014, 2.463883, 1, 1, 1, 1, 1,
0.5796489, 0.8641461, -0.2486028, 1, 1, 1, 1, 1,
0.5830441, 1.570698, 1.431821, 1, 1, 1, 1, 1,
0.5846985, -0.1620431, 1.448677, 1, 1, 1, 1, 1,
0.5850198, 1.233693, 0.01991757, 1, 1, 1, 1, 1,
0.5883306, -0.5322143, 2.397708, 1, 1, 1, 1, 1,
0.5896544, 0.7835244, 2.534953, 1, 1, 1, 1, 1,
0.5925658, -1.147895, 3.457163, 1, 1, 1, 1, 1,
0.5926323, -1.043998, 3.407057, 1, 1, 1, 1, 1,
0.5940844, 0.09332918, 0.08520517, 1, 1, 1, 1, 1,
0.5943706, 0.6547295, 0.4184614, 0, 0, 1, 1, 1,
0.5977588, 1.052531, -0.4844451, 1, 0, 0, 1, 1,
0.5982944, 0.3226713, 0.3696024, 1, 0, 0, 1, 1,
0.6003484, -0.2184908, 1.911239, 1, 0, 0, 1, 1,
0.6011293, 0.03203731, 1.457518, 1, 0, 0, 1, 1,
0.606134, -0.6889418, 2.173932, 1, 0, 0, 1, 1,
0.6099114, 1.530658, 2.598154, 0, 0, 0, 1, 1,
0.6108635, -1.886913, 2.211829, 0, 0, 0, 1, 1,
0.6199512, -0.6149689, 2.946048, 0, 0, 0, 1, 1,
0.6224316, 0.1190156, 0.6227897, 0, 0, 0, 1, 1,
0.6224734, -0.5488995, 0.9285489, 0, 0, 0, 1, 1,
0.6247162, -0.2885787, 3.146066, 0, 0, 0, 1, 1,
0.6294164, 0.2199614, 1.863498, 0, 0, 0, 1, 1,
0.6322951, -1.177841, 4.029781, 1, 1, 1, 1, 1,
0.64879, 0.2582299, 1.192894, 1, 1, 1, 1, 1,
0.6504558, 0.6354377, 1.123736, 1, 1, 1, 1, 1,
0.6507553, 1.634223, -0.004291527, 1, 1, 1, 1, 1,
0.6584409, -2.795114, 2.51185, 1, 1, 1, 1, 1,
0.6636288, -0.7157203, 1.684696, 1, 1, 1, 1, 1,
0.6666004, 1.046014, 0.7775694, 1, 1, 1, 1, 1,
0.6710806, 0.8877696, -1.156777, 1, 1, 1, 1, 1,
0.6716079, -1.434746, 2.45348, 1, 1, 1, 1, 1,
0.6728338, -0.308164, 0.1846925, 1, 1, 1, 1, 1,
0.6785046, -0.6213396, 4.345919, 1, 1, 1, 1, 1,
0.6802859, 0.8321665, 2.191021, 1, 1, 1, 1, 1,
0.692306, -1.049089, 1.363644, 1, 1, 1, 1, 1,
0.696188, 0.1180323, 0.8192345, 1, 1, 1, 1, 1,
0.6965377, 2.169841, 0.9293917, 1, 1, 1, 1, 1,
0.7114128, 0.9227312, -1.42262, 0, 0, 1, 1, 1,
0.7117089, -0.0519167, 1.098367, 1, 0, 0, 1, 1,
0.7117091, -0.8046266, 3.291713, 1, 0, 0, 1, 1,
0.7148394, -1.407824, 0.9445881, 1, 0, 0, 1, 1,
0.717182, -0.5091277, 3.039326, 1, 0, 0, 1, 1,
0.7205522, 0.0332156, 1.317238, 1, 0, 0, 1, 1,
0.7301849, 0.8029106, 1.652301, 0, 0, 0, 1, 1,
0.7354326, -1.788641, 1.953283, 0, 0, 0, 1, 1,
0.7402756, 2.163441, -0.05168204, 0, 0, 0, 1, 1,
0.7405854, 0.6309053, -0.8941281, 0, 0, 0, 1, 1,
0.744135, 1.860283, 1.254191, 0, 0, 0, 1, 1,
0.745919, 0.2320108, 1.203091, 0, 0, 0, 1, 1,
0.7486573, -0.1434325, 0.02115674, 0, 0, 0, 1, 1,
0.7558203, -0.2691334, 2.93091, 1, 1, 1, 1, 1,
0.7615893, 0.9913083, -0.390755, 1, 1, 1, 1, 1,
0.7626117, 1.341767, -1.479955, 1, 1, 1, 1, 1,
0.7630668, -0.1222579, 1.943296, 1, 1, 1, 1, 1,
0.7646194, -0.514035, 2.040387, 1, 1, 1, 1, 1,
0.7663418, -1.927572, 2.530934, 1, 1, 1, 1, 1,
0.7682239, -0.2232664, 3.539036, 1, 1, 1, 1, 1,
0.7719903, 0.5651899, 2.092262, 1, 1, 1, 1, 1,
0.7776897, -0.500293, 1.878596, 1, 1, 1, 1, 1,
0.780184, -0.4327509, 3.846179, 1, 1, 1, 1, 1,
0.7830156, -0.1839145, 0.8100258, 1, 1, 1, 1, 1,
0.7871829, -0.2646677, 1.993393, 1, 1, 1, 1, 1,
0.789579, 0.995011, 0.4262074, 1, 1, 1, 1, 1,
0.7930366, -0.4017615, 0.6239353, 1, 1, 1, 1, 1,
0.7944252, -0.5960351, 2.582759, 1, 1, 1, 1, 1,
0.7945852, 0.784161, 1.433823, 0, 0, 1, 1, 1,
0.8017925, -0.667582, 2.457381, 1, 0, 0, 1, 1,
0.8038295, 0.4262044, -0.5081929, 1, 0, 0, 1, 1,
0.8070982, -0.5496058, 1.220387, 1, 0, 0, 1, 1,
0.8073366, 0.1416418, 1.672944, 1, 0, 0, 1, 1,
0.8083159, -1.596376, 1.774465, 1, 0, 0, 1, 1,
0.814387, 2.039303, -1.33066, 0, 0, 0, 1, 1,
0.8163007, -0.02191462, 0.7849603, 0, 0, 0, 1, 1,
0.8163245, -1.239847, 3.483721, 0, 0, 0, 1, 1,
0.8167984, 1.936908, 0.4188316, 0, 0, 0, 1, 1,
0.8171297, 0.1070688, 0.7164581, 0, 0, 0, 1, 1,
0.8196967, -0.5050868, 1.853385, 0, 0, 0, 1, 1,
0.8226882, 0.5219339, 1.675028, 0, 0, 0, 1, 1,
0.8260938, -0.5599047, 1.413532, 1, 1, 1, 1, 1,
0.8344528, -0.6448154, 2.738554, 1, 1, 1, 1, 1,
0.8347354, -1.45286, 1.989796, 1, 1, 1, 1, 1,
0.8497512, 0.1628966, 3.112133, 1, 1, 1, 1, 1,
0.8561857, -0.2506157, 2.274491, 1, 1, 1, 1, 1,
0.8587661, 0.2123393, 2.845747, 1, 1, 1, 1, 1,
0.860912, -1.208151, 1.888382, 1, 1, 1, 1, 1,
0.880019, 0.6068892, 2.885666, 1, 1, 1, 1, 1,
0.882037, 0.0456738, 1.149534, 1, 1, 1, 1, 1,
0.8823634, 0.001775938, 1.735999, 1, 1, 1, 1, 1,
0.8924034, 1.582036, 2.345343, 1, 1, 1, 1, 1,
0.894228, 0.574182, 1.400241, 1, 1, 1, 1, 1,
0.8950691, -0.2766283, 2.628877, 1, 1, 1, 1, 1,
0.8962963, 0.4707507, 2.085046, 1, 1, 1, 1, 1,
0.8965477, 2.294699, 0.5945697, 1, 1, 1, 1, 1,
0.8987207, -0.6474084, 4.361115, 0, 0, 1, 1, 1,
0.8992401, -0.4200952, 1.240247, 1, 0, 0, 1, 1,
0.906837, 0.7818652, 0.4870173, 1, 0, 0, 1, 1,
0.9100319, 0.5319138, 1.298966, 1, 0, 0, 1, 1,
0.9129565, -0.4636439, 1.192614, 1, 0, 0, 1, 1,
0.9142003, 0.3614542, 1.844222, 1, 0, 0, 1, 1,
0.916618, -0.2284411, 1.453767, 0, 0, 0, 1, 1,
0.9329847, 0.7554205, 1.696766, 0, 0, 0, 1, 1,
0.9348743, 0.2214176, 0.4691432, 0, 0, 0, 1, 1,
0.943009, -0.3828841, 3.982594, 0, 0, 0, 1, 1,
0.9463217, -1.796021, 3.766472, 0, 0, 0, 1, 1,
0.9476392, 0.3327214, 2.249972, 0, 0, 0, 1, 1,
0.9500664, 1.083952, -0.6191352, 0, 0, 0, 1, 1,
0.9603983, 1.04101, -0.9653282, 1, 1, 1, 1, 1,
0.9685218, -1.983257, 1.008209, 1, 1, 1, 1, 1,
0.9717263, -1.125864, 3.497941, 1, 1, 1, 1, 1,
0.9742348, -0.1865843, 1.879774, 1, 1, 1, 1, 1,
0.9743339, -0.9622231, 1.657846, 1, 1, 1, 1, 1,
0.9765075, -0.4768364, 0.9061053, 1, 1, 1, 1, 1,
0.9773384, 0.9558451, 1.480449, 1, 1, 1, 1, 1,
0.9791141, -0.3861538, 1.057597, 1, 1, 1, 1, 1,
0.9868236, 0.2648923, 0.5829723, 1, 1, 1, 1, 1,
0.9917581, -0.6528123, 1.351328, 1, 1, 1, 1, 1,
0.9926919, -0.2419697, 1.889323, 1, 1, 1, 1, 1,
0.9952083, 0.2512378, 0.7626898, 1, 1, 1, 1, 1,
0.9989949, 0.07633178, 2.449471, 1, 1, 1, 1, 1,
1.00018, 0.606036, -0.2421709, 1, 1, 1, 1, 1,
1.001778, -0.578815, 2.082557, 1, 1, 1, 1, 1,
1.009632, 1.433342, -0.8599379, 0, 0, 1, 1, 1,
1.011729, 0.7242277, 0.823988, 1, 0, 0, 1, 1,
1.018525, -0.5217577, 3.049865, 1, 0, 0, 1, 1,
1.01854, -0.6824323, 3.054908, 1, 0, 0, 1, 1,
1.019238, -0.5093166, 3.375659, 1, 0, 0, 1, 1,
1.021096, -0.1992916, 1.193388, 1, 0, 0, 1, 1,
1.022367, -2.121701, 1.812603, 0, 0, 0, 1, 1,
1.024832, -0.111671, 0.946512, 0, 0, 0, 1, 1,
1.0277, 1.287989, 0.7578912, 0, 0, 0, 1, 1,
1.029985, 0.6109064, 2.416634, 0, 0, 0, 1, 1,
1.034747, 0.423755, 0.2064054, 0, 0, 0, 1, 1,
1.035266, 0.5090203, 1.309792, 0, 0, 0, 1, 1,
1.039988, -1.236039, 3.249679, 0, 0, 0, 1, 1,
1.041693, 0.7255208, 1.481962, 1, 1, 1, 1, 1,
1.046768, -0.8906918, 1.50984, 1, 1, 1, 1, 1,
1.058403, 0.6367992, 0.6520104, 1, 1, 1, 1, 1,
1.060368, 0.9784303, 1.033047, 1, 1, 1, 1, 1,
1.061206, 0.7733339, 3.064325, 1, 1, 1, 1, 1,
1.06146, -1.845732, 4.644621, 1, 1, 1, 1, 1,
1.06417, 0.4363521, 2.736004, 1, 1, 1, 1, 1,
1.064726, -1.180513, 2.099192, 1, 1, 1, 1, 1,
1.082264, -0.165216, 2.035797, 1, 1, 1, 1, 1,
1.083476, 0.8797282, 0.819604, 1, 1, 1, 1, 1,
1.084232, 1.867267, -1.116188, 1, 1, 1, 1, 1,
1.097397, 1.394012, 1.345707, 1, 1, 1, 1, 1,
1.099792, -0.2229338, 2.90588, 1, 1, 1, 1, 1,
1.101673, 2.326985, 2.472533, 1, 1, 1, 1, 1,
1.103423, 0.7805572, 0.5292626, 1, 1, 1, 1, 1,
1.114101, 0.9211069, 1.12317, 0, 0, 1, 1, 1,
1.126485, 0.4194147, 1.73322, 1, 0, 0, 1, 1,
1.127961, 0.5887929, 0.3976667, 1, 0, 0, 1, 1,
1.134371, -0.9218255, 2.342805, 1, 0, 0, 1, 1,
1.138623, 1.193362, 2.20947, 1, 0, 0, 1, 1,
1.144887, -0.02780168, -1.45344, 1, 0, 0, 1, 1,
1.146408, 0.07232495, 1.941592, 0, 0, 0, 1, 1,
1.153936, 1.643291, 0.1867825, 0, 0, 0, 1, 1,
1.157474, 1.80734, 1.450873, 0, 0, 0, 1, 1,
1.161643, -0.3704438, 2.543753, 0, 0, 0, 1, 1,
1.162861, 0.3393112, 0.3474043, 0, 0, 0, 1, 1,
1.179099, 0.3043301, 0.3000729, 0, 0, 0, 1, 1,
1.192711, 0.9335084, 1.386786, 0, 0, 0, 1, 1,
1.193118, -0.2619646, 2.579877, 1, 1, 1, 1, 1,
1.195338, -0.05786541, 1.014912, 1, 1, 1, 1, 1,
1.195988, 0.9389348, 2.232201, 1, 1, 1, 1, 1,
1.201957, 0.1853827, -0.1899105, 1, 1, 1, 1, 1,
1.215283, -2.011328, 2.921615, 1, 1, 1, 1, 1,
1.221504, -0.0323296, 2.488369, 1, 1, 1, 1, 1,
1.225582, 1.030818, 0.4695463, 1, 1, 1, 1, 1,
1.226077, -0.2097605, 0.3532305, 1, 1, 1, 1, 1,
1.229682, 0.1617936, 1.166006, 1, 1, 1, 1, 1,
1.231391, 0.7105182, 3.196208, 1, 1, 1, 1, 1,
1.236433, -0.2302536, 1.159353, 1, 1, 1, 1, 1,
1.243143, 1.012435, 0.1215273, 1, 1, 1, 1, 1,
1.254712, 0.2354919, 0.1577074, 1, 1, 1, 1, 1,
1.256256, -1.428295, 1.687711, 1, 1, 1, 1, 1,
1.271892, 0.6705961, 0.370555, 1, 1, 1, 1, 1,
1.286072, -1.310978, 1.484504, 0, 0, 1, 1, 1,
1.288141, 0.1978652, 2.41452, 1, 0, 0, 1, 1,
1.297047, 1.654426, -0.520763, 1, 0, 0, 1, 1,
1.304805, -1.995181, 3.322124, 1, 0, 0, 1, 1,
1.309666, 0.2435711, 2.737949, 1, 0, 0, 1, 1,
1.312387, -0.04348325, 1.715521, 1, 0, 0, 1, 1,
1.3139, -1.838609, 2.427142, 0, 0, 0, 1, 1,
1.314144, 0.453081, 2.186696, 0, 0, 0, 1, 1,
1.320571, 1.056256, 0.7074255, 0, 0, 0, 1, 1,
1.321531, -0.6546235, 1.189229, 0, 0, 0, 1, 1,
1.322218, 1.375705, 1.989749, 0, 0, 0, 1, 1,
1.323886, 0.8402705, 3.479124, 0, 0, 0, 1, 1,
1.347698, 1.084839, 2.100125, 0, 0, 0, 1, 1,
1.370248, 0.4407897, 1.256586, 1, 1, 1, 1, 1,
1.371594, 0.1325642, 2.526382, 1, 1, 1, 1, 1,
1.384791, -0.2464508, 1.890935, 1, 1, 1, 1, 1,
1.384828, 1.477992, -0.7553976, 1, 1, 1, 1, 1,
1.385203, -1.141862, 2.788293, 1, 1, 1, 1, 1,
1.389418, -1.235551, 2.59853, 1, 1, 1, 1, 1,
1.393299, -1.357508, 2.594776, 1, 1, 1, 1, 1,
1.394174, 0.2488692, 1.046383, 1, 1, 1, 1, 1,
1.399242, 0.05312901, 1.940878, 1, 1, 1, 1, 1,
1.400185, -0.3884833, 3.804471, 1, 1, 1, 1, 1,
1.414442, -1.051673, 4.271976, 1, 1, 1, 1, 1,
1.418921, -1.658295, 2.066093, 1, 1, 1, 1, 1,
1.420634, -0.3030545, 0.9019978, 1, 1, 1, 1, 1,
1.428452, -0.1557897, 2.432897, 1, 1, 1, 1, 1,
1.433156, 0.3360246, -0.2065635, 1, 1, 1, 1, 1,
1.443167, -0.3665652, 0.6481923, 0, 0, 1, 1, 1,
1.45307, 0.2888877, 0.04461976, 1, 0, 0, 1, 1,
1.474798, 0.8193321, 0.7116684, 1, 0, 0, 1, 1,
1.476147, 1.22823, 2.777609, 1, 0, 0, 1, 1,
1.482004, -1.061903, 1.368544, 1, 0, 0, 1, 1,
1.491049, -0.1052153, 2.055565, 1, 0, 0, 1, 1,
1.506095, -0.9744893, 1.479903, 0, 0, 0, 1, 1,
1.528996, 0.08109703, 0.463485, 0, 0, 0, 1, 1,
1.537247, 0.3734173, 0.7231982, 0, 0, 0, 1, 1,
1.54146, 0.6513656, -0.8466155, 0, 0, 0, 1, 1,
1.555864, -0.3076986, 2.458959, 0, 0, 0, 1, 1,
1.571686, 0.5627915, 2.259722, 0, 0, 0, 1, 1,
1.575349, -1.003385, 0.640618, 0, 0, 0, 1, 1,
1.576842, -1.022097, 2.512398, 1, 1, 1, 1, 1,
1.583957, 1.230282, -0.089446, 1, 1, 1, 1, 1,
1.585056, 0.1409599, 2.570967, 1, 1, 1, 1, 1,
1.592732, -0.4714141, 1.25917, 1, 1, 1, 1, 1,
1.60016, -1.074194, 0.490416, 1, 1, 1, 1, 1,
1.605474, 0.4067403, 3.055637, 1, 1, 1, 1, 1,
1.609335, 1.577408, 1.348886, 1, 1, 1, 1, 1,
1.6136, 1.588214, -0.276059, 1, 1, 1, 1, 1,
1.613634, 1.05031, -0.6353466, 1, 1, 1, 1, 1,
1.637946, -1.05015, 1.563475, 1, 1, 1, 1, 1,
1.650102, -0.3055673, 2.955508, 1, 1, 1, 1, 1,
1.662822, -1.679597, 2.174792, 1, 1, 1, 1, 1,
1.667977, 0.3630808, 2.122964, 1, 1, 1, 1, 1,
1.669713, 0.5414538, 1.686238, 1, 1, 1, 1, 1,
1.670132, 0.4610665, 1.162799, 1, 1, 1, 1, 1,
1.681399, -2.405374, 1.931641, 0, 0, 1, 1, 1,
1.683972, 1.292888, 1.635677, 1, 0, 0, 1, 1,
1.688039, 0.3520194, 0.4388808, 1, 0, 0, 1, 1,
1.690276, 0.4902655, 1.951267, 1, 0, 0, 1, 1,
1.722329, 0.7419558, 0.3328601, 1, 0, 0, 1, 1,
1.726856, 0.5558657, 0.5513982, 1, 0, 0, 1, 1,
1.736148, -1.039751, 2.863455, 0, 0, 0, 1, 1,
1.739504, 0.8664916, 0.4043667, 0, 0, 0, 1, 1,
1.75442, 0.6402752, -0.1153512, 0, 0, 0, 1, 1,
1.75823, 0.8246884, 1.427913, 0, 0, 0, 1, 1,
1.760997, -0.3946631, 1.843461, 0, 0, 0, 1, 1,
1.763561, 1.011703, 2.659342, 0, 0, 0, 1, 1,
1.765008, 0.7698784, 1.406096, 0, 0, 0, 1, 1,
1.777195, 0.2768279, 0.4454722, 1, 1, 1, 1, 1,
1.792753, 0.7108141, 1.056086, 1, 1, 1, 1, 1,
1.794965, 0.5281219, 0.2111914, 1, 1, 1, 1, 1,
1.80633, -0.8848732, 0.5774334, 1, 1, 1, 1, 1,
1.824538, -0.4766767, 1.301, 1, 1, 1, 1, 1,
1.840862, -0.9479256, 1.370298, 1, 1, 1, 1, 1,
1.850213, 1.843522, -0.08541477, 1, 1, 1, 1, 1,
1.894994, 0.01954536, 0.4508829, 1, 1, 1, 1, 1,
1.91501, 0.002399054, 0.2673528, 1, 1, 1, 1, 1,
1.941156, -0.2676779, 2.070452, 1, 1, 1, 1, 1,
1.951514, -0.9793358, 1.858531, 1, 1, 1, 1, 1,
1.964286, -0.1608201, 3.679109, 1, 1, 1, 1, 1,
1.994049, -2.033421, 3.603146, 1, 1, 1, 1, 1,
2.007024, -0.4573789, 1.732108, 1, 1, 1, 1, 1,
2.042385, 0.2379331, 0.4432167, 1, 1, 1, 1, 1,
2.075832, 1.63238, 1.317377, 0, 0, 1, 1, 1,
2.097656, 0.6820168, 2.049161, 1, 0, 0, 1, 1,
2.114133, 0.1203817, 2.626282, 1, 0, 0, 1, 1,
2.118313, -1.39768, 4.662006, 1, 0, 0, 1, 1,
2.141111, -0.3345965, 0.3608943, 1, 0, 0, 1, 1,
2.156703, 0.659431, 0.2572512, 1, 0, 0, 1, 1,
2.214544, 0.2758152, 2.463047, 0, 0, 0, 1, 1,
2.354989, 0.3468521, 3.265601, 0, 0, 0, 1, 1,
2.393131, -1.975469, 2.441992, 0, 0, 0, 1, 1,
2.402752, -0.9863331, 2.717168, 0, 0, 0, 1, 1,
2.418527, 2.710659, 2.150561, 0, 0, 0, 1, 1,
2.429663, 0.8905262, 1.209897, 0, 0, 0, 1, 1,
2.474568, -0.8484609, 1.22762, 0, 0, 0, 1, 1,
2.572977, 1.278254, 0.3895967, 1, 1, 1, 1, 1,
2.574537, -0.77727, 3.271348, 1, 1, 1, 1, 1,
2.805449, -0.2372503, 1.132145, 1, 1, 1, 1, 1,
2.87857, 0.5980443, 0.6633082, 1, 1, 1, 1, 1,
2.96706, 0.1816696, 1.626006, 1, 1, 1, 1, 1,
3.160551, -0.02067138, 1.429108, 1, 1, 1, 1, 1,
3.453226, -0.9318972, 0.67, 1, 1, 1, 1, 1
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
var radius = 10.10713;
var distance = 35.50086;
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
mvMatrix.translate( 0.1186621, 0.08063745, 0.67014 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.50086);
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
