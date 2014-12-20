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
-2.874461, 2.84479, -2.420345, 1, 0, 0, 1,
-2.743289, 1.508612, -2.257223, 1, 0.007843138, 0, 1,
-2.672707, 1.094703, -1.240313, 1, 0.01176471, 0, 1,
-2.640682, -0.6334948, -1.156797, 1, 0.01960784, 0, 1,
-2.613917, -0.7577941, -2.277185, 1, 0.02352941, 0, 1,
-2.458715, 1.954772, -0.1493972, 1, 0.03137255, 0, 1,
-2.457775, 0.6670942, -1.103831, 1, 0.03529412, 0, 1,
-2.413919, -0.5095485, -2.418533, 1, 0.04313726, 0, 1,
-2.403345, -1.981287, -2.601903, 1, 0.04705882, 0, 1,
-2.360652, 1.011328, -0.7719846, 1, 0.05490196, 0, 1,
-2.318639, -0.5211037, -2.680114, 1, 0.05882353, 0, 1,
-2.29131, 0.5887176, -2.464259, 1, 0.06666667, 0, 1,
-2.246951, 0.4756225, -2.256177, 1, 0.07058824, 0, 1,
-2.205491, -0.1225182, -1.589005, 1, 0.07843138, 0, 1,
-2.195584, -0.1482075, -0.9313022, 1, 0.08235294, 0, 1,
-2.183437, 0.2795386, -2.441685, 1, 0.09019608, 0, 1,
-2.115736, -1.363891, -0.3465352, 1, 0.09411765, 0, 1,
-2.094874, 1.624337, -1.260001, 1, 0.1019608, 0, 1,
-2.08996, 0.6281939, 0.992678, 1, 0.1098039, 0, 1,
-2.070937, 1.092787, -1.6425, 1, 0.1137255, 0, 1,
-2.057068, 0.8952505, 0.02997406, 1, 0.1215686, 0, 1,
-1.996833, 0.06457718, -1.514893, 1, 0.1254902, 0, 1,
-1.951089, -0.8957029, -2.346579, 1, 0.1333333, 0, 1,
-1.941059, 0.284167, -1.568131, 1, 0.1372549, 0, 1,
-1.935335, -0.4534032, -1.745517, 1, 0.145098, 0, 1,
-1.908789, 0.7792845, -1.650115, 1, 0.1490196, 0, 1,
-1.907715, -2.425735, -2.747843, 1, 0.1568628, 0, 1,
-1.855187, -0.3964208, -1.690536, 1, 0.1607843, 0, 1,
-1.814254, -1.445433, -1.072996, 1, 0.1686275, 0, 1,
-1.792744, 1.329662, 0.4679904, 1, 0.172549, 0, 1,
-1.77906, 0.4610384, -2.114573, 1, 0.1803922, 0, 1,
-1.775362, -0.741052, -0.7454886, 1, 0.1843137, 0, 1,
-1.770244, 0.243376, -2.024944, 1, 0.1921569, 0, 1,
-1.751717, -0.235644, -0.2322736, 1, 0.1960784, 0, 1,
-1.750297, -0.7844346, -2.19097, 1, 0.2039216, 0, 1,
-1.72874, -0.7615342, -1.139077, 1, 0.2117647, 0, 1,
-1.720157, 0.06901342, -1.920311, 1, 0.2156863, 0, 1,
-1.708812, -0.4571323, -1.782082, 1, 0.2235294, 0, 1,
-1.682184, 0.7850546, -2.707801, 1, 0.227451, 0, 1,
-1.670325, 0.2667917, -1.961203, 1, 0.2352941, 0, 1,
-1.666915, -1.357413, -1.857275, 1, 0.2392157, 0, 1,
-1.6592, -2.031765, -2.474245, 1, 0.2470588, 0, 1,
-1.655461, 0.4620214, -0.597824, 1, 0.2509804, 0, 1,
-1.59237, -0.4688153, -1.677952, 1, 0.2588235, 0, 1,
-1.588452, 0.4030933, -0.422022, 1, 0.2627451, 0, 1,
-1.586676, 0.5592736, -1.750155, 1, 0.2705882, 0, 1,
-1.583122, -0.5844051, -1.683281, 1, 0.2745098, 0, 1,
-1.580141, -0.01086259, -1.393928, 1, 0.282353, 0, 1,
-1.566823, -0.5636684, -0.03272631, 1, 0.2862745, 0, 1,
-1.553167, -1.318268, -2.405642, 1, 0.2941177, 0, 1,
-1.53693, 0.4476687, -2.280406, 1, 0.3019608, 0, 1,
-1.507243, 0.756366, -0.9638228, 1, 0.3058824, 0, 1,
-1.493319, 2.618601, 1.287692, 1, 0.3137255, 0, 1,
-1.49192, 0.5412807, -0.09694634, 1, 0.3176471, 0, 1,
-1.482099, -1.221874, -2.657059, 1, 0.3254902, 0, 1,
-1.481866, -0.6058172, -2.776718, 1, 0.3294118, 0, 1,
-1.477218, -0.9951236, -2.482457, 1, 0.3372549, 0, 1,
-1.467182, 0.1385472, -1.887822, 1, 0.3411765, 0, 1,
-1.462058, -0.7016105, -4.686674, 1, 0.3490196, 0, 1,
-1.433258, -0.8722386, -0.7508176, 1, 0.3529412, 0, 1,
-1.426853, -0.2630855, -2.841928, 1, 0.3607843, 0, 1,
-1.410683, 0.2421131, -1.538395, 1, 0.3647059, 0, 1,
-1.395955, 1.884221, -1.207221, 1, 0.372549, 0, 1,
-1.386576, 0.04103659, -1.04334, 1, 0.3764706, 0, 1,
-1.384378, 0.5865238, -2.392332, 1, 0.3843137, 0, 1,
-1.362714, -0.5224033, -2.168196, 1, 0.3882353, 0, 1,
-1.354946, -1.237344, -1.336137, 1, 0.3960784, 0, 1,
-1.348718, 0.03077535, -1.400712, 1, 0.4039216, 0, 1,
-1.348506, -1.150646, -1.68202, 1, 0.4078431, 0, 1,
-1.340702, -0.6064273, -2.036165, 1, 0.4156863, 0, 1,
-1.332444, 1.474458, -0.775526, 1, 0.4196078, 0, 1,
-1.328549, 0.9720408, -0.6431974, 1, 0.427451, 0, 1,
-1.317694, -1.07326, -3.129535, 1, 0.4313726, 0, 1,
-1.316554, -0.3835869, -2.354009, 1, 0.4392157, 0, 1,
-1.312198, -0.694838, -1.228501, 1, 0.4431373, 0, 1,
-1.305634, 1.32497, -1.076793, 1, 0.4509804, 0, 1,
-1.291857, 0.04601222, -1.001917, 1, 0.454902, 0, 1,
-1.282427, 0.1489667, -1.780256, 1, 0.4627451, 0, 1,
-1.27655, -0.5561571, -0.5207433, 1, 0.4666667, 0, 1,
-1.269651, 0.5636368, -0.7257873, 1, 0.4745098, 0, 1,
-1.269294, 0.8314152, -0.4900626, 1, 0.4784314, 0, 1,
-1.268282, 0.1767601, -0.7314791, 1, 0.4862745, 0, 1,
-1.267656, -0.07409842, -0.9789841, 1, 0.4901961, 0, 1,
-1.262055, 0.04890089, 0.1024825, 1, 0.4980392, 0, 1,
-1.253445, 1.971115, -0.3930927, 1, 0.5058824, 0, 1,
-1.251837, 2.274015, -0.6644213, 1, 0.509804, 0, 1,
-1.24967, -0.6477531, -0.7467868, 1, 0.5176471, 0, 1,
-1.244885, 0.04651261, -1.581663, 1, 0.5215687, 0, 1,
-1.244634, -1.238592, -3.104479, 1, 0.5294118, 0, 1,
-1.241021, -0.6070482, -1.146411, 1, 0.5333334, 0, 1,
-1.229441, -0.694618, -0.9572828, 1, 0.5411765, 0, 1,
-1.229151, 2.191028, -2.424392, 1, 0.5450981, 0, 1,
-1.225732, 0.7482122, -0.6490659, 1, 0.5529412, 0, 1,
-1.225308, 0.4439639, -3.245409, 1, 0.5568628, 0, 1,
-1.223169, -0.6217037, -2.312132, 1, 0.5647059, 0, 1,
-1.215455, 1.197637, -0.6456718, 1, 0.5686275, 0, 1,
-1.213936, 0.6522271, 0.9468039, 1, 0.5764706, 0, 1,
-1.19968, 1.503898, -0.6545821, 1, 0.5803922, 0, 1,
-1.192653, -1.084674, -1.849946, 1, 0.5882353, 0, 1,
-1.192044, -0.1019809, -2.955166, 1, 0.5921569, 0, 1,
-1.190135, 1.383849, 1.334926, 1, 0.6, 0, 1,
-1.189923, -0.2413518, -0.08411218, 1, 0.6078432, 0, 1,
-1.186319, 3.081193, 1.264361, 1, 0.6117647, 0, 1,
-1.17635, 0.6192864, -0.5575809, 1, 0.6196079, 0, 1,
-1.176257, -0.3343621, -2.147159, 1, 0.6235294, 0, 1,
-1.174139, -1.18933, -5.420675, 1, 0.6313726, 0, 1,
-1.15289, 1.096497, 0.1141277, 1, 0.6352941, 0, 1,
-1.14994, -1.291147, 0.301285, 1, 0.6431373, 0, 1,
-1.146155, -1.232496, -1.888836, 1, 0.6470588, 0, 1,
-1.146137, 1.278066, -2.3409, 1, 0.654902, 0, 1,
-1.145387, -0.6961038, -2.848234, 1, 0.6588235, 0, 1,
-1.142709, 0.1796286, -1.159261, 1, 0.6666667, 0, 1,
-1.139815, 1.445511, -0.6115797, 1, 0.6705883, 0, 1,
-1.138713, 0.2161398, -1.286009, 1, 0.6784314, 0, 1,
-1.137737, -1.397064, -2.035536, 1, 0.682353, 0, 1,
-1.136578, 0.997631, -2.497818, 1, 0.6901961, 0, 1,
-1.13492, 1.268213, -0.8969195, 1, 0.6941177, 0, 1,
-1.125146, -0.5393113, -0.6607006, 1, 0.7019608, 0, 1,
-1.11405, -1.168492, -2.933431, 1, 0.7098039, 0, 1,
-1.111379, 0.4669049, -0.1135733, 1, 0.7137255, 0, 1,
-1.110544, 0.6275007, -0.1658453, 1, 0.7215686, 0, 1,
-1.105743, -1.255621, -4.00864, 1, 0.7254902, 0, 1,
-1.101395, -0.01635286, -0.1656242, 1, 0.7333333, 0, 1,
-1.099181, -0.3022076, -1.30289, 1, 0.7372549, 0, 1,
-1.098785, -1.099278, -2.935983, 1, 0.7450981, 0, 1,
-1.09452, 0.02816822, -1.334034, 1, 0.7490196, 0, 1,
-1.07269, 1.164286, -2.347505, 1, 0.7568628, 0, 1,
-1.072481, 0.5027704, -2.047081, 1, 0.7607843, 0, 1,
-1.070726, 1.166724, -1.527662, 1, 0.7686275, 0, 1,
-1.058011, -0.2585262, -1.796826, 1, 0.772549, 0, 1,
-1.050602, -0.06672598, -1.061139, 1, 0.7803922, 0, 1,
-1.0497, 0.7354225, -1.940738, 1, 0.7843137, 0, 1,
-1.048428, -0.8704316, -2.219859, 1, 0.7921569, 0, 1,
-1.04756, 1.269683, -0.2255681, 1, 0.7960784, 0, 1,
-1.044764, -0.1343666, -0.5629838, 1, 0.8039216, 0, 1,
-1.028514, 0.8936847, -0.5803151, 1, 0.8117647, 0, 1,
-1.024761, 0.5664006, 1.163327, 1, 0.8156863, 0, 1,
-1.018335, 1.480197, -1.000282, 1, 0.8235294, 0, 1,
-1.016701, -0.186746, 0.2210266, 1, 0.827451, 0, 1,
-1.016143, 2.67129, -1.660436, 1, 0.8352941, 0, 1,
-1.008371, -1.181716, -2.41489, 1, 0.8392157, 0, 1,
-1.005072, 0.3241992, -0.9537762, 1, 0.8470588, 0, 1,
-1.004381, 0.597793, -1.833184, 1, 0.8509804, 0, 1,
-0.9984865, 1.182276, -1.180945, 1, 0.8588235, 0, 1,
-0.9984253, -1.411938, -0.07601196, 1, 0.8627451, 0, 1,
-0.9912382, -0.2294563, -1.405808, 1, 0.8705882, 0, 1,
-0.9884619, -0.6588326, -2.720797, 1, 0.8745098, 0, 1,
-0.9878271, 0.633818, -2.394872, 1, 0.8823529, 0, 1,
-0.9809139, -0.9173114, -2.119113, 1, 0.8862745, 0, 1,
-0.9786573, 0.3461415, -0.3764429, 1, 0.8941177, 0, 1,
-0.9781282, 0.7370313, -1.099204, 1, 0.8980392, 0, 1,
-0.9768474, 1.223448, -0.1379075, 1, 0.9058824, 0, 1,
-0.9727818, 2.28358, -0.4273845, 1, 0.9137255, 0, 1,
-0.9583755, -0.5775828, -1.870484, 1, 0.9176471, 0, 1,
-0.9554982, 1.74314, 1.509474, 1, 0.9254902, 0, 1,
-0.9472455, 1.031579, 0.7395426, 1, 0.9294118, 0, 1,
-0.9444275, -0.5754356, -1.632847, 1, 0.9372549, 0, 1,
-0.9430634, 0.7549682, -2.097104, 1, 0.9411765, 0, 1,
-0.9428623, -0.01978526, -1.913017, 1, 0.9490196, 0, 1,
-0.9387158, -0.1529493, -2.231906, 1, 0.9529412, 0, 1,
-0.9346972, -0.0719412, -2.88651, 1, 0.9607843, 0, 1,
-0.9321998, 0.002869202, -2.339985, 1, 0.9647059, 0, 1,
-0.9263145, 0.5763763, -3.120134, 1, 0.972549, 0, 1,
-0.9237673, -1.051393, -2.243344, 1, 0.9764706, 0, 1,
-0.9233327, 0.2240046, -0.8036401, 1, 0.9843137, 0, 1,
-0.9126344, 0.656198, -1.485547, 1, 0.9882353, 0, 1,
-0.907962, -0.2081216, -0.2661219, 1, 0.9960784, 0, 1,
-0.9067423, 0.292639, -0.939377, 0.9960784, 1, 0, 1,
-0.9066873, -2.111049, -4.03636, 0.9921569, 1, 0, 1,
-0.902801, -0.428311, -2.683556, 0.9843137, 1, 0, 1,
-0.8987069, -1.578457, -3.015743, 0.9803922, 1, 0, 1,
-0.8946805, -1.120027, -0.8003796, 0.972549, 1, 0, 1,
-0.8929063, -1.211191, -3.168443, 0.9686275, 1, 0, 1,
-0.8918024, -0.03482363, -1.508784, 0.9607843, 1, 0, 1,
-0.8833746, -0.8006901, -3.53078, 0.9568627, 1, 0, 1,
-0.8823522, 1.098883, -1.258539, 0.9490196, 1, 0, 1,
-0.8819405, 0.3048072, -0.1604776, 0.945098, 1, 0, 1,
-0.8695459, -0.5353246, -1.697145, 0.9372549, 1, 0, 1,
-0.8694947, -0.4800882, -1.978194, 0.9333333, 1, 0, 1,
-0.8687916, -0.4275399, -1.6775, 0.9254902, 1, 0, 1,
-0.8682711, 0.4477791, -0.2513673, 0.9215686, 1, 0, 1,
-0.8616418, 1.295691, -2.679611, 0.9137255, 1, 0, 1,
-0.8547235, 0.6703563, -0.772063, 0.9098039, 1, 0, 1,
-0.8516865, 0.8015832, 0.4250666, 0.9019608, 1, 0, 1,
-0.8514193, 1.289692, -3.221037, 0.8941177, 1, 0, 1,
-0.8511726, 0.5925592, -0.8094593, 0.8901961, 1, 0, 1,
-0.8487221, -0.4228123, -2.652083, 0.8823529, 1, 0, 1,
-0.8476463, -0.105133, -2.690475, 0.8784314, 1, 0, 1,
-0.8444686, -1.019937, -2.83681, 0.8705882, 1, 0, 1,
-0.8346022, 3.022623, 0.5339648, 0.8666667, 1, 0, 1,
-0.8337281, -1.098022, -2.018853, 0.8588235, 1, 0, 1,
-0.8299913, 0.8189331, 0.1021208, 0.854902, 1, 0, 1,
-0.8199554, 1.712812, -1.837477, 0.8470588, 1, 0, 1,
-0.8191832, -0.5869267, -2.067998, 0.8431373, 1, 0, 1,
-0.8164146, 0.4545073, -0.6964346, 0.8352941, 1, 0, 1,
-0.8062788, -1.040362, -2.26109, 0.8313726, 1, 0, 1,
-0.8059073, -0.9381444, -2.536104, 0.8235294, 1, 0, 1,
-0.7988586, 0.5548779, -1.199082, 0.8196079, 1, 0, 1,
-0.7976422, -0.9346573, -2.147234, 0.8117647, 1, 0, 1,
-0.7955144, -1.27753, -1.023558, 0.8078431, 1, 0, 1,
-0.7836275, 0.03378754, -1.666269, 0.8, 1, 0, 1,
-0.7802538, 1.167897, -1.139911, 0.7921569, 1, 0, 1,
-0.7762879, 1.176479, -1.227988, 0.7882353, 1, 0, 1,
-0.7744474, -0.4957653, -4.429867, 0.7803922, 1, 0, 1,
-0.7732111, 0.5108289, 0.2129508, 0.7764706, 1, 0, 1,
-0.771471, 0.2713462, -1.548454, 0.7686275, 1, 0, 1,
-0.7651333, -0.2558998, -3.436596, 0.7647059, 1, 0, 1,
-0.7639564, -0.2989, -1.784777, 0.7568628, 1, 0, 1,
-0.7637298, -0.5755534, -0.2593195, 0.7529412, 1, 0, 1,
-0.7621671, 0.9737201, 0.478381, 0.7450981, 1, 0, 1,
-0.7578057, 1.853504, -1.100198, 0.7411765, 1, 0, 1,
-0.7561411, 0.7599139, -1.087773, 0.7333333, 1, 0, 1,
-0.7447198, -0.6623062, -0.8944073, 0.7294118, 1, 0, 1,
-0.7428915, 2.135864, 0.2369766, 0.7215686, 1, 0, 1,
-0.7415982, 0.5989255, -1.641602, 0.7176471, 1, 0, 1,
-0.7407346, -0.0763189, -1.359579, 0.7098039, 1, 0, 1,
-0.7400203, 1.684747, -2.245924, 0.7058824, 1, 0, 1,
-0.7329022, -0.07127059, -1.389526, 0.6980392, 1, 0, 1,
-0.7313059, 1.506997, -0.4922963, 0.6901961, 1, 0, 1,
-0.726104, 1.294832, -0.8726482, 0.6862745, 1, 0, 1,
-0.7187926, 0.6128967, -0.530666, 0.6784314, 1, 0, 1,
-0.7118066, 0.7045394, -0.4417454, 0.6745098, 1, 0, 1,
-0.7112218, 0.4888593, -2.325199, 0.6666667, 1, 0, 1,
-0.7068362, -0.7911902, -2.249284, 0.6627451, 1, 0, 1,
-0.7025933, -0.5060942, -3.078302, 0.654902, 1, 0, 1,
-0.7016382, 0.5968774, -1.726496, 0.6509804, 1, 0, 1,
-0.6972079, -0.3921915, -1.901057, 0.6431373, 1, 0, 1,
-0.6913712, -0.5161461, -1.291605, 0.6392157, 1, 0, 1,
-0.6892157, -0.8513287, -4.386552, 0.6313726, 1, 0, 1,
-0.682563, -0.9347745, -4.070756, 0.627451, 1, 0, 1,
-0.6817201, -0.3729957, -3.710572, 0.6196079, 1, 0, 1,
-0.6759483, -0.9286597, -3.190554, 0.6156863, 1, 0, 1,
-0.6708101, 0.4133094, -0.8983495, 0.6078432, 1, 0, 1,
-0.6617156, 0.8709921, -0.6510505, 0.6039216, 1, 0, 1,
-0.6605186, -1.39912, -1.407851, 0.5960785, 1, 0, 1,
-0.6560281, -0.6005021, -0.6938514, 0.5882353, 1, 0, 1,
-0.6556553, -0.9715317, -2.159964, 0.5843138, 1, 0, 1,
-0.6552589, 0.05954309, -1.24013, 0.5764706, 1, 0, 1,
-0.6544402, 0.5091563, -1.518896, 0.572549, 1, 0, 1,
-0.6540747, 0.8976026, -2.149787, 0.5647059, 1, 0, 1,
-0.6533477, 0.1790111, 0.8499432, 0.5607843, 1, 0, 1,
-0.6529601, -1.345292, -3.257559, 0.5529412, 1, 0, 1,
-0.6528234, -0.7077038, -1.57928, 0.5490196, 1, 0, 1,
-0.6510136, -0.2573355, -2.036265, 0.5411765, 1, 0, 1,
-0.6451461, -0.2803741, -0.4334178, 0.5372549, 1, 0, 1,
-0.6417916, 1.000651, 0.1743096, 0.5294118, 1, 0, 1,
-0.6413211, -1.335567, -2.299512, 0.5254902, 1, 0, 1,
-0.6412831, 0.796396, 0.2792612, 0.5176471, 1, 0, 1,
-0.6369676, -1.044224, -3.167437, 0.5137255, 1, 0, 1,
-0.6345899, 1.36079, 0.846183, 0.5058824, 1, 0, 1,
-0.6335325, -0.3182835, 0.1713813, 0.5019608, 1, 0, 1,
-0.6302485, -1.387798, -4.534162, 0.4941176, 1, 0, 1,
-0.6270718, -0.1759078, -1.321466, 0.4862745, 1, 0, 1,
-0.6247789, 0.04525658, -3.656727, 0.4823529, 1, 0, 1,
-0.6246558, -1.552225, -2.232966, 0.4745098, 1, 0, 1,
-0.6210014, -0.8142186, -4.038589, 0.4705882, 1, 0, 1,
-0.6209975, 1.436888, -1.187759, 0.4627451, 1, 0, 1,
-0.619343, -0.822579, -3.11604, 0.4588235, 1, 0, 1,
-0.6173179, -2.13588, -2.764897, 0.4509804, 1, 0, 1,
-0.6144152, 0.334065, -0.8545819, 0.4470588, 1, 0, 1,
-0.61018, -0.08313466, -2.161407, 0.4392157, 1, 0, 1,
-0.6099854, 0.311245, 0.2890182, 0.4352941, 1, 0, 1,
-0.6030898, -1.386154, -2.833899, 0.427451, 1, 0, 1,
-0.5945247, -0.04069949, -1.082155, 0.4235294, 1, 0, 1,
-0.5928162, -2.257216, -2.127213, 0.4156863, 1, 0, 1,
-0.5906739, 0.4568697, -1.025638, 0.4117647, 1, 0, 1,
-0.5854397, -1.687142, -2.541462, 0.4039216, 1, 0, 1,
-0.5788091, 0.5619281, -0.6658495, 0.3960784, 1, 0, 1,
-0.5762826, 0.8147501, -0.4638149, 0.3921569, 1, 0, 1,
-0.575922, -0.2872519, -1.805469, 0.3843137, 1, 0, 1,
-0.5725996, -0.5063192, -1.277114, 0.3803922, 1, 0, 1,
-0.5675127, 0.3252269, -1.980897, 0.372549, 1, 0, 1,
-0.5636851, -0.6345703, -2.140723, 0.3686275, 1, 0, 1,
-0.5622719, -0.2516005, -1.617925, 0.3607843, 1, 0, 1,
-0.5530498, 0.7244955, -0.1572382, 0.3568628, 1, 0, 1,
-0.5495759, -0.00718617, -2.362468, 0.3490196, 1, 0, 1,
-0.5432457, 0.1013574, -0.6240051, 0.345098, 1, 0, 1,
-0.5341505, 0.3079908, -1.013297, 0.3372549, 1, 0, 1,
-0.5264037, 0.2443766, -2.651768, 0.3333333, 1, 0, 1,
-0.5262895, 0.4318588, 0.3065507, 0.3254902, 1, 0, 1,
-0.5216952, -0.1376471, -0.1283107, 0.3215686, 1, 0, 1,
-0.5200045, -1.278219, -2.970062, 0.3137255, 1, 0, 1,
-0.5145996, 0.01608389, -2.193788, 0.3098039, 1, 0, 1,
-0.5093495, -0.771991, -3.519713, 0.3019608, 1, 0, 1,
-0.5068208, 0.1305412, -2.687673, 0.2941177, 1, 0, 1,
-0.5035789, 0.1858114, -1.127934, 0.2901961, 1, 0, 1,
-0.4969836, 0.3585043, -1.077354, 0.282353, 1, 0, 1,
-0.4952029, 0.1373924, 0.3709181, 0.2784314, 1, 0, 1,
-0.4920453, 0.3382244, -1.775253, 0.2705882, 1, 0, 1,
-0.491501, 1.061909, 1.919053, 0.2666667, 1, 0, 1,
-0.4879053, -0.2012638, -2.636727, 0.2588235, 1, 0, 1,
-0.4867941, 1.057377, 1.017737, 0.254902, 1, 0, 1,
-0.4843477, 1.732901, -0.159488, 0.2470588, 1, 0, 1,
-0.4835018, 0.7751694, -0.2239522, 0.2431373, 1, 0, 1,
-0.4815691, 0.3431855, -2.179139, 0.2352941, 1, 0, 1,
-0.4779235, -1.18882, -1.943194, 0.2313726, 1, 0, 1,
-0.4698311, -0.3595695, -0.9056338, 0.2235294, 1, 0, 1,
-0.4624246, -1.666912, -4.924993, 0.2196078, 1, 0, 1,
-0.4607365, -0.7846117, -1.054268, 0.2117647, 1, 0, 1,
-0.4604285, -0.1197468, -0.9335275, 0.2078431, 1, 0, 1,
-0.4595006, -0.03886724, -2.140632, 0.2, 1, 0, 1,
-0.456287, 0.1235614, -1.150086, 0.1921569, 1, 0, 1,
-0.4558994, 0.5300382, -1.235216, 0.1882353, 1, 0, 1,
-0.4551364, -1.034195, -1.519417, 0.1803922, 1, 0, 1,
-0.4546703, 1.156796, 0.8018571, 0.1764706, 1, 0, 1,
-0.4536462, 0.8757887, -1.556407, 0.1686275, 1, 0, 1,
-0.4536334, 0.01419364, -3.766666, 0.1647059, 1, 0, 1,
-0.4510426, 0.5783063, 0.9906136, 0.1568628, 1, 0, 1,
-0.4460957, 0.352082, -0.2219082, 0.1529412, 1, 0, 1,
-0.4427695, 1.024156, 0.5645492, 0.145098, 1, 0, 1,
-0.4403047, -1.229341, -1.575181, 0.1411765, 1, 0, 1,
-0.4390574, 1.085209, -0.05380362, 0.1333333, 1, 0, 1,
-0.4367793, -0.7730002, -2.986101, 0.1294118, 1, 0, 1,
-0.4348039, 2.510542, 1.044109, 0.1215686, 1, 0, 1,
-0.4257864, -1.254784, -2.95887, 0.1176471, 1, 0, 1,
-0.4207795, 0.1077327, -1.110251, 0.1098039, 1, 0, 1,
-0.4183254, 2.575374, -0.1830837, 0.1058824, 1, 0, 1,
-0.4171255, 0.4228659, -2.444668, 0.09803922, 1, 0, 1,
-0.4168121, 0.6710416, -1.11999, 0.09019608, 1, 0, 1,
-0.4147376, -1.063735, -3.935105, 0.08627451, 1, 0, 1,
-0.4134589, -1.060581, -1.526454, 0.07843138, 1, 0, 1,
-0.4129695, 1.220579, 0.341089, 0.07450981, 1, 0, 1,
-0.4051541, 0.1780479, -3.262255, 0.06666667, 1, 0, 1,
-0.4042475, -0.4320282, -2.060017, 0.0627451, 1, 0, 1,
-0.3952512, 0.3825159, -0.7641252, 0.05490196, 1, 0, 1,
-0.3914818, -0.706319, -2.496618, 0.05098039, 1, 0, 1,
-0.3905859, -0.6503129, -2.591641, 0.04313726, 1, 0, 1,
-0.3873246, 0.4451667, -0.8739952, 0.03921569, 1, 0, 1,
-0.3864228, -1.450804, -3.897511, 0.03137255, 1, 0, 1,
-0.3851731, -2.104309, -4.096617, 0.02745098, 1, 0, 1,
-0.3848678, -0.0184663, -1.386832, 0.01960784, 1, 0, 1,
-0.3843604, -0.8902018, -3.733419, 0.01568628, 1, 0, 1,
-0.3833907, -1.230505, -4.428663, 0.007843138, 1, 0, 1,
-0.3823926, 2.172289, 1.520371, 0.003921569, 1, 0, 1,
-0.3810661, 0.1623685, -2.870079, 0, 1, 0.003921569, 1,
-0.3735992, -1.072621, -3.564515, 0, 1, 0.01176471, 1,
-0.3662371, 2.05191, 0.9799243, 0, 1, 0.01568628, 1,
-0.3617501, -0.01937337, -2.1703, 0, 1, 0.02352941, 1,
-0.3606214, -1.918202, -2.871762, 0, 1, 0.02745098, 1,
-0.3585987, -0.006125059, -1.214603, 0, 1, 0.03529412, 1,
-0.3546818, -0.5832069, -1.540932, 0, 1, 0.03921569, 1,
-0.3535016, -1.167996, -2.672833, 0, 1, 0.04705882, 1,
-0.3532034, 0.7402522, -0.5808782, 0, 1, 0.05098039, 1,
-0.3414485, 0.0657469, -3.205601, 0, 1, 0.05882353, 1,
-0.3401761, -0.5912495, -2.560595, 0, 1, 0.0627451, 1,
-0.3362899, 0.9739525, -0.343894, 0, 1, 0.07058824, 1,
-0.3354278, 1.140713, -0.8782256, 0, 1, 0.07450981, 1,
-0.3309699, -0.4537849, -2.473782, 0, 1, 0.08235294, 1,
-0.3271216, -0.1547185, -1.795098, 0, 1, 0.08627451, 1,
-0.32629, 0.1219432, -1.549804, 0, 1, 0.09411765, 1,
-0.3236063, 1.275533, -1.575616, 0, 1, 0.1019608, 1,
-0.3224097, 0.6614422, 0.2280551, 0, 1, 0.1058824, 1,
-0.3136685, -0.03093464, -2.681896, 0, 1, 0.1137255, 1,
-0.3130382, -1.249387, -3.407597, 0, 1, 0.1176471, 1,
-0.3094752, -0.6674705, -4.345978, 0, 1, 0.1254902, 1,
-0.3075756, 0.5110551, 2.112062, 0, 1, 0.1294118, 1,
-0.3074197, 2.267523, 0.7519299, 0, 1, 0.1372549, 1,
-0.3057986, 0.1589325, -1.178257, 0, 1, 0.1411765, 1,
-0.3012039, -0.4673122, -1.844044, 0, 1, 0.1490196, 1,
-0.2988027, 0.41693, -0.4038764, 0, 1, 0.1529412, 1,
-0.2953486, 1.022297, -1.309297, 0, 1, 0.1607843, 1,
-0.2926612, -1.28901, -3.202652, 0, 1, 0.1647059, 1,
-0.2895239, -0.5393491, -1.337998, 0, 1, 0.172549, 1,
-0.2887362, -0.7653572, -2.693652, 0, 1, 0.1764706, 1,
-0.2872134, 2.396929, -0.2272115, 0, 1, 0.1843137, 1,
-0.2826334, 3.048157, 1.608578, 0, 1, 0.1882353, 1,
-0.2823534, 0.7058488, 0.7146547, 0, 1, 0.1960784, 1,
-0.2797163, -0.1754197, -1.896119, 0, 1, 0.2039216, 1,
-0.2766565, 1.207502, -0.1278029, 0, 1, 0.2078431, 1,
-0.2763931, -1.771377, -4.426737, 0, 1, 0.2156863, 1,
-0.2747431, 0.5218319, -0.196862, 0, 1, 0.2196078, 1,
-0.2724327, -0.1707856, -3.18453, 0, 1, 0.227451, 1,
-0.2689858, -1.336122, -1.522534, 0, 1, 0.2313726, 1,
-0.2686158, -0.08611153, -2.069027, 0, 1, 0.2392157, 1,
-0.2665697, 0.1328127, -1.424811, 0, 1, 0.2431373, 1,
-0.2663558, 0.17235, -0.7760724, 0, 1, 0.2509804, 1,
-0.2649463, -1.6743, -1.764258, 0, 1, 0.254902, 1,
-0.2641003, -1.00565, -3.562754, 0, 1, 0.2627451, 1,
-0.2583928, -1.303812, -3.301969, 0, 1, 0.2666667, 1,
-0.257839, 1.293606, -2.24607, 0, 1, 0.2745098, 1,
-0.2527173, -0.7382535, -3.856475, 0, 1, 0.2784314, 1,
-0.2517528, 1.612744, 0.05504994, 0, 1, 0.2862745, 1,
-0.2497858, 0.09901945, -2.198268, 0, 1, 0.2901961, 1,
-0.2453749, 1.037079, 0.4884551, 0, 1, 0.2980392, 1,
-0.2412981, -0.2577534, -3.182493, 0, 1, 0.3058824, 1,
-0.2405619, 0.0459789, -1.705982, 0, 1, 0.3098039, 1,
-0.2352029, -1.290482, -4.318177, 0, 1, 0.3176471, 1,
-0.2342457, -1.777886, -3.053441, 0, 1, 0.3215686, 1,
-0.2294718, -0.007704149, -1.669939, 0, 1, 0.3294118, 1,
-0.2280639, -0.3548167, -4.010702, 0, 1, 0.3333333, 1,
-0.227283, 1.04164, -0.2696964, 0, 1, 0.3411765, 1,
-0.2230048, -0.6910283, -2.787124, 0, 1, 0.345098, 1,
-0.2209229, -0.7230574, -2.076555, 0, 1, 0.3529412, 1,
-0.2172355, -2.020017, -2.84483, 0, 1, 0.3568628, 1,
-0.2126019, -0.2224171, -3.527609, 0, 1, 0.3647059, 1,
-0.2100003, 0.1263663, -1.548166, 0, 1, 0.3686275, 1,
-0.2069736, -2.235709, -3.910814, 0, 1, 0.3764706, 1,
-0.2054815, -0.03406181, 0.03210654, 0, 1, 0.3803922, 1,
-0.2026707, 0.3428523, -0.396426, 0, 1, 0.3882353, 1,
-0.200995, 0.3867692, -0.6240202, 0, 1, 0.3921569, 1,
-0.1994655, 0.5157908, -0.8515521, 0, 1, 0.4, 1,
-0.1993733, -0.1216999, -3.225945, 0, 1, 0.4078431, 1,
-0.1948545, 0.4775926, 0.9135751, 0, 1, 0.4117647, 1,
-0.1944038, -0.510835, -0.8510184, 0, 1, 0.4196078, 1,
-0.1909217, 0.5922116, -1.2219, 0, 1, 0.4235294, 1,
-0.1908183, 0.784922, -0.04185554, 0, 1, 0.4313726, 1,
-0.1870444, 0.9165074, 1.425253, 0, 1, 0.4352941, 1,
-0.182113, 1.382246, -1.911552, 0, 1, 0.4431373, 1,
-0.1813066, 2.115869, 0.5061769, 0, 1, 0.4470588, 1,
-0.1739551, -0.2058973, -2.79882, 0, 1, 0.454902, 1,
-0.1725635, 1.410877, -0.9606273, 0, 1, 0.4588235, 1,
-0.1707436, -0.1689918, -2.736525, 0, 1, 0.4666667, 1,
-0.1625336, 0.02715508, -2.98858, 0, 1, 0.4705882, 1,
-0.1619531, -0.4715081, -3.276, 0, 1, 0.4784314, 1,
-0.1604663, 0.194819, -1.119599, 0, 1, 0.4823529, 1,
-0.1599358, -1.356306, -2.96779, 0, 1, 0.4901961, 1,
-0.1596301, -0.2396169, -1.997782, 0, 1, 0.4941176, 1,
-0.1590256, -0.7466373, -1.807236, 0, 1, 0.5019608, 1,
-0.1570712, 1.20865, 0.136294, 0, 1, 0.509804, 1,
-0.155892, -0.6209356, -2.139773, 0, 1, 0.5137255, 1,
-0.1550161, -0.2807582, -2.262147, 0, 1, 0.5215687, 1,
-0.1516984, -0.7394699, -2.234019, 0, 1, 0.5254902, 1,
-0.1480164, -1.39574, -3.250494, 0, 1, 0.5333334, 1,
-0.1449446, -1.901138, -2.422233, 0, 1, 0.5372549, 1,
-0.144405, 1.067372, 0.05694558, 0, 1, 0.5450981, 1,
-0.1439347, 0.6813347, 0.2367599, 0, 1, 0.5490196, 1,
-0.1413626, 1.194423, -0.170115, 0, 1, 0.5568628, 1,
-0.1385905, -0.08324487, -2.714625, 0, 1, 0.5607843, 1,
-0.133718, -1.346212, -4.26973, 0, 1, 0.5686275, 1,
-0.1336507, -0.6089467, -2.869212, 0, 1, 0.572549, 1,
-0.1289268, -1.115953, -4.391034, 0, 1, 0.5803922, 1,
-0.1264766, 0.8519773, -0.02920265, 0, 1, 0.5843138, 1,
-0.1239797, -1.415173, -1.67815, 0, 1, 0.5921569, 1,
-0.1210326, -0.1785893, -2.895612, 0, 1, 0.5960785, 1,
-0.1147147, -0.9332349, -2.27838, 0, 1, 0.6039216, 1,
-0.1012517, -0.0137622, -1.5159, 0, 1, 0.6117647, 1,
-0.09818856, -2.294432, -4.693688, 0, 1, 0.6156863, 1,
-0.09797125, 1.345737, 0.2366332, 0, 1, 0.6235294, 1,
-0.09740766, -1.371516, -2.109704, 0, 1, 0.627451, 1,
-0.0960801, 0.6586134, 0.2325914, 0, 1, 0.6352941, 1,
-0.09409516, 1.2783, -1.223333, 0, 1, 0.6392157, 1,
-0.09164196, 0.5118033, -0.3384675, 0, 1, 0.6470588, 1,
-0.09119799, -0.1075941, -3.422062, 0, 1, 0.6509804, 1,
-0.09090659, 0.02996795, 0.4573424, 0, 1, 0.6588235, 1,
-0.08592023, 0.339581, 0.2421038, 0, 1, 0.6627451, 1,
-0.08505724, -1.299123, -5.114617, 0, 1, 0.6705883, 1,
-0.07629877, -0.8465495, -4.015969, 0, 1, 0.6745098, 1,
-0.07390606, -0.4675839, -3.635899, 0, 1, 0.682353, 1,
-0.06377334, -0.6906609, -3.3247, 0, 1, 0.6862745, 1,
-0.06013331, -1.264653, -3.255171, 0, 1, 0.6941177, 1,
-0.05795272, -0.05146955, -2.391516, 0, 1, 0.7019608, 1,
-0.05759765, 1.169905, 0.03213766, 0, 1, 0.7058824, 1,
-0.05278368, -0.7695931, -1.629224, 0, 1, 0.7137255, 1,
-0.05163833, 0.1768479, -0.9333366, 0, 1, 0.7176471, 1,
-0.05053465, 0.8571092, 0.2494707, 0, 1, 0.7254902, 1,
-0.0449035, -0.1315964, -2.507916, 0, 1, 0.7294118, 1,
-0.04368714, -2.225098, -3.815284, 0, 1, 0.7372549, 1,
-0.04219824, 0.5707204, -0.2884994, 0, 1, 0.7411765, 1,
-0.04206497, -0.7476417, -1.55099, 0, 1, 0.7490196, 1,
-0.03637473, -1.921858, -3.78143, 0, 1, 0.7529412, 1,
-0.03221941, -0.07944711, -2.771547, 0, 1, 0.7607843, 1,
-0.0314073, -1.33678, -4.187068, 0, 1, 0.7647059, 1,
-0.03135632, -0.7988269, -2.473333, 0, 1, 0.772549, 1,
-0.01686804, 0.3746709, -0.4426683, 0, 1, 0.7764706, 1,
-0.01574327, 0.5205697, -0.4208139, 0, 1, 0.7843137, 1,
-0.01342239, -0.8531775, -3.574593, 0, 1, 0.7882353, 1,
-0.01287515, -0.07802719, -3.969622, 0, 1, 0.7960784, 1,
-0.01277109, 0.7075608, -0.2196909, 0, 1, 0.8039216, 1,
-0.01205262, 0.3493297, 0.3807872, 0, 1, 0.8078431, 1,
-0.01090364, 0.3192622, 0.2848553, 0, 1, 0.8156863, 1,
-0.01075201, 0.3464385, 1.326553, 0, 1, 0.8196079, 1,
-0.009877635, -0.1415885, -2.884079, 0, 1, 0.827451, 1,
-0.006786955, 0.5511166, -0.4674757, 0, 1, 0.8313726, 1,
-0.005971021, 1.741443, -1.297682, 0, 1, 0.8392157, 1,
-0.005111479, 0.900502, -2.114837, 0, 1, 0.8431373, 1,
0.00171041, 1.974075, -0.341008, 0, 1, 0.8509804, 1,
0.001756259, 1.659987, 1.361494, 0, 1, 0.854902, 1,
0.003496343, -1.970647, 3.848269, 0, 1, 0.8627451, 1,
0.008925726, -0.7157814, 3.542463, 0, 1, 0.8666667, 1,
0.01284457, -1.396157, 2.683988, 0, 1, 0.8745098, 1,
0.01442456, 0.1821472, 1.089812, 0, 1, 0.8784314, 1,
0.01512289, 0.168497, 0.3888781, 0, 1, 0.8862745, 1,
0.01728926, 0.827113, 0.5844584, 0, 1, 0.8901961, 1,
0.01817571, -0.3819114, 4.476068, 0, 1, 0.8980392, 1,
0.01994221, 0.5929834, 0.2302986, 0, 1, 0.9058824, 1,
0.02036908, -0.5813977, 4.211962, 0, 1, 0.9098039, 1,
0.02412511, -1.073529, 1.93327, 0, 1, 0.9176471, 1,
0.02779943, 0.4310471, 0.752351, 0, 1, 0.9215686, 1,
0.02785183, 0.06885843, 0.4087185, 0, 1, 0.9294118, 1,
0.02808307, -0.9018801, 4.101944, 0, 1, 0.9333333, 1,
0.03211393, 1.531839, -0.03469597, 0, 1, 0.9411765, 1,
0.03560836, 2.495851, -0.5607302, 0, 1, 0.945098, 1,
0.03657891, -1.758838, 3.123758, 0, 1, 0.9529412, 1,
0.03694618, 0.472611, 1.73618, 0, 1, 0.9568627, 1,
0.04120381, -0.319977, 0.935223, 0, 1, 0.9647059, 1,
0.04123137, -0.1095476, 1.933435, 0, 1, 0.9686275, 1,
0.0419327, -0.6229371, 1.720841, 0, 1, 0.9764706, 1,
0.04312856, 0.492852, 1.861897, 0, 1, 0.9803922, 1,
0.04389597, 0.7745996, 0.2283228, 0, 1, 0.9882353, 1,
0.04552913, 0.9532778, 0.9665861, 0, 1, 0.9921569, 1,
0.04654564, -1.794015, 1.308684, 0, 1, 1, 1,
0.04825579, 0.3070317, 0.654592, 0, 0.9921569, 1, 1,
0.0520196, 1.209404, 1.246753, 0, 0.9882353, 1, 1,
0.05212563, 0.1606936, 0.9896533, 0, 0.9803922, 1, 1,
0.06272721, 0.4178956, -0.1145374, 0, 0.9764706, 1, 1,
0.0632173, 0.6614398, -1.229761, 0, 0.9686275, 1, 1,
0.06498996, -1.876242, 3.650923, 0, 0.9647059, 1, 1,
0.0671052, -0.06528199, 1.406924, 0, 0.9568627, 1, 1,
0.06909584, -0.7013676, 1.5943, 0, 0.9529412, 1, 1,
0.06914294, -0.2843473, 3.68196, 0, 0.945098, 1, 1,
0.07039663, 1.086466, 1.423595, 0, 0.9411765, 1, 1,
0.07159215, 0.6381472, 2.071462, 0, 0.9333333, 1, 1,
0.07929206, 0.9640082, 0.8687891, 0, 0.9294118, 1, 1,
0.08032445, -0.2690951, 1.732497, 0, 0.9215686, 1, 1,
0.08130924, 0.6688163, -1.185145, 0, 0.9176471, 1, 1,
0.08154504, 0.8487614, -0.1098321, 0, 0.9098039, 1, 1,
0.08754694, -0.5517312, 2.516319, 0, 0.9058824, 1, 1,
0.08807626, 1.229291, -0.6345722, 0, 0.8980392, 1, 1,
0.09318397, 0.833932, 0.8279307, 0, 0.8901961, 1, 1,
0.09377717, -1.529708, 1.422248, 0, 0.8862745, 1, 1,
0.0952806, 0.7701211, 1.210367, 0, 0.8784314, 1, 1,
0.1030013, 0.9560007, -1.330222, 0, 0.8745098, 1, 1,
0.1159588, -0.4200148, 3.998764, 0, 0.8666667, 1, 1,
0.1194295, 1.067772, -0.0855509, 0, 0.8627451, 1, 1,
0.1202659, 0.3178423, 1.149226, 0, 0.854902, 1, 1,
0.1209289, -0.2258728, 1.445455, 0, 0.8509804, 1, 1,
0.1237331, -0.6948797, 2.301841, 0, 0.8431373, 1, 1,
0.1265925, -1.172572, 2.633037, 0, 0.8392157, 1, 1,
0.1310964, 0.2066381, 1.484409, 0, 0.8313726, 1, 1,
0.1359355, 0.4765586, -1.073761, 0, 0.827451, 1, 1,
0.1378412, -1.683609, 3.938356, 0, 0.8196079, 1, 1,
0.138617, 1.282113, 0.2738331, 0, 0.8156863, 1, 1,
0.1408572, 0.3830717, 1.080699, 0, 0.8078431, 1, 1,
0.1409414, -0.8928336, 4.829483, 0, 0.8039216, 1, 1,
0.1429224, -0.2042365, 0.6923078, 0, 0.7960784, 1, 1,
0.1483681, -2.356421, 2.742424, 0, 0.7882353, 1, 1,
0.1548932, -0.5569059, 1.540521, 0, 0.7843137, 1, 1,
0.1572169, -0.8571628, 4.566977, 0, 0.7764706, 1, 1,
0.157457, 0.5736448, -0.4083776, 0, 0.772549, 1, 1,
0.1576663, 0.222751, 0.3682272, 0, 0.7647059, 1, 1,
0.1579807, 0.2981319, 0.8385746, 0, 0.7607843, 1, 1,
0.1621162, -0.3852535, 2.039377, 0, 0.7529412, 1, 1,
0.1644032, -0.4916249, 1.02191, 0, 0.7490196, 1, 1,
0.1687796, 0.6350513, 0.3732664, 0, 0.7411765, 1, 1,
0.173117, 0.3947526, -0.2213995, 0, 0.7372549, 1, 1,
0.1738228, 0.6092403, 0.7926244, 0, 0.7294118, 1, 1,
0.1806891, 0.6025185, 2.524768, 0, 0.7254902, 1, 1,
0.1831205, -0.4172132, 1.992559, 0, 0.7176471, 1, 1,
0.1831486, -0.4671441, 5.451046, 0, 0.7137255, 1, 1,
0.1833568, -1.566146, 5.311444, 0, 0.7058824, 1, 1,
0.1835542, 0.3284498, -0.1876104, 0, 0.6980392, 1, 1,
0.1847117, 0.8117895, 1.307807, 0, 0.6941177, 1, 1,
0.1854319, -1.591149, 2.598906, 0, 0.6862745, 1, 1,
0.1872101, -0.9781675, 4.858121, 0, 0.682353, 1, 1,
0.1878717, 1.325403, -0.5302058, 0, 0.6745098, 1, 1,
0.1946204, 0.4409794, 1.218452, 0, 0.6705883, 1, 1,
0.2070166, 1.810675, 0.3209271, 0, 0.6627451, 1, 1,
0.2074452, 1.299937, -1.136721, 0, 0.6588235, 1, 1,
0.2140046, -0.7245408, 4.15528, 0, 0.6509804, 1, 1,
0.214428, -0.6175883, 1.651525, 0, 0.6470588, 1, 1,
0.2173014, 0.4364558, 0.7441841, 0, 0.6392157, 1, 1,
0.2326252, 0.9474456, 0.4046392, 0, 0.6352941, 1, 1,
0.2357466, -0.9242241, 2.152453, 0, 0.627451, 1, 1,
0.2365706, 0.6879225, 0.3825259, 0, 0.6235294, 1, 1,
0.2383601, -0.4038354, 3.171599, 0, 0.6156863, 1, 1,
0.2386461, 0.08960796, 0.2144794, 0, 0.6117647, 1, 1,
0.2395279, 1.314824, -0.177552, 0, 0.6039216, 1, 1,
0.2437252, -0.7862099, 3.274524, 0, 0.5960785, 1, 1,
0.2462964, -1.312845, 1.884173, 0, 0.5921569, 1, 1,
0.247106, 1.704351, -0.8095046, 0, 0.5843138, 1, 1,
0.2518278, 1.644256, -1.12872, 0, 0.5803922, 1, 1,
0.2524118, 1.049035, 0.4836299, 0, 0.572549, 1, 1,
0.2528119, -0.8606862, 1.005033, 0, 0.5686275, 1, 1,
0.2550279, -0.8617074, 1.627272, 0, 0.5607843, 1, 1,
0.2574503, -1.099103, 2.828666, 0, 0.5568628, 1, 1,
0.2589374, -0.7298019, 2.670551, 0, 0.5490196, 1, 1,
0.2622254, -2.243014, 2.651063, 0, 0.5450981, 1, 1,
0.2718797, 0.9669241, -1.161354, 0, 0.5372549, 1, 1,
0.2732729, -1.3362, 2.121567, 0, 0.5333334, 1, 1,
0.2752918, 1.258873, -0.1164218, 0, 0.5254902, 1, 1,
0.2868528, 1.230139, 3.007163, 0, 0.5215687, 1, 1,
0.2886268, 1.952407, 0.8174779, 0, 0.5137255, 1, 1,
0.292677, 0.592973, 0.4034733, 0, 0.509804, 1, 1,
0.298051, 0.5060464, 2.134139, 0, 0.5019608, 1, 1,
0.3009678, 1.539243, 1.431235, 0, 0.4941176, 1, 1,
0.3010937, -0.7949086, 2.270892, 0, 0.4901961, 1, 1,
0.3066302, 0.3738937, 2.585179, 0, 0.4823529, 1, 1,
0.3074093, 0.1858235, -0.4060347, 0, 0.4784314, 1, 1,
0.3081057, -0.1571629, 1.357671, 0, 0.4705882, 1, 1,
0.3095297, -1.927693, 4.124743, 0, 0.4666667, 1, 1,
0.3124217, 1.775931, 1.089525, 0, 0.4588235, 1, 1,
0.3166748, -0.2397682, 4.502246, 0, 0.454902, 1, 1,
0.3189256, -1.534755, 1.499753, 0, 0.4470588, 1, 1,
0.3250096, 0.965477, 0.4961502, 0, 0.4431373, 1, 1,
0.3261791, 1.512268, 1.459123, 0, 0.4352941, 1, 1,
0.3267034, -0.2019893, -0.2868282, 0, 0.4313726, 1, 1,
0.332482, -0.7812868, 3.146145, 0, 0.4235294, 1, 1,
0.3352537, -0.6014065, 3.080581, 0, 0.4196078, 1, 1,
0.3353838, -2.563642, 2.975254, 0, 0.4117647, 1, 1,
0.3358303, 1.252439, 2.253941, 0, 0.4078431, 1, 1,
0.3361754, -0.5381008, 2.276428, 0, 0.4, 1, 1,
0.3389735, -0.01121886, 2.458848, 0, 0.3921569, 1, 1,
0.3437451, 0.2520976, 0.01552381, 0, 0.3882353, 1, 1,
0.3451274, -0.393059, 2.22754, 0, 0.3803922, 1, 1,
0.3461746, 0.7042541, 0.271938, 0, 0.3764706, 1, 1,
0.3540592, 0.05352766, 2.258772, 0, 0.3686275, 1, 1,
0.354264, -0.04109942, 1.21238, 0, 0.3647059, 1, 1,
0.3552204, 0.705179, 0.865332, 0, 0.3568628, 1, 1,
0.3567465, -0.8620392, 1.894191, 0, 0.3529412, 1, 1,
0.3596636, 1.022743, -0.2460799, 0, 0.345098, 1, 1,
0.3652092, -0.03964877, 1.034496, 0, 0.3411765, 1, 1,
0.3676506, -0.04589504, 1.838254, 0, 0.3333333, 1, 1,
0.3690575, 0.2591787, 1.421681, 0, 0.3294118, 1, 1,
0.3769523, 2.094642, 1.281289, 0, 0.3215686, 1, 1,
0.3770488, 0.9493743, -2.336094, 0, 0.3176471, 1, 1,
0.3801289, -0.5182583, -0.3911461, 0, 0.3098039, 1, 1,
0.3808486, -2.169817, 1.100219, 0, 0.3058824, 1, 1,
0.3822477, 1.013592, -0.6245558, 0, 0.2980392, 1, 1,
0.3827343, -0.2109253, 3.791218, 0, 0.2901961, 1, 1,
0.3850651, -0.9674997, 2.79159, 0, 0.2862745, 1, 1,
0.3855353, 1.780052, -0.38467, 0, 0.2784314, 1, 1,
0.3863064, 1.128791, 0.8977184, 0, 0.2745098, 1, 1,
0.386365, -1.261654, 1.925756, 0, 0.2666667, 1, 1,
0.3871035, -0.7842629, 2.703105, 0, 0.2627451, 1, 1,
0.3882347, -1.529567, 3.484138, 0, 0.254902, 1, 1,
0.3907067, 0.3114556, 0.1237973, 0, 0.2509804, 1, 1,
0.3921311, -0.5647635, 3.603991, 0, 0.2431373, 1, 1,
0.3926086, 0.7052532, 0.2325638, 0, 0.2392157, 1, 1,
0.3958576, 1.133751, 0.09109625, 0, 0.2313726, 1, 1,
0.3975344, 0.4672589, -1.17776, 0, 0.227451, 1, 1,
0.4023011, 0.151244, 2.116663, 0, 0.2196078, 1, 1,
0.4028557, -1.504475, 1.769729, 0, 0.2156863, 1, 1,
0.4055689, -0.04132732, 1.223592, 0, 0.2078431, 1, 1,
0.4055757, 0.5713718, -0.210791, 0, 0.2039216, 1, 1,
0.4060465, 1.140891, 0.1866709, 0, 0.1960784, 1, 1,
0.4062682, 0.2729954, 1.918217, 0, 0.1882353, 1, 1,
0.4084815, 0.1083784, -0.7637513, 0, 0.1843137, 1, 1,
0.4092482, -0.8676848, 4.013542, 0, 0.1764706, 1, 1,
0.4097857, 0.1135537, 0.3636287, 0, 0.172549, 1, 1,
0.4219669, 0.610706, 1.282752, 0, 0.1647059, 1, 1,
0.4229898, -0.1386383, 0.7196087, 0, 0.1607843, 1, 1,
0.4241344, -1.864848, 2.072522, 0, 0.1529412, 1, 1,
0.425997, 0.05184683, 2.065304, 0, 0.1490196, 1, 1,
0.426553, 1.175564, -2.180394, 0, 0.1411765, 1, 1,
0.4295346, 0.2331044, 1.997867, 0, 0.1372549, 1, 1,
0.4299959, -1.33169, 3.45565, 0, 0.1294118, 1, 1,
0.4398722, -1.274009, 1.847239, 0, 0.1254902, 1, 1,
0.4470338, 0.6612022, 0.03771588, 0, 0.1176471, 1, 1,
0.448561, -2.864398, 2.006718, 0, 0.1137255, 1, 1,
0.449636, -2.55592, 2.964908, 0, 0.1058824, 1, 1,
0.4514316, -0.1920064, 1.229643, 0, 0.09803922, 1, 1,
0.456422, -0.4507062, 2.323007, 0, 0.09411765, 1, 1,
0.4580189, 2.044096, 0.05470219, 0, 0.08627451, 1, 1,
0.4592299, 0.128031, 2.213757, 0, 0.08235294, 1, 1,
0.460372, 1.841517, 1.27249, 0, 0.07450981, 1, 1,
0.460473, 0.5807622, 0.7933418, 0, 0.07058824, 1, 1,
0.4627877, -0.3737027, 1.853139, 0, 0.0627451, 1, 1,
0.464203, 2.326931, -0.4377326, 0, 0.05882353, 1, 1,
0.4649534, -0.6886763, 1.965035, 0, 0.05098039, 1, 1,
0.4675165, 0.2820343, 1.237467, 0, 0.04705882, 1, 1,
0.468698, -0.8194192, 1.620967, 0, 0.03921569, 1, 1,
0.4741543, -0.3322914, 1.413564, 0, 0.03529412, 1, 1,
0.4769695, 0.600515, -1.212156, 0, 0.02745098, 1, 1,
0.4793457, -1.479693, 3.417094, 0, 0.02352941, 1, 1,
0.4809768, 0.6475806, 0.7532827, 0, 0.01568628, 1, 1,
0.4813103, 0.1669598, 1.924354, 0, 0.01176471, 1, 1,
0.48371, 0.1650061, 2.766931, 0, 0.003921569, 1, 1,
0.4864002, 0.3505305, 2.54916, 0.003921569, 0, 1, 1,
0.4875547, 0.4069163, -1.478436, 0.007843138, 0, 1, 1,
0.4915319, -0.678185, 3.398668, 0.01568628, 0, 1, 1,
0.5013663, -0.8675428, 4.329102, 0.01960784, 0, 1, 1,
0.5045139, 0.2050758, -0.1052117, 0.02745098, 0, 1, 1,
0.5054102, -0.2408707, 1.490294, 0.03137255, 0, 1, 1,
0.5068888, 2.17812, 0.548466, 0.03921569, 0, 1, 1,
0.508619, 0.4341893, 1.206099, 0.04313726, 0, 1, 1,
0.5102407, 0.1941399, 4.003006, 0.05098039, 0, 1, 1,
0.5136693, 0.2655349, -0.1082598, 0.05490196, 0, 1, 1,
0.5169843, -0.1085618, 1.700602, 0.0627451, 0, 1, 1,
0.5195132, 0.2289945, 0.1050522, 0.06666667, 0, 1, 1,
0.5289404, 0.5250775, 0.05964707, 0.07450981, 0, 1, 1,
0.5317375, 1.167024, 0.9945918, 0.07843138, 0, 1, 1,
0.5325043, 0.5278107, 0.2141685, 0.08627451, 0, 1, 1,
0.532629, -0.7558835, 1.965727, 0.09019608, 0, 1, 1,
0.5331175, 0.4972761, 0.6434516, 0.09803922, 0, 1, 1,
0.5388341, 1.155866, 1.212351, 0.1058824, 0, 1, 1,
0.5392498, 1.1941, 2.02692, 0.1098039, 0, 1, 1,
0.5427989, -0.08984072, 1.991373, 0.1176471, 0, 1, 1,
0.5462499, 0.03782424, 0.1512737, 0.1215686, 0, 1, 1,
0.5471182, -1.125022, 1.001816, 0.1294118, 0, 1, 1,
0.5500854, -0.5473021, 3.304615, 0.1333333, 0, 1, 1,
0.5523825, -0.06279736, 0.8683321, 0.1411765, 0, 1, 1,
0.5549575, 0.08599355, 1.896288, 0.145098, 0, 1, 1,
0.5641099, 0.173471, 0.1723531, 0.1529412, 0, 1, 1,
0.5650579, 0.7297477, -0.2011763, 0.1568628, 0, 1, 1,
0.5653934, -0.1113791, 1.310667, 0.1647059, 0, 1, 1,
0.5659075, 1.420655, 1.356075, 0.1686275, 0, 1, 1,
0.5753466, 0.7599977, 0.3266191, 0.1764706, 0, 1, 1,
0.5761654, 0.03170975, 3.496428, 0.1803922, 0, 1, 1,
0.5802744, 0.640399, 0.1668134, 0.1882353, 0, 1, 1,
0.5884209, 0.273384, -0.7089419, 0.1921569, 0, 1, 1,
0.589951, -0.9300369, 1.018706, 0.2, 0, 1, 1,
0.5899543, -1.065944, 2.86116, 0.2078431, 0, 1, 1,
0.5953555, -2.152132, 3.242316, 0.2117647, 0, 1, 1,
0.5998733, 0.2228774, 0.8731554, 0.2196078, 0, 1, 1,
0.6014045, -2.282898, 2.35126, 0.2235294, 0, 1, 1,
0.6017343, 0.4563704, 0.6125133, 0.2313726, 0, 1, 1,
0.6017957, 1.272694, 2.544196, 0.2352941, 0, 1, 1,
0.6024205, -0.4548596, 2.47758, 0.2431373, 0, 1, 1,
0.6024273, 0.8466871, 0.3657111, 0.2470588, 0, 1, 1,
0.604166, -2.110181, 2.01425, 0.254902, 0, 1, 1,
0.6066741, 0.3197051, 1.735483, 0.2588235, 0, 1, 1,
0.6107509, -1.050761, 3.020979, 0.2666667, 0, 1, 1,
0.6114388, -0.3268163, 1.647539, 0.2705882, 0, 1, 1,
0.6179531, -1.66696, 2.787648, 0.2784314, 0, 1, 1,
0.6187235, 1.218429, -0.6623704, 0.282353, 0, 1, 1,
0.6188715, 1.059456, 1.638725, 0.2901961, 0, 1, 1,
0.6231949, -1.024734, 1.798627, 0.2941177, 0, 1, 1,
0.6240931, 0.2756289, 0.2480953, 0.3019608, 0, 1, 1,
0.6287119, -0.1722726, 2.620604, 0.3098039, 0, 1, 1,
0.632149, 0.6995974, 1.148311, 0.3137255, 0, 1, 1,
0.6377824, 1.787545, 1.063085, 0.3215686, 0, 1, 1,
0.6407944, 0.5414768, 0.93076, 0.3254902, 0, 1, 1,
0.6425871, 0.2522452, 1.179971, 0.3333333, 0, 1, 1,
0.6438524, 2.529193, 0.7882817, 0.3372549, 0, 1, 1,
0.6473961, 0.2063909, 1.198713, 0.345098, 0, 1, 1,
0.6484408, -0.6602355, 2.318147, 0.3490196, 0, 1, 1,
0.654823, -0.2662787, 1.411321, 0.3568628, 0, 1, 1,
0.6619335, -0.5679578, 2.849057, 0.3607843, 0, 1, 1,
0.6636554, 0.1739805, 2.089462, 0.3686275, 0, 1, 1,
0.6646753, -0.3170383, 4.642334, 0.372549, 0, 1, 1,
0.6697724, 0.2423837, 1.652303, 0.3803922, 0, 1, 1,
0.669997, 2.049076, 0.03304939, 0.3843137, 0, 1, 1,
0.6727374, -0.784162, 3.215769, 0.3921569, 0, 1, 1,
0.6772161, -2.626543, 2.655926, 0.3960784, 0, 1, 1,
0.6814128, 0.3553805, 2.331734, 0.4039216, 0, 1, 1,
0.6818018, -0.2191319, 0.9332148, 0.4117647, 0, 1, 1,
0.6827995, 0.2892475, -1.168688, 0.4156863, 0, 1, 1,
0.6829427, -1.07776, 1.04926, 0.4235294, 0, 1, 1,
0.6829628, -0.2655587, 1.079745, 0.427451, 0, 1, 1,
0.6845843, 0.321352, 0.9307387, 0.4352941, 0, 1, 1,
0.6862152, -0.2757369, 2.56573, 0.4392157, 0, 1, 1,
0.6865413, 0.2841555, 1.122132, 0.4470588, 0, 1, 1,
0.6865426, -1.876535, 1.944488, 0.4509804, 0, 1, 1,
0.688645, 0.5222204, 1.243732, 0.4588235, 0, 1, 1,
0.6896067, 1.248023, 1.581645, 0.4627451, 0, 1, 1,
0.693173, -0.5161927, 1.604814, 0.4705882, 0, 1, 1,
0.7048135, -0.6322178, 2.798676, 0.4745098, 0, 1, 1,
0.7060466, -1.121177, 2.388794, 0.4823529, 0, 1, 1,
0.7069519, -0.5661343, 1.586923, 0.4862745, 0, 1, 1,
0.7095452, 1.521522, 0.956372, 0.4941176, 0, 1, 1,
0.7104779, 2.06499, 0.945599, 0.5019608, 0, 1, 1,
0.7149681, -0.2480882, 3.360744, 0.5058824, 0, 1, 1,
0.7159122, 0.4949913, 0.5385776, 0.5137255, 0, 1, 1,
0.7293225, -0.3702594, 1.510456, 0.5176471, 0, 1, 1,
0.7296042, 0.4260218, -0.007968265, 0.5254902, 0, 1, 1,
0.7312356, 0.1319787, 1.74861, 0.5294118, 0, 1, 1,
0.7369576, -0.633094, 1.403234, 0.5372549, 0, 1, 1,
0.7404522, 2.062114, 0.7164267, 0.5411765, 0, 1, 1,
0.7435662, -0.6403972, 1.506791, 0.5490196, 0, 1, 1,
0.7446481, -0.990974, 3.402521, 0.5529412, 0, 1, 1,
0.7465867, 0.204555, 1.562973, 0.5607843, 0, 1, 1,
0.7485251, -0.5737133, 1.303391, 0.5647059, 0, 1, 1,
0.7509073, -1.593854, 3.411184, 0.572549, 0, 1, 1,
0.7516724, 1.493403, -0.7549054, 0.5764706, 0, 1, 1,
0.7548968, -0.127098, 1.534977, 0.5843138, 0, 1, 1,
0.7566732, 1.446637, 0.2823777, 0.5882353, 0, 1, 1,
0.7608368, 0.1599347, 1.82267, 0.5960785, 0, 1, 1,
0.7611181, 1.277809, 0.75638, 0.6039216, 0, 1, 1,
0.7640547, -0.4823231, 4.135105, 0.6078432, 0, 1, 1,
0.7653782, 1.147518, 1.521358, 0.6156863, 0, 1, 1,
0.7688755, 1.080048, -0.06407811, 0.6196079, 0, 1, 1,
0.7707692, 1.161499, 0.6761323, 0.627451, 0, 1, 1,
0.7855802, -1.515866, 1.860266, 0.6313726, 0, 1, 1,
0.790274, -1.309007, 3.820014, 0.6392157, 0, 1, 1,
0.7905238, -0.2950802, 2.088109, 0.6431373, 0, 1, 1,
0.7938983, 0.7796004, -0.4143843, 0.6509804, 0, 1, 1,
0.7974262, 0.8344371, 2.472119, 0.654902, 0, 1, 1,
0.7988791, 0.0383672, 1.325434, 0.6627451, 0, 1, 1,
0.7995501, 0.004725485, 1.29551, 0.6666667, 0, 1, 1,
0.8009925, -2.627938, 2.396914, 0.6745098, 0, 1, 1,
0.8055819, 1.91179, 1.152487, 0.6784314, 0, 1, 1,
0.8096697, -1.089163, 4.003943, 0.6862745, 0, 1, 1,
0.8098083, -1.357767, 2.136145, 0.6901961, 0, 1, 1,
0.8098515, -0.5761312, 2.699548, 0.6980392, 0, 1, 1,
0.8103295, 0.558862, 1.759878, 0.7058824, 0, 1, 1,
0.8157747, 0.2106148, 2.825026, 0.7098039, 0, 1, 1,
0.8172538, -1.015478, 1.772046, 0.7176471, 0, 1, 1,
0.8280751, 0.8163043, 0.8520384, 0.7215686, 0, 1, 1,
0.8327816, -0.9477499, 3.486975, 0.7294118, 0, 1, 1,
0.8354519, 0.4559554, 1.239678, 0.7333333, 0, 1, 1,
0.8381529, -0.7435262, 2.044546, 0.7411765, 0, 1, 1,
0.8398846, -0.7800174, 2.134941, 0.7450981, 0, 1, 1,
0.8420294, 0.05629575, 0.4429396, 0.7529412, 0, 1, 1,
0.8435355, -0.825559, -0.09121417, 0.7568628, 0, 1, 1,
0.8458229, 0.02662464, 0.4449554, 0.7647059, 0, 1, 1,
0.8490709, 0.3185318, -0.1223076, 0.7686275, 0, 1, 1,
0.8492689, -0.3870022, 2.827009, 0.7764706, 0, 1, 1,
0.8530769, -0.8254938, 3.00226, 0.7803922, 0, 1, 1,
0.8536798, -0.3289855, 3.180575, 0.7882353, 0, 1, 1,
0.8578508, -0.06329466, 0.880496, 0.7921569, 0, 1, 1,
0.8647749, -0.5738272, 1.392838, 0.8, 0, 1, 1,
0.8679479, 0.6660956, 1.212807, 0.8078431, 0, 1, 1,
0.8697624, 0.505814, 0.8027753, 0.8117647, 0, 1, 1,
0.8703933, -1.99032, 2.031842, 0.8196079, 0, 1, 1,
0.870948, 0.6173431, 0.4097944, 0.8235294, 0, 1, 1,
0.8720926, -0.003942745, 4.229135, 0.8313726, 0, 1, 1,
0.8725816, 0.2386675, 1.18667, 0.8352941, 0, 1, 1,
0.8865066, -1.766025, 2.110684, 0.8431373, 0, 1, 1,
0.8885368, -0.9197379, 3.46364, 0.8470588, 0, 1, 1,
0.8885408, -0.9488086, 3.24411, 0.854902, 0, 1, 1,
0.8943894, 1.545086, 0.7992135, 0.8588235, 0, 1, 1,
0.9000145, 0.1034658, -0.7642607, 0.8666667, 0, 1, 1,
0.9026309, -0.2824568, 1.16643, 0.8705882, 0, 1, 1,
0.9094834, 0.4946116, 1.61005, 0.8784314, 0, 1, 1,
0.9161074, 1.082327, 0.379653, 0.8823529, 0, 1, 1,
0.9168909, 1.680104, -0.08024832, 0.8901961, 0, 1, 1,
0.9230711, -1.243755, 1.917405, 0.8941177, 0, 1, 1,
0.9258645, 0.6354678, 2.948261, 0.9019608, 0, 1, 1,
0.9267197, 0.5265532, 1.012848, 0.9098039, 0, 1, 1,
0.9276848, 0.03493552, 2.073376, 0.9137255, 0, 1, 1,
0.9345347, 0.3541353, 1.309112, 0.9215686, 0, 1, 1,
0.9361973, -1.497541, 2.346574, 0.9254902, 0, 1, 1,
0.9365038, -0.271412, 1.472165, 0.9333333, 0, 1, 1,
0.9388711, -1.624273, 2.836281, 0.9372549, 0, 1, 1,
0.9405478, 0.3436953, 0.6287773, 0.945098, 0, 1, 1,
0.9407301, 0.3693724, 3.274521, 0.9490196, 0, 1, 1,
0.9439819, -0.5200658, 0.191012, 0.9568627, 0, 1, 1,
0.9451217, 0.1646895, 2.562774, 0.9607843, 0, 1, 1,
0.9571023, -0.2673318, 1.902264, 0.9686275, 0, 1, 1,
0.9587122, 0.4939475, 1.408481, 0.972549, 0, 1, 1,
0.9719728, -1.206059, 1.451727, 0.9803922, 0, 1, 1,
0.9878735, 2.326281, 2.778692, 0.9843137, 0, 1, 1,
0.9928377, 0.6433073, 1.222744, 0.9921569, 0, 1, 1,
0.9939463, 1.091869, -0.9291232, 0.9960784, 0, 1, 1,
0.9984008, 1.074145, 2.297559, 1, 0, 0.9960784, 1,
0.9989494, 0.7384611, 1.331792, 1, 0, 0.9882353, 1,
1.002267, 0.5143148, 0.8687188, 1, 0, 0.9843137, 1,
1.009042, -1.61266, 2.054507, 1, 0, 0.9764706, 1,
1.010881, 1.345724, -0.6870774, 1, 0, 0.972549, 1,
1.011257, 0.6109529, 0.1559637, 1, 0, 0.9647059, 1,
1.013013, 1.916395, 0.7047288, 1, 0, 0.9607843, 1,
1.014895, -0.09078548, 1.971961, 1, 0, 0.9529412, 1,
1.023372, 0.002256079, 2.563962, 1, 0, 0.9490196, 1,
1.024009, 0.3094308, 2.101341, 1, 0, 0.9411765, 1,
1.026456, 1.469843, -1.578211, 1, 0, 0.9372549, 1,
1.031471, -1.826005, 0.6713627, 1, 0, 0.9294118, 1,
1.035013, -0.1975356, 3.286079, 1, 0, 0.9254902, 1,
1.038083, -0.1989326, 0.716192, 1, 0, 0.9176471, 1,
1.038532, -0.1867499, 2.723879, 1, 0, 0.9137255, 1,
1.045741, -1.373467, -0.5653884, 1, 0, 0.9058824, 1,
1.059475, -0.9355384, 2.885851, 1, 0, 0.9019608, 1,
1.06148, 0.5357392, 1.025449, 1, 0, 0.8941177, 1,
1.062945, 1.540064, -1.527121, 1, 0, 0.8862745, 1,
1.069061, 0.7299849, 0.4979168, 1, 0, 0.8823529, 1,
1.073089, 1.015589, -0.9212756, 1, 0, 0.8745098, 1,
1.075067, -0.8174324, 3.124264, 1, 0, 0.8705882, 1,
1.083941, -0.8842583, 3.766834, 1, 0, 0.8627451, 1,
1.088737, 0.2465065, 1.362432, 1, 0, 0.8588235, 1,
1.089815, -0.9177085, 3.417435, 1, 0, 0.8509804, 1,
1.106151, -0.08082876, 0.4848451, 1, 0, 0.8470588, 1,
1.112918, 0.8056647, 0.3331626, 1, 0, 0.8392157, 1,
1.117717, 0.4228293, 2.437837, 1, 0, 0.8352941, 1,
1.135129, -1.382007, 2.933488, 1, 0, 0.827451, 1,
1.13624, -1.176583, 1.689683, 1, 0, 0.8235294, 1,
1.139112, 0.248882, 1.614256, 1, 0, 0.8156863, 1,
1.140592, -0.1056479, 2.230195, 1, 0, 0.8117647, 1,
1.142162, -0.7516414, 1.739878, 1, 0, 0.8039216, 1,
1.142817, 0.6176564, -0.1032825, 1, 0, 0.7960784, 1,
1.143871, 0.4951982, 1.416833, 1, 0, 0.7921569, 1,
1.149219, -1.124408, 3.181676, 1, 0, 0.7843137, 1,
1.150708, -0.4393947, 2.352916, 1, 0, 0.7803922, 1,
1.156579, 0.01652228, -1.950271, 1, 0, 0.772549, 1,
1.156886, 2.066995, 0.005604289, 1, 0, 0.7686275, 1,
1.159408, 0.4993579, 1.086889, 1, 0, 0.7607843, 1,
1.172741, -2.338806, 3.167286, 1, 0, 0.7568628, 1,
1.185362, -1.086412, 3.641291, 1, 0, 0.7490196, 1,
1.191066, -0.5952199, 1.07714, 1, 0, 0.7450981, 1,
1.197103, -0.151563, 2.153566, 1, 0, 0.7372549, 1,
1.199303, -0.3603481, 1.47375, 1, 0, 0.7333333, 1,
1.199929, -0.4748307, 0.9786453, 1, 0, 0.7254902, 1,
1.201173, -0.09295549, 2.403842, 1, 0, 0.7215686, 1,
1.204541, -0.4950115, 2.311979, 1, 0, 0.7137255, 1,
1.205353, 1.006388, 1.454088, 1, 0, 0.7098039, 1,
1.209223, -0.6060727, 0.2302763, 1, 0, 0.7019608, 1,
1.212382, -0.7470484, 0.1761381, 1, 0, 0.6941177, 1,
1.212446, 0.4680682, 0.348235, 1, 0, 0.6901961, 1,
1.214417, -1.004809, 2.849168, 1, 0, 0.682353, 1,
1.215234, -0.1585686, 2.073416, 1, 0, 0.6784314, 1,
1.221767, -0.3280025, 1.453847, 1, 0, 0.6705883, 1,
1.221944, 1.168057, 0.2935467, 1, 0, 0.6666667, 1,
1.22374, -0.2355235, 1.621018, 1, 0, 0.6588235, 1,
1.225514, -0.0924366, 0.1961921, 1, 0, 0.654902, 1,
1.227999, 0.07164679, 1.756793, 1, 0, 0.6470588, 1,
1.23001, 0.06183589, 1.309614, 1, 0, 0.6431373, 1,
1.231694, 0.07515552, 3.616643, 1, 0, 0.6352941, 1,
1.232638, -0.02483508, 0.7154905, 1, 0, 0.6313726, 1,
1.23916, 1.245419, 0.1781262, 1, 0, 0.6235294, 1,
1.240407, -0.4291072, 1.911378, 1, 0, 0.6196079, 1,
1.253435, 0.3122732, 0.7548563, 1, 0, 0.6117647, 1,
1.255851, -0.6711391, 3.174515, 1, 0, 0.6078432, 1,
1.261634, -1.723497, 2.967318, 1, 0, 0.6, 1,
1.261949, 1.2868, 0.3147942, 1, 0, 0.5921569, 1,
1.276951, -0.2312156, 1.03879, 1, 0, 0.5882353, 1,
1.279502, -0.2049383, 1.359579, 1, 0, 0.5803922, 1,
1.283891, -0.64184, 1.436743, 1, 0, 0.5764706, 1,
1.289541, -0.1859945, 0.3872939, 1, 0, 0.5686275, 1,
1.29821, 0.3176629, 1.027267, 1, 0, 0.5647059, 1,
1.301671, 0.5024897, -0.2866046, 1, 0, 0.5568628, 1,
1.301857, -0.3180459, 4.005409, 1, 0, 0.5529412, 1,
1.307472, 2.595045, 2.52402, 1, 0, 0.5450981, 1,
1.312613, -0.1134852, 2.361215, 1, 0, 0.5411765, 1,
1.335341, -2.206998, 1.062368, 1, 0, 0.5333334, 1,
1.34252, -0.2252831, 1.197224, 1, 0, 0.5294118, 1,
1.347062, 2.682372, 0.8037397, 1, 0, 0.5215687, 1,
1.354238, 0.7032394, 0.8898286, 1, 0, 0.5176471, 1,
1.362428, 1.144807, 0.4981407, 1, 0, 0.509804, 1,
1.367894, 1.582959, 0.968834, 1, 0, 0.5058824, 1,
1.368554, -0.6186805, 2.709887, 1, 0, 0.4980392, 1,
1.372847, -0.09855677, 0.6326168, 1, 0, 0.4901961, 1,
1.382085, 0.3359174, -0.6266149, 1, 0, 0.4862745, 1,
1.383404, -0.6076434, 0.9082038, 1, 0, 0.4784314, 1,
1.393077, 1.095531, 0.7648931, 1, 0, 0.4745098, 1,
1.393999, -1.878955, 3.092668, 1, 0, 0.4666667, 1,
1.406821, 0.9717363, 1.172329, 1, 0, 0.4627451, 1,
1.419024, -0.2525213, 3.283258, 1, 0, 0.454902, 1,
1.425504, -0.2968914, 1.27169, 1, 0, 0.4509804, 1,
1.434941, -0.3012586, 1.390219, 1, 0, 0.4431373, 1,
1.458967, 3.459987, 0.5777996, 1, 0, 0.4392157, 1,
1.468026, -0.8793083, 0.2380477, 1, 0, 0.4313726, 1,
1.471708, 1.103761, -0.06877871, 1, 0, 0.427451, 1,
1.485287, 0.9769039, 0.4432718, 1, 0, 0.4196078, 1,
1.489229, -0.9882821, 1.349465, 1, 0, 0.4156863, 1,
1.495895, -1.023022, 3.416805, 1, 0, 0.4078431, 1,
1.496264, -0.74949, 2.298904, 1, 0, 0.4039216, 1,
1.513536, -0.5726501, 0.7245719, 1, 0, 0.3960784, 1,
1.519117, 1.850528, 1.093805, 1, 0, 0.3882353, 1,
1.521458, 0.953021, 1.417425, 1, 0, 0.3843137, 1,
1.534768, -0.1403655, 1.134641, 1, 0, 0.3764706, 1,
1.545188, 0.7996601, 1.569558, 1, 0, 0.372549, 1,
1.551129, 0.4979915, -0.2149886, 1, 0, 0.3647059, 1,
1.552695, -1.907309, 2.331429, 1, 0, 0.3607843, 1,
1.580313, -1.461669, 4.814061, 1, 0, 0.3529412, 1,
1.595635, 0.3557137, 0.9055879, 1, 0, 0.3490196, 1,
1.610255, -0.3461355, 2.679554, 1, 0, 0.3411765, 1,
1.621345, -0.46933, 1.179896, 1, 0, 0.3372549, 1,
1.62617, 0.6410358, 2.511129, 1, 0, 0.3294118, 1,
1.640312, 1.019638, 0.3137539, 1, 0, 0.3254902, 1,
1.650631, -0.1644016, 3.208927, 1, 0, 0.3176471, 1,
1.654126, -1.066364, 2.577538, 1, 0, 0.3137255, 1,
1.662769, 0.02572803, 0.6613158, 1, 0, 0.3058824, 1,
1.666368, -1.256895, 2.784882, 1, 0, 0.2980392, 1,
1.678345, -0.1959411, 2.315981, 1, 0, 0.2941177, 1,
1.694379, -1.313347, 1.664593, 1, 0, 0.2862745, 1,
1.705449, -1.483903, 1.392678, 1, 0, 0.282353, 1,
1.715959, -3.469534, 3.414255, 1, 0, 0.2745098, 1,
1.720646, 1.560021, 1.860556, 1, 0, 0.2705882, 1,
1.745779, -0.6756282, 1.631736, 1, 0, 0.2627451, 1,
1.749532, 1.548841, 1.751893, 1, 0, 0.2588235, 1,
1.752141, 0.8679151, 1.775493, 1, 0, 0.2509804, 1,
1.762025, -0.1404113, 2.127715, 1, 0, 0.2470588, 1,
1.776026, 0.7012359, 0.6557444, 1, 0, 0.2392157, 1,
1.793847, -3.081589, 2.875288, 1, 0, 0.2352941, 1,
1.826289, 0.8912258, 0.8670605, 1, 0, 0.227451, 1,
1.826779, 0.4951566, 2.47001, 1, 0, 0.2235294, 1,
1.859508, 0.8626867, 3.344172, 1, 0, 0.2156863, 1,
1.871603, -0.5135368, 2.28674, 1, 0, 0.2117647, 1,
1.885767, 0.3329505, 2.252384, 1, 0, 0.2039216, 1,
1.902681, -0.7784017, 2.27975, 1, 0, 0.1960784, 1,
1.907141, -1.742994, 0.6859304, 1, 0, 0.1921569, 1,
1.918002, 0.5249977, 1.180724, 1, 0, 0.1843137, 1,
1.941852, 0.7736636, 2.544674, 1, 0, 0.1803922, 1,
1.945918, 1.070507, -0.3793893, 1, 0, 0.172549, 1,
1.958396, 1.441751, -0.08263608, 1, 0, 0.1686275, 1,
1.977482, -0.8584244, 1.2448, 1, 0, 0.1607843, 1,
1.995133, 1.142334, 1.123777, 1, 0, 0.1568628, 1,
2.041025, -1.32247, -0.01305799, 1, 0, 0.1490196, 1,
2.046394, -0.4612622, 1.061446, 1, 0, 0.145098, 1,
2.052103, 0.3272274, 1.155442, 1, 0, 0.1372549, 1,
2.0573, -0.4966477, 1.402066, 1, 0, 0.1333333, 1,
2.100032, -0.8663542, 2.443617, 1, 0, 0.1254902, 1,
2.138614, 0.1905497, 0.6292785, 1, 0, 0.1215686, 1,
2.156938, 0.7041688, 3.52579, 1, 0, 0.1137255, 1,
2.173002, -0.4645714, 2.271799, 1, 0, 0.1098039, 1,
2.183606, 0.3893452, 3.921541, 1, 0, 0.1019608, 1,
2.197439, 0.2952066, 1.092469, 1, 0, 0.09411765, 1,
2.259805, 0.5351239, 1.172563, 1, 0, 0.09019608, 1,
2.272933, -0.4450825, 2.693718, 1, 0, 0.08235294, 1,
2.328544, -2.298713, 1.176536, 1, 0, 0.07843138, 1,
2.348234, -0.703645, 1.468563, 1, 0, 0.07058824, 1,
2.354031, -0.9534808, 3.157283, 1, 0, 0.06666667, 1,
2.461265, -1.303985, 1.720569, 1, 0, 0.05882353, 1,
2.535581, -1.640144, 1.483174, 1, 0, 0.05490196, 1,
2.551159, -0.5273252, 1.700295, 1, 0, 0.04705882, 1,
2.690982, -2.185205, 1.94643, 1, 0, 0.04313726, 1,
2.703494, 0.6997665, 1.74183, 1, 0, 0.03529412, 1,
2.731158, -1.527748, 1.103552, 1, 0, 0.03137255, 1,
2.819767, -0.1010485, 2.133534, 1, 0, 0.02352941, 1,
3.110401, 1.082764, 2.985375, 1, 0, 0.01960784, 1,
3.41847, 1.58736, 0.8449919, 1, 0, 0.01176471, 1,
4.074449, -0.6877737, 1.077611, 1, 0, 0.007843138, 1
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
0.5999939, -4.644088, -7.263432, 0, -0.5, 0.5, 0.5,
0.5999939, -4.644088, -7.263432, 1, -0.5, 0.5, 0.5,
0.5999939, -4.644088, -7.263432, 1, 1.5, 0.5, 0.5,
0.5999939, -4.644088, -7.263432, 0, 1.5, 0.5, 0.5
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
-4.052301, -0.004773736, -7.263432, 0, -0.5, 0.5, 0.5,
-4.052301, -0.004773736, -7.263432, 1, -0.5, 0.5, 0.5,
-4.052301, -0.004773736, -7.263432, 1, 1.5, 0.5, 0.5,
-4.052301, -0.004773736, -7.263432, 0, 1.5, 0.5, 0.5
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
-4.052301, -4.644088, 0.01518583, 0, -0.5, 0.5, 0.5,
-4.052301, -4.644088, 0.01518583, 1, -0.5, 0.5, 0.5,
-4.052301, -4.644088, 0.01518583, 1, 1.5, 0.5, 0.5,
-4.052301, -4.644088, 0.01518583, 0, 1.5, 0.5, 0.5
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
-2, -3.573477, -5.583751,
4, -3.573477, -5.583751,
-2, -3.573477, -5.583751,
-2, -3.751912, -5.863698,
-1, -3.573477, -5.583751,
-1, -3.751912, -5.863698,
0, -3.573477, -5.583751,
0, -3.751912, -5.863698,
1, -3.573477, -5.583751,
1, -3.751912, -5.863698,
2, -3.573477, -5.583751,
2, -3.751912, -5.863698,
3, -3.573477, -5.583751,
3, -3.751912, -5.863698,
4, -3.573477, -5.583751,
4, -3.751912, -5.863698
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
"3",
"4"
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
-2, -4.108782, -6.423591, 0, -0.5, 0.5, 0.5,
-2, -4.108782, -6.423591, 1, -0.5, 0.5, 0.5,
-2, -4.108782, -6.423591, 1, 1.5, 0.5, 0.5,
-2, -4.108782, -6.423591, 0, 1.5, 0.5, 0.5,
-1, -4.108782, -6.423591, 0, -0.5, 0.5, 0.5,
-1, -4.108782, -6.423591, 1, -0.5, 0.5, 0.5,
-1, -4.108782, -6.423591, 1, 1.5, 0.5, 0.5,
-1, -4.108782, -6.423591, 0, 1.5, 0.5, 0.5,
0, -4.108782, -6.423591, 0, -0.5, 0.5, 0.5,
0, -4.108782, -6.423591, 1, -0.5, 0.5, 0.5,
0, -4.108782, -6.423591, 1, 1.5, 0.5, 0.5,
0, -4.108782, -6.423591, 0, 1.5, 0.5, 0.5,
1, -4.108782, -6.423591, 0, -0.5, 0.5, 0.5,
1, -4.108782, -6.423591, 1, -0.5, 0.5, 0.5,
1, -4.108782, -6.423591, 1, 1.5, 0.5, 0.5,
1, -4.108782, -6.423591, 0, 1.5, 0.5, 0.5,
2, -4.108782, -6.423591, 0, -0.5, 0.5, 0.5,
2, -4.108782, -6.423591, 1, -0.5, 0.5, 0.5,
2, -4.108782, -6.423591, 1, 1.5, 0.5, 0.5,
2, -4.108782, -6.423591, 0, 1.5, 0.5, 0.5,
3, -4.108782, -6.423591, 0, -0.5, 0.5, 0.5,
3, -4.108782, -6.423591, 1, -0.5, 0.5, 0.5,
3, -4.108782, -6.423591, 1, 1.5, 0.5, 0.5,
3, -4.108782, -6.423591, 0, 1.5, 0.5, 0.5,
4, -4.108782, -6.423591, 0, -0.5, 0.5, 0.5,
4, -4.108782, -6.423591, 1, -0.5, 0.5, 0.5,
4, -4.108782, -6.423591, 1, 1.5, 0.5, 0.5,
4, -4.108782, -6.423591, 0, 1.5, 0.5, 0.5
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
-2.978695, -3, -5.583751,
-2.978695, 3, -5.583751,
-2.978695, -3, -5.583751,
-3.157629, -3, -5.863698,
-2.978695, -2, -5.583751,
-3.157629, -2, -5.863698,
-2.978695, -1, -5.583751,
-3.157629, -1, -5.863698,
-2.978695, 0, -5.583751,
-3.157629, 0, -5.863698,
-2.978695, 1, -5.583751,
-3.157629, 1, -5.863698,
-2.978695, 2, -5.583751,
-3.157629, 2, -5.863698,
-2.978695, 3, -5.583751,
-3.157629, 3, -5.863698
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
-3.515498, -3, -6.423591, 0, -0.5, 0.5, 0.5,
-3.515498, -3, -6.423591, 1, -0.5, 0.5, 0.5,
-3.515498, -3, -6.423591, 1, 1.5, 0.5, 0.5,
-3.515498, -3, -6.423591, 0, 1.5, 0.5, 0.5,
-3.515498, -2, -6.423591, 0, -0.5, 0.5, 0.5,
-3.515498, -2, -6.423591, 1, -0.5, 0.5, 0.5,
-3.515498, -2, -6.423591, 1, 1.5, 0.5, 0.5,
-3.515498, -2, -6.423591, 0, 1.5, 0.5, 0.5,
-3.515498, -1, -6.423591, 0, -0.5, 0.5, 0.5,
-3.515498, -1, -6.423591, 1, -0.5, 0.5, 0.5,
-3.515498, -1, -6.423591, 1, 1.5, 0.5, 0.5,
-3.515498, -1, -6.423591, 0, 1.5, 0.5, 0.5,
-3.515498, 0, -6.423591, 0, -0.5, 0.5, 0.5,
-3.515498, 0, -6.423591, 1, -0.5, 0.5, 0.5,
-3.515498, 0, -6.423591, 1, 1.5, 0.5, 0.5,
-3.515498, 0, -6.423591, 0, 1.5, 0.5, 0.5,
-3.515498, 1, -6.423591, 0, -0.5, 0.5, 0.5,
-3.515498, 1, -6.423591, 1, -0.5, 0.5, 0.5,
-3.515498, 1, -6.423591, 1, 1.5, 0.5, 0.5,
-3.515498, 1, -6.423591, 0, 1.5, 0.5, 0.5,
-3.515498, 2, -6.423591, 0, -0.5, 0.5, 0.5,
-3.515498, 2, -6.423591, 1, -0.5, 0.5, 0.5,
-3.515498, 2, -6.423591, 1, 1.5, 0.5, 0.5,
-3.515498, 2, -6.423591, 0, 1.5, 0.5, 0.5,
-3.515498, 3, -6.423591, 0, -0.5, 0.5, 0.5,
-3.515498, 3, -6.423591, 1, -0.5, 0.5, 0.5,
-3.515498, 3, -6.423591, 1, 1.5, 0.5, 0.5,
-3.515498, 3, -6.423591, 0, 1.5, 0.5, 0.5
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
-2.978695, -3.573477, -4,
-2.978695, -3.573477, 4,
-2.978695, -3.573477, -4,
-3.157629, -3.751912, -4,
-2.978695, -3.573477, -2,
-3.157629, -3.751912, -2,
-2.978695, -3.573477, 0,
-3.157629, -3.751912, 0,
-2.978695, -3.573477, 2,
-3.157629, -3.751912, 2,
-2.978695, -3.573477, 4,
-3.157629, -3.751912, 4
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
-3.515498, -4.108782, -4, 0, -0.5, 0.5, 0.5,
-3.515498, -4.108782, -4, 1, -0.5, 0.5, 0.5,
-3.515498, -4.108782, -4, 1, 1.5, 0.5, 0.5,
-3.515498, -4.108782, -4, 0, 1.5, 0.5, 0.5,
-3.515498, -4.108782, -2, 0, -0.5, 0.5, 0.5,
-3.515498, -4.108782, -2, 1, -0.5, 0.5, 0.5,
-3.515498, -4.108782, -2, 1, 1.5, 0.5, 0.5,
-3.515498, -4.108782, -2, 0, 1.5, 0.5, 0.5,
-3.515498, -4.108782, 0, 0, -0.5, 0.5, 0.5,
-3.515498, -4.108782, 0, 1, -0.5, 0.5, 0.5,
-3.515498, -4.108782, 0, 1, 1.5, 0.5, 0.5,
-3.515498, -4.108782, 0, 0, 1.5, 0.5, 0.5,
-3.515498, -4.108782, 2, 0, -0.5, 0.5, 0.5,
-3.515498, -4.108782, 2, 1, -0.5, 0.5, 0.5,
-3.515498, -4.108782, 2, 1, 1.5, 0.5, 0.5,
-3.515498, -4.108782, 2, 0, 1.5, 0.5, 0.5,
-3.515498, -4.108782, 4, 0, -0.5, 0.5, 0.5,
-3.515498, -4.108782, 4, 1, -0.5, 0.5, 0.5,
-3.515498, -4.108782, 4, 1, 1.5, 0.5, 0.5,
-3.515498, -4.108782, 4, 0, 1.5, 0.5, 0.5
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
-2.978695, -3.573477, -5.583751,
-2.978695, 3.56393, -5.583751,
-2.978695, -3.573477, 5.614122,
-2.978695, 3.56393, 5.614122,
-2.978695, -3.573477, -5.583751,
-2.978695, -3.573477, 5.614122,
-2.978695, 3.56393, -5.583751,
-2.978695, 3.56393, 5.614122,
-2.978695, -3.573477, -5.583751,
4.178683, -3.573477, -5.583751,
-2.978695, -3.573477, 5.614122,
4.178683, -3.573477, 5.614122,
-2.978695, 3.56393, -5.583751,
4.178683, 3.56393, -5.583751,
-2.978695, 3.56393, 5.614122,
4.178683, 3.56393, 5.614122,
4.178683, -3.573477, -5.583751,
4.178683, 3.56393, -5.583751,
4.178683, -3.573477, 5.614122,
4.178683, 3.56393, 5.614122,
4.178683, -3.573477, -5.583751,
4.178683, -3.573477, 5.614122,
4.178683, 3.56393, -5.583751,
4.178683, 3.56393, 5.614122
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
var radius = 8.055199;
var distance = 35.83849;
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
mvMatrix.translate( -0.5999939, 0.004773736, -0.01518583 );
mvMatrix.scale( 1.216848, 1.220253, 0.7777762 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.83849);
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
Isopropyl_phenylacet<-read.table("Isopropyl_phenylacet.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Isopropyl_phenylacet$V2
```

```
## Error in eval(expr, envir, enclos): object 'Isopropyl_phenylacet' not found
```

```r
y<-Isopropyl_phenylacet$V3
```

```
## Error in eval(expr, envir, enclos): object 'Isopropyl_phenylacet' not found
```

```r
z<-Isopropyl_phenylacet$V4
```

```
## Error in eval(expr, envir, enclos): object 'Isopropyl_phenylacet' not found
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
-2.874461, 2.84479, -2.420345, 0, 0, 1, 1, 1,
-2.743289, 1.508612, -2.257223, 1, 0, 0, 1, 1,
-2.672707, 1.094703, -1.240313, 1, 0, 0, 1, 1,
-2.640682, -0.6334948, -1.156797, 1, 0, 0, 1, 1,
-2.613917, -0.7577941, -2.277185, 1, 0, 0, 1, 1,
-2.458715, 1.954772, -0.1493972, 1, 0, 0, 1, 1,
-2.457775, 0.6670942, -1.103831, 0, 0, 0, 1, 1,
-2.413919, -0.5095485, -2.418533, 0, 0, 0, 1, 1,
-2.403345, -1.981287, -2.601903, 0, 0, 0, 1, 1,
-2.360652, 1.011328, -0.7719846, 0, 0, 0, 1, 1,
-2.318639, -0.5211037, -2.680114, 0, 0, 0, 1, 1,
-2.29131, 0.5887176, -2.464259, 0, 0, 0, 1, 1,
-2.246951, 0.4756225, -2.256177, 0, 0, 0, 1, 1,
-2.205491, -0.1225182, -1.589005, 1, 1, 1, 1, 1,
-2.195584, -0.1482075, -0.9313022, 1, 1, 1, 1, 1,
-2.183437, 0.2795386, -2.441685, 1, 1, 1, 1, 1,
-2.115736, -1.363891, -0.3465352, 1, 1, 1, 1, 1,
-2.094874, 1.624337, -1.260001, 1, 1, 1, 1, 1,
-2.08996, 0.6281939, 0.992678, 1, 1, 1, 1, 1,
-2.070937, 1.092787, -1.6425, 1, 1, 1, 1, 1,
-2.057068, 0.8952505, 0.02997406, 1, 1, 1, 1, 1,
-1.996833, 0.06457718, -1.514893, 1, 1, 1, 1, 1,
-1.951089, -0.8957029, -2.346579, 1, 1, 1, 1, 1,
-1.941059, 0.284167, -1.568131, 1, 1, 1, 1, 1,
-1.935335, -0.4534032, -1.745517, 1, 1, 1, 1, 1,
-1.908789, 0.7792845, -1.650115, 1, 1, 1, 1, 1,
-1.907715, -2.425735, -2.747843, 1, 1, 1, 1, 1,
-1.855187, -0.3964208, -1.690536, 1, 1, 1, 1, 1,
-1.814254, -1.445433, -1.072996, 0, 0, 1, 1, 1,
-1.792744, 1.329662, 0.4679904, 1, 0, 0, 1, 1,
-1.77906, 0.4610384, -2.114573, 1, 0, 0, 1, 1,
-1.775362, -0.741052, -0.7454886, 1, 0, 0, 1, 1,
-1.770244, 0.243376, -2.024944, 1, 0, 0, 1, 1,
-1.751717, -0.235644, -0.2322736, 1, 0, 0, 1, 1,
-1.750297, -0.7844346, -2.19097, 0, 0, 0, 1, 1,
-1.72874, -0.7615342, -1.139077, 0, 0, 0, 1, 1,
-1.720157, 0.06901342, -1.920311, 0, 0, 0, 1, 1,
-1.708812, -0.4571323, -1.782082, 0, 0, 0, 1, 1,
-1.682184, 0.7850546, -2.707801, 0, 0, 0, 1, 1,
-1.670325, 0.2667917, -1.961203, 0, 0, 0, 1, 1,
-1.666915, -1.357413, -1.857275, 0, 0, 0, 1, 1,
-1.6592, -2.031765, -2.474245, 1, 1, 1, 1, 1,
-1.655461, 0.4620214, -0.597824, 1, 1, 1, 1, 1,
-1.59237, -0.4688153, -1.677952, 1, 1, 1, 1, 1,
-1.588452, 0.4030933, -0.422022, 1, 1, 1, 1, 1,
-1.586676, 0.5592736, -1.750155, 1, 1, 1, 1, 1,
-1.583122, -0.5844051, -1.683281, 1, 1, 1, 1, 1,
-1.580141, -0.01086259, -1.393928, 1, 1, 1, 1, 1,
-1.566823, -0.5636684, -0.03272631, 1, 1, 1, 1, 1,
-1.553167, -1.318268, -2.405642, 1, 1, 1, 1, 1,
-1.53693, 0.4476687, -2.280406, 1, 1, 1, 1, 1,
-1.507243, 0.756366, -0.9638228, 1, 1, 1, 1, 1,
-1.493319, 2.618601, 1.287692, 1, 1, 1, 1, 1,
-1.49192, 0.5412807, -0.09694634, 1, 1, 1, 1, 1,
-1.482099, -1.221874, -2.657059, 1, 1, 1, 1, 1,
-1.481866, -0.6058172, -2.776718, 1, 1, 1, 1, 1,
-1.477218, -0.9951236, -2.482457, 0, 0, 1, 1, 1,
-1.467182, 0.1385472, -1.887822, 1, 0, 0, 1, 1,
-1.462058, -0.7016105, -4.686674, 1, 0, 0, 1, 1,
-1.433258, -0.8722386, -0.7508176, 1, 0, 0, 1, 1,
-1.426853, -0.2630855, -2.841928, 1, 0, 0, 1, 1,
-1.410683, 0.2421131, -1.538395, 1, 0, 0, 1, 1,
-1.395955, 1.884221, -1.207221, 0, 0, 0, 1, 1,
-1.386576, 0.04103659, -1.04334, 0, 0, 0, 1, 1,
-1.384378, 0.5865238, -2.392332, 0, 0, 0, 1, 1,
-1.362714, -0.5224033, -2.168196, 0, 0, 0, 1, 1,
-1.354946, -1.237344, -1.336137, 0, 0, 0, 1, 1,
-1.348718, 0.03077535, -1.400712, 0, 0, 0, 1, 1,
-1.348506, -1.150646, -1.68202, 0, 0, 0, 1, 1,
-1.340702, -0.6064273, -2.036165, 1, 1, 1, 1, 1,
-1.332444, 1.474458, -0.775526, 1, 1, 1, 1, 1,
-1.328549, 0.9720408, -0.6431974, 1, 1, 1, 1, 1,
-1.317694, -1.07326, -3.129535, 1, 1, 1, 1, 1,
-1.316554, -0.3835869, -2.354009, 1, 1, 1, 1, 1,
-1.312198, -0.694838, -1.228501, 1, 1, 1, 1, 1,
-1.305634, 1.32497, -1.076793, 1, 1, 1, 1, 1,
-1.291857, 0.04601222, -1.001917, 1, 1, 1, 1, 1,
-1.282427, 0.1489667, -1.780256, 1, 1, 1, 1, 1,
-1.27655, -0.5561571, -0.5207433, 1, 1, 1, 1, 1,
-1.269651, 0.5636368, -0.7257873, 1, 1, 1, 1, 1,
-1.269294, 0.8314152, -0.4900626, 1, 1, 1, 1, 1,
-1.268282, 0.1767601, -0.7314791, 1, 1, 1, 1, 1,
-1.267656, -0.07409842, -0.9789841, 1, 1, 1, 1, 1,
-1.262055, 0.04890089, 0.1024825, 1, 1, 1, 1, 1,
-1.253445, 1.971115, -0.3930927, 0, 0, 1, 1, 1,
-1.251837, 2.274015, -0.6644213, 1, 0, 0, 1, 1,
-1.24967, -0.6477531, -0.7467868, 1, 0, 0, 1, 1,
-1.244885, 0.04651261, -1.581663, 1, 0, 0, 1, 1,
-1.244634, -1.238592, -3.104479, 1, 0, 0, 1, 1,
-1.241021, -0.6070482, -1.146411, 1, 0, 0, 1, 1,
-1.229441, -0.694618, -0.9572828, 0, 0, 0, 1, 1,
-1.229151, 2.191028, -2.424392, 0, 0, 0, 1, 1,
-1.225732, 0.7482122, -0.6490659, 0, 0, 0, 1, 1,
-1.225308, 0.4439639, -3.245409, 0, 0, 0, 1, 1,
-1.223169, -0.6217037, -2.312132, 0, 0, 0, 1, 1,
-1.215455, 1.197637, -0.6456718, 0, 0, 0, 1, 1,
-1.213936, 0.6522271, 0.9468039, 0, 0, 0, 1, 1,
-1.19968, 1.503898, -0.6545821, 1, 1, 1, 1, 1,
-1.192653, -1.084674, -1.849946, 1, 1, 1, 1, 1,
-1.192044, -0.1019809, -2.955166, 1, 1, 1, 1, 1,
-1.190135, 1.383849, 1.334926, 1, 1, 1, 1, 1,
-1.189923, -0.2413518, -0.08411218, 1, 1, 1, 1, 1,
-1.186319, 3.081193, 1.264361, 1, 1, 1, 1, 1,
-1.17635, 0.6192864, -0.5575809, 1, 1, 1, 1, 1,
-1.176257, -0.3343621, -2.147159, 1, 1, 1, 1, 1,
-1.174139, -1.18933, -5.420675, 1, 1, 1, 1, 1,
-1.15289, 1.096497, 0.1141277, 1, 1, 1, 1, 1,
-1.14994, -1.291147, 0.301285, 1, 1, 1, 1, 1,
-1.146155, -1.232496, -1.888836, 1, 1, 1, 1, 1,
-1.146137, 1.278066, -2.3409, 1, 1, 1, 1, 1,
-1.145387, -0.6961038, -2.848234, 1, 1, 1, 1, 1,
-1.142709, 0.1796286, -1.159261, 1, 1, 1, 1, 1,
-1.139815, 1.445511, -0.6115797, 0, 0, 1, 1, 1,
-1.138713, 0.2161398, -1.286009, 1, 0, 0, 1, 1,
-1.137737, -1.397064, -2.035536, 1, 0, 0, 1, 1,
-1.136578, 0.997631, -2.497818, 1, 0, 0, 1, 1,
-1.13492, 1.268213, -0.8969195, 1, 0, 0, 1, 1,
-1.125146, -0.5393113, -0.6607006, 1, 0, 0, 1, 1,
-1.11405, -1.168492, -2.933431, 0, 0, 0, 1, 1,
-1.111379, 0.4669049, -0.1135733, 0, 0, 0, 1, 1,
-1.110544, 0.6275007, -0.1658453, 0, 0, 0, 1, 1,
-1.105743, -1.255621, -4.00864, 0, 0, 0, 1, 1,
-1.101395, -0.01635286, -0.1656242, 0, 0, 0, 1, 1,
-1.099181, -0.3022076, -1.30289, 0, 0, 0, 1, 1,
-1.098785, -1.099278, -2.935983, 0, 0, 0, 1, 1,
-1.09452, 0.02816822, -1.334034, 1, 1, 1, 1, 1,
-1.07269, 1.164286, -2.347505, 1, 1, 1, 1, 1,
-1.072481, 0.5027704, -2.047081, 1, 1, 1, 1, 1,
-1.070726, 1.166724, -1.527662, 1, 1, 1, 1, 1,
-1.058011, -0.2585262, -1.796826, 1, 1, 1, 1, 1,
-1.050602, -0.06672598, -1.061139, 1, 1, 1, 1, 1,
-1.0497, 0.7354225, -1.940738, 1, 1, 1, 1, 1,
-1.048428, -0.8704316, -2.219859, 1, 1, 1, 1, 1,
-1.04756, 1.269683, -0.2255681, 1, 1, 1, 1, 1,
-1.044764, -0.1343666, -0.5629838, 1, 1, 1, 1, 1,
-1.028514, 0.8936847, -0.5803151, 1, 1, 1, 1, 1,
-1.024761, 0.5664006, 1.163327, 1, 1, 1, 1, 1,
-1.018335, 1.480197, -1.000282, 1, 1, 1, 1, 1,
-1.016701, -0.186746, 0.2210266, 1, 1, 1, 1, 1,
-1.016143, 2.67129, -1.660436, 1, 1, 1, 1, 1,
-1.008371, -1.181716, -2.41489, 0, 0, 1, 1, 1,
-1.005072, 0.3241992, -0.9537762, 1, 0, 0, 1, 1,
-1.004381, 0.597793, -1.833184, 1, 0, 0, 1, 1,
-0.9984865, 1.182276, -1.180945, 1, 0, 0, 1, 1,
-0.9984253, -1.411938, -0.07601196, 1, 0, 0, 1, 1,
-0.9912382, -0.2294563, -1.405808, 1, 0, 0, 1, 1,
-0.9884619, -0.6588326, -2.720797, 0, 0, 0, 1, 1,
-0.9878271, 0.633818, -2.394872, 0, 0, 0, 1, 1,
-0.9809139, -0.9173114, -2.119113, 0, 0, 0, 1, 1,
-0.9786573, 0.3461415, -0.3764429, 0, 0, 0, 1, 1,
-0.9781282, 0.7370313, -1.099204, 0, 0, 0, 1, 1,
-0.9768474, 1.223448, -0.1379075, 0, 0, 0, 1, 1,
-0.9727818, 2.28358, -0.4273845, 0, 0, 0, 1, 1,
-0.9583755, -0.5775828, -1.870484, 1, 1, 1, 1, 1,
-0.9554982, 1.74314, 1.509474, 1, 1, 1, 1, 1,
-0.9472455, 1.031579, 0.7395426, 1, 1, 1, 1, 1,
-0.9444275, -0.5754356, -1.632847, 1, 1, 1, 1, 1,
-0.9430634, 0.7549682, -2.097104, 1, 1, 1, 1, 1,
-0.9428623, -0.01978526, -1.913017, 1, 1, 1, 1, 1,
-0.9387158, -0.1529493, -2.231906, 1, 1, 1, 1, 1,
-0.9346972, -0.0719412, -2.88651, 1, 1, 1, 1, 1,
-0.9321998, 0.002869202, -2.339985, 1, 1, 1, 1, 1,
-0.9263145, 0.5763763, -3.120134, 1, 1, 1, 1, 1,
-0.9237673, -1.051393, -2.243344, 1, 1, 1, 1, 1,
-0.9233327, 0.2240046, -0.8036401, 1, 1, 1, 1, 1,
-0.9126344, 0.656198, -1.485547, 1, 1, 1, 1, 1,
-0.907962, -0.2081216, -0.2661219, 1, 1, 1, 1, 1,
-0.9067423, 0.292639, -0.939377, 1, 1, 1, 1, 1,
-0.9066873, -2.111049, -4.03636, 0, 0, 1, 1, 1,
-0.902801, -0.428311, -2.683556, 1, 0, 0, 1, 1,
-0.8987069, -1.578457, -3.015743, 1, 0, 0, 1, 1,
-0.8946805, -1.120027, -0.8003796, 1, 0, 0, 1, 1,
-0.8929063, -1.211191, -3.168443, 1, 0, 0, 1, 1,
-0.8918024, -0.03482363, -1.508784, 1, 0, 0, 1, 1,
-0.8833746, -0.8006901, -3.53078, 0, 0, 0, 1, 1,
-0.8823522, 1.098883, -1.258539, 0, 0, 0, 1, 1,
-0.8819405, 0.3048072, -0.1604776, 0, 0, 0, 1, 1,
-0.8695459, -0.5353246, -1.697145, 0, 0, 0, 1, 1,
-0.8694947, -0.4800882, -1.978194, 0, 0, 0, 1, 1,
-0.8687916, -0.4275399, -1.6775, 0, 0, 0, 1, 1,
-0.8682711, 0.4477791, -0.2513673, 0, 0, 0, 1, 1,
-0.8616418, 1.295691, -2.679611, 1, 1, 1, 1, 1,
-0.8547235, 0.6703563, -0.772063, 1, 1, 1, 1, 1,
-0.8516865, 0.8015832, 0.4250666, 1, 1, 1, 1, 1,
-0.8514193, 1.289692, -3.221037, 1, 1, 1, 1, 1,
-0.8511726, 0.5925592, -0.8094593, 1, 1, 1, 1, 1,
-0.8487221, -0.4228123, -2.652083, 1, 1, 1, 1, 1,
-0.8476463, -0.105133, -2.690475, 1, 1, 1, 1, 1,
-0.8444686, -1.019937, -2.83681, 1, 1, 1, 1, 1,
-0.8346022, 3.022623, 0.5339648, 1, 1, 1, 1, 1,
-0.8337281, -1.098022, -2.018853, 1, 1, 1, 1, 1,
-0.8299913, 0.8189331, 0.1021208, 1, 1, 1, 1, 1,
-0.8199554, 1.712812, -1.837477, 1, 1, 1, 1, 1,
-0.8191832, -0.5869267, -2.067998, 1, 1, 1, 1, 1,
-0.8164146, 0.4545073, -0.6964346, 1, 1, 1, 1, 1,
-0.8062788, -1.040362, -2.26109, 1, 1, 1, 1, 1,
-0.8059073, -0.9381444, -2.536104, 0, 0, 1, 1, 1,
-0.7988586, 0.5548779, -1.199082, 1, 0, 0, 1, 1,
-0.7976422, -0.9346573, -2.147234, 1, 0, 0, 1, 1,
-0.7955144, -1.27753, -1.023558, 1, 0, 0, 1, 1,
-0.7836275, 0.03378754, -1.666269, 1, 0, 0, 1, 1,
-0.7802538, 1.167897, -1.139911, 1, 0, 0, 1, 1,
-0.7762879, 1.176479, -1.227988, 0, 0, 0, 1, 1,
-0.7744474, -0.4957653, -4.429867, 0, 0, 0, 1, 1,
-0.7732111, 0.5108289, 0.2129508, 0, 0, 0, 1, 1,
-0.771471, 0.2713462, -1.548454, 0, 0, 0, 1, 1,
-0.7651333, -0.2558998, -3.436596, 0, 0, 0, 1, 1,
-0.7639564, -0.2989, -1.784777, 0, 0, 0, 1, 1,
-0.7637298, -0.5755534, -0.2593195, 0, 0, 0, 1, 1,
-0.7621671, 0.9737201, 0.478381, 1, 1, 1, 1, 1,
-0.7578057, 1.853504, -1.100198, 1, 1, 1, 1, 1,
-0.7561411, 0.7599139, -1.087773, 1, 1, 1, 1, 1,
-0.7447198, -0.6623062, -0.8944073, 1, 1, 1, 1, 1,
-0.7428915, 2.135864, 0.2369766, 1, 1, 1, 1, 1,
-0.7415982, 0.5989255, -1.641602, 1, 1, 1, 1, 1,
-0.7407346, -0.0763189, -1.359579, 1, 1, 1, 1, 1,
-0.7400203, 1.684747, -2.245924, 1, 1, 1, 1, 1,
-0.7329022, -0.07127059, -1.389526, 1, 1, 1, 1, 1,
-0.7313059, 1.506997, -0.4922963, 1, 1, 1, 1, 1,
-0.726104, 1.294832, -0.8726482, 1, 1, 1, 1, 1,
-0.7187926, 0.6128967, -0.530666, 1, 1, 1, 1, 1,
-0.7118066, 0.7045394, -0.4417454, 1, 1, 1, 1, 1,
-0.7112218, 0.4888593, -2.325199, 1, 1, 1, 1, 1,
-0.7068362, -0.7911902, -2.249284, 1, 1, 1, 1, 1,
-0.7025933, -0.5060942, -3.078302, 0, 0, 1, 1, 1,
-0.7016382, 0.5968774, -1.726496, 1, 0, 0, 1, 1,
-0.6972079, -0.3921915, -1.901057, 1, 0, 0, 1, 1,
-0.6913712, -0.5161461, -1.291605, 1, 0, 0, 1, 1,
-0.6892157, -0.8513287, -4.386552, 1, 0, 0, 1, 1,
-0.682563, -0.9347745, -4.070756, 1, 0, 0, 1, 1,
-0.6817201, -0.3729957, -3.710572, 0, 0, 0, 1, 1,
-0.6759483, -0.9286597, -3.190554, 0, 0, 0, 1, 1,
-0.6708101, 0.4133094, -0.8983495, 0, 0, 0, 1, 1,
-0.6617156, 0.8709921, -0.6510505, 0, 0, 0, 1, 1,
-0.6605186, -1.39912, -1.407851, 0, 0, 0, 1, 1,
-0.6560281, -0.6005021, -0.6938514, 0, 0, 0, 1, 1,
-0.6556553, -0.9715317, -2.159964, 0, 0, 0, 1, 1,
-0.6552589, 0.05954309, -1.24013, 1, 1, 1, 1, 1,
-0.6544402, 0.5091563, -1.518896, 1, 1, 1, 1, 1,
-0.6540747, 0.8976026, -2.149787, 1, 1, 1, 1, 1,
-0.6533477, 0.1790111, 0.8499432, 1, 1, 1, 1, 1,
-0.6529601, -1.345292, -3.257559, 1, 1, 1, 1, 1,
-0.6528234, -0.7077038, -1.57928, 1, 1, 1, 1, 1,
-0.6510136, -0.2573355, -2.036265, 1, 1, 1, 1, 1,
-0.6451461, -0.2803741, -0.4334178, 1, 1, 1, 1, 1,
-0.6417916, 1.000651, 0.1743096, 1, 1, 1, 1, 1,
-0.6413211, -1.335567, -2.299512, 1, 1, 1, 1, 1,
-0.6412831, 0.796396, 0.2792612, 1, 1, 1, 1, 1,
-0.6369676, -1.044224, -3.167437, 1, 1, 1, 1, 1,
-0.6345899, 1.36079, 0.846183, 1, 1, 1, 1, 1,
-0.6335325, -0.3182835, 0.1713813, 1, 1, 1, 1, 1,
-0.6302485, -1.387798, -4.534162, 1, 1, 1, 1, 1,
-0.6270718, -0.1759078, -1.321466, 0, 0, 1, 1, 1,
-0.6247789, 0.04525658, -3.656727, 1, 0, 0, 1, 1,
-0.6246558, -1.552225, -2.232966, 1, 0, 0, 1, 1,
-0.6210014, -0.8142186, -4.038589, 1, 0, 0, 1, 1,
-0.6209975, 1.436888, -1.187759, 1, 0, 0, 1, 1,
-0.619343, -0.822579, -3.11604, 1, 0, 0, 1, 1,
-0.6173179, -2.13588, -2.764897, 0, 0, 0, 1, 1,
-0.6144152, 0.334065, -0.8545819, 0, 0, 0, 1, 1,
-0.61018, -0.08313466, -2.161407, 0, 0, 0, 1, 1,
-0.6099854, 0.311245, 0.2890182, 0, 0, 0, 1, 1,
-0.6030898, -1.386154, -2.833899, 0, 0, 0, 1, 1,
-0.5945247, -0.04069949, -1.082155, 0, 0, 0, 1, 1,
-0.5928162, -2.257216, -2.127213, 0, 0, 0, 1, 1,
-0.5906739, 0.4568697, -1.025638, 1, 1, 1, 1, 1,
-0.5854397, -1.687142, -2.541462, 1, 1, 1, 1, 1,
-0.5788091, 0.5619281, -0.6658495, 1, 1, 1, 1, 1,
-0.5762826, 0.8147501, -0.4638149, 1, 1, 1, 1, 1,
-0.575922, -0.2872519, -1.805469, 1, 1, 1, 1, 1,
-0.5725996, -0.5063192, -1.277114, 1, 1, 1, 1, 1,
-0.5675127, 0.3252269, -1.980897, 1, 1, 1, 1, 1,
-0.5636851, -0.6345703, -2.140723, 1, 1, 1, 1, 1,
-0.5622719, -0.2516005, -1.617925, 1, 1, 1, 1, 1,
-0.5530498, 0.7244955, -0.1572382, 1, 1, 1, 1, 1,
-0.5495759, -0.00718617, -2.362468, 1, 1, 1, 1, 1,
-0.5432457, 0.1013574, -0.6240051, 1, 1, 1, 1, 1,
-0.5341505, 0.3079908, -1.013297, 1, 1, 1, 1, 1,
-0.5264037, 0.2443766, -2.651768, 1, 1, 1, 1, 1,
-0.5262895, 0.4318588, 0.3065507, 1, 1, 1, 1, 1,
-0.5216952, -0.1376471, -0.1283107, 0, 0, 1, 1, 1,
-0.5200045, -1.278219, -2.970062, 1, 0, 0, 1, 1,
-0.5145996, 0.01608389, -2.193788, 1, 0, 0, 1, 1,
-0.5093495, -0.771991, -3.519713, 1, 0, 0, 1, 1,
-0.5068208, 0.1305412, -2.687673, 1, 0, 0, 1, 1,
-0.5035789, 0.1858114, -1.127934, 1, 0, 0, 1, 1,
-0.4969836, 0.3585043, -1.077354, 0, 0, 0, 1, 1,
-0.4952029, 0.1373924, 0.3709181, 0, 0, 0, 1, 1,
-0.4920453, 0.3382244, -1.775253, 0, 0, 0, 1, 1,
-0.491501, 1.061909, 1.919053, 0, 0, 0, 1, 1,
-0.4879053, -0.2012638, -2.636727, 0, 0, 0, 1, 1,
-0.4867941, 1.057377, 1.017737, 0, 0, 0, 1, 1,
-0.4843477, 1.732901, -0.159488, 0, 0, 0, 1, 1,
-0.4835018, 0.7751694, -0.2239522, 1, 1, 1, 1, 1,
-0.4815691, 0.3431855, -2.179139, 1, 1, 1, 1, 1,
-0.4779235, -1.18882, -1.943194, 1, 1, 1, 1, 1,
-0.4698311, -0.3595695, -0.9056338, 1, 1, 1, 1, 1,
-0.4624246, -1.666912, -4.924993, 1, 1, 1, 1, 1,
-0.4607365, -0.7846117, -1.054268, 1, 1, 1, 1, 1,
-0.4604285, -0.1197468, -0.9335275, 1, 1, 1, 1, 1,
-0.4595006, -0.03886724, -2.140632, 1, 1, 1, 1, 1,
-0.456287, 0.1235614, -1.150086, 1, 1, 1, 1, 1,
-0.4558994, 0.5300382, -1.235216, 1, 1, 1, 1, 1,
-0.4551364, -1.034195, -1.519417, 1, 1, 1, 1, 1,
-0.4546703, 1.156796, 0.8018571, 1, 1, 1, 1, 1,
-0.4536462, 0.8757887, -1.556407, 1, 1, 1, 1, 1,
-0.4536334, 0.01419364, -3.766666, 1, 1, 1, 1, 1,
-0.4510426, 0.5783063, 0.9906136, 1, 1, 1, 1, 1,
-0.4460957, 0.352082, -0.2219082, 0, 0, 1, 1, 1,
-0.4427695, 1.024156, 0.5645492, 1, 0, 0, 1, 1,
-0.4403047, -1.229341, -1.575181, 1, 0, 0, 1, 1,
-0.4390574, 1.085209, -0.05380362, 1, 0, 0, 1, 1,
-0.4367793, -0.7730002, -2.986101, 1, 0, 0, 1, 1,
-0.4348039, 2.510542, 1.044109, 1, 0, 0, 1, 1,
-0.4257864, -1.254784, -2.95887, 0, 0, 0, 1, 1,
-0.4207795, 0.1077327, -1.110251, 0, 0, 0, 1, 1,
-0.4183254, 2.575374, -0.1830837, 0, 0, 0, 1, 1,
-0.4171255, 0.4228659, -2.444668, 0, 0, 0, 1, 1,
-0.4168121, 0.6710416, -1.11999, 0, 0, 0, 1, 1,
-0.4147376, -1.063735, -3.935105, 0, 0, 0, 1, 1,
-0.4134589, -1.060581, -1.526454, 0, 0, 0, 1, 1,
-0.4129695, 1.220579, 0.341089, 1, 1, 1, 1, 1,
-0.4051541, 0.1780479, -3.262255, 1, 1, 1, 1, 1,
-0.4042475, -0.4320282, -2.060017, 1, 1, 1, 1, 1,
-0.3952512, 0.3825159, -0.7641252, 1, 1, 1, 1, 1,
-0.3914818, -0.706319, -2.496618, 1, 1, 1, 1, 1,
-0.3905859, -0.6503129, -2.591641, 1, 1, 1, 1, 1,
-0.3873246, 0.4451667, -0.8739952, 1, 1, 1, 1, 1,
-0.3864228, -1.450804, -3.897511, 1, 1, 1, 1, 1,
-0.3851731, -2.104309, -4.096617, 1, 1, 1, 1, 1,
-0.3848678, -0.0184663, -1.386832, 1, 1, 1, 1, 1,
-0.3843604, -0.8902018, -3.733419, 1, 1, 1, 1, 1,
-0.3833907, -1.230505, -4.428663, 1, 1, 1, 1, 1,
-0.3823926, 2.172289, 1.520371, 1, 1, 1, 1, 1,
-0.3810661, 0.1623685, -2.870079, 1, 1, 1, 1, 1,
-0.3735992, -1.072621, -3.564515, 1, 1, 1, 1, 1,
-0.3662371, 2.05191, 0.9799243, 0, 0, 1, 1, 1,
-0.3617501, -0.01937337, -2.1703, 1, 0, 0, 1, 1,
-0.3606214, -1.918202, -2.871762, 1, 0, 0, 1, 1,
-0.3585987, -0.006125059, -1.214603, 1, 0, 0, 1, 1,
-0.3546818, -0.5832069, -1.540932, 1, 0, 0, 1, 1,
-0.3535016, -1.167996, -2.672833, 1, 0, 0, 1, 1,
-0.3532034, 0.7402522, -0.5808782, 0, 0, 0, 1, 1,
-0.3414485, 0.0657469, -3.205601, 0, 0, 0, 1, 1,
-0.3401761, -0.5912495, -2.560595, 0, 0, 0, 1, 1,
-0.3362899, 0.9739525, -0.343894, 0, 0, 0, 1, 1,
-0.3354278, 1.140713, -0.8782256, 0, 0, 0, 1, 1,
-0.3309699, -0.4537849, -2.473782, 0, 0, 0, 1, 1,
-0.3271216, -0.1547185, -1.795098, 0, 0, 0, 1, 1,
-0.32629, 0.1219432, -1.549804, 1, 1, 1, 1, 1,
-0.3236063, 1.275533, -1.575616, 1, 1, 1, 1, 1,
-0.3224097, 0.6614422, 0.2280551, 1, 1, 1, 1, 1,
-0.3136685, -0.03093464, -2.681896, 1, 1, 1, 1, 1,
-0.3130382, -1.249387, -3.407597, 1, 1, 1, 1, 1,
-0.3094752, -0.6674705, -4.345978, 1, 1, 1, 1, 1,
-0.3075756, 0.5110551, 2.112062, 1, 1, 1, 1, 1,
-0.3074197, 2.267523, 0.7519299, 1, 1, 1, 1, 1,
-0.3057986, 0.1589325, -1.178257, 1, 1, 1, 1, 1,
-0.3012039, -0.4673122, -1.844044, 1, 1, 1, 1, 1,
-0.2988027, 0.41693, -0.4038764, 1, 1, 1, 1, 1,
-0.2953486, 1.022297, -1.309297, 1, 1, 1, 1, 1,
-0.2926612, -1.28901, -3.202652, 1, 1, 1, 1, 1,
-0.2895239, -0.5393491, -1.337998, 1, 1, 1, 1, 1,
-0.2887362, -0.7653572, -2.693652, 1, 1, 1, 1, 1,
-0.2872134, 2.396929, -0.2272115, 0, 0, 1, 1, 1,
-0.2826334, 3.048157, 1.608578, 1, 0, 0, 1, 1,
-0.2823534, 0.7058488, 0.7146547, 1, 0, 0, 1, 1,
-0.2797163, -0.1754197, -1.896119, 1, 0, 0, 1, 1,
-0.2766565, 1.207502, -0.1278029, 1, 0, 0, 1, 1,
-0.2763931, -1.771377, -4.426737, 1, 0, 0, 1, 1,
-0.2747431, 0.5218319, -0.196862, 0, 0, 0, 1, 1,
-0.2724327, -0.1707856, -3.18453, 0, 0, 0, 1, 1,
-0.2689858, -1.336122, -1.522534, 0, 0, 0, 1, 1,
-0.2686158, -0.08611153, -2.069027, 0, 0, 0, 1, 1,
-0.2665697, 0.1328127, -1.424811, 0, 0, 0, 1, 1,
-0.2663558, 0.17235, -0.7760724, 0, 0, 0, 1, 1,
-0.2649463, -1.6743, -1.764258, 0, 0, 0, 1, 1,
-0.2641003, -1.00565, -3.562754, 1, 1, 1, 1, 1,
-0.2583928, -1.303812, -3.301969, 1, 1, 1, 1, 1,
-0.257839, 1.293606, -2.24607, 1, 1, 1, 1, 1,
-0.2527173, -0.7382535, -3.856475, 1, 1, 1, 1, 1,
-0.2517528, 1.612744, 0.05504994, 1, 1, 1, 1, 1,
-0.2497858, 0.09901945, -2.198268, 1, 1, 1, 1, 1,
-0.2453749, 1.037079, 0.4884551, 1, 1, 1, 1, 1,
-0.2412981, -0.2577534, -3.182493, 1, 1, 1, 1, 1,
-0.2405619, 0.0459789, -1.705982, 1, 1, 1, 1, 1,
-0.2352029, -1.290482, -4.318177, 1, 1, 1, 1, 1,
-0.2342457, -1.777886, -3.053441, 1, 1, 1, 1, 1,
-0.2294718, -0.007704149, -1.669939, 1, 1, 1, 1, 1,
-0.2280639, -0.3548167, -4.010702, 1, 1, 1, 1, 1,
-0.227283, 1.04164, -0.2696964, 1, 1, 1, 1, 1,
-0.2230048, -0.6910283, -2.787124, 1, 1, 1, 1, 1,
-0.2209229, -0.7230574, -2.076555, 0, 0, 1, 1, 1,
-0.2172355, -2.020017, -2.84483, 1, 0, 0, 1, 1,
-0.2126019, -0.2224171, -3.527609, 1, 0, 0, 1, 1,
-0.2100003, 0.1263663, -1.548166, 1, 0, 0, 1, 1,
-0.2069736, -2.235709, -3.910814, 1, 0, 0, 1, 1,
-0.2054815, -0.03406181, 0.03210654, 1, 0, 0, 1, 1,
-0.2026707, 0.3428523, -0.396426, 0, 0, 0, 1, 1,
-0.200995, 0.3867692, -0.6240202, 0, 0, 0, 1, 1,
-0.1994655, 0.5157908, -0.8515521, 0, 0, 0, 1, 1,
-0.1993733, -0.1216999, -3.225945, 0, 0, 0, 1, 1,
-0.1948545, 0.4775926, 0.9135751, 0, 0, 0, 1, 1,
-0.1944038, -0.510835, -0.8510184, 0, 0, 0, 1, 1,
-0.1909217, 0.5922116, -1.2219, 0, 0, 0, 1, 1,
-0.1908183, 0.784922, -0.04185554, 1, 1, 1, 1, 1,
-0.1870444, 0.9165074, 1.425253, 1, 1, 1, 1, 1,
-0.182113, 1.382246, -1.911552, 1, 1, 1, 1, 1,
-0.1813066, 2.115869, 0.5061769, 1, 1, 1, 1, 1,
-0.1739551, -0.2058973, -2.79882, 1, 1, 1, 1, 1,
-0.1725635, 1.410877, -0.9606273, 1, 1, 1, 1, 1,
-0.1707436, -0.1689918, -2.736525, 1, 1, 1, 1, 1,
-0.1625336, 0.02715508, -2.98858, 1, 1, 1, 1, 1,
-0.1619531, -0.4715081, -3.276, 1, 1, 1, 1, 1,
-0.1604663, 0.194819, -1.119599, 1, 1, 1, 1, 1,
-0.1599358, -1.356306, -2.96779, 1, 1, 1, 1, 1,
-0.1596301, -0.2396169, -1.997782, 1, 1, 1, 1, 1,
-0.1590256, -0.7466373, -1.807236, 1, 1, 1, 1, 1,
-0.1570712, 1.20865, 0.136294, 1, 1, 1, 1, 1,
-0.155892, -0.6209356, -2.139773, 1, 1, 1, 1, 1,
-0.1550161, -0.2807582, -2.262147, 0, 0, 1, 1, 1,
-0.1516984, -0.7394699, -2.234019, 1, 0, 0, 1, 1,
-0.1480164, -1.39574, -3.250494, 1, 0, 0, 1, 1,
-0.1449446, -1.901138, -2.422233, 1, 0, 0, 1, 1,
-0.144405, 1.067372, 0.05694558, 1, 0, 0, 1, 1,
-0.1439347, 0.6813347, 0.2367599, 1, 0, 0, 1, 1,
-0.1413626, 1.194423, -0.170115, 0, 0, 0, 1, 1,
-0.1385905, -0.08324487, -2.714625, 0, 0, 0, 1, 1,
-0.133718, -1.346212, -4.26973, 0, 0, 0, 1, 1,
-0.1336507, -0.6089467, -2.869212, 0, 0, 0, 1, 1,
-0.1289268, -1.115953, -4.391034, 0, 0, 0, 1, 1,
-0.1264766, 0.8519773, -0.02920265, 0, 0, 0, 1, 1,
-0.1239797, -1.415173, -1.67815, 0, 0, 0, 1, 1,
-0.1210326, -0.1785893, -2.895612, 1, 1, 1, 1, 1,
-0.1147147, -0.9332349, -2.27838, 1, 1, 1, 1, 1,
-0.1012517, -0.0137622, -1.5159, 1, 1, 1, 1, 1,
-0.09818856, -2.294432, -4.693688, 1, 1, 1, 1, 1,
-0.09797125, 1.345737, 0.2366332, 1, 1, 1, 1, 1,
-0.09740766, -1.371516, -2.109704, 1, 1, 1, 1, 1,
-0.0960801, 0.6586134, 0.2325914, 1, 1, 1, 1, 1,
-0.09409516, 1.2783, -1.223333, 1, 1, 1, 1, 1,
-0.09164196, 0.5118033, -0.3384675, 1, 1, 1, 1, 1,
-0.09119799, -0.1075941, -3.422062, 1, 1, 1, 1, 1,
-0.09090659, 0.02996795, 0.4573424, 1, 1, 1, 1, 1,
-0.08592023, 0.339581, 0.2421038, 1, 1, 1, 1, 1,
-0.08505724, -1.299123, -5.114617, 1, 1, 1, 1, 1,
-0.07629877, -0.8465495, -4.015969, 1, 1, 1, 1, 1,
-0.07390606, -0.4675839, -3.635899, 1, 1, 1, 1, 1,
-0.06377334, -0.6906609, -3.3247, 0, 0, 1, 1, 1,
-0.06013331, -1.264653, -3.255171, 1, 0, 0, 1, 1,
-0.05795272, -0.05146955, -2.391516, 1, 0, 0, 1, 1,
-0.05759765, 1.169905, 0.03213766, 1, 0, 0, 1, 1,
-0.05278368, -0.7695931, -1.629224, 1, 0, 0, 1, 1,
-0.05163833, 0.1768479, -0.9333366, 1, 0, 0, 1, 1,
-0.05053465, 0.8571092, 0.2494707, 0, 0, 0, 1, 1,
-0.0449035, -0.1315964, -2.507916, 0, 0, 0, 1, 1,
-0.04368714, -2.225098, -3.815284, 0, 0, 0, 1, 1,
-0.04219824, 0.5707204, -0.2884994, 0, 0, 0, 1, 1,
-0.04206497, -0.7476417, -1.55099, 0, 0, 0, 1, 1,
-0.03637473, -1.921858, -3.78143, 0, 0, 0, 1, 1,
-0.03221941, -0.07944711, -2.771547, 0, 0, 0, 1, 1,
-0.0314073, -1.33678, -4.187068, 1, 1, 1, 1, 1,
-0.03135632, -0.7988269, -2.473333, 1, 1, 1, 1, 1,
-0.01686804, 0.3746709, -0.4426683, 1, 1, 1, 1, 1,
-0.01574327, 0.5205697, -0.4208139, 1, 1, 1, 1, 1,
-0.01342239, -0.8531775, -3.574593, 1, 1, 1, 1, 1,
-0.01287515, -0.07802719, -3.969622, 1, 1, 1, 1, 1,
-0.01277109, 0.7075608, -0.2196909, 1, 1, 1, 1, 1,
-0.01205262, 0.3493297, 0.3807872, 1, 1, 1, 1, 1,
-0.01090364, 0.3192622, 0.2848553, 1, 1, 1, 1, 1,
-0.01075201, 0.3464385, 1.326553, 1, 1, 1, 1, 1,
-0.009877635, -0.1415885, -2.884079, 1, 1, 1, 1, 1,
-0.006786955, 0.5511166, -0.4674757, 1, 1, 1, 1, 1,
-0.005971021, 1.741443, -1.297682, 1, 1, 1, 1, 1,
-0.005111479, 0.900502, -2.114837, 1, 1, 1, 1, 1,
0.00171041, 1.974075, -0.341008, 1, 1, 1, 1, 1,
0.001756259, 1.659987, 1.361494, 0, 0, 1, 1, 1,
0.003496343, -1.970647, 3.848269, 1, 0, 0, 1, 1,
0.008925726, -0.7157814, 3.542463, 1, 0, 0, 1, 1,
0.01284457, -1.396157, 2.683988, 1, 0, 0, 1, 1,
0.01442456, 0.1821472, 1.089812, 1, 0, 0, 1, 1,
0.01512289, 0.168497, 0.3888781, 1, 0, 0, 1, 1,
0.01728926, 0.827113, 0.5844584, 0, 0, 0, 1, 1,
0.01817571, -0.3819114, 4.476068, 0, 0, 0, 1, 1,
0.01994221, 0.5929834, 0.2302986, 0, 0, 0, 1, 1,
0.02036908, -0.5813977, 4.211962, 0, 0, 0, 1, 1,
0.02412511, -1.073529, 1.93327, 0, 0, 0, 1, 1,
0.02779943, 0.4310471, 0.752351, 0, 0, 0, 1, 1,
0.02785183, 0.06885843, 0.4087185, 0, 0, 0, 1, 1,
0.02808307, -0.9018801, 4.101944, 1, 1, 1, 1, 1,
0.03211393, 1.531839, -0.03469597, 1, 1, 1, 1, 1,
0.03560836, 2.495851, -0.5607302, 1, 1, 1, 1, 1,
0.03657891, -1.758838, 3.123758, 1, 1, 1, 1, 1,
0.03694618, 0.472611, 1.73618, 1, 1, 1, 1, 1,
0.04120381, -0.319977, 0.935223, 1, 1, 1, 1, 1,
0.04123137, -0.1095476, 1.933435, 1, 1, 1, 1, 1,
0.0419327, -0.6229371, 1.720841, 1, 1, 1, 1, 1,
0.04312856, 0.492852, 1.861897, 1, 1, 1, 1, 1,
0.04389597, 0.7745996, 0.2283228, 1, 1, 1, 1, 1,
0.04552913, 0.9532778, 0.9665861, 1, 1, 1, 1, 1,
0.04654564, -1.794015, 1.308684, 1, 1, 1, 1, 1,
0.04825579, 0.3070317, 0.654592, 1, 1, 1, 1, 1,
0.0520196, 1.209404, 1.246753, 1, 1, 1, 1, 1,
0.05212563, 0.1606936, 0.9896533, 1, 1, 1, 1, 1,
0.06272721, 0.4178956, -0.1145374, 0, 0, 1, 1, 1,
0.0632173, 0.6614398, -1.229761, 1, 0, 0, 1, 1,
0.06498996, -1.876242, 3.650923, 1, 0, 0, 1, 1,
0.0671052, -0.06528199, 1.406924, 1, 0, 0, 1, 1,
0.06909584, -0.7013676, 1.5943, 1, 0, 0, 1, 1,
0.06914294, -0.2843473, 3.68196, 1, 0, 0, 1, 1,
0.07039663, 1.086466, 1.423595, 0, 0, 0, 1, 1,
0.07159215, 0.6381472, 2.071462, 0, 0, 0, 1, 1,
0.07929206, 0.9640082, 0.8687891, 0, 0, 0, 1, 1,
0.08032445, -0.2690951, 1.732497, 0, 0, 0, 1, 1,
0.08130924, 0.6688163, -1.185145, 0, 0, 0, 1, 1,
0.08154504, 0.8487614, -0.1098321, 0, 0, 0, 1, 1,
0.08754694, -0.5517312, 2.516319, 0, 0, 0, 1, 1,
0.08807626, 1.229291, -0.6345722, 1, 1, 1, 1, 1,
0.09318397, 0.833932, 0.8279307, 1, 1, 1, 1, 1,
0.09377717, -1.529708, 1.422248, 1, 1, 1, 1, 1,
0.0952806, 0.7701211, 1.210367, 1, 1, 1, 1, 1,
0.1030013, 0.9560007, -1.330222, 1, 1, 1, 1, 1,
0.1159588, -0.4200148, 3.998764, 1, 1, 1, 1, 1,
0.1194295, 1.067772, -0.0855509, 1, 1, 1, 1, 1,
0.1202659, 0.3178423, 1.149226, 1, 1, 1, 1, 1,
0.1209289, -0.2258728, 1.445455, 1, 1, 1, 1, 1,
0.1237331, -0.6948797, 2.301841, 1, 1, 1, 1, 1,
0.1265925, -1.172572, 2.633037, 1, 1, 1, 1, 1,
0.1310964, 0.2066381, 1.484409, 1, 1, 1, 1, 1,
0.1359355, 0.4765586, -1.073761, 1, 1, 1, 1, 1,
0.1378412, -1.683609, 3.938356, 1, 1, 1, 1, 1,
0.138617, 1.282113, 0.2738331, 1, 1, 1, 1, 1,
0.1408572, 0.3830717, 1.080699, 0, 0, 1, 1, 1,
0.1409414, -0.8928336, 4.829483, 1, 0, 0, 1, 1,
0.1429224, -0.2042365, 0.6923078, 1, 0, 0, 1, 1,
0.1483681, -2.356421, 2.742424, 1, 0, 0, 1, 1,
0.1548932, -0.5569059, 1.540521, 1, 0, 0, 1, 1,
0.1572169, -0.8571628, 4.566977, 1, 0, 0, 1, 1,
0.157457, 0.5736448, -0.4083776, 0, 0, 0, 1, 1,
0.1576663, 0.222751, 0.3682272, 0, 0, 0, 1, 1,
0.1579807, 0.2981319, 0.8385746, 0, 0, 0, 1, 1,
0.1621162, -0.3852535, 2.039377, 0, 0, 0, 1, 1,
0.1644032, -0.4916249, 1.02191, 0, 0, 0, 1, 1,
0.1687796, 0.6350513, 0.3732664, 0, 0, 0, 1, 1,
0.173117, 0.3947526, -0.2213995, 0, 0, 0, 1, 1,
0.1738228, 0.6092403, 0.7926244, 1, 1, 1, 1, 1,
0.1806891, 0.6025185, 2.524768, 1, 1, 1, 1, 1,
0.1831205, -0.4172132, 1.992559, 1, 1, 1, 1, 1,
0.1831486, -0.4671441, 5.451046, 1, 1, 1, 1, 1,
0.1833568, -1.566146, 5.311444, 1, 1, 1, 1, 1,
0.1835542, 0.3284498, -0.1876104, 1, 1, 1, 1, 1,
0.1847117, 0.8117895, 1.307807, 1, 1, 1, 1, 1,
0.1854319, -1.591149, 2.598906, 1, 1, 1, 1, 1,
0.1872101, -0.9781675, 4.858121, 1, 1, 1, 1, 1,
0.1878717, 1.325403, -0.5302058, 1, 1, 1, 1, 1,
0.1946204, 0.4409794, 1.218452, 1, 1, 1, 1, 1,
0.2070166, 1.810675, 0.3209271, 1, 1, 1, 1, 1,
0.2074452, 1.299937, -1.136721, 1, 1, 1, 1, 1,
0.2140046, -0.7245408, 4.15528, 1, 1, 1, 1, 1,
0.214428, -0.6175883, 1.651525, 1, 1, 1, 1, 1,
0.2173014, 0.4364558, 0.7441841, 0, 0, 1, 1, 1,
0.2326252, 0.9474456, 0.4046392, 1, 0, 0, 1, 1,
0.2357466, -0.9242241, 2.152453, 1, 0, 0, 1, 1,
0.2365706, 0.6879225, 0.3825259, 1, 0, 0, 1, 1,
0.2383601, -0.4038354, 3.171599, 1, 0, 0, 1, 1,
0.2386461, 0.08960796, 0.2144794, 1, 0, 0, 1, 1,
0.2395279, 1.314824, -0.177552, 0, 0, 0, 1, 1,
0.2437252, -0.7862099, 3.274524, 0, 0, 0, 1, 1,
0.2462964, -1.312845, 1.884173, 0, 0, 0, 1, 1,
0.247106, 1.704351, -0.8095046, 0, 0, 0, 1, 1,
0.2518278, 1.644256, -1.12872, 0, 0, 0, 1, 1,
0.2524118, 1.049035, 0.4836299, 0, 0, 0, 1, 1,
0.2528119, -0.8606862, 1.005033, 0, 0, 0, 1, 1,
0.2550279, -0.8617074, 1.627272, 1, 1, 1, 1, 1,
0.2574503, -1.099103, 2.828666, 1, 1, 1, 1, 1,
0.2589374, -0.7298019, 2.670551, 1, 1, 1, 1, 1,
0.2622254, -2.243014, 2.651063, 1, 1, 1, 1, 1,
0.2718797, 0.9669241, -1.161354, 1, 1, 1, 1, 1,
0.2732729, -1.3362, 2.121567, 1, 1, 1, 1, 1,
0.2752918, 1.258873, -0.1164218, 1, 1, 1, 1, 1,
0.2868528, 1.230139, 3.007163, 1, 1, 1, 1, 1,
0.2886268, 1.952407, 0.8174779, 1, 1, 1, 1, 1,
0.292677, 0.592973, 0.4034733, 1, 1, 1, 1, 1,
0.298051, 0.5060464, 2.134139, 1, 1, 1, 1, 1,
0.3009678, 1.539243, 1.431235, 1, 1, 1, 1, 1,
0.3010937, -0.7949086, 2.270892, 1, 1, 1, 1, 1,
0.3066302, 0.3738937, 2.585179, 1, 1, 1, 1, 1,
0.3074093, 0.1858235, -0.4060347, 1, 1, 1, 1, 1,
0.3081057, -0.1571629, 1.357671, 0, 0, 1, 1, 1,
0.3095297, -1.927693, 4.124743, 1, 0, 0, 1, 1,
0.3124217, 1.775931, 1.089525, 1, 0, 0, 1, 1,
0.3166748, -0.2397682, 4.502246, 1, 0, 0, 1, 1,
0.3189256, -1.534755, 1.499753, 1, 0, 0, 1, 1,
0.3250096, 0.965477, 0.4961502, 1, 0, 0, 1, 1,
0.3261791, 1.512268, 1.459123, 0, 0, 0, 1, 1,
0.3267034, -0.2019893, -0.2868282, 0, 0, 0, 1, 1,
0.332482, -0.7812868, 3.146145, 0, 0, 0, 1, 1,
0.3352537, -0.6014065, 3.080581, 0, 0, 0, 1, 1,
0.3353838, -2.563642, 2.975254, 0, 0, 0, 1, 1,
0.3358303, 1.252439, 2.253941, 0, 0, 0, 1, 1,
0.3361754, -0.5381008, 2.276428, 0, 0, 0, 1, 1,
0.3389735, -0.01121886, 2.458848, 1, 1, 1, 1, 1,
0.3437451, 0.2520976, 0.01552381, 1, 1, 1, 1, 1,
0.3451274, -0.393059, 2.22754, 1, 1, 1, 1, 1,
0.3461746, 0.7042541, 0.271938, 1, 1, 1, 1, 1,
0.3540592, 0.05352766, 2.258772, 1, 1, 1, 1, 1,
0.354264, -0.04109942, 1.21238, 1, 1, 1, 1, 1,
0.3552204, 0.705179, 0.865332, 1, 1, 1, 1, 1,
0.3567465, -0.8620392, 1.894191, 1, 1, 1, 1, 1,
0.3596636, 1.022743, -0.2460799, 1, 1, 1, 1, 1,
0.3652092, -0.03964877, 1.034496, 1, 1, 1, 1, 1,
0.3676506, -0.04589504, 1.838254, 1, 1, 1, 1, 1,
0.3690575, 0.2591787, 1.421681, 1, 1, 1, 1, 1,
0.3769523, 2.094642, 1.281289, 1, 1, 1, 1, 1,
0.3770488, 0.9493743, -2.336094, 1, 1, 1, 1, 1,
0.3801289, -0.5182583, -0.3911461, 1, 1, 1, 1, 1,
0.3808486, -2.169817, 1.100219, 0, 0, 1, 1, 1,
0.3822477, 1.013592, -0.6245558, 1, 0, 0, 1, 1,
0.3827343, -0.2109253, 3.791218, 1, 0, 0, 1, 1,
0.3850651, -0.9674997, 2.79159, 1, 0, 0, 1, 1,
0.3855353, 1.780052, -0.38467, 1, 0, 0, 1, 1,
0.3863064, 1.128791, 0.8977184, 1, 0, 0, 1, 1,
0.386365, -1.261654, 1.925756, 0, 0, 0, 1, 1,
0.3871035, -0.7842629, 2.703105, 0, 0, 0, 1, 1,
0.3882347, -1.529567, 3.484138, 0, 0, 0, 1, 1,
0.3907067, 0.3114556, 0.1237973, 0, 0, 0, 1, 1,
0.3921311, -0.5647635, 3.603991, 0, 0, 0, 1, 1,
0.3926086, 0.7052532, 0.2325638, 0, 0, 0, 1, 1,
0.3958576, 1.133751, 0.09109625, 0, 0, 0, 1, 1,
0.3975344, 0.4672589, -1.17776, 1, 1, 1, 1, 1,
0.4023011, 0.151244, 2.116663, 1, 1, 1, 1, 1,
0.4028557, -1.504475, 1.769729, 1, 1, 1, 1, 1,
0.4055689, -0.04132732, 1.223592, 1, 1, 1, 1, 1,
0.4055757, 0.5713718, -0.210791, 1, 1, 1, 1, 1,
0.4060465, 1.140891, 0.1866709, 1, 1, 1, 1, 1,
0.4062682, 0.2729954, 1.918217, 1, 1, 1, 1, 1,
0.4084815, 0.1083784, -0.7637513, 1, 1, 1, 1, 1,
0.4092482, -0.8676848, 4.013542, 1, 1, 1, 1, 1,
0.4097857, 0.1135537, 0.3636287, 1, 1, 1, 1, 1,
0.4219669, 0.610706, 1.282752, 1, 1, 1, 1, 1,
0.4229898, -0.1386383, 0.7196087, 1, 1, 1, 1, 1,
0.4241344, -1.864848, 2.072522, 1, 1, 1, 1, 1,
0.425997, 0.05184683, 2.065304, 1, 1, 1, 1, 1,
0.426553, 1.175564, -2.180394, 1, 1, 1, 1, 1,
0.4295346, 0.2331044, 1.997867, 0, 0, 1, 1, 1,
0.4299959, -1.33169, 3.45565, 1, 0, 0, 1, 1,
0.4398722, -1.274009, 1.847239, 1, 0, 0, 1, 1,
0.4470338, 0.6612022, 0.03771588, 1, 0, 0, 1, 1,
0.448561, -2.864398, 2.006718, 1, 0, 0, 1, 1,
0.449636, -2.55592, 2.964908, 1, 0, 0, 1, 1,
0.4514316, -0.1920064, 1.229643, 0, 0, 0, 1, 1,
0.456422, -0.4507062, 2.323007, 0, 0, 0, 1, 1,
0.4580189, 2.044096, 0.05470219, 0, 0, 0, 1, 1,
0.4592299, 0.128031, 2.213757, 0, 0, 0, 1, 1,
0.460372, 1.841517, 1.27249, 0, 0, 0, 1, 1,
0.460473, 0.5807622, 0.7933418, 0, 0, 0, 1, 1,
0.4627877, -0.3737027, 1.853139, 0, 0, 0, 1, 1,
0.464203, 2.326931, -0.4377326, 1, 1, 1, 1, 1,
0.4649534, -0.6886763, 1.965035, 1, 1, 1, 1, 1,
0.4675165, 0.2820343, 1.237467, 1, 1, 1, 1, 1,
0.468698, -0.8194192, 1.620967, 1, 1, 1, 1, 1,
0.4741543, -0.3322914, 1.413564, 1, 1, 1, 1, 1,
0.4769695, 0.600515, -1.212156, 1, 1, 1, 1, 1,
0.4793457, -1.479693, 3.417094, 1, 1, 1, 1, 1,
0.4809768, 0.6475806, 0.7532827, 1, 1, 1, 1, 1,
0.4813103, 0.1669598, 1.924354, 1, 1, 1, 1, 1,
0.48371, 0.1650061, 2.766931, 1, 1, 1, 1, 1,
0.4864002, 0.3505305, 2.54916, 1, 1, 1, 1, 1,
0.4875547, 0.4069163, -1.478436, 1, 1, 1, 1, 1,
0.4915319, -0.678185, 3.398668, 1, 1, 1, 1, 1,
0.5013663, -0.8675428, 4.329102, 1, 1, 1, 1, 1,
0.5045139, 0.2050758, -0.1052117, 1, 1, 1, 1, 1,
0.5054102, -0.2408707, 1.490294, 0, 0, 1, 1, 1,
0.5068888, 2.17812, 0.548466, 1, 0, 0, 1, 1,
0.508619, 0.4341893, 1.206099, 1, 0, 0, 1, 1,
0.5102407, 0.1941399, 4.003006, 1, 0, 0, 1, 1,
0.5136693, 0.2655349, -0.1082598, 1, 0, 0, 1, 1,
0.5169843, -0.1085618, 1.700602, 1, 0, 0, 1, 1,
0.5195132, 0.2289945, 0.1050522, 0, 0, 0, 1, 1,
0.5289404, 0.5250775, 0.05964707, 0, 0, 0, 1, 1,
0.5317375, 1.167024, 0.9945918, 0, 0, 0, 1, 1,
0.5325043, 0.5278107, 0.2141685, 0, 0, 0, 1, 1,
0.532629, -0.7558835, 1.965727, 0, 0, 0, 1, 1,
0.5331175, 0.4972761, 0.6434516, 0, 0, 0, 1, 1,
0.5388341, 1.155866, 1.212351, 0, 0, 0, 1, 1,
0.5392498, 1.1941, 2.02692, 1, 1, 1, 1, 1,
0.5427989, -0.08984072, 1.991373, 1, 1, 1, 1, 1,
0.5462499, 0.03782424, 0.1512737, 1, 1, 1, 1, 1,
0.5471182, -1.125022, 1.001816, 1, 1, 1, 1, 1,
0.5500854, -0.5473021, 3.304615, 1, 1, 1, 1, 1,
0.5523825, -0.06279736, 0.8683321, 1, 1, 1, 1, 1,
0.5549575, 0.08599355, 1.896288, 1, 1, 1, 1, 1,
0.5641099, 0.173471, 0.1723531, 1, 1, 1, 1, 1,
0.5650579, 0.7297477, -0.2011763, 1, 1, 1, 1, 1,
0.5653934, -0.1113791, 1.310667, 1, 1, 1, 1, 1,
0.5659075, 1.420655, 1.356075, 1, 1, 1, 1, 1,
0.5753466, 0.7599977, 0.3266191, 1, 1, 1, 1, 1,
0.5761654, 0.03170975, 3.496428, 1, 1, 1, 1, 1,
0.5802744, 0.640399, 0.1668134, 1, 1, 1, 1, 1,
0.5884209, 0.273384, -0.7089419, 1, 1, 1, 1, 1,
0.589951, -0.9300369, 1.018706, 0, 0, 1, 1, 1,
0.5899543, -1.065944, 2.86116, 1, 0, 0, 1, 1,
0.5953555, -2.152132, 3.242316, 1, 0, 0, 1, 1,
0.5998733, 0.2228774, 0.8731554, 1, 0, 0, 1, 1,
0.6014045, -2.282898, 2.35126, 1, 0, 0, 1, 1,
0.6017343, 0.4563704, 0.6125133, 1, 0, 0, 1, 1,
0.6017957, 1.272694, 2.544196, 0, 0, 0, 1, 1,
0.6024205, -0.4548596, 2.47758, 0, 0, 0, 1, 1,
0.6024273, 0.8466871, 0.3657111, 0, 0, 0, 1, 1,
0.604166, -2.110181, 2.01425, 0, 0, 0, 1, 1,
0.6066741, 0.3197051, 1.735483, 0, 0, 0, 1, 1,
0.6107509, -1.050761, 3.020979, 0, 0, 0, 1, 1,
0.6114388, -0.3268163, 1.647539, 0, 0, 0, 1, 1,
0.6179531, -1.66696, 2.787648, 1, 1, 1, 1, 1,
0.6187235, 1.218429, -0.6623704, 1, 1, 1, 1, 1,
0.6188715, 1.059456, 1.638725, 1, 1, 1, 1, 1,
0.6231949, -1.024734, 1.798627, 1, 1, 1, 1, 1,
0.6240931, 0.2756289, 0.2480953, 1, 1, 1, 1, 1,
0.6287119, -0.1722726, 2.620604, 1, 1, 1, 1, 1,
0.632149, 0.6995974, 1.148311, 1, 1, 1, 1, 1,
0.6377824, 1.787545, 1.063085, 1, 1, 1, 1, 1,
0.6407944, 0.5414768, 0.93076, 1, 1, 1, 1, 1,
0.6425871, 0.2522452, 1.179971, 1, 1, 1, 1, 1,
0.6438524, 2.529193, 0.7882817, 1, 1, 1, 1, 1,
0.6473961, 0.2063909, 1.198713, 1, 1, 1, 1, 1,
0.6484408, -0.6602355, 2.318147, 1, 1, 1, 1, 1,
0.654823, -0.2662787, 1.411321, 1, 1, 1, 1, 1,
0.6619335, -0.5679578, 2.849057, 1, 1, 1, 1, 1,
0.6636554, 0.1739805, 2.089462, 0, 0, 1, 1, 1,
0.6646753, -0.3170383, 4.642334, 1, 0, 0, 1, 1,
0.6697724, 0.2423837, 1.652303, 1, 0, 0, 1, 1,
0.669997, 2.049076, 0.03304939, 1, 0, 0, 1, 1,
0.6727374, -0.784162, 3.215769, 1, 0, 0, 1, 1,
0.6772161, -2.626543, 2.655926, 1, 0, 0, 1, 1,
0.6814128, 0.3553805, 2.331734, 0, 0, 0, 1, 1,
0.6818018, -0.2191319, 0.9332148, 0, 0, 0, 1, 1,
0.6827995, 0.2892475, -1.168688, 0, 0, 0, 1, 1,
0.6829427, -1.07776, 1.04926, 0, 0, 0, 1, 1,
0.6829628, -0.2655587, 1.079745, 0, 0, 0, 1, 1,
0.6845843, 0.321352, 0.9307387, 0, 0, 0, 1, 1,
0.6862152, -0.2757369, 2.56573, 0, 0, 0, 1, 1,
0.6865413, 0.2841555, 1.122132, 1, 1, 1, 1, 1,
0.6865426, -1.876535, 1.944488, 1, 1, 1, 1, 1,
0.688645, 0.5222204, 1.243732, 1, 1, 1, 1, 1,
0.6896067, 1.248023, 1.581645, 1, 1, 1, 1, 1,
0.693173, -0.5161927, 1.604814, 1, 1, 1, 1, 1,
0.7048135, -0.6322178, 2.798676, 1, 1, 1, 1, 1,
0.7060466, -1.121177, 2.388794, 1, 1, 1, 1, 1,
0.7069519, -0.5661343, 1.586923, 1, 1, 1, 1, 1,
0.7095452, 1.521522, 0.956372, 1, 1, 1, 1, 1,
0.7104779, 2.06499, 0.945599, 1, 1, 1, 1, 1,
0.7149681, -0.2480882, 3.360744, 1, 1, 1, 1, 1,
0.7159122, 0.4949913, 0.5385776, 1, 1, 1, 1, 1,
0.7293225, -0.3702594, 1.510456, 1, 1, 1, 1, 1,
0.7296042, 0.4260218, -0.007968265, 1, 1, 1, 1, 1,
0.7312356, 0.1319787, 1.74861, 1, 1, 1, 1, 1,
0.7369576, -0.633094, 1.403234, 0, 0, 1, 1, 1,
0.7404522, 2.062114, 0.7164267, 1, 0, 0, 1, 1,
0.7435662, -0.6403972, 1.506791, 1, 0, 0, 1, 1,
0.7446481, -0.990974, 3.402521, 1, 0, 0, 1, 1,
0.7465867, 0.204555, 1.562973, 1, 0, 0, 1, 1,
0.7485251, -0.5737133, 1.303391, 1, 0, 0, 1, 1,
0.7509073, -1.593854, 3.411184, 0, 0, 0, 1, 1,
0.7516724, 1.493403, -0.7549054, 0, 0, 0, 1, 1,
0.7548968, -0.127098, 1.534977, 0, 0, 0, 1, 1,
0.7566732, 1.446637, 0.2823777, 0, 0, 0, 1, 1,
0.7608368, 0.1599347, 1.82267, 0, 0, 0, 1, 1,
0.7611181, 1.277809, 0.75638, 0, 0, 0, 1, 1,
0.7640547, -0.4823231, 4.135105, 0, 0, 0, 1, 1,
0.7653782, 1.147518, 1.521358, 1, 1, 1, 1, 1,
0.7688755, 1.080048, -0.06407811, 1, 1, 1, 1, 1,
0.7707692, 1.161499, 0.6761323, 1, 1, 1, 1, 1,
0.7855802, -1.515866, 1.860266, 1, 1, 1, 1, 1,
0.790274, -1.309007, 3.820014, 1, 1, 1, 1, 1,
0.7905238, -0.2950802, 2.088109, 1, 1, 1, 1, 1,
0.7938983, 0.7796004, -0.4143843, 1, 1, 1, 1, 1,
0.7974262, 0.8344371, 2.472119, 1, 1, 1, 1, 1,
0.7988791, 0.0383672, 1.325434, 1, 1, 1, 1, 1,
0.7995501, 0.004725485, 1.29551, 1, 1, 1, 1, 1,
0.8009925, -2.627938, 2.396914, 1, 1, 1, 1, 1,
0.8055819, 1.91179, 1.152487, 1, 1, 1, 1, 1,
0.8096697, -1.089163, 4.003943, 1, 1, 1, 1, 1,
0.8098083, -1.357767, 2.136145, 1, 1, 1, 1, 1,
0.8098515, -0.5761312, 2.699548, 1, 1, 1, 1, 1,
0.8103295, 0.558862, 1.759878, 0, 0, 1, 1, 1,
0.8157747, 0.2106148, 2.825026, 1, 0, 0, 1, 1,
0.8172538, -1.015478, 1.772046, 1, 0, 0, 1, 1,
0.8280751, 0.8163043, 0.8520384, 1, 0, 0, 1, 1,
0.8327816, -0.9477499, 3.486975, 1, 0, 0, 1, 1,
0.8354519, 0.4559554, 1.239678, 1, 0, 0, 1, 1,
0.8381529, -0.7435262, 2.044546, 0, 0, 0, 1, 1,
0.8398846, -0.7800174, 2.134941, 0, 0, 0, 1, 1,
0.8420294, 0.05629575, 0.4429396, 0, 0, 0, 1, 1,
0.8435355, -0.825559, -0.09121417, 0, 0, 0, 1, 1,
0.8458229, 0.02662464, 0.4449554, 0, 0, 0, 1, 1,
0.8490709, 0.3185318, -0.1223076, 0, 0, 0, 1, 1,
0.8492689, -0.3870022, 2.827009, 0, 0, 0, 1, 1,
0.8530769, -0.8254938, 3.00226, 1, 1, 1, 1, 1,
0.8536798, -0.3289855, 3.180575, 1, 1, 1, 1, 1,
0.8578508, -0.06329466, 0.880496, 1, 1, 1, 1, 1,
0.8647749, -0.5738272, 1.392838, 1, 1, 1, 1, 1,
0.8679479, 0.6660956, 1.212807, 1, 1, 1, 1, 1,
0.8697624, 0.505814, 0.8027753, 1, 1, 1, 1, 1,
0.8703933, -1.99032, 2.031842, 1, 1, 1, 1, 1,
0.870948, 0.6173431, 0.4097944, 1, 1, 1, 1, 1,
0.8720926, -0.003942745, 4.229135, 1, 1, 1, 1, 1,
0.8725816, 0.2386675, 1.18667, 1, 1, 1, 1, 1,
0.8865066, -1.766025, 2.110684, 1, 1, 1, 1, 1,
0.8885368, -0.9197379, 3.46364, 1, 1, 1, 1, 1,
0.8885408, -0.9488086, 3.24411, 1, 1, 1, 1, 1,
0.8943894, 1.545086, 0.7992135, 1, 1, 1, 1, 1,
0.9000145, 0.1034658, -0.7642607, 1, 1, 1, 1, 1,
0.9026309, -0.2824568, 1.16643, 0, 0, 1, 1, 1,
0.9094834, 0.4946116, 1.61005, 1, 0, 0, 1, 1,
0.9161074, 1.082327, 0.379653, 1, 0, 0, 1, 1,
0.9168909, 1.680104, -0.08024832, 1, 0, 0, 1, 1,
0.9230711, -1.243755, 1.917405, 1, 0, 0, 1, 1,
0.9258645, 0.6354678, 2.948261, 1, 0, 0, 1, 1,
0.9267197, 0.5265532, 1.012848, 0, 0, 0, 1, 1,
0.9276848, 0.03493552, 2.073376, 0, 0, 0, 1, 1,
0.9345347, 0.3541353, 1.309112, 0, 0, 0, 1, 1,
0.9361973, -1.497541, 2.346574, 0, 0, 0, 1, 1,
0.9365038, -0.271412, 1.472165, 0, 0, 0, 1, 1,
0.9388711, -1.624273, 2.836281, 0, 0, 0, 1, 1,
0.9405478, 0.3436953, 0.6287773, 0, 0, 0, 1, 1,
0.9407301, 0.3693724, 3.274521, 1, 1, 1, 1, 1,
0.9439819, -0.5200658, 0.191012, 1, 1, 1, 1, 1,
0.9451217, 0.1646895, 2.562774, 1, 1, 1, 1, 1,
0.9571023, -0.2673318, 1.902264, 1, 1, 1, 1, 1,
0.9587122, 0.4939475, 1.408481, 1, 1, 1, 1, 1,
0.9719728, -1.206059, 1.451727, 1, 1, 1, 1, 1,
0.9878735, 2.326281, 2.778692, 1, 1, 1, 1, 1,
0.9928377, 0.6433073, 1.222744, 1, 1, 1, 1, 1,
0.9939463, 1.091869, -0.9291232, 1, 1, 1, 1, 1,
0.9984008, 1.074145, 2.297559, 1, 1, 1, 1, 1,
0.9989494, 0.7384611, 1.331792, 1, 1, 1, 1, 1,
1.002267, 0.5143148, 0.8687188, 1, 1, 1, 1, 1,
1.009042, -1.61266, 2.054507, 1, 1, 1, 1, 1,
1.010881, 1.345724, -0.6870774, 1, 1, 1, 1, 1,
1.011257, 0.6109529, 0.1559637, 1, 1, 1, 1, 1,
1.013013, 1.916395, 0.7047288, 0, 0, 1, 1, 1,
1.014895, -0.09078548, 1.971961, 1, 0, 0, 1, 1,
1.023372, 0.002256079, 2.563962, 1, 0, 0, 1, 1,
1.024009, 0.3094308, 2.101341, 1, 0, 0, 1, 1,
1.026456, 1.469843, -1.578211, 1, 0, 0, 1, 1,
1.031471, -1.826005, 0.6713627, 1, 0, 0, 1, 1,
1.035013, -0.1975356, 3.286079, 0, 0, 0, 1, 1,
1.038083, -0.1989326, 0.716192, 0, 0, 0, 1, 1,
1.038532, -0.1867499, 2.723879, 0, 0, 0, 1, 1,
1.045741, -1.373467, -0.5653884, 0, 0, 0, 1, 1,
1.059475, -0.9355384, 2.885851, 0, 0, 0, 1, 1,
1.06148, 0.5357392, 1.025449, 0, 0, 0, 1, 1,
1.062945, 1.540064, -1.527121, 0, 0, 0, 1, 1,
1.069061, 0.7299849, 0.4979168, 1, 1, 1, 1, 1,
1.073089, 1.015589, -0.9212756, 1, 1, 1, 1, 1,
1.075067, -0.8174324, 3.124264, 1, 1, 1, 1, 1,
1.083941, -0.8842583, 3.766834, 1, 1, 1, 1, 1,
1.088737, 0.2465065, 1.362432, 1, 1, 1, 1, 1,
1.089815, -0.9177085, 3.417435, 1, 1, 1, 1, 1,
1.106151, -0.08082876, 0.4848451, 1, 1, 1, 1, 1,
1.112918, 0.8056647, 0.3331626, 1, 1, 1, 1, 1,
1.117717, 0.4228293, 2.437837, 1, 1, 1, 1, 1,
1.135129, -1.382007, 2.933488, 1, 1, 1, 1, 1,
1.13624, -1.176583, 1.689683, 1, 1, 1, 1, 1,
1.139112, 0.248882, 1.614256, 1, 1, 1, 1, 1,
1.140592, -0.1056479, 2.230195, 1, 1, 1, 1, 1,
1.142162, -0.7516414, 1.739878, 1, 1, 1, 1, 1,
1.142817, 0.6176564, -0.1032825, 1, 1, 1, 1, 1,
1.143871, 0.4951982, 1.416833, 0, 0, 1, 1, 1,
1.149219, -1.124408, 3.181676, 1, 0, 0, 1, 1,
1.150708, -0.4393947, 2.352916, 1, 0, 0, 1, 1,
1.156579, 0.01652228, -1.950271, 1, 0, 0, 1, 1,
1.156886, 2.066995, 0.005604289, 1, 0, 0, 1, 1,
1.159408, 0.4993579, 1.086889, 1, 0, 0, 1, 1,
1.172741, -2.338806, 3.167286, 0, 0, 0, 1, 1,
1.185362, -1.086412, 3.641291, 0, 0, 0, 1, 1,
1.191066, -0.5952199, 1.07714, 0, 0, 0, 1, 1,
1.197103, -0.151563, 2.153566, 0, 0, 0, 1, 1,
1.199303, -0.3603481, 1.47375, 0, 0, 0, 1, 1,
1.199929, -0.4748307, 0.9786453, 0, 0, 0, 1, 1,
1.201173, -0.09295549, 2.403842, 0, 0, 0, 1, 1,
1.204541, -0.4950115, 2.311979, 1, 1, 1, 1, 1,
1.205353, 1.006388, 1.454088, 1, 1, 1, 1, 1,
1.209223, -0.6060727, 0.2302763, 1, 1, 1, 1, 1,
1.212382, -0.7470484, 0.1761381, 1, 1, 1, 1, 1,
1.212446, 0.4680682, 0.348235, 1, 1, 1, 1, 1,
1.214417, -1.004809, 2.849168, 1, 1, 1, 1, 1,
1.215234, -0.1585686, 2.073416, 1, 1, 1, 1, 1,
1.221767, -0.3280025, 1.453847, 1, 1, 1, 1, 1,
1.221944, 1.168057, 0.2935467, 1, 1, 1, 1, 1,
1.22374, -0.2355235, 1.621018, 1, 1, 1, 1, 1,
1.225514, -0.0924366, 0.1961921, 1, 1, 1, 1, 1,
1.227999, 0.07164679, 1.756793, 1, 1, 1, 1, 1,
1.23001, 0.06183589, 1.309614, 1, 1, 1, 1, 1,
1.231694, 0.07515552, 3.616643, 1, 1, 1, 1, 1,
1.232638, -0.02483508, 0.7154905, 1, 1, 1, 1, 1,
1.23916, 1.245419, 0.1781262, 0, 0, 1, 1, 1,
1.240407, -0.4291072, 1.911378, 1, 0, 0, 1, 1,
1.253435, 0.3122732, 0.7548563, 1, 0, 0, 1, 1,
1.255851, -0.6711391, 3.174515, 1, 0, 0, 1, 1,
1.261634, -1.723497, 2.967318, 1, 0, 0, 1, 1,
1.261949, 1.2868, 0.3147942, 1, 0, 0, 1, 1,
1.276951, -0.2312156, 1.03879, 0, 0, 0, 1, 1,
1.279502, -0.2049383, 1.359579, 0, 0, 0, 1, 1,
1.283891, -0.64184, 1.436743, 0, 0, 0, 1, 1,
1.289541, -0.1859945, 0.3872939, 0, 0, 0, 1, 1,
1.29821, 0.3176629, 1.027267, 0, 0, 0, 1, 1,
1.301671, 0.5024897, -0.2866046, 0, 0, 0, 1, 1,
1.301857, -0.3180459, 4.005409, 0, 0, 0, 1, 1,
1.307472, 2.595045, 2.52402, 1, 1, 1, 1, 1,
1.312613, -0.1134852, 2.361215, 1, 1, 1, 1, 1,
1.335341, -2.206998, 1.062368, 1, 1, 1, 1, 1,
1.34252, -0.2252831, 1.197224, 1, 1, 1, 1, 1,
1.347062, 2.682372, 0.8037397, 1, 1, 1, 1, 1,
1.354238, 0.7032394, 0.8898286, 1, 1, 1, 1, 1,
1.362428, 1.144807, 0.4981407, 1, 1, 1, 1, 1,
1.367894, 1.582959, 0.968834, 1, 1, 1, 1, 1,
1.368554, -0.6186805, 2.709887, 1, 1, 1, 1, 1,
1.372847, -0.09855677, 0.6326168, 1, 1, 1, 1, 1,
1.382085, 0.3359174, -0.6266149, 1, 1, 1, 1, 1,
1.383404, -0.6076434, 0.9082038, 1, 1, 1, 1, 1,
1.393077, 1.095531, 0.7648931, 1, 1, 1, 1, 1,
1.393999, -1.878955, 3.092668, 1, 1, 1, 1, 1,
1.406821, 0.9717363, 1.172329, 1, 1, 1, 1, 1,
1.419024, -0.2525213, 3.283258, 0, 0, 1, 1, 1,
1.425504, -0.2968914, 1.27169, 1, 0, 0, 1, 1,
1.434941, -0.3012586, 1.390219, 1, 0, 0, 1, 1,
1.458967, 3.459987, 0.5777996, 1, 0, 0, 1, 1,
1.468026, -0.8793083, 0.2380477, 1, 0, 0, 1, 1,
1.471708, 1.103761, -0.06877871, 1, 0, 0, 1, 1,
1.485287, 0.9769039, 0.4432718, 0, 0, 0, 1, 1,
1.489229, -0.9882821, 1.349465, 0, 0, 0, 1, 1,
1.495895, -1.023022, 3.416805, 0, 0, 0, 1, 1,
1.496264, -0.74949, 2.298904, 0, 0, 0, 1, 1,
1.513536, -0.5726501, 0.7245719, 0, 0, 0, 1, 1,
1.519117, 1.850528, 1.093805, 0, 0, 0, 1, 1,
1.521458, 0.953021, 1.417425, 0, 0, 0, 1, 1,
1.534768, -0.1403655, 1.134641, 1, 1, 1, 1, 1,
1.545188, 0.7996601, 1.569558, 1, 1, 1, 1, 1,
1.551129, 0.4979915, -0.2149886, 1, 1, 1, 1, 1,
1.552695, -1.907309, 2.331429, 1, 1, 1, 1, 1,
1.580313, -1.461669, 4.814061, 1, 1, 1, 1, 1,
1.595635, 0.3557137, 0.9055879, 1, 1, 1, 1, 1,
1.610255, -0.3461355, 2.679554, 1, 1, 1, 1, 1,
1.621345, -0.46933, 1.179896, 1, 1, 1, 1, 1,
1.62617, 0.6410358, 2.511129, 1, 1, 1, 1, 1,
1.640312, 1.019638, 0.3137539, 1, 1, 1, 1, 1,
1.650631, -0.1644016, 3.208927, 1, 1, 1, 1, 1,
1.654126, -1.066364, 2.577538, 1, 1, 1, 1, 1,
1.662769, 0.02572803, 0.6613158, 1, 1, 1, 1, 1,
1.666368, -1.256895, 2.784882, 1, 1, 1, 1, 1,
1.678345, -0.1959411, 2.315981, 1, 1, 1, 1, 1,
1.694379, -1.313347, 1.664593, 0, 0, 1, 1, 1,
1.705449, -1.483903, 1.392678, 1, 0, 0, 1, 1,
1.715959, -3.469534, 3.414255, 1, 0, 0, 1, 1,
1.720646, 1.560021, 1.860556, 1, 0, 0, 1, 1,
1.745779, -0.6756282, 1.631736, 1, 0, 0, 1, 1,
1.749532, 1.548841, 1.751893, 1, 0, 0, 1, 1,
1.752141, 0.8679151, 1.775493, 0, 0, 0, 1, 1,
1.762025, -0.1404113, 2.127715, 0, 0, 0, 1, 1,
1.776026, 0.7012359, 0.6557444, 0, 0, 0, 1, 1,
1.793847, -3.081589, 2.875288, 0, 0, 0, 1, 1,
1.826289, 0.8912258, 0.8670605, 0, 0, 0, 1, 1,
1.826779, 0.4951566, 2.47001, 0, 0, 0, 1, 1,
1.859508, 0.8626867, 3.344172, 0, 0, 0, 1, 1,
1.871603, -0.5135368, 2.28674, 1, 1, 1, 1, 1,
1.885767, 0.3329505, 2.252384, 1, 1, 1, 1, 1,
1.902681, -0.7784017, 2.27975, 1, 1, 1, 1, 1,
1.907141, -1.742994, 0.6859304, 1, 1, 1, 1, 1,
1.918002, 0.5249977, 1.180724, 1, 1, 1, 1, 1,
1.941852, 0.7736636, 2.544674, 1, 1, 1, 1, 1,
1.945918, 1.070507, -0.3793893, 1, 1, 1, 1, 1,
1.958396, 1.441751, -0.08263608, 1, 1, 1, 1, 1,
1.977482, -0.8584244, 1.2448, 1, 1, 1, 1, 1,
1.995133, 1.142334, 1.123777, 1, 1, 1, 1, 1,
2.041025, -1.32247, -0.01305799, 1, 1, 1, 1, 1,
2.046394, -0.4612622, 1.061446, 1, 1, 1, 1, 1,
2.052103, 0.3272274, 1.155442, 1, 1, 1, 1, 1,
2.0573, -0.4966477, 1.402066, 1, 1, 1, 1, 1,
2.100032, -0.8663542, 2.443617, 1, 1, 1, 1, 1,
2.138614, 0.1905497, 0.6292785, 0, 0, 1, 1, 1,
2.156938, 0.7041688, 3.52579, 1, 0, 0, 1, 1,
2.173002, -0.4645714, 2.271799, 1, 0, 0, 1, 1,
2.183606, 0.3893452, 3.921541, 1, 0, 0, 1, 1,
2.197439, 0.2952066, 1.092469, 1, 0, 0, 1, 1,
2.259805, 0.5351239, 1.172563, 1, 0, 0, 1, 1,
2.272933, -0.4450825, 2.693718, 0, 0, 0, 1, 1,
2.328544, -2.298713, 1.176536, 0, 0, 0, 1, 1,
2.348234, -0.703645, 1.468563, 0, 0, 0, 1, 1,
2.354031, -0.9534808, 3.157283, 0, 0, 0, 1, 1,
2.461265, -1.303985, 1.720569, 0, 0, 0, 1, 1,
2.535581, -1.640144, 1.483174, 0, 0, 0, 1, 1,
2.551159, -0.5273252, 1.700295, 0, 0, 0, 1, 1,
2.690982, -2.185205, 1.94643, 1, 1, 1, 1, 1,
2.703494, 0.6997665, 1.74183, 1, 1, 1, 1, 1,
2.731158, -1.527748, 1.103552, 1, 1, 1, 1, 1,
2.819767, -0.1010485, 2.133534, 1, 1, 1, 1, 1,
3.110401, 1.082764, 2.985375, 1, 1, 1, 1, 1,
3.41847, 1.58736, 0.8449919, 1, 1, 1, 1, 1,
4.074449, -0.6877737, 1.077611, 1, 1, 1, 1, 1
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
var radius = 9.922898;
var distance = 34.85376;
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
mvMatrix.translate( -0.5999939, 0.004773617, -0.01518583 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.85376);
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
