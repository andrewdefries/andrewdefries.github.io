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
-2.946816, 1.423154, -1.00235, 1, 0, 0, 1,
-2.695182, -0.0863285, -2.306658, 1, 0.007843138, 0, 1,
-2.472792, 0.2553821, -1.632404, 1, 0.01176471, 0, 1,
-2.456673, -0.2475851, -0.6105014, 1, 0.01960784, 0, 1,
-2.447953, 1.047004, -0.5206131, 1, 0.02352941, 0, 1,
-2.390424, 1.158389, -1.293317, 1, 0.03137255, 0, 1,
-2.379035, 0.1696055, -2.306946, 1, 0.03529412, 0, 1,
-2.366084, -1.138449, -1.786403, 1, 0.04313726, 0, 1,
-2.33154, -0.04171624, -1.419096, 1, 0.04705882, 0, 1,
-2.31038, -0.7705747, -3.96417, 1, 0.05490196, 0, 1,
-2.259212, -0.6540276, -2.573392, 1, 0.05882353, 0, 1,
-2.233207, -2.227906, -2.059829, 1, 0.06666667, 0, 1,
-2.181383, 0.7685282, -0.113674, 1, 0.07058824, 0, 1,
-2.132793, -0.1456793, -2.163309, 1, 0.07843138, 0, 1,
-2.069136, 1.327962, 0.467414, 1, 0.08235294, 0, 1,
-2.066971, 0.8105928, -3.206861, 1, 0.09019608, 0, 1,
-1.996733, 0.2297325, -0.5920395, 1, 0.09411765, 0, 1,
-1.949606, -0.08734862, -2.873352, 1, 0.1019608, 0, 1,
-1.93631, 0.6194673, -1.792285, 1, 0.1098039, 0, 1,
-1.935533, 0.644334, -0.1264013, 1, 0.1137255, 0, 1,
-1.930826, -0.2709856, -1.727326, 1, 0.1215686, 0, 1,
-1.919079, 0.06264835, -2.152326, 1, 0.1254902, 0, 1,
-1.889189, 0.4756328, -1.824587, 1, 0.1333333, 0, 1,
-1.844724, 0.6968029, -0.4263331, 1, 0.1372549, 0, 1,
-1.841154, 0.3860084, 0.3470164, 1, 0.145098, 0, 1,
-1.83427, -2.031236, -2.847492, 1, 0.1490196, 0, 1,
-1.804075, -0.9360582, -3.496419, 1, 0.1568628, 0, 1,
-1.793768, -0.6200164, -0.9559259, 1, 0.1607843, 0, 1,
-1.790589, 1.474015, -1.734073, 1, 0.1686275, 0, 1,
-1.780229, 0.4351088, -3.993508, 1, 0.172549, 0, 1,
-1.756512, 0.03072636, 0.7491699, 1, 0.1803922, 0, 1,
-1.752163, -1.02372, -2.874968, 1, 0.1843137, 0, 1,
-1.749385, 1.353172, -1.067828, 1, 0.1921569, 0, 1,
-1.747408, 0.9915054, 0.1811795, 1, 0.1960784, 0, 1,
-1.740448, 0.1229707, -3.54812, 1, 0.2039216, 0, 1,
-1.735715, 0.9541155, -1.914731, 1, 0.2117647, 0, 1,
-1.713991, -1.156296, -3.186877, 1, 0.2156863, 0, 1,
-1.707736, 0.6243218, -0.6162561, 1, 0.2235294, 0, 1,
-1.694106, 0.4238442, -0.4745596, 1, 0.227451, 0, 1,
-1.686854, -1.02451, -3.223385, 1, 0.2352941, 0, 1,
-1.677306, 0.384708, -1.231169, 1, 0.2392157, 0, 1,
-1.644486, 1.18278, -0.4429547, 1, 0.2470588, 0, 1,
-1.640896, -0.594175, -2.08076, 1, 0.2509804, 0, 1,
-1.604525, -2.415605, -1.894206, 1, 0.2588235, 0, 1,
-1.601903, 0.02087938, -0.612354, 1, 0.2627451, 0, 1,
-1.599089, 0.4107716, -1.496343, 1, 0.2705882, 0, 1,
-1.577848, -0.3708878, -0.9477477, 1, 0.2745098, 0, 1,
-1.567866, 0.1744505, -1.349327, 1, 0.282353, 0, 1,
-1.562531, -0.4536243, -3.262803, 1, 0.2862745, 0, 1,
-1.557652, 1.060671, -0.2056606, 1, 0.2941177, 0, 1,
-1.557456, 0.8319525, -2.661834, 1, 0.3019608, 0, 1,
-1.555686, -0.1528461, -2.436588, 1, 0.3058824, 0, 1,
-1.555395, -0.3314084, -1.010447, 1, 0.3137255, 0, 1,
-1.523897, -1.200751, -1.534719, 1, 0.3176471, 0, 1,
-1.51689, -1.650088, -3.620898, 1, 0.3254902, 0, 1,
-1.513227, -0.1503108, -0.9517615, 1, 0.3294118, 0, 1,
-1.508691, -1.313231, -2.246418, 1, 0.3372549, 0, 1,
-1.506143, -0.1112533, -2.205288, 1, 0.3411765, 0, 1,
-1.505376, 0.7982152, 0.838127, 1, 0.3490196, 0, 1,
-1.487319, -0.8799465, -2.146407, 1, 0.3529412, 0, 1,
-1.481199, 0.3135668, -1.278966, 1, 0.3607843, 0, 1,
-1.466251, -0.1679023, -1.247008, 1, 0.3647059, 0, 1,
-1.464673, -0.1918154, -0.9334901, 1, 0.372549, 0, 1,
-1.457916, -0.5965658, -2.184182, 1, 0.3764706, 0, 1,
-1.453505, 0.795095, -0.1439822, 1, 0.3843137, 0, 1,
-1.441378, 0.8353347, -0.7697414, 1, 0.3882353, 0, 1,
-1.436146, 0.7571471, -1.165955, 1, 0.3960784, 0, 1,
-1.429946, -0.4544225, -1.97074, 1, 0.4039216, 0, 1,
-1.421341, 1.811501, -1.266506, 1, 0.4078431, 0, 1,
-1.413143, 0.1178314, -3.56199, 1, 0.4156863, 0, 1,
-1.412033, 1.076897, -1.301323, 1, 0.4196078, 0, 1,
-1.410876, 0.5860227, -0.9067453, 1, 0.427451, 0, 1,
-1.40404, 1.218674, -0.6638073, 1, 0.4313726, 0, 1,
-1.397271, 0.4053569, -1.681067, 1, 0.4392157, 0, 1,
-1.394334, 0.2653388, -1.776448, 1, 0.4431373, 0, 1,
-1.384309, 1.477433, -0.8257756, 1, 0.4509804, 0, 1,
-1.379381, -1.14272, -2.240551, 1, 0.454902, 0, 1,
-1.379149, -0.5578507, -4.128851, 1, 0.4627451, 0, 1,
-1.377006, -1.103033, -2.154959, 1, 0.4666667, 0, 1,
-1.367718, -0.5537035, -2.165686, 1, 0.4745098, 0, 1,
-1.366489, -0.3788424, -1.903432, 1, 0.4784314, 0, 1,
-1.360345, 1.222012, 1.184208, 1, 0.4862745, 0, 1,
-1.351479, -0.6112226, -0.2331232, 1, 0.4901961, 0, 1,
-1.347665, -0.3420763, -0.3032849, 1, 0.4980392, 0, 1,
-1.324847, 0.50492, -2.216906, 1, 0.5058824, 0, 1,
-1.319003, -0.03631856, -2.415334, 1, 0.509804, 0, 1,
-1.315306, 1.133446, -1.680248, 1, 0.5176471, 0, 1,
-1.31407, 0.5814543, 0.9556798, 1, 0.5215687, 0, 1,
-1.305797, 0.6798278, 0.8842262, 1, 0.5294118, 0, 1,
-1.302014, -0.5473315, -1.281465, 1, 0.5333334, 0, 1,
-1.296214, -0.219083, -2.299448, 1, 0.5411765, 0, 1,
-1.291347, -0.798296, -4.495527, 1, 0.5450981, 0, 1,
-1.289752, -1.276593, -2.23422, 1, 0.5529412, 0, 1,
-1.281449, 0.1062965, -0.7906567, 1, 0.5568628, 0, 1,
-1.28127, 0.4806047, -1.372843, 1, 0.5647059, 0, 1,
-1.277529, -0.4403678, -2.14687, 1, 0.5686275, 0, 1,
-1.274156, -0.2151213, -2.852106, 1, 0.5764706, 0, 1,
-1.258313, -1.621454, -2.801885, 1, 0.5803922, 0, 1,
-1.256653, -0.8346586, -2.564646, 1, 0.5882353, 0, 1,
-1.254687, 0.9203221, -1.107929, 1, 0.5921569, 0, 1,
-1.252903, 0.4156997, -1.124598, 1, 0.6, 0, 1,
-1.245559, 0.03903773, -2.094586, 1, 0.6078432, 0, 1,
-1.242565, -1.372594, -3.128151, 1, 0.6117647, 0, 1,
-1.23861, 0.04779595, -1.917564, 1, 0.6196079, 0, 1,
-1.23292, 0.8364492, -1.548841, 1, 0.6235294, 0, 1,
-1.221664, 0.2848765, -1.316262, 1, 0.6313726, 0, 1,
-1.2216, -0.6947908, -1.335485, 1, 0.6352941, 0, 1,
-1.220146, -0.4759644, -1.717394, 1, 0.6431373, 0, 1,
-1.212098, 0.8958933, 0.3755067, 1, 0.6470588, 0, 1,
-1.207592, 1.37729, -0.4045569, 1, 0.654902, 0, 1,
-1.196175, -0.1108656, -1.793771, 1, 0.6588235, 0, 1,
-1.168702, -0.3859849, -1.842511, 1, 0.6666667, 0, 1,
-1.165726, 0.1136904, -2.988461, 1, 0.6705883, 0, 1,
-1.159658, 0.6448997, -1.562045, 1, 0.6784314, 0, 1,
-1.158172, -0.222481, -1.622144, 1, 0.682353, 0, 1,
-1.131692, 1.415083, -1.613514, 1, 0.6901961, 0, 1,
-1.12545, 1.09068, -0.328941, 1, 0.6941177, 0, 1,
-1.124752, -1.507445, -0.6882587, 1, 0.7019608, 0, 1,
-1.122675, 0.9856235, -0.6501174, 1, 0.7098039, 0, 1,
-1.114984, -0.2158257, -3.063196, 1, 0.7137255, 0, 1,
-1.113624, -0.4196872, -0.9955805, 1, 0.7215686, 0, 1,
-1.110817, 1.82032, -0.4886594, 1, 0.7254902, 0, 1,
-1.084613, -0.8749549, -2.63299, 1, 0.7333333, 0, 1,
-1.074719, 1.972287, -0.7187892, 1, 0.7372549, 0, 1,
-1.071056, 0.2051454, -1.558892, 1, 0.7450981, 0, 1,
-1.071027, 0.2215459, -1.652333, 1, 0.7490196, 0, 1,
-1.066935, -1.932696, -3.544312, 1, 0.7568628, 0, 1,
-1.059583, -1.166034, -3.121763, 1, 0.7607843, 0, 1,
-1.059286, -0.9500027, -4.83505, 1, 0.7686275, 0, 1,
-1.049274, -1.873705, -3.055994, 1, 0.772549, 0, 1,
-1.047421, 1.065287, -1.873795, 1, 0.7803922, 0, 1,
-1.038156, 0.3025789, -1.08489, 1, 0.7843137, 0, 1,
-1.02468, -0.1890012, -2.337962, 1, 0.7921569, 0, 1,
-1.021553, 0.8930658, -2.411016, 1, 0.7960784, 0, 1,
-1.015486, 0.346082, -0.9901122, 1, 0.8039216, 0, 1,
-1.014766, -0.8901409, -2.835065, 1, 0.8117647, 0, 1,
-1.004241, 2.054835, 0.2423279, 1, 0.8156863, 0, 1,
-1.001089, -2.895798, -1.447758, 1, 0.8235294, 0, 1,
-0.9914998, 1.394572, 2.209271, 1, 0.827451, 0, 1,
-0.9911795, 0.4040363, -2.025318, 1, 0.8352941, 0, 1,
-0.9871381, 0.2187443, -1.923038, 1, 0.8392157, 0, 1,
-0.976905, 1.070147, -0.1971698, 1, 0.8470588, 0, 1,
-0.9693358, 0.01392404, -3.6086, 1, 0.8509804, 0, 1,
-0.9686011, 0.4493633, -0.6212018, 1, 0.8588235, 0, 1,
-0.96811, 1.140815, -1.960931, 1, 0.8627451, 0, 1,
-0.965893, -0.8010654, -2.12742, 1, 0.8705882, 0, 1,
-0.9592871, -1.082483, -2.804564, 1, 0.8745098, 0, 1,
-0.9523908, -0.8424711, -2.855452, 1, 0.8823529, 0, 1,
-0.9523045, -0.09553721, -3.494513, 1, 0.8862745, 0, 1,
-0.9473357, -0.5683162, -1.818525, 1, 0.8941177, 0, 1,
-0.9415454, -2.39537, -4.228454, 1, 0.8980392, 0, 1,
-0.9413267, -1.655137, -3.420686, 1, 0.9058824, 0, 1,
-0.9400182, -1.848709, -1.277501, 1, 0.9137255, 0, 1,
-0.9296758, -1.617186, -3.465505, 1, 0.9176471, 0, 1,
-0.9275867, -0.2358462, -0.2469214, 1, 0.9254902, 0, 1,
-0.920228, 0.2461698, -0.681002, 1, 0.9294118, 0, 1,
-0.9199397, -2.550925, -1.311629, 1, 0.9372549, 0, 1,
-0.9147094, -0.2809487, -0.9167545, 1, 0.9411765, 0, 1,
-0.9141156, -0.2028116, -3.333534, 1, 0.9490196, 0, 1,
-0.9112635, 0.5183527, -1.653062, 1, 0.9529412, 0, 1,
-0.908755, 0.4410159, 0.5996895, 1, 0.9607843, 0, 1,
-0.9084502, -0.5723339, -0.2931149, 1, 0.9647059, 0, 1,
-0.8955262, 0.5726628, -1.526525, 1, 0.972549, 0, 1,
-0.8913611, 0.9729975, -0.1865207, 1, 0.9764706, 0, 1,
-0.8848679, -1.191871, -1.957827, 1, 0.9843137, 0, 1,
-0.8845599, 0.6220701, -1.320848, 1, 0.9882353, 0, 1,
-0.8838595, 0.1128007, -1.26119, 1, 0.9960784, 0, 1,
-0.8727864, -1.042344, -3.09763, 0.9960784, 1, 0, 1,
-0.8668286, 0.02877657, -2.586934, 0.9921569, 1, 0, 1,
-0.8665352, 0.1937113, -1.738349, 0.9843137, 1, 0, 1,
-0.8648044, 1.418923, 0.4981417, 0.9803922, 1, 0, 1,
-0.8617013, 0.07726337, -3.079574, 0.972549, 1, 0, 1,
-0.8575733, -0.2177173, -0.06261193, 0.9686275, 1, 0, 1,
-0.8537554, 0.8408201, -1.867069, 0.9607843, 1, 0, 1,
-0.8512123, 0.6230931, -1.374152, 0.9568627, 1, 0, 1,
-0.8483764, -1.640619, -2.971633, 0.9490196, 1, 0, 1,
-0.8465701, -0.4618328, -1.867049, 0.945098, 1, 0, 1,
-0.8465199, 0.873591, -1.599745, 0.9372549, 1, 0, 1,
-0.842363, -0.6420737, -2.716253, 0.9333333, 1, 0, 1,
-0.8341661, 1.053315, -0.13436, 0.9254902, 1, 0, 1,
-0.833007, 0.7188553, -0.6458887, 0.9215686, 1, 0, 1,
-0.8309473, -0.340258, -2.647142, 0.9137255, 1, 0, 1,
-0.8300197, 1.566367, -0.890795, 0.9098039, 1, 0, 1,
-0.8221962, -0.04998707, -1.246302, 0.9019608, 1, 0, 1,
-0.8207352, -1.882438, -4.347674, 0.8941177, 1, 0, 1,
-0.8204374, 1.460169, -0.4967748, 0.8901961, 1, 0, 1,
-0.8190392, -0.04360487, -1.34478, 0.8823529, 1, 0, 1,
-0.8129244, -0.2986468, -1.332549, 0.8784314, 1, 0, 1,
-0.80868, -1.146325, -3.02935, 0.8705882, 1, 0, 1,
-0.8053531, -0.3815126, -1.33284, 0.8666667, 1, 0, 1,
-0.8043324, -0.003645192, -0.7043665, 0.8588235, 1, 0, 1,
-0.8020131, 0.7479081, -1.696286, 0.854902, 1, 0, 1,
-0.8003556, 0.6949658, -2.463592, 0.8470588, 1, 0, 1,
-0.7991815, 0.7914027, 0.4006365, 0.8431373, 1, 0, 1,
-0.7972016, -1.185146, -3.075646, 0.8352941, 1, 0, 1,
-0.789107, 0.6648743, -0.6618568, 0.8313726, 1, 0, 1,
-0.788515, 0.02381602, -1.713221, 0.8235294, 1, 0, 1,
-0.7768844, -0.3903272, -0.680035, 0.8196079, 1, 0, 1,
-0.7745569, -1.132867, -1.433666, 0.8117647, 1, 0, 1,
-0.7731546, 0.06040386, -0.8362518, 0.8078431, 1, 0, 1,
-0.7731012, 0.5418817, -1.406407, 0.8, 1, 0, 1,
-0.762953, 0.5132488, -0.04066117, 0.7921569, 1, 0, 1,
-0.7624052, -0.716233, -3.097117, 0.7882353, 1, 0, 1,
-0.7622719, -1.345088, -0.3440523, 0.7803922, 1, 0, 1,
-0.7601196, 1.026443, 0.7203577, 0.7764706, 1, 0, 1,
-0.7585587, 2.089858, -0.2998844, 0.7686275, 1, 0, 1,
-0.7574589, -0.4320423, -2.443118, 0.7647059, 1, 0, 1,
-0.7564717, -1.005783, -4.228454, 0.7568628, 1, 0, 1,
-0.7422819, -1.277976, -4.171489, 0.7529412, 1, 0, 1,
-0.7401531, 0.09432887, -1.410435, 0.7450981, 1, 0, 1,
-0.733128, -0.0941674, -0.8565003, 0.7411765, 1, 0, 1,
-0.732097, -0.6235564, -1.191753, 0.7333333, 1, 0, 1,
-0.7288252, -0.02074782, -2.73739, 0.7294118, 1, 0, 1,
-0.7232078, -1.746695, -1.978824, 0.7215686, 1, 0, 1,
-0.7227371, -0.2202553, -1.822368, 0.7176471, 1, 0, 1,
-0.7195983, 1.554789, -0.7154389, 0.7098039, 1, 0, 1,
-0.7137725, -1.185205, -1.925134, 0.7058824, 1, 0, 1,
-0.7117278, -0.8186244, -2.003929, 0.6980392, 1, 0, 1,
-0.7063691, -0.9607375, -1.59219, 0.6901961, 1, 0, 1,
-0.7049111, -0.002412832, -1.153738, 0.6862745, 1, 0, 1,
-0.7043285, -1.149123, -3.381006, 0.6784314, 1, 0, 1,
-0.7031515, 0.05548333, -0.8429244, 0.6745098, 1, 0, 1,
-0.6989373, 0.01812318, -2.092124, 0.6666667, 1, 0, 1,
-0.6967231, 0.9512104, -1.166172, 0.6627451, 1, 0, 1,
-0.6934491, -0.04676671, -2.553805, 0.654902, 1, 0, 1,
-0.6848823, 0.287135, 0.2574418, 0.6509804, 1, 0, 1,
-0.6779578, -0.5296828, -1.275557, 0.6431373, 1, 0, 1,
-0.6715911, -1.597199, -3.49492, 0.6392157, 1, 0, 1,
-0.6697013, 1.053357, -1.635615, 0.6313726, 1, 0, 1,
-0.6543416, -0.9919685, -2.882195, 0.627451, 1, 0, 1,
-0.6522384, -0.189096, -1.1627, 0.6196079, 1, 0, 1,
-0.651669, 1.802934, -0.07345823, 0.6156863, 1, 0, 1,
-0.646372, -0.8218569, -1.674227, 0.6078432, 1, 0, 1,
-0.6462047, -1.179701, -2.39346, 0.6039216, 1, 0, 1,
-0.6457335, 1.104985, -0.4721392, 0.5960785, 1, 0, 1,
-0.6440713, 0.3402656, -1.284244, 0.5882353, 1, 0, 1,
-0.6429654, -0.6000047, -3.516102, 0.5843138, 1, 0, 1,
-0.6404952, -0.9105969, -2.151864, 0.5764706, 1, 0, 1,
-0.6367453, 0.215382, -2.972849, 0.572549, 1, 0, 1,
-0.6324306, 0.2404852, -1.303559, 0.5647059, 1, 0, 1,
-0.631473, 0.2525975, -0.3969047, 0.5607843, 1, 0, 1,
-0.6305867, -0.3152792, -3.287794, 0.5529412, 1, 0, 1,
-0.6216804, -0.6639034, -3.396346, 0.5490196, 1, 0, 1,
-0.6186441, -1.485355, -1.283753, 0.5411765, 1, 0, 1,
-0.6139761, 0.2622289, -2.79029, 0.5372549, 1, 0, 1,
-0.6006218, -0.8992784, -2.885996, 0.5294118, 1, 0, 1,
-0.5967068, -2.032213, -2.906666, 0.5254902, 1, 0, 1,
-0.5951284, 0.7684453, 0.2104152, 0.5176471, 1, 0, 1,
-0.5951039, 1.075982, -1.165785, 0.5137255, 1, 0, 1,
-0.5942681, 0.8467665, 0.319615, 0.5058824, 1, 0, 1,
-0.5938657, -1.072761, -2.660691, 0.5019608, 1, 0, 1,
-0.5903796, 1.468905, -1.410392, 0.4941176, 1, 0, 1,
-0.5897181, -2.320675, -2.112728, 0.4862745, 1, 0, 1,
-0.5862698, 1.44014, 0.3689615, 0.4823529, 1, 0, 1,
-0.5842318, -0.2847601, -1.245934, 0.4745098, 1, 0, 1,
-0.5834653, -0.7487825, -2.025663, 0.4705882, 1, 0, 1,
-0.5828184, 1.599913, -0.5435881, 0.4627451, 1, 0, 1,
-0.5820395, -1.213857, -4.902867, 0.4588235, 1, 0, 1,
-0.5788713, 0.1767389, -0.8523404, 0.4509804, 1, 0, 1,
-0.5787347, 0.4519233, 0.8004228, 0.4470588, 1, 0, 1,
-0.575526, 1.16189, 1.054233, 0.4392157, 1, 0, 1,
-0.5733496, 0.2820884, -0.4734529, 0.4352941, 1, 0, 1,
-0.569959, -0.1429108, -2.451256, 0.427451, 1, 0, 1,
-0.5625834, -0.4988407, -0.6672871, 0.4235294, 1, 0, 1,
-0.5593591, 0.4218221, -0.6495097, 0.4156863, 1, 0, 1,
-0.5538363, -0.2586808, -2.125349, 0.4117647, 1, 0, 1,
-0.5513192, -0.0112061, -1.807192, 0.4039216, 1, 0, 1,
-0.5512218, -0.09100088, -2.70559, 0.3960784, 1, 0, 1,
-0.5502915, 1.508205, -0.4996578, 0.3921569, 1, 0, 1,
-0.5452009, -0.9088686, -2.393138, 0.3843137, 1, 0, 1,
-0.5446697, -0.3303507, -1.458905, 0.3803922, 1, 0, 1,
-0.5416818, -0.06062478, -1.531127, 0.372549, 1, 0, 1,
-0.5339302, -0.7909963, -1.588247, 0.3686275, 1, 0, 1,
-0.5334247, 0.6281551, -1.896998, 0.3607843, 1, 0, 1,
-0.5217943, -0.1584636, -2.178226, 0.3568628, 1, 0, 1,
-0.521222, -0.8216019, -3.627269, 0.3490196, 1, 0, 1,
-0.5154104, -0.9927666, -2.811193, 0.345098, 1, 0, 1,
-0.5140994, 0.4080884, -0.6238249, 0.3372549, 1, 0, 1,
-0.5125616, 0.5852914, -1.65925, 0.3333333, 1, 0, 1,
-0.5113733, -2.368663, -3.125998, 0.3254902, 1, 0, 1,
-0.5080634, 1.491616, 0.6090389, 0.3215686, 1, 0, 1,
-0.5048965, -0.1104693, -3.144041, 0.3137255, 1, 0, 1,
-0.4993476, -0.0005380361, -2.238223, 0.3098039, 1, 0, 1,
-0.4954787, 0.6992636, -1.33858, 0.3019608, 1, 0, 1,
-0.4918505, 1.669824, 1.118947, 0.2941177, 1, 0, 1,
-0.4880743, -1.279522, -1.110113, 0.2901961, 1, 0, 1,
-0.4878908, -0.3067383, -1.983273, 0.282353, 1, 0, 1,
-0.4846185, -1.788315, -4.131956, 0.2784314, 1, 0, 1,
-0.4824812, 0.1472931, -1.026954, 0.2705882, 1, 0, 1,
-0.477998, -0.8215425, -3.189496, 0.2666667, 1, 0, 1,
-0.4726191, 0.1912687, 0.05931405, 0.2588235, 1, 0, 1,
-0.4675581, 0.07586254, -1.941348, 0.254902, 1, 0, 1,
-0.4644397, 0.1150037, -2.051177, 0.2470588, 1, 0, 1,
-0.4577919, 0.5488088, -0.5391536, 0.2431373, 1, 0, 1,
-0.4511297, 0.1746873, -1.622777, 0.2352941, 1, 0, 1,
-0.4466842, -0.6536231, -3.331956, 0.2313726, 1, 0, 1,
-0.4461113, 1.090913, 2.043947, 0.2235294, 1, 0, 1,
-0.4453706, 0.7502053, -1.22557, 0.2196078, 1, 0, 1,
-0.4312094, -0.06145225, 0.0584082, 0.2117647, 1, 0, 1,
-0.4302701, 0.09220824, -0.3394513, 0.2078431, 1, 0, 1,
-0.4252404, 0.4659504, -1.23552, 0.2, 1, 0, 1,
-0.4193861, -0.5315561, -2.071168, 0.1921569, 1, 0, 1,
-0.4182705, 1.415661, -0.8547348, 0.1882353, 1, 0, 1,
-0.4124175, 0.1348806, -1.346075, 0.1803922, 1, 0, 1,
-0.4121756, 1.232177, -1.175908, 0.1764706, 1, 0, 1,
-0.4113581, 0.1728766, -1.850913, 0.1686275, 1, 0, 1,
-0.4105735, -0.5492601, -3.290971, 0.1647059, 1, 0, 1,
-0.4070131, 0.8465121, -0.4702819, 0.1568628, 1, 0, 1,
-0.4035498, -1.403658, -2.40368, 0.1529412, 1, 0, 1,
-0.400661, 0.6742298, 0.5348823, 0.145098, 1, 0, 1,
-0.3987214, -0.7998891, -2.158331, 0.1411765, 1, 0, 1,
-0.3984551, -1.959632, -2.682021, 0.1333333, 1, 0, 1,
-0.3981562, 1.651748, 0.2843787, 0.1294118, 1, 0, 1,
-0.3953969, 0.3650237, -0.8124641, 0.1215686, 1, 0, 1,
-0.3911711, -0.1985758, -2.646337, 0.1176471, 1, 0, 1,
-0.3883589, -0.2969126, -2.802762, 0.1098039, 1, 0, 1,
-0.3864491, 1.262147, 0.1585266, 0.1058824, 1, 0, 1,
-0.3859289, 0.09898138, -2.179796, 0.09803922, 1, 0, 1,
-0.3761558, -0.9432048, -2.109166, 0.09019608, 1, 0, 1,
-0.3685365, 0.4057317, 0.1014503, 0.08627451, 1, 0, 1,
-0.3680432, 0.0593594, -1.24833, 0.07843138, 1, 0, 1,
-0.3676194, -0.78919, -2.567414, 0.07450981, 1, 0, 1,
-0.3650244, 0.8323025, -0.1438991, 0.06666667, 1, 0, 1,
-0.3645692, -1.546098, -3.303024, 0.0627451, 1, 0, 1,
-0.3586489, -0.2843784, -2.529685, 0.05490196, 1, 0, 1,
-0.3582815, 0.2131893, -2.457435, 0.05098039, 1, 0, 1,
-0.3571576, -0.662298, -0.2435098, 0.04313726, 1, 0, 1,
-0.3564032, -0.7891446, -1.400161, 0.03921569, 1, 0, 1,
-0.3546704, 2.494038, -1.413623, 0.03137255, 1, 0, 1,
-0.3533501, 0.7185262, 0.1886215, 0.02745098, 1, 0, 1,
-0.3508338, 1.658984, -0.3975425, 0.01960784, 1, 0, 1,
-0.3469138, 0.8160402, -0.8257301, 0.01568628, 1, 0, 1,
-0.3459697, 1.161299, 1.091994, 0.007843138, 1, 0, 1,
-0.3457164, 1.709569, 0.5911421, 0.003921569, 1, 0, 1,
-0.341484, -0.7479641, -3.009, 0, 1, 0.003921569, 1,
-0.3382832, -1.449093, -3.28151, 0, 1, 0.01176471, 1,
-0.3372642, 1.691794, 0.1231181, 0, 1, 0.01568628, 1,
-0.3371137, -0.0770438, -2.416253, 0, 1, 0.02352941, 1,
-0.336894, -0.5247373, -2.536092, 0, 1, 0.02745098, 1,
-0.3367631, -0.9028642, -1.473177, 0, 1, 0.03529412, 1,
-0.3349551, 0.3187816, 0.9496211, 0, 1, 0.03921569, 1,
-0.3341223, -1.682951, -2.739206, 0, 1, 0.04705882, 1,
-0.3328175, 1.365241, 0.7827789, 0, 1, 0.05098039, 1,
-0.3256998, -0.1972347, -1.579721, 0, 1, 0.05882353, 1,
-0.3256313, -0.3024947, -0.8973104, 0, 1, 0.0627451, 1,
-0.3244475, -0.3375283, -3.249128, 0, 1, 0.07058824, 1,
-0.3240695, 0.2481909, -2.290577, 0, 1, 0.07450981, 1,
-0.3160852, 1.404882, -0.6361877, 0, 1, 0.08235294, 1,
-0.3126623, -1.035751, -2.845373, 0, 1, 0.08627451, 1,
-0.31241, 0.1596269, -1.353153, 0, 1, 0.09411765, 1,
-0.3091444, 0.5389291, 2.169423, 0, 1, 0.1019608, 1,
-0.3086822, -0.4508856, -0.2463451, 0, 1, 0.1058824, 1,
-0.3076522, -1.645094, -2.193665, 0, 1, 0.1137255, 1,
-0.3031424, -1.634102, -3.554579, 0, 1, 0.1176471, 1,
-0.3024001, -0.1703525, -3.017297, 0, 1, 0.1254902, 1,
-0.3015664, -0.5774001, -1.407047, 0, 1, 0.1294118, 1,
-0.2994739, 1.087981, 0.8966665, 0, 1, 0.1372549, 1,
-0.2951353, -0.5445024, -3.219672, 0, 1, 0.1411765, 1,
-0.2886628, -0.96356, -1.586184, 0, 1, 0.1490196, 1,
-0.2872433, -0.585048, -2.165522, 0, 1, 0.1529412, 1,
-0.2844532, -1.219349, -3.575367, 0, 1, 0.1607843, 1,
-0.283651, 0.2345981, -1.250311, 0, 1, 0.1647059, 1,
-0.2830344, -0.6789445, -3.349945, 0, 1, 0.172549, 1,
-0.2820375, 1.286922, 1.193987, 0, 1, 0.1764706, 1,
-0.279121, 0.4280928, -1.493596, 0, 1, 0.1843137, 1,
-0.2789762, -0.0946231, -1.965595, 0, 1, 0.1882353, 1,
-0.2769107, 1.541502, 0.3456147, 0, 1, 0.1960784, 1,
-0.2688631, 1.083739, -0.2229104, 0, 1, 0.2039216, 1,
-0.2655288, 0.8459933, -0.1558154, 0, 1, 0.2078431, 1,
-0.2653557, -0.03717601, -1.88591, 0, 1, 0.2156863, 1,
-0.2649118, 0.522069, 0.3756579, 0, 1, 0.2196078, 1,
-0.2602832, 1.423266, 0.4322383, 0, 1, 0.227451, 1,
-0.254692, -0.5721068, -0.9448878, 0, 1, 0.2313726, 1,
-0.2542174, -0.5426421, -3.592608, 0, 1, 0.2392157, 1,
-0.2494386, -0.2615377, -2.702834, 0, 1, 0.2431373, 1,
-0.2321982, 0.9235163, 1.456761, 0, 1, 0.2509804, 1,
-0.2212587, -0.5920101, -4.191091, 0, 1, 0.254902, 1,
-0.2187411, 1.766482, -1.356487, 0, 1, 0.2627451, 1,
-0.2174413, 1.150511, -0.4860612, 0, 1, 0.2666667, 1,
-0.2170562, -0.3718388, -1.129951, 0, 1, 0.2745098, 1,
-0.2164574, 0.2009656, -0.3954243, 0, 1, 0.2784314, 1,
-0.2146407, -0.09988772, -4.132307, 0, 1, 0.2862745, 1,
-0.214475, 1.256102, 0.5518869, 0, 1, 0.2901961, 1,
-0.2129415, -0.3195847, -1.290817, 0, 1, 0.2980392, 1,
-0.2109457, 0.9584491, -0.7368497, 0, 1, 0.3058824, 1,
-0.2108614, -0.5048289, -3.634428, 0, 1, 0.3098039, 1,
-0.2092203, 2.269804, 0.5796057, 0, 1, 0.3176471, 1,
-0.2053994, -0.468529, -2.734424, 0, 1, 0.3215686, 1,
-0.202417, -0.1314437, -2.398161, 0, 1, 0.3294118, 1,
-0.1919003, 0.478496, 0.02567337, 0, 1, 0.3333333, 1,
-0.1871506, -0.08279345, -2.523845, 0, 1, 0.3411765, 1,
-0.1861927, -1.218669, -3.868763, 0, 1, 0.345098, 1,
-0.1854501, 0.9780905, -0.5404164, 0, 1, 0.3529412, 1,
-0.1853125, -0.07988851, -0.1395743, 0, 1, 0.3568628, 1,
-0.1790034, 0.3350102, -0.2565922, 0, 1, 0.3647059, 1,
-0.1748204, 0.659358, -0.1744755, 0, 1, 0.3686275, 1,
-0.1731011, 1.582041, 0.2175856, 0, 1, 0.3764706, 1,
-0.1726433, 2.563531, -0.2046606, 0, 1, 0.3803922, 1,
-0.1714553, -0.3198713, -2.077108, 0, 1, 0.3882353, 1,
-0.1714027, 0.5638235, 0.5019094, 0, 1, 0.3921569, 1,
-0.1692878, 0.4210281, 0.6036447, 0, 1, 0.4, 1,
-0.1690481, -1.32392, -2.511769, 0, 1, 0.4078431, 1,
-0.1675002, -2.420281, -1.736248, 0, 1, 0.4117647, 1,
-0.1667047, -0.854045, -3.244781, 0, 1, 0.4196078, 1,
-0.1638617, 0.004253363, -1.376393, 0, 1, 0.4235294, 1,
-0.1619079, -0.7245183, -1.773835, 0, 1, 0.4313726, 1,
-0.1584759, 1.577869, 0.1131776, 0, 1, 0.4352941, 1,
-0.1544599, -0.1134061, -1.208632, 0, 1, 0.4431373, 1,
-0.1518616, -1.782087, -3.45653, 0, 1, 0.4470588, 1,
-0.1509471, -0.5762258, -3.017805, 0, 1, 0.454902, 1,
-0.1502817, -0.188709, -0.590073, 0, 1, 0.4588235, 1,
-0.144405, -1.004178, -3.145488, 0, 1, 0.4666667, 1,
-0.1439564, -1.704621, -1.287807, 0, 1, 0.4705882, 1,
-0.1412674, 0.3788919, -1.262082, 0, 1, 0.4784314, 1,
-0.1403949, -1.108097, -2.690875, 0, 1, 0.4823529, 1,
-0.1397862, 0.3970376, -0.309753, 0, 1, 0.4901961, 1,
-0.1341946, -0.728927, -2.08687, 0, 1, 0.4941176, 1,
-0.1338767, 0.3029841, -0.07855996, 0, 1, 0.5019608, 1,
-0.1290558, 2.961721, 1.213575, 0, 1, 0.509804, 1,
-0.1282178, -1.5083, -3.068491, 0, 1, 0.5137255, 1,
-0.1270102, -0.04217045, -1.710203, 0, 1, 0.5215687, 1,
-0.1248417, 0.3851088, -1.771451, 0, 1, 0.5254902, 1,
-0.1232719, 1.244909, 1.467403, 0, 1, 0.5333334, 1,
-0.1229799, 1.102095, -0.5343821, 0, 1, 0.5372549, 1,
-0.1222911, 0.580275, -0.3018403, 0, 1, 0.5450981, 1,
-0.1213518, -1.063456, -3.168952, 0, 1, 0.5490196, 1,
-0.1187213, 1.118876, -1.433539, 0, 1, 0.5568628, 1,
-0.1145177, -0.160638, -3.974454, 0, 1, 0.5607843, 1,
-0.1136176, -1.002216, -3.583404, 0, 1, 0.5686275, 1,
-0.1124678, -0.06474752, -3.194765, 0, 1, 0.572549, 1,
-0.1120842, 0.5036026, -1.013961, 0, 1, 0.5803922, 1,
-0.1112719, 0.4154627, -1.028643, 0, 1, 0.5843138, 1,
-0.1102478, 0.1820122, 0.04757023, 0, 1, 0.5921569, 1,
-0.1079768, -1.451123, -3.508326, 0, 1, 0.5960785, 1,
-0.1076925, 0.4629298, -0.1747409, 0, 1, 0.6039216, 1,
-0.1070742, 1.576673, -0.3777134, 0, 1, 0.6117647, 1,
-0.1037044, -0.3260719, -3.126808, 0, 1, 0.6156863, 1,
-0.1011462, -1.166844, -0.4828745, 0, 1, 0.6235294, 1,
-0.09823348, -0.794039, -1.677321, 0, 1, 0.627451, 1,
-0.09581059, 1.139135, 0.0751017, 0, 1, 0.6352941, 1,
-0.09237534, -0.04916689, -3.362666, 0, 1, 0.6392157, 1,
-0.08886375, 1.363618, 0.5331698, 0, 1, 0.6470588, 1,
-0.08625665, 1.469503, -0.7330587, 0, 1, 0.6509804, 1,
-0.07930361, -0.6864348, -3.119038, 0, 1, 0.6588235, 1,
-0.0744253, -1.33218, -2.099051, 0, 1, 0.6627451, 1,
-0.07340351, 0.3687637, -2.011989, 0, 1, 0.6705883, 1,
-0.07176185, -1.670468, -2.092423, 0, 1, 0.6745098, 1,
-0.0632029, 0.06272122, 0.02250651, 0, 1, 0.682353, 1,
-0.06283712, 1.231258, 2.24202, 0, 1, 0.6862745, 1,
-0.06159884, -0.175336, -2.549927, 0, 1, 0.6941177, 1,
-0.0594764, 2.593312, 0.04002328, 0, 1, 0.7019608, 1,
-0.05930772, 0.3501131, 1.747695, 0, 1, 0.7058824, 1,
-0.05752057, 0.8114412, 0.6195909, 0, 1, 0.7137255, 1,
-0.05711665, -1.102706, -3.112282, 0, 1, 0.7176471, 1,
-0.05693516, -0.4185988, -3.168762, 0, 1, 0.7254902, 1,
-0.04509728, 1.236015, -1.099203, 0, 1, 0.7294118, 1,
-0.04455839, -0.3000369, -3.888767, 0, 1, 0.7372549, 1,
-0.03906684, -0.02740492, -2.161609, 0, 1, 0.7411765, 1,
-0.03892601, -0.6591194, -1.748384, 0, 1, 0.7490196, 1,
-0.03398667, 0.4003883, -0.1430054, 0, 1, 0.7529412, 1,
-0.03289954, 0.05711108, -1.824127, 0, 1, 0.7607843, 1,
-0.02852603, -1.08933, -2.822434, 0, 1, 0.7647059, 1,
-0.02793253, 1.229777, -0.1265868, 0, 1, 0.772549, 1,
-0.02790207, 0.01961752, -1.543464, 0, 1, 0.7764706, 1,
-0.02293615, 0.325035, -0.5479406, 0, 1, 0.7843137, 1,
-0.01881809, 0.3893849, 0.3448375, 0, 1, 0.7882353, 1,
-0.01697755, -0.3538063, -4.028775, 0, 1, 0.7960784, 1,
-0.01613673, -1.017032, -2.792708, 0, 1, 0.8039216, 1,
-0.01485592, 0.6820583, -0.6861909, 0, 1, 0.8078431, 1,
-0.009510709, -0.9097819, -3.27939, 0, 1, 0.8156863, 1,
-0.009294976, -1.207188, -1.786413, 0, 1, 0.8196079, 1,
-0.006091524, 0.9694728, 1.483935, 0, 1, 0.827451, 1,
-0.003766424, 1.544039, 0.5789796, 0, 1, 0.8313726, 1,
-0.001948263, 0.2383726, -0.7108982, 0, 1, 0.8392157, 1,
0.002176929, -2.06322, 1.921766, 0, 1, 0.8431373, 1,
0.003210134, -1.151577, 4.920138, 0, 1, 0.8509804, 1,
0.00394459, -0.2502309, 2.97176, 0, 1, 0.854902, 1,
0.005281287, -1.329522, 3.968944, 0, 1, 0.8627451, 1,
0.00546098, 0.0582835, -0.05371939, 0, 1, 0.8666667, 1,
0.007217175, 1.483781, -0.4640846, 0, 1, 0.8745098, 1,
0.01229273, 1.273222, 0.008297107, 0, 1, 0.8784314, 1,
0.01346802, -0.269601, 4.138712, 0, 1, 0.8862745, 1,
0.01366843, -0.09558565, 5.464654, 0, 1, 0.8901961, 1,
0.0147793, 0.211917, -0.6990052, 0, 1, 0.8980392, 1,
0.01805574, 1.03753, 2.053105, 0, 1, 0.9058824, 1,
0.02204093, 0.6865036, -1.051201, 0, 1, 0.9098039, 1,
0.02210677, -0.8118089, 2.534144, 0, 1, 0.9176471, 1,
0.02554509, 1.200221, 0.511216, 0, 1, 0.9215686, 1,
0.02958191, -0.4293192, 1.330586, 0, 1, 0.9294118, 1,
0.03796466, 1.097797, -1.004002, 0, 1, 0.9333333, 1,
0.03814173, -0.2393089, 4.697777, 0, 1, 0.9411765, 1,
0.03950325, 0.7334864, 0.1548314, 0, 1, 0.945098, 1,
0.04681277, 0.07655552, -0.2439123, 0, 1, 0.9529412, 1,
0.05051339, -0.5458337, 4.413992, 0, 1, 0.9568627, 1,
0.05212843, -0.04958714, 0.5081338, 0, 1, 0.9647059, 1,
0.05229008, 0.620259, 0.5096189, 0, 1, 0.9686275, 1,
0.05256064, 1.912181, -0.9218631, 0, 1, 0.9764706, 1,
0.05487831, -0.03610762, 3.294202, 0, 1, 0.9803922, 1,
0.0549807, 1.668357, 0.3905751, 0, 1, 0.9882353, 1,
0.05709338, -0.4163935, 2.008477, 0, 1, 0.9921569, 1,
0.05822577, 0.3976666, 0.2164668, 0, 1, 1, 1,
0.07115164, 0.1229704, -1.009796, 0, 0.9921569, 1, 1,
0.07388262, 0.2760731, -0.2420127, 0, 0.9882353, 1, 1,
0.0807891, -0.02525068, -0.589495, 0, 0.9803922, 1, 1,
0.08329394, -0.2006783, 2.073155, 0, 0.9764706, 1, 1,
0.08447616, -0.2088051, 3.719098, 0, 0.9686275, 1, 1,
0.08580308, 0.6678222, 0.5136054, 0, 0.9647059, 1, 1,
0.0889436, 0.8216571, 0.6063545, 0, 0.9568627, 1, 1,
0.09217075, 0.05759005, 1.425638, 0, 0.9529412, 1, 1,
0.0968608, 0.1990889, 0.326044, 0, 0.945098, 1, 1,
0.09710772, 0.2565148, 0.365115, 0, 0.9411765, 1, 1,
0.09719875, 1.490445, 1.015912, 0, 0.9333333, 1, 1,
0.09921695, -0.4384378, 4.099644, 0, 0.9294118, 1, 1,
0.1015132, -2.331294, 3.441588, 0, 0.9215686, 1, 1,
0.1058096, -0.8502234, 4.288623, 0, 0.9176471, 1, 1,
0.10609, 0.07319435, 0.5851493, 0, 0.9098039, 1, 1,
0.1074019, -0.127197, 3.453261, 0, 0.9058824, 1, 1,
0.1087416, 0.2678351, -1.846668, 0, 0.8980392, 1, 1,
0.1101052, -1.193863, 3.504277, 0, 0.8901961, 1, 1,
0.1141306, 0.4678621, -1.410248, 0, 0.8862745, 1, 1,
0.1152894, -0.4243082, 3.526974, 0, 0.8784314, 1, 1,
0.1161572, -0.6090436, 3.095659, 0, 0.8745098, 1, 1,
0.1162207, -0.5615433, 3.202796, 0, 0.8666667, 1, 1,
0.1180546, -1.23213, 3.984344, 0, 0.8627451, 1, 1,
0.1190531, 0.6793134, -0.5435755, 0, 0.854902, 1, 1,
0.1198089, -0.2164339, 3.551188, 0, 0.8509804, 1, 1,
0.1234351, 0.9387074, 0.8028134, 0, 0.8431373, 1, 1,
0.1235238, 0.7069623, 0.3160726, 0, 0.8392157, 1, 1,
0.1259868, -0.4477366, 2.502132, 0, 0.8313726, 1, 1,
0.1263947, -0.2833837, 1.937788, 0, 0.827451, 1, 1,
0.1287632, 1.329767, 0.3669859, 0, 0.8196079, 1, 1,
0.129627, 1.274231, -1.386704, 0, 0.8156863, 1, 1,
0.1302677, 1.640653, -0.1397189, 0, 0.8078431, 1, 1,
0.1314041, 2.034172, 0.2100545, 0, 0.8039216, 1, 1,
0.133914, -2.672281, 2.874193, 0, 0.7960784, 1, 1,
0.137675, -0.6505513, 2.722467, 0, 0.7882353, 1, 1,
0.1383031, -0.624087, 3.353516, 0, 0.7843137, 1, 1,
0.1384741, 0.5494968, 0.4931404, 0, 0.7764706, 1, 1,
0.1418795, -0.3466306, 2.979096, 0, 0.772549, 1, 1,
0.1429201, 0.6447042, -0.8041826, 0, 0.7647059, 1, 1,
0.1437711, -0.8512779, 4.412791, 0, 0.7607843, 1, 1,
0.1462469, -0.8342492, 2.994647, 0, 0.7529412, 1, 1,
0.1475272, -1.48063, 3.337573, 0, 0.7490196, 1, 1,
0.1491139, -1.394248, 2.348343, 0, 0.7411765, 1, 1,
0.1559822, -1.465096, 2.230383, 0, 0.7372549, 1, 1,
0.1560862, 0.06283855, 0.4771183, 0, 0.7294118, 1, 1,
0.1584841, -1.014282, 2.07497, 0, 0.7254902, 1, 1,
0.1585047, 0.164094, 1.873063, 0, 0.7176471, 1, 1,
0.1586646, 0.7416914, 0.2835316, 0, 0.7137255, 1, 1,
0.1589604, 0.5654718, -0.9007128, 0, 0.7058824, 1, 1,
0.159678, -1.710656, 3.166945, 0, 0.6980392, 1, 1,
0.1597996, -1.386589, 1.048581, 0, 0.6941177, 1, 1,
0.1626203, -0.5937611, 4.380824, 0, 0.6862745, 1, 1,
0.1658005, 0.7507173, 1.152137, 0, 0.682353, 1, 1,
0.1675877, -1.451181, 2.685205, 0, 0.6745098, 1, 1,
0.1798404, 1.122007, 0.4431263, 0, 0.6705883, 1, 1,
0.1836335, -0.3279809, 1.769927, 0, 0.6627451, 1, 1,
0.1847568, 0.9364406, -0.6279441, 0, 0.6588235, 1, 1,
0.187364, 0.8819288, 0.4564934, 0, 0.6509804, 1, 1,
0.1883566, -1.287966, 1.864595, 0, 0.6470588, 1, 1,
0.1893902, -1.275272, 2.091869, 0, 0.6392157, 1, 1,
0.1912696, 0.3541756, 0.3222083, 0, 0.6352941, 1, 1,
0.1932591, 0.5667323, 1.487336, 0, 0.627451, 1, 1,
0.1967489, -1.082356, 3.802545, 0, 0.6235294, 1, 1,
0.1975126, 0.7496727, -0.00865277, 0, 0.6156863, 1, 1,
0.2002018, -0.2599145, 3.274575, 0, 0.6117647, 1, 1,
0.2035499, -1.980671, 3.444069, 0, 0.6039216, 1, 1,
0.2073909, -1.230839, 2.030235, 0, 0.5960785, 1, 1,
0.2093417, 0.2783995, 0.6520503, 0, 0.5921569, 1, 1,
0.2107576, 0.6377468, 0.5638856, 0, 0.5843138, 1, 1,
0.2111999, 0.5407075, 0.08344712, 0, 0.5803922, 1, 1,
0.2142187, 0.7621644, 0.2502349, 0, 0.572549, 1, 1,
0.2159391, 0.6629449, -2.294581, 0, 0.5686275, 1, 1,
0.2181986, -0.3895189, 3.115854, 0, 0.5607843, 1, 1,
0.2208712, -0.07951844, 1.489851, 0, 0.5568628, 1, 1,
0.2237329, 1.707153, 1.888625, 0, 0.5490196, 1, 1,
0.2246396, -0.03084905, 2.25968, 0, 0.5450981, 1, 1,
0.2277706, 1.781521, 1.969253, 0, 0.5372549, 1, 1,
0.2278901, -0.4422315, 2.472422, 0, 0.5333334, 1, 1,
0.2289131, -0.8144053, 3.488657, 0, 0.5254902, 1, 1,
0.2306303, -0.8245529, 3.95418, 0, 0.5215687, 1, 1,
0.2311587, 1.249128, 0.7113535, 0, 0.5137255, 1, 1,
0.2313721, 0.3211902, -0.05181693, 0, 0.509804, 1, 1,
0.2324009, 0.9032122, 1.157931, 0, 0.5019608, 1, 1,
0.2328746, 0.08201741, 1.297623, 0, 0.4941176, 1, 1,
0.2366675, -0.3615142, 3.048566, 0, 0.4901961, 1, 1,
0.2405906, 2.549404, 0.05397584, 0, 0.4823529, 1, 1,
0.241031, -0.7864547, 4.239524, 0, 0.4784314, 1, 1,
0.2416252, -1.329767, 3.96998, 0, 0.4705882, 1, 1,
0.2437012, 1.362919, 1.580423, 0, 0.4666667, 1, 1,
0.2479991, -0.248662, 1.3314, 0, 0.4588235, 1, 1,
0.2563517, 0.1549593, 0.6099372, 0, 0.454902, 1, 1,
0.2597482, -0.438555, 1.847168, 0, 0.4470588, 1, 1,
0.2614653, -0.07365976, 1.103442, 0, 0.4431373, 1, 1,
0.2695437, 0.8032463, -0.6823024, 0, 0.4352941, 1, 1,
0.271475, -0.5481001, 1.17045, 0, 0.4313726, 1, 1,
0.2776162, -0.4306128, 3.332834, 0, 0.4235294, 1, 1,
0.2864072, -0.02794346, 0.7408873, 0, 0.4196078, 1, 1,
0.2909486, -1.653502, 2.679773, 0, 0.4117647, 1, 1,
0.2911468, 1.23555, -0.5889594, 0, 0.4078431, 1, 1,
0.2933971, 1.314419, -0.4359374, 0, 0.4, 1, 1,
0.2955253, 2.688451, 0.9107723, 0, 0.3921569, 1, 1,
0.3014963, 1.310502, -0.2430582, 0, 0.3882353, 1, 1,
0.3087203, -1.160886, 4.085332, 0, 0.3803922, 1, 1,
0.310769, 0.5334438, -0.273732, 0, 0.3764706, 1, 1,
0.31403, 0.2643552, -0.8398061, 0, 0.3686275, 1, 1,
0.3162731, -0.5761415, 2.188992, 0, 0.3647059, 1, 1,
0.3167391, -0.7516132, 1.233136, 0, 0.3568628, 1, 1,
0.3168702, 0.410924, -0.4138588, 0, 0.3529412, 1, 1,
0.3173785, -0.5203537, 2.071732, 0, 0.345098, 1, 1,
0.3196813, -0.2000391, 1.398046, 0, 0.3411765, 1, 1,
0.321472, -1.096914, 1.9595, 0, 0.3333333, 1, 1,
0.324039, 0.03490198, 2.900731, 0, 0.3294118, 1, 1,
0.3261088, -1.44131, 2.603521, 0, 0.3215686, 1, 1,
0.3270736, 0.7530972, 1.714256, 0, 0.3176471, 1, 1,
0.3308008, -0.3891072, 2.862801, 0, 0.3098039, 1, 1,
0.3341534, -1.353214, 2.05559, 0, 0.3058824, 1, 1,
0.3344899, 0.08774001, -0.6389452, 0, 0.2980392, 1, 1,
0.3399526, -1.324992, 4.24059, 0, 0.2901961, 1, 1,
0.3440896, -1.529814, 3.501058, 0, 0.2862745, 1, 1,
0.3479654, 1.013051, 0.06270574, 0, 0.2784314, 1, 1,
0.3479774, -1.152272, 2.877583, 0, 0.2745098, 1, 1,
0.351806, 0.09827296, 0.8108632, 0, 0.2666667, 1, 1,
0.3518347, 2.128227, -0.1136839, 0, 0.2627451, 1, 1,
0.3530728, 0.1848498, 1.526041, 0, 0.254902, 1, 1,
0.3541497, 1.00388, 0.9123665, 0, 0.2509804, 1, 1,
0.3589874, 0.3898399, 0.7450696, 0, 0.2431373, 1, 1,
0.3658413, 1.915416, -0.5495617, 0, 0.2392157, 1, 1,
0.3670863, -0.1640579, 0.8467039, 0, 0.2313726, 1, 1,
0.3700727, -1.106686, 3.3062, 0, 0.227451, 1, 1,
0.3721088, -0.6184731, 1.924188, 0, 0.2196078, 1, 1,
0.3728167, 1.749353, 0.2511945, 0, 0.2156863, 1, 1,
0.3754363, -0.08637746, 0.9564974, 0, 0.2078431, 1, 1,
0.3754894, 0.251672, 0.8799075, 0, 0.2039216, 1, 1,
0.3761163, -0.5330338, 2.162285, 0, 0.1960784, 1, 1,
0.3774581, -0.3988988, 3.625429, 0, 0.1882353, 1, 1,
0.3787945, -0.7717308, 2.440706, 0, 0.1843137, 1, 1,
0.3835239, 0.3151664, 1.632024, 0, 0.1764706, 1, 1,
0.3854674, 0.8618172, 0.1859131, 0, 0.172549, 1, 1,
0.3869953, -0.2729537, 0.8651713, 0, 0.1647059, 1, 1,
0.3884934, 1.989477, -0.2125032, 0, 0.1607843, 1, 1,
0.3942376, -1.418897, 2.792445, 0, 0.1529412, 1, 1,
0.397938, 0.7021808, 0.4654934, 0, 0.1490196, 1, 1,
0.3990269, 0.3238243, 1.291033, 0, 0.1411765, 1, 1,
0.4032462, 0.3181803, 1.291729, 0, 0.1372549, 1, 1,
0.4045633, -0.453667, 4.229633, 0, 0.1294118, 1, 1,
0.4046274, -0.7285681, 2.248377, 0, 0.1254902, 1, 1,
0.4063156, 1.613344, 0.4857425, 0, 0.1176471, 1, 1,
0.4103796, -0.9378524, 1.929892, 0, 0.1137255, 1, 1,
0.4117455, -1.858385, 1.918307, 0, 0.1058824, 1, 1,
0.4119614, -1.82829, 3.318848, 0, 0.09803922, 1, 1,
0.4266699, 0.2294267, 3.233303, 0, 0.09411765, 1, 1,
0.4332626, 1.429335, 1.590437, 0, 0.08627451, 1, 1,
0.4348291, -0.5898026, 4.656907, 0, 0.08235294, 1, 1,
0.4351543, -0.1495445, 1.375099, 0, 0.07450981, 1, 1,
0.4362035, 1.358152, 1.351009, 0, 0.07058824, 1, 1,
0.4387097, 0.3649473, 1.290353, 0, 0.0627451, 1, 1,
0.4398692, -0.1084758, 3.321266, 0, 0.05882353, 1, 1,
0.449687, 1.155754, -0.7243136, 0, 0.05098039, 1, 1,
0.4568001, -0.7112306, 3.163212, 0, 0.04705882, 1, 1,
0.4709022, -1.466601, 4.602123, 0, 0.03921569, 1, 1,
0.4725912, -1.026045, 3.21515, 0, 0.03529412, 1, 1,
0.4736384, 1.388949, 0.08772567, 0, 0.02745098, 1, 1,
0.473754, 0.2162753, 0.5693739, 0, 0.02352941, 1, 1,
0.4751711, -1.199835, 3.028848, 0, 0.01568628, 1, 1,
0.4755535, -0.04426841, 0.43444, 0, 0.01176471, 1, 1,
0.4757494, -0.1264736, 2.005175, 0, 0.003921569, 1, 1,
0.4791335, -0.7588103, 2.405051, 0.003921569, 0, 1, 1,
0.4837824, 0.6742637, 0.6298738, 0.007843138, 0, 1, 1,
0.486499, 0.8851143, 0.7089189, 0.01568628, 0, 1, 1,
0.4895975, 0.03897158, 3.262459, 0.01960784, 0, 1, 1,
0.4904822, -0.4761289, 1.495561, 0.02745098, 0, 1, 1,
0.4945088, -0.341417, 3.075908, 0.03137255, 0, 1, 1,
0.4973516, -0.7226027, 2.564821, 0.03921569, 0, 1, 1,
0.498095, -0.4018711, 2.631268, 0.04313726, 0, 1, 1,
0.5013838, 1.093456, -0.83552, 0.05098039, 0, 1, 1,
0.503132, -0.05751629, 1.228077, 0.05490196, 0, 1, 1,
0.5054559, -0.05849329, -0.2918589, 0.0627451, 0, 1, 1,
0.5091282, 1.139685, 0.08125019, 0.06666667, 0, 1, 1,
0.5155565, -1.293383, 1.673988, 0.07450981, 0, 1, 1,
0.5168091, -0.5538844, 1.012601, 0.07843138, 0, 1, 1,
0.5208655, -0.3597061, 2.444341, 0.08627451, 0, 1, 1,
0.5218006, -0.8021876, 3.514157, 0.09019608, 0, 1, 1,
0.5232983, -0.1136272, 2.745041, 0.09803922, 0, 1, 1,
0.5241938, -0.1253321, 3.776422, 0.1058824, 0, 1, 1,
0.5299098, -0.7831146, 2.65237, 0.1098039, 0, 1, 1,
0.5371595, 0.3951041, 1.925195, 0.1176471, 0, 1, 1,
0.5396044, 1.839441, 1.888237, 0.1215686, 0, 1, 1,
0.540656, -0.6102207, 1.471517, 0.1294118, 0, 1, 1,
0.5509798, 0.3744291, 0.9656174, 0.1333333, 0, 1, 1,
0.5544007, 1.035849, 0.7907766, 0.1411765, 0, 1, 1,
0.5563002, -0.4515071, 0.3835665, 0.145098, 0, 1, 1,
0.5586578, -0.9728219, 1.433256, 0.1529412, 0, 1, 1,
0.5591584, -0.5891077, 3.332671, 0.1568628, 0, 1, 1,
0.5596678, -0.8093528, 3.083433, 0.1647059, 0, 1, 1,
0.5648427, -1.763123, 1.900558, 0.1686275, 0, 1, 1,
0.5720904, -0.1514541, 1.307295, 0.1764706, 0, 1, 1,
0.5725817, -0.8739506, 2.898397, 0.1803922, 0, 1, 1,
0.5730426, 0.3230334, 1.440798, 0.1882353, 0, 1, 1,
0.5763358, -0.6669878, 3.061959, 0.1921569, 0, 1, 1,
0.5771447, -0.2836155, 2.101434, 0.2, 0, 1, 1,
0.5793901, -0.2641954, 3.206732, 0.2078431, 0, 1, 1,
0.5836247, 1.098042, -0.8289648, 0.2117647, 0, 1, 1,
0.585815, 0.3924497, -0.4641287, 0.2196078, 0, 1, 1,
0.5881151, 0.4304709, 0.4571461, 0.2235294, 0, 1, 1,
0.5898439, -1.019103, 3.769023, 0.2313726, 0, 1, 1,
0.5916191, -0.637908, 3.505203, 0.2352941, 0, 1, 1,
0.592162, 0.606065, 0.218355, 0.2431373, 0, 1, 1,
0.5932858, 0.2193953, 1.066232, 0.2470588, 0, 1, 1,
0.5940207, -0.8458763, 2.705932, 0.254902, 0, 1, 1,
0.5982242, 0.2382146, 0.9403645, 0.2588235, 0, 1, 1,
0.6002182, -0.542788, 0.3529938, 0.2666667, 0, 1, 1,
0.6046168, -0.7453431, 2.781361, 0.2705882, 0, 1, 1,
0.6087288, -1.575168, 4.305523, 0.2784314, 0, 1, 1,
0.6116205, 0.8677262, -0.8793601, 0.282353, 0, 1, 1,
0.620101, -1.066994, 2.947784, 0.2901961, 0, 1, 1,
0.621807, 1.056036, -0.4039096, 0.2941177, 0, 1, 1,
0.622493, 0.4452253, 1.525906, 0.3019608, 0, 1, 1,
0.624644, 0.7292388, 1.384636, 0.3098039, 0, 1, 1,
0.6345023, -0.7340693, 1.25503, 0.3137255, 0, 1, 1,
0.6349092, 1.36694, 0.6095357, 0.3215686, 0, 1, 1,
0.6356114, -0.008507504, 0.8950747, 0.3254902, 0, 1, 1,
0.6399274, -0.743692, 1.401096, 0.3333333, 0, 1, 1,
0.6409051, -0.2969541, 2.387547, 0.3372549, 0, 1, 1,
0.6443542, -0.7534761, 2.799138, 0.345098, 0, 1, 1,
0.6446816, 0.2496313, 0.7784917, 0.3490196, 0, 1, 1,
0.6495485, -0.2083636, 0.5511523, 0.3568628, 0, 1, 1,
0.6528122, -0.4767757, 3.598146, 0.3607843, 0, 1, 1,
0.6586577, 0.6832431, 0.3303815, 0.3686275, 0, 1, 1,
0.6742979, -1.174141, 0.93989, 0.372549, 0, 1, 1,
0.6767607, -0.7766328, 1.677451, 0.3803922, 0, 1, 1,
0.680758, -0.208335, 1.122459, 0.3843137, 0, 1, 1,
0.6809643, 0.2892404, 0.6895703, 0.3921569, 0, 1, 1,
0.6815238, 0.3089802, 2.157053, 0.3960784, 0, 1, 1,
0.6864359, -1.090315, 0.9225491, 0.4039216, 0, 1, 1,
0.6901924, 1.164951, -0.1816843, 0.4117647, 0, 1, 1,
0.6927345, -1.365491, 3.592003, 0.4156863, 0, 1, 1,
0.6947908, -0.09779936, 2.487363, 0.4235294, 0, 1, 1,
0.6994541, 1.641349, 0.5934216, 0.427451, 0, 1, 1,
0.7013174, 2.629545, 1.196544, 0.4352941, 0, 1, 1,
0.7021179, -1.39325, 2.992753, 0.4392157, 0, 1, 1,
0.7103127, 1.123306, 2.008733, 0.4470588, 0, 1, 1,
0.7167962, -0.9283534, 1.515065, 0.4509804, 0, 1, 1,
0.7227942, -0.3616763, 2.503254, 0.4588235, 0, 1, 1,
0.7232102, -1.792666, 2.907905, 0.4627451, 0, 1, 1,
0.7240751, 1.451805, -0.5430501, 0.4705882, 0, 1, 1,
0.7257275, -0.7815297, 1.887305, 0.4745098, 0, 1, 1,
0.7258623, -1.019653, 0.7606933, 0.4823529, 0, 1, 1,
0.7271706, -0.1893972, 1.600687, 0.4862745, 0, 1, 1,
0.7360079, -0.1428535, 3.192859, 0.4941176, 0, 1, 1,
0.7360738, -0.4880788, 2.903563, 0.5019608, 0, 1, 1,
0.7371174, -2.088387, 2.652932, 0.5058824, 0, 1, 1,
0.7374578, 0.9321383, 0.7488223, 0.5137255, 0, 1, 1,
0.7468387, -0.658197, 2.943169, 0.5176471, 0, 1, 1,
0.749341, 0.7319311, 1.161464, 0.5254902, 0, 1, 1,
0.7631739, 0.08341153, 2.613683, 0.5294118, 0, 1, 1,
0.7640153, -2.157044, 2.482758, 0.5372549, 0, 1, 1,
0.7723898, -2.236379, 4.993314, 0.5411765, 0, 1, 1,
0.7770728, -0.5778131, 1.937974, 0.5490196, 0, 1, 1,
0.7785196, 0.6380256, 1.189444, 0.5529412, 0, 1, 1,
0.7811972, -0.4688553, 2.109723, 0.5607843, 0, 1, 1,
0.7858293, 0.9905602, 1.219315, 0.5647059, 0, 1, 1,
0.7902792, 0.2469787, 1.447984, 0.572549, 0, 1, 1,
0.7917317, 0.4721756, 3.366556, 0.5764706, 0, 1, 1,
0.7918918, 1.849269, -0.5938035, 0.5843138, 0, 1, 1,
0.7958117, 0.7085047, 1.189582, 0.5882353, 0, 1, 1,
0.8009216, 0.618321, 0.9236421, 0.5960785, 0, 1, 1,
0.8082352, -1.210433, 2.631065, 0.6039216, 0, 1, 1,
0.8092583, 0.5379992, 0.06616751, 0.6078432, 0, 1, 1,
0.8101386, -0.02762972, 1.910464, 0.6156863, 0, 1, 1,
0.8102017, -1.318167, 4.771282, 0.6196079, 0, 1, 1,
0.8154952, -0.04232487, 1.779319, 0.627451, 0, 1, 1,
0.8212435, 0.536397, -1.103006, 0.6313726, 0, 1, 1,
0.8233771, 0.5879151, 1.09294, 0.6392157, 0, 1, 1,
0.8263301, 0.4460222, 0.7831249, 0.6431373, 0, 1, 1,
0.8293978, 0.05492237, 1.475778, 0.6509804, 0, 1, 1,
0.833379, -1.115866, 1.374784, 0.654902, 0, 1, 1,
0.842096, -0.2382016, 2.401118, 0.6627451, 0, 1, 1,
0.8472898, 0.01047104, 2.782438, 0.6666667, 0, 1, 1,
0.8484499, -2.912658, 2.935245, 0.6745098, 0, 1, 1,
0.8487809, -0.3848167, 1.918205, 0.6784314, 0, 1, 1,
0.849251, -1.111355, 2.457457, 0.6862745, 0, 1, 1,
0.8492549, -0.7132319, 2.469995, 0.6901961, 0, 1, 1,
0.8558891, -0.2663327, 1.753008, 0.6980392, 0, 1, 1,
0.8602537, -0.3873377, 1.264302, 0.7058824, 0, 1, 1,
0.8651626, 0.578365, 2.119121, 0.7098039, 0, 1, 1,
0.8652083, 0.9184374, 0.8729985, 0.7176471, 0, 1, 1,
0.8737481, 1.232425, 2.328425, 0.7215686, 0, 1, 1,
0.8749548, -0.4520861, 2.868685, 0.7294118, 0, 1, 1,
0.8789697, 0.9514328, -0.4629751, 0.7333333, 0, 1, 1,
0.880959, -1.304834, 2.750367, 0.7411765, 0, 1, 1,
0.8873823, 0.3896874, 1.785644, 0.7450981, 0, 1, 1,
0.890497, -0.6712468, 2.358784, 0.7529412, 0, 1, 1,
0.8914822, 0.6108375, -0.158103, 0.7568628, 0, 1, 1,
0.8941578, -1.629718, 2.563923, 0.7647059, 0, 1, 1,
0.9052274, 0.279004, 2.268368, 0.7686275, 0, 1, 1,
0.9094059, 0.2173479, 0.05838101, 0.7764706, 0, 1, 1,
0.9122404, -0.190288, 0.6412366, 0.7803922, 0, 1, 1,
0.9132919, -0.7217577, 2.598104, 0.7882353, 0, 1, 1,
0.9185651, -0.282133, 1.929316, 0.7921569, 0, 1, 1,
0.9206417, 1.026334, 2.034854, 0.8, 0, 1, 1,
0.924333, -1.312992, 1.56646, 0.8078431, 0, 1, 1,
0.9283015, 0.07400954, 1.62668, 0.8117647, 0, 1, 1,
0.9339652, -0.5581168, 1.817006, 0.8196079, 0, 1, 1,
0.9343229, 0.08559478, 2.39081, 0.8235294, 0, 1, 1,
0.9394136, -0.08840983, 1.529009, 0.8313726, 0, 1, 1,
0.9457022, -1.22646, 2.067243, 0.8352941, 0, 1, 1,
0.9477522, 2.877255, 0.8997925, 0.8431373, 0, 1, 1,
0.9494021, 1.411879, -1.002082, 0.8470588, 0, 1, 1,
0.9498991, 0.108743, 2.228927, 0.854902, 0, 1, 1,
0.9500132, -0.6211419, 1.321968, 0.8588235, 0, 1, 1,
0.9520365, -0.5514657, 2.456527, 0.8666667, 0, 1, 1,
0.9536847, -0.2325113, 2.034007, 0.8705882, 0, 1, 1,
0.954867, 0.5955412, 0.5809993, 0.8784314, 0, 1, 1,
0.9562354, 1.132146, 2.946209, 0.8823529, 0, 1, 1,
0.9632194, 0.5180681, 1.053749, 0.8901961, 0, 1, 1,
0.9689267, 0.06744191, 1.744973, 0.8941177, 0, 1, 1,
0.9690807, -1.056137, 2.799248, 0.9019608, 0, 1, 1,
0.9717318, 1.235441, -0.1660432, 0.9098039, 0, 1, 1,
0.9718999, -0.8019198, 0.8168352, 0.9137255, 0, 1, 1,
0.9772596, -0.7219222, 0.8062873, 0.9215686, 0, 1, 1,
0.9812291, 0.743827, 1.776615, 0.9254902, 0, 1, 1,
0.9883896, 0.5548919, 2.750716, 0.9333333, 0, 1, 1,
0.9889307, -3.191128, 3.526944, 0.9372549, 0, 1, 1,
0.9892904, 0.368167, 2.039921, 0.945098, 0, 1, 1,
0.9900973, 1.373252, 0.3336319, 0.9490196, 0, 1, 1,
0.9922652, -0.3316883, 0.9054583, 0.9568627, 0, 1, 1,
0.995527, -0.5611904, 1.2377, 0.9607843, 0, 1, 1,
0.9961273, 0.8937237, 0.5582786, 0.9686275, 0, 1, 1,
0.9975691, -0.3590776, 1.047425, 0.972549, 0, 1, 1,
0.999417, -1.822079, 3.535658, 0.9803922, 0, 1, 1,
0.9997035, -0.2112747, 1.808886, 0.9843137, 0, 1, 1,
1.000362, 0.1647053, 1.316724, 0.9921569, 0, 1, 1,
1.00244, -0.703989, 0.2041704, 0.9960784, 0, 1, 1,
1.003659, 0.1253561, 0.8945242, 1, 0, 0.9960784, 1,
1.003991, -0.9217337, 3.1975, 1, 0, 0.9882353, 1,
1.004897, 1.907001, -1.543969, 1, 0, 0.9843137, 1,
1.010407, 0.7966498, 1.737797, 1, 0, 0.9764706, 1,
1.011409, -1.754937, 0.02465196, 1, 0, 0.972549, 1,
1.014411, 0.4255468, 1.684054, 1, 0, 0.9647059, 1,
1.016607, -0.6943631, 1.376757, 1, 0, 0.9607843, 1,
1.019779, -0.7473572, 1.50041, 1, 0, 0.9529412, 1,
1.020524, -0.6569076, 1.520867, 1, 0, 0.9490196, 1,
1.022487, -1.522625, 2.853687, 1, 0, 0.9411765, 1,
1.02317, -0.8011805, 4.896829, 1, 0, 0.9372549, 1,
1.029357, -0.6411063, 1.943096, 1, 0, 0.9294118, 1,
1.031827, 0.6542455, 2.152447, 1, 0, 0.9254902, 1,
1.03312, 2.139823, 1.528646, 1, 0, 0.9176471, 1,
1.035988, 0.5502531, 0.6311982, 1, 0, 0.9137255, 1,
1.039417, 0.9815478, 0.9846759, 1, 0, 0.9058824, 1,
1.040333, -0.5042561, 3.399234, 1, 0, 0.9019608, 1,
1.04341, 1.135512, -0.351726, 1, 0, 0.8941177, 1,
1.062864, 0.682853, 0.863156, 1, 0, 0.8862745, 1,
1.065964, -0.63019, 0.8565679, 1, 0, 0.8823529, 1,
1.068212, -1.002822, 2.668793, 1, 0, 0.8745098, 1,
1.075303, 0.08353551, -0.09441427, 1, 0, 0.8705882, 1,
1.075742, -0.07866075, 2.623889, 1, 0, 0.8627451, 1,
1.076497, -0.6124226, 1.945433, 1, 0, 0.8588235, 1,
1.079999, 1.757557, 0.8217114, 1, 0, 0.8509804, 1,
1.087268, -1.808864, 2.420115, 1, 0, 0.8470588, 1,
1.090744, 0.5537948, 3.389536, 1, 0, 0.8392157, 1,
1.095153, 0.2857817, 0.4090855, 1, 0, 0.8352941, 1,
1.101893, -0.5368253, 0.6906548, 1, 0, 0.827451, 1,
1.10396, 1.077477, 0.5251703, 1, 0, 0.8235294, 1,
1.108665, -1.105771, 2.489797, 1, 0, 0.8156863, 1,
1.115974, 0.8596844, -1.459845, 1, 0, 0.8117647, 1,
1.120413, 0.2692786, 1.195587, 1, 0, 0.8039216, 1,
1.12327, -0.3925516, 3.279937, 1, 0, 0.7960784, 1,
1.126578, 0.09629653, 4.075165, 1, 0, 0.7921569, 1,
1.130042, -1.646178, 2.476999, 1, 0, 0.7843137, 1,
1.131978, -1.400524, 3.163572, 1, 0, 0.7803922, 1,
1.138379, 0.3776, 2.255752, 1, 0, 0.772549, 1,
1.139204, 0.5009949, 1.008098, 1, 0, 0.7686275, 1,
1.149658, 1.468256, 1.654445, 1, 0, 0.7607843, 1,
1.158855, -1.03632, 1.875585, 1, 0, 0.7568628, 1,
1.160673, -0.1997313, 1.307533, 1, 0, 0.7490196, 1,
1.165692, 0.1499968, 1.708223, 1, 0, 0.7450981, 1,
1.166683, 0.427554, 2.220248, 1, 0, 0.7372549, 1,
1.176331, -0.1295793, 2.20986, 1, 0, 0.7333333, 1,
1.176884, -0.9335157, 1.598093, 1, 0, 0.7254902, 1,
1.178314, 0.9180256, 0.6074573, 1, 0, 0.7215686, 1,
1.190943, 0.9211761, 0.9157736, 1, 0, 0.7137255, 1,
1.195455, 0.6466256, 0.4352305, 1, 0, 0.7098039, 1,
1.197448, -0.3372379, 0.9426682, 1, 0, 0.7019608, 1,
1.200139, 0.8843251, -0.2664782, 1, 0, 0.6941177, 1,
1.205514, -0.431958, 2.680889, 1, 0, 0.6901961, 1,
1.209319, -0.1527377, 2.071455, 1, 0, 0.682353, 1,
1.213287, -0.9191121, 2.408503, 1, 0, 0.6784314, 1,
1.215539, 0.5347817, 1.767518, 1, 0, 0.6705883, 1,
1.231641, -0.8077147, 1.177744, 1, 0, 0.6666667, 1,
1.24328, 0.6506734, 1.971956, 1, 0, 0.6588235, 1,
1.243714, 1.018987, 0.1673564, 1, 0, 0.654902, 1,
1.244697, 0.6411492, 1.208089, 1, 0, 0.6470588, 1,
1.248239, -0.2782527, 2.743327, 1, 0, 0.6431373, 1,
1.250799, -0.9543058, 0.4133871, 1, 0, 0.6352941, 1,
1.2653, -0.5327446, 2.044381, 1, 0, 0.6313726, 1,
1.266748, 0.3509236, 0.4496593, 1, 0, 0.6235294, 1,
1.267628, 1.805521, 1.980988, 1, 0, 0.6196079, 1,
1.273768, 0.8588638, 0.1839987, 1, 0, 0.6117647, 1,
1.276305, -0.6698449, 1.497735, 1, 0, 0.6078432, 1,
1.285775, 0.5005219, 1.046572, 1, 0, 0.6, 1,
1.28883, -0.8790254, -0.1156095, 1, 0, 0.5921569, 1,
1.307986, 1.700396, 0.1925817, 1, 0, 0.5882353, 1,
1.313276, 0.1152371, 1.228169, 1, 0, 0.5803922, 1,
1.31676, 1.014046, -0.5649621, 1, 0, 0.5764706, 1,
1.321086, 1.135364, 1.299344, 1, 0, 0.5686275, 1,
1.331887, 0.5072979, -0.6854126, 1, 0, 0.5647059, 1,
1.346784, 0.6312814, 0.2576239, 1, 0, 0.5568628, 1,
1.350251, 0.2614928, 1.164662, 1, 0, 0.5529412, 1,
1.351565, -2.313904, 1.20204, 1, 0, 0.5450981, 1,
1.353463, 1.262877, 2.511443, 1, 0, 0.5411765, 1,
1.36702, -1.456062, 2.827763, 1, 0, 0.5333334, 1,
1.373057, -1.443767, 1.619816, 1, 0, 0.5294118, 1,
1.373141, 0.5444845, -0.9380448, 1, 0, 0.5215687, 1,
1.399384, -0.9181058, 2.226318, 1, 0, 0.5176471, 1,
1.403449, 0.3574785, -0.1416695, 1, 0, 0.509804, 1,
1.419897, -0.8301334, 2.414902, 1, 0, 0.5058824, 1,
1.428265, -1.58558, 2.182188, 1, 0, 0.4980392, 1,
1.428942, 0.1912694, 2.073447, 1, 0, 0.4901961, 1,
1.445075, 1.249173, 1.178654, 1, 0, 0.4862745, 1,
1.445921, -0.761686, 3.922202, 1, 0, 0.4784314, 1,
1.453341, -0.03613859, 0.6044645, 1, 0, 0.4745098, 1,
1.453537, -0.5196409, 1.549386, 1, 0, 0.4666667, 1,
1.456043, 0.08422302, 2.119458, 1, 0, 0.4627451, 1,
1.460168, -0.05798962, 1.892474, 1, 0, 0.454902, 1,
1.462313, 0.9273318, 1.233447, 1, 0, 0.4509804, 1,
1.471799, -0.2643256, 0.3627274, 1, 0, 0.4431373, 1,
1.483294, 0.2626624, 1.296075, 1, 0, 0.4392157, 1,
1.486532, -0.07183065, 1.20366, 1, 0, 0.4313726, 1,
1.48695, -1.193231, 2.099811, 1, 0, 0.427451, 1,
1.492423, 0.0276567, 1.303167, 1, 0, 0.4196078, 1,
1.502017, 0.7269115, 2.174261, 1, 0, 0.4156863, 1,
1.502883, -0.6485, 2.10018, 1, 0, 0.4078431, 1,
1.506692, 0.4909346, 1.650503, 1, 0, 0.4039216, 1,
1.508492, 0.06679248, 2.050833, 1, 0, 0.3960784, 1,
1.514297, -0.7736731, 2.494651, 1, 0, 0.3882353, 1,
1.514768, -0.245344, 1.188626, 1, 0, 0.3843137, 1,
1.527095, 0.2628891, 0.6339271, 1, 0, 0.3764706, 1,
1.546075, 0.07401341, 2.256181, 1, 0, 0.372549, 1,
1.551805, -1.896333, 1.25927, 1, 0, 0.3647059, 1,
1.557155, -0.2348617, 2.112111, 1, 0, 0.3607843, 1,
1.558762, 0.9449769, 2.202735, 1, 0, 0.3529412, 1,
1.558937, 1.130983, 1.808985, 1, 0, 0.3490196, 1,
1.559922, -0.7398567, 1.488615, 1, 0, 0.3411765, 1,
1.596291, 0.6885715, -0.445025, 1, 0, 0.3372549, 1,
1.599563, -0.3009975, -0.5940672, 1, 0, 0.3294118, 1,
1.60216, -0.5151296, 0.642004, 1, 0, 0.3254902, 1,
1.60331, -0.2826788, 1.622252, 1, 0, 0.3176471, 1,
1.604453, -0.1802985, 1.00656, 1, 0, 0.3137255, 1,
1.614385, 1.953906, 1.664034, 1, 0, 0.3058824, 1,
1.617317, -0.5408048, 1.020029, 1, 0, 0.2980392, 1,
1.617621, 0.04025767, 1.941434, 1, 0, 0.2941177, 1,
1.620092, 0.3116336, 2.22104, 1, 0, 0.2862745, 1,
1.624897, -1.577377, 2.004301, 1, 0, 0.282353, 1,
1.633288, 1.621862, 1.47326, 1, 0, 0.2745098, 1,
1.641905, -0.7912372, 3.308033, 1, 0, 0.2705882, 1,
1.643623, 0.5125445, -0.5390247, 1, 0, 0.2627451, 1,
1.645256, -1.644273, 2.205805, 1, 0, 0.2588235, 1,
1.658283, 0.1670887, 1.390157, 1, 0, 0.2509804, 1,
1.660176, 0.5180768, 0.9325015, 1, 0, 0.2470588, 1,
1.686418, 1.101016, 1.269773, 1, 0, 0.2392157, 1,
1.691257, -0.07011822, 2.463432, 1, 0, 0.2352941, 1,
1.719211, -0.5246331, 1.568096, 1, 0, 0.227451, 1,
1.753737, -0.7067574, 4.016019, 1, 0, 0.2235294, 1,
1.782692, -0.415261, 3.700474, 1, 0, 0.2156863, 1,
1.816084, 0.469032, 1.404268, 1, 0, 0.2117647, 1,
1.820766, 0.3068385, 1.763347, 1, 0, 0.2039216, 1,
1.828579, -0.624853, 2.878721, 1, 0, 0.1960784, 1,
1.842975, -1.790783, 1.799181, 1, 0, 0.1921569, 1,
1.873207, 2.332439, 0.08593035, 1, 0, 0.1843137, 1,
1.873642, -1.366905, 4.072798, 1, 0, 0.1803922, 1,
1.900052, 0.3835104, 1.308899, 1, 0, 0.172549, 1,
1.913747, -0.295059, 1.088733, 1, 0, 0.1686275, 1,
1.923921, 0.4096607, 1.576577, 1, 0, 0.1607843, 1,
1.928435, 0.2114222, 0.503737, 1, 0, 0.1568628, 1,
1.952553, 0.5386661, 3.673369, 1, 0, 0.1490196, 1,
1.960094, -2.044687, 3.726897, 1, 0, 0.145098, 1,
1.979137, 0.8773085, -0.03194268, 1, 0, 0.1372549, 1,
1.982383, -0.4661009, 3.210582, 1, 0, 0.1333333, 1,
2.011594, 0.7552672, 1.13273, 1, 0, 0.1254902, 1,
2.030102, -0.2881221, 1.694286, 1, 0, 0.1215686, 1,
2.041049, 0.025809, 3.47997, 1, 0, 0.1137255, 1,
2.068749, 2.423915, 1.531693, 1, 0, 0.1098039, 1,
2.08453, -0.2448109, 2.238508, 1, 0, 0.1019608, 1,
2.089235, -0.5285435, 2.531945, 1, 0, 0.09411765, 1,
2.131764, -1.790769, 4.27204, 1, 0, 0.09019608, 1,
2.156336, -1.026836, 1.924291, 1, 0, 0.08235294, 1,
2.185578, 0.3922735, 1.928837, 1, 0, 0.07843138, 1,
2.230909, 0.5673819, 1.146822, 1, 0, 0.07058824, 1,
2.270582, -0.7367619, 1.677918, 1, 0, 0.06666667, 1,
2.287979, 0.3824593, -1.277136, 1, 0, 0.05882353, 1,
2.313128, -0.02615371, 1.874454, 1, 0, 0.05490196, 1,
2.412594, -0.2707567, 1.710339, 1, 0, 0.04705882, 1,
2.430304, -2.007236, 2.056296, 1, 0, 0.04313726, 1,
2.470874, 1.065479, 1.985097, 1, 0, 0.03529412, 1,
2.496706, -0.9883379, 3.009945, 1, 0, 0.03137255, 1,
2.521324, 0.2218775, 0.989374, 1, 0, 0.02352941, 1,
2.690766, 1.614408, 2.89358, 1, 0, 0.01960784, 1,
2.736019, 0.901528, 0.1012641, 1, 0, 0.01176471, 1,
2.809504, -0.4582669, 2.533716, 1, 0, 0.007843138, 1
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
-0.06865585, -4.234036, -6.660162, 0, -0.5, 0.5, 0.5,
-0.06865585, -4.234036, -6.660162, 1, -0.5, 0.5, 0.5,
-0.06865585, -4.234036, -6.660162, 1, 1.5, 0.5, 0.5,
-0.06865585, -4.234036, -6.660162, 0, 1.5, 0.5, 0.5
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
-3.922512, -0.1147037, -6.660162, 0, -0.5, 0.5, 0.5,
-3.922512, -0.1147037, -6.660162, 1, -0.5, 0.5, 0.5,
-3.922512, -0.1147037, -6.660162, 1, 1.5, 0.5, 0.5,
-3.922512, -0.1147037, -6.660162, 0, 1.5, 0.5, 0.5
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
-3.922512, -4.234036, 0.2808933, 0, -0.5, 0.5, 0.5,
-3.922512, -4.234036, 0.2808933, 1, -0.5, 0.5, 0.5,
-3.922512, -4.234036, 0.2808933, 1, 1.5, 0.5, 0.5,
-3.922512, -4.234036, 0.2808933, 0, 1.5, 0.5, 0.5
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
-2, -3.283421, -5.05838,
2, -3.283421, -5.05838,
-2, -3.283421, -5.05838,
-2, -3.441857, -5.325344,
-1, -3.283421, -5.05838,
-1, -3.441857, -5.325344,
0, -3.283421, -5.05838,
0, -3.441857, -5.325344,
1, -3.283421, -5.05838,
1, -3.441857, -5.325344,
2, -3.283421, -5.05838,
2, -3.441857, -5.325344
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
-2, -3.758729, -5.859271, 0, -0.5, 0.5, 0.5,
-2, -3.758729, -5.859271, 1, -0.5, 0.5, 0.5,
-2, -3.758729, -5.859271, 1, 1.5, 0.5, 0.5,
-2, -3.758729, -5.859271, 0, 1.5, 0.5, 0.5,
-1, -3.758729, -5.859271, 0, -0.5, 0.5, 0.5,
-1, -3.758729, -5.859271, 1, -0.5, 0.5, 0.5,
-1, -3.758729, -5.859271, 1, 1.5, 0.5, 0.5,
-1, -3.758729, -5.859271, 0, 1.5, 0.5, 0.5,
0, -3.758729, -5.859271, 0, -0.5, 0.5, 0.5,
0, -3.758729, -5.859271, 1, -0.5, 0.5, 0.5,
0, -3.758729, -5.859271, 1, 1.5, 0.5, 0.5,
0, -3.758729, -5.859271, 0, 1.5, 0.5, 0.5,
1, -3.758729, -5.859271, 0, -0.5, 0.5, 0.5,
1, -3.758729, -5.859271, 1, -0.5, 0.5, 0.5,
1, -3.758729, -5.859271, 1, 1.5, 0.5, 0.5,
1, -3.758729, -5.859271, 0, 1.5, 0.5, 0.5,
2, -3.758729, -5.859271, 0, -0.5, 0.5, 0.5,
2, -3.758729, -5.859271, 1, -0.5, 0.5, 0.5,
2, -3.758729, -5.859271, 1, 1.5, 0.5, 0.5,
2, -3.758729, -5.859271, 0, 1.5, 0.5, 0.5
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
-3.03316, -3, -5.05838,
-3.03316, 2, -5.05838,
-3.03316, -3, -5.05838,
-3.181386, -3, -5.325344,
-3.03316, -2, -5.05838,
-3.181386, -2, -5.325344,
-3.03316, -1, -5.05838,
-3.181386, -1, -5.325344,
-3.03316, 0, -5.05838,
-3.181386, 0, -5.325344,
-3.03316, 1, -5.05838,
-3.181386, 1, -5.325344,
-3.03316, 2, -5.05838,
-3.181386, 2, -5.325344
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
-3.477836, -3, -5.859271, 0, -0.5, 0.5, 0.5,
-3.477836, -3, -5.859271, 1, -0.5, 0.5, 0.5,
-3.477836, -3, -5.859271, 1, 1.5, 0.5, 0.5,
-3.477836, -3, -5.859271, 0, 1.5, 0.5, 0.5,
-3.477836, -2, -5.859271, 0, -0.5, 0.5, 0.5,
-3.477836, -2, -5.859271, 1, -0.5, 0.5, 0.5,
-3.477836, -2, -5.859271, 1, 1.5, 0.5, 0.5,
-3.477836, -2, -5.859271, 0, 1.5, 0.5, 0.5,
-3.477836, -1, -5.859271, 0, -0.5, 0.5, 0.5,
-3.477836, -1, -5.859271, 1, -0.5, 0.5, 0.5,
-3.477836, -1, -5.859271, 1, 1.5, 0.5, 0.5,
-3.477836, -1, -5.859271, 0, 1.5, 0.5, 0.5,
-3.477836, 0, -5.859271, 0, -0.5, 0.5, 0.5,
-3.477836, 0, -5.859271, 1, -0.5, 0.5, 0.5,
-3.477836, 0, -5.859271, 1, 1.5, 0.5, 0.5,
-3.477836, 0, -5.859271, 0, 1.5, 0.5, 0.5,
-3.477836, 1, -5.859271, 0, -0.5, 0.5, 0.5,
-3.477836, 1, -5.859271, 1, -0.5, 0.5, 0.5,
-3.477836, 1, -5.859271, 1, 1.5, 0.5, 0.5,
-3.477836, 1, -5.859271, 0, 1.5, 0.5, 0.5,
-3.477836, 2, -5.859271, 0, -0.5, 0.5, 0.5,
-3.477836, 2, -5.859271, 1, -0.5, 0.5, 0.5,
-3.477836, 2, -5.859271, 1, 1.5, 0.5, 0.5,
-3.477836, 2, -5.859271, 0, 1.5, 0.5, 0.5
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
-3.03316, -3.283421, -4,
-3.03316, -3.283421, 4,
-3.03316, -3.283421, -4,
-3.181386, -3.441857, -4,
-3.03316, -3.283421, -2,
-3.181386, -3.441857, -2,
-3.03316, -3.283421, 0,
-3.181386, -3.441857, 0,
-3.03316, -3.283421, 2,
-3.181386, -3.441857, 2,
-3.03316, -3.283421, 4,
-3.181386, -3.441857, 4
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
-3.477836, -3.758729, -4, 0, -0.5, 0.5, 0.5,
-3.477836, -3.758729, -4, 1, -0.5, 0.5, 0.5,
-3.477836, -3.758729, -4, 1, 1.5, 0.5, 0.5,
-3.477836, -3.758729, -4, 0, 1.5, 0.5, 0.5,
-3.477836, -3.758729, -2, 0, -0.5, 0.5, 0.5,
-3.477836, -3.758729, -2, 1, -0.5, 0.5, 0.5,
-3.477836, -3.758729, -2, 1, 1.5, 0.5, 0.5,
-3.477836, -3.758729, -2, 0, 1.5, 0.5, 0.5,
-3.477836, -3.758729, 0, 0, -0.5, 0.5, 0.5,
-3.477836, -3.758729, 0, 1, -0.5, 0.5, 0.5,
-3.477836, -3.758729, 0, 1, 1.5, 0.5, 0.5,
-3.477836, -3.758729, 0, 0, 1.5, 0.5, 0.5,
-3.477836, -3.758729, 2, 0, -0.5, 0.5, 0.5,
-3.477836, -3.758729, 2, 1, -0.5, 0.5, 0.5,
-3.477836, -3.758729, 2, 1, 1.5, 0.5, 0.5,
-3.477836, -3.758729, 2, 0, 1.5, 0.5, 0.5,
-3.477836, -3.758729, 4, 0, -0.5, 0.5, 0.5,
-3.477836, -3.758729, 4, 1, -0.5, 0.5, 0.5,
-3.477836, -3.758729, 4, 1, 1.5, 0.5, 0.5,
-3.477836, -3.758729, 4, 0, 1.5, 0.5, 0.5
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
-3.03316, -3.283421, -5.05838,
-3.03316, 3.054014, -5.05838,
-3.03316, -3.283421, 5.620167,
-3.03316, 3.054014, 5.620167,
-3.03316, -3.283421, -5.05838,
-3.03316, -3.283421, 5.620167,
-3.03316, 3.054014, -5.05838,
-3.03316, 3.054014, 5.620167,
-3.03316, -3.283421, -5.05838,
2.895849, -3.283421, -5.05838,
-3.03316, -3.283421, 5.620167,
2.895849, -3.283421, 5.620167,
-3.03316, 3.054014, -5.05838,
2.895849, 3.054014, -5.05838,
-3.03316, 3.054014, 5.620167,
2.895849, 3.054014, 5.620167,
2.895849, -3.283421, -5.05838,
2.895849, 3.054014, -5.05838,
2.895849, -3.283421, 5.620167,
2.895849, 3.054014, 5.620167,
2.895849, -3.283421, -5.05838,
2.895849, -3.283421, 5.620167,
2.895849, 3.054014, -5.05838,
2.895849, 3.054014, 5.620167
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
var radius = 7.347767;
var distance = 32.69105;
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
mvMatrix.translate( 0.06865585, 0.1147037, -0.2808933 );
mvMatrix.scale( 1.339946, 1.253591, 0.7439729 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.69105);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Jasmolin_I<-read.table("Jasmolin_I.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Jasmolin_I$V2
```

```
## Error in eval(expr, envir, enclos): object 'Jasmolin_I' not found
```

```r
y<-Jasmolin_I$V3
```

```
## Error in eval(expr, envir, enclos): object 'Jasmolin_I' not found
```

```r
z<-Jasmolin_I$V4
```

```
## Error in eval(expr, envir, enclos): object 'Jasmolin_I' not found
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
-2.946816, 1.423154, -1.00235, 0, 0, 1, 1, 1,
-2.695182, -0.0863285, -2.306658, 1, 0, 0, 1, 1,
-2.472792, 0.2553821, -1.632404, 1, 0, 0, 1, 1,
-2.456673, -0.2475851, -0.6105014, 1, 0, 0, 1, 1,
-2.447953, 1.047004, -0.5206131, 1, 0, 0, 1, 1,
-2.390424, 1.158389, -1.293317, 1, 0, 0, 1, 1,
-2.379035, 0.1696055, -2.306946, 0, 0, 0, 1, 1,
-2.366084, -1.138449, -1.786403, 0, 0, 0, 1, 1,
-2.33154, -0.04171624, -1.419096, 0, 0, 0, 1, 1,
-2.31038, -0.7705747, -3.96417, 0, 0, 0, 1, 1,
-2.259212, -0.6540276, -2.573392, 0, 0, 0, 1, 1,
-2.233207, -2.227906, -2.059829, 0, 0, 0, 1, 1,
-2.181383, 0.7685282, -0.113674, 0, 0, 0, 1, 1,
-2.132793, -0.1456793, -2.163309, 1, 1, 1, 1, 1,
-2.069136, 1.327962, 0.467414, 1, 1, 1, 1, 1,
-2.066971, 0.8105928, -3.206861, 1, 1, 1, 1, 1,
-1.996733, 0.2297325, -0.5920395, 1, 1, 1, 1, 1,
-1.949606, -0.08734862, -2.873352, 1, 1, 1, 1, 1,
-1.93631, 0.6194673, -1.792285, 1, 1, 1, 1, 1,
-1.935533, 0.644334, -0.1264013, 1, 1, 1, 1, 1,
-1.930826, -0.2709856, -1.727326, 1, 1, 1, 1, 1,
-1.919079, 0.06264835, -2.152326, 1, 1, 1, 1, 1,
-1.889189, 0.4756328, -1.824587, 1, 1, 1, 1, 1,
-1.844724, 0.6968029, -0.4263331, 1, 1, 1, 1, 1,
-1.841154, 0.3860084, 0.3470164, 1, 1, 1, 1, 1,
-1.83427, -2.031236, -2.847492, 1, 1, 1, 1, 1,
-1.804075, -0.9360582, -3.496419, 1, 1, 1, 1, 1,
-1.793768, -0.6200164, -0.9559259, 1, 1, 1, 1, 1,
-1.790589, 1.474015, -1.734073, 0, 0, 1, 1, 1,
-1.780229, 0.4351088, -3.993508, 1, 0, 0, 1, 1,
-1.756512, 0.03072636, 0.7491699, 1, 0, 0, 1, 1,
-1.752163, -1.02372, -2.874968, 1, 0, 0, 1, 1,
-1.749385, 1.353172, -1.067828, 1, 0, 0, 1, 1,
-1.747408, 0.9915054, 0.1811795, 1, 0, 0, 1, 1,
-1.740448, 0.1229707, -3.54812, 0, 0, 0, 1, 1,
-1.735715, 0.9541155, -1.914731, 0, 0, 0, 1, 1,
-1.713991, -1.156296, -3.186877, 0, 0, 0, 1, 1,
-1.707736, 0.6243218, -0.6162561, 0, 0, 0, 1, 1,
-1.694106, 0.4238442, -0.4745596, 0, 0, 0, 1, 1,
-1.686854, -1.02451, -3.223385, 0, 0, 0, 1, 1,
-1.677306, 0.384708, -1.231169, 0, 0, 0, 1, 1,
-1.644486, 1.18278, -0.4429547, 1, 1, 1, 1, 1,
-1.640896, -0.594175, -2.08076, 1, 1, 1, 1, 1,
-1.604525, -2.415605, -1.894206, 1, 1, 1, 1, 1,
-1.601903, 0.02087938, -0.612354, 1, 1, 1, 1, 1,
-1.599089, 0.4107716, -1.496343, 1, 1, 1, 1, 1,
-1.577848, -0.3708878, -0.9477477, 1, 1, 1, 1, 1,
-1.567866, 0.1744505, -1.349327, 1, 1, 1, 1, 1,
-1.562531, -0.4536243, -3.262803, 1, 1, 1, 1, 1,
-1.557652, 1.060671, -0.2056606, 1, 1, 1, 1, 1,
-1.557456, 0.8319525, -2.661834, 1, 1, 1, 1, 1,
-1.555686, -0.1528461, -2.436588, 1, 1, 1, 1, 1,
-1.555395, -0.3314084, -1.010447, 1, 1, 1, 1, 1,
-1.523897, -1.200751, -1.534719, 1, 1, 1, 1, 1,
-1.51689, -1.650088, -3.620898, 1, 1, 1, 1, 1,
-1.513227, -0.1503108, -0.9517615, 1, 1, 1, 1, 1,
-1.508691, -1.313231, -2.246418, 0, 0, 1, 1, 1,
-1.506143, -0.1112533, -2.205288, 1, 0, 0, 1, 1,
-1.505376, 0.7982152, 0.838127, 1, 0, 0, 1, 1,
-1.487319, -0.8799465, -2.146407, 1, 0, 0, 1, 1,
-1.481199, 0.3135668, -1.278966, 1, 0, 0, 1, 1,
-1.466251, -0.1679023, -1.247008, 1, 0, 0, 1, 1,
-1.464673, -0.1918154, -0.9334901, 0, 0, 0, 1, 1,
-1.457916, -0.5965658, -2.184182, 0, 0, 0, 1, 1,
-1.453505, 0.795095, -0.1439822, 0, 0, 0, 1, 1,
-1.441378, 0.8353347, -0.7697414, 0, 0, 0, 1, 1,
-1.436146, 0.7571471, -1.165955, 0, 0, 0, 1, 1,
-1.429946, -0.4544225, -1.97074, 0, 0, 0, 1, 1,
-1.421341, 1.811501, -1.266506, 0, 0, 0, 1, 1,
-1.413143, 0.1178314, -3.56199, 1, 1, 1, 1, 1,
-1.412033, 1.076897, -1.301323, 1, 1, 1, 1, 1,
-1.410876, 0.5860227, -0.9067453, 1, 1, 1, 1, 1,
-1.40404, 1.218674, -0.6638073, 1, 1, 1, 1, 1,
-1.397271, 0.4053569, -1.681067, 1, 1, 1, 1, 1,
-1.394334, 0.2653388, -1.776448, 1, 1, 1, 1, 1,
-1.384309, 1.477433, -0.8257756, 1, 1, 1, 1, 1,
-1.379381, -1.14272, -2.240551, 1, 1, 1, 1, 1,
-1.379149, -0.5578507, -4.128851, 1, 1, 1, 1, 1,
-1.377006, -1.103033, -2.154959, 1, 1, 1, 1, 1,
-1.367718, -0.5537035, -2.165686, 1, 1, 1, 1, 1,
-1.366489, -0.3788424, -1.903432, 1, 1, 1, 1, 1,
-1.360345, 1.222012, 1.184208, 1, 1, 1, 1, 1,
-1.351479, -0.6112226, -0.2331232, 1, 1, 1, 1, 1,
-1.347665, -0.3420763, -0.3032849, 1, 1, 1, 1, 1,
-1.324847, 0.50492, -2.216906, 0, 0, 1, 1, 1,
-1.319003, -0.03631856, -2.415334, 1, 0, 0, 1, 1,
-1.315306, 1.133446, -1.680248, 1, 0, 0, 1, 1,
-1.31407, 0.5814543, 0.9556798, 1, 0, 0, 1, 1,
-1.305797, 0.6798278, 0.8842262, 1, 0, 0, 1, 1,
-1.302014, -0.5473315, -1.281465, 1, 0, 0, 1, 1,
-1.296214, -0.219083, -2.299448, 0, 0, 0, 1, 1,
-1.291347, -0.798296, -4.495527, 0, 0, 0, 1, 1,
-1.289752, -1.276593, -2.23422, 0, 0, 0, 1, 1,
-1.281449, 0.1062965, -0.7906567, 0, 0, 0, 1, 1,
-1.28127, 0.4806047, -1.372843, 0, 0, 0, 1, 1,
-1.277529, -0.4403678, -2.14687, 0, 0, 0, 1, 1,
-1.274156, -0.2151213, -2.852106, 0, 0, 0, 1, 1,
-1.258313, -1.621454, -2.801885, 1, 1, 1, 1, 1,
-1.256653, -0.8346586, -2.564646, 1, 1, 1, 1, 1,
-1.254687, 0.9203221, -1.107929, 1, 1, 1, 1, 1,
-1.252903, 0.4156997, -1.124598, 1, 1, 1, 1, 1,
-1.245559, 0.03903773, -2.094586, 1, 1, 1, 1, 1,
-1.242565, -1.372594, -3.128151, 1, 1, 1, 1, 1,
-1.23861, 0.04779595, -1.917564, 1, 1, 1, 1, 1,
-1.23292, 0.8364492, -1.548841, 1, 1, 1, 1, 1,
-1.221664, 0.2848765, -1.316262, 1, 1, 1, 1, 1,
-1.2216, -0.6947908, -1.335485, 1, 1, 1, 1, 1,
-1.220146, -0.4759644, -1.717394, 1, 1, 1, 1, 1,
-1.212098, 0.8958933, 0.3755067, 1, 1, 1, 1, 1,
-1.207592, 1.37729, -0.4045569, 1, 1, 1, 1, 1,
-1.196175, -0.1108656, -1.793771, 1, 1, 1, 1, 1,
-1.168702, -0.3859849, -1.842511, 1, 1, 1, 1, 1,
-1.165726, 0.1136904, -2.988461, 0, 0, 1, 1, 1,
-1.159658, 0.6448997, -1.562045, 1, 0, 0, 1, 1,
-1.158172, -0.222481, -1.622144, 1, 0, 0, 1, 1,
-1.131692, 1.415083, -1.613514, 1, 0, 0, 1, 1,
-1.12545, 1.09068, -0.328941, 1, 0, 0, 1, 1,
-1.124752, -1.507445, -0.6882587, 1, 0, 0, 1, 1,
-1.122675, 0.9856235, -0.6501174, 0, 0, 0, 1, 1,
-1.114984, -0.2158257, -3.063196, 0, 0, 0, 1, 1,
-1.113624, -0.4196872, -0.9955805, 0, 0, 0, 1, 1,
-1.110817, 1.82032, -0.4886594, 0, 0, 0, 1, 1,
-1.084613, -0.8749549, -2.63299, 0, 0, 0, 1, 1,
-1.074719, 1.972287, -0.7187892, 0, 0, 0, 1, 1,
-1.071056, 0.2051454, -1.558892, 0, 0, 0, 1, 1,
-1.071027, 0.2215459, -1.652333, 1, 1, 1, 1, 1,
-1.066935, -1.932696, -3.544312, 1, 1, 1, 1, 1,
-1.059583, -1.166034, -3.121763, 1, 1, 1, 1, 1,
-1.059286, -0.9500027, -4.83505, 1, 1, 1, 1, 1,
-1.049274, -1.873705, -3.055994, 1, 1, 1, 1, 1,
-1.047421, 1.065287, -1.873795, 1, 1, 1, 1, 1,
-1.038156, 0.3025789, -1.08489, 1, 1, 1, 1, 1,
-1.02468, -0.1890012, -2.337962, 1, 1, 1, 1, 1,
-1.021553, 0.8930658, -2.411016, 1, 1, 1, 1, 1,
-1.015486, 0.346082, -0.9901122, 1, 1, 1, 1, 1,
-1.014766, -0.8901409, -2.835065, 1, 1, 1, 1, 1,
-1.004241, 2.054835, 0.2423279, 1, 1, 1, 1, 1,
-1.001089, -2.895798, -1.447758, 1, 1, 1, 1, 1,
-0.9914998, 1.394572, 2.209271, 1, 1, 1, 1, 1,
-0.9911795, 0.4040363, -2.025318, 1, 1, 1, 1, 1,
-0.9871381, 0.2187443, -1.923038, 0, 0, 1, 1, 1,
-0.976905, 1.070147, -0.1971698, 1, 0, 0, 1, 1,
-0.9693358, 0.01392404, -3.6086, 1, 0, 0, 1, 1,
-0.9686011, 0.4493633, -0.6212018, 1, 0, 0, 1, 1,
-0.96811, 1.140815, -1.960931, 1, 0, 0, 1, 1,
-0.965893, -0.8010654, -2.12742, 1, 0, 0, 1, 1,
-0.9592871, -1.082483, -2.804564, 0, 0, 0, 1, 1,
-0.9523908, -0.8424711, -2.855452, 0, 0, 0, 1, 1,
-0.9523045, -0.09553721, -3.494513, 0, 0, 0, 1, 1,
-0.9473357, -0.5683162, -1.818525, 0, 0, 0, 1, 1,
-0.9415454, -2.39537, -4.228454, 0, 0, 0, 1, 1,
-0.9413267, -1.655137, -3.420686, 0, 0, 0, 1, 1,
-0.9400182, -1.848709, -1.277501, 0, 0, 0, 1, 1,
-0.9296758, -1.617186, -3.465505, 1, 1, 1, 1, 1,
-0.9275867, -0.2358462, -0.2469214, 1, 1, 1, 1, 1,
-0.920228, 0.2461698, -0.681002, 1, 1, 1, 1, 1,
-0.9199397, -2.550925, -1.311629, 1, 1, 1, 1, 1,
-0.9147094, -0.2809487, -0.9167545, 1, 1, 1, 1, 1,
-0.9141156, -0.2028116, -3.333534, 1, 1, 1, 1, 1,
-0.9112635, 0.5183527, -1.653062, 1, 1, 1, 1, 1,
-0.908755, 0.4410159, 0.5996895, 1, 1, 1, 1, 1,
-0.9084502, -0.5723339, -0.2931149, 1, 1, 1, 1, 1,
-0.8955262, 0.5726628, -1.526525, 1, 1, 1, 1, 1,
-0.8913611, 0.9729975, -0.1865207, 1, 1, 1, 1, 1,
-0.8848679, -1.191871, -1.957827, 1, 1, 1, 1, 1,
-0.8845599, 0.6220701, -1.320848, 1, 1, 1, 1, 1,
-0.8838595, 0.1128007, -1.26119, 1, 1, 1, 1, 1,
-0.8727864, -1.042344, -3.09763, 1, 1, 1, 1, 1,
-0.8668286, 0.02877657, -2.586934, 0, 0, 1, 1, 1,
-0.8665352, 0.1937113, -1.738349, 1, 0, 0, 1, 1,
-0.8648044, 1.418923, 0.4981417, 1, 0, 0, 1, 1,
-0.8617013, 0.07726337, -3.079574, 1, 0, 0, 1, 1,
-0.8575733, -0.2177173, -0.06261193, 1, 0, 0, 1, 1,
-0.8537554, 0.8408201, -1.867069, 1, 0, 0, 1, 1,
-0.8512123, 0.6230931, -1.374152, 0, 0, 0, 1, 1,
-0.8483764, -1.640619, -2.971633, 0, 0, 0, 1, 1,
-0.8465701, -0.4618328, -1.867049, 0, 0, 0, 1, 1,
-0.8465199, 0.873591, -1.599745, 0, 0, 0, 1, 1,
-0.842363, -0.6420737, -2.716253, 0, 0, 0, 1, 1,
-0.8341661, 1.053315, -0.13436, 0, 0, 0, 1, 1,
-0.833007, 0.7188553, -0.6458887, 0, 0, 0, 1, 1,
-0.8309473, -0.340258, -2.647142, 1, 1, 1, 1, 1,
-0.8300197, 1.566367, -0.890795, 1, 1, 1, 1, 1,
-0.8221962, -0.04998707, -1.246302, 1, 1, 1, 1, 1,
-0.8207352, -1.882438, -4.347674, 1, 1, 1, 1, 1,
-0.8204374, 1.460169, -0.4967748, 1, 1, 1, 1, 1,
-0.8190392, -0.04360487, -1.34478, 1, 1, 1, 1, 1,
-0.8129244, -0.2986468, -1.332549, 1, 1, 1, 1, 1,
-0.80868, -1.146325, -3.02935, 1, 1, 1, 1, 1,
-0.8053531, -0.3815126, -1.33284, 1, 1, 1, 1, 1,
-0.8043324, -0.003645192, -0.7043665, 1, 1, 1, 1, 1,
-0.8020131, 0.7479081, -1.696286, 1, 1, 1, 1, 1,
-0.8003556, 0.6949658, -2.463592, 1, 1, 1, 1, 1,
-0.7991815, 0.7914027, 0.4006365, 1, 1, 1, 1, 1,
-0.7972016, -1.185146, -3.075646, 1, 1, 1, 1, 1,
-0.789107, 0.6648743, -0.6618568, 1, 1, 1, 1, 1,
-0.788515, 0.02381602, -1.713221, 0, 0, 1, 1, 1,
-0.7768844, -0.3903272, -0.680035, 1, 0, 0, 1, 1,
-0.7745569, -1.132867, -1.433666, 1, 0, 0, 1, 1,
-0.7731546, 0.06040386, -0.8362518, 1, 0, 0, 1, 1,
-0.7731012, 0.5418817, -1.406407, 1, 0, 0, 1, 1,
-0.762953, 0.5132488, -0.04066117, 1, 0, 0, 1, 1,
-0.7624052, -0.716233, -3.097117, 0, 0, 0, 1, 1,
-0.7622719, -1.345088, -0.3440523, 0, 0, 0, 1, 1,
-0.7601196, 1.026443, 0.7203577, 0, 0, 0, 1, 1,
-0.7585587, 2.089858, -0.2998844, 0, 0, 0, 1, 1,
-0.7574589, -0.4320423, -2.443118, 0, 0, 0, 1, 1,
-0.7564717, -1.005783, -4.228454, 0, 0, 0, 1, 1,
-0.7422819, -1.277976, -4.171489, 0, 0, 0, 1, 1,
-0.7401531, 0.09432887, -1.410435, 1, 1, 1, 1, 1,
-0.733128, -0.0941674, -0.8565003, 1, 1, 1, 1, 1,
-0.732097, -0.6235564, -1.191753, 1, 1, 1, 1, 1,
-0.7288252, -0.02074782, -2.73739, 1, 1, 1, 1, 1,
-0.7232078, -1.746695, -1.978824, 1, 1, 1, 1, 1,
-0.7227371, -0.2202553, -1.822368, 1, 1, 1, 1, 1,
-0.7195983, 1.554789, -0.7154389, 1, 1, 1, 1, 1,
-0.7137725, -1.185205, -1.925134, 1, 1, 1, 1, 1,
-0.7117278, -0.8186244, -2.003929, 1, 1, 1, 1, 1,
-0.7063691, -0.9607375, -1.59219, 1, 1, 1, 1, 1,
-0.7049111, -0.002412832, -1.153738, 1, 1, 1, 1, 1,
-0.7043285, -1.149123, -3.381006, 1, 1, 1, 1, 1,
-0.7031515, 0.05548333, -0.8429244, 1, 1, 1, 1, 1,
-0.6989373, 0.01812318, -2.092124, 1, 1, 1, 1, 1,
-0.6967231, 0.9512104, -1.166172, 1, 1, 1, 1, 1,
-0.6934491, -0.04676671, -2.553805, 0, 0, 1, 1, 1,
-0.6848823, 0.287135, 0.2574418, 1, 0, 0, 1, 1,
-0.6779578, -0.5296828, -1.275557, 1, 0, 0, 1, 1,
-0.6715911, -1.597199, -3.49492, 1, 0, 0, 1, 1,
-0.6697013, 1.053357, -1.635615, 1, 0, 0, 1, 1,
-0.6543416, -0.9919685, -2.882195, 1, 0, 0, 1, 1,
-0.6522384, -0.189096, -1.1627, 0, 0, 0, 1, 1,
-0.651669, 1.802934, -0.07345823, 0, 0, 0, 1, 1,
-0.646372, -0.8218569, -1.674227, 0, 0, 0, 1, 1,
-0.6462047, -1.179701, -2.39346, 0, 0, 0, 1, 1,
-0.6457335, 1.104985, -0.4721392, 0, 0, 0, 1, 1,
-0.6440713, 0.3402656, -1.284244, 0, 0, 0, 1, 1,
-0.6429654, -0.6000047, -3.516102, 0, 0, 0, 1, 1,
-0.6404952, -0.9105969, -2.151864, 1, 1, 1, 1, 1,
-0.6367453, 0.215382, -2.972849, 1, 1, 1, 1, 1,
-0.6324306, 0.2404852, -1.303559, 1, 1, 1, 1, 1,
-0.631473, 0.2525975, -0.3969047, 1, 1, 1, 1, 1,
-0.6305867, -0.3152792, -3.287794, 1, 1, 1, 1, 1,
-0.6216804, -0.6639034, -3.396346, 1, 1, 1, 1, 1,
-0.6186441, -1.485355, -1.283753, 1, 1, 1, 1, 1,
-0.6139761, 0.2622289, -2.79029, 1, 1, 1, 1, 1,
-0.6006218, -0.8992784, -2.885996, 1, 1, 1, 1, 1,
-0.5967068, -2.032213, -2.906666, 1, 1, 1, 1, 1,
-0.5951284, 0.7684453, 0.2104152, 1, 1, 1, 1, 1,
-0.5951039, 1.075982, -1.165785, 1, 1, 1, 1, 1,
-0.5942681, 0.8467665, 0.319615, 1, 1, 1, 1, 1,
-0.5938657, -1.072761, -2.660691, 1, 1, 1, 1, 1,
-0.5903796, 1.468905, -1.410392, 1, 1, 1, 1, 1,
-0.5897181, -2.320675, -2.112728, 0, 0, 1, 1, 1,
-0.5862698, 1.44014, 0.3689615, 1, 0, 0, 1, 1,
-0.5842318, -0.2847601, -1.245934, 1, 0, 0, 1, 1,
-0.5834653, -0.7487825, -2.025663, 1, 0, 0, 1, 1,
-0.5828184, 1.599913, -0.5435881, 1, 0, 0, 1, 1,
-0.5820395, -1.213857, -4.902867, 1, 0, 0, 1, 1,
-0.5788713, 0.1767389, -0.8523404, 0, 0, 0, 1, 1,
-0.5787347, 0.4519233, 0.8004228, 0, 0, 0, 1, 1,
-0.575526, 1.16189, 1.054233, 0, 0, 0, 1, 1,
-0.5733496, 0.2820884, -0.4734529, 0, 0, 0, 1, 1,
-0.569959, -0.1429108, -2.451256, 0, 0, 0, 1, 1,
-0.5625834, -0.4988407, -0.6672871, 0, 0, 0, 1, 1,
-0.5593591, 0.4218221, -0.6495097, 0, 0, 0, 1, 1,
-0.5538363, -0.2586808, -2.125349, 1, 1, 1, 1, 1,
-0.5513192, -0.0112061, -1.807192, 1, 1, 1, 1, 1,
-0.5512218, -0.09100088, -2.70559, 1, 1, 1, 1, 1,
-0.5502915, 1.508205, -0.4996578, 1, 1, 1, 1, 1,
-0.5452009, -0.9088686, -2.393138, 1, 1, 1, 1, 1,
-0.5446697, -0.3303507, -1.458905, 1, 1, 1, 1, 1,
-0.5416818, -0.06062478, -1.531127, 1, 1, 1, 1, 1,
-0.5339302, -0.7909963, -1.588247, 1, 1, 1, 1, 1,
-0.5334247, 0.6281551, -1.896998, 1, 1, 1, 1, 1,
-0.5217943, -0.1584636, -2.178226, 1, 1, 1, 1, 1,
-0.521222, -0.8216019, -3.627269, 1, 1, 1, 1, 1,
-0.5154104, -0.9927666, -2.811193, 1, 1, 1, 1, 1,
-0.5140994, 0.4080884, -0.6238249, 1, 1, 1, 1, 1,
-0.5125616, 0.5852914, -1.65925, 1, 1, 1, 1, 1,
-0.5113733, -2.368663, -3.125998, 1, 1, 1, 1, 1,
-0.5080634, 1.491616, 0.6090389, 0, 0, 1, 1, 1,
-0.5048965, -0.1104693, -3.144041, 1, 0, 0, 1, 1,
-0.4993476, -0.0005380361, -2.238223, 1, 0, 0, 1, 1,
-0.4954787, 0.6992636, -1.33858, 1, 0, 0, 1, 1,
-0.4918505, 1.669824, 1.118947, 1, 0, 0, 1, 1,
-0.4880743, -1.279522, -1.110113, 1, 0, 0, 1, 1,
-0.4878908, -0.3067383, -1.983273, 0, 0, 0, 1, 1,
-0.4846185, -1.788315, -4.131956, 0, 0, 0, 1, 1,
-0.4824812, 0.1472931, -1.026954, 0, 0, 0, 1, 1,
-0.477998, -0.8215425, -3.189496, 0, 0, 0, 1, 1,
-0.4726191, 0.1912687, 0.05931405, 0, 0, 0, 1, 1,
-0.4675581, 0.07586254, -1.941348, 0, 0, 0, 1, 1,
-0.4644397, 0.1150037, -2.051177, 0, 0, 0, 1, 1,
-0.4577919, 0.5488088, -0.5391536, 1, 1, 1, 1, 1,
-0.4511297, 0.1746873, -1.622777, 1, 1, 1, 1, 1,
-0.4466842, -0.6536231, -3.331956, 1, 1, 1, 1, 1,
-0.4461113, 1.090913, 2.043947, 1, 1, 1, 1, 1,
-0.4453706, 0.7502053, -1.22557, 1, 1, 1, 1, 1,
-0.4312094, -0.06145225, 0.0584082, 1, 1, 1, 1, 1,
-0.4302701, 0.09220824, -0.3394513, 1, 1, 1, 1, 1,
-0.4252404, 0.4659504, -1.23552, 1, 1, 1, 1, 1,
-0.4193861, -0.5315561, -2.071168, 1, 1, 1, 1, 1,
-0.4182705, 1.415661, -0.8547348, 1, 1, 1, 1, 1,
-0.4124175, 0.1348806, -1.346075, 1, 1, 1, 1, 1,
-0.4121756, 1.232177, -1.175908, 1, 1, 1, 1, 1,
-0.4113581, 0.1728766, -1.850913, 1, 1, 1, 1, 1,
-0.4105735, -0.5492601, -3.290971, 1, 1, 1, 1, 1,
-0.4070131, 0.8465121, -0.4702819, 1, 1, 1, 1, 1,
-0.4035498, -1.403658, -2.40368, 0, 0, 1, 1, 1,
-0.400661, 0.6742298, 0.5348823, 1, 0, 0, 1, 1,
-0.3987214, -0.7998891, -2.158331, 1, 0, 0, 1, 1,
-0.3984551, -1.959632, -2.682021, 1, 0, 0, 1, 1,
-0.3981562, 1.651748, 0.2843787, 1, 0, 0, 1, 1,
-0.3953969, 0.3650237, -0.8124641, 1, 0, 0, 1, 1,
-0.3911711, -0.1985758, -2.646337, 0, 0, 0, 1, 1,
-0.3883589, -0.2969126, -2.802762, 0, 0, 0, 1, 1,
-0.3864491, 1.262147, 0.1585266, 0, 0, 0, 1, 1,
-0.3859289, 0.09898138, -2.179796, 0, 0, 0, 1, 1,
-0.3761558, -0.9432048, -2.109166, 0, 0, 0, 1, 1,
-0.3685365, 0.4057317, 0.1014503, 0, 0, 0, 1, 1,
-0.3680432, 0.0593594, -1.24833, 0, 0, 0, 1, 1,
-0.3676194, -0.78919, -2.567414, 1, 1, 1, 1, 1,
-0.3650244, 0.8323025, -0.1438991, 1, 1, 1, 1, 1,
-0.3645692, -1.546098, -3.303024, 1, 1, 1, 1, 1,
-0.3586489, -0.2843784, -2.529685, 1, 1, 1, 1, 1,
-0.3582815, 0.2131893, -2.457435, 1, 1, 1, 1, 1,
-0.3571576, -0.662298, -0.2435098, 1, 1, 1, 1, 1,
-0.3564032, -0.7891446, -1.400161, 1, 1, 1, 1, 1,
-0.3546704, 2.494038, -1.413623, 1, 1, 1, 1, 1,
-0.3533501, 0.7185262, 0.1886215, 1, 1, 1, 1, 1,
-0.3508338, 1.658984, -0.3975425, 1, 1, 1, 1, 1,
-0.3469138, 0.8160402, -0.8257301, 1, 1, 1, 1, 1,
-0.3459697, 1.161299, 1.091994, 1, 1, 1, 1, 1,
-0.3457164, 1.709569, 0.5911421, 1, 1, 1, 1, 1,
-0.341484, -0.7479641, -3.009, 1, 1, 1, 1, 1,
-0.3382832, -1.449093, -3.28151, 1, 1, 1, 1, 1,
-0.3372642, 1.691794, 0.1231181, 0, 0, 1, 1, 1,
-0.3371137, -0.0770438, -2.416253, 1, 0, 0, 1, 1,
-0.336894, -0.5247373, -2.536092, 1, 0, 0, 1, 1,
-0.3367631, -0.9028642, -1.473177, 1, 0, 0, 1, 1,
-0.3349551, 0.3187816, 0.9496211, 1, 0, 0, 1, 1,
-0.3341223, -1.682951, -2.739206, 1, 0, 0, 1, 1,
-0.3328175, 1.365241, 0.7827789, 0, 0, 0, 1, 1,
-0.3256998, -0.1972347, -1.579721, 0, 0, 0, 1, 1,
-0.3256313, -0.3024947, -0.8973104, 0, 0, 0, 1, 1,
-0.3244475, -0.3375283, -3.249128, 0, 0, 0, 1, 1,
-0.3240695, 0.2481909, -2.290577, 0, 0, 0, 1, 1,
-0.3160852, 1.404882, -0.6361877, 0, 0, 0, 1, 1,
-0.3126623, -1.035751, -2.845373, 0, 0, 0, 1, 1,
-0.31241, 0.1596269, -1.353153, 1, 1, 1, 1, 1,
-0.3091444, 0.5389291, 2.169423, 1, 1, 1, 1, 1,
-0.3086822, -0.4508856, -0.2463451, 1, 1, 1, 1, 1,
-0.3076522, -1.645094, -2.193665, 1, 1, 1, 1, 1,
-0.3031424, -1.634102, -3.554579, 1, 1, 1, 1, 1,
-0.3024001, -0.1703525, -3.017297, 1, 1, 1, 1, 1,
-0.3015664, -0.5774001, -1.407047, 1, 1, 1, 1, 1,
-0.2994739, 1.087981, 0.8966665, 1, 1, 1, 1, 1,
-0.2951353, -0.5445024, -3.219672, 1, 1, 1, 1, 1,
-0.2886628, -0.96356, -1.586184, 1, 1, 1, 1, 1,
-0.2872433, -0.585048, -2.165522, 1, 1, 1, 1, 1,
-0.2844532, -1.219349, -3.575367, 1, 1, 1, 1, 1,
-0.283651, 0.2345981, -1.250311, 1, 1, 1, 1, 1,
-0.2830344, -0.6789445, -3.349945, 1, 1, 1, 1, 1,
-0.2820375, 1.286922, 1.193987, 1, 1, 1, 1, 1,
-0.279121, 0.4280928, -1.493596, 0, 0, 1, 1, 1,
-0.2789762, -0.0946231, -1.965595, 1, 0, 0, 1, 1,
-0.2769107, 1.541502, 0.3456147, 1, 0, 0, 1, 1,
-0.2688631, 1.083739, -0.2229104, 1, 0, 0, 1, 1,
-0.2655288, 0.8459933, -0.1558154, 1, 0, 0, 1, 1,
-0.2653557, -0.03717601, -1.88591, 1, 0, 0, 1, 1,
-0.2649118, 0.522069, 0.3756579, 0, 0, 0, 1, 1,
-0.2602832, 1.423266, 0.4322383, 0, 0, 0, 1, 1,
-0.254692, -0.5721068, -0.9448878, 0, 0, 0, 1, 1,
-0.2542174, -0.5426421, -3.592608, 0, 0, 0, 1, 1,
-0.2494386, -0.2615377, -2.702834, 0, 0, 0, 1, 1,
-0.2321982, 0.9235163, 1.456761, 0, 0, 0, 1, 1,
-0.2212587, -0.5920101, -4.191091, 0, 0, 0, 1, 1,
-0.2187411, 1.766482, -1.356487, 1, 1, 1, 1, 1,
-0.2174413, 1.150511, -0.4860612, 1, 1, 1, 1, 1,
-0.2170562, -0.3718388, -1.129951, 1, 1, 1, 1, 1,
-0.2164574, 0.2009656, -0.3954243, 1, 1, 1, 1, 1,
-0.2146407, -0.09988772, -4.132307, 1, 1, 1, 1, 1,
-0.214475, 1.256102, 0.5518869, 1, 1, 1, 1, 1,
-0.2129415, -0.3195847, -1.290817, 1, 1, 1, 1, 1,
-0.2109457, 0.9584491, -0.7368497, 1, 1, 1, 1, 1,
-0.2108614, -0.5048289, -3.634428, 1, 1, 1, 1, 1,
-0.2092203, 2.269804, 0.5796057, 1, 1, 1, 1, 1,
-0.2053994, -0.468529, -2.734424, 1, 1, 1, 1, 1,
-0.202417, -0.1314437, -2.398161, 1, 1, 1, 1, 1,
-0.1919003, 0.478496, 0.02567337, 1, 1, 1, 1, 1,
-0.1871506, -0.08279345, -2.523845, 1, 1, 1, 1, 1,
-0.1861927, -1.218669, -3.868763, 1, 1, 1, 1, 1,
-0.1854501, 0.9780905, -0.5404164, 0, 0, 1, 1, 1,
-0.1853125, -0.07988851, -0.1395743, 1, 0, 0, 1, 1,
-0.1790034, 0.3350102, -0.2565922, 1, 0, 0, 1, 1,
-0.1748204, 0.659358, -0.1744755, 1, 0, 0, 1, 1,
-0.1731011, 1.582041, 0.2175856, 1, 0, 0, 1, 1,
-0.1726433, 2.563531, -0.2046606, 1, 0, 0, 1, 1,
-0.1714553, -0.3198713, -2.077108, 0, 0, 0, 1, 1,
-0.1714027, 0.5638235, 0.5019094, 0, 0, 0, 1, 1,
-0.1692878, 0.4210281, 0.6036447, 0, 0, 0, 1, 1,
-0.1690481, -1.32392, -2.511769, 0, 0, 0, 1, 1,
-0.1675002, -2.420281, -1.736248, 0, 0, 0, 1, 1,
-0.1667047, -0.854045, -3.244781, 0, 0, 0, 1, 1,
-0.1638617, 0.004253363, -1.376393, 0, 0, 0, 1, 1,
-0.1619079, -0.7245183, -1.773835, 1, 1, 1, 1, 1,
-0.1584759, 1.577869, 0.1131776, 1, 1, 1, 1, 1,
-0.1544599, -0.1134061, -1.208632, 1, 1, 1, 1, 1,
-0.1518616, -1.782087, -3.45653, 1, 1, 1, 1, 1,
-0.1509471, -0.5762258, -3.017805, 1, 1, 1, 1, 1,
-0.1502817, -0.188709, -0.590073, 1, 1, 1, 1, 1,
-0.144405, -1.004178, -3.145488, 1, 1, 1, 1, 1,
-0.1439564, -1.704621, -1.287807, 1, 1, 1, 1, 1,
-0.1412674, 0.3788919, -1.262082, 1, 1, 1, 1, 1,
-0.1403949, -1.108097, -2.690875, 1, 1, 1, 1, 1,
-0.1397862, 0.3970376, -0.309753, 1, 1, 1, 1, 1,
-0.1341946, -0.728927, -2.08687, 1, 1, 1, 1, 1,
-0.1338767, 0.3029841, -0.07855996, 1, 1, 1, 1, 1,
-0.1290558, 2.961721, 1.213575, 1, 1, 1, 1, 1,
-0.1282178, -1.5083, -3.068491, 1, 1, 1, 1, 1,
-0.1270102, -0.04217045, -1.710203, 0, 0, 1, 1, 1,
-0.1248417, 0.3851088, -1.771451, 1, 0, 0, 1, 1,
-0.1232719, 1.244909, 1.467403, 1, 0, 0, 1, 1,
-0.1229799, 1.102095, -0.5343821, 1, 0, 0, 1, 1,
-0.1222911, 0.580275, -0.3018403, 1, 0, 0, 1, 1,
-0.1213518, -1.063456, -3.168952, 1, 0, 0, 1, 1,
-0.1187213, 1.118876, -1.433539, 0, 0, 0, 1, 1,
-0.1145177, -0.160638, -3.974454, 0, 0, 0, 1, 1,
-0.1136176, -1.002216, -3.583404, 0, 0, 0, 1, 1,
-0.1124678, -0.06474752, -3.194765, 0, 0, 0, 1, 1,
-0.1120842, 0.5036026, -1.013961, 0, 0, 0, 1, 1,
-0.1112719, 0.4154627, -1.028643, 0, 0, 0, 1, 1,
-0.1102478, 0.1820122, 0.04757023, 0, 0, 0, 1, 1,
-0.1079768, -1.451123, -3.508326, 1, 1, 1, 1, 1,
-0.1076925, 0.4629298, -0.1747409, 1, 1, 1, 1, 1,
-0.1070742, 1.576673, -0.3777134, 1, 1, 1, 1, 1,
-0.1037044, -0.3260719, -3.126808, 1, 1, 1, 1, 1,
-0.1011462, -1.166844, -0.4828745, 1, 1, 1, 1, 1,
-0.09823348, -0.794039, -1.677321, 1, 1, 1, 1, 1,
-0.09581059, 1.139135, 0.0751017, 1, 1, 1, 1, 1,
-0.09237534, -0.04916689, -3.362666, 1, 1, 1, 1, 1,
-0.08886375, 1.363618, 0.5331698, 1, 1, 1, 1, 1,
-0.08625665, 1.469503, -0.7330587, 1, 1, 1, 1, 1,
-0.07930361, -0.6864348, -3.119038, 1, 1, 1, 1, 1,
-0.0744253, -1.33218, -2.099051, 1, 1, 1, 1, 1,
-0.07340351, 0.3687637, -2.011989, 1, 1, 1, 1, 1,
-0.07176185, -1.670468, -2.092423, 1, 1, 1, 1, 1,
-0.0632029, 0.06272122, 0.02250651, 1, 1, 1, 1, 1,
-0.06283712, 1.231258, 2.24202, 0, 0, 1, 1, 1,
-0.06159884, -0.175336, -2.549927, 1, 0, 0, 1, 1,
-0.0594764, 2.593312, 0.04002328, 1, 0, 0, 1, 1,
-0.05930772, 0.3501131, 1.747695, 1, 0, 0, 1, 1,
-0.05752057, 0.8114412, 0.6195909, 1, 0, 0, 1, 1,
-0.05711665, -1.102706, -3.112282, 1, 0, 0, 1, 1,
-0.05693516, -0.4185988, -3.168762, 0, 0, 0, 1, 1,
-0.04509728, 1.236015, -1.099203, 0, 0, 0, 1, 1,
-0.04455839, -0.3000369, -3.888767, 0, 0, 0, 1, 1,
-0.03906684, -0.02740492, -2.161609, 0, 0, 0, 1, 1,
-0.03892601, -0.6591194, -1.748384, 0, 0, 0, 1, 1,
-0.03398667, 0.4003883, -0.1430054, 0, 0, 0, 1, 1,
-0.03289954, 0.05711108, -1.824127, 0, 0, 0, 1, 1,
-0.02852603, -1.08933, -2.822434, 1, 1, 1, 1, 1,
-0.02793253, 1.229777, -0.1265868, 1, 1, 1, 1, 1,
-0.02790207, 0.01961752, -1.543464, 1, 1, 1, 1, 1,
-0.02293615, 0.325035, -0.5479406, 1, 1, 1, 1, 1,
-0.01881809, 0.3893849, 0.3448375, 1, 1, 1, 1, 1,
-0.01697755, -0.3538063, -4.028775, 1, 1, 1, 1, 1,
-0.01613673, -1.017032, -2.792708, 1, 1, 1, 1, 1,
-0.01485592, 0.6820583, -0.6861909, 1, 1, 1, 1, 1,
-0.009510709, -0.9097819, -3.27939, 1, 1, 1, 1, 1,
-0.009294976, -1.207188, -1.786413, 1, 1, 1, 1, 1,
-0.006091524, 0.9694728, 1.483935, 1, 1, 1, 1, 1,
-0.003766424, 1.544039, 0.5789796, 1, 1, 1, 1, 1,
-0.001948263, 0.2383726, -0.7108982, 1, 1, 1, 1, 1,
0.002176929, -2.06322, 1.921766, 1, 1, 1, 1, 1,
0.003210134, -1.151577, 4.920138, 1, 1, 1, 1, 1,
0.00394459, -0.2502309, 2.97176, 0, 0, 1, 1, 1,
0.005281287, -1.329522, 3.968944, 1, 0, 0, 1, 1,
0.00546098, 0.0582835, -0.05371939, 1, 0, 0, 1, 1,
0.007217175, 1.483781, -0.4640846, 1, 0, 0, 1, 1,
0.01229273, 1.273222, 0.008297107, 1, 0, 0, 1, 1,
0.01346802, -0.269601, 4.138712, 1, 0, 0, 1, 1,
0.01366843, -0.09558565, 5.464654, 0, 0, 0, 1, 1,
0.0147793, 0.211917, -0.6990052, 0, 0, 0, 1, 1,
0.01805574, 1.03753, 2.053105, 0, 0, 0, 1, 1,
0.02204093, 0.6865036, -1.051201, 0, 0, 0, 1, 1,
0.02210677, -0.8118089, 2.534144, 0, 0, 0, 1, 1,
0.02554509, 1.200221, 0.511216, 0, 0, 0, 1, 1,
0.02958191, -0.4293192, 1.330586, 0, 0, 0, 1, 1,
0.03796466, 1.097797, -1.004002, 1, 1, 1, 1, 1,
0.03814173, -0.2393089, 4.697777, 1, 1, 1, 1, 1,
0.03950325, 0.7334864, 0.1548314, 1, 1, 1, 1, 1,
0.04681277, 0.07655552, -0.2439123, 1, 1, 1, 1, 1,
0.05051339, -0.5458337, 4.413992, 1, 1, 1, 1, 1,
0.05212843, -0.04958714, 0.5081338, 1, 1, 1, 1, 1,
0.05229008, 0.620259, 0.5096189, 1, 1, 1, 1, 1,
0.05256064, 1.912181, -0.9218631, 1, 1, 1, 1, 1,
0.05487831, -0.03610762, 3.294202, 1, 1, 1, 1, 1,
0.0549807, 1.668357, 0.3905751, 1, 1, 1, 1, 1,
0.05709338, -0.4163935, 2.008477, 1, 1, 1, 1, 1,
0.05822577, 0.3976666, 0.2164668, 1, 1, 1, 1, 1,
0.07115164, 0.1229704, -1.009796, 1, 1, 1, 1, 1,
0.07388262, 0.2760731, -0.2420127, 1, 1, 1, 1, 1,
0.0807891, -0.02525068, -0.589495, 1, 1, 1, 1, 1,
0.08329394, -0.2006783, 2.073155, 0, 0, 1, 1, 1,
0.08447616, -0.2088051, 3.719098, 1, 0, 0, 1, 1,
0.08580308, 0.6678222, 0.5136054, 1, 0, 0, 1, 1,
0.0889436, 0.8216571, 0.6063545, 1, 0, 0, 1, 1,
0.09217075, 0.05759005, 1.425638, 1, 0, 0, 1, 1,
0.0968608, 0.1990889, 0.326044, 1, 0, 0, 1, 1,
0.09710772, 0.2565148, 0.365115, 0, 0, 0, 1, 1,
0.09719875, 1.490445, 1.015912, 0, 0, 0, 1, 1,
0.09921695, -0.4384378, 4.099644, 0, 0, 0, 1, 1,
0.1015132, -2.331294, 3.441588, 0, 0, 0, 1, 1,
0.1058096, -0.8502234, 4.288623, 0, 0, 0, 1, 1,
0.10609, 0.07319435, 0.5851493, 0, 0, 0, 1, 1,
0.1074019, -0.127197, 3.453261, 0, 0, 0, 1, 1,
0.1087416, 0.2678351, -1.846668, 1, 1, 1, 1, 1,
0.1101052, -1.193863, 3.504277, 1, 1, 1, 1, 1,
0.1141306, 0.4678621, -1.410248, 1, 1, 1, 1, 1,
0.1152894, -0.4243082, 3.526974, 1, 1, 1, 1, 1,
0.1161572, -0.6090436, 3.095659, 1, 1, 1, 1, 1,
0.1162207, -0.5615433, 3.202796, 1, 1, 1, 1, 1,
0.1180546, -1.23213, 3.984344, 1, 1, 1, 1, 1,
0.1190531, 0.6793134, -0.5435755, 1, 1, 1, 1, 1,
0.1198089, -0.2164339, 3.551188, 1, 1, 1, 1, 1,
0.1234351, 0.9387074, 0.8028134, 1, 1, 1, 1, 1,
0.1235238, 0.7069623, 0.3160726, 1, 1, 1, 1, 1,
0.1259868, -0.4477366, 2.502132, 1, 1, 1, 1, 1,
0.1263947, -0.2833837, 1.937788, 1, 1, 1, 1, 1,
0.1287632, 1.329767, 0.3669859, 1, 1, 1, 1, 1,
0.129627, 1.274231, -1.386704, 1, 1, 1, 1, 1,
0.1302677, 1.640653, -0.1397189, 0, 0, 1, 1, 1,
0.1314041, 2.034172, 0.2100545, 1, 0, 0, 1, 1,
0.133914, -2.672281, 2.874193, 1, 0, 0, 1, 1,
0.137675, -0.6505513, 2.722467, 1, 0, 0, 1, 1,
0.1383031, -0.624087, 3.353516, 1, 0, 0, 1, 1,
0.1384741, 0.5494968, 0.4931404, 1, 0, 0, 1, 1,
0.1418795, -0.3466306, 2.979096, 0, 0, 0, 1, 1,
0.1429201, 0.6447042, -0.8041826, 0, 0, 0, 1, 1,
0.1437711, -0.8512779, 4.412791, 0, 0, 0, 1, 1,
0.1462469, -0.8342492, 2.994647, 0, 0, 0, 1, 1,
0.1475272, -1.48063, 3.337573, 0, 0, 0, 1, 1,
0.1491139, -1.394248, 2.348343, 0, 0, 0, 1, 1,
0.1559822, -1.465096, 2.230383, 0, 0, 0, 1, 1,
0.1560862, 0.06283855, 0.4771183, 1, 1, 1, 1, 1,
0.1584841, -1.014282, 2.07497, 1, 1, 1, 1, 1,
0.1585047, 0.164094, 1.873063, 1, 1, 1, 1, 1,
0.1586646, 0.7416914, 0.2835316, 1, 1, 1, 1, 1,
0.1589604, 0.5654718, -0.9007128, 1, 1, 1, 1, 1,
0.159678, -1.710656, 3.166945, 1, 1, 1, 1, 1,
0.1597996, -1.386589, 1.048581, 1, 1, 1, 1, 1,
0.1626203, -0.5937611, 4.380824, 1, 1, 1, 1, 1,
0.1658005, 0.7507173, 1.152137, 1, 1, 1, 1, 1,
0.1675877, -1.451181, 2.685205, 1, 1, 1, 1, 1,
0.1798404, 1.122007, 0.4431263, 1, 1, 1, 1, 1,
0.1836335, -0.3279809, 1.769927, 1, 1, 1, 1, 1,
0.1847568, 0.9364406, -0.6279441, 1, 1, 1, 1, 1,
0.187364, 0.8819288, 0.4564934, 1, 1, 1, 1, 1,
0.1883566, -1.287966, 1.864595, 1, 1, 1, 1, 1,
0.1893902, -1.275272, 2.091869, 0, 0, 1, 1, 1,
0.1912696, 0.3541756, 0.3222083, 1, 0, 0, 1, 1,
0.1932591, 0.5667323, 1.487336, 1, 0, 0, 1, 1,
0.1967489, -1.082356, 3.802545, 1, 0, 0, 1, 1,
0.1975126, 0.7496727, -0.00865277, 1, 0, 0, 1, 1,
0.2002018, -0.2599145, 3.274575, 1, 0, 0, 1, 1,
0.2035499, -1.980671, 3.444069, 0, 0, 0, 1, 1,
0.2073909, -1.230839, 2.030235, 0, 0, 0, 1, 1,
0.2093417, 0.2783995, 0.6520503, 0, 0, 0, 1, 1,
0.2107576, 0.6377468, 0.5638856, 0, 0, 0, 1, 1,
0.2111999, 0.5407075, 0.08344712, 0, 0, 0, 1, 1,
0.2142187, 0.7621644, 0.2502349, 0, 0, 0, 1, 1,
0.2159391, 0.6629449, -2.294581, 0, 0, 0, 1, 1,
0.2181986, -0.3895189, 3.115854, 1, 1, 1, 1, 1,
0.2208712, -0.07951844, 1.489851, 1, 1, 1, 1, 1,
0.2237329, 1.707153, 1.888625, 1, 1, 1, 1, 1,
0.2246396, -0.03084905, 2.25968, 1, 1, 1, 1, 1,
0.2277706, 1.781521, 1.969253, 1, 1, 1, 1, 1,
0.2278901, -0.4422315, 2.472422, 1, 1, 1, 1, 1,
0.2289131, -0.8144053, 3.488657, 1, 1, 1, 1, 1,
0.2306303, -0.8245529, 3.95418, 1, 1, 1, 1, 1,
0.2311587, 1.249128, 0.7113535, 1, 1, 1, 1, 1,
0.2313721, 0.3211902, -0.05181693, 1, 1, 1, 1, 1,
0.2324009, 0.9032122, 1.157931, 1, 1, 1, 1, 1,
0.2328746, 0.08201741, 1.297623, 1, 1, 1, 1, 1,
0.2366675, -0.3615142, 3.048566, 1, 1, 1, 1, 1,
0.2405906, 2.549404, 0.05397584, 1, 1, 1, 1, 1,
0.241031, -0.7864547, 4.239524, 1, 1, 1, 1, 1,
0.2416252, -1.329767, 3.96998, 0, 0, 1, 1, 1,
0.2437012, 1.362919, 1.580423, 1, 0, 0, 1, 1,
0.2479991, -0.248662, 1.3314, 1, 0, 0, 1, 1,
0.2563517, 0.1549593, 0.6099372, 1, 0, 0, 1, 1,
0.2597482, -0.438555, 1.847168, 1, 0, 0, 1, 1,
0.2614653, -0.07365976, 1.103442, 1, 0, 0, 1, 1,
0.2695437, 0.8032463, -0.6823024, 0, 0, 0, 1, 1,
0.271475, -0.5481001, 1.17045, 0, 0, 0, 1, 1,
0.2776162, -0.4306128, 3.332834, 0, 0, 0, 1, 1,
0.2864072, -0.02794346, 0.7408873, 0, 0, 0, 1, 1,
0.2909486, -1.653502, 2.679773, 0, 0, 0, 1, 1,
0.2911468, 1.23555, -0.5889594, 0, 0, 0, 1, 1,
0.2933971, 1.314419, -0.4359374, 0, 0, 0, 1, 1,
0.2955253, 2.688451, 0.9107723, 1, 1, 1, 1, 1,
0.3014963, 1.310502, -0.2430582, 1, 1, 1, 1, 1,
0.3087203, -1.160886, 4.085332, 1, 1, 1, 1, 1,
0.310769, 0.5334438, -0.273732, 1, 1, 1, 1, 1,
0.31403, 0.2643552, -0.8398061, 1, 1, 1, 1, 1,
0.3162731, -0.5761415, 2.188992, 1, 1, 1, 1, 1,
0.3167391, -0.7516132, 1.233136, 1, 1, 1, 1, 1,
0.3168702, 0.410924, -0.4138588, 1, 1, 1, 1, 1,
0.3173785, -0.5203537, 2.071732, 1, 1, 1, 1, 1,
0.3196813, -0.2000391, 1.398046, 1, 1, 1, 1, 1,
0.321472, -1.096914, 1.9595, 1, 1, 1, 1, 1,
0.324039, 0.03490198, 2.900731, 1, 1, 1, 1, 1,
0.3261088, -1.44131, 2.603521, 1, 1, 1, 1, 1,
0.3270736, 0.7530972, 1.714256, 1, 1, 1, 1, 1,
0.3308008, -0.3891072, 2.862801, 1, 1, 1, 1, 1,
0.3341534, -1.353214, 2.05559, 0, 0, 1, 1, 1,
0.3344899, 0.08774001, -0.6389452, 1, 0, 0, 1, 1,
0.3399526, -1.324992, 4.24059, 1, 0, 0, 1, 1,
0.3440896, -1.529814, 3.501058, 1, 0, 0, 1, 1,
0.3479654, 1.013051, 0.06270574, 1, 0, 0, 1, 1,
0.3479774, -1.152272, 2.877583, 1, 0, 0, 1, 1,
0.351806, 0.09827296, 0.8108632, 0, 0, 0, 1, 1,
0.3518347, 2.128227, -0.1136839, 0, 0, 0, 1, 1,
0.3530728, 0.1848498, 1.526041, 0, 0, 0, 1, 1,
0.3541497, 1.00388, 0.9123665, 0, 0, 0, 1, 1,
0.3589874, 0.3898399, 0.7450696, 0, 0, 0, 1, 1,
0.3658413, 1.915416, -0.5495617, 0, 0, 0, 1, 1,
0.3670863, -0.1640579, 0.8467039, 0, 0, 0, 1, 1,
0.3700727, -1.106686, 3.3062, 1, 1, 1, 1, 1,
0.3721088, -0.6184731, 1.924188, 1, 1, 1, 1, 1,
0.3728167, 1.749353, 0.2511945, 1, 1, 1, 1, 1,
0.3754363, -0.08637746, 0.9564974, 1, 1, 1, 1, 1,
0.3754894, 0.251672, 0.8799075, 1, 1, 1, 1, 1,
0.3761163, -0.5330338, 2.162285, 1, 1, 1, 1, 1,
0.3774581, -0.3988988, 3.625429, 1, 1, 1, 1, 1,
0.3787945, -0.7717308, 2.440706, 1, 1, 1, 1, 1,
0.3835239, 0.3151664, 1.632024, 1, 1, 1, 1, 1,
0.3854674, 0.8618172, 0.1859131, 1, 1, 1, 1, 1,
0.3869953, -0.2729537, 0.8651713, 1, 1, 1, 1, 1,
0.3884934, 1.989477, -0.2125032, 1, 1, 1, 1, 1,
0.3942376, -1.418897, 2.792445, 1, 1, 1, 1, 1,
0.397938, 0.7021808, 0.4654934, 1, 1, 1, 1, 1,
0.3990269, 0.3238243, 1.291033, 1, 1, 1, 1, 1,
0.4032462, 0.3181803, 1.291729, 0, 0, 1, 1, 1,
0.4045633, -0.453667, 4.229633, 1, 0, 0, 1, 1,
0.4046274, -0.7285681, 2.248377, 1, 0, 0, 1, 1,
0.4063156, 1.613344, 0.4857425, 1, 0, 0, 1, 1,
0.4103796, -0.9378524, 1.929892, 1, 0, 0, 1, 1,
0.4117455, -1.858385, 1.918307, 1, 0, 0, 1, 1,
0.4119614, -1.82829, 3.318848, 0, 0, 0, 1, 1,
0.4266699, 0.2294267, 3.233303, 0, 0, 0, 1, 1,
0.4332626, 1.429335, 1.590437, 0, 0, 0, 1, 1,
0.4348291, -0.5898026, 4.656907, 0, 0, 0, 1, 1,
0.4351543, -0.1495445, 1.375099, 0, 0, 0, 1, 1,
0.4362035, 1.358152, 1.351009, 0, 0, 0, 1, 1,
0.4387097, 0.3649473, 1.290353, 0, 0, 0, 1, 1,
0.4398692, -0.1084758, 3.321266, 1, 1, 1, 1, 1,
0.449687, 1.155754, -0.7243136, 1, 1, 1, 1, 1,
0.4568001, -0.7112306, 3.163212, 1, 1, 1, 1, 1,
0.4709022, -1.466601, 4.602123, 1, 1, 1, 1, 1,
0.4725912, -1.026045, 3.21515, 1, 1, 1, 1, 1,
0.4736384, 1.388949, 0.08772567, 1, 1, 1, 1, 1,
0.473754, 0.2162753, 0.5693739, 1, 1, 1, 1, 1,
0.4751711, -1.199835, 3.028848, 1, 1, 1, 1, 1,
0.4755535, -0.04426841, 0.43444, 1, 1, 1, 1, 1,
0.4757494, -0.1264736, 2.005175, 1, 1, 1, 1, 1,
0.4791335, -0.7588103, 2.405051, 1, 1, 1, 1, 1,
0.4837824, 0.6742637, 0.6298738, 1, 1, 1, 1, 1,
0.486499, 0.8851143, 0.7089189, 1, 1, 1, 1, 1,
0.4895975, 0.03897158, 3.262459, 1, 1, 1, 1, 1,
0.4904822, -0.4761289, 1.495561, 1, 1, 1, 1, 1,
0.4945088, -0.341417, 3.075908, 0, 0, 1, 1, 1,
0.4973516, -0.7226027, 2.564821, 1, 0, 0, 1, 1,
0.498095, -0.4018711, 2.631268, 1, 0, 0, 1, 1,
0.5013838, 1.093456, -0.83552, 1, 0, 0, 1, 1,
0.503132, -0.05751629, 1.228077, 1, 0, 0, 1, 1,
0.5054559, -0.05849329, -0.2918589, 1, 0, 0, 1, 1,
0.5091282, 1.139685, 0.08125019, 0, 0, 0, 1, 1,
0.5155565, -1.293383, 1.673988, 0, 0, 0, 1, 1,
0.5168091, -0.5538844, 1.012601, 0, 0, 0, 1, 1,
0.5208655, -0.3597061, 2.444341, 0, 0, 0, 1, 1,
0.5218006, -0.8021876, 3.514157, 0, 0, 0, 1, 1,
0.5232983, -0.1136272, 2.745041, 0, 0, 0, 1, 1,
0.5241938, -0.1253321, 3.776422, 0, 0, 0, 1, 1,
0.5299098, -0.7831146, 2.65237, 1, 1, 1, 1, 1,
0.5371595, 0.3951041, 1.925195, 1, 1, 1, 1, 1,
0.5396044, 1.839441, 1.888237, 1, 1, 1, 1, 1,
0.540656, -0.6102207, 1.471517, 1, 1, 1, 1, 1,
0.5509798, 0.3744291, 0.9656174, 1, 1, 1, 1, 1,
0.5544007, 1.035849, 0.7907766, 1, 1, 1, 1, 1,
0.5563002, -0.4515071, 0.3835665, 1, 1, 1, 1, 1,
0.5586578, -0.9728219, 1.433256, 1, 1, 1, 1, 1,
0.5591584, -0.5891077, 3.332671, 1, 1, 1, 1, 1,
0.5596678, -0.8093528, 3.083433, 1, 1, 1, 1, 1,
0.5648427, -1.763123, 1.900558, 1, 1, 1, 1, 1,
0.5720904, -0.1514541, 1.307295, 1, 1, 1, 1, 1,
0.5725817, -0.8739506, 2.898397, 1, 1, 1, 1, 1,
0.5730426, 0.3230334, 1.440798, 1, 1, 1, 1, 1,
0.5763358, -0.6669878, 3.061959, 1, 1, 1, 1, 1,
0.5771447, -0.2836155, 2.101434, 0, 0, 1, 1, 1,
0.5793901, -0.2641954, 3.206732, 1, 0, 0, 1, 1,
0.5836247, 1.098042, -0.8289648, 1, 0, 0, 1, 1,
0.585815, 0.3924497, -0.4641287, 1, 0, 0, 1, 1,
0.5881151, 0.4304709, 0.4571461, 1, 0, 0, 1, 1,
0.5898439, -1.019103, 3.769023, 1, 0, 0, 1, 1,
0.5916191, -0.637908, 3.505203, 0, 0, 0, 1, 1,
0.592162, 0.606065, 0.218355, 0, 0, 0, 1, 1,
0.5932858, 0.2193953, 1.066232, 0, 0, 0, 1, 1,
0.5940207, -0.8458763, 2.705932, 0, 0, 0, 1, 1,
0.5982242, 0.2382146, 0.9403645, 0, 0, 0, 1, 1,
0.6002182, -0.542788, 0.3529938, 0, 0, 0, 1, 1,
0.6046168, -0.7453431, 2.781361, 0, 0, 0, 1, 1,
0.6087288, -1.575168, 4.305523, 1, 1, 1, 1, 1,
0.6116205, 0.8677262, -0.8793601, 1, 1, 1, 1, 1,
0.620101, -1.066994, 2.947784, 1, 1, 1, 1, 1,
0.621807, 1.056036, -0.4039096, 1, 1, 1, 1, 1,
0.622493, 0.4452253, 1.525906, 1, 1, 1, 1, 1,
0.624644, 0.7292388, 1.384636, 1, 1, 1, 1, 1,
0.6345023, -0.7340693, 1.25503, 1, 1, 1, 1, 1,
0.6349092, 1.36694, 0.6095357, 1, 1, 1, 1, 1,
0.6356114, -0.008507504, 0.8950747, 1, 1, 1, 1, 1,
0.6399274, -0.743692, 1.401096, 1, 1, 1, 1, 1,
0.6409051, -0.2969541, 2.387547, 1, 1, 1, 1, 1,
0.6443542, -0.7534761, 2.799138, 1, 1, 1, 1, 1,
0.6446816, 0.2496313, 0.7784917, 1, 1, 1, 1, 1,
0.6495485, -0.2083636, 0.5511523, 1, 1, 1, 1, 1,
0.6528122, -0.4767757, 3.598146, 1, 1, 1, 1, 1,
0.6586577, 0.6832431, 0.3303815, 0, 0, 1, 1, 1,
0.6742979, -1.174141, 0.93989, 1, 0, 0, 1, 1,
0.6767607, -0.7766328, 1.677451, 1, 0, 0, 1, 1,
0.680758, -0.208335, 1.122459, 1, 0, 0, 1, 1,
0.6809643, 0.2892404, 0.6895703, 1, 0, 0, 1, 1,
0.6815238, 0.3089802, 2.157053, 1, 0, 0, 1, 1,
0.6864359, -1.090315, 0.9225491, 0, 0, 0, 1, 1,
0.6901924, 1.164951, -0.1816843, 0, 0, 0, 1, 1,
0.6927345, -1.365491, 3.592003, 0, 0, 0, 1, 1,
0.6947908, -0.09779936, 2.487363, 0, 0, 0, 1, 1,
0.6994541, 1.641349, 0.5934216, 0, 0, 0, 1, 1,
0.7013174, 2.629545, 1.196544, 0, 0, 0, 1, 1,
0.7021179, -1.39325, 2.992753, 0, 0, 0, 1, 1,
0.7103127, 1.123306, 2.008733, 1, 1, 1, 1, 1,
0.7167962, -0.9283534, 1.515065, 1, 1, 1, 1, 1,
0.7227942, -0.3616763, 2.503254, 1, 1, 1, 1, 1,
0.7232102, -1.792666, 2.907905, 1, 1, 1, 1, 1,
0.7240751, 1.451805, -0.5430501, 1, 1, 1, 1, 1,
0.7257275, -0.7815297, 1.887305, 1, 1, 1, 1, 1,
0.7258623, -1.019653, 0.7606933, 1, 1, 1, 1, 1,
0.7271706, -0.1893972, 1.600687, 1, 1, 1, 1, 1,
0.7360079, -0.1428535, 3.192859, 1, 1, 1, 1, 1,
0.7360738, -0.4880788, 2.903563, 1, 1, 1, 1, 1,
0.7371174, -2.088387, 2.652932, 1, 1, 1, 1, 1,
0.7374578, 0.9321383, 0.7488223, 1, 1, 1, 1, 1,
0.7468387, -0.658197, 2.943169, 1, 1, 1, 1, 1,
0.749341, 0.7319311, 1.161464, 1, 1, 1, 1, 1,
0.7631739, 0.08341153, 2.613683, 1, 1, 1, 1, 1,
0.7640153, -2.157044, 2.482758, 0, 0, 1, 1, 1,
0.7723898, -2.236379, 4.993314, 1, 0, 0, 1, 1,
0.7770728, -0.5778131, 1.937974, 1, 0, 0, 1, 1,
0.7785196, 0.6380256, 1.189444, 1, 0, 0, 1, 1,
0.7811972, -0.4688553, 2.109723, 1, 0, 0, 1, 1,
0.7858293, 0.9905602, 1.219315, 1, 0, 0, 1, 1,
0.7902792, 0.2469787, 1.447984, 0, 0, 0, 1, 1,
0.7917317, 0.4721756, 3.366556, 0, 0, 0, 1, 1,
0.7918918, 1.849269, -0.5938035, 0, 0, 0, 1, 1,
0.7958117, 0.7085047, 1.189582, 0, 0, 0, 1, 1,
0.8009216, 0.618321, 0.9236421, 0, 0, 0, 1, 1,
0.8082352, -1.210433, 2.631065, 0, 0, 0, 1, 1,
0.8092583, 0.5379992, 0.06616751, 0, 0, 0, 1, 1,
0.8101386, -0.02762972, 1.910464, 1, 1, 1, 1, 1,
0.8102017, -1.318167, 4.771282, 1, 1, 1, 1, 1,
0.8154952, -0.04232487, 1.779319, 1, 1, 1, 1, 1,
0.8212435, 0.536397, -1.103006, 1, 1, 1, 1, 1,
0.8233771, 0.5879151, 1.09294, 1, 1, 1, 1, 1,
0.8263301, 0.4460222, 0.7831249, 1, 1, 1, 1, 1,
0.8293978, 0.05492237, 1.475778, 1, 1, 1, 1, 1,
0.833379, -1.115866, 1.374784, 1, 1, 1, 1, 1,
0.842096, -0.2382016, 2.401118, 1, 1, 1, 1, 1,
0.8472898, 0.01047104, 2.782438, 1, 1, 1, 1, 1,
0.8484499, -2.912658, 2.935245, 1, 1, 1, 1, 1,
0.8487809, -0.3848167, 1.918205, 1, 1, 1, 1, 1,
0.849251, -1.111355, 2.457457, 1, 1, 1, 1, 1,
0.8492549, -0.7132319, 2.469995, 1, 1, 1, 1, 1,
0.8558891, -0.2663327, 1.753008, 1, 1, 1, 1, 1,
0.8602537, -0.3873377, 1.264302, 0, 0, 1, 1, 1,
0.8651626, 0.578365, 2.119121, 1, 0, 0, 1, 1,
0.8652083, 0.9184374, 0.8729985, 1, 0, 0, 1, 1,
0.8737481, 1.232425, 2.328425, 1, 0, 0, 1, 1,
0.8749548, -0.4520861, 2.868685, 1, 0, 0, 1, 1,
0.8789697, 0.9514328, -0.4629751, 1, 0, 0, 1, 1,
0.880959, -1.304834, 2.750367, 0, 0, 0, 1, 1,
0.8873823, 0.3896874, 1.785644, 0, 0, 0, 1, 1,
0.890497, -0.6712468, 2.358784, 0, 0, 0, 1, 1,
0.8914822, 0.6108375, -0.158103, 0, 0, 0, 1, 1,
0.8941578, -1.629718, 2.563923, 0, 0, 0, 1, 1,
0.9052274, 0.279004, 2.268368, 0, 0, 0, 1, 1,
0.9094059, 0.2173479, 0.05838101, 0, 0, 0, 1, 1,
0.9122404, -0.190288, 0.6412366, 1, 1, 1, 1, 1,
0.9132919, -0.7217577, 2.598104, 1, 1, 1, 1, 1,
0.9185651, -0.282133, 1.929316, 1, 1, 1, 1, 1,
0.9206417, 1.026334, 2.034854, 1, 1, 1, 1, 1,
0.924333, -1.312992, 1.56646, 1, 1, 1, 1, 1,
0.9283015, 0.07400954, 1.62668, 1, 1, 1, 1, 1,
0.9339652, -0.5581168, 1.817006, 1, 1, 1, 1, 1,
0.9343229, 0.08559478, 2.39081, 1, 1, 1, 1, 1,
0.9394136, -0.08840983, 1.529009, 1, 1, 1, 1, 1,
0.9457022, -1.22646, 2.067243, 1, 1, 1, 1, 1,
0.9477522, 2.877255, 0.8997925, 1, 1, 1, 1, 1,
0.9494021, 1.411879, -1.002082, 1, 1, 1, 1, 1,
0.9498991, 0.108743, 2.228927, 1, 1, 1, 1, 1,
0.9500132, -0.6211419, 1.321968, 1, 1, 1, 1, 1,
0.9520365, -0.5514657, 2.456527, 1, 1, 1, 1, 1,
0.9536847, -0.2325113, 2.034007, 0, 0, 1, 1, 1,
0.954867, 0.5955412, 0.5809993, 1, 0, 0, 1, 1,
0.9562354, 1.132146, 2.946209, 1, 0, 0, 1, 1,
0.9632194, 0.5180681, 1.053749, 1, 0, 0, 1, 1,
0.9689267, 0.06744191, 1.744973, 1, 0, 0, 1, 1,
0.9690807, -1.056137, 2.799248, 1, 0, 0, 1, 1,
0.9717318, 1.235441, -0.1660432, 0, 0, 0, 1, 1,
0.9718999, -0.8019198, 0.8168352, 0, 0, 0, 1, 1,
0.9772596, -0.7219222, 0.8062873, 0, 0, 0, 1, 1,
0.9812291, 0.743827, 1.776615, 0, 0, 0, 1, 1,
0.9883896, 0.5548919, 2.750716, 0, 0, 0, 1, 1,
0.9889307, -3.191128, 3.526944, 0, 0, 0, 1, 1,
0.9892904, 0.368167, 2.039921, 0, 0, 0, 1, 1,
0.9900973, 1.373252, 0.3336319, 1, 1, 1, 1, 1,
0.9922652, -0.3316883, 0.9054583, 1, 1, 1, 1, 1,
0.995527, -0.5611904, 1.2377, 1, 1, 1, 1, 1,
0.9961273, 0.8937237, 0.5582786, 1, 1, 1, 1, 1,
0.9975691, -0.3590776, 1.047425, 1, 1, 1, 1, 1,
0.999417, -1.822079, 3.535658, 1, 1, 1, 1, 1,
0.9997035, -0.2112747, 1.808886, 1, 1, 1, 1, 1,
1.000362, 0.1647053, 1.316724, 1, 1, 1, 1, 1,
1.00244, -0.703989, 0.2041704, 1, 1, 1, 1, 1,
1.003659, 0.1253561, 0.8945242, 1, 1, 1, 1, 1,
1.003991, -0.9217337, 3.1975, 1, 1, 1, 1, 1,
1.004897, 1.907001, -1.543969, 1, 1, 1, 1, 1,
1.010407, 0.7966498, 1.737797, 1, 1, 1, 1, 1,
1.011409, -1.754937, 0.02465196, 1, 1, 1, 1, 1,
1.014411, 0.4255468, 1.684054, 1, 1, 1, 1, 1,
1.016607, -0.6943631, 1.376757, 0, 0, 1, 1, 1,
1.019779, -0.7473572, 1.50041, 1, 0, 0, 1, 1,
1.020524, -0.6569076, 1.520867, 1, 0, 0, 1, 1,
1.022487, -1.522625, 2.853687, 1, 0, 0, 1, 1,
1.02317, -0.8011805, 4.896829, 1, 0, 0, 1, 1,
1.029357, -0.6411063, 1.943096, 1, 0, 0, 1, 1,
1.031827, 0.6542455, 2.152447, 0, 0, 0, 1, 1,
1.03312, 2.139823, 1.528646, 0, 0, 0, 1, 1,
1.035988, 0.5502531, 0.6311982, 0, 0, 0, 1, 1,
1.039417, 0.9815478, 0.9846759, 0, 0, 0, 1, 1,
1.040333, -0.5042561, 3.399234, 0, 0, 0, 1, 1,
1.04341, 1.135512, -0.351726, 0, 0, 0, 1, 1,
1.062864, 0.682853, 0.863156, 0, 0, 0, 1, 1,
1.065964, -0.63019, 0.8565679, 1, 1, 1, 1, 1,
1.068212, -1.002822, 2.668793, 1, 1, 1, 1, 1,
1.075303, 0.08353551, -0.09441427, 1, 1, 1, 1, 1,
1.075742, -0.07866075, 2.623889, 1, 1, 1, 1, 1,
1.076497, -0.6124226, 1.945433, 1, 1, 1, 1, 1,
1.079999, 1.757557, 0.8217114, 1, 1, 1, 1, 1,
1.087268, -1.808864, 2.420115, 1, 1, 1, 1, 1,
1.090744, 0.5537948, 3.389536, 1, 1, 1, 1, 1,
1.095153, 0.2857817, 0.4090855, 1, 1, 1, 1, 1,
1.101893, -0.5368253, 0.6906548, 1, 1, 1, 1, 1,
1.10396, 1.077477, 0.5251703, 1, 1, 1, 1, 1,
1.108665, -1.105771, 2.489797, 1, 1, 1, 1, 1,
1.115974, 0.8596844, -1.459845, 1, 1, 1, 1, 1,
1.120413, 0.2692786, 1.195587, 1, 1, 1, 1, 1,
1.12327, -0.3925516, 3.279937, 1, 1, 1, 1, 1,
1.126578, 0.09629653, 4.075165, 0, 0, 1, 1, 1,
1.130042, -1.646178, 2.476999, 1, 0, 0, 1, 1,
1.131978, -1.400524, 3.163572, 1, 0, 0, 1, 1,
1.138379, 0.3776, 2.255752, 1, 0, 0, 1, 1,
1.139204, 0.5009949, 1.008098, 1, 0, 0, 1, 1,
1.149658, 1.468256, 1.654445, 1, 0, 0, 1, 1,
1.158855, -1.03632, 1.875585, 0, 0, 0, 1, 1,
1.160673, -0.1997313, 1.307533, 0, 0, 0, 1, 1,
1.165692, 0.1499968, 1.708223, 0, 0, 0, 1, 1,
1.166683, 0.427554, 2.220248, 0, 0, 0, 1, 1,
1.176331, -0.1295793, 2.20986, 0, 0, 0, 1, 1,
1.176884, -0.9335157, 1.598093, 0, 0, 0, 1, 1,
1.178314, 0.9180256, 0.6074573, 0, 0, 0, 1, 1,
1.190943, 0.9211761, 0.9157736, 1, 1, 1, 1, 1,
1.195455, 0.6466256, 0.4352305, 1, 1, 1, 1, 1,
1.197448, -0.3372379, 0.9426682, 1, 1, 1, 1, 1,
1.200139, 0.8843251, -0.2664782, 1, 1, 1, 1, 1,
1.205514, -0.431958, 2.680889, 1, 1, 1, 1, 1,
1.209319, -0.1527377, 2.071455, 1, 1, 1, 1, 1,
1.213287, -0.9191121, 2.408503, 1, 1, 1, 1, 1,
1.215539, 0.5347817, 1.767518, 1, 1, 1, 1, 1,
1.231641, -0.8077147, 1.177744, 1, 1, 1, 1, 1,
1.24328, 0.6506734, 1.971956, 1, 1, 1, 1, 1,
1.243714, 1.018987, 0.1673564, 1, 1, 1, 1, 1,
1.244697, 0.6411492, 1.208089, 1, 1, 1, 1, 1,
1.248239, -0.2782527, 2.743327, 1, 1, 1, 1, 1,
1.250799, -0.9543058, 0.4133871, 1, 1, 1, 1, 1,
1.2653, -0.5327446, 2.044381, 1, 1, 1, 1, 1,
1.266748, 0.3509236, 0.4496593, 0, 0, 1, 1, 1,
1.267628, 1.805521, 1.980988, 1, 0, 0, 1, 1,
1.273768, 0.8588638, 0.1839987, 1, 0, 0, 1, 1,
1.276305, -0.6698449, 1.497735, 1, 0, 0, 1, 1,
1.285775, 0.5005219, 1.046572, 1, 0, 0, 1, 1,
1.28883, -0.8790254, -0.1156095, 1, 0, 0, 1, 1,
1.307986, 1.700396, 0.1925817, 0, 0, 0, 1, 1,
1.313276, 0.1152371, 1.228169, 0, 0, 0, 1, 1,
1.31676, 1.014046, -0.5649621, 0, 0, 0, 1, 1,
1.321086, 1.135364, 1.299344, 0, 0, 0, 1, 1,
1.331887, 0.5072979, -0.6854126, 0, 0, 0, 1, 1,
1.346784, 0.6312814, 0.2576239, 0, 0, 0, 1, 1,
1.350251, 0.2614928, 1.164662, 0, 0, 0, 1, 1,
1.351565, -2.313904, 1.20204, 1, 1, 1, 1, 1,
1.353463, 1.262877, 2.511443, 1, 1, 1, 1, 1,
1.36702, -1.456062, 2.827763, 1, 1, 1, 1, 1,
1.373057, -1.443767, 1.619816, 1, 1, 1, 1, 1,
1.373141, 0.5444845, -0.9380448, 1, 1, 1, 1, 1,
1.399384, -0.9181058, 2.226318, 1, 1, 1, 1, 1,
1.403449, 0.3574785, -0.1416695, 1, 1, 1, 1, 1,
1.419897, -0.8301334, 2.414902, 1, 1, 1, 1, 1,
1.428265, -1.58558, 2.182188, 1, 1, 1, 1, 1,
1.428942, 0.1912694, 2.073447, 1, 1, 1, 1, 1,
1.445075, 1.249173, 1.178654, 1, 1, 1, 1, 1,
1.445921, -0.761686, 3.922202, 1, 1, 1, 1, 1,
1.453341, -0.03613859, 0.6044645, 1, 1, 1, 1, 1,
1.453537, -0.5196409, 1.549386, 1, 1, 1, 1, 1,
1.456043, 0.08422302, 2.119458, 1, 1, 1, 1, 1,
1.460168, -0.05798962, 1.892474, 0, 0, 1, 1, 1,
1.462313, 0.9273318, 1.233447, 1, 0, 0, 1, 1,
1.471799, -0.2643256, 0.3627274, 1, 0, 0, 1, 1,
1.483294, 0.2626624, 1.296075, 1, 0, 0, 1, 1,
1.486532, -0.07183065, 1.20366, 1, 0, 0, 1, 1,
1.48695, -1.193231, 2.099811, 1, 0, 0, 1, 1,
1.492423, 0.0276567, 1.303167, 0, 0, 0, 1, 1,
1.502017, 0.7269115, 2.174261, 0, 0, 0, 1, 1,
1.502883, -0.6485, 2.10018, 0, 0, 0, 1, 1,
1.506692, 0.4909346, 1.650503, 0, 0, 0, 1, 1,
1.508492, 0.06679248, 2.050833, 0, 0, 0, 1, 1,
1.514297, -0.7736731, 2.494651, 0, 0, 0, 1, 1,
1.514768, -0.245344, 1.188626, 0, 0, 0, 1, 1,
1.527095, 0.2628891, 0.6339271, 1, 1, 1, 1, 1,
1.546075, 0.07401341, 2.256181, 1, 1, 1, 1, 1,
1.551805, -1.896333, 1.25927, 1, 1, 1, 1, 1,
1.557155, -0.2348617, 2.112111, 1, 1, 1, 1, 1,
1.558762, 0.9449769, 2.202735, 1, 1, 1, 1, 1,
1.558937, 1.130983, 1.808985, 1, 1, 1, 1, 1,
1.559922, -0.7398567, 1.488615, 1, 1, 1, 1, 1,
1.596291, 0.6885715, -0.445025, 1, 1, 1, 1, 1,
1.599563, -0.3009975, -0.5940672, 1, 1, 1, 1, 1,
1.60216, -0.5151296, 0.642004, 1, 1, 1, 1, 1,
1.60331, -0.2826788, 1.622252, 1, 1, 1, 1, 1,
1.604453, -0.1802985, 1.00656, 1, 1, 1, 1, 1,
1.614385, 1.953906, 1.664034, 1, 1, 1, 1, 1,
1.617317, -0.5408048, 1.020029, 1, 1, 1, 1, 1,
1.617621, 0.04025767, 1.941434, 1, 1, 1, 1, 1,
1.620092, 0.3116336, 2.22104, 0, 0, 1, 1, 1,
1.624897, -1.577377, 2.004301, 1, 0, 0, 1, 1,
1.633288, 1.621862, 1.47326, 1, 0, 0, 1, 1,
1.641905, -0.7912372, 3.308033, 1, 0, 0, 1, 1,
1.643623, 0.5125445, -0.5390247, 1, 0, 0, 1, 1,
1.645256, -1.644273, 2.205805, 1, 0, 0, 1, 1,
1.658283, 0.1670887, 1.390157, 0, 0, 0, 1, 1,
1.660176, 0.5180768, 0.9325015, 0, 0, 0, 1, 1,
1.686418, 1.101016, 1.269773, 0, 0, 0, 1, 1,
1.691257, -0.07011822, 2.463432, 0, 0, 0, 1, 1,
1.719211, -0.5246331, 1.568096, 0, 0, 0, 1, 1,
1.753737, -0.7067574, 4.016019, 0, 0, 0, 1, 1,
1.782692, -0.415261, 3.700474, 0, 0, 0, 1, 1,
1.816084, 0.469032, 1.404268, 1, 1, 1, 1, 1,
1.820766, 0.3068385, 1.763347, 1, 1, 1, 1, 1,
1.828579, -0.624853, 2.878721, 1, 1, 1, 1, 1,
1.842975, -1.790783, 1.799181, 1, 1, 1, 1, 1,
1.873207, 2.332439, 0.08593035, 1, 1, 1, 1, 1,
1.873642, -1.366905, 4.072798, 1, 1, 1, 1, 1,
1.900052, 0.3835104, 1.308899, 1, 1, 1, 1, 1,
1.913747, -0.295059, 1.088733, 1, 1, 1, 1, 1,
1.923921, 0.4096607, 1.576577, 1, 1, 1, 1, 1,
1.928435, 0.2114222, 0.503737, 1, 1, 1, 1, 1,
1.952553, 0.5386661, 3.673369, 1, 1, 1, 1, 1,
1.960094, -2.044687, 3.726897, 1, 1, 1, 1, 1,
1.979137, 0.8773085, -0.03194268, 1, 1, 1, 1, 1,
1.982383, -0.4661009, 3.210582, 1, 1, 1, 1, 1,
2.011594, 0.7552672, 1.13273, 1, 1, 1, 1, 1,
2.030102, -0.2881221, 1.694286, 0, 0, 1, 1, 1,
2.041049, 0.025809, 3.47997, 1, 0, 0, 1, 1,
2.068749, 2.423915, 1.531693, 1, 0, 0, 1, 1,
2.08453, -0.2448109, 2.238508, 1, 0, 0, 1, 1,
2.089235, -0.5285435, 2.531945, 1, 0, 0, 1, 1,
2.131764, -1.790769, 4.27204, 1, 0, 0, 1, 1,
2.156336, -1.026836, 1.924291, 0, 0, 0, 1, 1,
2.185578, 0.3922735, 1.928837, 0, 0, 0, 1, 1,
2.230909, 0.5673819, 1.146822, 0, 0, 0, 1, 1,
2.270582, -0.7367619, 1.677918, 0, 0, 0, 1, 1,
2.287979, 0.3824593, -1.277136, 0, 0, 0, 1, 1,
2.313128, -0.02615371, 1.874454, 0, 0, 0, 1, 1,
2.412594, -0.2707567, 1.710339, 0, 0, 0, 1, 1,
2.430304, -2.007236, 2.056296, 1, 1, 1, 1, 1,
2.470874, 1.065479, 1.985097, 1, 1, 1, 1, 1,
2.496706, -0.9883379, 3.009945, 1, 1, 1, 1, 1,
2.521324, 0.2218775, 0.989374, 1, 1, 1, 1, 1,
2.690766, 1.614408, 2.89358, 1, 1, 1, 1, 1,
2.736019, 0.901528, 0.1012641, 1, 1, 1, 1, 1,
2.809504, -0.4582669, 2.533716, 1, 1, 1, 1, 1
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
var radius = 9.196438;
var distance = 32.3021;
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
mvMatrix.translate( 0.06865585, 0.1147037, -0.2808933 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.3021);
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
