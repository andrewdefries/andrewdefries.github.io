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
-2.940506, 0.1470794, -1.483628, 1, 0, 0, 1,
-2.780496, -1.633059, -0.9861914, 1, 0.007843138, 0, 1,
-2.494167, 0.2336424, -0.6446459, 1, 0.01176471, 0, 1,
-2.416393, -0.288309, -3.368899, 1, 0.01960784, 0, 1,
-2.380755, -0.9583004, -2.590046, 1, 0.02352941, 0, 1,
-2.313723, -0.1528821, -1.834017, 1, 0.03137255, 0, 1,
-2.294895, -0.07645699, -1.703899, 1, 0.03529412, 0, 1,
-2.250919, -1.113011, -1.249225, 1, 0.04313726, 0, 1,
-2.240945, 0.2873876, -0.9257389, 1, 0.04705882, 0, 1,
-2.232188, -0.07506066, -1.468335, 1, 0.05490196, 0, 1,
-2.183345, 0.9609219, -0.7249795, 1, 0.05882353, 0, 1,
-2.124838, -0.4277075, -1.463125, 1, 0.06666667, 0, 1,
-2.091543, 1.465784, 0.01550815, 1, 0.07058824, 0, 1,
-2.078171, -1.021438, -2.5543, 1, 0.07843138, 0, 1,
-2.061646, -0.7176833, -3.576282, 1, 0.08235294, 0, 1,
-2.027484, -0.3618786, -0.1314969, 1, 0.09019608, 0, 1,
-1.998669, 0.651852, -2.974205, 1, 0.09411765, 0, 1,
-1.986514, -0.1180092, -0.2018005, 1, 0.1019608, 0, 1,
-1.983703, 1.473716, -4.404333, 1, 0.1098039, 0, 1,
-1.971793, -0.7624347, -3.220354, 1, 0.1137255, 0, 1,
-1.968127, 1.571623, -0.550984, 1, 0.1215686, 0, 1,
-1.94599, 0.7116119, -0.6834089, 1, 0.1254902, 0, 1,
-1.908818, -0.6202818, -1.849968, 1, 0.1333333, 0, 1,
-1.905035, 0.9548088, -0.7373374, 1, 0.1372549, 0, 1,
-1.902717, -0.7961167, -1.206723, 1, 0.145098, 0, 1,
-1.868988, -1.607627, -1.982793, 1, 0.1490196, 0, 1,
-1.857784, -0.3647282, -1.706369, 1, 0.1568628, 0, 1,
-1.83605, -0.04799542, -1.396458, 1, 0.1607843, 0, 1,
-1.833908, -2.23723, -3.88933, 1, 0.1686275, 0, 1,
-1.808644, -1.067651, -2.824241, 1, 0.172549, 0, 1,
-1.793096, 2.527408, -2.511995, 1, 0.1803922, 0, 1,
-1.791654, -0.4248399, -1.911983, 1, 0.1843137, 0, 1,
-1.785901, 0.8059658, -0.809489, 1, 0.1921569, 0, 1,
-1.778774, -0.9414434, -0.9927474, 1, 0.1960784, 0, 1,
-1.769509, -1.783424, -2.894975, 1, 0.2039216, 0, 1,
-1.764037, 0.3348714, -1.965099, 1, 0.2117647, 0, 1,
-1.75158, 0.2896768, -1.650503, 1, 0.2156863, 0, 1,
-1.73388, 1.121756, -0.9896933, 1, 0.2235294, 0, 1,
-1.727584, 0.8495515, -1.585828, 1, 0.227451, 0, 1,
-1.723434, 0.5419462, 0.7353066, 1, 0.2352941, 0, 1,
-1.719981, -0.5096194, -2.602304, 1, 0.2392157, 0, 1,
-1.697795, 1.342787, -2.748276, 1, 0.2470588, 0, 1,
-1.695425, 0.04750264, -1.489751, 1, 0.2509804, 0, 1,
-1.640862, -0.1465836, -2.337291, 1, 0.2588235, 0, 1,
-1.639751, 1.481154, -2.491843, 1, 0.2627451, 0, 1,
-1.638391, 2.15931, 0.5751823, 1, 0.2705882, 0, 1,
-1.637616, 0.3710043, -0.9518147, 1, 0.2745098, 0, 1,
-1.632156, -0.8274011, -1.184846, 1, 0.282353, 0, 1,
-1.630326, -0.04186925, -2.868255, 1, 0.2862745, 0, 1,
-1.629427, -1.257938, 0.1005412, 1, 0.2941177, 0, 1,
-1.625284, 0.8015881, -0.7426487, 1, 0.3019608, 0, 1,
-1.620665, -0.210229, -2.173099, 1, 0.3058824, 0, 1,
-1.599079, -0.7767823, -3.377249, 1, 0.3137255, 0, 1,
-1.593662, 0.9016651, 0.4538353, 1, 0.3176471, 0, 1,
-1.573153, 0.8877932, -1.551815, 1, 0.3254902, 0, 1,
-1.566319, -0.5211471, -1.475179, 1, 0.3294118, 0, 1,
-1.563591, 1.182003, 0.8553865, 1, 0.3372549, 0, 1,
-1.559946, 0.7296909, -1.406507, 1, 0.3411765, 0, 1,
-1.552062, -0.9205421, -2.575328, 1, 0.3490196, 0, 1,
-1.536145, 1.418488, 0.6434402, 1, 0.3529412, 0, 1,
-1.533276, 0.4799107, -1.008548, 1, 0.3607843, 0, 1,
-1.528628, -1.385756, -2.257842, 1, 0.3647059, 0, 1,
-1.490767, 1.009417, -2.577402, 1, 0.372549, 0, 1,
-1.487438, -1.63873, -1.238141, 1, 0.3764706, 0, 1,
-1.485904, 0.335238, -1.214544, 1, 0.3843137, 0, 1,
-1.466171, 0.4834977, -1.538897, 1, 0.3882353, 0, 1,
-1.461168, -0.8538282, -0.3741101, 1, 0.3960784, 0, 1,
-1.459629, -0.4567932, -1.780871, 1, 0.4039216, 0, 1,
-1.454137, 0.5994945, 0.5760574, 1, 0.4078431, 0, 1,
-1.452504, -0.7743194, -2.271142, 1, 0.4156863, 0, 1,
-1.449732, 1.085652, -3.127078, 1, 0.4196078, 0, 1,
-1.445863, -0.1243296, -2.222902, 1, 0.427451, 0, 1,
-1.432721, 0.2064953, -1.475187, 1, 0.4313726, 0, 1,
-1.430923, 1.137882, -1.132116, 1, 0.4392157, 0, 1,
-1.430777, 0.1830591, -2.38309, 1, 0.4431373, 0, 1,
-1.430019, -1.69086, -0.2570489, 1, 0.4509804, 0, 1,
-1.428061, -0.5886427, -1.705727, 1, 0.454902, 0, 1,
-1.427467, 0.2600452, -1.71993, 1, 0.4627451, 0, 1,
-1.417866, 0.4118886, -1.15315, 1, 0.4666667, 0, 1,
-1.416212, -0.735145, -2.137909, 1, 0.4745098, 0, 1,
-1.415727, -0.5882074, -2.606235, 1, 0.4784314, 0, 1,
-1.414716, -1.284334, -2.710965, 1, 0.4862745, 0, 1,
-1.409057, 0.2823561, -3.820161, 1, 0.4901961, 0, 1,
-1.407132, -1.254711, -2.939642, 1, 0.4980392, 0, 1,
-1.398263, 0.3122191, -0.9460066, 1, 0.5058824, 0, 1,
-1.397197, 0.5982733, 0.3962147, 1, 0.509804, 0, 1,
-1.390748, -0.05343526, -1.576017, 1, 0.5176471, 0, 1,
-1.390276, -0.3647942, -1.139109, 1, 0.5215687, 0, 1,
-1.388747, -0.2089212, -1.970008, 1, 0.5294118, 0, 1,
-1.388281, -0.4219958, -2.629037, 1, 0.5333334, 0, 1,
-1.382541, 1.64001, 0.2279854, 1, 0.5411765, 0, 1,
-1.37503, 1.538991, -0.6525872, 1, 0.5450981, 0, 1,
-1.372549, 0.8559657, -1.11165, 1, 0.5529412, 0, 1,
-1.36801, 0.1685861, -1.582407, 1, 0.5568628, 0, 1,
-1.358996, -0.5983939, -1.334516, 1, 0.5647059, 0, 1,
-1.357933, -1.290988, -4.960296, 1, 0.5686275, 0, 1,
-1.356425, -1.824249, -2.425718, 1, 0.5764706, 0, 1,
-1.338431, 0.121674, -0.2585399, 1, 0.5803922, 0, 1,
-1.334016, 0.3836932, -2.125018, 1, 0.5882353, 0, 1,
-1.322641, 1.584927, -1.845355, 1, 0.5921569, 0, 1,
-1.318648, -1.387573, -2.05526, 1, 0.6, 0, 1,
-1.314364, 0.6035123, -0.3523524, 1, 0.6078432, 0, 1,
-1.298399, 0.1359946, -2.453682, 1, 0.6117647, 0, 1,
-1.294921, 1.33126, -0.9079039, 1, 0.6196079, 0, 1,
-1.293298, 0.6049462, 0.3973409, 1, 0.6235294, 0, 1,
-1.293118, 0.03626198, -0.4266667, 1, 0.6313726, 0, 1,
-1.286465, -0.51642, -2.487258, 1, 0.6352941, 0, 1,
-1.25861, 0.6576461, -1.316955, 1, 0.6431373, 0, 1,
-1.257517, -2.787225, -5.18076, 1, 0.6470588, 0, 1,
-1.256147, -1.319871, -1.029222, 1, 0.654902, 0, 1,
-1.252639, 1.796615, -2.988339, 1, 0.6588235, 0, 1,
-1.247925, 1.03559, -1.668603, 1, 0.6666667, 0, 1,
-1.240551, -0.554989, -1.973769, 1, 0.6705883, 0, 1,
-1.237092, -1.322507, -3.540326, 1, 0.6784314, 0, 1,
-1.233193, 1.220629, -1.158104, 1, 0.682353, 0, 1,
-1.231421, 0.4581767, -0.4718818, 1, 0.6901961, 0, 1,
-1.226608, 0.1016885, -1.284179, 1, 0.6941177, 0, 1,
-1.22262, 1.091305, -1.791811, 1, 0.7019608, 0, 1,
-1.205065, -1.662386, -3.228596, 1, 0.7098039, 0, 1,
-1.192117, 0.5436804, -1.378361, 1, 0.7137255, 0, 1,
-1.190924, -0.1034682, -1.709879, 1, 0.7215686, 0, 1,
-1.186775, -1.001117, -1.617276, 1, 0.7254902, 0, 1,
-1.183019, -0.02217122, -2.093703, 1, 0.7333333, 0, 1,
-1.181021, -0.7004662, -2.296218, 1, 0.7372549, 0, 1,
-1.180356, -0.8305339, -2.603713, 1, 0.7450981, 0, 1,
-1.179545, 0.9952489, -1.729732, 1, 0.7490196, 0, 1,
-1.176581, 0.8540871, -0.6467898, 1, 0.7568628, 0, 1,
-1.169641, -0.8351234, -1.010063, 1, 0.7607843, 0, 1,
-1.165606, 0.07579508, 0.1905007, 1, 0.7686275, 0, 1,
-1.164131, -1.998675, -4.094143, 1, 0.772549, 0, 1,
-1.16206, 1.054285, -1.289012, 1, 0.7803922, 0, 1,
-1.160498, 1.602306, -0.2539757, 1, 0.7843137, 0, 1,
-1.156299, -0.05178038, -1.239963, 1, 0.7921569, 0, 1,
-1.155883, 0.4829914, -1.357261, 1, 0.7960784, 0, 1,
-1.149931, -1.230797, -2.302113, 1, 0.8039216, 0, 1,
-1.141769, 0.09638228, -1.387844, 1, 0.8117647, 0, 1,
-1.140332, -1.53764, -1.455185, 1, 0.8156863, 0, 1,
-1.136037, -0.3092805, -1.533105, 1, 0.8235294, 0, 1,
-1.132795, 0.1100396, -1.69859, 1, 0.827451, 0, 1,
-1.127215, 0.2773325, -0.9102468, 1, 0.8352941, 0, 1,
-1.11969, 0.06507675, -1.417479, 1, 0.8392157, 0, 1,
-1.118664, 0.1192856, -1.508623, 1, 0.8470588, 0, 1,
-1.114356, -0.2146345, -2.332574, 1, 0.8509804, 0, 1,
-1.108321, -0.4093578, -2.008872, 1, 0.8588235, 0, 1,
-1.100655, 0.2878976, -0.5465876, 1, 0.8627451, 0, 1,
-1.084672, 0.5950466, -1.654521, 1, 0.8705882, 0, 1,
-1.081606, -2.730484, -1.882248, 1, 0.8745098, 0, 1,
-1.081183, -0.1837752, -1.472542, 1, 0.8823529, 0, 1,
-1.07305, 0.5162157, -0.4761961, 1, 0.8862745, 0, 1,
-1.066876, 0.1266019, -1.104259, 1, 0.8941177, 0, 1,
-1.060082, -1.428059, -3.105543, 1, 0.8980392, 0, 1,
-1.059007, -0.317379, -2.932129, 1, 0.9058824, 0, 1,
-1.053514, -0.6404565, -0.8573824, 1, 0.9137255, 0, 1,
-1.048313, 0.8303185, -2.583082, 1, 0.9176471, 0, 1,
-1.046161, -1.285595, -3.52714, 1, 0.9254902, 0, 1,
-1.039214, 0.5988711, -1.114924, 1, 0.9294118, 0, 1,
-1.036893, -0.827405, -2.336908, 1, 0.9372549, 0, 1,
-1.028693, -1.929703, -1.222414, 1, 0.9411765, 0, 1,
-1.028367, -1.760617, -3.078033, 1, 0.9490196, 0, 1,
-1.021426, 1.467099, 1.376351, 1, 0.9529412, 0, 1,
-1.015597, -0.5742354, -2.374404, 1, 0.9607843, 0, 1,
-1.012787, -0.2695096, 0.1611428, 1, 0.9647059, 0, 1,
-1.010732, 1.355284, -0.8546075, 1, 0.972549, 0, 1,
-1.007814, 0.6033009, -1.011234, 1, 0.9764706, 0, 1,
-1.002235, 0.6587629, -0.9383583, 1, 0.9843137, 0, 1,
-0.9986815, -0.2491155, -1.389149, 1, 0.9882353, 0, 1,
-0.9921499, -0.7190445, -0.3018918, 1, 0.9960784, 0, 1,
-0.9920322, 1.628657, -3.306596, 0.9960784, 1, 0, 1,
-0.9806269, 0.4420048, 0.0001023107, 0.9921569, 1, 0, 1,
-0.979526, 0.4892305, -0.5354003, 0.9843137, 1, 0, 1,
-0.9783451, -2.550558, -1.644165, 0.9803922, 1, 0, 1,
-0.9772327, -0.176724, 0.06168137, 0.972549, 1, 0, 1,
-0.9764952, -1.0098, -2.918995, 0.9686275, 1, 0, 1,
-0.9702023, 0.2487673, -3.648004, 0.9607843, 1, 0, 1,
-0.9675521, 1.453894, -0.9180508, 0.9568627, 1, 0, 1,
-0.9641733, -0.9039213, -1.514961, 0.9490196, 1, 0, 1,
-0.9636955, -0.2742913, -2.511942, 0.945098, 1, 0, 1,
-0.9628213, 0.1349837, -0.7967956, 0.9372549, 1, 0, 1,
-0.9614591, 2.045544, 0.1948637, 0.9333333, 1, 0, 1,
-0.9584795, 0.2188286, -3.307968, 0.9254902, 1, 0, 1,
-0.9511266, 0.8715616, -1.709228, 0.9215686, 1, 0, 1,
-0.945933, 0.0575668, 0.6510001, 0.9137255, 1, 0, 1,
-0.9436703, 0.1658402, -1.879556, 0.9098039, 1, 0, 1,
-0.9415073, 0.6398458, -1.30827, 0.9019608, 1, 0, 1,
-0.9381443, 1.046773, -0.5160602, 0.8941177, 1, 0, 1,
-0.9379053, -0.1626531, -3.447315, 0.8901961, 1, 0, 1,
-0.9359154, -0.5275908, -0.8507704, 0.8823529, 1, 0, 1,
-0.9330449, -0.8293628, -3.390494, 0.8784314, 1, 0, 1,
-0.9308935, -1.177655, -3.204344, 0.8705882, 1, 0, 1,
-0.9218476, -2.137635, -2.113999, 0.8666667, 1, 0, 1,
-0.9207931, -1.428356, -0.9665079, 0.8588235, 1, 0, 1,
-0.9207774, -0.9630452, -3.563901, 0.854902, 1, 0, 1,
-0.9201091, -0.2240656, -1.938764, 0.8470588, 1, 0, 1,
-0.9171319, -0.6711157, -2.33331, 0.8431373, 1, 0, 1,
-0.9144126, -1.269642, -3.171825, 0.8352941, 1, 0, 1,
-0.9109793, -0.1168844, -2.190162, 0.8313726, 1, 0, 1,
-0.9095196, 0.2010014, -1.075856, 0.8235294, 1, 0, 1,
-0.9087754, 0.255311, -1.448794, 0.8196079, 1, 0, 1,
-0.9073507, -0.6232178, -1.077749, 0.8117647, 1, 0, 1,
-0.9051241, 1.381345, -1.939961, 0.8078431, 1, 0, 1,
-0.9019796, 0.9528734, 0.1468104, 0.8, 1, 0, 1,
-0.8938712, 0.6047697, -0.01703992, 0.7921569, 1, 0, 1,
-0.89026, 0.4333081, -2.122891, 0.7882353, 1, 0, 1,
-0.8900755, -1.475629, -1.373549, 0.7803922, 1, 0, 1,
-0.888074, 0.8546664, -1.53916, 0.7764706, 1, 0, 1,
-0.887432, 1.829744, -1.191287, 0.7686275, 1, 0, 1,
-0.887063, 0.3388828, -0.157871, 0.7647059, 1, 0, 1,
-0.8808855, -0.4497921, -1.160289, 0.7568628, 1, 0, 1,
-0.8743143, -0.603624, -1.05552, 0.7529412, 1, 0, 1,
-0.8720757, 0.427373, -0.05290507, 0.7450981, 1, 0, 1,
-0.8573222, -1.012237, -2.445746, 0.7411765, 1, 0, 1,
-0.8569427, -0.1949422, -1.624773, 0.7333333, 1, 0, 1,
-0.839616, -0.9699704, -1.601426, 0.7294118, 1, 0, 1,
-0.8379147, 0.1405277, -2.653571, 0.7215686, 1, 0, 1,
-0.8364393, 0.8114971, -1.083018, 0.7176471, 1, 0, 1,
-0.8325111, -1.652504, -2.676625, 0.7098039, 1, 0, 1,
-0.8291228, -0.710578, -3.216583, 0.7058824, 1, 0, 1,
-0.8264057, -0.5624596, -1.786207, 0.6980392, 1, 0, 1,
-0.8112648, 0.288592, -2.63023, 0.6901961, 1, 0, 1,
-0.8099926, 1.340104, -0.4280264, 0.6862745, 1, 0, 1,
-0.8042361, -0.7188664, -0.9661227, 0.6784314, 1, 0, 1,
-0.7938187, -1.207865, -2.338469, 0.6745098, 1, 0, 1,
-0.7915063, -0.861786, -2.38806, 0.6666667, 1, 0, 1,
-0.7911032, 0.4249448, -2.026914, 0.6627451, 1, 0, 1,
-0.7901474, -0.8888364, -2.652187, 0.654902, 1, 0, 1,
-0.7873498, 0.3375418, -1.940619, 0.6509804, 1, 0, 1,
-0.7840698, -1.732749, -3.150192, 0.6431373, 1, 0, 1,
-0.7814389, -2.101237, -2.996337, 0.6392157, 1, 0, 1,
-0.775312, -0.09267946, -0.8078467, 0.6313726, 1, 0, 1,
-0.7714506, 0.3410438, -0.4108059, 0.627451, 1, 0, 1,
-0.7710349, 0.8101984, -0.05549635, 0.6196079, 1, 0, 1,
-0.7697775, -1.363225, -2.511754, 0.6156863, 1, 0, 1,
-0.7635535, 0.299122, -0.2417376, 0.6078432, 1, 0, 1,
-0.7628436, -0.5796081, -3.007356, 0.6039216, 1, 0, 1,
-0.7611386, 1.285084, 2.119655, 0.5960785, 1, 0, 1,
-0.7605569, 0.2864224, -0.8495813, 0.5882353, 1, 0, 1,
-0.7559966, -2.413351, -2.588859, 0.5843138, 1, 0, 1,
-0.7554189, -1.703586, -2.083254, 0.5764706, 1, 0, 1,
-0.7539709, -1.158468, -3.763515, 0.572549, 1, 0, 1,
-0.7534799, 0.8355256, -1.627375, 0.5647059, 1, 0, 1,
-0.7534748, -0.03751472, -2.190345, 0.5607843, 1, 0, 1,
-0.752718, 0.2609649, -0.616559, 0.5529412, 1, 0, 1,
-0.7456891, -0.05490315, -2.490842, 0.5490196, 1, 0, 1,
-0.7411019, -0.243567, -1.145782, 0.5411765, 1, 0, 1,
-0.7408792, 2.74832, 0.368791, 0.5372549, 1, 0, 1,
-0.7408682, -0.321872, -1.714892, 0.5294118, 1, 0, 1,
-0.7350807, -0.3349955, -2.18925, 0.5254902, 1, 0, 1,
-0.7313938, -1.548437, -0.2871331, 0.5176471, 1, 0, 1,
-0.729592, -0.33819, -3.360709, 0.5137255, 1, 0, 1,
-0.7288803, 1.22202, -1.192749, 0.5058824, 1, 0, 1,
-0.7259725, 0.4966973, 0.68714, 0.5019608, 1, 0, 1,
-0.7208124, -0.04223955, -1.446287, 0.4941176, 1, 0, 1,
-0.7193121, -0.1899025, 0.8276345, 0.4862745, 1, 0, 1,
-0.7178046, 0.2776984, -1.730554, 0.4823529, 1, 0, 1,
-0.7159814, 1.360605, 1.62095, 0.4745098, 1, 0, 1,
-0.7150007, -0.8036303, -2.150565, 0.4705882, 1, 0, 1,
-0.7078696, 0.827861, 0.3801812, 0.4627451, 1, 0, 1,
-0.6993136, 0.2987646, -1.165496, 0.4588235, 1, 0, 1,
-0.6971715, 0.2233594, -1.199646, 0.4509804, 1, 0, 1,
-0.6898891, 0.7905828, -1.97036, 0.4470588, 1, 0, 1,
-0.6887035, 1.5473, 0.5011244, 0.4392157, 1, 0, 1,
-0.6868249, -0.8410097, -3.503689, 0.4352941, 1, 0, 1,
-0.6864477, 0.5571949, -1.5814, 0.427451, 1, 0, 1,
-0.6821294, 2.216475, -0.8212738, 0.4235294, 1, 0, 1,
-0.680175, -0.969558, -2.596443, 0.4156863, 1, 0, 1,
-0.676845, -0.2628322, -1.682371, 0.4117647, 1, 0, 1,
-0.6743485, 1.091065, 1.365208, 0.4039216, 1, 0, 1,
-0.6726003, 0.6957313, 0.3669402, 0.3960784, 1, 0, 1,
-0.6673522, -0.2148443, 1.422948, 0.3921569, 1, 0, 1,
-0.6625331, -0.3451888, -2.592381, 0.3843137, 1, 0, 1,
-0.6602873, -0.07670428, -2.42811, 0.3803922, 1, 0, 1,
-0.6547021, 0.7688296, -0.5839145, 0.372549, 1, 0, 1,
-0.6509627, -1.183859, -2.495041, 0.3686275, 1, 0, 1,
-0.6486632, -0.3325607, -1.139987, 0.3607843, 1, 0, 1,
-0.6476477, 0.6205475, -0.8243932, 0.3568628, 1, 0, 1,
-0.6353449, 0.710645, -0.9607083, 0.3490196, 1, 0, 1,
-0.6304343, -0.02361618, -2.424065, 0.345098, 1, 0, 1,
-0.6285318, -1.816742, -3.173587, 0.3372549, 1, 0, 1,
-0.6273479, 0.08831666, -1.091933, 0.3333333, 1, 0, 1,
-0.6257901, -1.296541, -1.775907, 0.3254902, 1, 0, 1,
-0.6208845, 1.1221, 1.539104, 0.3215686, 1, 0, 1,
-0.6157188, -1.882642, -4.997225, 0.3137255, 1, 0, 1,
-0.6146055, -0.1943499, -0.8597727, 0.3098039, 1, 0, 1,
-0.6137155, -1.769361, -3.836662, 0.3019608, 1, 0, 1,
-0.6106008, 0.9069166, -1.017064, 0.2941177, 1, 0, 1,
-0.6039812, 0.6991884, -0.6294608, 0.2901961, 1, 0, 1,
-0.5994297, 1.380892, -1.753446, 0.282353, 1, 0, 1,
-0.5977602, -0.1954727, -0.9402338, 0.2784314, 1, 0, 1,
-0.5972155, -0.5002728, -1.709834, 0.2705882, 1, 0, 1,
-0.5970005, 1.451648, 0.7426107, 0.2666667, 1, 0, 1,
-0.5945489, -0.3031822, -1.544844, 0.2588235, 1, 0, 1,
-0.5943021, -0.8642346, -2.73121, 0.254902, 1, 0, 1,
-0.592217, 1.034638, -0.596041, 0.2470588, 1, 0, 1,
-0.5910923, 0.642232, -0.642726, 0.2431373, 1, 0, 1,
-0.587624, -0.8199867, -2.766103, 0.2352941, 1, 0, 1,
-0.5873073, 0.2376988, -1.271481, 0.2313726, 1, 0, 1,
-0.5834455, 1.259534, 0.02629189, 0.2235294, 1, 0, 1,
-0.5834165, -0.8427568, -1.98442, 0.2196078, 1, 0, 1,
-0.5818095, 2.406241, -1.369841, 0.2117647, 1, 0, 1,
-0.5808656, -0.1703887, -2.055137, 0.2078431, 1, 0, 1,
-0.5799025, -2.164028, -3.227026, 0.2, 1, 0, 1,
-0.5768775, 0.07569268, -1.229941, 0.1921569, 1, 0, 1,
-0.573747, 0.9552528, -1.630999, 0.1882353, 1, 0, 1,
-0.5735093, 0.4179288, -0.5173717, 0.1803922, 1, 0, 1,
-0.5657867, 0.2532888, -1.496628, 0.1764706, 1, 0, 1,
-0.5637321, -0.988702, -4.033261, 0.1686275, 1, 0, 1,
-0.5591683, -0.2652189, -3.446121, 0.1647059, 1, 0, 1,
-0.5552825, 0.3275167, -1.186047, 0.1568628, 1, 0, 1,
-0.5545521, -0.8633374, -3.299538, 0.1529412, 1, 0, 1,
-0.5536712, -0.6105773, -2.337776, 0.145098, 1, 0, 1,
-0.5528727, -0.9136856, -0.9193286, 0.1411765, 1, 0, 1,
-0.5492046, -1.414368, -4.202329, 0.1333333, 1, 0, 1,
-0.5441172, 0.619167, -2.463718, 0.1294118, 1, 0, 1,
-0.5414032, -1.648274, -1.712528, 0.1215686, 1, 0, 1,
-0.5375574, 1.093656, 1.161557, 0.1176471, 1, 0, 1,
-0.5367786, -1.212802, -3.535507, 0.1098039, 1, 0, 1,
-0.5282214, 0.2103647, 0.3189637, 0.1058824, 1, 0, 1,
-0.5253911, -0.09021991, -1.874341, 0.09803922, 1, 0, 1,
-0.5221307, -0.04091482, -2.601891, 0.09019608, 1, 0, 1,
-0.5216925, 0.9654868, 1.471254, 0.08627451, 1, 0, 1,
-0.517813, 0.3234502, -1.240922, 0.07843138, 1, 0, 1,
-0.5174084, -1.106296, -3.506933, 0.07450981, 1, 0, 1,
-0.5162364, -0.7207202, -1.435166, 0.06666667, 1, 0, 1,
-0.5145974, 0.4868416, -0.5798881, 0.0627451, 1, 0, 1,
-0.5119609, -0.6570521, -4.369009, 0.05490196, 1, 0, 1,
-0.5083473, 0.584775, 0.9695765, 0.05098039, 1, 0, 1,
-0.5073478, -0.2665942, -1.927294, 0.04313726, 1, 0, 1,
-0.5070066, -0.263832, -2.606822, 0.03921569, 1, 0, 1,
-0.502689, -0.4790786, -3.456388, 0.03137255, 1, 0, 1,
-0.50227, -0.04991233, -1.475355, 0.02745098, 1, 0, 1,
-0.4991596, -1.847947, -2.366411, 0.01960784, 1, 0, 1,
-0.4963385, -0.7128462, -1.625944, 0.01568628, 1, 0, 1,
-0.4913776, -1.127976, -1.585368, 0.007843138, 1, 0, 1,
-0.4891549, 0.5722821, -1.648383, 0.003921569, 1, 0, 1,
-0.4824248, -0.2159507, -2.464075, 0, 1, 0.003921569, 1,
-0.4822164, -0.2041704, -1.917152, 0, 1, 0.01176471, 1,
-0.4811003, -0.8337157, -2.539002, 0, 1, 0.01568628, 1,
-0.4708984, -0.8645991, -2.796664, 0, 1, 0.02352941, 1,
-0.4666949, -0.1230169, -3.284199, 0, 1, 0.02745098, 1,
-0.4544733, 0.865194, 1.376577, 0, 1, 0.03529412, 1,
-0.4533034, -0.05308383, -2.681308, 0, 1, 0.03921569, 1,
-0.4525641, 1.210659, -1.062703, 0, 1, 0.04705882, 1,
-0.4501423, 0.1310331, -1.238544, 0, 1, 0.05098039, 1,
-0.4426393, 1.019635, 0.9001277, 0, 1, 0.05882353, 1,
-0.442479, -0.2202496, -3.96689, 0, 1, 0.0627451, 1,
-0.440749, 2.030375, 0.3115942, 0, 1, 0.07058824, 1,
-0.4366069, -0.02307813, -1.695163, 0, 1, 0.07450981, 1,
-0.4263645, 0.6418621, -1.630979, 0, 1, 0.08235294, 1,
-0.4213813, 2.245392, -0.1830016, 0, 1, 0.08627451, 1,
-0.4145096, -0.5670354, -3.679037, 0, 1, 0.09411765, 1,
-0.4139569, -0.2452772, -3.040405, 0, 1, 0.1019608, 1,
-0.4126021, 0.7185654, -0.6907713, 0, 1, 0.1058824, 1,
-0.4106117, -0.2596647, -2.432329, 0, 1, 0.1137255, 1,
-0.4101464, -0.9685544, -1.915746, 0, 1, 0.1176471, 1,
-0.4099621, 0.4955385, -0.2264753, 0, 1, 0.1254902, 1,
-0.4041447, 1.267415, -0.1484877, 0, 1, 0.1294118, 1,
-0.3973024, -0.4056129, -1.535575, 0, 1, 0.1372549, 1,
-0.3947296, -0.8180496, -3.478616, 0, 1, 0.1411765, 1,
-0.3928961, -0.1855615, -1.321777, 0, 1, 0.1490196, 1,
-0.3927079, 0.3911211, 0.9785769, 0, 1, 0.1529412, 1,
-0.391782, -0.8646178, -2.276161, 0, 1, 0.1607843, 1,
-0.3913952, -0.1101318, -2.958943, 0, 1, 0.1647059, 1,
-0.3885629, -0.4093403, -1.61235, 0, 1, 0.172549, 1,
-0.3871696, -0.2976401, -2.073453, 0, 1, 0.1764706, 1,
-0.3844055, 1.495621, 0.5650458, 0, 1, 0.1843137, 1,
-0.3793264, -1.020916, -2.297971, 0, 1, 0.1882353, 1,
-0.3736942, -0.1131707, -1.403642, 0, 1, 0.1960784, 1,
-0.3671924, -0.7605921, -2.683581, 0, 1, 0.2039216, 1,
-0.3665477, -0.8929467, -2.310921, 0, 1, 0.2078431, 1,
-0.3663045, -0.5125151, -3.249653, 0, 1, 0.2156863, 1,
-0.3642209, -0.4968056, -2.464421, 0, 1, 0.2196078, 1,
-0.3609684, 0.9230886, -0.19346, 0, 1, 0.227451, 1,
-0.360814, 0.4923684, -1.443686, 0, 1, 0.2313726, 1,
-0.3573244, 0.2317687, -3.011684, 0, 1, 0.2392157, 1,
-0.3571228, -0.05889466, -0.351313, 0, 1, 0.2431373, 1,
-0.3501816, 0.09695034, -2.131307, 0, 1, 0.2509804, 1,
-0.344226, 2.323441, -0.5656678, 0, 1, 0.254902, 1,
-0.3437503, 1.036051, 0.005788963, 0, 1, 0.2627451, 1,
-0.3434008, 0.7550649, -0.2108071, 0, 1, 0.2666667, 1,
-0.3347764, -0.7930993, -2.025059, 0, 1, 0.2745098, 1,
-0.3201034, -0.1482427, -2.070681, 0, 1, 0.2784314, 1,
-0.3185493, -0.6640795, -2.289912, 0, 1, 0.2862745, 1,
-0.3175083, 0.488589, 0.6521613, 0, 1, 0.2901961, 1,
-0.3142781, 0.4894607, 1.351098, 0, 1, 0.2980392, 1,
-0.3114164, 0.2357148, -0.6974356, 0, 1, 0.3058824, 1,
-0.3071841, 1.823856, 1.396162, 0, 1, 0.3098039, 1,
-0.2951911, 0.4443486, -1.000636, 0, 1, 0.3176471, 1,
-0.287331, 1.139663, 1.190998, 0, 1, 0.3215686, 1,
-0.2845943, -1.985958, -3.052723, 0, 1, 0.3294118, 1,
-0.2779684, -0.5283819, -3.607404, 0, 1, 0.3333333, 1,
-0.2756986, 1.160672, -1.472106, 0, 1, 0.3411765, 1,
-0.2749704, 1.711821, 0.3131951, 0, 1, 0.345098, 1,
-0.274712, -0.8263858, -2.996063, 0, 1, 0.3529412, 1,
-0.2710141, 0.4019402, -0.1086792, 0, 1, 0.3568628, 1,
-0.2707599, -0.5598255, -3.491773, 0, 1, 0.3647059, 1,
-0.2663515, 1.915447, -1.23725, 0, 1, 0.3686275, 1,
-0.2616792, 1.001773, -1.933111, 0, 1, 0.3764706, 1,
-0.2529993, 0.6243291, -0.1916649, 0, 1, 0.3803922, 1,
-0.2492357, 0.1151281, -1.627721, 0, 1, 0.3882353, 1,
-0.2454063, 1.156176, -1.73827, 0, 1, 0.3921569, 1,
-0.2450251, 0.4045677, -2.00085, 0, 1, 0.4, 1,
-0.2448345, 1.527963, 0.09631627, 0, 1, 0.4078431, 1,
-0.2412669, 0.2815348, -1.110463, 0, 1, 0.4117647, 1,
-0.2411038, -1.243176, -2.014039, 0, 1, 0.4196078, 1,
-0.2407469, -1.043321, -3.697125, 0, 1, 0.4235294, 1,
-0.2374662, -1.394271, -3.198379, 0, 1, 0.4313726, 1,
-0.2297582, -1.217573, -1.852407, 0, 1, 0.4352941, 1,
-0.221775, -0.1206078, -3.05079, 0, 1, 0.4431373, 1,
-0.2201739, 0.2388791, -0.2988886, 0, 1, 0.4470588, 1,
-0.2162497, -1.089882, -2.230561, 0, 1, 0.454902, 1,
-0.2160763, 0.04916213, -0.8835189, 0, 1, 0.4588235, 1,
-0.2147887, 0.9145372, 0.1990484, 0, 1, 0.4666667, 1,
-0.212174, 1.449383, -0.3815473, 0, 1, 0.4705882, 1,
-0.2101325, 1.132962, -1.11992, 0, 1, 0.4784314, 1,
-0.2085924, 1.432072, 0.6361422, 0, 1, 0.4823529, 1,
-0.208504, 1.289642, 0.1620911, 0, 1, 0.4901961, 1,
-0.2068692, 1.072473, -0.9056556, 0, 1, 0.4941176, 1,
-0.2033622, 1.712812, -1.279076, 0, 1, 0.5019608, 1,
-0.2029681, -0.5286171, -3.401447, 0, 1, 0.509804, 1,
-0.1977048, 0.06020249, -2.283638, 0, 1, 0.5137255, 1,
-0.1964326, -1.592835, -2.032383, 0, 1, 0.5215687, 1,
-0.1945906, -1.688171, -1.97776, 0, 1, 0.5254902, 1,
-0.1942761, 1.402147, -1.07208, 0, 1, 0.5333334, 1,
-0.1913797, -2.304262, -4.074703, 0, 1, 0.5372549, 1,
-0.1880368, -0.8710582, -1.841161, 0, 1, 0.5450981, 1,
-0.1870373, 1.374186, -2.458833, 0, 1, 0.5490196, 1,
-0.1845052, 0.6736061, -0.6555319, 0, 1, 0.5568628, 1,
-0.182706, 1.162594, 0.4509553, 0, 1, 0.5607843, 1,
-0.1695464, 0.03252103, -0.727331, 0, 1, 0.5686275, 1,
-0.1557228, -1.515159, -1.725085, 0, 1, 0.572549, 1,
-0.1547298, -0.355635, -2.653755, 0, 1, 0.5803922, 1,
-0.152601, 0.933771, -2.514705, 0, 1, 0.5843138, 1,
-0.1519814, -0.7735527, -2.951783, 0, 1, 0.5921569, 1,
-0.1516985, 0.4156649, 0.6596566, 0, 1, 0.5960785, 1,
-0.1495715, 1.530866, 1.83197, 0, 1, 0.6039216, 1,
-0.1463999, -0.647343, -1.962261, 0, 1, 0.6117647, 1,
-0.1463922, 0.5449615, -0.526252, 0, 1, 0.6156863, 1,
-0.1422219, -0.5784088, -2.935578, 0, 1, 0.6235294, 1,
-0.1407124, 0.4533411, 1.690262, 0, 1, 0.627451, 1,
-0.1406413, -0.9808133, -2.516499, 0, 1, 0.6352941, 1,
-0.1363005, 0.5629486, 0.9412165, 0, 1, 0.6392157, 1,
-0.1354451, 0.04350286, -2.385837, 0, 1, 0.6470588, 1,
-0.1326088, 1.288559, -0.1625153, 0, 1, 0.6509804, 1,
-0.1323258, 0.1081193, -2.484118, 0, 1, 0.6588235, 1,
-0.1321057, 0.2572694, 0.0934758, 0, 1, 0.6627451, 1,
-0.1280602, -1.206421, -2.514903, 0, 1, 0.6705883, 1,
-0.1245419, 1.547943, -0.3426106, 0, 1, 0.6745098, 1,
-0.1213473, -1.429665, -3.183173, 0, 1, 0.682353, 1,
-0.1119493, -1.255391, -5.093597, 0, 1, 0.6862745, 1,
-0.1084887, 0.001240963, -2.201499, 0, 1, 0.6941177, 1,
-0.1074292, -0.2765633, -3.472593, 0, 1, 0.7019608, 1,
-0.1058138, -0.7102951, -1.684591, 0, 1, 0.7058824, 1,
-0.1050084, 0.540426, -0.9801719, 0, 1, 0.7137255, 1,
-0.09269116, 0.8458614, -0.4407206, 0, 1, 0.7176471, 1,
-0.09265871, -0.1708858, -4.462109, 0, 1, 0.7254902, 1,
-0.09083143, 0.5843807, -0.6882061, 0, 1, 0.7294118, 1,
-0.0897345, 1.028644, -0.3456194, 0, 1, 0.7372549, 1,
-0.08936588, 0.00791257, -2.671839, 0, 1, 0.7411765, 1,
-0.08576113, -0.8500353, -2.932667, 0, 1, 0.7490196, 1,
-0.08178295, -0.7262971, -1.730373, 0, 1, 0.7529412, 1,
-0.07943843, -0.3781049, -3.762741, 0, 1, 0.7607843, 1,
-0.07931143, -0.8950124, -3.60043, 0, 1, 0.7647059, 1,
-0.0779532, 0.2135476, 0.1979428, 0, 1, 0.772549, 1,
-0.07348685, 1.782158, -0.9933335, 0, 1, 0.7764706, 1,
-0.07261777, 0.3476709, -0.09991596, 0, 1, 0.7843137, 1,
-0.06574156, 0.2677323, 0.294135, 0, 1, 0.7882353, 1,
-0.06151634, -0.7698864, -2.948345, 0, 1, 0.7960784, 1,
-0.06090394, 1.146516, -1.089517, 0, 1, 0.8039216, 1,
-0.06088897, -1.183455, -3.857217, 0, 1, 0.8078431, 1,
-0.05954378, -0.2382926, -3.720609, 0, 1, 0.8156863, 1,
-0.0587241, 0.7707773, -1.313029, 0, 1, 0.8196079, 1,
-0.05590723, -0.545492, -3.034773, 0, 1, 0.827451, 1,
-0.05461444, 1.831104, -0.6722607, 0, 1, 0.8313726, 1,
-0.05185771, -0.1912365, -3.6216, 0, 1, 0.8392157, 1,
-0.05171036, -1.792408, -1.993667, 0, 1, 0.8431373, 1,
-0.05141925, 0.482713, -1.646327, 0, 1, 0.8509804, 1,
-0.05020531, -1.313088, -3.580053, 0, 1, 0.854902, 1,
-0.04963952, 0.4183391, 0.9040789, 0, 1, 0.8627451, 1,
-0.04924849, -2.102583, -4.07302, 0, 1, 0.8666667, 1,
-0.0460245, -0.4412494, -2.34332, 0, 1, 0.8745098, 1,
-0.03790546, 0.1990755, -0.1133581, 0, 1, 0.8784314, 1,
-0.036639, -0.6180983, -2.869607, 0, 1, 0.8862745, 1,
-0.03532742, -0.01059254, -0.7572942, 0, 1, 0.8901961, 1,
-0.03348053, 0.7727735, -0.8391196, 0, 1, 0.8980392, 1,
-0.03223154, 0.05717228, 0.8391516, 0, 1, 0.9058824, 1,
-0.03170073, 0.6904244, 0.6311806, 0, 1, 0.9098039, 1,
-0.02996739, -1.447866, -4.499461, 0, 1, 0.9176471, 1,
-0.02760063, 1.076637, -2.162383, 0, 1, 0.9215686, 1,
-0.02658603, 0.3800662, 0.07554352, 0, 1, 0.9294118, 1,
-0.0236841, -0.5676055, -2.462021, 0, 1, 0.9333333, 1,
-0.02290273, 1.3041, 0.4085736, 0, 1, 0.9411765, 1,
-0.01994904, -0.1179342, -1.155009, 0, 1, 0.945098, 1,
-0.01886133, 0.2550923, -0.8106281, 0, 1, 0.9529412, 1,
-0.01703496, -0.4407378, -3.612038, 0, 1, 0.9568627, 1,
-0.01537139, -0.9368093, -1.350089, 0, 1, 0.9647059, 1,
-0.01119539, 0.01904416, -0.7112898, 0, 1, 0.9686275, 1,
-0.01076904, 1.130851, -0.04520648, 0, 1, 0.9764706, 1,
-0.01007683, -1.018709, -1.964768, 0, 1, 0.9803922, 1,
-0.00977189, -0.3731311, -3.240439, 0, 1, 0.9882353, 1,
-0.001866287, 1.146446, 1.154294, 0, 1, 0.9921569, 1,
-0.001572686, 0.933938, 1.321749, 0, 1, 1, 1,
0.007243319, 0.01668451, 0.433843, 0, 0.9921569, 1, 1,
0.01054829, 0.6251149, 1.052959, 0, 0.9882353, 1, 1,
0.01148527, 0.3362488, -0.252806, 0, 0.9803922, 1, 1,
0.01307997, 0.5875847, -2.013247, 0, 0.9764706, 1, 1,
0.01328678, 1.71922, -0.5810206, 0, 0.9686275, 1, 1,
0.01354662, -2.24149, 3.768622, 0, 0.9647059, 1, 1,
0.01430575, 1.266566, -1.272495, 0, 0.9568627, 1, 1,
0.02630385, 1.020377, 0.5298782, 0, 0.9529412, 1, 1,
0.02676222, -0.632121, 4.794515, 0, 0.945098, 1, 1,
0.031317, -0.4655277, 3.746852, 0, 0.9411765, 1, 1,
0.03189664, -1.496698, 2.907725, 0, 0.9333333, 1, 1,
0.03332281, -1.198052, 2.334794, 0, 0.9294118, 1, 1,
0.03495136, -0.01625209, 1.959534, 0, 0.9215686, 1, 1,
0.03841167, 0.1882775, -0.7188116, 0, 0.9176471, 1, 1,
0.04013293, 0.5894423, 1.367572, 0, 0.9098039, 1, 1,
0.0405741, -1.272727, 2.633404, 0, 0.9058824, 1, 1,
0.04266712, -0.01259065, 1.140993, 0, 0.8980392, 1, 1,
0.04624898, 0.906601, 0.526332, 0, 0.8901961, 1, 1,
0.0496943, 0.873504, -1.147496, 0, 0.8862745, 1, 1,
0.05435539, 0.8403181, -0.5721141, 0, 0.8784314, 1, 1,
0.05584014, 1.260069, 0.9637427, 0, 0.8745098, 1, 1,
0.0569142, 0.2301306, 1.519127, 0, 0.8666667, 1, 1,
0.06303604, 0.0104719, 1.517688, 0, 0.8627451, 1, 1,
0.06830029, -0.4277208, 3.012827, 0, 0.854902, 1, 1,
0.06950334, -0.6607643, 1.624173, 0, 0.8509804, 1, 1,
0.07442854, -0.4998544, 2.21693, 0, 0.8431373, 1, 1,
0.08074627, -0.06516447, 2.307883, 0, 0.8392157, 1, 1,
0.08319917, 0.5460002, -0.260198, 0, 0.8313726, 1, 1,
0.08724095, 1.482435, 0.7697003, 0, 0.827451, 1, 1,
0.08864081, 0.4873321, 1.123416, 0, 0.8196079, 1, 1,
0.09015542, 0.133561, 1.523702, 0, 0.8156863, 1, 1,
0.09456096, -0.01721887, 3.172485, 0, 0.8078431, 1, 1,
0.09735444, -1.530557, 5.437086, 0, 0.8039216, 1, 1,
0.09821049, -0.5884348, 3.021387, 0, 0.7960784, 1, 1,
0.1001157, 0.3038527, -1.622536, 0, 0.7882353, 1, 1,
0.1037171, -0.3370408, 2.998057, 0, 0.7843137, 1, 1,
0.112776, 0.25124, 1.488208, 0, 0.7764706, 1, 1,
0.1173711, -0.9206333, 3.746953, 0, 0.772549, 1, 1,
0.1187494, 0.2214846, 0.9238325, 0, 0.7647059, 1, 1,
0.1291681, -1.498685, 2.286017, 0, 0.7607843, 1, 1,
0.1318409, 0.2963769, 1.770215, 0, 0.7529412, 1, 1,
0.1457358, 0.9790154, 0.4381697, 0, 0.7490196, 1, 1,
0.1461443, 0.2541027, 0.2398779, 0, 0.7411765, 1, 1,
0.1469487, 0.3451805, 0.687448, 0, 0.7372549, 1, 1,
0.1494245, 0.1276113, 1.415944, 0, 0.7294118, 1, 1,
0.1505467, 1.142563, 2.183045, 0, 0.7254902, 1, 1,
0.1550503, 0.5349199, 1.5606, 0, 0.7176471, 1, 1,
0.1601885, -0.7107333, 2.510442, 0, 0.7137255, 1, 1,
0.1615061, 2.805895, 1.109667, 0, 0.7058824, 1, 1,
0.1694205, 0.274174, 1.478529, 0, 0.6980392, 1, 1,
0.1697705, -0.6662872, 1.684256, 0, 0.6941177, 1, 1,
0.1701225, -1.553985, 4.852428, 0, 0.6862745, 1, 1,
0.1754144, -1.584264, 2.657565, 0, 0.682353, 1, 1,
0.1812459, -0.2583144, 5.280775, 0, 0.6745098, 1, 1,
0.181744, 0.5652658, -0.1607577, 0, 0.6705883, 1, 1,
0.1846755, -0.5495818, 1.654295, 0, 0.6627451, 1, 1,
0.1855134, 0.5475841, -0.603895, 0, 0.6588235, 1, 1,
0.1941164, -1.261965, 3.201187, 0, 0.6509804, 1, 1,
0.1946973, -0.3217093, 3.878264, 0, 0.6470588, 1, 1,
0.1952338, 0.165966, 0.1232343, 0, 0.6392157, 1, 1,
0.1964692, -0.8213503, 1.790823, 0, 0.6352941, 1, 1,
0.1990888, -2.955061, 3.133067, 0, 0.627451, 1, 1,
0.2005097, 0.4342088, 0.8025116, 0, 0.6235294, 1, 1,
0.2061691, -0.532987, 2.99911, 0, 0.6156863, 1, 1,
0.2063858, -1.501956, 3.909431, 0, 0.6117647, 1, 1,
0.2093151, -1.515582, 2.101061, 0, 0.6039216, 1, 1,
0.2108075, -0.4994442, 3.177017, 0, 0.5960785, 1, 1,
0.2128696, 2.21319, -1.374652, 0, 0.5921569, 1, 1,
0.2164869, 1.920224, 0.3430878, 0, 0.5843138, 1, 1,
0.2187921, 1.211895, 0.7885842, 0, 0.5803922, 1, 1,
0.2225558, -1.019553, 1.699402, 0, 0.572549, 1, 1,
0.2249174, -2.137952, 2.230781, 0, 0.5686275, 1, 1,
0.2249879, 0.3188433, -0.6717187, 0, 0.5607843, 1, 1,
0.2252389, 0.3050307, 1.601401, 0, 0.5568628, 1, 1,
0.2291379, -0.3238466, 0.8462465, 0, 0.5490196, 1, 1,
0.2317992, -0.3623212, 2.725585, 0, 0.5450981, 1, 1,
0.2434237, -2.271256, 2.035416, 0, 0.5372549, 1, 1,
0.2439185, 0.4708645, 0.3862917, 0, 0.5333334, 1, 1,
0.2492429, -0.4917899, 3.427711, 0, 0.5254902, 1, 1,
0.2506988, -1.07282, 2.142527, 0, 0.5215687, 1, 1,
0.2561648, -0.8576593, 2.766119, 0, 0.5137255, 1, 1,
0.2574049, -0.5909714, 1.744693, 0, 0.509804, 1, 1,
0.257932, 0.8980001, 1.188084, 0, 0.5019608, 1, 1,
0.2627521, -0.4768547, 3.067344, 0, 0.4941176, 1, 1,
0.2715226, -1.450915, 3.811855, 0, 0.4901961, 1, 1,
0.2721224, 1.461826, 1.083552, 0, 0.4823529, 1, 1,
0.2728753, 0.3068455, 1.935197, 0, 0.4784314, 1, 1,
0.2755449, 0.03784529, -0.2854088, 0, 0.4705882, 1, 1,
0.276944, 0.791482, 0.4508748, 0, 0.4666667, 1, 1,
0.2796867, 0.4860641, 1.357776, 0, 0.4588235, 1, 1,
0.2865728, 2.584348, -1.023465, 0, 0.454902, 1, 1,
0.2877078, -0.5606199, 2.241371, 0, 0.4470588, 1, 1,
0.2930208, 0.4704064, 1.934833, 0, 0.4431373, 1, 1,
0.2943372, 0.2287252, 1.774241, 0, 0.4352941, 1, 1,
0.2950823, 0.1975446, 1.909477, 0, 0.4313726, 1, 1,
0.2959054, 0.6841885, 0.3752028, 0, 0.4235294, 1, 1,
0.2965212, 2.21219, 2.156486, 0, 0.4196078, 1, 1,
0.2977636, 0.4695338, 1.19638, 0, 0.4117647, 1, 1,
0.3001356, -0.3026073, 1.411511, 0, 0.4078431, 1, 1,
0.3014184, 0.5292175, 1.111786, 0, 0.4, 1, 1,
0.3055882, -0.559377, 1.268678, 0, 0.3921569, 1, 1,
0.3060869, -0.5346125, 0.8068748, 0, 0.3882353, 1, 1,
0.3067755, -0.5112145, 0.4818642, 0, 0.3803922, 1, 1,
0.3073534, 1.169728, 1.487352, 0, 0.3764706, 1, 1,
0.3085914, -0.3512622, 2.829814, 0, 0.3686275, 1, 1,
0.3121876, -3.287258, 4.4132, 0, 0.3647059, 1, 1,
0.3218731, 0.2364073, 2.121174, 0, 0.3568628, 1, 1,
0.3228371, 0.6917956, -0.5159245, 0, 0.3529412, 1, 1,
0.3239175, -0.8736988, 1.719708, 0, 0.345098, 1, 1,
0.3250557, 0.7005606, 1.1824, 0, 0.3411765, 1, 1,
0.3272907, -0.4586471, 2.331133, 0, 0.3333333, 1, 1,
0.336964, 0.729511, -0.08867812, 0, 0.3294118, 1, 1,
0.3473392, 0.3457268, 1.79073, 0, 0.3215686, 1, 1,
0.350145, 0.8732855, 0.4769639, 0, 0.3176471, 1, 1,
0.3507305, 1.010414, 0.7651529, 0, 0.3098039, 1, 1,
0.35147, 1.087898, -1.13094, 0, 0.3058824, 1, 1,
0.3514793, -0.03679603, 0.4269744, 0, 0.2980392, 1, 1,
0.3582529, -1.975312, 2.178218, 0, 0.2901961, 1, 1,
0.358761, -0.8345287, 2.84888, 0, 0.2862745, 1, 1,
0.3627976, 0.1702943, -0.04233116, 0, 0.2784314, 1, 1,
0.3632687, -0.630588, 2.664422, 0, 0.2745098, 1, 1,
0.3645696, 0.3745731, -0.08204933, 0, 0.2666667, 1, 1,
0.3653395, -0.3335789, 0.536674, 0, 0.2627451, 1, 1,
0.3661358, -0.5196893, 3.960374, 0, 0.254902, 1, 1,
0.3664555, -0.3281662, 1.708713, 0, 0.2509804, 1, 1,
0.3732976, -0.3431172, 1.961591, 0, 0.2431373, 1, 1,
0.3742424, -0.2041039, 2.692261, 0, 0.2392157, 1, 1,
0.3744911, 1.347099, -1.06383, 0, 0.2313726, 1, 1,
0.3803998, 0.5813203, 0.7045302, 0, 0.227451, 1, 1,
0.3829854, -2.53419, 2.871737, 0, 0.2196078, 1, 1,
0.3893549, -0.1604586, 1.573209, 0, 0.2156863, 1, 1,
0.3909257, 1.201316, 1.125158, 0, 0.2078431, 1, 1,
0.3911264, 0.7062919, 0.8611032, 0, 0.2039216, 1, 1,
0.397582, 0.08263861, 0.8699135, 0, 0.1960784, 1, 1,
0.3998939, -0.3214266, 2.782805, 0, 0.1882353, 1, 1,
0.4000656, 0.2305881, 2.358102, 0, 0.1843137, 1, 1,
0.4052553, 0.2461297, 2.053499, 0, 0.1764706, 1, 1,
0.4102395, -0.4196821, 3.55852, 0, 0.172549, 1, 1,
0.4122423, -1.133694, 4.013378, 0, 0.1647059, 1, 1,
0.4134212, -0.1705932, 1.135419, 0, 0.1607843, 1, 1,
0.413956, -0.8245665, 2.076919, 0, 0.1529412, 1, 1,
0.4140716, -1.035094, 2.28535, 0, 0.1490196, 1, 1,
0.4150278, 0.01319203, 0.5292597, 0, 0.1411765, 1, 1,
0.4192683, 1.976247, 1.190176, 0, 0.1372549, 1, 1,
0.4296232, -0.3218897, 3.461354, 0, 0.1294118, 1, 1,
0.434274, -0.2548009, 1.636912, 0, 0.1254902, 1, 1,
0.4358495, -1.422588, 4.174061, 0, 0.1176471, 1, 1,
0.436306, 0.7157125, 0.5091864, 0, 0.1137255, 1, 1,
0.4378856, 0.8238511, 0.05647302, 0, 0.1058824, 1, 1,
0.4393943, 1.601179, 0.408641, 0, 0.09803922, 1, 1,
0.4433005, -0.1593689, 1.48316, 0, 0.09411765, 1, 1,
0.4447775, -0.741387, 1.330014, 0, 0.08627451, 1, 1,
0.4461834, 1.458075, 0.09188367, 0, 0.08235294, 1, 1,
0.4463517, 1.013227, 1.017555, 0, 0.07450981, 1, 1,
0.4518486, -0.185635, 0.8978414, 0, 0.07058824, 1, 1,
0.4582154, 0.1697807, 1.499368, 0, 0.0627451, 1, 1,
0.461864, 0.3637024, 1.44895, 0, 0.05882353, 1, 1,
0.4623997, 0.4228659, 1.472161, 0, 0.05098039, 1, 1,
0.4668282, -1.366175, 2.255106, 0, 0.04705882, 1, 1,
0.4672947, -1.174172, 2.769681, 0, 0.03921569, 1, 1,
0.4674676, -0.01678452, 0.3099808, 0, 0.03529412, 1, 1,
0.4686374, -0.386573, 0.7451287, 0, 0.02745098, 1, 1,
0.4690487, -0.5450808, 1.606346, 0, 0.02352941, 1, 1,
0.4745055, -0.6555628, 1.023148, 0, 0.01568628, 1, 1,
0.4780961, 0.7723471, 0.1825692, 0, 0.01176471, 1, 1,
0.4815065, -2.382908, 1.967202, 0, 0.003921569, 1, 1,
0.4872541, -0.7811128, 1.680565, 0.003921569, 0, 1, 1,
0.4888344, -0.3567215, 2.529581, 0.007843138, 0, 1, 1,
0.490525, -1.117722, 1.002922, 0.01568628, 0, 1, 1,
0.4998096, -0.03714288, 1.83119, 0.01960784, 0, 1, 1,
0.5038929, -1.963798, 3.794619, 0.02745098, 0, 1, 1,
0.5054196, 2.098696, 2.383192, 0.03137255, 0, 1, 1,
0.5057169, 0.08817478, 1.701659, 0.03921569, 0, 1, 1,
0.5071523, -2.504282, 3.719685, 0.04313726, 0, 1, 1,
0.5086199, 1.153388, 0.8668919, 0.05098039, 0, 1, 1,
0.5121, -0.3302982, 1.956613, 0.05490196, 0, 1, 1,
0.5173108, -0.04392777, 1.46824, 0.0627451, 0, 1, 1,
0.520444, 0.3615164, 0.05038505, 0.06666667, 0, 1, 1,
0.5284551, 0.5409357, 0.8302788, 0.07450981, 0, 1, 1,
0.5297816, 0.364208, 1.678307, 0.07843138, 0, 1, 1,
0.5371303, 1.352363, -0.8930011, 0.08627451, 0, 1, 1,
0.5394702, -1.183692, 2.879728, 0.09019608, 0, 1, 1,
0.5412617, -2.367003, 5.117209, 0.09803922, 0, 1, 1,
0.5491681, -0.9843146, 2.630963, 0.1058824, 0, 1, 1,
0.5510321, 0.4533072, 2.284753, 0.1098039, 0, 1, 1,
0.552088, 0.750447, 0.7611039, 0.1176471, 0, 1, 1,
0.5554766, 0.2606186, -0.7195951, 0.1215686, 0, 1, 1,
0.557137, 1.670165, -0.8478107, 0.1294118, 0, 1, 1,
0.5572082, -0.3261376, 4.367624, 0.1333333, 0, 1, 1,
0.5578853, -0.7907109, 3.265602, 0.1411765, 0, 1, 1,
0.5648366, 0.738306, 0.09194435, 0.145098, 0, 1, 1,
0.5716248, -1.181886, 3.401256, 0.1529412, 0, 1, 1,
0.5731096, 0.1661843, 0.7663827, 0.1568628, 0, 1, 1,
0.5792813, -1.472349, 3.016519, 0.1647059, 0, 1, 1,
0.5826049, 1.354458, -1.273404, 0.1686275, 0, 1, 1,
0.5836175, 1.768639, 2.110939, 0.1764706, 0, 1, 1,
0.5839332, -0.05701207, 0.3643345, 0.1803922, 0, 1, 1,
0.584176, -0.4832886, 3.296535, 0.1882353, 0, 1, 1,
0.5846303, 1.004068, 2.133861, 0.1921569, 0, 1, 1,
0.5923147, -0.9395473, 2.265012, 0.2, 0, 1, 1,
0.593735, -0.2006905, 2.823359, 0.2078431, 0, 1, 1,
0.5939264, 0.8446482, -0.02058647, 0.2117647, 0, 1, 1,
0.5945227, 0.2300661, 2.266956, 0.2196078, 0, 1, 1,
0.5959941, 0.8120142, 0.9209814, 0.2235294, 0, 1, 1,
0.5969108, -0.4610498, 1.541289, 0.2313726, 0, 1, 1,
0.5985093, -0.5188987, 2.133833, 0.2352941, 0, 1, 1,
0.6006613, 0.3367162, 1.241458, 0.2431373, 0, 1, 1,
0.6025825, -0.9213364, 3.060936, 0.2470588, 0, 1, 1,
0.6051386, 1.610975, -0.08233669, 0.254902, 0, 1, 1,
0.6055599, -1.102572, 2.084135, 0.2588235, 0, 1, 1,
0.6098747, 0.3435435, 1.270744, 0.2666667, 0, 1, 1,
0.6103875, -0.3462331, 3.131603, 0.2705882, 0, 1, 1,
0.6118313, -0.1380346, 1.008317, 0.2784314, 0, 1, 1,
0.6157908, 0.8138947, 1.720411, 0.282353, 0, 1, 1,
0.6172074, -1.337865, 3.478328, 0.2901961, 0, 1, 1,
0.6178935, -0.7077405, 2.550573, 0.2941177, 0, 1, 1,
0.6251162, 0.01756233, 1.675418, 0.3019608, 0, 1, 1,
0.6271126, -1.908638, 3.517349, 0.3098039, 0, 1, 1,
0.6341775, -1.318803, 0.8519409, 0.3137255, 0, 1, 1,
0.6350973, 0.1138805, 1.365937, 0.3215686, 0, 1, 1,
0.6353558, 2.409203, 0.659834, 0.3254902, 0, 1, 1,
0.6356019, 0.4771187, 0.489636, 0.3333333, 0, 1, 1,
0.6368333, 1.341048, -1.246884, 0.3372549, 0, 1, 1,
0.6389921, -0.9378984, 1.98797, 0.345098, 0, 1, 1,
0.6425785, 0.1979053, 1.743035, 0.3490196, 0, 1, 1,
0.6430461, -0.09678172, 0.1017838, 0.3568628, 0, 1, 1,
0.6446579, 1.274371, -0.18189, 0.3607843, 0, 1, 1,
0.644991, 1.055902, 0.1493437, 0.3686275, 0, 1, 1,
0.6455317, 0.2574355, 2.261483, 0.372549, 0, 1, 1,
0.6457689, 0.6008346, -0.8713419, 0.3803922, 0, 1, 1,
0.6483902, 1.021877, 3.282208, 0.3843137, 0, 1, 1,
0.6494478, -2.11445, 2.765492, 0.3921569, 0, 1, 1,
0.651176, 1.238501, 2.017849, 0.3960784, 0, 1, 1,
0.6544858, 0.8727574, -0.2084872, 0.4039216, 0, 1, 1,
0.6574687, 1.398233, -1.306756, 0.4117647, 0, 1, 1,
0.658632, 0.7159884, 1.126821, 0.4156863, 0, 1, 1,
0.6600475, 1.320478, 0.2164259, 0.4235294, 0, 1, 1,
0.6641301, -0.9097748, 2.802227, 0.427451, 0, 1, 1,
0.6662182, -0.3429497, 0.3685413, 0.4352941, 0, 1, 1,
0.6688133, 0.8870897, 1.070541, 0.4392157, 0, 1, 1,
0.6728823, -0.9793314, 2.422416, 0.4470588, 0, 1, 1,
0.6758734, 0.6874043, 2.243014, 0.4509804, 0, 1, 1,
0.6761848, -0.3872094, 1.438892, 0.4588235, 0, 1, 1,
0.6777721, 0.5757021, 0.8688592, 0.4627451, 0, 1, 1,
0.6786072, -2.232583, 3.393456, 0.4705882, 0, 1, 1,
0.6803452, 1.099516, -1.971254, 0.4745098, 0, 1, 1,
0.6811189, -0.4838492, 1.340109, 0.4823529, 0, 1, 1,
0.6846979, 1.745881, 0.3523765, 0.4862745, 0, 1, 1,
0.6851473, 1.386876, 1.47823, 0.4941176, 0, 1, 1,
0.6960706, -0.4890629, 2.387561, 0.5019608, 0, 1, 1,
0.7004476, -0.5163696, 0.8519622, 0.5058824, 0, 1, 1,
0.703535, -0.3258864, 0.7319536, 0.5137255, 0, 1, 1,
0.7038635, -0.8097339, 1.77264, 0.5176471, 0, 1, 1,
0.7039678, 0.8639045, 0.5313444, 0.5254902, 0, 1, 1,
0.7053352, 0.1052672, 1.387451, 0.5294118, 0, 1, 1,
0.7075099, -0.43, 1.661711, 0.5372549, 0, 1, 1,
0.710335, -0.4101104, 4.106043, 0.5411765, 0, 1, 1,
0.7152185, -1.204865, 2.288612, 0.5490196, 0, 1, 1,
0.7155664, -0.7280051, 0.9227848, 0.5529412, 0, 1, 1,
0.7174699, 0.5962245, 0.9420655, 0.5607843, 0, 1, 1,
0.7187483, 1.102055, -0.4223225, 0.5647059, 0, 1, 1,
0.730115, -0.4078171, 1.605502, 0.572549, 0, 1, 1,
0.7313201, -0.2658713, 2.185824, 0.5764706, 0, 1, 1,
0.7315478, -1.645626, 2.763381, 0.5843138, 0, 1, 1,
0.7350292, 0.5248263, -0.01844927, 0.5882353, 0, 1, 1,
0.7399407, -0.1065715, 1.112871, 0.5960785, 0, 1, 1,
0.7438961, -0.3319997, 3.066482, 0.6039216, 0, 1, 1,
0.747169, -0.4984039, 1.956249, 0.6078432, 0, 1, 1,
0.7501612, 0.3994762, -0.7609114, 0.6156863, 0, 1, 1,
0.752066, 0.1198977, 1.439616, 0.6196079, 0, 1, 1,
0.7530735, 1.262257, -1.166161, 0.627451, 0, 1, 1,
0.7559265, -0.6078631, 0.8682317, 0.6313726, 0, 1, 1,
0.7581037, 0.005070263, 1.838634, 0.6392157, 0, 1, 1,
0.7608084, -0.1793038, 2.705709, 0.6431373, 0, 1, 1,
0.7630922, 1.642953, 1.393718, 0.6509804, 0, 1, 1,
0.7645688, 0.4009669, 2.144444, 0.654902, 0, 1, 1,
0.7648845, -1.003112, 4.459432, 0.6627451, 0, 1, 1,
0.7670447, 2.600091, 0.2978026, 0.6666667, 0, 1, 1,
0.7690817, -1.592901, 2.587657, 0.6745098, 0, 1, 1,
0.7720028, 1.243986, 0.56106, 0.6784314, 0, 1, 1,
0.7742895, 0.1196845, 2.319751, 0.6862745, 0, 1, 1,
0.7766859, 1.07759, 0.9777303, 0.6901961, 0, 1, 1,
0.7830685, -0.9527848, 2.403554, 0.6980392, 0, 1, 1,
0.7840776, 1.179232, 3.96754, 0.7058824, 0, 1, 1,
0.7882368, -0.6324629, 2.965967, 0.7098039, 0, 1, 1,
0.7896716, -0.4573734, 2.501071, 0.7176471, 0, 1, 1,
0.7897707, 0.2364037, 1.745675, 0.7215686, 0, 1, 1,
0.7900131, -0.4965199, 2.376523, 0.7294118, 0, 1, 1,
0.7934256, -0.01196274, -0.5930847, 0.7333333, 0, 1, 1,
0.7941942, 0.4509642, 0.9136998, 0.7411765, 0, 1, 1,
0.7972009, -0.1152385, 3.676484, 0.7450981, 0, 1, 1,
0.7978029, -0.2706765, 1.241099, 0.7529412, 0, 1, 1,
0.804071, -0.2415073, 3.268224, 0.7568628, 0, 1, 1,
0.8042897, -0.4719012, 4.096559, 0.7647059, 0, 1, 1,
0.8066898, -0.9805354, 1.385491, 0.7686275, 0, 1, 1,
0.8103763, 2.069167, -1.163099, 0.7764706, 0, 1, 1,
0.811415, -1.269475, 2.280941, 0.7803922, 0, 1, 1,
0.8149066, 0.8821794, 0.9308426, 0.7882353, 0, 1, 1,
0.8157187, 2.835815, -0.3474755, 0.7921569, 0, 1, 1,
0.8215125, 0.2226756, 0.5667747, 0.8, 0, 1, 1,
0.8264012, -1.38999, 2.574299, 0.8078431, 0, 1, 1,
0.8302434, 1.177876, 0.1791258, 0.8117647, 0, 1, 1,
0.8306987, -2.769852, 2.356352, 0.8196079, 0, 1, 1,
0.833684, 0.5646997, 1.242568, 0.8235294, 0, 1, 1,
0.8374995, -1.960479, 2.57652, 0.8313726, 0, 1, 1,
0.8407264, -1.470476, 1.926046, 0.8352941, 0, 1, 1,
0.8429194, -1.378728, 2.762478, 0.8431373, 0, 1, 1,
0.8476416, -0.4022519, 3.213111, 0.8470588, 0, 1, 1,
0.8524106, -2.306313, 3.268579, 0.854902, 0, 1, 1,
0.8530999, -0.4462613, 1.134189, 0.8588235, 0, 1, 1,
0.8567734, -0.5775441, 2.409894, 0.8666667, 0, 1, 1,
0.8613191, -0.4736309, 3.338925, 0.8705882, 0, 1, 1,
0.8639877, -0.8321704, 2.341182, 0.8784314, 0, 1, 1,
0.8662682, 0.7209305, -0.04543661, 0.8823529, 0, 1, 1,
0.872753, 0.1175169, 2.329283, 0.8901961, 0, 1, 1,
0.8749524, -0.3452677, 3.337781, 0.8941177, 0, 1, 1,
0.8801864, -0.2765132, 1.608947, 0.9019608, 0, 1, 1,
0.8863758, -1.155304, 1.198949, 0.9098039, 0, 1, 1,
0.8903814, 0.645309, 0.5753291, 0.9137255, 0, 1, 1,
0.891544, 0.573779, 0.8474355, 0.9215686, 0, 1, 1,
0.8997556, 0.5765647, 2.059668, 0.9254902, 0, 1, 1,
0.9055709, 0.1266609, 1.27486, 0.9333333, 0, 1, 1,
0.9059325, 2.330034, 0.694521, 0.9372549, 0, 1, 1,
0.907308, 1.273917, -0.6878266, 0.945098, 0, 1, 1,
0.9078875, 2.074575, -0.9026864, 0.9490196, 0, 1, 1,
0.9105125, -0.2189749, 2.523358, 0.9568627, 0, 1, 1,
0.9108728, -1.182089, 3.597684, 0.9607843, 0, 1, 1,
0.9158961, -1.439746, 4.073336, 0.9686275, 0, 1, 1,
0.9164692, 0.3433061, 2.178334, 0.972549, 0, 1, 1,
0.9164931, -0.1174635, -0.1097081, 0.9803922, 0, 1, 1,
0.9166806, -0.09532649, 1.558136, 0.9843137, 0, 1, 1,
0.9227489, -0.6850145, 1.325612, 0.9921569, 0, 1, 1,
0.9277018, -0.9972172, 3.253593, 0.9960784, 0, 1, 1,
0.9404725, 0.5373943, 0.7503708, 1, 0, 0.9960784, 1,
0.9414901, -0.3754033, 0.6957648, 1, 0, 0.9882353, 1,
0.946556, -0.8512532, 1.597736, 1, 0, 0.9843137, 1,
0.946842, -0.04638815, 1.299289, 1, 0, 0.9764706, 1,
0.9554663, -0.874093, 2.329319, 1, 0, 0.972549, 1,
0.9664165, -1.04583, 1.768949, 1, 0, 0.9647059, 1,
0.9672557, -1.277368, 1.885237, 1, 0, 0.9607843, 1,
0.9682922, -0.07178118, 4.146519, 1, 0, 0.9529412, 1,
0.9720226, 2.049372, -0.457723, 1, 0, 0.9490196, 1,
0.9729382, -1.047964, 3.954736, 1, 0, 0.9411765, 1,
0.9764638, -0.9982427, 2.80621, 1, 0, 0.9372549, 1,
0.978716, 0.3599673, 1.526457, 1, 0, 0.9294118, 1,
0.9828151, 1.126457, -0.5979114, 1, 0, 0.9254902, 1,
0.9834035, 0.5344746, 0.220311, 1, 0, 0.9176471, 1,
0.9887563, -1.764388, 3.942232, 1, 0, 0.9137255, 1,
0.9948735, -1.662679, 3.438362, 1, 0, 0.9058824, 1,
1.000265, -0.6203515, 4.05593, 1, 0, 0.9019608, 1,
1.002838, 0.7629042, 1.872591, 1, 0, 0.8941177, 1,
1.003416, -0.2190762, 1.215861, 1, 0, 0.8862745, 1,
1.004158, 1.141316, 1.11605, 1, 0, 0.8823529, 1,
1.006957, -0.4225436, 2.237485, 1, 0, 0.8745098, 1,
1.00932, 2.163689, 0.8661147, 1, 0, 0.8705882, 1,
1.028674, -0.1599859, 1.26054, 1, 0, 0.8627451, 1,
1.032778, 0.3369349, 0.6202125, 1, 0, 0.8588235, 1,
1.034905, -0.9072449, 3.849345, 1, 0, 0.8509804, 1,
1.035426, -0.5049772, 3.310365, 1, 0, 0.8470588, 1,
1.038577, 0.9129408, 1.03416, 1, 0, 0.8392157, 1,
1.042356, -0.4978058, 3.541512, 1, 0, 0.8352941, 1,
1.048264, -1.874909, 3.49764, 1, 0, 0.827451, 1,
1.048557, 0.369765, 1.567507, 1, 0, 0.8235294, 1,
1.056614, -0.02633561, 1.36542, 1, 0, 0.8156863, 1,
1.066914, -0.8509265, 2.571999, 1, 0, 0.8117647, 1,
1.070446, 0.4134892, 0.320778, 1, 0, 0.8039216, 1,
1.074126, 0.07933471, 2.40772, 1, 0, 0.7960784, 1,
1.078596, -1.386826, 1.458947, 1, 0, 0.7921569, 1,
1.081176, 0.08600925, 1.632386, 1, 0, 0.7843137, 1,
1.083361, -0.9834386, 1.989091, 1, 0, 0.7803922, 1,
1.097697, -2.872538, 2.544592, 1, 0, 0.772549, 1,
1.113573, 1.295862, 2.922187, 1, 0, 0.7686275, 1,
1.131436, -0.1120312, 2.60183, 1, 0, 0.7607843, 1,
1.1322, -1.607248, 1.971204, 1, 0, 0.7568628, 1,
1.139253, 0.4427899, 0.5542364, 1, 0, 0.7490196, 1,
1.140288, 1.3401, 1.049512, 1, 0, 0.7450981, 1,
1.146846, -0.196558, 1.062165, 1, 0, 0.7372549, 1,
1.14688, -1.018046, 1.2016, 1, 0, 0.7333333, 1,
1.15667, -1.21309, 3.028087, 1, 0, 0.7254902, 1,
1.162392, 0.1013092, 2.730513, 1, 0, 0.7215686, 1,
1.164026, -1.155654, 3.566853, 1, 0, 0.7137255, 1,
1.170737, 1.554012, 0.8639457, 1, 0, 0.7098039, 1,
1.175425, -0.7905607, 2.323353, 1, 0, 0.7019608, 1,
1.186457, -0.244139, 0.9973307, 1, 0, 0.6941177, 1,
1.190172, 0.5279039, 1.459224, 1, 0, 0.6901961, 1,
1.193119, 0.4954089, 0.5175096, 1, 0, 0.682353, 1,
1.197024, -0.7151973, 2.201252, 1, 0, 0.6784314, 1,
1.197176, 0.2862746, 1.597302, 1, 0, 0.6705883, 1,
1.200105, -1.269973, 2.225742, 1, 0, 0.6666667, 1,
1.201346, 1.30419, 0.09609801, 1, 0, 0.6588235, 1,
1.212277, -0.4292619, 1.444778, 1, 0, 0.654902, 1,
1.216542, -1.069796, 0.7806528, 1, 0, 0.6470588, 1,
1.217481, 1.006274, 0.05666973, 1, 0, 0.6431373, 1,
1.219518, -2.798306, 2.459186, 1, 0, 0.6352941, 1,
1.224652, -0.6587163, 1.542247, 1, 0, 0.6313726, 1,
1.224691, -0.5677465, 3.097535, 1, 0, 0.6235294, 1,
1.229283, -0.08087599, 0.9983345, 1, 0, 0.6196079, 1,
1.241367, -1.201101, 2.261855, 1, 0, 0.6117647, 1,
1.242208, -1.658069, 2.218756, 1, 0, 0.6078432, 1,
1.249996, -0.2951165, 3.061322, 1, 0, 0.6, 1,
1.257644, -1.084112, 1.392101, 1, 0, 0.5921569, 1,
1.257729, 0.7700055, 0.8729199, 1, 0, 0.5882353, 1,
1.259874, 0.0527426, 2.22275, 1, 0, 0.5803922, 1,
1.264505, -2.195185, 3.003322, 1, 0, 0.5764706, 1,
1.265465, 0.4443503, 2.049058, 1, 0, 0.5686275, 1,
1.268324, 0.1484682, 1.617308, 1, 0, 0.5647059, 1,
1.276414, -0.1393817, 3.501271, 1, 0, 0.5568628, 1,
1.282098, 0.5933371, 0.8306609, 1, 0, 0.5529412, 1,
1.285458, 0.3575405, 1.689831, 1, 0, 0.5450981, 1,
1.288388, 0.7515755, 0.08025503, 1, 0, 0.5411765, 1,
1.292257, -0.2656547, 3.459507, 1, 0, 0.5333334, 1,
1.292603, 0.2517347, -0.4041482, 1, 0, 0.5294118, 1,
1.309898, -0.5794974, 1.598208, 1, 0, 0.5215687, 1,
1.313711, 0.7680015, 2.732074, 1, 0, 0.5176471, 1,
1.323191, 0.3574188, 2.365783, 1, 0, 0.509804, 1,
1.339062, 0.1897136, 0.3668989, 1, 0, 0.5058824, 1,
1.339186, 0.1565825, 1.58916, 1, 0, 0.4980392, 1,
1.340507, -1.553878, 2.637682, 1, 0, 0.4901961, 1,
1.342662, -0.9618522, 2.334601, 1, 0, 0.4862745, 1,
1.343807, -0.5023504, 2.081023, 1, 0, 0.4784314, 1,
1.344794, -1.17657, 0.7363247, 1, 0, 0.4745098, 1,
1.374474, -0.4801278, 1.004906, 1, 0, 0.4666667, 1,
1.38325, 1.066442, 1.731975, 1, 0, 0.4627451, 1,
1.38495, -1.389634, 1.785315, 1, 0, 0.454902, 1,
1.402736, -0.8086352, 2.017139, 1, 0, 0.4509804, 1,
1.411983, -0.3889698, 0.3837551, 1, 0, 0.4431373, 1,
1.431373, -1.464642, 3.341251, 1, 0, 0.4392157, 1,
1.432366, 0.750846, 3.433336, 1, 0, 0.4313726, 1,
1.437558, 1.119978, 0.8962858, 1, 0, 0.427451, 1,
1.446753, 1.082397, 0.0563929, 1, 0, 0.4196078, 1,
1.45347, -1.316397, 5.426935, 1, 0, 0.4156863, 1,
1.473335, 0.1747764, 0.3195285, 1, 0, 0.4078431, 1,
1.493772, -0.1763881, 0.8476721, 1, 0, 0.4039216, 1,
1.496283, -0.5316159, 2.499074, 1, 0, 0.3960784, 1,
1.496464, 0.2287762, 0.7645979, 1, 0, 0.3882353, 1,
1.51269, -0.3077281, 0.7981244, 1, 0, 0.3843137, 1,
1.52745, -0.7625312, 0.8715712, 1, 0, 0.3764706, 1,
1.53025, 0.06277917, 1.071397, 1, 0, 0.372549, 1,
1.533917, -0.945723, 2.141124, 1, 0, 0.3647059, 1,
1.542909, -0.5461963, 1.248757, 1, 0, 0.3607843, 1,
1.545093, 0.2010422, 2.593932, 1, 0, 0.3529412, 1,
1.557051, 0.3841455, 1.544552, 1, 0, 0.3490196, 1,
1.568147, 0.2805417, 0.3909906, 1, 0, 0.3411765, 1,
1.58663, -0.9617974, 1.999586, 1, 0, 0.3372549, 1,
1.595967, -0.5130347, 2.043023, 1, 0, 0.3294118, 1,
1.59777, -0.9920251, 2.715723, 1, 0, 0.3254902, 1,
1.603073, 0.6388505, 2.13309, 1, 0, 0.3176471, 1,
1.623456, -1.226214, 3.981293, 1, 0, 0.3137255, 1,
1.630286, -0.4361498, 2.182626, 1, 0, 0.3058824, 1,
1.632905, -0.04348018, -0.1452096, 1, 0, 0.2980392, 1,
1.683223, 0.5059918, 3.713816, 1, 0, 0.2941177, 1,
1.68771, -0.9506966, 1.82617, 1, 0, 0.2862745, 1,
1.704297, 0.3877417, 1.495669, 1, 0, 0.282353, 1,
1.71389, 0.9209967, 0.1236098, 1, 0, 0.2745098, 1,
1.714873, 0.4654052, 0.2658855, 1, 0, 0.2705882, 1,
1.714905, 0.217257, 0.9871964, 1, 0, 0.2627451, 1,
1.721443, -1.122851, -0.003626827, 1, 0, 0.2588235, 1,
1.7385, 1.33879, 3.578069, 1, 0, 0.2509804, 1,
1.73878, -0.3649471, 0.382695, 1, 0, 0.2470588, 1,
1.798015, -0.5997675, 0.9952818, 1, 0, 0.2392157, 1,
1.815575, 0.9868007, 0.8470625, 1, 0, 0.2352941, 1,
1.836491, 0.4424881, 0.6053119, 1, 0, 0.227451, 1,
1.838517, -1.978184, 3.258276, 1, 0, 0.2235294, 1,
1.86385, 1.109147, 1.049339, 1, 0, 0.2156863, 1,
1.870892, -0.1900822, 0.9113145, 1, 0, 0.2117647, 1,
1.880145, 1.261586, 1.538747, 1, 0, 0.2039216, 1,
1.880435, -1.082989, 1.005458, 1, 0, 0.1960784, 1,
1.911981, 0.6061772, 1.409261, 1, 0, 0.1921569, 1,
1.915885, -0.03421701, 2.395286, 1, 0, 0.1843137, 1,
1.955862, 0.1245889, -0.136254, 1, 0, 0.1803922, 1,
1.956641, -1.516745, 3.229169, 1, 0, 0.172549, 1,
1.974204, 1.837264, -0.1840091, 1, 0, 0.1686275, 1,
1.974287, 0.02528358, 2.836791, 1, 0, 0.1607843, 1,
1.976128, -2.324983, 2.292575, 1, 0, 0.1568628, 1,
1.980582, 0.1721391, 1.299484, 1, 0, 0.1490196, 1,
2.018235, -0.4493475, 0.7533536, 1, 0, 0.145098, 1,
2.042688, -1.357241, 2.195717, 1, 0, 0.1372549, 1,
2.123991, 0.2812804, 2.892342, 1, 0, 0.1333333, 1,
2.13274, 0.1594316, 2.14959, 1, 0, 0.1254902, 1,
2.133443, 0.02785122, 1.421891, 1, 0, 0.1215686, 1,
2.138629, 0.3933624, 3.227968, 1, 0, 0.1137255, 1,
2.15449, -0.1207505, 0.7915645, 1, 0, 0.1098039, 1,
2.157984, 0.3439342, 2.028095, 1, 0, 0.1019608, 1,
2.187524, -0.2306068, 2.522537, 1, 0, 0.09411765, 1,
2.207306, -1.352811, 1.274589, 1, 0, 0.09019608, 1,
2.235656, -0.01947591, 0.2311017, 1, 0, 0.08235294, 1,
2.278649, 0.0561042, 1.948232, 1, 0, 0.07843138, 1,
2.450242, -1.703239, 2.722951, 1, 0, 0.07058824, 1,
2.506141, -1.562796, 3.547493, 1, 0, 0.06666667, 1,
2.571459, -2.192921, 2.499884, 1, 0, 0.05882353, 1,
2.661079, 0.3252297, 1.26682, 1, 0, 0.05490196, 1,
2.709674, -0.7742631, 1.29669, 1, 0, 0.04705882, 1,
2.713293, 0.4069115, 2.272779, 1, 0, 0.04313726, 1,
2.761197, 0.6226439, 2.799151, 1, 0, 0.03529412, 1,
2.862419, -0.9112059, 2.510697, 1, 0, 0.03137255, 1,
2.931693, -2.324794, 2.638753, 1, 0, 0.02352941, 1,
3.05556, 0.4838743, 0.3039071, 1, 0, 0.01960784, 1,
3.200998, 0.7458898, 1.503334, 1, 0, 0.01176471, 1,
3.424706, -0.2920061, 0.5860688, 1, 0, 0.007843138, 1
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
0.2420995, -4.325119, -6.980485, 0, -0.5, 0.5, 0.5,
0.2420995, -4.325119, -6.980485, 1, -0.5, 0.5, 0.5,
0.2420995, -4.325119, -6.980485, 1, 1.5, 0.5, 0.5,
0.2420995, -4.325119, -6.980485, 0, 1.5, 0.5, 0.5
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
-4.01941, -0.2257215, -6.980485, 0, -0.5, 0.5, 0.5,
-4.01941, -0.2257215, -6.980485, 1, -0.5, 0.5, 0.5,
-4.01941, -0.2257215, -6.980485, 1, 1.5, 0.5, 0.5,
-4.01941, -0.2257215, -6.980485, 0, 1.5, 0.5, 0.5
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
-4.01941, -4.325119, 0.1281631, 0, -0.5, 0.5, 0.5,
-4.01941, -4.325119, 0.1281631, 1, -0.5, 0.5, 0.5,
-4.01941, -4.325119, 0.1281631, 1, 1.5, 0.5, 0.5,
-4.01941, -4.325119, 0.1281631, 0, 1.5, 0.5, 0.5
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
-2, -3.379104, -5.340028,
3, -3.379104, -5.340028,
-2, -3.379104, -5.340028,
-2, -3.536774, -5.613437,
-1, -3.379104, -5.340028,
-1, -3.536774, -5.613437,
0, -3.379104, -5.340028,
0, -3.536774, -5.613437,
1, -3.379104, -5.340028,
1, -3.536774, -5.613437,
2, -3.379104, -5.340028,
2, -3.536774, -5.613437,
3, -3.379104, -5.340028,
3, -3.536774, -5.613437
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
-2, -3.852112, -6.160256, 0, -0.5, 0.5, 0.5,
-2, -3.852112, -6.160256, 1, -0.5, 0.5, 0.5,
-2, -3.852112, -6.160256, 1, 1.5, 0.5, 0.5,
-2, -3.852112, -6.160256, 0, 1.5, 0.5, 0.5,
-1, -3.852112, -6.160256, 0, -0.5, 0.5, 0.5,
-1, -3.852112, -6.160256, 1, -0.5, 0.5, 0.5,
-1, -3.852112, -6.160256, 1, 1.5, 0.5, 0.5,
-1, -3.852112, -6.160256, 0, 1.5, 0.5, 0.5,
0, -3.852112, -6.160256, 0, -0.5, 0.5, 0.5,
0, -3.852112, -6.160256, 1, -0.5, 0.5, 0.5,
0, -3.852112, -6.160256, 1, 1.5, 0.5, 0.5,
0, -3.852112, -6.160256, 0, 1.5, 0.5, 0.5,
1, -3.852112, -6.160256, 0, -0.5, 0.5, 0.5,
1, -3.852112, -6.160256, 1, -0.5, 0.5, 0.5,
1, -3.852112, -6.160256, 1, 1.5, 0.5, 0.5,
1, -3.852112, -6.160256, 0, 1.5, 0.5, 0.5,
2, -3.852112, -6.160256, 0, -0.5, 0.5, 0.5,
2, -3.852112, -6.160256, 1, -0.5, 0.5, 0.5,
2, -3.852112, -6.160256, 1, 1.5, 0.5, 0.5,
2, -3.852112, -6.160256, 0, 1.5, 0.5, 0.5,
3, -3.852112, -6.160256, 0, -0.5, 0.5, 0.5,
3, -3.852112, -6.160256, 1, -0.5, 0.5, 0.5,
3, -3.852112, -6.160256, 1, 1.5, 0.5, 0.5,
3, -3.852112, -6.160256, 0, 1.5, 0.5, 0.5
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
-3.035985, -3, -5.340028,
-3.035985, 2, -5.340028,
-3.035985, -3, -5.340028,
-3.199889, -3, -5.613437,
-3.035985, -2, -5.340028,
-3.199889, -2, -5.613437,
-3.035985, -1, -5.340028,
-3.199889, -1, -5.613437,
-3.035985, 0, -5.340028,
-3.199889, 0, -5.613437,
-3.035985, 1, -5.340028,
-3.199889, 1, -5.613437,
-3.035985, 2, -5.340028,
-3.199889, 2, -5.613437
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
-3.527697, -3, -6.160256, 0, -0.5, 0.5, 0.5,
-3.527697, -3, -6.160256, 1, -0.5, 0.5, 0.5,
-3.527697, -3, -6.160256, 1, 1.5, 0.5, 0.5,
-3.527697, -3, -6.160256, 0, 1.5, 0.5, 0.5,
-3.527697, -2, -6.160256, 0, -0.5, 0.5, 0.5,
-3.527697, -2, -6.160256, 1, -0.5, 0.5, 0.5,
-3.527697, -2, -6.160256, 1, 1.5, 0.5, 0.5,
-3.527697, -2, -6.160256, 0, 1.5, 0.5, 0.5,
-3.527697, -1, -6.160256, 0, -0.5, 0.5, 0.5,
-3.527697, -1, -6.160256, 1, -0.5, 0.5, 0.5,
-3.527697, -1, -6.160256, 1, 1.5, 0.5, 0.5,
-3.527697, -1, -6.160256, 0, 1.5, 0.5, 0.5,
-3.527697, 0, -6.160256, 0, -0.5, 0.5, 0.5,
-3.527697, 0, -6.160256, 1, -0.5, 0.5, 0.5,
-3.527697, 0, -6.160256, 1, 1.5, 0.5, 0.5,
-3.527697, 0, -6.160256, 0, 1.5, 0.5, 0.5,
-3.527697, 1, -6.160256, 0, -0.5, 0.5, 0.5,
-3.527697, 1, -6.160256, 1, -0.5, 0.5, 0.5,
-3.527697, 1, -6.160256, 1, 1.5, 0.5, 0.5,
-3.527697, 1, -6.160256, 0, 1.5, 0.5, 0.5,
-3.527697, 2, -6.160256, 0, -0.5, 0.5, 0.5,
-3.527697, 2, -6.160256, 1, -0.5, 0.5, 0.5,
-3.527697, 2, -6.160256, 1, 1.5, 0.5, 0.5,
-3.527697, 2, -6.160256, 0, 1.5, 0.5, 0.5
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
-3.035985, -3.379104, -4,
-3.035985, -3.379104, 4,
-3.035985, -3.379104, -4,
-3.199889, -3.536774, -4,
-3.035985, -3.379104, -2,
-3.199889, -3.536774, -2,
-3.035985, -3.379104, 0,
-3.199889, -3.536774, 0,
-3.035985, -3.379104, 2,
-3.199889, -3.536774, 2,
-3.035985, -3.379104, 4,
-3.199889, -3.536774, 4
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
-3.527697, -3.852112, -4, 0, -0.5, 0.5, 0.5,
-3.527697, -3.852112, -4, 1, -0.5, 0.5, 0.5,
-3.527697, -3.852112, -4, 1, 1.5, 0.5, 0.5,
-3.527697, -3.852112, -4, 0, 1.5, 0.5, 0.5,
-3.527697, -3.852112, -2, 0, -0.5, 0.5, 0.5,
-3.527697, -3.852112, -2, 1, -0.5, 0.5, 0.5,
-3.527697, -3.852112, -2, 1, 1.5, 0.5, 0.5,
-3.527697, -3.852112, -2, 0, 1.5, 0.5, 0.5,
-3.527697, -3.852112, 0, 0, -0.5, 0.5, 0.5,
-3.527697, -3.852112, 0, 1, -0.5, 0.5, 0.5,
-3.527697, -3.852112, 0, 1, 1.5, 0.5, 0.5,
-3.527697, -3.852112, 0, 0, 1.5, 0.5, 0.5,
-3.527697, -3.852112, 2, 0, -0.5, 0.5, 0.5,
-3.527697, -3.852112, 2, 1, -0.5, 0.5, 0.5,
-3.527697, -3.852112, 2, 1, 1.5, 0.5, 0.5,
-3.527697, -3.852112, 2, 0, 1.5, 0.5, 0.5,
-3.527697, -3.852112, 4, 0, -0.5, 0.5, 0.5,
-3.527697, -3.852112, 4, 1, -0.5, 0.5, 0.5,
-3.527697, -3.852112, 4, 1, 1.5, 0.5, 0.5,
-3.527697, -3.852112, 4, 0, 1.5, 0.5, 0.5
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
-3.035985, -3.379104, -5.340028,
-3.035985, 2.927661, -5.340028,
-3.035985, -3.379104, 5.596354,
-3.035985, 2.927661, 5.596354,
-3.035985, -3.379104, -5.340028,
-3.035985, -3.379104, 5.596354,
-3.035985, 2.927661, -5.340028,
-3.035985, 2.927661, 5.596354,
-3.035985, -3.379104, -5.340028,
3.520184, -3.379104, -5.340028,
-3.035985, -3.379104, 5.596354,
3.520184, -3.379104, 5.596354,
-3.035985, 2.927661, -5.340028,
3.520184, 2.927661, -5.340028,
-3.035985, 2.927661, 5.596354,
3.520184, 2.927661, 5.596354,
3.520184, -3.379104, -5.340028,
3.520184, 2.927661, -5.340028,
3.520184, -3.379104, 5.596354,
3.520184, 2.927661, 5.596354,
3.520184, -3.379104, -5.340028,
3.520184, -3.379104, 5.596354,
3.520184, 2.927661, -5.340028,
3.520184, 2.927661, 5.596354
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
var radius = 7.596108;
var distance = 33.79594;
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
mvMatrix.translate( -0.2420995, 0.2257215, -0.1281631 );
mvMatrix.scale( 1.252723, 1.302262, 0.7509852 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.79594);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Isopropamide<-read.table("Isopropamide.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Isopropamide$V2
```

```
## Error in eval(expr, envir, enclos): object 'Isopropamide' not found
```

```r
y<-Isopropamide$V3
```

```
## Error in eval(expr, envir, enclos): object 'Isopropamide' not found
```

```r
z<-Isopropamide$V4
```

```
## Error in eval(expr, envir, enclos): object 'Isopropamide' not found
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
-2.940506, 0.1470794, -1.483628, 0, 0, 1, 1, 1,
-2.780496, -1.633059, -0.9861914, 1, 0, 0, 1, 1,
-2.494167, 0.2336424, -0.6446459, 1, 0, 0, 1, 1,
-2.416393, -0.288309, -3.368899, 1, 0, 0, 1, 1,
-2.380755, -0.9583004, -2.590046, 1, 0, 0, 1, 1,
-2.313723, -0.1528821, -1.834017, 1, 0, 0, 1, 1,
-2.294895, -0.07645699, -1.703899, 0, 0, 0, 1, 1,
-2.250919, -1.113011, -1.249225, 0, 0, 0, 1, 1,
-2.240945, 0.2873876, -0.9257389, 0, 0, 0, 1, 1,
-2.232188, -0.07506066, -1.468335, 0, 0, 0, 1, 1,
-2.183345, 0.9609219, -0.7249795, 0, 0, 0, 1, 1,
-2.124838, -0.4277075, -1.463125, 0, 0, 0, 1, 1,
-2.091543, 1.465784, 0.01550815, 0, 0, 0, 1, 1,
-2.078171, -1.021438, -2.5543, 1, 1, 1, 1, 1,
-2.061646, -0.7176833, -3.576282, 1, 1, 1, 1, 1,
-2.027484, -0.3618786, -0.1314969, 1, 1, 1, 1, 1,
-1.998669, 0.651852, -2.974205, 1, 1, 1, 1, 1,
-1.986514, -0.1180092, -0.2018005, 1, 1, 1, 1, 1,
-1.983703, 1.473716, -4.404333, 1, 1, 1, 1, 1,
-1.971793, -0.7624347, -3.220354, 1, 1, 1, 1, 1,
-1.968127, 1.571623, -0.550984, 1, 1, 1, 1, 1,
-1.94599, 0.7116119, -0.6834089, 1, 1, 1, 1, 1,
-1.908818, -0.6202818, -1.849968, 1, 1, 1, 1, 1,
-1.905035, 0.9548088, -0.7373374, 1, 1, 1, 1, 1,
-1.902717, -0.7961167, -1.206723, 1, 1, 1, 1, 1,
-1.868988, -1.607627, -1.982793, 1, 1, 1, 1, 1,
-1.857784, -0.3647282, -1.706369, 1, 1, 1, 1, 1,
-1.83605, -0.04799542, -1.396458, 1, 1, 1, 1, 1,
-1.833908, -2.23723, -3.88933, 0, 0, 1, 1, 1,
-1.808644, -1.067651, -2.824241, 1, 0, 0, 1, 1,
-1.793096, 2.527408, -2.511995, 1, 0, 0, 1, 1,
-1.791654, -0.4248399, -1.911983, 1, 0, 0, 1, 1,
-1.785901, 0.8059658, -0.809489, 1, 0, 0, 1, 1,
-1.778774, -0.9414434, -0.9927474, 1, 0, 0, 1, 1,
-1.769509, -1.783424, -2.894975, 0, 0, 0, 1, 1,
-1.764037, 0.3348714, -1.965099, 0, 0, 0, 1, 1,
-1.75158, 0.2896768, -1.650503, 0, 0, 0, 1, 1,
-1.73388, 1.121756, -0.9896933, 0, 0, 0, 1, 1,
-1.727584, 0.8495515, -1.585828, 0, 0, 0, 1, 1,
-1.723434, 0.5419462, 0.7353066, 0, 0, 0, 1, 1,
-1.719981, -0.5096194, -2.602304, 0, 0, 0, 1, 1,
-1.697795, 1.342787, -2.748276, 1, 1, 1, 1, 1,
-1.695425, 0.04750264, -1.489751, 1, 1, 1, 1, 1,
-1.640862, -0.1465836, -2.337291, 1, 1, 1, 1, 1,
-1.639751, 1.481154, -2.491843, 1, 1, 1, 1, 1,
-1.638391, 2.15931, 0.5751823, 1, 1, 1, 1, 1,
-1.637616, 0.3710043, -0.9518147, 1, 1, 1, 1, 1,
-1.632156, -0.8274011, -1.184846, 1, 1, 1, 1, 1,
-1.630326, -0.04186925, -2.868255, 1, 1, 1, 1, 1,
-1.629427, -1.257938, 0.1005412, 1, 1, 1, 1, 1,
-1.625284, 0.8015881, -0.7426487, 1, 1, 1, 1, 1,
-1.620665, -0.210229, -2.173099, 1, 1, 1, 1, 1,
-1.599079, -0.7767823, -3.377249, 1, 1, 1, 1, 1,
-1.593662, 0.9016651, 0.4538353, 1, 1, 1, 1, 1,
-1.573153, 0.8877932, -1.551815, 1, 1, 1, 1, 1,
-1.566319, -0.5211471, -1.475179, 1, 1, 1, 1, 1,
-1.563591, 1.182003, 0.8553865, 0, 0, 1, 1, 1,
-1.559946, 0.7296909, -1.406507, 1, 0, 0, 1, 1,
-1.552062, -0.9205421, -2.575328, 1, 0, 0, 1, 1,
-1.536145, 1.418488, 0.6434402, 1, 0, 0, 1, 1,
-1.533276, 0.4799107, -1.008548, 1, 0, 0, 1, 1,
-1.528628, -1.385756, -2.257842, 1, 0, 0, 1, 1,
-1.490767, 1.009417, -2.577402, 0, 0, 0, 1, 1,
-1.487438, -1.63873, -1.238141, 0, 0, 0, 1, 1,
-1.485904, 0.335238, -1.214544, 0, 0, 0, 1, 1,
-1.466171, 0.4834977, -1.538897, 0, 0, 0, 1, 1,
-1.461168, -0.8538282, -0.3741101, 0, 0, 0, 1, 1,
-1.459629, -0.4567932, -1.780871, 0, 0, 0, 1, 1,
-1.454137, 0.5994945, 0.5760574, 0, 0, 0, 1, 1,
-1.452504, -0.7743194, -2.271142, 1, 1, 1, 1, 1,
-1.449732, 1.085652, -3.127078, 1, 1, 1, 1, 1,
-1.445863, -0.1243296, -2.222902, 1, 1, 1, 1, 1,
-1.432721, 0.2064953, -1.475187, 1, 1, 1, 1, 1,
-1.430923, 1.137882, -1.132116, 1, 1, 1, 1, 1,
-1.430777, 0.1830591, -2.38309, 1, 1, 1, 1, 1,
-1.430019, -1.69086, -0.2570489, 1, 1, 1, 1, 1,
-1.428061, -0.5886427, -1.705727, 1, 1, 1, 1, 1,
-1.427467, 0.2600452, -1.71993, 1, 1, 1, 1, 1,
-1.417866, 0.4118886, -1.15315, 1, 1, 1, 1, 1,
-1.416212, -0.735145, -2.137909, 1, 1, 1, 1, 1,
-1.415727, -0.5882074, -2.606235, 1, 1, 1, 1, 1,
-1.414716, -1.284334, -2.710965, 1, 1, 1, 1, 1,
-1.409057, 0.2823561, -3.820161, 1, 1, 1, 1, 1,
-1.407132, -1.254711, -2.939642, 1, 1, 1, 1, 1,
-1.398263, 0.3122191, -0.9460066, 0, 0, 1, 1, 1,
-1.397197, 0.5982733, 0.3962147, 1, 0, 0, 1, 1,
-1.390748, -0.05343526, -1.576017, 1, 0, 0, 1, 1,
-1.390276, -0.3647942, -1.139109, 1, 0, 0, 1, 1,
-1.388747, -0.2089212, -1.970008, 1, 0, 0, 1, 1,
-1.388281, -0.4219958, -2.629037, 1, 0, 0, 1, 1,
-1.382541, 1.64001, 0.2279854, 0, 0, 0, 1, 1,
-1.37503, 1.538991, -0.6525872, 0, 0, 0, 1, 1,
-1.372549, 0.8559657, -1.11165, 0, 0, 0, 1, 1,
-1.36801, 0.1685861, -1.582407, 0, 0, 0, 1, 1,
-1.358996, -0.5983939, -1.334516, 0, 0, 0, 1, 1,
-1.357933, -1.290988, -4.960296, 0, 0, 0, 1, 1,
-1.356425, -1.824249, -2.425718, 0, 0, 0, 1, 1,
-1.338431, 0.121674, -0.2585399, 1, 1, 1, 1, 1,
-1.334016, 0.3836932, -2.125018, 1, 1, 1, 1, 1,
-1.322641, 1.584927, -1.845355, 1, 1, 1, 1, 1,
-1.318648, -1.387573, -2.05526, 1, 1, 1, 1, 1,
-1.314364, 0.6035123, -0.3523524, 1, 1, 1, 1, 1,
-1.298399, 0.1359946, -2.453682, 1, 1, 1, 1, 1,
-1.294921, 1.33126, -0.9079039, 1, 1, 1, 1, 1,
-1.293298, 0.6049462, 0.3973409, 1, 1, 1, 1, 1,
-1.293118, 0.03626198, -0.4266667, 1, 1, 1, 1, 1,
-1.286465, -0.51642, -2.487258, 1, 1, 1, 1, 1,
-1.25861, 0.6576461, -1.316955, 1, 1, 1, 1, 1,
-1.257517, -2.787225, -5.18076, 1, 1, 1, 1, 1,
-1.256147, -1.319871, -1.029222, 1, 1, 1, 1, 1,
-1.252639, 1.796615, -2.988339, 1, 1, 1, 1, 1,
-1.247925, 1.03559, -1.668603, 1, 1, 1, 1, 1,
-1.240551, -0.554989, -1.973769, 0, 0, 1, 1, 1,
-1.237092, -1.322507, -3.540326, 1, 0, 0, 1, 1,
-1.233193, 1.220629, -1.158104, 1, 0, 0, 1, 1,
-1.231421, 0.4581767, -0.4718818, 1, 0, 0, 1, 1,
-1.226608, 0.1016885, -1.284179, 1, 0, 0, 1, 1,
-1.22262, 1.091305, -1.791811, 1, 0, 0, 1, 1,
-1.205065, -1.662386, -3.228596, 0, 0, 0, 1, 1,
-1.192117, 0.5436804, -1.378361, 0, 0, 0, 1, 1,
-1.190924, -0.1034682, -1.709879, 0, 0, 0, 1, 1,
-1.186775, -1.001117, -1.617276, 0, 0, 0, 1, 1,
-1.183019, -0.02217122, -2.093703, 0, 0, 0, 1, 1,
-1.181021, -0.7004662, -2.296218, 0, 0, 0, 1, 1,
-1.180356, -0.8305339, -2.603713, 0, 0, 0, 1, 1,
-1.179545, 0.9952489, -1.729732, 1, 1, 1, 1, 1,
-1.176581, 0.8540871, -0.6467898, 1, 1, 1, 1, 1,
-1.169641, -0.8351234, -1.010063, 1, 1, 1, 1, 1,
-1.165606, 0.07579508, 0.1905007, 1, 1, 1, 1, 1,
-1.164131, -1.998675, -4.094143, 1, 1, 1, 1, 1,
-1.16206, 1.054285, -1.289012, 1, 1, 1, 1, 1,
-1.160498, 1.602306, -0.2539757, 1, 1, 1, 1, 1,
-1.156299, -0.05178038, -1.239963, 1, 1, 1, 1, 1,
-1.155883, 0.4829914, -1.357261, 1, 1, 1, 1, 1,
-1.149931, -1.230797, -2.302113, 1, 1, 1, 1, 1,
-1.141769, 0.09638228, -1.387844, 1, 1, 1, 1, 1,
-1.140332, -1.53764, -1.455185, 1, 1, 1, 1, 1,
-1.136037, -0.3092805, -1.533105, 1, 1, 1, 1, 1,
-1.132795, 0.1100396, -1.69859, 1, 1, 1, 1, 1,
-1.127215, 0.2773325, -0.9102468, 1, 1, 1, 1, 1,
-1.11969, 0.06507675, -1.417479, 0, 0, 1, 1, 1,
-1.118664, 0.1192856, -1.508623, 1, 0, 0, 1, 1,
-1.114356, -0.2146345, -2.332574, 1, 0, 0, 1, 1,
-1.108321, -0.4093578, -2.008872, 1, 0, 0, 1, 1,
-1.100655, 0.2878976, -0.5465876, 1, 0, 0, 1, 1,
-1.084672, 0.5950466, -1.654521, 1, 0, 0, 1, 1,
-1.081606, -2.730484, -1.882248, 0, 0, 0, 1, 1,
-1.081183, -0.1837752, -1.472542, 0, 0, 0, 1, 1,
-1.07305, 0.5162157, -0.4761961, 0, 0, 0, 1, 1,
-1.066876, 0.1266019, -1.104259, 0, 0, 0, 1, 1,
-1.060082, -1.428059, -3.105543, 0, 0, 0, 1, 1,
-1.059007, -0.317379, -2.932129, 0, 0, 0, 1, 1,
-1.053514, -0.6404565, -0.8573824, 0, 0, 0, 1, 1,
-1.048313, 0.8303185, -2.583082, 1, 1, 1, 1, 1,
-1.046161, -1.285595, -3.52714, 1, 1, 1, 1, 1,
-1.039214, 0.5988711, -1.114924, 1, 1, 1, 1, 1,
-1.036893, -0.827405, -2.336908, 1, 1, 1, 1, 1,
-1.028693, -1.929703, -1.222414, 1, 1, 1, 1, 1,
-1.028367, -1.760617, -3.078033, 1, 1, 1, 1, 1,
-1.021426, 1.467099, 1.376351, 1, 1, 1, 1, 1,
-1.015597, -0.5742354, -2.374404, 1, 1, 1, 1, 1,
-1.012787, -0.2695096, 0.1611428, 1, 1, 1, 1, 1,
-1.010732, 1.355284, -0.8546075, 1, 1, 1, 1, 1,
-1.007814, 0.6033009, -1.011234, 1, 1, 1, 1, 1,
-1.002235, 0.6587629, -0.9383583, 1, 1, 1, 1, 1,
-0.9986815, -0.2491155, -1.389149, 1, 1, 1, 1, 1,
-0.9921499, -0.7190445, -0.3018918, 1, 1, 1, 1, 1,
-0.9920322, 1.628657, -3.306596, 1, 1, 1, 1, 1,
-0.9806269, 0.4420048, 0.0001023107, 0, 0, 1, 1, 1,
-0.979526, 0.4892305, -0.5354003, 1, 0, 0, 1, 1,
-0.9783451, -2.550558, -1.644165, 1, 0, 0, 1, 1,
-0.9772327, -0.176724, 0.06168137, 1, 0, 0, 1, 1,
-0.9764952, -1.0098, -2.918995, 1, 0, 0, 1, 1,
-0.9702023, 0.2487673, -3.648004, 1, 0, 0, 1, 1,
-0.9675521, 1.453894, -0.9180508, 0, 0, 0, 1, 1,
-0.9641733, -0.9039213, -1.514961, 0, 0, 0, 1, 1,
-0.9636955, -0.2742913, -2.511942, 0, 0, 0, 1, 1,
-0.9628213, 0.1349837, -0.7967956, 0, 0, 0, 1, 1,
-0.9614591, 2.045544, 0.1948637, 0, 0, 0, 1, 1,
-0.9584795, 0.2188286, -3.307968, 0, 0, 0, 1, 1,
-0.9511266, 0.8715616, -1.709228, 0, 0, 0, 1, 1,
-0.945933, 0.0575668, 0.6510001, 1, 1, 1, 1, 1,
-0.9436703, 0.1658402, -1.879556, 1, 1, 1, 1, 1,
-0.9415073, 0.6398458, -1.30827, 1, 1, 1, 1, 1,
-0.9381443, 1.046773, -0.5160602, 1, 1, 1, 1, 1,
-0.9379053, -0.1626531, -3.447315, 1, 1, 1, 1, 1,
-0.9359154, -0.5275908, -0.8507704, 1, 1, 1, 1, 1,
-0.9330449, -0.8293628, -3.390494, 1, 1, 1, 1, 1,
-0.9308935, -1.177655, -3.204344, 1, 1, 1, 1, 1,
-0.9218476, -2.137635, -2.113999, 1, 1, 1, 1, 1,
-0.9207931, -1.428356, -0.9665079, 1, 1, 1, 1, 1,
-0.9207774, -0.9630452, -3.563901, 1, 1, 1, 1, 1,
-0.9201091, -0.2240656, -1.938764, 1, 1, 1, 1, 1,
-0.9171319, -0.6711157, -2.33331, 1, 1, 1, 1, 1,
-0.9144126, -1.269642, -3.171825, 1, 1, 1, 1, 1,
-0.9109793, -0.1168844, -2.190162, 1, 1, 1, 1, 1,
-0.9095196, 0.2010014, -1.075856, 0, 0, 1, 1, 1,
-0.9087754, 0.255311, -1.448794, 1, 0, 0, 1, 1,
-0.9073507, -0.6232178, -1.077749, 1, 0, 0, 1, 1,
-0.9051241, 1.381345, -1.939961, 1, 0, 0, 1, 1,
-0.9019796, 0.9528734, 0.1468104, 1, 0, 0, 1, 1,
-0.8938712, 0.6047697, -0.01703992, 1, 0, 0, 1, 1,
-0.89026, 0.4333081, -2.122891, 0, 0, 0, 1, 1,
-0.8900755, -1.475629, -1.373549, 0, 0, 0, 1, 1,
-0.888074, 0.8546664, -1.53916, 0, 0, 0, 1, 1,
-0.887432, 1.829744, -1.191287, 0, 0, 0, 1, 1,
-0.887063, 0.3388828, -0.157871, 0, 0, 0, 1, 1,
-0.8808855, -0.4497921, -1.160289, 0, 0, 0, 1, 1,
-0.8743143, -0.603624, -1.05552, 0, 0, 0, 1, 1,
-0.8720757, 0.427373, -0.05290507, 1, 1, 1, 1, 1,
-0.8573222, -1.012237, -2.445746, 1, 1, 1, 1, 1,
-0.8569427, -0.1949422, -1.624773, 1, 1, 1, 1, 1,
-0.839616, -0.9699704, -1.601426, 1, 1, 1, 1, 1,
-0.8379147, 0.1405277, -2.653571, 1, 1, 1, 1, 1,
-0.8364393, 0.8114971, -1.083018, 1, 1, 1, 1, 1,
-0.8325111, -1.652504, -2.676625, 1, 1, 1, 1, 1,
-0.8291228, -0.710578, -3.216583, 1, 1, 1, 1, 1,
-0.8264057, -0.5624596, -1.786207, 1, 1, 1, 1, 1,
-0.8112648, 0.288592, -2.63023, 1, 1, 1, 1, 1,
-0.8099926, 1.340104, -0.4280264, 1, 1, 1, 1, 1,
-0.8042361, -0.7188664, -0.9661227, 1, 1, 1, 1, 1,
-0.7938187, -1.207865, -2.338469, 1, 1, 1, 1, 1,
-0.7915063, -0.861786, -2.38806, 1, 1, 1, 1, 1,
-0.7911032, 0.4249448, -2.026914, 1, 1, 1, 1, 1,
-0.7901474, -0.8888364, -2.652187, 0, 0, 1, 1, 1,
-0.7873498, 0.3375418, -1.940619, 1, 0, 0, 1, 1,
-0.7840698, -1.732749, -3.150192, 1, 0, 0, 1, 1,
-0.7814389, -2.101237, -2.996337, 1, 0, 0, 1, 1,
-0.775312, -0.09267946, -0.8078467, 1, 0, 0, 1, 1,
-0.7714506, 0.3410438, -0.4108059, 1, 0, 0, 1, 1,
-0.7710349, 0.8101984, -0.05549635, 0, 0, 0, 1, 1,
-0.7697775, -1.363225, -2.511754, 0, 0, 0, 1, 1,
-0.7635535, 0.299122, -0.2417376, 0, 0, 0, 1, 1,
-0.7628436, -0.5796081, -3.007356, 0, 0, 0, 1, 1,
-0.7611386, 1.285084, 2.119655, 0, 0, 0, 1, 1,
-0.7605569, 0.2864224, -0.8495813, 0, 0, 0, 1, 1,
-0.7559966, -2.413351, -2.588859, 0, 0, 0, 1, 1,
-0.7554189, -1.703586, -2.083254, 1, 1, 1, 1, 1,
-0.7539709, -1.158468, -3.763515, 1, 1, 1, 1, 1,
-0.7534799, 0.8355256, -1.627375, 1, 1, 1, 1, 1,
-0.7534748, -0.03751472, -2.190345, 1, 1, 1, 1, 1,
-0.752718, 0.2609649, -0.616559, 1, 1, 1, 1, 1,
-0.7456891, -0.05490315, -2.490842, 1, 1, 1, 1, 1,
-0.7411019, -0.243567, -1.145782, 1, 1, 1, 1, 1,
-0.7408792, 2.74832, 0.368791, 1, 1, 1, 1, 1,
-0.7408682, -0.321872, -1.714892, 1, 1, 1, 1, 1,
-0.7350807, -0.3349955, -2.18925, 1, 1, 1, 1, 1,
-0.7313938, -1.548437, -0.2871331, 1, 1, 1, 1, 1,
-0.729592, -0.33819, -3.360709, 1, 1, 1, 1, 1,
-0.7288803, 1.22202, -1.192749, 1, 1, 1, 1, 1,
-0.7259725, 0.4966973, 0.68714, 1, 1, 1, 1, 1,
-0.7208124, -0.04223955, -1.446287, 1, 1, 1, 1, 1,
-0.7193121, -0.1899025, 0.8276345, 0, 0, 1, 1, 1,
-0.7178046, 0.2776984, -1.730554, 1, 0, 0, 1, 1,
-0.7159814, 1.360605, 1.62095, 1, 0, 0, 1, 1,
-0.7150007, -0.8036303, -2.150565, 1, 0, 0, 1, 1,
-0.7078696, 0.827861, 0.3801812, 1, 0, 0, 1, 1,
-0.6993136, 0.2987646, -1.165496, 1, 0, 0, 1, 1,
-0.6971715, 0.2233594, -1.199646, 0, 0, 0, 1, 1,
-0.6898891, 0.7905828, -1.97036, 0, 0, 0, 1, 1,
-0.6887035, 1.5473, 0.5011244, 0, 0, 0, 1, 1,
-0.6868249, -0.8410097, -3.503689, 0, 0, 0, 1, 1,
-0.6864477, 0.5571949, -1.5814, 0, 0, 0, 1, 1,
-0.6821294, 2.216475, -0.8212738, 0, 0, 0, 1, 1,
-0.680175, -0.969558, -2.596443, 0, 0, 0, 1, 1,
-0.676845, -0.2628322, -1.682371, 1, 1, 1, 1, 1,
-0.6743485, 1.091065, 1.365208, 1, 1, 1, 1, 1,
-0.6726003, 0.6957313, 0.3669402, 1, 1, 1, 1, 1,
-0.6673522, -0.2148443, 1.422948, 1, 1, 1, 1, 1,
-0.6625331, -0.3451888, -2.592381, 1, 1, 1, 1, 1,
-0.6602873, -0.07670428, -2.42811, 1, 1, 1, 1, 1,
-0.6547021, 0.7688296, -0.5839145, 1, 1, 1, 1, 1,
-0.6509627, -1.183859, -2.495041, 1, 1, 1, 1, 1,
-0.6486632, -0.3325607, -1.139987, 1, 1, 1, 1, 1,
-0.6476477, 0.6205475, -0.8243932, 1, 1, 1, 1, 1,
-0.6353449, 0.710645, -0.9607083, 1, 1, 1, 1, 1,
-0.6304343, -0.02361618, -2.424065, 1, 1, 1, 1, 1,
-0.6285318, -1.816742, -3.173587, 1, 1, 1, 1, 1,
-0.6273479, 0.08831666, -1.091933, 1, 1, 1, 1, 1,
-0.6257901, -1.296541, -1.775907, 1, 1, 1, 1, 1,
-0.6208845, 1.1221, 1.539104, 0, 0, 1, 1, 1,
-0.6157188, -1.882642, -4.997225, 1, 0, 0, 1, 1,
-0.6146055, -0.1943499, -0.8597727, 1, 0, 0, 1, 1,
-0.6137155, -1.769361, -3.836662, 1, 0, 0, 1, 1,
-0.6106008, 0.9069166, -1.017064, 1, 0, 0, 1, 1,
-0.6039812, 0.6991884, -0.6294608, 1, 0, 0, 1, 1,
-0.5994297, 1.380892, -1.753446, 0, 0, 0, 1, 1,
-0.5977602, -0.1954727, -0.9402338, 0, 0, 0, 1, 1,
-0.5972155, -0.5002728, -1.709834, 0, 0, 0, 1, 1,
-0.5970005, 1.451648, 0.7426107, 0, 0, 0, 1, 1,
-0.5945489, -0.3031822, -1.544844, 0, 0, 0, 1, 1,
-0.5943021, -0.8642346, -2.73121, 0, 0, 0, 1, 1,
-0.592217, 1.034638, -0.596041, 0, 0, 0, 1, 1,
-0.5910923, 0.642232, -0.642726, 1, 1, 1, 1, 1,
-0.587624, -0.8199867, -2.766103, 1, 1, 1, 1, 1,
-0.5873073, 0.2376988, -1.271481, 1, 1, 1, 1, 1,
-0.5834455, 1.259534, 0.02629189, 1, 1, 1, 1, 1,
-0.5834165, -0.8427568, -1.98442, 1, 1, 1, 1, 1,
-0.5818095, 2.406241, -1.369841, 1, 1, 1, 1, 1,
-0.5808656, -0.1703887, -2.055137, 1, 1, 1, 1, 1,
-0.5799025, -2.164028, -3.227026, 1, 1, 1, 1, 1,
-0.5768775, 0.07569268, -1.229941, 1, 1, 1, 1, 1,
-0.573747, 0.9552528, -1.630999, 1, 1, 1, 1, 1,
-0.5735093, 0.4179288, -0.5173717, 1, 1, 1, 1, 1,
-0.5657867, 0.2532888, -1.496628, 1, 1, 1, 1, 1,
-0.5637321, -0.988702, -4.033261, 1, 1, 1, 1, 1,
-0.5591683, -0.2652189, -3.446121, 1, 1, 1, 1, 1,
-0.5552825, 0.3275167, -1.186047, 1, 1, 1, 1, 1,
-0.5545521, -0.8633374, -3.299538, 0, 0, 1, 1, 1,
-0.5536712, -0.6105773, -2.337776, 1, 0, 0, 1, 1,
-0.5528727, -0.9136856, -0.9193286, 1, 0, 0, 1, 1,
-0.5492046, -1.414368, -4.202329, 1, 0, 0, 1, 1,
-0.5441172, 0.619167, -2.463718, 1, 0, 0, 1, 1,
-0.5414032, -1.648274, -1.712528, 1, 0, 0, 1, 1,
-0.5375574, 1.093656, 1.161557, 0, 0, 0, 1, 1,
-0.5367786, -1.212802, -3.535507, 0, 0, 0, 1, 1,
-0.5282214, 0.2103647, 0.3189637, 0, 0, 0, 1, 1,
-0.5253911, -0.09021991, -1.874341, 0, 0, 0, 1, 1,
-0.5221307, -0.04091482, -2.601891, 0, 0, 0, 1, 1,
-0.5216925, 0.9654868, 1.471254, 0, 0, 0, 1, 1,
-0.517813, 0.3234502, -1.240922, 0, 0, 0, 1, 1,
-0.5174084, -1.106296, -3.506933, 1, 1, 1, 1, 1,
-0.5162364, -0.7207202, -1.435166, 1, 1, 1, 1, 1,
-0.5145974, 0.4868416, -0.5798881, 1, 1, 1, 1, 1,
-0.5119609, -0.6570521, -4.369009, 1, 1, 1, 1, 1,
-0.5083473, 0.584775, 0.9695765, 1, 1, 1, 1, 1,
-0.5073478, -0.2665942, -1.927294, 1, 1, 1, 1, 1,
-0.5070066, -0.263832, -2.606822, 1, 1, 1, 1, 1,
-0.502689, -0.4790786, -3.456388, 1, 1, 1, 1, 1,
-0.50227, -0.04991233, -1.475355, 1, 1, 1, 1, 1,
-0.4991596, -1.847947, -2.366411, 1, 1, 1, 1, 1,
-0.4963385, -0.7128462, -1.625944, 1, 1, 1, 1, 1,
-0.4913776, -1.127976, -1.585368, 1, 1, 1, 1, 1,
-0.4891549, 0.5722821, -1.648383, 1, 1, 1, 1, 1,
-0.4824248, -0.2159507, -2.464075, 1, 1, 1, 1, 1,
-0.4822164, -0.2041704, -1.917152, 1, 1, 1, 1, 1,
-0.4811003, -0.8337157, -2.539002, 0, 0, 1, 1, 1,
-0.4708984, -0.8645991, -2.796664, 1, 0, 0, 1, 1,
-0.4666949, -0.1230169, -3.284199, 1, 0, 0, 1, 1,
-0.4544733, 0.865194, 1.376577, 1, 0, 0, 1, 1,
-0.4533034, -0.05308383, -2.681308, 1, 0, 0, 1, 1,
-0.4525641, 1.210659, -1.062703, 1, 0, 0, 1, 1,
-0.4501423, 0.1310331, -1.238544, 0, 0, 0, 1, 1,
-0.4426393, 1.019635, 0.9001277, 0, 0, 0, 1, 1,
-0.442479, -0.2202496, -3.96689, 0, 0, 0, 1, 1,
-0.440749, 2.030375, 0.3115942, 0, 0, 0, 1, 1,
-0.4366069, -0.02307813, -1.695163, 0, 0, 0, 1, 1,
-0.4263645, 0.6418621, -1.630979, 0, 0, 0, 1, 1,
-0.4213813, 2.245392, -0.1830016, 0, 0, 0, 1, 1,
-0.4145096, -0.5670354, -3.679037, 1, 1, 1, 1, 1,
-0.4139569, -0.2452772, -3.040405, 1, 1, 1, 1, 1,
-0.4126021, 0.7185654, -0.6907713, 1, 1, 1, 1, 1,
-0.4106117, -0.2596647, -2.432329, 1, 1, 1, 1, 1,
-0.4101464, -0.9685544, -1.915746, 1, 1, 1, 1, 1,
-0.4099621, 0.4955385, -0.2264753, 1, 1, 1, 1, 1,
-0.4041447, 1.267415, -0.1484877, 1, 1, 1, 1, 1,
-0.3973024, -0.4056129, -1.535575, 1, 1, 1, 1, 1,
-0.3947296, -0.8180496, -3.478616, 1, 1, 1, 1, 1,
-0.3928961, -0.1855615, -1.321777, 1, 1, 1, 1, 1,
-0.3927079, 0.3911211, 0.9785769, 1, 1, 1, 1, 1,
-0.391782, -0.8646178, -2.276161, 1, 1, 1, 1, 1,
-0.3913952, -0.1101318, -2.958943, 1, 1, 1, 1, 1,
-0.3885629, -0.4093403, -1.61235, 1, 1, 1, 1, 1,
-0.3871696, -0.2976401, -2.073453, 1, 1, 1, 1, 1,
-0.3844055, 1.495621, 0.5650458, 0, 0, 1, 1, 1,
-0.3793264, -1.020916, -2.297971, 1, 0, 0, 1, 1,
-0.3736942, -0.1131707, -1.403642, 1, 0, 0, 1, 1,
-0.3671924, -0.7605921, -2.683581, 1, 0, 0, 1, 1,
-0.3665477, -0.8929467, -2.310921, 1, 0, 0, 1, 1,
-0.3663045, -0.5125151, -3.249653, 1, 0, 0, 1, 1,
-0.3642209, -0.4968056, -2.464421, 0, 0, 0, 1, 1,
-0.3609684, 0.9230886, -0.19346, 0, 0, 0, 1, 1,
-0.360814, 0.4923684, -1.443686, 0, 0, 0, 1, 1,
-0.3573244, 0.2317687, -3.011684, 0, 0, 0, 1, 1,
-0.3571228, -0.05889466, -0.351313, 0, 0, 0, 1, 1,
-0.3501816, 0.09695034, -2.131307, 0, 0, 0, 1, 1,
-0.344226, 2.323441, -0.5656678, 0, 0, 0, 1, 1,
-0.3437503, 1.036051, 0.005788963, 1, 1, 1, 1, 1,
-0.3434008, 0.7550649, -0.2108071, 1, 1, 1, 1, 1,
-0.3347764, -0.7930993, -2.025059, 1, 1, 1, 1, 1,
-0.3201034, -0.1482427, -2.070681, 1, 1, 1, 1, 1,
-0.3185493, -0.6640795, -2.289912, 1, 1, 1, 1, 1,
-0.3175083, 0.488589, 0.6521613, 1, 1, 1, 1, 1,
-0.3142781, 0.4894607, 1.351098, 1, 1, 1, 1, 1,
-0.3114164, 0.2357148, -0.6974356, 1, 1, 1, 1, 1,
-0.3071841, 1.823856, 1.396162, 1, 1, 1, 1, 1,
-0.2951911, 0.4443486, -1.000636, 1, 1, 1, 1, 1,
-0.287331, 1.139663, 1.190998, 1, 1, 1, 1, 1,
-0.2845943, -1.985958, -3.052723, 1, 1, 1, 1, 1,
-0.2779684, -0.5283819, -3.607404, 1, 1, 1, 1, 1,
-0.2756986, 1.160672, -1.472106, 1, 1, 1, 1, 1,
-0.2749704, 1.711821, 0.3131951, 1, 1, 1, 1, 1,
-0.274712, -0.8263858, -2.996063, 0, 0, 1, 1, 1,
-0.2710141, 0.4019402, -0.1086792, 1, 0, 0, 1, 1,
-0.2707599, -0.5598255, -3.491773, 1, 0, 0, 1, 1,
-0.2663515, 1.915447, -1.23725, 1, 0, 0, 1, 1,
-0.2616792, 1.001773, -1.933111, 1, 0, 0, 1, 1,
-0.2529993, 0.6243291, -0.1916649, 1, 0, 0, 1, 1,
-0.2492357, 0.1151281, -1.627721, 0, 0, 0, 1, 1,
-0.2454063, 1.156176, -1.73827, 0, 0, 0, 1, 1,
-0.2450251, 0.4045677, -2.00085, 0, 0, 0, 1, 1,
-0.2448345, 1.527963, 0.09631627, 0, 0, 0, 1, 1,
-0.2412669, 0.2815348, -1.110463, 0, 0, 0, 1, 1,
-0.2411038, -1.243176, -2.014039, 0, 0, 0, 1, 1,
-0.2407469, -1.043321, -3.697125, 0, 0, 0, 1, 1,
-0.2374662, -1.394271, -3.198379, 1, 1, 1, 1, 1,
-0.2297582, -1.217573, -1.852407, 1, 1, 1, 1, 1,
-0.221775, -0.1206078, -3.05079, 1, 1, 1, 1, 1,
-0.2201739, 0.2388791, -0.2988886, 1, 1, 1, 1, 1,
-0.2162497, -1.089882, -2.230561, 1, 1, 1, 1, 1,
-0.2160763, 0.04916213, -0.8835189, 1, 1, 1, 1, 1,
-0.2147887, 0.9145372, 0.1990484, 1, 1, 1, 1, 1,
-0.212174, 1.449383, -0.3815473, 1, 1, 1, 1, 1,
-0.2101325, 1.132962, -1.11992, 1, 1, 1, 1, 1,
-0.2085924, 1.432072, 0.6361422, 1, 1, 1, 1, 1,
-0.208504, 1.289642, 0.1620911, 1, 1, 1, 1, 1,
-0.2068692, 1.072473, -0.9056556, 1, 1, 1, 1, 1,
-0.2033622, 1.712812, -1.279076, 1, 1, 1, 1, 1,
-0.2029681, -0.5286171, -3.401447, 1, 1, 1, 1, 1,
-0.1977048, 0.06020249, -2.283638, 1, 1, 1, 1, 1,
-0.1964326, -1.592835, -2.032383, 0, 0, 1, 1, 1,
-0.1945906, -1.688171, -1.97776, 1, 0, 0, 1, 1,
-0.1942761, 1.402147, -1.07208, 1, 0, 0, 1, 1,
-0.1913797, -2.304262, -4.074703, 1, 0, 0, 1, 1,
-0.1880368, -0.8710582, -1.841161, 1, 0, 0, 1, 1,
-0.1870373, 1.374186, -2.458833, 1, 0, 0, 1, 1,
-0.1845052, 0.6736061, -0.6555319, 0, 0, 0, 1, 1,
-0.182706, 1.162594, 0.4509553, 0, 0, 0, 1, 1,
-0.1695464, 0.03252103, -0.727331, 0, 0, 0, 1, 1,
-0.1557228, -1.515159, -1.725085, 0, 0, 0, 1, 1,
-0.1547298, -0.355635, -2.653755, 0, 0, 0, 1, 1,
-0.152601, 0.933771, -2.514705, 0, 0, 0, 1, 1,
-0.1519814, -0.7735527, -2.951783, 0, 0, 0, 1, 1,
-0.1516985, 0.4156649, 0.6596566, 1, 1, 1, 1, 1,
-0.1495715, 1.530866, 1.83197, 1, 1, 1, 1, 1,
-0.1463999, -0.647343, -1.962261, 1, 1, 1, 1, 1,
-0.1463922, 0.5449615, -0.526252, 1, 1, 1, 1, 1,
-0.1422219, -0.5784088, -2.935578, 1, 1, 1, 1, 1,
-0.1407124, 0.4533411, 1.690262, 1, 1, 1, 1, 1,
-0.1406413, -0.9808133, -2.516499, 1, 1, 1, 1, 1,
-0.1363005, 0.5629486, 0.9412165, 1, 1, 1, 1, 1,
-0.1354451, 0.04350286, -2.385837, 1, 1, 1, 1, 1,
-0.1326088, 1.288559, -0.1625153, 1, 1, 1, 1, 1,
-0.1323258, 0.1081193, -2.484118, 1, 1, 1, 1, 1,
-0.1321057, 0.2572694, 0.0934758, 1, 1, 1, 1, 1,
-0.1280602, -1.206421, -2.514903, 1, 1, 1, 1, 1,
-0.1245419, 1.547943, -0.3426106, 1, 1, 1, 1, 1,
-0.1213473, -1.429665, -3.183173, 1, 1, 1, 1, 1,
-0.1119493, -1.255391, -5.093597, 0, 0, 1, 1, 1,
-0.1084887, 0.001240963, -2.201499, 1, 0, 0, 1, 1,
-0.1074292, -0.2765633, -3.472593, 1, 0, 0, 1, 1,
-0.1058138, -0.7102951, -1.684591, 1, 0, 0, 1, 1,
-0.1050084, 0.540426, -0.9801719, 1, 0, 0, 1, 1,
-0.09269116, 0.8458614, -0.4407206, 1, 0, 0, 1, 1,
-0.09265871, -0.1708858, -4.462109, 0, 0, 0, 1, 1,
-0.09083143, 0.5843807, -0.6882061, 0, 0, 0, 1, 1,
-0.0897345, 1.028644, -0.3456194, 0, 0, 0, 1, 1,
-0.08936588, 0.00791257, -2.671839, 0, 0, 0, 1, 1,
-0.08576113, -0.8500353, -2.932667, 0, 0, 0, 1, 1,
-0.08178295, -0.7262971, -1.730373, 0, 0, 0, 1, 1,
-0.07943843, -0.3781049, -3.762741, 0, 0, 0, 1, 1,
-0.07931143, -0.8950124, -3.60043, 1, 1, 1, 1, 1,
-0.0779532, 0.2135476, 0.1979428, 1, 1, 1, 1, 1,
-0.07348685, 1.782158, -0.9933335, 1, 1, 1, 1, 1,
-0.07261777, 0.3476709, -0.09991596, 1, 1, 1, 1, 1,
-0.06574156, 0.2677323, 0.294135, 1, 1, 1, 1, 1,
-0.06151634, -0.7698864, -2.948345, 1, 1, 1, 1, 1,
-0.06090394, 1.146516, -1.089517, 1, 1, 1, 1, 1,
-0.06088897, -1.183455, -3.857217, 1, 1, 1, 1, 1,
-0.05954378, -0.2382926, -3.720609, 1, 1, 1, 1, 1,
-0.0587241, 0.7707773, -1.313029, 1, 1, 1, 1, 1,
-0.05590723, -0.545492, -3.034773, 1, 1, 1, 1, 1,
-0.05461444, 1.831104, -0.6722607, 1, 1, 1, 1, 1,
-0.05185771, -0.1912365, -3.6216, 1, 1, 1, 1, 1,
-0.05171036, -1.792408, -1.993667, 1, 1, 1, 1, 1,
-0.05141925, 0.482713, -1.646327, 1, 1, 1, 1, 1,
-0.05020531, -1.313088, -3.580053, 0, 0, 1, 1, 1,
-0.04963952, 0.4183391, 0.9040789, 1, 0, 0, 1, 1,
-0.04924849, -2.102583, -4.07302, 1, 0, 0, 1, 1,
-0.0460245, -0.4412494, -2.34332, 1, 0, 0, 1, 1,
-0.03790546, 0.1990755, -0.1133581, 1, 0, 0, 1, 1,
-0.036639, -0.6180983, -2.869607, 1, 0, 0, 1, 1,
-0.03532742, -0.01059254, -0.7572942, 0, 0, 0, 1, 1,
-0.03348053, 0.7727735, -0.8391196, 0, 0, 0, 1, 1,
-0.03223154, 0.05717228, 0.8391516, 0, 0, 0, 1, 1,
-0.03170073, 0.6904244, 0.6311806, 0, 0, 0, 1, 1,
-0.02996739, -1.447866, -4.499461, 0, 0, 0, 1, 1,
-0.02760063, 1.076637, -2.162383, 0, 0, 0, 1, 1,
-0.02658603, 0.3800662, 0.07554352, 0, 0, 0, 1, 1,
-0.0236841, -0.5676055, -2.462021, 1, 1, 1, 1, 1,
-0.02290273, 1.3041, 0.4085736, 1, 1, 1, 1, 1,
-0.01994904, -0.1179342, -1.155009, 1, 1, 1, 1, 1,
-0.01886133, 0.2550923, -0.8106281, 1, 1, 1, 1, 1,
-0.01703496, -0.4407378, -3.612038, 1, 1, 1, 1, 1,
-0.01537139, -0.9368093, -1.350089, 1, 1, 1, 1, 1,
-0.01119539, 0.01904416, -0.7112898, 1, 1, 1, 1, 1,
-0.01076904, 1.130851, -0.04520648, 1, 1, 1, 1, 1,
-0.01007683, -1.018709, -1.964768, 1, 1, 1, 1, 1,
-0.00977189, -0.3731311, -3.240439, 1, 1, 1, 1, 1,
-0.001866287, 1.146446, 1.154294, 1, 1, 1, 1, 1,
-0.001572686, 0.933938, 1.321749, 1, 1, 1, 1, 1,
0.007243319, 0.01668451, 0.433843, 1, 1, 1, 1, 1,
0.01054829, 0.6251149, 1.052959, 1, 1, 1, 1, 1,
0.01148527, 0.3362488, -0.252806, 1, 1, 1, 1, 1,
0.01307997, 0.5875847, -2.013247, 0, 0, 1, 1, 1,
0.01328678, 1.71922, -0.5810206, 1, 0, 0, 1, 1,
0.01354662, -2.24149, 3.768622, 1, 0, 0, 1, 1,
0.01430575, 1.266566, -1.272495, 1, 0, 0, 1, 1,
0.02630385, 1.020377, 0.5298782, 1, 0, 0, 1, 1,
0.02676222, -0.632121, 4.794515, 1, 0, 0, 1, 1,
0.031317, -0.4655277, 3.746852, 0, 0, 0, 1, 1,
0.03189664, -1.496698, 2.907725, 0, 0, 0, 1, 1,
0.03332281, -1.198052, 2.334794, 0, 0, 0, 1, 1,
0.03495136, -0.01625209, 1.959534, 0, 0, 0, 1, 1,
0.03841167, 0.1882775, -0.7188116, 0, 0, 0, 1, 1,
0.04013293, 0.5894423, 1.367572, 0, 0, 0, 1, 1,
0.0405741, -1.272727, 2.633404, 0, 0, 0, 1, 1,
0.04266712, -0.01259065, 1.140993, 1, 1, 1, 1, 1,
0.04624898, 0.906601, 0.526332, 1, 1, 1, 1, 1,
0.0496943, 0.873504, -1.147496, 1, 1, 1, 1, 1,
0.05435539, 0.8403181, -0.5721141, 1, 1, 1, 1, 1,
0.05584014, 1.260069, 0.9637427, 1, 1, 1, 1, 1,
0.0569142, 0.2301306, 1.519127, 1, 1, 1, 1, 1,
0.06303604, 0.0104719, 1.517688, 1, 1, 1, 1, 1,
0.06830029, -0.4277208, 3.012827, 1, 1, 1, 1, 1,
0.06950334, -0.6607643, 1.624173, 1, 1, 1, 1, 1,
0.07442854, -0.4998544, 2.21693, 1, 1, 1, 1, 1,
0.08074627, -0.06516447, 2.307883, 1, 1, 1, 1, 1,
0.08319917, 0.5460002, -0.260198, 1, 1, 1, 1, 1,
0.08724095, 1.482435, 0.7697003, 1, 1, 1, 1, 1,
0.08864081, 0.4873321, 1.123416, 1, 1, 1, 1, 1,
0.09015542, 0.133561, 1.523702, 1, 1, 1, 1, 1,
0.09456096, -0.01721887, 3.172485, 0, 0, 1, 1, 1,
0.09735444, -1.530557, 5.437086, 1, 0, 0, 1, 1,
0.09821049, -0.5884348, 3.021387, 1, 0, 0, 1, 1,
0.1001157, 0.3038527, -1.622536, 1, 0, 0, 1, 1,
0.1037171, -0.3370408, 2.998057, 1, 0, 0, 1, 1,
0.112776, 0.25124, 1.488208, 1, 0, 0, 1, 1,
0.1173711, -0.9206333, 3.746953, 0, 0, 0, 1, 1,
0.1187494, 0.2214846, 0.9238325, 0, 0, 0, 1, 1,
0.1291681, -1.498685, 2.286017, 0, 0, 0, 1, 1,
0.1318409, 0.2963769, 1.770215, 0, 0, 0, 1, 1,
0.1457358, 0.9790154, 0.4381697, 0, 0, 0, 1, 1,
0.1461443, 0.2541027, 0.2398779, 0, 0, 0, 1, 1,
0.1469487, 0.3451805, 0.687448, 0, 0, 0, 1, 1,
0.1494245, 0.1276113, 1.415944, 1, 1, 1, 1, 1,
0.1505467, 1.142563, 2.183045, 1, 1, 1, 1, 1,
0.1550503, 0.5349199, 1.5606, 1, 1, 1, 1, 1,
0.1601885, -0.7107333, 2.510442, 1, 1, 1, 1, 1,
0.1615061, 2.805895, 1.109667, 1, 1, 1, 1, 1,
0.1694205, 0.274174, 1.478529, 1, 1, 1, 1, 1,
0.1697705, -0.6662872, 1.684256, 1, 1, 1, 1, 1,
0.1701225, -1.553985, 4.852428, 1, 1, 1, 1, 1,
0.1754144, -1.584264, 2.657565, 1, 1, 1, 1, 1,
0.1812459, -0.2583144, 5.280775, 1, 1, 1, 1, 1,
0.181744, 0.5652658, -0.1607577, 1, 1, 1, 1, 1,
0.1846755, -0.5495818, 1.654295, 1, 1, 1, 1, 1,
0.1855134, 0.5475841, -0.603895, 1, 1, 1, 1, 1,
0.1941164, -1.261965, 3.201187, 1, 1, 1, 1, 1,
0.1946973, -0.3217093, 3.878264, 1, 1, 1, 1, 1,
0.1952338, 0.165966, 0.1232343, 0, 0, 1, 1, 1,
0.1964692, -0.8213503, 1.790823, 1, 0, 0, 1, 1,
0.1990888, -2.955061, 3.133067, 1, 0, 0, 1, 1,
0.2005097, 0.4342088, 0.8025116, 1, 0, 0, 1, 1,
0.2061691, -0.532987, 2.99911, 1, 0, 0, 1, 1,
0.2063858, -1.501956, 3.909431, 1, 0, 0, 1, 1,
0.2093151, -1.515582, 2.101061, 0, 0, 0, 1, 1,
0.2108075, -0.4994442, 3.177017, 0, 0, 0, 1, 1,
0.2128696, 2.21319, -1.374652, 0, 0, 0, 1, 1,
0.2164869, 1.920224, 0.3430878, 0, 0, 0, 1, 1,
0.2187921, 1.211895, 0.7885842, 0, 0, 0, 1, 1,
0.2225558, -1.019553, 1.699402, 0, 0, 0, 1, 1,
0.2249174, -2.137952, 2.230781, 0, 0, 0, 1, 1,
0.2249879, 0.3188433, -0.6717187, 1, 1, 1, 1, 1,
0.2252389, 0.3050307, 1.601401, 1, 1, 1, 1, 1,
0.2291379, -0.3238466, 0.8462465, 1, 1, 1, 1, 1,
0.2317992, -0.3623212, 2.725585, 1, 1, 1, 1, 1,
0.2434237, -2.271256, 2.035416, 1, 1, 1, 1, 1,
0.2439185, 0.4708645, 0.3862917, 1, 1, 1, 1, 1,
0.2492429, -0.4917899, 3.427711, 1, 1, 1, 1, 1,
0.2506988, -1.07282, 2.142527, 1, 1, 1, 1, 1,
0.2561648, -0.8576593, 2.766119, 1, 1, 1, 1, 1,
0.2574049, -0.5909714, 1.744693, 1, 1, 1, 1, 1,
0.257932, 0.8980001, 1.188084, 1, 1, 1, 1, 1,
0.2627521, -0.4768547, 3.067344, 1, 1, 1, 1, 1,
0.2715226, -1.450915, 3.811855, 1, 1, 1, 1, 1,
0.2721224, 1.461826, 1.083552, 1, 1, 1, 1, 1,
0.2728753, 0.3068455, 1.935197, 1, 1, 1, 1, 1,
0.2755449, 0.03784529, -0.2854088, 0, 0, 1, 1, 1,
0.276944, 0.791482, 0.4508748, 1, 0, 0, 1, 1,
0.2796867, 0.4860641, 1.357776, 1, 0, 0, 1, 1,
0.2865728, 2.584348, -1.023465, 1, 0, 0, 1, 1,
0.2877078, -0.5606199, 2.241371, 1, 0, 0, 1, 1,
0.2930208, 0.4704064, 1.934833, 1, 0, 0, 1, 1,
0.2943372, 0.2287252, 1.774241, 0, 0, 0, 1, 1,
0.2950823, 0.1975446, 1.909477, 0, 0, 0, 1, 1,
0.2959054, 0.6841885, 0.3752028, 0, 0, 0, 1, 1,
0.2965212, 2.21219, 2.156486, 0, 0, 0, 1, 1,
0.2977636, 0.4695338, 1.19638, 0, 0, 0, 1, 1,
0.3001356, -0.3026073, 1.411511, 0, 0, 0, 1, 1,
0.3014184, 0.5292175, 1.111786, 0, 0, 0, 1, 1,
0.3055882, -0.559377, 1.268678, 1, 1, 1, 1, 1,
0.3060869, -0.5346125, 0.8068748, 1, 1, 1, 1, 1,
0.3067755, -0.5112145, 0.4818642, 1, 1, 1, 1, 1,
0.3073534, 1.169728, 1.487352, 1, 1, 1, 1, 1,
0.3085914, -0.3512622, 2.829814, 1, 1, 1, 1, 1,
0.3121876, -3.287258, 4.4132, 1, 1, 1, 1, 1,
0.3218731, 0.2364073, 2.121174, 1, 1, 1, 1, 1,
0.3228371, 0.6917956, -0.5159245, 1, 1, 1, 1, 1,
0.3239175, -0.8736988, 1.719708, 1, 1, 1, 1, 1,
0.3250557, 0.7005606, 1.1824, 1, 1, 1, 1, 1,
0.3272907, -0.4586471, 2.331133, 1, 1, 1, 1, 1,
0.336964, 0.729511, -0.08867812, 1, 1, 1, 1, 1,
0.3473392, 0.3457268, 1.79073, 1, 1, 1, 1, 1,
0.350145, 0.8732855, 0.4769639, 1, 1, 1, 1, 1,
0.3507305, 1.010414, 0.7651529, 1, 1, 1, 1, 1,
0.35147, 1.087898, -1.13094, 0, 0, 1, 1, 1,
0.3514793, -0.03679603, 0.4269744, 1, 0, 0, 1, 1,
0.3582529, -1.975312, 2.178218, 1, 0, 0, 1, 1,
0.358761, -0.8345287, 2.84888, 1, 0, 0, 1, 1,
0.3627976, 0.1702943, -0.04233116, 1, 0, 0, 1, 1,
0.3632687, -0.630588, 2.664422, 1, 0, 0, 1, 1,
0.3645696, 0.3745731, -0.08204933, 0, 0, 0, 1, 1,
0.3653395, -0.3335789, 0.536674, 0, 0, 0, 1, 1,
0.3661358, -0.5196893, 3.960374, 0, 0, 0, 1, 1,
0.3664555, -0.3281662, 1.708713, 0, 0, 0, 1, 1,
0.3732976, -0.3431172, 1.961591, 0, 0, 0, 1, 1,
0.3742424, -0.2041039, 2.692261, 0, 0, 0, 1, 1,
0.3744911, 1.347099, -1.06383, 0, 0, 0, 1, 1,
0.3803998, 0.5813203, 0.7045302, 1, 1, 1, 1, 1,
0.3829854, -2.53419, 2.871737, 1, 1, 1, 1, 1,
0.3893549, -0.1604586, 1.573209, 1, 1, 1, 1, 1,
0.3909257, 1.201316, 1.125158, 1, 1, 1, 1, 1,
0.3911264, 0.7062919, 0.8611032, 1, 1, 1, 1, 1,
0.397582, 0.08263861, 0.8699135, 1, 1, 1, 1, 1,
0.3998939, -0.3214266, 2.782805, 1, 1, 1, 1, 1,
0.4000656, 0.2305881, 2.358102, 1, 1, 1, 1, 1,
0.4052553, 0.2461297, 2.053499, 1, 1, 1, 1, 1,
0.4102395, -0.4196821, 3.55852, 1, 1, 1, 1, 1,
0.4122423, -1.133694, 4.013378, 1, 1, 1, 1, 1,
0.4134212, -0.1705932, 1.135419, 1, 1, 1, 1, 1,
0.413956, -0.8245665, 2.076919, 1, 1, 1, 1, 1,
0.4140716, -1.035094, 2.28535, 1, 1, 1, 1, 1,
0.4150278, 0.01319203, 0.5292597, 1, 1, 1, 1, 1,
0.4192683, 1.976247, 1.190176, 0, 0, 1, 1, 1,
0.4296232, -0.3218897, 3.461354, 1, 0, 0, 1, 1,
0.434274, -0.2548009, 1.636912, 1, 0, 0, 1, 1,
0.4358495, -1.422588, 4.174061, 1, 0, 0, 1, 1,
0.436306, 0.7157125, 0.5091864, 1, 0, 0, 1, 1,
0.4378856, 0.8238511, 0.05647302, 1, 0, 0, 1, 1,
0.4393943, 1.601179, 0.408641, 0, 0, 0, 1, 1,
0.4433005, -0.1593689, 1.48316, 0, 0, 0, 1, 1,
0.4447775, -0.741387, 1.330014, 0, 0, 0, 1, 1,
0.4461834, 1.458075, 0.09188367, 0, 0, 0, 1, 1,
0.4463517, 1.013227, 1.017555, 0, 0, 0, 1, 1,
0.4518486, -0.185635, 0.8978414, 0, 0, 0, 1, 1,
0.4582154, 0.1697807, 1.499368, 0, 0, 0, 1, 1,
0.461864, 0.3637024, 1.44895, 1, 1, 1, 1, 1,
0.4623997, 0.4228659, 1.472161, 1, 1, 1, 1, 1,
0.4668282, -1.366175, 2.255106, 1, 1, 1, 1, 1,
0.4672947, -1.174172, 2.769681, 1, 1, 1, 1, 1,
0.4674676, -0.01678452, 0.3099808, 1, 1, 1, 1, 1,
0.4686374, -0.386573, 0.7451287, 1, 1, 1, 1, 1,
0.4690487, -0.5450808, 1.606346, 1, 1, 1, 1, 1,
0.4745055, -0.6555628, 1.023148, 1, 1, 1, 1, 1,
0.4780961, 0.7723471, 0.1825692, 1, 1, 1, 1, 1,
0.4815065, -2.382908, 1.967202, 1, 1, 1, 1, 1,
0.4872541, -0.7811128, 1.680565, 1, 1, 1, 1, 1,
0.4888344, -0.3567215, 2.529581, 1, 1, 1, 1, 1,
0.490525, -1.117722, 1.002922, 1, 1, 1, 1, 1,
0.4998096, -0.03714288, 1.83119, 1, 1, 1, 1, 1,
0.5038929, -1.963798, 3.794619, 1, 1, 1, 1, 1,
0.5054196, 2.098696, 2.383192, 0, 0, 1, 1, 1,
0.5057169, 0.08817478, 1.701659, 1, 0, 0, 1, 1,
0.5071523, -2.504282, 3.719685, 1, 0, 0, 1, 1,
0.5086199, 1.153388, 0.8668919, 1, 0, 0, 1, 1,
0.5121, -0.3302982, 1.956613, 1, 0, 0, 1, 1,
0.5173108, -0.04392777, 1.46824, 1, 0, 0, 1, 1,
0.520444, 0.3615164, 0.05038505, 0, 0, 0, 1, 1,
0.5284551, 0.5409357, 0.8302788, 0, 0, 0, 1, 1,
0.5297816, 0.364208, 1.678307, 0, 0, 0, 1, 1,
0.5371303, 1.352363, -0.8930011, 0, 0, 0, 1, 1,
0.5394702, -1.183692, 2.879728, 0, 0, 0, 1, 1,
0.5412617, -2.367003, 5.117209, 0, 0, 0, 1, 1,
0.5491681, -0.9843146, 2.630963, 0, 0, 0, 1, 1,
0.5510321, 0.4533072, 2.284753, 1, 1, 1, 1, 1,
0.552088, 0.750447, 0.7611039, 1, 1, 1, 1, 1,
0.5554766, 0.2606186, -0.7195951, 1, 1, 1, 1, 1,
0.557137, 1.670165, -0.8478107, 1, 1, 1, 1, 1,
0.5572082, -0.3261376, 4.367624, 1, 1, 1, 1, 1,
0.5578853, -0.7907109, 3.265602, 1, 1, 1, 1, 1,
0.5648366, 0.738306, 0.09194435, 1, 1, 1, 1, 1,
0.5716248, -1.181886, 3.401256, 1, 1, 1, 1, 1,
0.5731096, 0.1661843, 0.7663827, 1, 1, 1, 1, 1,
0.5792813, -1.472349, 3.016519, 1, 1, 1, 1, 1,
0.5826049, 1.354458, -1.273404, 1, 1, 1, 1, 1,
0.5836175, 1.768639, 2.110939, 1, 1, 1, 1, 1,
0.5839332, -0.05701207, 0.3643345, 1, 1, 1, 1, 1,
0.584176, -0.4832886, 3.296535, 1, 1, 1, 1, 1,
0.5846303, 1.004068, 2.133861, 1, 1, 1, 1, 1,
0.5923147, -0.9395473, 2.265012, 0, 0, 1, 1, 1,
0.593735, -0.2006905, 2.823359, 1, 0, 0, 1, 1,
0.5939264, 0.8446482, -0.02058647, 1, 0, 0, 1, 1,
0.5945227, 0.2300661, 2.266956, 1, 0, 0, 1, 1,
0.5959941, 0.8120142, 0.9209814, 1, 0, 0, 1, 1,
0.5969108, -0.4610498, 1.541289, 1, 0, 0, 1, 1,
0.5985093, -0.5188987, 2.133833, 0, 0, 0, 1, 1,
0.6006613, 0.3367162, 1.241458, 0, 0, 0, 1, 1,
0.6025825, -0.9213364, 3.060936, 0, 0, 0, 1, 1,
0.6051386, 1.610975, -0.08233669, 0, 0, 0, 1, 1,
0.6055599, -1.102572, 2.084135, 0, 0, 0, 1, 1,
0.6098747, 0.3435435, 1.270744, 0, 0, 0, 1, 1,
0.6103875, -0.3462331, 3.131603, 0, 0, 0, 1, 1,
0.6118313, -0.1380346, 1.008317, 1, 1, 1, 1, 1,
0.6157908, 0.8138947, 1.720411, 1, 1, 1, 1, 1,
0.6172074, -1.337865, 3.478328, 1, 1, 1, 1, 1,
0.6178935, -0.7077405, 2.550573, 1, 1, 1, 1, 1,
0.6251162, 0.01756233, 1.675418, 1, 1, 1, 1, 1,
0.6271126, -1.908638, 3.517349, 1, 1, 1, 1, 1,
0.6341775, -1.318803, 0.8519409, 1, 1, 1, 1, 1,
0.6350973, 0.1138805, 1.365937, 1, 1, 1, 1, 1,
0.6353558, 2.409203, 0.659834, 1, 1, 1, 1, 1,
0.6356019, 0.4771187, 0.489636, 1, 1, 1, 1, 1,
0.6368333, 1.341048, -1.246884, 1, 1, 1, 1, 1,
0.6389921, -0.9378984, 1.98797, 1, 1, 1, 1, 1,
0.6425785, 0.1979053, 1.743035, 1, 1, 1, 1, 1,
0.6430461, -0.09678172, 0.1017838, 1, 1, 1, 1, 1,
0.6446579, 1.274371, -0.18189, 1, 1, 1, 1, 1,
0.644991, 1.055902, 0.1493437, 0, 0, 1, 1, 1,
0.6455317, 0.2574355, 2.261483, 1, 0, 0, 1, 1,
0.6457689, 0.6008346, -0.8713419, 1, 0, 0, 1, 1,
0.6483902, 1.021877, 3.282208, 1, 0, 0, 1, 1,
0.6494478, -2.11445, 2.765492, 1, 0, 0, 1, 1,
0.651176, 1.238501, 2.017849, 1, 0, 0, 1, 1,
0.6544858, 0.8727574, -0.2084872, 0, 0, 0, 1, 1,
0.6574687, 1.398233, -1.306756, 0, 0, 0, 1, 1,
0.658632, 0.7159884, 1.126821, 0, 0, 0, 1, 1,
0.6600475, 1.320478, 0.2164259, 0, 0, 0, 1, 1,
0.6641301, -0.9097748, 2.802227, 0, 0, 0, 1, 1,
0.6662182, -0.3429497, 0.3685413, 0, 0, 0, 1, 1,
0.6688133, 0.8870897, 1.070541, 0, 0, 0, 1, 1,
0.6728823, -0.9793314, 2.422416, 1, 1, 1, 1, 1,
0.6758734, 0.6874043, 2.243014, 1, 1, 1, 1, 1,
0.6761848, -0.3872094, 1.438892, 1, 1, 1, 1, 1,
0.6777721, 0.5757021, 0.8688592, 1, 1, 1, 1, 1,
0.6786072, -2.232583, 3.393456, 1, 1, 1, 1, 1,
0.6803452, 1.099516, -1.971254, 1, 1, 1, 1, 1,
0.6811189, -0.4838492, 1.340109, 1, 1, 1, 1, 1,
0.6846979, 1.745881, 0.3523765, 1, 1, 1, 1, 1,
0.6851473, 1.386876, 1.47823, 1, 1, 1, 1, 1,
0.6960706, -0.4890629, 2.387561, 1, 1, 1, 1, 1,
0.7004476, -0.5163696, 0.8519622, 1, 1, 1, 1, 1,
0.703535, -0.3258864, 0.7319536, 1, 1, 1, 1, 1,
0.7038635, -0.8097339, 1.77264, 1, 1, 1, 1, 1,
0.7039678, 0.8639045, 0.5313444, 1, 1, 1, 1, 1,
0.7053352, 0.1052672, 1.387451, 1, 1, 1, 1, 1,
0.7075099, -0.43, 1.661711, 0, 0, 1, 1, 1,
0.710335, -0.4101104, 4.106043, 1, 0, 0, 1, 1,
0.7152185, -1.204865, 2.288612, 1, 0, 0, 1, 1,
0.7155664, -0.7280051, 0.9227848, 1, 0, 0, 1, 1,
0.7174699, 0.5962245, 0.9420655, 1, 0, 0, 1, 1,
0.7187483, 1.102055, -0.4223225, 1, 0, 0, 1, 1,
0.730115, -0.4078171, 1.605502, 0, 0, 0, 1, 1,
0.7313201, -0.2658713, 2.185824, 0, 0, 0, 1, 1,
0.7315478, -1.645626, 2.763381, 0, 0, 0, 1, 1,
0.7350292, 0.5248263, -0.01844927, 0, 0, 0, 1, 1,
0.7399407, -0.1065715, 1.112871, 0, 0, 0, 1, 1,
0.7438961, -0.3319997, 3.066482, 0, 0, 0, 1, 1,
0.747169, -0.4984039, 1.956249, 0, 0, 0, 1, 1,
0.7501612, 0.3994762, -0.7609114, 1, 1, 1, 1, 1,
0.752066, 0.1198977, 1.439616, 1, 1, 1, 1, 1,
0.7530735, 1.262257, -1.166161, 1, 1, 1, 1, 1,
0.7559265, -0.6078631, 0.8682317, 1, 1, 1, 1, 1,
0.7581037, 0.005070263, 1.838634, 1, 1, 1, 1, 1,
0.7608084, -0.1793038, 2.705709, 1, 1, 1, 1, 1,
0.7630922, 1.642953, 1.393718, 1, 1, 1, 1, 1,
0.7645688, 0.4009669, 2.144444, 1, 1, 1, 1, 1,
0.7648845, -1.003112, 4.459432, 1, 1, 1, 1, 1,
0.7670447, 2.600091, 0.2978026, 1, 1, 1, 1, 1,
0.7690817, -1.592901, 2.587657, 1, 1, 1, 1, 1,
0.7720028, 1.243986, 0.56106, 1, 1, 1, 1, 1,
0.7742895, 0.1196845, 2.319751, 1, 1, 1, 1, 1,
0.7766859, 1.07759, 0.9777303, 1, 1, 1, 1, 1,
0.7830685, -0.9527848, 2.403554, 1, 1, 1, 1, 1,
0.7840776, 1.179232, 3.96754, 0, 0, 1, 1, 1,
0.7882368, -0.6324629, 2.965967, 1, 0, 0, 1, 1,
0.7896716, -0.4573734, 2.501071, 1, 0, 0, 1, 1,
0.7897707, 0.2364037, 1.745675, 1, 0, 0, 1, 1,
0.7900131, -0.4965199, 2.376523, 1, 0, 0, 1, 1,
0.7934256, -0.01196274, -0.5930847, 1, 0, 0, 1, 1,
0.7941942, 0.4509642, 0.9136998, 0, 0, 0, 1, 1,
0.7972009, -0.1152385, 3.676484, 0, 0, 0, 1, 1,
0.7978029, -0.2706765, 1.241099, 0, 0, 0, 1, 1,
0.804071, -0.2415073, 3.268224, 0, 0, 0, 1, 1,
0.8042897, -0.4719012, 4.096559, 0, 0, 0, 1, 1,
0.8066898, -0.9805354, 1.385491, 0, 0, 0, 1, 1,
0.8103763, 2.069167, -1.163099, 0, 0, 0, 1, 1,
0.811415, -1.269475, 2.280941, 1, 1, 1, 1, 1,
0.8149066, 0.8821794, 0.9308426, 1, 1, 1, 1, 1,
0.8157187, 2.835815, -0.3474755, 1, 1, 1, 1, 1,
0.8215125, 0.2226756, 0.5667747, 1, 1, 1, 1, 1,
0.8264012, -1.38999, 2.574299, 1, 1, 1, 1, 1,
0.8302434, 1.177876, 0.1791258, 1, 1, 1, 1, 1,
0.8306987, -2.769852, 2.356352, 1, 1, 1, 1, 1,
0.833684, 0.5646997, 1.242568, 1, 1, 1, 1, 1,
0.8374995, -1.960479, 2.57652, 1, 1, 1, 1, 1,
0.8407264, -1.470476, 1.926046, 1, 1, 1, 1, 1,
0.8429194, -1.378728, 2.762478, 1, 1, 1, 1, 1,
0.8476416, -0.4022519, 3.213111, 1, 1, 1, 1, 1,
0.8524106, -2.306313, 3.268579, 1, 1, 1, 1, 1,
0.8530999, -0.4462613, 1.134189, 1, 1, 1, 1, 1,
0.8567734, -0.5775441, 2.409894, 1, 1, 1, 1, 1,
0.8613191, -0.4736309, 3.338925, 0, 0, 1, 1, 1,
0.8639877, -0.8321704, 2.341182, 1, 0, 0, 1, 1,
0.8662682, 0.7209305, -0.04543661, 1, 0, 0, 1, 1,
0.872753, 0.1175169, 2.329283, 1, 0, 0, 1, 1,
0.8749524, -0.3452677, 3.337781, 1, 0, 0, 1, 1,
0.8801864, -0.2765132, 1.608947, 1, 0, 0, 1, 1,
0.8863758, -1.155304, 1.198949, 0, 0, 0, 1, 1,
0.8903814, 0.645309, 0.5753291, 0, 0, 0, 1, 1,
0.891544, 0.573779, 0.8474355, 0, 0, 0, 1, 1,
0.8997556, 0.5765647, 2.059668, 0, 0, 0, 1, 1,
0.9055709, 0.1266609, 1.27486, 0, 0, 0, 1, 1,
0.9059325, 2.330034, 0.694521, 0, 0, 0, 1, 1,
0.907308, 1.273917, -0.6878266, 0, 0, 0, 1, 1,
0.9078875, 2.074575, -0.9026864, 1, 1, 1, 1, 1,
0.9105125, -0.2189749, 2.523358, 1, 1, 1, 1, 1,
0.9108728, -1.182089, 3.597684, 1, 1, 1, 1, 1,
0.9158961, -1.439746, 4.073336, 1, 1, 1, 1, 1,
0.9164692, 0.3433061, 2.178334, 1, 1, 1, 1, 1,
0.9164931, -0.1174635, -0.1097081, 1, 1, 1, 1, 1,
0.9166806, -0.09532649, 1.558136, 1, 1, 1, 1, 1,
0.9227489, -0.6850145, 1.325612, 1, 1, 1, 1, 1,
0.9277018, -0.9972172, 3.253593, 1, 1, 1, 1, 1,
0.9404725, 0.5373943, 0.7503708, 1, 1, 1, 1, 1,
0.9414901, -0.3754033, 0.6957648, 1, 1, 1, 1, 1,
0.946556, -0.8512532, 1.597736, 1, 1, 1, 1, 1,
0.946842, -0.04638815, 1.299289, 1, 1, 1, 1, 1,
0.9554663, -0.874093, 2.329319, 1, 1, 1, 1, 1,
0.9664165, -1.04583, 1.768949, 1, 1, 1, 1, 1,
0.9672557, -1.277368, 1.885237, 0, 0, 1, 1, 1,
0.9682922, -0.07178118, 4.146519, 1, 0, 0, 1, 1,
0.9720226, 2.049372, -0.457723, 1, 0, 0, 1, 1,
0.9729382, -1.047964, 3.954736, 1, 0, 0, 1, 1,
0.9764638, -0.9982427, 2.80621, 1, 0, 0, 1, 1,
0.978716, 0.3599673, 1.526457, 1, 0, 0, 1, 1,
0.9828151, 1.126457, -0.5979114, 0, 0, 0, 1, 1,
0.9834035, 0.5344746, 0.220311, 0, 0, 0, 1, 1,
0.9887563, -1.764388, 3.942232, 0, 0, 0, 1, 1,
0.9948735, -1.662679, 3.438362, 0, 0, 0, 1, 1,
1.000265, -0.6203515, 4.05593, 0, 0, 0, 1, 1,
1.002838, 0.7629042, 1.872591, 0, 0, 0, 1, 1,
1.003416, -0.2190762, 1.215861, 0, 0, 0, 1, 1,
1.004158, 1.141316, 1.11605, 1, 1, 1, 1, 1,
1.006957, -0.4225436, 2.237485, 1, 1, 1, 1, 1,
1.00932, 2.163689, 0.8661147, 1, 1, 1, 1, 1,
1.028674, -0.1599859, 1.26054, 1, 1, 1, 1, 1,
1.032778, 0.3369349, 0.6202125, 1, 1, 1, 1, 1,
1.034905, -0.9072449, 3.849345, 1, 1, 1, 1, 1,
1.035426, -0.5049772, 3.310365, 1, 1, 1, 1, 1,
1.038577, 0.9129408, 1.03416, 1, 1, 1, 1, 1,
1.042356, -0.4978058, 3.541512, 1, 1, 1, 1, 1,
1.048264, -1.874909, 3.49764, 1, 1, 1, 1, 1,
1.048557, 0.369765, 1.567507, 1, 1, 1, 1, 1,
1.056614, -0.02633561, 1.36542, 1, 1, 1, 1, 1,
1.066914, -0.8509265, 2.571999, 1, 1, 1, 1, 1,
1.070446, 0.4134892, 0.320778, 1, 1, 1, 1, 1,
1.074126, 0.07933471, 2.40772, 1, 1, 1, 1, 1,
1.078596, -1.386826, 1.458947, 0, 0, 1, 1, 1,
1.081176, 0.08600925, 1.632386, 1, 0, 0, 1, 1,
1.083361, -0.9834386, 1.989091, 1, 0, 0, 1, 1,
1.097697, -2.872538, 2.544592, 1, 0, 0, 1, 1,
1.113573, 1.295862, 2.922187, 1, 0, 0, 1, 1,
1.131436, -0.1120312, 2.60183, 1, 0, 0, 1, 1,
1.1322, -1.607248, 1.971204, 0, 0, 0, 1, 1,
1.139253, 0.4427899, 0.5542364, 0, 0, 0, 1, 1,
1.140288, 1.3401, 1.049512, 0, 0, 0, 1, 1,
1.146846, -0.196558, 1.062165, 0, 0, 0, 1, 1,
1.14688, -1.018046, 1.2016, 0, 0, 0, 1, 1,
1.15667, -1.21309, 3.028087, 0, 0, 0, 1, 1,
1.162392, 0.1013092, 2.730513, 0, 0, 0, 1, 1,
1.164026, -1.155654, 3.566853, 1, 1, 1, 1, 1,
1.170737, 1.554012, 0.8639457, 1, 1, 1, 1, 1,
1.175425, -0.7905607, 2.323353, 1, 1, 1, 1, 1,
1.186457, -0.244139, 0.9973307, 1, 1, 1, 1, 1,
1.190172, 0.5279039, 1.459224, 1, 1, 1, 1, 1,
1.193119, 0.4954089, 0.5175096, 1, 1, 1, 1, 1,
1.197024, -0.7151973, 2.201252, 1, 1, 1, 1, 1,
1.197176, 0.2862746, 1.597302, 1, 1, 1, 1, 1,
1.200105, -1.269973, 2.225742, 1, 1, 1, 1, 1,
1.201346, 1.30419, 0.09609801, 1, 1, 1, 1, 1,
1.212277, -0.4292619, 1.444778, 1, 1, 1, 1, 1,
1.216542, -1.069796, 0.7806528, 1, 1, 1, 1, 1,
1.217481, 1.006274, 0.05666973, 1, 1, 1, 1, 1,
1.219518, -2.798306, 2.459186, 1, 1, 1, 1, 1,
1.224652, -0.6587163, 1.542247, 1, 1, 1, 1, 1,
1.224691, -0.5677465, 3.097535, 0, 0, 1, 1, 1,
1.229283, -0.08087599, 0.9983345, 1, 0, 0, 1, 1,
1.241367, -1.201101, 2.261855, 1, 0, 0, 1, 1,
1.242208, -1.658069, 2.218756, 1, 0, 0, 1, 1,
1.249996, -0.2951165, 3.061322, 1, 0, 0, 1, 1,
1.257644, -1.084112, 1.392101, 1, 0, 0, 1, 1,
1.257729, 0.7700055, 0.8729199, 0, 0, 0, 1, 1,
1.259874, 0.0527426, 2.22275, 0, 0, 0, 1, 1,
1.264505, -2.195185, 3.003322, 0, 0, 0, 1, 1,
1.265465, 0.4443503, 2.049058, 0, 0, 0, 1, 1,
1.268324, 0.1484682, 1.617308, 0, 0, 0, 1, 1,
1.276414, -0.1393817, 3.501271, 0, 0, 0, 1, 1,
1.282098, 0.5933371, 0.8306609, 0, 0, 0, 1, 1,
1.285458, 0.3575405, 1.689831, 1, 1, 1, 1, 1,
1.288388, 0.7515755, 0.08025503, 1, 1, 1, 1, 1,
1.292257, -0.2656547, 3.459507, 1, 1, 1, 1, 1,
1.292603, 0.2517347, -0.4041482, 1, 1, 1, 1, 1,
1.309898, -0.5794974, 1.598208, 1, 1, 1, 1, 1,
1.313711, 0.7680015, 2.732074, 1, 1, 1, 1, 1,
1.323191, 0.3574188, 2.365783, 1, 1, 1, 1, 1,
1.339062, 0.1897136, 0.3668989, 1, 1, 1, 1, 1,
1.339186, 0.1565825, 1.58916, 1, 1, 1, 1, 1,
1.340507, -1.553878, 2.637682, 1, 1, 1, 1, 1,
1.342662, -0.9618522, 2.334601, 1, 1, 1, 1, 1,
1.343807, -0.5023504, 2.081023, 1, 1, 1, 1, 1,
1.344794, -1.17657, 0.7363247, 1, 1, 1, 1, 1,
1.374474, -0.4801278, 1.004906, 1, 1, 1, 1, 1,
1.38325, 1.066442, 1.731975, 1, 1, 1, 1, 1,
1.38495, -1.389634, 1.785315, 0, 0, 1, 1, 1,
1.402736, -0.8086352, 2.017139, 1, 0, 0, 1, 1,
1.411983, -0.3889698, 0.3837551, 1, 0, 0, 1, 1,
1.431373, -1.464642, 3.341251, 1, 0, 0, 1, 1,
1.432366, 0.750846, 3.433336, 1, 0, 0, 1, 1,
1.437558, 1.119978, 0.8962858, 1, 0, 0, 1, 1,
1.446753, 1.082397, 0.0563929, 0, 0, 0, 1, 1,
1.45347, -1.316397, 5.426935, 0, 0, 0, 1, 1,
1.473335, 0.1747764, 0.3195285, 0, 0, 0, 1, 1,
1.493772, -0.1763881, 0.8476721, 0, 0, 0, 1, 1,
1.496283, -0.5316159, 2.499074, 0, 0, 0, 1, 1,
1.496464, 0.2287762, 0.7645979, 0, 0, 0, 1, 1,
1.51269, -0.3077281, 0.7981244, 0, 0, 0, 1, 1,
1.52745, -0.7625312, 0.8715712, 1, 1, 1, 1, 1,
1.53025, 0.06277917, 1.071397, 1, 1, 1, 1, 1,
1.533917, -0.945723, 2.141124, 1, 1, 1, 1, 1,
1.542909, -0.5461963, 1.248757, 1, 1, 1, 1, 1,
1.545093, 0.2010422, 2.593932, 1, 1, 1, 1, 1,
1.557051, 0.3841455, 1.544552, 1, 1, 1, 1, 1,
1.568147, 0.2805417, 0.3909906, 1, 1, 1, 1, 1,
1.58663, -0.9617974, 1.999586, 1, 1, 1, 1, 1,
1.595967, -0.5130347, 2.043023, 1, 1, 1, 1, 1,
1.59777, -0.9920251, 2.715723, 1, 1, 1, 1, 1,
1.603073, 0.6388505, 2.13309, 1, 1, 1, 1, 1,
1.623456, -1.226214, 3.981293, 1, 1, 1, 1, 1,
1.630286, -0.4361498, 2.182626, 1, 1, 1, 1, 1,
1.632905, -0.04348018, -0.1452096, 1, 1, 1, 1, 1,
1.683223, 0.5059918, 3.713816, 1, 1, 1, 1, 1,
1.68771, -0.9506966, 1.82617, 0, 0, 1, 1, 1,
1.704297, 0.3877417, 1.495669, 1, 0, 0, 1, 1,
1.71389, 0.9209967, 0.1236098, 1, 0, 0, 1, 1,
1.714873, 0.4654052, 0.2658855, 1, 0, 0, 1, 1,
1.714905, 0.217257, 0.9871964, 1, 0, 0, 1, 1,
1.721443, -1.122851, -0.003626827, 1, 0, 0, 1, 1,
1.7385, 1.33879, 3.578069, 0, 0, 0, 1, 1,
1.73878, -0.3649471, 0.382695, 0, 0, 0, 1, 1,
1.798015, -0.5997675, 0.9952818, 0, 0, 0, 1, 1,
1.815575, 0.9868007, 0.8470625, 0, 0, 0, 1, 1,
1.836491, 0.4424881, 0.6053119, 0, 0, 0, 1, 1,
1.838517, -1.978184, 3.258276, 0, 0, 0, 1, 1,
1.86385, 1.109147, 1.049339, 0, 0, 0, 1, 1,
1.870892, -0.1900822, 0.9113145, 1, 1, 1, 1, 1,
1.880145, 1.261586, 1.538747, 1, 1, 1, 1, 1,
1.880435, -1.082989, 1.005458, 1, 1, 1, 1, 1,
1.911981, 0.6061772, 1.409261, 1, 1, 1, 1, 1,
1.915885, -0.03421701, 2.395286, 1, 1, 1, 1, 1,
1.955862, 0.1245889, -0.136254, 1, 1, 1, 1, 1,
1.956641, -1.516745, 3.229169, 1, 1, 1, 1, 1,
1.974204, 1.837264, -0.1840091, 1, 1, 1, 1, 1,
1.974287, 0.02528358, 2.836791, 1, 1, 1, 1, 1,
1.976128, -2.324983, 2.292575, 1, 1, 1, 1, 1,
1.980582, 0.1721391, 1.299484, 1, 1, 1, 1, 1,
2.018235, -0.4493475, 0.7533536, 1, 1, 1, 1, 1,
2.042688, -1.357241, 2.195717, 1, 1, 1, 1, 1,
2.123991, 0.2812804, 2.892342, 1, 1, 1, 1, 1,
2.13274, 0.1594316, 2.14959, 1, 1, 1, 1, 1,
2.133443, 0.02785122, 1.421891, 0, 0, 1, 1, 1,
2.138629, 0.3933624, 3.227968, 1, 0, 0, 1, 1,
2.15449, -0.1207505, 0.7915645, 1, 0, 0, 1, 1,
2.157984, 0.3439342, 2.028095, 1, 0, 0, 1, 1,
2.187524, -0.2306068, 2.522537, 1, 0, 0, 1, 1,
2.207306, -1.352811, 1.274589, 1, 0, 0, 1, 1,
2.235656, -0.01947591, 0.2311017, 0, 0, 0, 1, 1,
2.278649, 0.0561042, 1.948232, 0, 0, 0, 1, 1,
2.450242, -1.703239, 2.722951, 0, 0, 0, 1, 1,
2.506141, -1.562796, 3.547493, 0, 0, 0, 1, 1,
2.571459, -2.192921, 2.499884, 0, 0, 0, 1, 1,
2.661079, 0.3252297, 1.26682, 0, 0, 0, 1, 1,
2.709674, -0.7742631, 1.29669, 0, 0, 0, 1, 1,
2.713293, 0.4069115, 2.272779, 1, 1, 1, 1, 1,
2.761197, 0.6226439, 2.799151, 1, 1, 1, 1, 1,
2.862419, -0.9112059, 2.510697, 1, 1, 1, 1, 1,
2.931693, -2.324794, 2.638753, 1, 1, 1, 1, 1,
3.05556, 0.4838743, 0.3039071, 1, 1, 1, 1, 1,
3.200998, 0.7458898, 1.503334, 1, 1, 1, 1, 1,
3.424706, -0.2920061, 0.5860688, 1, 1, 1, 1, 1
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
var radius = 9.4493;
var distance = 33.19026;
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
mvMatrix.translate( -0.2420995, 0.2257214, -0.1281631 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.19026);
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
