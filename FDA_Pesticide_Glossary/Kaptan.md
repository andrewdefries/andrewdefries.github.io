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
-2.62598, -1.005119, -2.422803, 1, 0, 0, 1,
-2.357893, -0.8938199, -0.4805549, 1, 0.007843138, 0, 1,
-2.344999, -1.383302, -3.148905, 1, 0.01176471, 0, 1,
-2.309873, -0.009965776, -1.487854, 1, 0.01960784, 0, 1,
-2.127513, 0.2088459, -2.035817, 1, 0.02352941, 0, 1,
-2.117791, -1.706177, -3.63551, 1, 0.03137255, 0, 1,
-2.086866, 0.04533311, -3.556962, 1, 0.03529412, 0, 1,
-2.084373, -1.051988, -0.7660379, 1, 0.04313726, 0, 1,
-2.045135, 0.8569102, 0.2077802, 1, 0.04705882, 0, 1,
-2.025174, 0.9744927, -0.5608862, 1, 0.05490196, 0, 1,
-2.0175, -1.081959, -1.499579, 1, 0.05882353, 0, 1,
-2.006488, 0.07229085, 0.9791185, 1, 0.06666667, 0, 1,
-1.979562, 1.081452, -1.531674, 1, 0.07058824, 0, 1,
-1.944146, 1.548769, 1.388609, 1, 0.07843138, 0, 1,
-1.920753, -0.09012569, -1.991492, 1, 0.08235294, 0, 1,
-1.916314, -1.051946, -1.406671, 1, 0.09019608, 0, 1,
-1.905622, -0.9228079, -2.444355, 1, 0.09411765, 0, 1,
-1.895297, -0.7181855, -1.50156, 1, 0.1019608, 0, 1,
-1.891108, -0.9528826, -1.922457, 1, 0.1098039, 0, 1,
-1.881481, -0.04226674, -1.69314, 1, 0.1137255, 0, 1,
-1.861879, -0.08992104, -1.976954, 1, 0.1215686, 0, 1,
-1.839872, 1.547574, -0.3960376, 1, 0.1254902, 0, 1,
-1.836854, 1.203748, -2.1102, 1, 0.1333333, 0, 1,
-1.812589, 0.4203539, -3.825179, 1, 0.1372549, 0, 1,
-1.789464, 0.2997008, -1.547872, 1, 0.145098, 0, 1,
-1.769374, 0.5045372, -1.479118, 1, 0.1490196, 0, 1,
-1.760386, 0.3421293, -2.451651, 1, 0.1568628, 0, 1,
-1.742239, 1.319831, -1.565777, 1, 0.1607843, 0, 1,
-1.736262, -0.9905117, -3.124583, 1, 0.1686275, 0, 1,
-1.735935, 0.9781809, -2.652438, 1, 0.172549, 0, 1,
-1.722531, -2.624013, -0.7040505, 1, 0.1803922, 0, 1,
-1.716517, 0.2039167, -2.471191, 1, 0.1843137, 0, 1,
-1.715361, -1.832568, -2.240063, 1, 0.1921569, 0, 1,
-1.710203, -1.441406, -1.731758, 1, 0.1960784, 0, 1,
-1.707913, -0.1223655, -3.807732, 1, 0.2039216, 0, 1,
-1.706713, 0.2314096, -4.118686, 1, 0.2117647, 0, 1,
-1.619552, -0.06699596, -2.360553, 1, 0.2156863, 0, 1,
-1.611924, 0.0270158, -2.342875, 1, 0.2235294, 0, 1,
-1.603978, -0.1595038, -3.022003, 1, 0.227451, 0, 1,
-1.596867, -0.2357111, -0.4368421, 1, 0.2352941, 0, 1,
-1.596291, 0.747135, -1.049078, 1, 0.2392157, 0, 1,
-1.587457, -2.184702, -3.230114, 1, 0.2470588, 0, 1,
-1.584854, -0.5566313, -0.3493404, 1, 0.2509804, 0, 1,
-1.579914, -0.3260676, -0.1401124, 1, 0.2588235, 0, 1,
-1.57712, 1.076138, -0.8120636, 1, 0.2627451, 0, 1,
-1.575186, -0.1102777, -3.877506, 1, 0.2705882, 0, 1,
-1.559402, 0.1723743, -1.720685, 1, 0.2745098, 0, 1,
-1.556457, 0.4766502, -1.082193, 1, 0.282353, 0, 1,
-1.547028, -0.3836571, -2.657922, 1, 0.2862745, 0, 1,
-1.545269, 0.2924883, -1.332315, 1, 0.2941177, 0, 1,
-1.53993, 0.6601486, -1.850543, 1, 0.3019608, 0, 1,
-1.531615, 0.8413793, 0.8808823, 1, 0.3058824, 0, 1,
-1.528732, 0.03691186, -2.187067, 1, 0.3137255, 0, 1,
-1.51514, 0.3606052, -0.4412968, 1, 0.3176471, 0, 1,
-1.5015, 0.8226318, -0.3714157, 1, 0.3254902, 0, 1,
-1.498327, 0.7558061, -1.132505, 1, 0.3294118, 0, 1,
-1.493846, -0.9357241, -2.874443, 1, 0.3372549, 0, 1,
-1.481089, -0.8930987, -1.768357, 1, 0.3411765, 0, 1,
-1.463258, 0.3405012, -0.8231264, 1, 0.3490196, 0, 1,
-1.43854, 0.298561, -1.331567, 1, 0.3529412, 0, 1,
-1.400456, 0.2030367, -1.811058, 1, 0.3607843, 0, 1,
-1.40022, 0.5184538, -1.45352, 1, 0.3647059, 0, 1,
-1.381265, 0.9084321, -1.280193, 1, 0.372549, 0, 1,
-1.373152, -0.6181835, -1.518935, 1, 0.3764706, 0, 1,
-1.371228, 0.1907981, -1.48111, 1, 0.3843137, 0, 1,
-1.371198, 0.8130984, -2.220101, 1, 0.3882353, 0, 1,
-1.357671, -0.5175673, -0.9863808, 1, 0.3960784, 0, 1,
-1.336303, 1.43102, -0.7089312, 1, 0.4039216, 0, 1,
-1.333562, -0.7089338, -0.2173431, 1, 0.4078431, 0, 1,
-1.331777, -2.709099, -3.26335, 1, 0.4156863, 0, 1,
-1.33088, 1.076376, 0.3204859, 1, 0.4196078, 0, 1,
-1.322487, -1.07975, -2.227772, 1, 0.427451, 0, 1,
-1.320835, 0.3801154, -1.081047, 1, 0.4313726, 0, 1,
-1.319639, 0.6387882, -0.0737345, 1, 0.4392157, 0, 1,
-1.314132, 0.4395427, -0.1285627, 1, 0.4431373, 0, 1,
-1.313956, 0.7357722, -0.1769285, 1, 0.4509804, 0, 1,
-1.311214, 0.378231, 0.4634221, 1, 0.454902, 0, 1,
-1.306503, -1.40725, -2.064915, 1, 0.4627451, 0, 1,
-1.294437, 0.5781279, 0.1123553, 1, 0.4666667, 0, 1,
-1.281206, 0.971274, -0.5352153, 1, 0.4745098, 0, 1,
-1.276253, 0.1906802, -2.29212, 1, 0.4784314, 0, 1,
-1.270772, -0.1028675, -1.229911, 1, 0.4862745, 0, 1,
-1.259928, -0.7263298, -1.612278, 1, 0.4901961, 0, 1,
-1.255547, 0.8881921, -0.5055555, 1, 0.4980392, 0, 1,
-1.255025, -2.355114, -3.755441, 1, 0.5058824, 0, 1,
-1.243821, 0.9374689, -2.026662, 1, 0.509804, 0, 1,
-1.237591, -0.1175759, -1.704607, 1, 0.5176471, 0, 1,
-1.232723, 2.301368, 1.01394, 1, 0.5215687, 0, 1,
-1.23105, 1.305628, -1.149796, 1, 0.5294118, 0, 1,
-1.230955, -0.512427, -2.383781, 1, 0.5333334, 0, 1,
-1.219971, 0.6688648, -1.146399, 1, 0.5411765, 0, 1,
-1.213911, 0.3937889, -0.859432, 1, 0.5450981, 0, 1,
-1.212598, -2.233779, -3.33255, 1, 0.5529412, 0, 1,
-1.211911, 1.524145, 0.1586552, 1, 0.5568628, 0, 1,
-1.199582, 0.1484567, -0.6971387, 1, 0.5647059, 0, 1,
-1.193572, -2.164436, -2.923666, 1, 0.5686275, 0, 1,
-1.178102, 0.1372052, -1.681092, 1, 0.5764706, 0, 1,
-1.174338, -0.3542115, -1.602536, 1, 0.5803922, 0, 1,
-1.173609, 1.935183, 0.05435682, 1, 0.5882353, 0, 1,
-1.164816, -0.06642774, -1.770776, 1, 0.5921569, 0, 1,
-1.153862, -1.16448, -2.533288, 1, 0.6, 0, 1,
-1.149773, -0.01817712, -1.347897, 1, 0.6078432, 0, 1,
-1.148834, -0.9092925, -0.6660079, 1, 0.6117647, 0, 1,
-1.148448, -0.001138513, -2.659958, 1, 0.6196079, 0, 1,
-1.143506, 0.3235567, -0.06349641, 1, 0.6235294, 0, 1,
-1.142339, 0.1805087, -1.565982, 1, 0.6313726, 0, 1,
-1.134987, 0.9248335, -0.9919066, 1, 0.6352941, 0, 1,
-1.123418, -0.8018109, -4.094794, 1, 0.6431373, 0, 1,
-1.120636, -2.095428, -3.346332, 1, 0.6470588, 0, 1,
-1.118461, -0.5437729, -1.558195, 1, 0.654902, 0, 1,
-1.112567, -0.02735456, -1.60193, 1, 0.6588235, 0, 1,
-1.10605, 0.1576903, -2.006858, 1, 0.6666667, 0, 1,
-1.105987, 0.7004877, -0.1089785, 1, 0.6705883, 0, 1,
-1.095863, 0.7603682, -1.144271, 1, 0.6784314, 0, 1,
-1.088793, 0.9691944, -1.238523, 1, 0.682353, 0, 1,
-1.087829, 0.5696677, -2.302527, 1, 0.6901961, 0, 1,
-1.085327, 1.478205, -1.410763, 1, 0.6941177, 0, 1,
-1.066788, -0.2747272, -2.114607, 1, 0.7019608, 0, 1,
-1.066501, -0.9717205, -3.210728, 1, 0.7098039, 0, 1,
-1.061657, -0.9655877, -0.8502927, 1, 0.7137255, 0, 1,
-1.061509, 0.04803231, -0.6660597, 1, 0.7215686, 0, 1,
-1.054807, -0.6034901, -2.181558, 1, 0.7254902, 0, 1,
-1.044202, 0.9777274, -0.6174138, 1, 0.7333333, 0, 1,
-1.04377, -1.677828, -3.445208, 1, 0.7372549, 0, 1,
-1.042979, -1.13155, -3.34509, 1, 0.7450981, 0, 1,
-1.037559, -1.231211, -3.818691, 1, 0.7490196, 0, 1,
-1.037293, 0.0205972, -0.572371, 1, 0.7568628, 0, 1,
-1.029239, -0.6500466, -4.093857, 1, 0.7607843, 0, 1,
-1.026153, -0.9348813, -1.973884, 1, 0.7686275, 0, 1,
-1.007748, -1.819881, -1.013241, 1, 0.772549, 0, 1,
-1.007143, 0.3595989, -0.4501281, 1, 0.7803922, 0, 1,
-1.005353, 0.8190947, -0.3984681, 1, 0.7843137, 0, 1,
-1.004753, -0.2227784, -2.419779, 1, 0.7921569, 0, 1,
-1.003335, 0.6241847, -0.9782947, 1, 0.7960784, 0, 1,
-1.000771, -0.2860743, -2.288046, 1, 0.8039216, 0, 1,
-0.9953484, 0.7153586, -0.4924811, 1, 0.8117647, 0, 1,
-0.9947627, 2.388707, 0.3059566, 1, 0.8156863, 0, 1,
-0.9940487, -0.5047736, -0.4170979, 1, 0.8235294, 0, 1,
-0.9933327, 0.04709096, -3.494824, 1, 0.827451, 0, 1,
-0.9864373, -0.1897564, -1.043173, 1, 0.8352941, 0, 1,
-0.9851477, 0.8268556, -1.740782, 1, 0.8392157, 0, 1,
-0.9843593, 0.9836779, -1.9638, 1, 0.8470588, 0, 1,
-0.9804211, 1.419571, 0.04089423, 1, 0.8509804, 0, 1,
-0.9780931, -0.7384193, -2.123797, 1, 0.8588235, 0, 1,
-0.9778715, -0.947549, -1.097875, 1, 0.8627451, 0, 1,
-0.9750915, -0.5034466, -0.9255282, 1, 0.8705882, 0, 1,
-0.9735669, -0.500982, -1.069631, 1, 0.8745098, 0, 1,
-0.9724631, 0.3475148, -2.800552, 1, 0.8823529, 0, 1,
-0.969822, -0.04261179, -1.971635, 1, 0.8862745, 0, 1,
-0.9697911, 0.306147, -1.582351, 1, 0.8941177, 0, 1,
-0.9664888, 0.1960859, -1.7137, 1, 0.8980392, 0, 1,
-0.966361, -1.226141, -1.946331, 1, 0.9058824, 0, 1,
-0.9653783, -1.386026, -2.520911, 1, 0.9137255, 0, 1,
-0.9612231, -0.8408144, -3.105303, 1, 0.9176471, 0, 1,
-0.9573185, 0.1198627, -2.5757, 1, 0.9254902, 0, 1,
-0.9464868, 0.1128899, -1.131382, 1, 0.9294118, 0, 1,
-0.9412897, 0.0005893701, -1.907879, 1, 0.9372549, 0, 1,
-0.9384363, -2.37602, -2.98429, 1, 0.9411765, 0, 1,
-0.9319701, 0.2730037, -1.134884, 1, 0.9490196, 0, 1,
-0.9144776, 1.140163, -0.2663315, 1, 0.9529412, 0, 1,
-0.91113, -0.6790919, -2.778836, 1, 0.9607843, 0, 1,
-0.9051869, 1.074919, -0.339044, 1, 0.9647059, 0, 1,
-0.9038093, 0.4524345, -1.934754, 1, 0.972549, 0, 1,
-0.9025651, 0.621169, -1.692519, 1, 0.9764706, 0, 1,
-0.9014398, 1.793098, 1.700011, 1, 0.9843137, 0, 1,
-0.8999746, 0.6283092, -1.345537, 1, 0.9882353, 0, 1,
-0.8924909, -0.2483506, -1.178953, 1, 0.9960784, 0, 1,
-0.8895289, 1.068312, -2.158303, 0.9960784, 1, 0, 1,
-0.88918, 0.9086195, 1.823321, 0.9921569, 1, 0, 1,
-0.8888416, -0.7733158, -1.201052, 0.9843137, 1, 0, 1,
-0.8868754, -0.4220959, -3.853211, 0.9803922, 1, 0, 1,
-0.8867062, -0.1763225, -2.428422, 0.972549, 1, 0, 1,
-0.8842452, -1.668566, -0.3103434, 0.9686275, 1, 0, 1,
-0.8821356, -0.02619301, -1.039929, 0.9607843, 1, 0, 1,
-0.8807305, -0.08502361, -0.8835068, 0.9568627, 1, 0, 1,
-0.8805772, 1.309802, -0.4056975, 0.9490196, 1, 0, 1,
-0.8775485, -0.04310501, -3.795177, 0.945098, 1, 0, 1,
-0.8759463, 0.3034751, -1.480893, 0.9372549, 1, 0, 1,
-0.8745027, 1.093318, -1.424441, 0.9333333, 1, 0, 1,
-0.8669677, -0.4433614, -0.9604778, 0.9254902, 1, 0, 1,
-0.8594466, -0.3570838, -2.33133, 0.9215686, 1, 0, 1,
-0.8577478, 0.3429853, -1.00598, 0.9137255, 1, 0, 1,
-0.8555896, -1.804862, -1.866308, 0.9098039, 1, 0, 1,
-0.8553373, 1.447847, -0.6659474, 0.9019608, 1, 0, 1,
-0.8464962, -1.40509, -1.4857, 0.8941177, 1, 0, 1,
-0.8444186, -1.788269, -1.3277, 0.8901961, 1, 0, 1,
-0.8358567, -0.1290645, -2.482718, 0.8823529, 1, 0, 1,
-0.8323704, -1.154247, -1.694888, 0.8784314, 1, 0, 1,
-0.831754, -0.08328629, -1.501001, 0.8705882, 1, 0, 1,
-0.8287399, -0.5309355, -0.5803713, 0.8666667, 1, 0, 1,
-0.8284538, -0.9431832, -2.98847, 0.8588235, 1, 0, 1,
-0.8237506, 0.5571632, -1.246499, 0.854902, 1, 0, 1,
-0.8160554, -1.070764, -1.973455, 0.8470588, 1, 0, 1,
-0.814604, -0.1323245, -1.542188, 0.8431373, 1, 0, 1,
-0.8095406, -0.626777, -2.463304, 0.8352941, 1, 0, 1,
-0.8066019, 1.601449, -1.355372, 0.8313726, 1, 0, 1,
-0.8047954, 0.4913784, -0.9586082, 0.8235294, 1, 0, 1,
-0.800724, -0.3315339, -2.413724, 0.8196079, 1, 0, 1,
-0.7995165, 1.067891, 0.3513242, 0.8117647, 1, 0, 1,
-0.7960491, -0.30992, -2.553512, 0.8078431, 1, 0, 1,
-0.7950289, 1.2274, -0.2556818, 0.8, 1, 0, 1,
-0.7854128, 0.1603437, -0.4959137, 0.7921569, 1, 0, 1,
-0.7842593, -0.8588827, -3.888788, 0.7882353, 1, 0, 1,
-0.7841486, 0.5286165, -0.8290072, 0.7803922, 1, 0, 1,
-0.7733611, 0.4237606, -0.7176429, 0.7764706, 1, 0, 1,
-0.7731946, -0.5340608, -2.793224, 0.7686275, 1, 0, 1,
-0.771329, 2.049902, -1.301605, 0.7647059, 1, 0, 1,
-0.7711069, -0.6698241, -2.916811, 0.7568628, 1, 0, 1,
-0.7703035, 1.474805, 0.5538282, 0.7529412, 1, 0, 1,
-0.7672319, -1.031075, -2.461687, 0.7450981, 1, 0, 1,
-0.760774, 0.4071268, -0.7418386, 0.7411765, 1, 0, 1,
-0.759612, 0.3730075, -0.7979813, 0.7333333, 1, 0, 1,
-0.7548643, 1.525306, -2.725344, 0.7294118, 1, 0, 1,
-0.754616, -0.7221656, -2.295926, 0.7215686, 1, 0, 1,
-0.7453786, -0.6750311, -1.239067, 0.7176471, 1, 0, 1,
-0.7446474, 0.9041015, 1.076592, 0.7098039, 1, 0, 1,
-0.7419674, -1.279841, -1.083147, 0.7058824, 1, 0, 1,
-0.741564, 0.3021467, -1.09968, 0.6980392, 1, 0, 1,
-0.7370739, -0.5085667, -4.164534, 0.6901961, 1, 0, 1,
-0.7295941, -0.9575979, -2.102322, 0.6862745, 1, 0, 1,
-0.7262788, -1.433658, -3.345313, 0.6784314, 1, 0, 1,
-0.7254478, -0.8693033, -2.996391, 0.6745098, 1, 0, 1,
-0.721037, 0.1456168, 1.860163, 0.6666667, 1, 0, 1,
-0.7175078, 0.3299856, -1.072685, 0.6627451, 1, 0, 1,
-0.7140144, -0.3146393, -2.640798, 0.654902, 1, 0, 1,
-0.7124408, -1.292601, -3.173767, 0.6509804, 1, 0, 1,
-0.710915, -0.8414232, -2.390941, 0.6431373, 1, 0, 1,
-0.7067562, -0.4356029, -3.678547, 0.6392157, 1, 0, 1,
-0.7036961, 0.0322028, -2.686117, 0.6313726, 1, 0, 1,
-0.6993347, -0.3719272, -1.540539, 0.627451, 1, 0, 1,
-0.6986946, 2.285367, -0.2467562, 0.6196079, 1, 0, 1,
-0.6986462, -1.056061, -2.918554, 0.6156863, 1, 0, 1,
-0.6982071, -0.7014861, -1.269219, 0.6078432, 1, 0, 1,
-0.6974357, 0.2453812, -2.009002, 0.6039216, 1, 0, 1,
-0.6959706, 0.7994795, 0.6109967, 0.5960785, 1, 0, 1,
-0.6950378, 0.1226101, 0.7001308, 0.5882353, 1, 0, 1,
-0.69386, -0.7520955, -1.711829, 0.5843138, 1, 0, 1,
-0.6937906, -1.255459, -1.94096, 0.5764706, 1, 0, 1,
-0.6935647, 0.2559474, -2.119085, 0.572549, 1, 0, 1,
-0.6934586, 1.157446, -0.1409954, 0.5647059, 1, 0, 1,
-0.6891078, -1.308458, -3.515353, 0.5607843, 1, 0, 1,
-0.6880984, -0.06557257, -3.042463, 0.5529412, 1, 0, 1,
-0.68743, -1.438054, -2.821979, 0.5490196, 1, 0, 1,
-0.6808649, 0.8522257, 0.120681, 0.5411765, 1, 0, 1,
-0.6775039, 1.068787, -0.3477285, 0.5372549, 1, 0, 1,
-0.6766869, 1.29007, 0.2043344, 0.5294118, 1, 0, 1,
-0.6755601, 0.1776626, -1.213676, 0.5254902, 1, 0, 1,
-0.6754066, 1.196502, -0.3793152, 0.5176471, 1, 0, 1,
-0.6618805, 0.01562588, -0.640618, 0.5137255, 1, 0, 1,
-0.6579954, 0.1091352, 0.1417658, 0.5058824, 1, 0, 1,
-0.6573268, -1.226216, -2.151033, 0.5019608, 1, 0, 1,
-0.6541412, -1.56504, -3.446334, 0.4941176, 1, 0, 1,
-0.6523305, -0.3022705, -1.930842, 0.4862745, 1, 0, 1,
-0.6521078, 1.306422, 0.6456147, 0.4823529, 1, 0, 1,
-0.6459188, 1.236194, -0.2638099, 0.4745098, 1, 0, 1,
-0.6436321, 0.223797, -0.5147927, 0.4705882, 1, 0, 1,
-0.6435004, -0.2752928, -1.643618, 0.4627451, 1, 0, 1,
-0.6389394, 0.1525708, -0.9632095, 0.4588235, 1, 0, 1,
-0.634331, -0.0899618, -0.502037, 0.4509804, 1, 0, 1,
-0.628889, 1.197628, -1.487355, 0.4470588, 1, 0, 1,
-0.62039, 0.4112613, -0.6883789, 0.4392157, 1, 0, 1,
-0.6178135, 1.20656, 0.06022931, 0.4352941, 1, 0, 1,
-0.6134272, -1.659906, -2.442858, 0.427451, 1, 0, 1,
-0.6133255, -0.9240182, -3.206452, 0.4235294, 1, 0, 1,
-0.6104967, 0.09459264, -0.807171, 0.4156863, 1, 0, 1,
-0.6101801, -0.4293922, -2.740309, 0.4117647, 1, 0, 1,
-0.609523, -0.2828133, -0.6893383, 0.4039216, 1, 0, 1,
-0.6042114, -0.1609182, -0.7369944, 0.3960784, 1, 0, 1,
-0.6030338, -1.546901, -3.372126, 0.3921569, 1, 0, 1,
-0.5994094, 1.906349, -0.1542526, 0.3843137, 1, 0, 1,
-0.5970863, -1.044857, -3.197033, 0.3803922, 1, 0, 1,
-0.5924957, -0.7740821, -3.218, 0.372549, 1, 0, 1,
-0.5916846, -1.443323, -2.453692, 0.3686275, 1, 0, 1,
-0.5912575, 0.5183571, -0.7461969, 0.3607843, 1, 0, 1,
-0.5911905, 2.217019, -0.5755943, 0.3568628, 1, 0, 1,
-0.5880983, 0.3068925, -1.815962, 0.3490196, 1, 0, 1,
-0.5865282, 0.5750313, -1.837561, 0.345098, 1, 0, 1,
-0.5818859, 0.404072, -1.117557, 0.3372549, 1, 0, 1,
-0.5797339, -0.08081584, -0.9569001, 0.3333333, 1, 0, 1,
-0.5759146, -0.3200522, -1.504875, 0.3254902, 1, 0, 1,
-0.5739038, 0.5585046, -0.8299417, 0.3215686, 1, 0, 1,
-0.5725877, 0.6278814, -2.077362, 0.3137255, 1, 0, 1,
-0.5693402, -0.5053327, -2.30104, 0.3098039, 1, 0, 1,
-0.5669904, -0.02683394, -0.4015022, 0.3019608, 1, 0, 1,
-0.5667549, -0.467125, -1.732122, 0.2941177, 1, 0, 1,
-0.5663475, -1.605626, -2.455103, 0.2901961, 1, 0, 1,
-0.5641561, 1.039287, 0.2910172, 0.282353, 1, 0, 1,
-0.5572803, 0.5909956, -0.1992498, 0.2784314, 1, 0, 1,
-0.5528682, 0.3945579, 0.3810008, 0.2705882, 1, 0, 1,
-0.5523202, 0.8222699, 0.01474579, 0.2666667, 1, 0, 1,
-0.5478323, -0.3782247, -0.9356487, 0.2588235, 1, 0, 1,
-0.5449545, -1.284947, -1.971559, 0.254902, 1, 0, 1,
-0.5440232, -0.1114877, -1.559607, 0.2470588, 1, 0, 1,
-0.5390114, -1.447564, -1.594713, 0.2431373, 1, 0, 1,
-0.5382826, 0.8394972, 0.7258967, 0.2352941, 1, 0, 1,
-0.5372893, -1.243816, -4.217047, 0.2313726, 1, 0, 1,
-0.531272, -0.9583415, -2.208066, 0.2235294, 1, 0, 1,
-0.529757, -1.047435, -2.188184, 0.2196078, 1, 0, 1,
-0.5282785, -2.759001, -3.544098, 0.2117647, 1, 0, 1,
-0.5224342, -1.403425, -0.8145382, 0.2078431, 1, 0, 1,
-0.5167302, -0.3133933, -1.720295, 0.2, 1, 0, 1,
-0.51618, -0.146535, -1.082719, 0.1921569, 1, 0, 1,
-0.5128231, 2.243496, 1.132852, 0.1882353, 1, 0, 1,
-0.506169, -0.8970174, -0.9008595, 0.1803922, 1, 0, 1,
-0.5050035, -2.89212, -3.580017, 0.1764706, 1, 0, 1,
-0.4953668, 1.157135, -0.08409249, 0.1686275, 1, 0, 1,
-0.4950731, -0.07115311, -2.192129, 0.1647059, 1, 0, 1,
-0.493087, -0.8100768, -1.598033, 0.1568628, 1, 0, 1,
-0.4862027, -1.065605, -1.869696, 0.1529412, 1, 0, 1,
-0.4804392, 0.3394321, -1.466903, 0.145098, 1, 0, 1,
-0.4774067, 2.577226, 0.5501757, 0.1411765, 1, 0, 1,
-0.4697804, -0.8598015, -2.952341, 0.1333333, 1, 0, 1,
-0.462053, 1.158903, -0.6706862, 0.1294118, 1, 0, 1,
-0.4601975, 1.488746, -0.1300767, 0.1215686, 1, 0, 1,
-0.4582165, -0.7158877, -3.586311, 0.1176471, 1, 0, 1,
-0.4514681, 1.444828, -0.9139327, 0.1098039, 1, 0, 1,
-0.4510141, -0.06502042, -1.056654, 0.1058824, 1, 0, 1,
-0.4488258, 0.4671469, 0.06005363, 0.09803922, 1, 0, 1,
-0.4327399, 1.913857, -1.410537, 0.09019608, 1, 0, 1,
-0.4296718, 2.816631, -0.6105701, 0.08627451, 1, 0, 1,
-0.4283598, -0.7903684, -3.724823, 0.07843138, 1, 0, 1,
-0.4255493, -1.477948, -1.983995, 0.07450981, 1, 0, 1,
-0.4250756, 0.242338, -0.1235862, 0.06666667, 1, 0, 1,
-0.4235432, -1.279899, -2.4844, 0.0627451, 1, 0, 1,
-0.4228878, -2.587408, -2.337042, 0.05490196, 1, 0, 1,
-0.4227525, -1.030906, -1.589024, 0.05098039, 1, 0, 1,
-0.4226987, 0.0606649, -1.501266, 0.04313726, 1, 0, 1,
-0.4219165, 0.2712887, -3.147788, 0.03921569, 1, 0, 1,
-0.421787, 0.7730012, -0.2625781, 0.03137255, 1, 0, 1,
-0.4198884, -2.313389, -2.539985, 0.02745098, 1, 0, 1,
-0.4141, -1.192571, -3.919306, 0.01960784, 1, 0, 1,
-0.4129822, 0.3862449, -0.892848, 0.01568628, 1, 0, 1,
-0.4108123, -0.8450921, -3.220093, 0.007843138, 1, 0, 1,
-0.4099897, -0.110435, -1.513669, 0.003921569, 1, 0, 1,
-0.4056635, 0.8028225, -1.620942, 0, 1, 0.003921569, 1,
-0.4044006, -1.919872, -3.285724, 0, 1, 0.01176471, 1,
-0.4036182, -0.4583805, -3.712605, 0, 1, 0.01568628, 1,
-0.3956962, -0.5343384, -3.125774, 0, 1, 0.02352941, 1,
-0.3939845, 0.1873713, -0.02416072, 0, 1, 0.02745098, 1,
-0.3931091, -2.00137, -4.17127, 0, 1, 0.03529412, 1,
-0.3871163, 1.571565, 0.2679172, 0, 1, 0.03921569, 1,
-0.387069, -0.06763516, -1.749859, 0, 1, 0.04705882, 1,
-0.385546, -0.3066345, -3.020247, 0, 1, 0.05098039, 1,
-0.3799214, -0.7961115, -2.773087, 0, 1, 0.05882353, 1,
-0.376957, -1.188279, -3.954649, 0, 1, 0.0627451, 1,
-0.3734232, -0.5184663, -0.8622883, 0, 1, 0.07058824, 1,
-0.3707748, -0.3291914, -2.093157, 0, 1, 0.07450981, 1,
-0.3652441, -0.5547067, -1.71165, 0, 1, 0.08235294, 1,
-0.3603985, -1.538929, -3.504416, 0, 1, 0.08627451, 1,
-0.3560283, -0.5144552, -1.475788, 0, 1, 0.09411765, 1,
-0.3530007, 0.1630855, -0.5924954, 0, 1, 0.1019608, 1,
-0.3507819, -1.064946, -2.875772, 0, 1, 0.1058824, 1,
-0.3413029, 0.5288251, 0.07817671, 0, 1, 0.1137255, 1,
-0.3405168, 0.2068329, -0.6196275, 0, 1, 0.1176471, 1,
-0.3396503, 0.4370019, -0.680053, 0, 1, 0.1254902, 1,
-0.339447, -1.787871, -3.324633, 0, 1, 0.1294118, 1,
-0.33796, 0.9047361, 0.6452205, 0, 1, 0.1372549, 1,
-0.3351749, 0.8359661, 0.4058987, 0, 1, 0.1411765, 1,
-0.3336097, -2.684799, -2.291842, 0, 1, 0.1490196, 1,
-0.3270062, 0.4630087, -0.4785071, 0, 1, 0.1529412, 1,
-0.3173549, -0.1787864, -2.801762, 0, 1, 0.1607843, 1,
-0.3131986, -0.09114259, -3.801216, 0, 1, 0.1647059, 1,
-0.3115176, 1.08015, -1.664291, 0, 1, 0.172549, 1,
-0.3083199, 0.2534344, -1.498048, 0, 1, 0.1764706, 1,
-0.305677, 1.122682, -2.03357, 0, 1, 0.1843137, 1,
-0.3016911, 0.1670257, -0.8418441, 0, 1, 0.1882353, 1,
-0.3012184, 0.1724719, -1.202233, 0, 1, 0.1960784, 1,
-0.2967466, -0.1786728, -1.205725, 0, 1, 0.2039216, 1,
-0.2933492, -0.9635202, -3.388327, 0, 1, 0.2078431, 1,
-0.2929353, -1.049778, -1.112171, 0, 1, 0.2156863, 1,
-0.290438, 0.7944103, -1.950477, 0, 1, 0.2196078, 1,
-0.2874027, -0.647333, 0.6017559, 0, 1, 0.227451, 1,
-0.2865352, -0.6250687, -1.413578, 0, 1, 0.2313726, 1,
-0.2789489, -1.480214, -2.2507, 0, 1, 0.2392157, 1,
-0.277612, -1.217828, -1.947817, 0, 1, 0.2431373, 1,
-0.2775144, -0.3799715, -2.775746, 0, 1, 0.2509804, 1,
-0.2752463, -0.03355647, -3.422778, 0, 1, 0.254902, 1,
-0.2751073, -0.5447318, -2.626973, 0, 1, 0.2627451, 1,
-0.2749383, -0.7218107, -2.287828, 0, 1, 0.2666667, 1,
-0.2722852, 0.7898576, 0.5381679, 0, 1, 0.2745098, 1,
-0.2715582, 1.03368, -2.12697, 0, 1, 0.2784314, 1,
-0.2691746, 1.185083, 1.466784, 0, 1, 0.2862745, 1,
-0.2686374, -0.3480895, -3.368923, 0, 1, 0.2901961, 1,
-0.2677232, 0.08483601, -3.162561, 0, 1, 0.2980392, 1,
-0.2653408, 0.860264, -0.6155745, 0, 1, 0.3058824, 1,
-0.2616868, -2.188266, -3.363462, 0, 1, 0.3098039, 1,
-0.2587444, 0.3661692, -0.05061847, 0, 1, 0.3176471, 1,
-0.2575387, 1.636716, 1.141803, 0, 1, 0.3215686, 1,
-0.2509486, -1.616637, -2.305784, 0, 1, 0.3294118, 1,
-0.2492387, 0.3009129, -2.225459, 0, 1, 0.3333333, 1,
-0.2479273, -0.0904897, -2.690727, 0, 1, 0.3411765, 1,
-0.2457119, 0.379646, 0.502568, 0, 1, 0.345098, 1,
-0.2444579, -1.005971, -2.922038, 0, 1, 0.3529412, 1,
-0.2339966, 0.2628221, 0.04899824, 0, 1, 0.3568628, 1,
-0.2331992, -0.01801285, -2.273201, 0, 1, 0.3647059, 1,
-0.230659, 0.9884777, 0.4865627, 0, 1, 0.3686275, 1,
-0.229851, 0.8812509, -0.3109878, 0, 1, 0.3764706, 1,
-0.2277075, -0.3181084, -2.142354, 0, 1, 0.3803922, 1,
-0.2265405, -0.2976634, -2.785009, 0, 1, 0.3882353, 1,
-0.225787, -0.2285372, -3.064679, 0, 1, 0.3921569, 1,
-0.225623, 0.7834756, 0.7872787, 0, 1, 0.4, 1,
-0.2254332, -0.3744756, -3.30943, 0, 1, 0.4078431, 1,
-0.221495, 0.6029192, -0.508967, 0, 1, 0.4117647, 1,
-0.2147196, 0.8159821, -1.23157, 0, 1, 0.4196078, 1,
-0.2145035, 0.6164873, -0.3191572, 0, 1, 0.4235294, 1,
-0.213413, 0.5691294, -1.176144, 0, 1, 0.4313726, 1,
-0.2111688, 0.4405094, -1.174475, 0, 1, 0.4352941, 1,
-0.2111593, 0.6561735, -1.16418, 0, 1, 0.4431373, 1,
-0.2092451, -1.229663, -3.733414, 0, 1, 0.4470588, 1,
-0.1983106, 0.03886428, -1.579386, 0, 1, 0.454902, 1,
-0.1912034, -0.05929767, -2.839046, 0, 1, 0.4588235, 1,
-0.1876963, -0.6709391, -2.272948, 0, 1, 0.4666667, 1,
-0.182515, -0.9212319, -3.294675, 0, 1, 0.4705882, 1,
-0.1789479, -0.2935954, -2.100083, 0, 1, 0.4784314, 1,
-0.1787002, -0.05960254, -0.9184519, 0, 1, 0.4823529, 1,
-0.1783959, -0.4529317, -0.3529521, 0, 1, 0.4901961, 1,
-0.176828, -0.8687736, -3.3511, 0, 1, 0.4941176, 1,
-0.1695328, 0.3193147, -1.009323, 0, 1, 0.5019608, 1,
-0.1684621, -0.04046044, -1.180216, 0, 1, 0.509804, 1,
-0.1651808, 1.188824, 0.4087106, 0, 1, 0.5137255, 1,
-0.1611381, 0.9834737, -2.186602, 0, 1, 0.5215687, 1,
-0.1537924, 0.8256652, -0.08996157, 0, 1, 0.5254902, 1,
-0.1520391, 1.196661, 0.8947691, 0, 1, 0.5333334, 1,
-0.1450996, -1.30146, -2.164733, 0, 1, 0.5372549, 1,
-0.144736, -0.7457373, -2.039331, 0, 1, 0.5450981, 1,
-0.1434833, 0.2704509, -0.9225419, 0, 1, 0.5490196, 1,
-0.1312255, -0.9049003, -1.661246, 0, 1, 0.5568628, 1,
-0.1308601, 0.4535534, 0.7939331, 0, 1, 0.5607843, 1,
-0.129108, 0.5222747, 0.2167041, 0, 1, 0.5686275, 1,
-0.1279359, -0.2119698, -1.901262, 0, 1, 0.572549, 1,
-0.1267677, 0.06212151, -1.130006, 0, 1, 0.5803922, 1,
-0.1244565, 0.03294394, -1.312235, 0, 1, 0.5843138, 1,
-0.1218363, -0.03262212, -0.5885748, 0, 1, 0.5921569, 1,
-0.1137624, -1.743473, -4.454974, 0, 1, 0.5960785, 1,
-0.1134539, 0.230221, -0.2288405, 0, 1, 0.6039216, 1,
-0.1132541, 0.664925, 1.134156, 0, 1, 0.6117647, 1,
-0.1120201, 0.2010564, -2.677701, 0, 1, 0.6156863, 1,
-0.09661981, -2.158139, -3.591688, 0, 1, 0.6235294, 1,
-0.09641463, 0.4242523, -1.592561, 0, 1, 0.627451, 1,
-0.09503549, 0.2044617, -0.6061241, 0, 1, 0.6352941, 1,
-0.0875752, -2.426362, -1.563465, 0, 1, 0.6392157, 1,
-0.0828196, 0.2870025, 0.6872335, 0, 1, 0.6470588, 1,
-0.08255123, 3.053114, -0.1569273, 0, 1, 0.6509804, 1,
-0.07952883, -0.4876129, -2.192698, 0, 1, 0.6588235, 1,
-0.07768489, -0.2190312, -2.68129, 0, 1, 0.6627451, 1,
-0.0739987, 2.126668, 0.09954293, 0, 1, 0.6705883, 1,
-0.07375986, 0.1286601, -2.156963, 0, 1, 0.6745098, 1,
-0.07285513, -0.564594, -3.641141, 0, 1, 0.682353, 1,
-0.07217178, 0.6514828, 0.6306472, 0, 1, 0.6862745, 1,
-0.07133035, 1.027358, 0.6022291, 0, 1, 0.6941177, 1,
-0.06994254, -0.7263722, -2.482443, 0, 1, 0.7019608, 1,
-0.06916659, -1.381458, -2.724973, 0, 1, 0.7058824, 1,
-0.06870697, -1.417644, -2.343739, 0, 1, 0.7137255, 1,
-0.06743459, 2.118421, -0.4729535, 0, 1, 0.7176471, 1,
-0.06259229, -0.546899, -3.855106, 0, 1, 0.7254902, 1,
-0.05770258, -0.04746614, -2.39353, 0, 1, 0.7294118, 1,
-0.05542646, 1.043755, 1.130163, 0, 1, 0.7372549, 1,
-0.05464873, -0.7526301, -3.133982, 0, 1, 0.7411765, 1,
-0.04934256, 0.09325445, -0.440206, 0, 1, 0.7490196, 1,
-0.04843926, -1.575097, -1.199569, 0, 1, 0.7529412, 1,
-0.0454918, 0.9232776, -0.1908869, 0, 1, 0.7607843, 1,
-0.04375732, -0.2158348, -2.951987, 0, 1, 0.7647059, 1,
-0.04362094, -1.338102, -3.358297, 0, 1, 0.772549, 1,
-0.04004198, -0.4159432, -3.718915, 0, 1, 0.7764706, 1,
-0.03836718, -0.8180928, -3.379786, 0, 1, 0.7843137, 1,
-0.03555939, -0.5820659, -1.45712, 0, 1, 0.7882353, 1,
-0.03253703, 1.570538, -0.6386222, 0, 1, 0.7960784, 1,
-0.03132025, -0.1378357, -2.921993, 0, 1, 0.8039216, 1,
-0.02536685, -0.2939033, -2.961182, 0, 1, 0.8078431, 1,
-0.02505767, -1.522996, -2.698073, 0, 1, 0.8156863, 1,
-0.02413463, 0.6778389, -0.4577223, 0, 1, 0.8196079, 1,
-0.02332506, 0.7270575, 0.0294079, 0, 1, 0.827451, 1,
-0.02312602, 0.6692159, -1.000227, 0, 1, 0.8313726, 1,
-0.02230692, -0.7465245, -3.367048, 0, 1, 0.8392157, 1,
-0.01998226, 1.982208, 0.3255387, 0, 1, 0.8431373, 1,
-0.01963991, -1.42185, -2.205796, 0, 1, 0.8509804, 1,
-0.01881468, -0.3738521, -1.640971, 0, 1, 0.854902, 1,
-0.01449022, 0.03845821, -1.991202, 0, 1, 0.8627451, 1,
-0.01274944, 0.9200852, -0.4706183, 0, 1, 0.8666667, 1,
-0.009995627, 0.8594507, -0.7988421, 0, 1, 0.8745098, 1,
-0.007820788, 1.07891, 0.7081474, 0, 1, 0.8784314, 1,
-0.007480472, 1.394779, -1.318596, 0, 1, 0.8862745, 1,
-0.004844381, -1.137178, -2.056375, 0, 1, 0.8901961, 1,
-0.004094477, 0.4320398, -0.3823366, 0, 1, 0.8980392, 1,
-0.002586475, 0.464488, -1.024382, 0, 1, 0.9058824, 1,
-0.001650636, -1.127043, -2.404805, 0, 1, 0.9098039, 1,
0.005812355, 1.192432, 1.292109, 0, 1, 0.9176471, 1,
0.0155762, 0.7470559, 1.172551, 0, 1, 0.9215686, 1,
0.02227858, -1.719313, 2.42693, 0, 1, 0.9294118, 1,
0.02491569, 0.1153089, 1.957517, 0, 1, 0.9333333, 1,
0.02607233, -0.2838485, 1.387354, 0, 1, 0.9411765, 1,
0.02826444, 0.786081, -0.1143471, 0, 1, 0.945098, 1,
0.02866229, 0.8061453, -1.073491, 0, 1, 0.9529412, 1,
0.02943702, 1.00776, -0.6065629, 0, 1, 0.9568627, 1,
0.03050039, -0.4883187, 4.13498, 0, 1, 0.9647059, 1,
0.0325231, 0.3160845, 0.8124444, 0, 1, 0.9686275, 1,
0.03774647, 1.850767, -0.1480281, 0, 1, 0.9764706, 1,
0.03908986, -0.3690013, 1.946382, 0, 1, 0.9803922, 1,
0.04099234, -0.6994104, 3.922483, 0, 1, 0.9882353, 1,
0.04160792, -2.825466, 2.374744, 0, 1, 0.9921569, 1,
0.04170119, -1.147569, 1.914344, 0, 1, 1, 1,
0.04518234, -0.5480508, 2.335977, 0, 0.9921569, 1, 1,
0.04709777, -0.1320269, 1.715053, 0, 0.9882353, 1, 1,
0.04710233, -0.2808673, 3.032317, 0, 0.9803922, 1, 1,
0.05042798, -0.3712465, 1.567105, 0, 0.9764706, 1, 1,
0.0516309, 0.2318072, 2.374585, 0, 0.9686275, 1, 1,
0.0543933, -0.8589838, 3.193396, 0, 0.9647059, 1, 1,
0.06252471, -0.1385031, 1.327655, 0, 0.9568627, 1, 1,
0.06584253, 0.4256003, 0.3124452, 0, 0.9529412, 1, 1,
0.06719307, -0.7117372, 4.156488, 0, 0.945098, 1, 1,
0.06897198, -1.657938, 3.296291, 0, 0.9411765, 1, 1,
0.07091008, -0.701606, 4.313425, 0, 0.9333333, 1, 1,
0.07461887, -0.2002124, 2.138962, 0, 0.9294118, 1, 1,
0.07581984, -1.755543, 3.784506, 0, 0.9215686, 1, 1,
0.07607818, -1.304783, 2.986195, 0, 0.9176471, 1, 1,
0.0770646, -0.1167055, 4.466341, 0, 0.9098039, 1, 1,
0.0796323, 1.03691, -0.3638279, 0, 0.9058824, 1, 1,
0.08420327, -0.9938788, 3.266648, 0, 0.8980392, 1, 1,
0.08483799, 0.623616, -0.4686094, 0, 0.8901961, 1, 1,
0.09071881, 0.9830183, -0.01766868, 0, 0.8862745, 1, 1,
0.09782855, 0.5831684, 0.1171901, 0, 0.8784314, 1, 1,
0.09970593, 0.5922498, -1.782739, 0, 0.8745098, 1, 1,
0.1018965, -0.2314909, 1.325781, 0, 0.8666667, 1, 1,
0.1025173, 0.9647239, -1.0431, 0, 0.8627451, 1, 1,
0.1026682, 0.2477246, 0.6077259, 0, 0.854902, 1, 1,
0.1049335, 1.693279, -0.4596211, 0, 0.8509804, 1, 1,
0.1057473, 0.6029232, -0.1093198, 0, 0.8431373, 1, 1,
0.1061502, -0.351804, 1.991311, 0, 0.8392157, 1, 1,
0.1062105, -0.5786504, 1.324131, 0, 0.8313726, 1, 1,
0.1107454, 0.2539052, 1.563292, 0, 0.827451, 1, 1,
0.1221756, 1.306321, -0.3284105, 0, 0.8196079, 1, 1,
0.1261171, -0.3820283, 2.571198, 0, 0.8156863, 1, 1,
0.1276408, 0.1825912, 1.119307, 0, 0.8078431, 1, 1,
0.1324305, 0.6653128, -0.6166001, 0, 0.8039216, 1, 1,
0.1355608, 0.4291566, -0.7779586, 0, 0.7960784, 1, 1,
0.1428395, -1.169227, 3.066491, 0, 0.7882353, 1, 1,
0.1441581, 0.5964884, 1.040942, 0, 0.7843137, 1, 1,
0.1448957, -1.356588, 2.220081, 0, 0.7764706, 1, 1,
0.1466278, 0.7819766, -0.4876204, 0, 0.772549, 1, 1,
0.1473684, -1.293246, 4.062842, 0, 0.7647059, 1, 1,
0.151279, 0.1581936, 1.682228, 0, 0.7607843, 1, 1,
0.1513513, -1.091051, 3.041559, 0, 0.7529412, 1, 1,
0.1516662, -0.2188043, 2.477087, 0, 0.7490196, 1, 1,
0.152485, -1.721331, 2.020947, 0, 0.7411765, 1, 1,
0.1541571, -0.1147926, 2.460197, 0, 0.7372549, 1, 1,
0.158103, 1.961847, 1.833088, 0, 0.7294118, 1, 1,
0.1665138, -0.08013039, 1.697401, 0, 0.7254902, 1, 1,
0.1729025, -0.0004239043, 1.364088, 0, 0.7176471, 1, 1,
0.1775723, -0.6792266, 4.183223, 0, 0.7137255, 1, 1,
0.1792616, -0.8689476, 1.361995, 0, 0.7058824, 1, 1,
0.1815234, -1.671377, 2.616299, 0, 0.6980392, 1, 1,
0.1862757, -0.6013408, 3.613263, 0, 0.6941177, 1, 1,
0.1945346, -0.4874896, 2.572707, 0, 0.6862745, 1, 1,
0.1950827, 0.2541977, 0.5401483, 0, 0.682353, 1, 1,
0.1995959, 0.4842711, 1.429703, 0, 0.6745098, 1, 1,
0.200249, -0.825272, 3.547496, 0, 0.6705883, 1, 1,
0.203654, 0.4445528, -1.106259, 0, 0.6627451, 1, 1,
0.2038024, 1.14698, -2.456813, 0, 0.6588235, 1, 1,
0.2049969, -0.2475965, 2.093974, 0, 0.6509804, 1, 1,
0.2070431, -0.4304702, 3.134093, 0, 0.6470588, 1, 1,
0.2077234, 1.292328, 0.3970552, 0, 0.6392157, 1, 1,
0.2104062, 2.968584, 0.5906894, 0, 0.6352941, 1, 1,
0.2150828, 1.542883, 0.6010329, 0, 0.627451, 1, 1,
0.2198453, 1.260664, 0.4855253, 0, 0.6235294, 1, 1,
0.222412, 0.6050773, -0.2453034, 0, 0.6156863, 1, 1,
0.2240369, 1.451946, -1.34926, 0, 0.6117647, 1, 1,
0.2260664, -0.4038815, 1.681418, 0, 0.6039216, 1, 1,
0.2271883, -0.5301552, 3.290465, 0, 0.5960785, 1, 1,
0.2289669, -1.855631, 2.768635, 0, 0.5921569, 1, 1,
0.2308945, -1.28637, 3.051417, 0, 0.5843138, 1, 1,
0.2356514, 1.063761, -0.4379799, 0, 0.5803922, 1, 1,
0.237326, -1.639298, 3.332288, 0, 0.572549, 1, 1,
0.2380204, -1.300094, 3.622871, 0, 0.5686275, 1, 1,
0.2437898, -0.4676317, 3.953741, 0, 0.5607843, 1, 1,
0.2496113, -0.9073316, 2.150774, 0, 0.5568628, 1, 1,
0.2514948, -0.4844421, 4.185148, 0, 0.5490196, 1, 1,
0.2517369, 1.095595, -0.637357, 0, 0.5450981, 1, 1,
0.2559339, -0.7828366, 3.653936, 0, 0.5372549, 1, 1,
0.2592188, -0.2958687, 2.582312, 0, 0.5333334, 1, 1,
0.260764, -1.469839, 1.48615, 0, 0.5254902, 1, 1,
0.2627702, 0.123449, 1.234626, 0, 0.5215687, 1, 1,
0.2642431, -1.352247, 2.936716, 0, 0.5137255, 1, 1,
0.265674, -1.333853, 3.127087, 0, 0.509804, 1, 1,
0.2668844, 0.09292935, 3.185764, 0, 0.5019608, 1, 1,
0.2695546, 1.366105, 1.727096, 0, 0.4941176, 1, 1,
0.2718472, -0.4301393, 2.226676, 0, 0.4901961, 1, 1,
0.2720845, 0.1724869, -0.6633711, 0, 0.4823529, 1, 1,
0.2759112, -0.4001776, 2.339429, 0, 0.4784314, 1, 1,
0.2801205, 0.2772745, 0.2389988, 0, 0.4705882, 1, 1,
0.2821051, -0.751536, 2.225741, 0, 0.4666667, 1, 1,
0.2827339, 0.3711142, -0.6062922, 0, 0.4588235, 1, 1,
0.2842762, -1.309246, 1.651604, 0, 0.454902, 1, 1,
0.2895578, -0.5222131, 1.71026, 0, 0.4470588, 1, 1,
0.2903668, -0.3622081, 3.647121, 0, 0.4431373, 1, 1,
0.2949784, -0.7412623, 3.405191, 0, 0.4352941, 1, 1,
0.2964028, -1.510735, 2.264882, 0, 0.4313726, 1, 1,
0.2971138, 0.4792387, -0.4324876, 0, 0.4235294, 1, 1,
0.3018864, 1.169293, -0.3243663, 0, 0.4196078, 1, 1,
0.3063361, 0.6036682, 0.5442176, 0, 0.4117647, 1, 1,
0.3075121, 2.6032, 0.8904066, 0, 0.4078431, 1, 1,
0.308982, 0.322412, 0.9644215, 0, 0.4, 1, 1,
0.3106932, -0.2085089, -0.001635764, 0, 0.3921569, 1, 1,
0.3154335, -1.573974, 1.120826, 0, 0.3882353, 1, 1,
0.3184116, -1.897064, 2.598553, 0, 0.3803922, 1, 1,
0.3230402, 2.184422, -1.362015, 0, 0.3764706, 1, 1,
0.323152, -0.2307404, 1.435106, 0, 0.3686275, 1, 1,
0.3232296, -0.2447961, 1.754617, 0, 0.3647059, 1, 1,
0.3234245, 0.8899148, 1.028837, 0, 0.3568628, 1, 1,
0.3234574, -0.5067841, 2.147397, 0, 0.3529412, 1, 1,
0.3237598, -0.4737158, 2.607396, 0, 0.345098, 1, 1,
0.3238081, 0.223522, 0.8821667, 0, 0.3411765, 1, 1,
0.3254023, 0.1180419, 0.5910006, 0, 0.3333333, 1, 1,
0.3264185, 0.4740828, 0.791495, 0, 0.3294118, 1, 1,
0.3270286, 1.08381, 0.1701427, 0, 0.3215686, 1, 1,
0.327397, -0.08315636, 2.766692, 0, 0.3176471, 1, 1,
0.3276166, -1.638512, 4.538857, 0, 0.3098039, 1, 1,
0.3276624, -0.4824966, 4.768112, 0, 0.3058824, 1, 1,
0.3287019, 0.9028368, -0.215297, 0, 0.2980392, 1, 1,
0.3320374, -0.8324822, 3.522378, 0, 0.2901961, 1, 1,
0.3335688, -0.4592008, 2.0269, 0, 0.2862745, 1, 1,
0.3402845, -0.6232938, 1.225221, 0, 0.2784314, 1, 1,
0.3465126, 0.2471429, 0.5835701, 0, 0.2745098, 1, 1,
0.3492406, -1.466274, 4.107181, 0, 0.2666667, 1, 1,
0.3521754, -0.2739505, 1.138601, 0, 0.2627451, 1, 1,
0.3572972, 0.9914664, 0.3557397, 0, 0.254902, 1, 1,
0.358565, 1.080877, -1.333742, 0, 0.2509804, 1, 1,
0.3589976, 0.6312882, 0.5105666, 0, 0.2431373, 1, 1,
0.3647827, -1.512537, 3.938581, 0, 0.2392157, 1, 1,
0.3663427, -1.57449, 4.11375, 0, 0.2313726, 1, 1,
0.3665996, -1.197897, 2.859637, 0, 0.227451, 1, 1,
0.3670985, 0.7576839, 1.932363, 0, 0.2196078, 1, 1,
0.371939, 0.5553992, 0.8648339, 0, 0.2156863, 1, 1,
0.3730147, 0.563948, 1.772258, 0, 0.2078431, 1, 1,
0.3768251, 0.09858382, 1.880254, 0, 0.2039216, 1, 1,
0.3831144, 1.328198, 1.566774, 0, 0.1960784, 1, 1,
0.3902342, 1.489614, 1.26948, 0, 0.1882353, 1, 1,
0.3906558, 0.001433395, 3.315128, 0, 0.1843137, 1, 1,
0.3960052, 0.4054282, 1.250573, 0, 0.1764706, 1, 1,
0.3991255, 0.8358941, 0.774421, 0, 0.172549, 1, 1,
0.4059297, -0.6423435, 3.50626, 0, 0.1647059, 1, 1,
0.410228, -2.572183, 2.71749, 0, 0.1607843, 1, 1,
0.4109372, -0.4859631, 2.550017, 0, 0.1529412, 1, 1,
0.4138306, -0.7192848, 4.764071, 0, 0.1490196, 1, 1,
0.4157422, -0.8520355, 2.834103, 0, 0.1411765, 1, 1,
0.416348, -0.670886, 2.092065, 0, 0.1372549, 1, 1,
0.4217311, -0.3873883, 3.437711, 0, 0.1294118, 1, 1,
0.4218009, -0.04288563, 2.168383, 0, 0.1254902, 1, 1,
0.4218886, 0.4400817, 0.9221368, 0, 0.1176471, 1, 1,
0.4253015, -0.4679776, 3.456047, 0, 0.1137255, 1, 1,
0.4268956, 0.5952132, 1.548506, 0, 0.1058824, 1, 1,
0.4270713, 0.1133048, -0.07392032, 0, 0.09803922, 1, 1,
0.4299622, 0.4305654, -0.9224847, 0, 0.09411765, 1, 1,
0.4320124, 0.04631831, -0.03258107, 0, 0.08627451, 1, 1,
0.4376587, 0.5148523, 1.986734, 0, 0.08235294, 1, 1,
0.4379269, -1.32396, 2.129106, 0, 0.07450981, 1, 1,
0.4404117, -2.387889, 3.345562, 0, 0.07058824, 1, 1,
0.4432774, -0.2057766, 3.725107, 0, 0.0627451, 1, 1,
0.4495761, -0.1522442, 2.568722, 0, 0.05882353, 1, 1,
0.4507799, -2.085601, 3.175507, 0, 0.05098039, 1, 1,
0.4516327, 0.1748636, 0.1868216, 0, 0.04705882, 1, 1,
0.4516798, 1.834858, -1.190869, 0, 0.03921569, 1, 1,
0.4580108, 0.8106788, -0.6888276, 0, 0.03529412, 1, 1,
0.458691, -0.02902869, 2.676901, 0, 0.02745098, 1, 1,
0.4606968, -0.9456431, 2.063256, 0, 0.02352941, 1, 1,
0.4645626, 0.02029907, 0.651733, 0, 0.01568628, 1, 1,
0.4652066, 1.615268, -0.2164412, 0, 0.01176471, 1, 1,
0.4725768, -1.545461, 4.234748, 0, 0.003921569, 1, 1,
0.4738079, -0.8643532, 4.333869, 0.003921569, 0, 1, 1,
0.4782329, -0.08911545, 2.915456, 0.007843138, 0, 1, 1,
0.4822277, -0.9134706, 0.7780963, 0.01568628, 0, 1, 1,
0.4843864, -0.504466, 1.708998, 0.01960784, 0, 1, 1,
0.4888784, -0.722519, 3.156411, 0.02745098, 0, 1, 1,
0.4943503, -0.8081036, 3.969207, 0.03137255, 0, 1, 1,
0.495157, 0.6736084, 1.19733, 0.03921569, 0, 1, 1,
0.4968095, -0.5300921, 4.410869, 0.04313726, 0, 1, 1,
0.4980164, 1.270966, 0.857467, 0.05098039, 0, 1, 1,
0.5001376, 1.131029, -0.9764031, 0.05490196, 0, 1, 1,
0.5029247, 1.539189, 0.5176687, 0.0627451, 0, 1, 1,
0.5030854, 0.4234773, 0.7902849, 0.06666667, 0, 1, 1,
0.5046821, -0.8837329, 3.125328, 0.07450981, 0, 1, 1,
0.5062571, 0.9964874, 0.3873426, 0.07843138, 0, 1, 1,
0.5097598, 0.9017995, 1.282805, 0.08627451, 0, 1, 1,
0.5126505, -0.5880716, 2.439178, 0.09019608, 0, 1, 1,
0.5159331, -2.118438, 4.202905, 0.09803922, 0, 1, 1,
0.5214852, -0.7989213, 2.087182, 0.1058824, 0, 1, 1,
0.5234489, -0.4051852, 1.487323, 0.1098039, 0, 1, 1,
0.5243294, -1.362926, 3.353855, 0.1176471, 0, 1, 1,
0.528453, 0.03424942, 1.343211, 0.1215686, 0, 1, 1,
0.5319114, -1.617102, 1.868009, 0.1294118, 0, 1, 1,
0.5323754, -0.5696188, 2.310591, 0.1333333, 0, 1, 1,
0.5350214, 1.758704, 0.2220119, 0.1411765, 0, 1, 1,
0.5364015, -0.7085132, 2.394129, 0.145098, 0, 1, 1,
0.5395805, -0.1427674, 3.04222, 0.1529412, 0, 1, 1,
0.5410064, -0.8052977, 2.858251, 0.1568628, 0, 1, 1,
0.5449644, 0.2421863, 0.3500674, 0.1647059, 0, 1, 1,
0.5531314, 0.09727766, 2.405429, 0.1686275, 0, 1, 1,
0.560112, -1.517848, 2.036058, 0.1764706, 0, 1, 1,
0.5612525, -0.1609796, 2.184506, 0.1803922, 0, 1, 1,
0.5661103, 0.9388535, 0.196171, 0.1882353, 0, 1, 1,
0.5700884, -0.6972451, 4.04881, 0.1921569, 0, 1, 1,
0.5717619, 0.4685373, 0.2674765, 0.2, 0, 1, 1,
0.5748466, -0.2363793, 1.328163, 0.2078431, 0, 1, 1,
0.5762486, 0.03140685, 2.814511, 0.2117647, 0, 1, 1,
0.5859052, 0.7458846, 0.07152428, 0.2196078, 0, 1, 1,
0.5884192, 0.7632004, 2.237077, 0.2235294, 0, 1, 1,
0.5885425, 0.3147551, 0.2206115, 0.2313726, 0, 1, 1,
0.5897747, 0.4462846, 0.9176058, 0.2352941, 0, 1, 1,
0.590599, 1.391088, 0.7637248, 0.2431373, 0, 1, 1,
0.5959371, 1.473567, 0.8665874, 0.2470588, 0, 1, 1,
0.5959855, 0.8177071, 0.3075012, 0.254902, 0, 1, 1,
0.5979632, 1.289693, 0.09945876, 0.2588235, 0, 1, 1,
0.5997985, 0.8384185, 1.350089, 0.2666667, 0, 1, 1,
0.6018876, -0.3478977, 3.037623, 0.2705882, 0, 1, 1,
0.6064565, -0.5008989, 2.732198, 0.2784314, 0, 1, 1,
0.6064715, -1.83299, 1.414727, 0.282353, 0, 1, 1,
0.6070309, 0.1998983, 1.329981, 0.2901961, 0, 1, 1,
0.6203886, -1.394717, 2.246703, 0.2941177, 0, 1, 1,
0.6226948, 1.961061, 2.35633, 0.3019608, 0, 1, 1,
0.6234248, -1.50531, 2.240651, 0.3098039, 0, 1, 1,
0.6239517, 1.934203, -0.3103687, 0.3137255, 0, 1, 1,
0.6255243, -0.1631679, 3.333735, 0.3215686, 0, 1, 1,
0.6259632, 0.03549164, 1.931371, 0.3254902, 0, 1, 1,
0.6267726, 0.3180567, 0.630532, 0.3333333, 0, 1, 1,
0.6284479, -1.211915, 1.852182, 0.3372549, 0, 1, 1,
0.6313037, -0.6651417, 4.341221, 0.345098, 0, 1, 1,
0.6354413, -0.5243288, 2.984387, 0.3490196, 0, 1, 1,
0.6371476, 0.6451802, 2.106368, 0.3568628, 0, 1, 1,
0.6371672, -0.1402026, 1.757849, 0.3607843, 0, 1, 1,
0.637428, 0.9565444, 0.3646598, 0.3686275, 0, 1, 1,
0.6383126, 0.8334287, 2.068313, 0.372549, 0, 1, 1,
0.6425626, -0.2125614, 3.604801, 0.3803922, 0, 1, 1,
0.6425887, -0.2457991, 1.550787, 0.3843137, 0, 1, 1,
0.6464118, -0.327313, 2.092665, 0.3921569, 0, 1, 1,
0.6513419, -0.01361655, 0.5501038, 0.3960784, 0, 1, 1,
0.6518738, -0.2559621, 2.838892, 0.4039216, 0, 1, 1,
0.6520797, -3.772626, 1.980388, 0.4117647, 0, 1, 1,
0.6522276, -1.87257, 2.092757, 0.4156863, 0, 1, 1,
0.6549702, 1.222252, 0.1798867, 0.4235294, 0, 1, 1,
0.6559558, 0.7335079, 0.3419701, 0.427451, 0, 1, 1,
0.65813, 0.2346811, 1.385051, 0.4352941, 0, 1, 1,
0.6626976, -0.8702743, 2.403114, 0.4392157, 0, 1, 1,
0.6648118, -0.4709728, 2.181, 0.4470588, 0, 1, 1,
0.6735882, 0.1964441, 1.47051, 0.4509804, 0, 1, 1,
0.675724, 0.3021327, 0.8921517, 0.4588235, 0, 1, 1,
0.6772786, 1.042239, -0.5960084, 0.4627451, 0, 1, 1,
0.6849233, 0.7208527, -0.181957, 0.4705882, 0, 1, 1,
0.6866423, 0.2094947, 3.380484, 0.4745098, 0, 1, 1,
0.6868897, 0.8734958, 0.7958172, 0.4823529, 0, 1, 1,
0.690468, -1.364545, 3.933352, 0.4862745, 0, 1, 1,
0.6924704, 0.07028857, 1.288629, 0.4941176, 0, 1, 1,
0.6943598, -2.37157, 2.041387, 0.5019608, 0, 1, 1,
0.7013802, 0.4719008, -0.09085444, 0.5058824, 0, 1, 1,
0.7015364, -1.094124, 1.255738, 0.5137255, 0, 1, 1,
0.710157, 0.03358699, 0.9893166, 0.5176471, 0, 1, 1,
0.7145675, 0.4984147, 0.40822, 0.5254902, 0, 1, 1,
0.7153603, 1.676647, 0.2752857, 0.5294118, 0, 1, 1,
0.7205537, 0.69491, -0.3945461, 0.5372549, 0, 1, 1,
0.7259638, 0.9132207, -0.9624937, 0.5411765, 0, 1, 1,
0.7353504, 0.2869843, -0.03641852, 0.5490196, 0, 1, 1,
0.7401302, -0.7691407, 2.539565, 0.5529412, 0, 1, 1,
0.7414197, -0.4170499, 1.723463, 0.5607843, 0, 1, 1,
0.7475019, -0.8104588, 2.290166, 0.5647059, 0, 1, 1,
0.7496327, 0.1999564, 1.27146, 0.572549, 0, 1, 1,
0.7526118, -0.02708538, 2.07763, 0.5764706, 0, 1, 1,
0.7560386, 0.3528121, 0.5844051, 0.5843138, 0, 1, 1,
0.7567403, -0.5889228, 1.760092, 0.5882353, 0, 1, 1,
0.7592615, 1.009911, 1.695676, 0.5960785, 0, 1, 1,
0.7613243, 1.177055, -0.9117414, 0.6039216, 0, 1, 1,
0.7698187, 0.9949857, 1.334159, 0.6078432, 0, 1, 1,
0.7774578, -0.4135633, 1.886286, 0.6156863, 0, 1, 1,
0.7931173, 0.3420978, -0.07956766, 0.6196079, 0, 1, 1,
0.7946984, 0.9483332, 1.50027, 0.627451, 0, 1, 1,
0.795638, 0.2628387, 2.312219, 0.6313726, 0, 1, 1,
0.8024232, -0.9755316, 2.438672, 0.6392157, 0, 1, 1,
0.8028579, 1.752535, 1.105742, 0.6431373, 0, 1, 1,
0.8056387, 2.365063, 0.4097905, 0.6509804, 0, 1, 1,
0.8080118, 0.3995235, 0.07889125, 0.654902, 0, 1, 1,
0.8098472, -0.09301188, 1.578626, 0.6627451, 0, 1, 1,
0.8113009, 0.7401094, 1.101939, 0.6666667, 0, 1, 1,
0.8114522, 0.7548684, 2.29987, 0.6745098, 0, 1, 1,
0.8166228, -0.3313994, 1.389644, 0.6784314, 0, 1, 1,
0.8175283, -0.5311208, 3.910803, 0.6862745, 0, 1, 1,
0.8217292, -1.812546, 2.54547, 0.6901961, 0, 1, 1,
0.8221868, -0.08876873, 0.9083032, 0.6980392, 0, 1, 1,
0.8229381, -0.3839893, 2.886506, 0.7058824, 0, 1, 1,
0.8280903, 1.293253, 1.729811, 0.7098039, 0, 1, 1,
0.8296684, -0.8612592, 2.175374, 0.7176471, 0, 1, 1,
0.8310821, -0.9504219, 0.5734295, 0.7215686, 0, 1, 1,
0.8312249, 0.5821385, -0.01051768, 0.7294118, 0, 1, 1,
0.8319811, -0.8219057, 1.489699, 0.7333333, 0, 1, 1,
0.8393968, -0.88013, 1.933735, 0.7411765, 0, 1, 1,
0.8418648, 0.4047337, 1.546322, 0.7450981, 0, 1, 1,
0.8431754, -0.1669097, 1.770119, 0.7529412, 0, 1, 1,
0.8450232, 1.269892, 0.2675505, 0.7568628, 0, 1, 1,
0.8500187, -2.543399, 5.274042, 0.7647059, 0, 1, 1,
0.8523136, 1.082168, 1.357177, 0.7686275, 0, 1, 1,
0.853832, -1.413909, 2.498281, 0.7764706, 0, 1, 1,
0.8566339, -0.284113, 2.107354, 0.7803922, 0, 1, 1,
0.857529, 0.9678982, -0.5957143, 0.7882353, 0, 1, 1,
0.8607221, -1.611038, 2.368987, 0.7921569, 0, 1, 1,
0.8622149, -0.7689463, 2.213037, 0.8, 0, 1, 1,
0.866016, -0.7198108, 2.554157, 0.8078431, 0, 1, 1,
0.867466, 0.5042468, 1.102988, 0.8117647, 0, 1, 1,
0.8710111, 0.7641108, 0.7516807, 0.8196079, 0, 1, 1,
0.8730804, 0.6785737, 0.6594389, 0.8235294, 0, 1, 1,
0.878389, 0.008009433, 0.3770415, 0.8313726, 0, 1, 1,
0.8785654, -0.8328285, 2.204308, 0.8352941, 0, 1, 1,
0.8799383, 0.01878166, 2.27966, 0.8431373, 0, 1, 1,
0.8823853, -0.2718546, 0.72028, 0.8470588, 0, 1, 1,
0.8903819, -0.4798573, 0.7747636, 0.854902, 0, 1, 1,
0.8928046, 0.02818391, 1.080882, 0.8588235, 0, 1, 1,
0.8972245, -0.6105198, 3.438452, 0.8666667, 0, 1, 1,
0.8983282, -1.657982, 3.289638, 0.8705882, 0, 1, 1,
0.8989618, 0.1439233, 1.595215, 0.8784314, 0, 1, 1,
0.9052667, -0.167089, 1.155212, 0.8823529, 0, 1, 1,
0.9103593, -0.743723, 0.3029844, 0.8901961, 0, 1, 1,
0.9117562, 0.8512547, 1.105757, 0.8941177, 0, 1, 1,
0.9126949, -0.9001252, 2.726212, 0.9019608, 0, 1, 1,
0.9163188, 0.6681811, 0.3378609, 0.9098039, 0, 1, 1,
0.9171541, 1.395916, 0.1549607, 0.9137255, 0, 1, 1,
0.9222024, 0.3556907, 1.864133, 0.9215686, 0, 1, 1,
0.9340287, -0.1286244, 3.202745, 0.9254902, 0, 1, 1,
0.9353321, -1.265508, 2.426603, 0.9333333, 0, 1, 1,
0.9403194, 0.4178764, 1.347764, 0.9372549, 0, 1, 1,
0.9425405, 1.726493, 1.388418, 0.945098, 0, 1, 1,
0.9495733, 0.5024586, 1.51442, 0.9490196, 0, 1, 1,
0.9555731, 1.590673, 1.25382, 0.9568627, 0, 1, 1,
0.9561461, -1.509991, 2.653265, 0.9607843, 0, 1, 1,
0.958068, -1.28195, 2.407067, 0.9686275, 0, 1, 1,
0.9750874, 0.9137552, 2.383966, 0.972549, 0, 1, 1,
0.9767132, -0.2852236, 4.4876, 0.9803922, 0, 1, 1,
0.9772575, -1.036678, 2.535365, 0.9843137, 0, 1, 1,
0.9812678, -0.9137056, 2.614798, 0.9921569, 0, 1, 1,
0.9824283, 0.06751463, 1.399426, 0.9960784, 0, 1, 1,
0.9850874, 0.1284452, 0.5285401, 1, 0, 0.9960784, 1,
0.9880795, -1.260049, 0.8247846, 1, 0, 0.9882353, 1,
0.988409, -0.7961492, 1.004783, 1, 0, 0.9843137, 1,
0.9909228, 0.1415534, 1.775162, 1, 0, 0.9764706, 1,
0.9921623, 0.1131552, 3.098586, 1, 0, 0.972549, 1,
0.9926869, 0.4266847, -1.173347, 1, 0, 0.9647059, 1,
0.9929575, 0.02248478, 1.058673, 1, 0, 0.9607843, 1,
0.9948637, -0.1660195, 3.163193, 1, 0, 0.9529412, 1,
0.994961, -1.431922, 2.846404, 1, 0, 0.9490196, 1,
0.9972195, -0.7759932, 1.746901, 1, 0, 0.9411765, 1,
0.9980777, -1.061494, 1.951123, 1, 0, 0.9372549, 1,
1.005377, -0.7005335, 1.887186, 1, 0, 0.9294118, 1,
1.008311, -1.662189, 2.486625, 1, 0, 0.9254902, 1,
1.01143, 0.5097418, 3.056714, 1, 0, 0.9176471, 1,
1.012916, -0.3710436, 1.809822, 1, 0, 0.9137255, 1,
1.016109, -0.1126314, 1.03023, 1, 0, 0.9058824, 1,
1.021874, 0.4019107, 0.4298029, 1, 0, 0.9019608, 1,
1.026488, -1.579044, 3.374806, 1, 0, 0.8941177, 1,
1.026561, -0.4762173, 1.876504, 1, 0, 0.8862745, 1,
1.054018, 1.567295, -0.2912155, 1, 0, 0.8823529, 1,
1.05931, -0.1321387, -0.06971259, 1, 0, 0.8745098, 1,
1.060898, 0.438323, 1.60166, 1, 0, 0.8705882, 1,
1.063562, 1.232262, 2.578253, 1, 0, 0.8627451, 1,
1.063892, -1.795256, 0.8194668, 1, 0, 0.8588235, 1,
1.070116, 0.2312801, 0.4339978, 1, 0, 0.8509804, 1,
1.070279, -0.5461162, 1.704132, 1, 0, 0.8470588, 1,
1.073102, -0.5954548, 0.01472793, 1, 0, 0.8392157, 1,
1.077063, 0.03642527, -0.6034287, 1, 0, 0.8352941, 1,
1.078758, -0.6902155, 2.258172, 1, 0, 0.827451, 1,
1.095446, 0.3789014, 2.017235, 1, 0, 0.8235294, 1,
1.095465, -1.352754, 2.045336, 1, 0, 0.8156863, 1,
1.100993, -0.2082575, 3.215587, 1, 0, 0.8117647, 1,
1.107324, 1.123688, 3.236163, 1, 0, 0.8039216, 1,
1.107703, 0.3617394, 2.201966, 1, 0, 0.7960784, 1,
1.115709, -0.5908996, 2.594153, 1, 0, 0.7921569, 1,
1.121251, 1.537953, 0.8802554, 1, 0, 0.7843137, 1,
1.128719, 1.270961, -0.1291115, 1, 0, 0.7803922, 1,
1.131979, -0.6632836, 1.70684, 1, 0, 0.772549, 1,
1.145925, 1.922678, 0.57732, 1, 0, 0.7686275, 1,
1.152831, -0.5267453, 0.6445748, 1, 0, 0.7607843, 1,
1.157652, -0.8860803, 3.883951, 1, 0, 0.7568628, 1,
1.161758, -0.3161837, 1.2207, 1, 0, 0.7490196, 1,
1.161985, 0.2100218, -0.1936691, 1, 0, 0.7450981, 1,
1.164401, -0.4233479, 0.9184283, 1, 0, 0.7372549, 1,
1.165492, 0.4228228, 1.268487, 1, 0, 0.7333333, 1,
1.176727, 0.8048543, -1.36381, 1, 0, 0.7254902, 1,
1.183504, -0.4586695, 1.455725, 1, 0, 0.7215686, 1,
1.189534, 0.1321197, -0.6442165, 1, 0, 0.7137255, 1,
1.1898, -0.2014908, 3.36413, 1, 0, 0.7098039, 1,
1.190153, -1.040093, 3.853521, 1, 0, 0.7019608, 1,
1.201876, 1.486092, 0.37267, 1, 0, 0.6941177, 1,
1.207388, -0.6659589, 2.415095, 1, 0, 0.6901961, 1,
1.221575, 0.2803543, 1.713893, 1, 0, 0.682353, 1,
1.223587, -0.8345819, 2.417575, 1, 0, 0.6784314, 1,
1.223879, 1.308137, 1.692486, 1, 0, 0.6705883, 1,
1.224194, -0.06368873, 0.05670489, 1, 0, 0.6666667, 1,
1.230348, -1.627367, 2.122983, 1, 0, 0.6588235, 1,
1.232326, 1.392289, -0.1259092, 1, 0, 0.654902, 1,
1.238064, -1.003357, 2.00075, 1, 0, 0.6470588, 1,
1.239847, 0.3052605, 3.083843, 1, 0, 0.6431373, 1,
1.243243, 0.1075303, 2.788124, 1, 0, 0.6352941, 1,
1.260481, -0.5591099, 0.03033841, 1, 0, 0.6313726, 1,
1.284668, 0.2716487, 1.438192, 1, 0, 0.6235294, 1,
1.290537, -0.2869514, 0.1928155, 1, 0, 0.6196079, 1,
1.298128, 0.8783596, 2.231216, 1, 0, 0.6117647, 1,
1.309021, 0.888803, 1.628306, 1, 0, 0.6078432, 1,
1.316877, 1.423264, 2.089585, 1, 0, 0.6, 1,
1.321035, -0.957356, 2.500983, 1, 0, 0.5921569, 1,
1.322429, -1.02018, 2.276719, 1, 0, 0.5882353, 1,
1.332555, 1.060609, 1.867572, 1, 0, 0.5803922, 1,
1.33303, 1.963777, 0.8755576, 1, 0, 0.5764706, 1,
1.340751, -0.5619814, 2.109404, 1, 0, 0.5686275, 1,
1.356981, -1.866979, 3.221554, 1, 0, 0.5647059, 1,
1.362978, -0.1274969, 3.609311, 1, 0, 0.5568628, 1,
1.364643, 0.7031174, 1.619616, 1, 0, 0.5529412, 1,
1.375699, 1.340078, 0.5240056, 1, 0, 0.5450981, 1,
1.381164, -2.187061, 3.046011, 1, 0, 0.5411765, 1,
1.401532, 0.134773, 0.06325726, 1, 0, 0.5333334, 1,
1.402694, 0.653395, 1.211458, 1, 0, 0.5294118, 1,
1.411822, -0.7344404, 0.3416514, 1, 0, 0.5215687, 1,
1.413589, 0.1840962, 1.754747, 1, 0, 0.5176471, 1,
1.421583, 1.757043, 1.651676, 1, 0, 0.509804, 1,
1.426209, -0.5016415, 3.457679, 1, 0, 0.5058824, 1,
1.429397, 0.2495319, 1.459238, 1, 0, 0.4980392, 1,
1.430233, -0.6087801, 1.55328, 1, 0, 0.4901961, 1,
1.433275, 1.378163, 0.848639, 1, 0, 0.4862745, 1,
1.435909, -0.4474617, 1.104865, 1, 0, 0.4784314, 1,
1.445006, 1.910189, 1.163177, 1, 0, 0.4745098, 1,
1.450851, -0.7037101, 1.087626, 1, 0, 0.4666667, 1,
1.464983, -0.4415786, 1.558487, 1, 0, 0.4627451, 1,
1.469299, -0.3789234, 1.458634, 1, 0, 0.454902, 1,
1.472861, -0.1687656, 2.376324, 1, 0, 0.4509804, 1,
1.474389, -0.2534425, 2.48106, 1, 0, 0.4431373, 1,
1.484294, 0.1641381, 1.022621, 1, 0, 0.4392157, 1,
1.495016, -0.6593715, 3.170917, 1, 0, 0.4313726, 1,
1.499387, 1.637721, -0.6277483, 1, 0, 0.427451, 1,
1.514815, 0.2390221, 0.3008531, 1, 0, 0.4196078, 1,
1.540802, 0.08557569, 0.7804873, 1, 0, 0.4156863, 1,
1.552043, -0.3007839, 2.983726, 1, 0, 0.4078431, 1,
1.564142, -1.428363, 3.047164, 1, 0, 0.4039216, 1,
1.580649, 0.9596009, -0.01482416, 1, 0, 0.3960784, 1,
1.59933, -0.2978842, 2.944215, 1, 0, 0.3882353, 1,
1.608992, 0.8105599, 2.153782, 1, 0, 0.3843137, 1,
1.616471, 1.908392, 0.6820968, 1, 0, 0.3764706, 1,
1.618484, -1.435717, 2.290623, 1, 0, 0.372549, 1,
1.621479, 0.4449599, 1.907773, 1, 0, 0.3647059, 1,
1.632841, -2.246294, 3.818547, 1, 0, 0.3607843, 1,
1.644387, 0.220145, -0.2810437, 1, 0, 0.3529412, 1,
1.652186, -0.9837711, 1.848208, 1, 0, 0.3490196, 1,
1.65243, -1.329777, 2.814324, 1, 0, 0.3411765, 1,
1.653411, 1.396637, 0.02171282, 1, 0, 0.3372549, 1,
1.656624, -1.322933, 1.359628, 1, 0, 0.3294118, 1,
1.658181, 0.5086927, 0.9197182, 1, 0, 0.3254902, 1,
1.6768, -0.1169618, 2.40044, 1, 0, 0.3176471, 1,
1.695328, 0.3188773, 1.649852, 1, 0, 0.3137255, 1,
1.701407, 1.101112, 1.523744, 1, 0, 0.3058824, 1,
1.710987, 0.1913296, 2.732372, 1, 0, 0.2980392, 1,
1.711719, 1.207187, 0.5091224, 1, 0, 0.2941177, 1,
1.729395, -0.6491969, 1.77958, 1, 0, 0.2862745, 1,
1.729802, 0.5004616, 1.878027, 1, 0, 0.282353, 1,
1.733793, 0.597681, 0.8213344, 1, 0, 0.2745098, 1,
1.737775, 3.1366, 1.131125, 1, 0, 0.2705882, 1,
1.739686, 0.1488668, -0.1674604, 1, 0, 0.2627451, 1,
1.745985, -1.583932, 4.486868, 1, 0, 0.2588235, 1,
1.780014, 0.1236973, 1.305111, 1, 0, 0.2509804, 1,
1.788053, -0.8189145, 2.089731, 1, 0, 0.2470588, 1,
1.791675, -1.356665, 2.131338, 1, 0, 0.2392157, 1,
1.796518, 1.289497, 0.2588843, 1, 0, 0.2352941, 1,
1.819179, 0.2661406, 3.207735, 1, 0, 0.227451, 1,
1.82085, -1.270524, 3.171799, 1, 0, 0.2235294, 1,
1.831599, -0.1130435, 3.360152, 1, 0, 0.2156863, 1,
1.832489, -1.709217, 3.268889, 1, 0, 0.2117647, 1,
1.870339, 1.647959, 1.217487, 1, 0, 0.2039216, 1,
1.871984, 0.05317568, 0.9289197, 1, 0, 0.1960784, 1,
1.874056, -0.4754124, 3.592511, 1, 0, 0.1921569, 1,
1.890721, 0.1848871, 2.132252, 1, 0, 0.1843137, 1,
1.919731, 0.2856496, 0.4330635, 1, 0, 0.1803922, 1,
1.924588, -0.8963411, 4.575896, 1, 0, 0.172549, 1,
1.927644, 1.582479, 0.3761911, 1, 0, 0.1686275, 1,
1.94078, 0.546936, 1.423814, 1, 0, 0.1607843, 1,
1.949319, 0.2506046, 1.541853, 1, 0, 0.1568628, 1,
1.957214, -0.6558835, 0.949976, 1, 0, 0.1490196, 1,
1.967537, -0.8338589, 1.269356, 1, 0, 0.145098, 1,
2.001904, 0.5981439, 1.29542, 1, 0, 0.1372549, 1,
2.029756, -0.2239283, 0.2682528, 1, 0, 0.1333333, 1,
2.03016, -1.413162, 1.612689, 1, 0, 0.1254902, 1,
2.039765, 1.184872, 2.041944, 1, 0, 0.1215686, 1,
2.062576, -1.52033, 3.103045, 1, 0, 0.1137255, 1,
2.081627, 0.5629832, 1.321059, 1, 0, 0.1098039, 1,
2.088367, 1.784473, -0.01747224, 1, 0, 0.1019608, 1,
2.094024, -1.631846, 2.049376, 1, 0, 0.09411765, 1,
2.095591, -0.8380744, 2.541939, 1, 0, 0.09019608, 1,
2.145947, 0.9835712, 0.4471871, 1, 0, 0.08235294, 1,
2.21902, 1.185892, -0.4660779, 1, 0, 0.07843138, 1,
2.278971, -0.3177017, 0.4466355, 1, 0, 0.07058824, 1,
2.379673, 0.09755959, 1.657004, 1, 0, 0.06666667, 1,
2.40291, -1.32795, 3.592483, 1, 0, 0.05882353, 1,
2.455751, 0.2375891, 0.2106744, 1, 0, 0.05490196, 1,
2.460596, -0.3978145, 1.182453, 1, 0, 0.04705882, 1,
2.486416, -1.010152, 2.49915, 1, 0, 0.04313726, 1,
2.498291, 1.458169, 1.762977, 1, 0, 0.03529412, 1,
2.498609, 0.1120589, 1.691078, 1, 0, 0.03137255, 1,
2.54124, 1.576268, 1.005014, 1, 0, 0.02352941, 1,
2.619048, 1.800048, 2.306387, 1, 0, 0.01960784, 1,
2.696535, 0.9272793, 1.269934, 1, 0, 0.01176471, 1,
2.712656, -0.1419013, 2.889513, 1, 0, 0.007843138, 1
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
0.04333782, -4.94374, -6.104043, 0, -0.5, 0.5, 0.5,
0.04333782, -4.94374, -6.104043, 1, -0.5, 0.5, 0.5,
0.04333782, -4.94374, -6.104043, 1, 1.5, 0.5, 0.5,
0.04333782, -4.94374, -6.104043, 0, 1.5, 0.5, 0.5
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
-3.530879, -0.3180131, -6.104043, 0, -0.5, 0.5, 0.5,
-3.530879, -0.3180131, -6.104043, 1, -0.5, 0.5, 0.5,
-3.530879, -0.3180131, -6.104043, 1, 1.5, 0.5, 0.5,
-3.530879, -0.3180131, -6.104043, 0, 1.5, 0.5, 0.5
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
-3.530879, -4.94374, 0.4095337, 0, -0.5, 0.5, 0.5,
-3.530879, -4.94374, 0.4095337, 1, -0.5, 0.5, 0.5,
-3.530879, -4.94374, 0.4095337, 1, 1.5, 0.5, 0.5,
-3.530879, -4.94374, 0.4095337, 0, 1.5, 0.5, 0.5
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
-2, -3.876265, -4.600909,
2, -3.876265, -4.600909,
-2, -3.876265, -4.600909,
-2, -4.054177, -4.851431,
-1, -3.876265, -4.600909,
-1, -4.054177, -4.851431,
0, -3.876265, -4.600909,
0, -4.054177, -4.851431,
1, -3.876265, -4.600909,
1, -4.054177, -4.851431,
2, -3.876265, -4.600909,
2, -4.054177, -4.851431
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
-2, -4.410003, -5.352476, 0, -0.5, 0.5, 0.5,
-2, -4.410003, -5.352476, 1, -0.5, 0.5, 0.5,
-2, -4.410003, -5.352476, 1, 1.5, 0.5, 0.5,
-2, -4.410003, -5.352476, 0, 1.5, 0.5, 0.5,
-1, -4.410003, -5.352476, 0, -0.5, 0.5, 0.5,
-1, -4.410003, -5.352476, 1, -0.5, 0.5, 0.5,
-1, -4.410003, -5.352476, 1, 1.5, 0.5, 0.5,
-1, -4.410003, -5.352476, 0, 1.5, 0.5, 0.5,
0, -4.410003, -5.352476, 0, -0.5, 0.5, 0.5,
0, -4.410003, -5.352476, 1, -0.5, 0.5, 0.5,
0, -4.410003, -5.352476, 1, 1.5, 0.5, 0.5,
0, -4.410003, -5.352476, 0, 1.5, 0.5, 0.5,
1, -4.410003, -5.352476, 0, -0.5, 0.5, 0.5,
1, -4.410003, -5.352476, 1, -0.5, 0.5, 0.5,
1, -4.410003, -5.352476, 1, 1.5, 0.5, 0.5,
1, -4.410003, -5.352476, 0, 1.5, 0.5, 0.5,
2, -4.410003, -5.352476, 0, -0.5, 0.5, 0.5,
2, -4.410003, -5.352476, 1, -0.5, 0.5, 0.5,
2, -4.410003, -5.352476, 1, 1.5, 0.5, 0.5,
2, -4.410003, -5.352476, 0, 1.5, 0.5, 0.5
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
-2.70606, -3, -4.600909,
-2.70606, 3, -4.600909,
-2.70606, -3, -4.600909,
-2.843529, -3, -4.851431,
-2.70606, -2, -4.600909,
-2.843529, -2, -4.851431,
-2.70606, -1, -4.600909,
-2.843529, -1, -4.851431,
-2.70606, 0, -4.600909,
-2.843529, 0, -4.851431,
-2.70606, 1, -4.600909,
-2.843529, 1, -4.851431,
-2.70606, 2, -4.600909,
-2.843529, 2, -4.851431,
-2.70606, 3, -4.600909,
-2.843529, 3, -4.851431
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
-3.118469, -3, -5.352476, 0, -0.5, 0.5, 0.5,
-3.118469, -3, -5.352476, 1, -0.5, 0.5, 0.5,
-3.118469, -3, -5.352476, 1, 1.5, 0.5, 0.5,
-3.118469, -3, -5.352476, 0, 1.5, 0.5, 0.5,
-3.118469, -2, -5.352476, 0, -0.5, 0.5, 0.5,
-3.118469, -2, -5.352476, 1, -0.5, 0.5, 0.5,
-3.118469, -2, -5.352476, 1, 1.5, 0.5, 0.5,
-3.118469, -2, -5.352476, 0, 1.5, 0.5, 0.5,
-3.118469, -1, -5.352476, 0, -0.5, 0.5, 0.5,
-3.118469, -1, -5.352476, 1, -0.5, 0.5, 0.5,
-3.118469, -1, -5.352476, 1, 1.5, 0.5, 0.5,
-3.118469, -1, -5.352476, 0, 1.5, 0.5, 0.5,
-3.118469, 0, -5.352476, 0, -0.5, 0.5, 0.5,
-3.118469, 0, -5.352476, 1, -0.5, 0.5, 0.5,
-3.118469, 0, -5.352476, 1, 1.5, 0.5, 0.5,
-3.118469, 0, -5.352476, 0, 1.5, 0.5, 0.5,
-3.118469, 1, -5.352476, 0, -0.5, 0.5, 0.5,
-3.118469, 1, -5.352476, 1, -0.5, 0.5, 0.5,
-3.118469, 1, -5.352476, 1, 1.5, 0.5, 0.5,
-3.118469, 1, -5.352476, 0, 1.5, 0.5, 0.5,
-3.118469, 2, -5.352476, 0, -0.5, 0.5, 0.5,
-3.118469, 2, -5.352476, 1, -0.5, 0.5, 0.5,
-3.118469, 2, -5.352476, 1, 1.5, 0.5, 0.5,
-3.118469, 2, -5.352476, 0, 1.5, 0.5, 0.5,
-3.118469, 3, -5.352476, 0, -0.5, 0.5, 0.5,
-3.118469, 3, -5.352476, 1, -0.5, 0.5, 0.5,
-3.118469, 3, -5.352476, 1, 1.5, 0.5, 0.5,
-3.118469, 3, -5.352476, 0, 1.5, 0.5, 0.5
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
-2.70606, -3.876265, -4,
-2.70606, -3.876265, 4,
-2.70606, -3.876265, -4,
-2.843529, -4.054177, -4,
-2.70606, -3.876265, -2,
-2.843529, -4.054177, -2,
-2.70606, -3.876265, 0,
-2.843529, -4.054177, 0,
-2.70606, -3.876265, 2,
-2.843529, -4.054177, 2,
-2.70606, -3.876265, 4,
-2.843529, -4.054177, 4
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
-3.118469, -4.410003, -4, 0, -0.5, 0.5, 0.5,
-3.118469, -4.410003, -4, 1, -0.5, 0.5, 0.5,
-3.118469, -4.410003, -4, 1, 1.5, 0.5, 0.5,
-3.118469, -4.410003, -4, 0, 1.5, 0.5, 0.5,
-3.118469, -4.410003, -2, 0, -0.5, 0.5, 0.5,
-3.118469, -4.410003, -2, 1, -0.5, 0.5, 0.5,
-3.118469, -4.410003, -2, 1, 1.5, 0.5, 0.5,
-3.118469, -4.410003, -2, 0, 1.5, 0.5, 0.5,
-3.118469, -4.410003, 0, 0, -0.5, 0.5, 0.5,
-3.118469, -4.410003, 0, 1, -0.5, 0.5, 0.5,
-3.118469, -4.410003, 0, 1, 1.5, 0.5, 0.5,
-3.118469, -4.410003, 0, 0, 1.5, 0.5, 0.5,
-3.118469, -4.410003, 2, 0, -0.5, 0.5, 0.5,
-3.118469, -4.410003, 2, 1, -0.5, 0.5, 0.5,
-3.118469, -4.410003, 2, 1, 1.5, 0.5, 0.5,
-3.118469, -4.410003, 2, 0, 1.5, 0.5, 0.5,
-3.118469, -4.410003, 4, 0, -0.5, 0.5, 0.5,
-3.118469, -4.410003, 4, 1, -0.5, 0.5, 0.5,
-3.118469, -4.410003, 4, 1, 1.5, 0.5, 0.5,
-3.118469, -4.410003, 4, 0, 1.5, 0.5, 0.5
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
-2.70606, -3.876265, -4.600909,
-2.70606, 3.240239, -4.600909,
-2.70606, -3.876265, 5.419977,
-2.70606, 3.240239, 5.419977,
-2.70606, -3.876265, -4.600909,
-2.70606, -3.876265, 5.419977,
-2.70606, 3.240239, -4.600909,
-2.70606, 3.240239, 5.419977,
-2.70606, -3.876265, -4.600909,
2.792735, -3.876265, -4.600909,
-2.70606, -3.876265, 5.419977,
2.792735, -3.876265, 5.419977,
-2.70606, 3.240239, -4.600909,
2.792735, 3.240239, -4.600909,
-2.70606, 3.240239, 5.419977,
2.792735, 3.240239, 5.419977,
2.792735, -3.876265, -4.600909,
2.792735, 3.240239, -4.600909,
2.792735, -3.876265, 5.419977,
2.792735, 3.240239, 5.419977,
2.792735, -3.876265, -4.600909,
2.792735, -3.876265, 5.419977,
2.792735, 3.240239, -4.600909,
2.792735, 3.240239, 5.419977
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
var radius = 7.189916;
var distance = 31.98875;
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
mvMatrix.translate( -0.04333782, 0.3180131, -0.4095337 );
mvMatrix.scale( 1.413742, 1.092373, 0.7757675 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.98875);
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
Kaptan<-read.table("Kaptan.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Kaptan$V2
```

```
## Error in eval(expr, envir, enclos): object 'Kaptan' not found
```

```r
y<-Kaptan$V3
```

```
## Error in eval(expr, envir, enclos): object 'Kaptan' not found
```

```r
z<-Kaptan$V4
```

```
## Error in eval(expr, envir, enclos): object 'Kaptan' not found
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
-2.62598, -1.005119, -2.422803, 0, 0, 1, 1, 1,
-2.357893, -0.8938199, -0.4805549, 1, 0, 0, 1, 1,
-2.344999, -1.383302, -3.148905, 1, 0, 0, 1, 1,
-2.309873, -0.009965776, -1.487854, 1, 0, 0, 1, 1,
-2.127513, 0.2088459, -2.035817, 1, 0, 0, 1, 1,
-2.117791, -1.706177, -3.63551, 1, 0, 0, 1, 1,
-2.086866, 0.04533311, -3.556962, 0, 0, 0, 1, 1,
-2.084373, -1.051988, -0.7660379, 0, 0, 0, 1, 1,
-2.045135, 0.8569102, 0.2077802, 0, 0, 0, 1, 1,
-2.025174, 0.9744927, -0.5608862, 0, 0, 0, 1, 1,
-2.0175, -1.081959, -1.499579, 0, 0, 0, 1, 1,
-2.006488, 0.07229085, 0.9791185, 0, 0, 0, 1, 1,
-1.979562, 1.081452, -1.531674, 0, 0, 0, 1, 1,
-1.944146, 1.548769, 1.388609, 1, 1, 1, 1, 1,
-1.920753, -0.09012569, -1.991492, 1, 1, 1, 1, 1,
-1.916314, -1.051946, -1.406671, 1, 1, 1, 1, 1,
-1.905622, -0.9228079, -2.444355, 1, 1, 1, 1, 1,
-1.895297, -0.7181855, -1.50156, 1, 1, 1, 1, 1,
-1.891108, -0.9528826, -1.922457, 1, 1, 1, 1, 1,
-1.881481, -0.04226674, -1.69314, 1, 1, 1, 1, 1,
-1.861879, -0.08992104, -1.976954, 1, 1, 1, 1, 1,
-1.839872, 1.547574, -0.3960376, 1, 1, 1, 1, 1,
-1.836854, 1.203748, -2.1102, 1, 1, 1, 1, 1,
-1.812589, 0.4203539, -3.825179, 1, 1, 1, 1, 1,
-1.789464, 0.2997008, -1.547872, 1, 1, 1, 1, 1,
-1.769374, 0.5045372, -1.479118, 1, 1, 1, 1, 1,
-1.760386, 0.3421293, -2.451651, 1, 1, 1, 1, 1,
-1.742239, 1.319831, -1.565777, 1, 1, 1, 1, 1,
-1.736262, -0.9905117, -3.124583, 0, 0, 1, 1, 1,
-1.735935, 0.9781809, -2.652438, 1, 0, 0, 1, 1,
-1.722531, -2.624013, -0.7040505, 1, 0, 0, 1, 1,
-1.716517, 0.2039167, -2.471191, 1, 0, 0, 1, 1,
-1.715361, -1.832568, -2.240063, 1, 0, 0, 1, 1,
-1.710203, -1.441406, -1.731758, 1, 0, 0, 1, 1,
-1.707913, -0.1223655, -3.807732, 0, 0, 0, 1, 1,
-1.706713, 0.2314096, -4.118686, 0, 0, 0, 1, 1,
-1.619552, -0.06699596, -2.360553, 0, 0, 0, 1, 1,
-1.611924, 0.0270158, -2.342875, 0, 0, 0, 1, 1,
-1.603978, -0.1595038, -3.022003, 0, 0, 0, 1, 1,
-1.596867, -0.2357111, -0.4368421, 0, 0, 0, 1, 1,
-1.596291, 0.747135, -1.049078, 0, 0, 0, 1, 1,
-1.587457, -2.184702, -3.230114, 1, 1, 1, 1, 1,
-1.584854, -0.5566313, -0.3493404, 1, 1, 1, 1, 1,
-1.579914, -0.3260676, -0.1401124, 1, 1, 1, 1, 1,
-1.57712, 1.076138, -0.8120636, 1, 1, 1, 1, 1,
-1.575186, -0.1102777, -3.877506, 1, 1, 1, 1, 1,
-1.559402, 0.1723743, -1.720685, 1, 1, 1, 1, 1,
-1.556457, 0.4766502, -1.082193, 1, 1, 1, 1, 1,
-1.547028, -0.3836571, -2.657922, 1, 1, 1, 1, 1,
-1.545269, 0.2924883, -1.332315, 1, 1, 1, 1, 1,
-1.53993, 0.6601486, -1.850543, 1, 1, 1, 1, 1,
-1.531615, 0.8413793, 0.8808823, 1, 1, 1, 1, 1,
-1.528732, 0.03691186, -2.187067, 1, 1, 1, 1, 1,
-1.51514, 0.3606052, -0.4412968, 1, 1, 1, 1, 1,
-1.5015, 0.8226318, -0.3714157, 1, 1, 1, 1, 1,
-1.498327, 0.7558061, -1.132505, 1, 1, 1, 1, 1,
-1.493846, -0.9357241, -2.874443, 0, 0, 1, 1, 1,
-1.481089, -0.8930987, -1.768357, 1, 0, 0, 1, 1,
-1.463258, 0.3405012, -0.8231264, 1, 0, 0, 1, 1,
-1.43854, 0.298561, -1.331567, 1, 0, 0, 1, 1,
-1.400456, 0.2030367, -1.811058, 1, 0, 0, 1, 1,
-1.40022, 0.5184538, -1.45352, 1, 0, 0, 1, 1,
-1.381265, 0.9084321, -1.280193, 0, 0, 0, 1, 1,
-1.373152, -0.6181835, -1.518935, 0, 0, 0, 1, 1,
-1.371228, 0.1907981, -1.48111, 0, 0, 0, 1, 1,
-1.371198, 0.8130984, -2.220101, 0, 0, 0, 1, 1,
-1.357671, -0.5175673, -0.9863808, 0, 0, 0, 1, 1,
-1.336303, 1.43102, -0.7089312, 0, 0, 0, 1, 1,
-1.333562, -0.7089338, -0.2173431, 0, 0, 0, 1, 1,
-1.331777, -2.709099, -3.26335, 1, 1, 1, 1, 1,
-1.33088, 1.076376, 0.3204859, 1, 1, 1, 1, 1,
-1.322487, -1.07975, -2.227772, 1, 1, 1, 1, 1,
-1.320835, 0.3801154, -1.081047, 1, 1, 1, 1, 1,
-1.319639, 0.6387882, -0.0737345, 1, 1, 1, 1, 1,
-1.314132, 0.4395427, -0.1285627, 1, 1, 1, 1, 1,
-1.313956, 0.7357722, -0.1769285, 1, 1, 1, 1, 1,
-1.311214, 0.378231, 0.4634221, 1, 1, 1, 1, 1,
-1.306503, -1.40725, -2.064915, 1, 1, 1, 1, 1,
-1.294437, 0.5781279, 0.1123553, 1, 1, 1, 1, 1,
-1.281206, 0.971274, -0.5352153, 1, 1, 1, 1, 1,
-1.276253, 0.1906802, -2.29212, 1, 1, 1, 1, 1,
-1.270772, -0.1028675, -1.229911, 1, 1, 1, 1, 1,
-1.259928, -0.7263298, -1.612278, 1, 1, 1, 1, 1,
-1.255547, 0.8881921, -0.5055555, 1, 1, 1, 1, 1,
-1.255025, -2.355114, -3.755441, 0, 0, 1, 1, 1,
-1.243821, 0.9374689, -2.026662, 1, 0, 0, 1, 1,
-1.237591, -0.1175759, -1.704607, 1, 0, 0, 1, 1,
-1.232723, 2.301368, 1.01394, 1, 0, 0, 1, 1,
-1.23105, 1.305628, -1.149796, 1, 0, 0, 1, 1,
-1.230955, -0.512427, -2.383781, 1, 0, 0, 1, 1,
-1.219971, 0.6688648, -1.146399, 0, 0, 0, 1, 1,
-1.213911, 0.3937889, -0.859432, 0, 0, 0, 1, 1,
-1.212598, -2.233779, -3.33255, 0, 0, 0, 1, 1,
-1.211911, 1.524145, 0.1586552, 0, 0, 0, 1, 1,
-1.199582, 0.1484567, -0.6971387, 0, 0, 0, 1, 1,
-1.193572, -2.164436, -2.923666, 0, 0, 0, 1, 1,
-1.178102, 0.1372052, -1.681092, 0, 0, 0, 1, 1,
-1.174338, -0.3542115, -1.602536, 1, 1, 1, 1, 1,
-1.173609, 1.935183, 0.05435682, 1, 1, 1, 1, 1,
-1.164816, -0.06642774, -1.770776, 1, 1, 1, 1, 1,
-1.153862, -1.16448, -2.533288, 1, 1, 1, 1, 1,
-1.149773, -0.01817712, -1.347897, 1, 1, 1, 1, 1,
-1.148834, -0.9092925, -0.6660079, 1, 1, 1, 1, 1,
-1.148448, -0.001138513, -2.659958, 1, 1, 1, 1, 1,
-1.143506, 0.3235567, -0.06349641, 1, 1, 1, 1, 1,
-1.142339, 0.1805087, -1.565982, 1, 1, 1, 1, 1,
-1.134987, 0.9248335, -0.9919066, 1, 1, 1, 1, 1,
-1.123418, -0.8018109, -4.094794, 1, 1, 1, 1, 1,
-1.120636, -2.095428, -3.346332, 1, 1, 1, 1, 1,
-1.118461, -0.5437729, -1.558195, 1, 1, 1, 1, 1,
-1.112567, -0.02735456, -1.60193, 1, 1, 1, 1, 1,
-1.10605, 0.1576903, -2.006858, 1, 1, 1, 1, 1,
-1.105987, 0.7004877, -0.1089785, 0, 0, 1, 1, 1,
-1.095863, 0.7603682, -1.144271, 1, 0, 0, 1, 1,
-1.088793, 0.9691944, -1.238523, 1, 0, 0, 1, 1,
-1.087829, 0.5696677, -2.302527, 1, 0, 0, 1, 1,
-1.085327, 1.478205, -1.410763, 1, 0, 0, 1, 1,
-1.066788, -0.2747272, -2.114607, 1, 0, 0, 1, 1,
-1.066501, -0.9717205, -3.210728, 0, 0, 0, 1, 1,
-1.061657, -0.9655877, -0.8502927, 0, 0, 0, 1, 1,
-1.061509, 0.04803231, -0.6660597, 0, 0, 0, 1, 1,
-1.054807, -0.6034901, -2.181558, 0, 0, 0, 1, 1,
-1.044202, 0.9777274, -0.6174138, 0, 0, 0, 1, 1,
-1.04377, -1.677828, -3.445208, 0, 0, 0, 1, 1,
-1.042979, -1.13155, -3.34509, 0, 0, 0, 1, 1,
-1.037559, -1.231211, -3.818691, 1, 1, 1, 1, 1,
-1.037293, 0.0205972, -0.572371, 1, 1, 1, 1, 1,
-1.029239, -0.6500466, -4.093857, 1, 1, 1, 1, 1,
-1.026153, -0.9348813, -1.973884, 1, 1, 1, 1, 1,
-1.007748, -1.819881, -1.013241, 1, 1, 1, 1, 1,
-1.007143, 0.3595989, -0.4501281, 1, 1, 1, 1, 1,
-1.005353, 0.8190947, -0.3984681, 1, 1, 1, 1, 1,
-1.004753, -0.2227784, -2.419779, 1, 1, 1, 1, 1,
-1.003335, 0.6241847, -0.9782947, 1, 1, 1, 1, 1,
-1.000771, -0.2860743, -2.288046, 1, 1, 1, 1, 1,
-0.9953484, 0.7153586, -0.4924811, 1, 1, 1, 1, 1,
-0.9947627, 2.388707, 0.3059566, 1, 1, 1, 1, 1,
-0.9940487, -0.5047736, -0.4170979, 1, 1, 1, 1, 1,
-0.9933327, 0.04709096, -3.494824, 1, 1, 1, 1, 1,
-0.9864373, -0.1897564, -1.043173, 1, 1, 1, 1, 1,
-0.9851477, 0.8268556, -1.740782, 0, 0, 1, 1, 1,
-0.9843593, 0.9836779, -1.9638, 1, 0, 0, 1, 1,
-0.9804211, 1.419571, 0.04089423, 1, 0, 0, 1, 1,
-0.9780931, -0.7384193, -2.123797, 1, 0, 0, 1, 1,
-0.9778715, -0.947549, -1.097875, 1, 0, 0, 1, 1,
-0.9750915, -0.5034466, -0.9255282, 1, 0, 0, 1, 1,
-0.9735669, -0.500982, -1.069631, 0, 0, 0, 1, 1,
-0.9724631, 0.3475148, -2.800552, 0, 0, 0, 1, 1,
-0.969822, -0.04261179, -1.971635, 0, 0, 0, 1, 1,
-0.9697911, 0.306147, -1.582351, 0, 0, 0, 1, 1,
-0.9664888, 0.1960859, -1.7137, 0, 0, 0, 1, 1,
-0.966361, -1.226141, -1.946331, 0, 0, 0, 1, 1,
-0.9653783, -1.386026, -2.520911, 0, 0, 0, 1, 1,
-0.9612231, -0.8408144, -3.105303, 1, 1, 1, 1, 1,
-0.9573185, 0.1198627, -2.5757, 1, 1, 1, 1, 1,
-0.9464868, 0.1128899, -1.131382, 1, 1, 1, 1, 1,
-0.9412897, 0.0005893701, -1.907879, 1, 1, 1, 1, 1,
-0.9384363, -2.37602, -2.98429, 1, 1, 1, 1, 1,
-0.9319701, 0.2730037, -1.134884, 1, 1, 1, 1, 1,
-0.9144776, 1.140163, -0.2663315, 1, 1, 1, 1, 1,
-0.91113, -0.6790919, -2.778836, 1, 1, 1, 1, 1,
-0.9051869, 1.074919, -0.339044, 1, 1, 1, 1, 1,
-0.9038093, 0.4524345, -1.934754, 1, 1, 1, 1, 1,
-0.9025651, 0.621169, -1.692519, 1, 1, 1, 1, 1,
-0.9014398, 1.793098, 1.700011, 1, 1, 1, 1, 1,
-0.8999746, 0.6283092, -1.345537, 1, 1, 1, 1, 1,
-0.8924909, -0.2483506, -1.178953, 1, 1, 1, 1, 1,
-0.8895289, 1.068312, -2.158303, 1, 1, 1, 1, 1,
-0.88918, 0.9086195, 1.823321, 0, 0, 1, 1, 1,
-0.8888416, -0.7733158, -1.201052, 1, 0, 0, 1, 1,
-0.8868754, -0.4220959, -3.853211, 1, 0, 0, 1, 1,
-0.8867062, -0.1763225, -2.428422, 1, 0, 0, 1, 1,
-0.8842452, -1.668566, -0.3103434, 1, 0, 0, 1, 1,
-0.8821356, -0.02619301, -1.039929, 1, 0, 0, 1, 1,
-0.8807305, -0.08502361, -0.8835068, 0, 0, 0, 1, 1,
-0.8805772, 1.309802, -0.4056975, 0, 0, 0, 1, 1,
-0.8775485, -0.04310501, -3.795177, 0, 0, 0, 1, 1,
-0.8759463, 0.3034751, -1.480893, 0, 0, 0, 1, 1,
-0.8745027, 1.093318, -1.424441, 0, 0, 0, 1, 1,
-0.8669677, -0.4433614, -0.9604778, 0, 0, 0, 1, 1,
-0.8594466, -0.3570838, -2.33133, 0, 0, 0, 1, 1,
-0.8577478, 0.3429853, -1.00598, 1, 1, 1, 1, 1,
-0.8555896, -1.804862, -1.866308, 1, 1, 1, 1, 1,
-0.8553373, 1.447847, -0.6659474, 1, 1, 1, 1, 1,
-0.8464962, -1.40509, -1.4857, 1, 1, 1, 1, 1,
-0.8444186, -1.788269, -1.3277, 1, 1, 1, 1, 1,
-0.8358567, -0.1290645, -2.482718, 1, 1, 1, 1, 1,
-0.8323704, -1.154247, -1.694888, 1, 1, 1, 1, 1,
-0.831754, -0.08328629, -1.501001, 1, 1, 1, 1, 1,
-0.8287399, -0.5309355, -0.5803713, 1, 1, 1, 1, 1,
-0.8284538, -0.9431832, -2.98847, 1, 1, 1, 1, 1,
-0.8237506, 0.5571632, -1.246499, 1, 1, 1, 1, 1,
-0.8160554, -1.070764, -1.973455, 1, 1, 1, 1, 1,
-0.814604, -0.1323245, -1.542188, 1, 1, 1, 1, 1,
-0.8095406, -0.626777, -2.463304, 1, 1, 1, 1, 1,
-0.8066019, 1.601449, -1.355372, 1, 1, 1, 1, 1,
-0.8047954, 0.4913784, -0.9586082, 0, 0, 1, 1, 1,
-0.800724, -0.3315339, -2.413724, 1, 0, 0, 1, 1,
-0.7995165, 1.067891, 0.3513242, 1, 0, 0, 1, 1,
-0.7960491, -0.30992, -2.553512, 1, 0, 0, 1, 1,
-0.7950289, 1.2274, -0.2556818, 1, 0, 0, 1, 1,
-0.7854128, 0.1603437, -0.4959137, 1, 0, 0, 1, 1,
-0.7842593, -0.8588827, -3.888788, 0, 0, 0, 1, 1,
-0.7841486, 0.5286165, -0.8290072, 0, 0, 0, 1, 1,
-0.7733611, 0.4237606, -0.7176429, 0, 0, 0, 1, 1,
-0.7731946, -0.5340608, -2.793224, 0, 0, 0, 1, 1,
-0.771329, 2.049902, -1.301605, 0, 0, 0, 1, 1,
-0.7711069, -0.6698241, -2.916811, 0, 0, 0, 1, 1,
-0.7703035, 1.474805, 0.5538282, 0, 0, 0, 1, 1,
-0.7672319, -1.031075, -2.461687, 1, 1, 1, 1, 1,
-0.760774, 0.4071268, -0.7418386, 1, 1, 1, 1, 1,
-0.759612, 0.3730075, -0.7979813, 1, 1, 1, 1, 1,
-0.7548643, 1.525306, -2.725344, 1, 1, 1, 1, 1,
-0.754616, -0.7221656, -2.295926, 1, 1, 1, 1, 1,
-0.7453786, -0.6750311, -1.239067, 1, 1, 1, 1, 1,
-0.7446474, 0.9041015, 1.076592, 1, 1, 1, 1, 1,
-0.7419674, -1.279841, -1.083147, 1, 1, 1, 1, 1,
-0.741564, 0.3021467, -1.09968, 1, 1, 1, 1, 1,
-0.7370739, -0.5085667, -4.164534, 1, 1, 1, 1, 1,
-0.7295941, -0.9575979, -2.102322, 1, 1, 1, 1, 1,
-0.7262788, -1.433658, -3.345313, 1, 1, 1, 1, 1,
-0.7254478, -0.8693033, -2.996391, 1, 1, 1, 1, 1,
-0.721037, 0.1456168, 1.860163, 1, 1, 1, 1, 1,
-0.7175078, 0.3299856, -1.072685, 1, 1, 1, 1, 1,
-0.7140144, -0.3146393, -2.640798, 0, 0, 1, 1, 1,
-0.7124408, -1.292601, -3.173767, 1, 0, 0, 1, 1,
-0.710915, -0.8414232, -2.390941, 1, 0, 0, 1, 1,
-0.7067562, -0.4356029, -3.678547, 1, 0, 0, 1, 1,
-0.7036961, 0.0322028, -2.686117, 1, 0, 0, 1, 1,
-0.6993347, -0.3719272, -1.540539, 1, 0, 0, 1, 1,
-0.6986946, 2.285367, -0.2467562, 0, 0, 0, 1, 1,
-0.6986462, -1.056061, -2.918554, 0, 0, 0, 1, 1,
-0.6982071, -0.7014861, -1.269219, 0, 0, 0, 1, 1,
-0.6974357, 0.2453812, -2.009002, 0, 0, 0, 1, 1,
-0.6959706, 0.7994795, 0.6109967, 0, 0, 0, 1, 1,
-0.6950378, 0.1226101, 0.7001308, 0, 0, 0, 1, 1,
-0.69386, -0.7520955, -1.711829, 0, 0, 0, 1, 1,
-0.6937906, -1.255459, -1.94096, 1, 1, 1, 1, 1,
-0.6935647, 0.2559474, -2.119085, 1, 1, 1, 1, 1,
-0.6934586, 1.157446, -0.1409954, 1, 1, 1, 1, 1,
-0.6891078, -1.308458, -3.515353, 1, 1, 1, 1, 1,
-0.6880984, -0.06557257, -3.042463, 1, 1, 1, 1, 1,
-0.68743, -1.438054, -2.821979, 1, 1, 1, 1, 1,
-0.6808649, 0.8522257, 0.120681, 1, 1, 1, 1, 1,
-0.6775039, 1.068787, -0.3477285, 1, 1, 1, 1, 1,
-0.6766869, 1.29007, 0.2043344, 1, 1, 1, 1, 1,
-0.6755601, 0.1776626, -1.213676, 1, 1, 1, 1, 1,
-0.6754066, 1.196502, -0.3793152, 1, 1, 1, 1, 1,
-0.6618805, 0.01562588, -0.640618, 1, 1, 1, 1, 1,
-0.6579954, 0.1091352, 0.1417658, 1, 1, 1, 1, 1,
-0.6573268, -1.226216, -2.151033, 1, 1, 1, 1, 1,
-0.6541412, -1.56504, -3.446334, 1, 1, 1, 1, 1,
-0.6523305, -0.3022705, -1.930842, 0, 0, 1, 1, 1,
-0.6521078, 1.306422, 0.6456147, 1, 0, 0, 1, 1,
-0.6459188, 1.236194, -0.2638099, 1, 0, 0, 1, 1,
-0.6436321, 0.223797, -0.5147927, 1, 0, 0, 1, 1,
-0.6435004, -0.2752928, -1.643618, 1, 0, 0, 1, 1,
-0.6389394, 0.1525708, -0.9632095, 1, 0, 0, 1, 1,
-0.634331, -0.0899618, -0.502037, 0, 0, 0, 1, 1,
-0.628889, 1.197628, -1.487355, 0, 0, 0, 1, 1,
-0.62039, 0.4112613, -0.6883789, 0, 0, 0, 1, 1,
-0.6178135, 1.20656, 0.06022931, 0, 0, 0, 1, 1,
-0.6134272, -1.659906, -2.442858, 0, 0, 0, 1, 1,
-0.6133255, -0.9240182, -3.206452, 0, 0, 0, 1, 1,
-0.6104967, 0.09459264, -0.807171, 0, 0, 0, 1, 1,
-0.6101801, -0.4293922, -2.740309, 1, 1, 1, 1, 1,
-0.609523, -0.2828133, -0.6893383, 1, 1, 1, 1, 1,
-0.6042114, -0.1609182, -0.7369944, 1, 1, 1, 1, 1,
-0.6030338, -1.546901, -3.372126, 1, 1, 1, 1, 1,
-0.5994094, 1.906349, -0.1542526, 1, 1, 1, 1, 1,
-0.5970863, -1.044857, -3.197033, 1, 1, 1, 1, 1,
-0.5924957, -0.7740821, -3.218, 1, 1, 1, 1, 1,
-0.5916846, -1.443323, -2.453692, 1, 1, 1, 1, 1,
-0.5912575, 0.5183571, -0.7461969, 1, 1, 1, 1, 1,
-0.5911905, 2.217019, -0.5755943, 1, 1, 1, 1, 1,
-0.5880983, 0.3068925, -1.815962, 1, 1, 1, 1, 1,
-0.5865282, 0.5750313, -1.837561, 1, 1, 1, 1, 1,
-0.5818859, 0.404072, -1.117557, 1, 1, 1, 1, 1,
-0.5797339, -0.08081584, -0.9569001, 1, 1, 1, 1, 1,
-0.5759146, -0.3200522, -1.504875, 1, 1, 1, 1, 1,
-0.5739038, 0.5585046, -0.8299417, 0, 0, 1, 1, 1,
-0.5725877, 0.6278814, -2.077362, 1, 0, 0, 1, 1,
-0.5693402, -0.5053327, -2.30104, 1, 0, 0, 1, 1,
-0.5669904, -0.02683394, -0.4015022, 1, 0, 0, 1, 1,
-0.5667549, -0.467125, -1.732122, 1, 0, 0, 1, 1,
-0.5663475, -1.605626, -2.455103, 1, 0, 0, 1, 1,
-0.5641561, 1.039287, 0.2910172, 0, 0, 0, 1, 1,
-0.5572803, 0.5909956, -0.1992498, 0, 0, 0, 1, 1,
-0.5528682, 0.3945579, 0.3810008, 0, 0, 0, 1, 1,
-0.5523202, 0.8222699, 0.01474579, 0, 0, 0, 1, 1,
-0.5478323, -0.3782247, -0.9356487, 0, 0, 0, 1, 1,
-0.5449545, -1.284947, -1.971559, 0, 0, 0, 1, 1,
-0.5440232, -0.1114877, -1.559607, 0, 0, 0, 1, 1,
-0.5390114, -1.447564, -1.594713, 1, 1, 1, 1, 1,
-0.5382826, 0.8394972, 0.7258967, 1, 1, 1, 1, 1,
-0.5372893, -1.243816, -4.217047, 1, 1, 1, 1, 1,
-0.531272, -0.9583415, -2.208066, 1, 1, 1, 1, 1,
-0.529757, -1.047435, -2.188184, 1, 1, 1, 1, 1,
-0.5282785, -2.759001, -3.544098, 1, 1, 1, 1, 1,
-0.5224342, -1.403425, -0.8145382, 1, 1, 1, 1, 1,
-0.5167302, -0.3133933, -1.720295, 1, 1, 1, 1, 1,
-0.51618, -0.146535, -1.082719, 1, 1, 1, 1, 1,
-0.5128231, 2.243496, 1.132852, 1, 1, 1, 1, 1,
-0.506169, -0.8970174, -0.9008595, 1, 1, 1, 1, 1,
-0.5050035, -2.89212, -3.580017, 1, 1, 1, 1, 1,
-0.4953668, 1.157135, -0.08409249, 1, 1, 1, 1, 1,
-0.4950731, -0.07115311, -2.192129, 1, 1, 1, 1, 1,
-0.493087, -0.8100768, -1.598033, 1, 1, 1, 1, 1,
-0.4862027, -1.065605, -1.869696, 0, 0, 1, 1, 1,
-0.4804392, 0.3394321, -1.466903, 1, 0, 0, 1, 1,
-0.4774067, 2.577226, 0.5501757, 1, 0, 0, 1, 1,
-0.4697804, -0.8598015, -2.952341, 1, 0, 0, 1, 1,
-0.462053, 1.158903, -0.6706862, 1, 0, 0, 1, 1,
-0.4601975, 1.488746, -0.1300767, 1, 0, 0, 1, 1,
-0.4582165, -0.7158877, -3.586311, 0, 0, 0, 1, 1,
-0.4514681, 1.444828, -0.9139327, 0, 0, 0, 1, 1,
-0.4510141, -0.06502042, -1.056654, 0, 0, 0, 1, 1,
-0.4488258, 0.4671469, 0.06005363, 0, 0, 0, 1, 1,
-0.4327399, 1.913857, -1.410537, 0, 0, 0, 1, 1,
-0.4296718, 2.816631, -0.6105701, 0, 0, 0, 1, 1,
-0.4283598, -0.7903684, -3.724823, 0, 0, 0, 1, 1,
-0.4255493, -1.477948, -1.983995, 1, 1, 1, 1, 1,
-0.4250756, 0.242338, -0.1235862, 1, 1, 1, 1, 1,
-0.4235432, -1.279899, -2.4844, 1, 1, 1, 1, 1,
-0.4228878, -2.587408, -2.337042, 1, 1, 1, 1, 1,
-0.4227525, -1.030906, -1.589024, 1, 1, 1, 1, 1,
-0.4226987, 0.0606649, -1.501266, 1, 1, 1, 1, 1,
-0.4219165, 0.2712887, -3.147788, 1, 1, 1, 1, 1,
-0.421787, 0.7730012, -0.2625781, 1, 1, 1, 1, 1,
-0.4198884, -2.313389, -2.539985, 1, 1, 1, 1, 1,
-0.4141, -1.192571, -3.919306, 1, 1, 1, 1, 1,
-0.4129822, 0.3862449, -0.892848, 1, 1, 1, 1, 1,
-0.4108123, -0.8450921, -3.220093, 1, 1, 1, 1, 1,
-0.4099897, -0.110435, -1.513669, 1, 1, 1, 1, 1,
-0.4056635, 0.8028225, -1.620942, 1, 1, 1, 1, 1,
-0.4044006, -1.919872, -3.285724, 1, 1, 1, 1, 1,
-0.4036182, -0.4583805, -3.712605, 0, 0, 1, 1, 1,
-0.3956962, -0.5343384, -3.125774, 1, 0, 0, 1, 1,
-0.3939845, 0.1873713, -0.02416072, 1, 0, 0, 1, 1,
-0.3931091, -2.00137, -4.17127, 1, 0, 0, 1, 1,
-0.3871163, 1.571565, 0.2679172, 1, 0, 0, 1, 1,
-0.387069, -0.06763516, -1.749859, 1, 0, 0, 1, 1,
-0.385546, -0.3066345, -3.020247, 0, 0, 0, 1, 1,
-0.3799214, -0.7961115, -2.773087, 0, 0, 0, 1, 1,
-0.376957, -1.188279, -3.954649, 0, 0, 0, 1, 1,
-0.3734232, -0.5184663, -0.8622883, 0, 0, 0, 1, 1,
-0.3707748, -0.3291914, -2.093157, 0, 0, 0, 1, 1,
-0.3652441, -0.5547067, -1.71165, 0, 0, 0, 1, 1,
-0.3603985, -1.538929, -3.504416, 0, 0, 0, 1, 1,
-0.3560283, -0.5144552, -1.475788, 1, 1, 1, 1, 1,
-0.3530007, 0.1630855, -0.5924954, 1, 1, 1, 1, 1,
-0.3507819, -1.064946, -2.875772, 1, 1, 1, 1, 1,
-0.3413029, 0.5288251, 0.07817671, 1, 1, 1, 1, 1,
-0.3405168, 0.2068329, -0.6196275, 1, 1, 1, 1, 1,
-0.3396503, 0.4370019, -0.680053, 1, 1, 1, 1, 1,
-0.339447, -1.787871, -3.324633, 1, 1, 1, 1, 1,
-0.33796, 0.9047361, 0.6452205, 1, 1, 1, 1, 1,
-0.3351749, 0.8359661, 0.4058987, 1, 1, 1, 1, 1,
-0.3336097, -2.684799, -2.291842, 1, 1, 1, 1, 1,
-0.3270062, 0.4630087, -0.4785071, 1, 1, 1, 1, 1,
-0.3173549, -0.1787864, -2.801762, 1, 1, 1, 1, 1,
-0.3131986, -0.09114259, -3.801216, 1, 1, 1, 1, 1,
-0.3115176, 1.08015, -1.664291, 1, 1, 1, 1, 1,
-0.3083199, 0.2534344, -1.498048, 1, 1, 1, 1, 1,
-0.305677, 1.122682, -2.03357, 0, 0, 1, 1, 1,
-0.3016911, 0.1670257, -0.8418441, 1, 0, 0, 1, 1,
-0.3012184, 0.1724719, -1.202233, 1, 0, 0, 1, 1,
-0.2967466, -0.1786728, -1.205725, 1, 0, 0, 1, 1,
-0.2933492, -0.9635202, -3.388327, 1, 0, 0, 1, 1,
-0.2929353, -1.049778, -1.112171, 1, 0, 0, 1, 1,
-0.290438, 0.7944103, -1.950477, 0, 0, 0, 1, 1,
-0.2874027, -0.647333, 0.6017559, 0, 0, 0, 1, 1,
-0.2865352, -0.6250687, -1.413578, 0, 0, 0, 1, 1,
-0.2789489, -1.480214, -2.2507, 0, 0, 0, 1, 1,
-0.277612, -1.217828, -1.947817, 0, 0, 0, 1, 1,
-0.2775144, -0.3799715, -2.775746, 0, 0, 0, 1, 1,
-0.2752463, -0.03355647, -3.422778, 0, 0, 0, 1, 1,
-0.2751073, -0.5447318, -2.626973, 1, 1, 1, 1, 1,
-0.2749383, -0.7218107, -2.287828, 1, 1, 1, 1, 1,
-0.2722852, 0.7898576, 0.5381679, 1, 1, 1, 1, 1,
-0.2715582, 1.03368, -2.12697, 1, 1, 1, 1, 1,
-0.2691746, 1.185083, 1.466784, 1, 1, 1, 1, 1,
-0.2686374, -0.3480895, -3.368923, 1, 1, 1, 1, 1,
-0.2677232, 0.08483601, -3.162561, 1, 1, 1, 1, 1,
-0.2653408, 0.860264, -0.6155745, 1, 1, 1, 1, 1,
-0.2616868, -2.188266, -3.363462, 1, 1, 1, 1, 1,
-0.2587444, 0.3661692, -0.05061847, 1, 1, 1, 1, 1,
-0.2575387, 1.636716, 1.141803, 1, 1, 1, 1, 1,
-0.2509486, -1.616637, -2.305784, 1, 1, 1, 1, 1,
-0.2492387, 0.3009129, -2.225459, 1, 1, 1, 1, 1,
-0.2479273, -0.0904897, -2.690727, 1, 1, 1, 1, 1,
-0.2457119, 0.379646, 0.502568, 1, 1, 1, 1, 1,
-0.2444579, -1.005971, -2.922038, 0, 0, 1, 1, 1,
-0.2339966, 0.2628221, 0.04899824, 1, 0, 0, 1, 1,
-0.2331992, -0.01801285, -2.273201, 1, 0, 0, 1, 1,
-0.230659, 0.9884777, 0.4865627, 1, 0, 0, 1, 1,
-0.229851, 0.8812509, -0.3109878, 1, 0, 0, 1, 1,
-0.2277075, -0.3181084, -2.142354, 1, 0, 0, 1, 1,
-0.2265405, -0.2976634, -2.785009, 0, 0, 0, 1, 1,
-0.225787, -0.2285372, -3.064679, 0, 0, 0, 1, 1,
-0.225623, 0.7834756, 0.7872787, 0, 0, 0, 1, 1,
-0.2254332, -0.3744756, -3.30943, 0, 0, 0, 1, 1,
-0.221495, 0.6029192, -0.508967, 0, 0, 0, 1, 1,
-0.2147196, 0.8159821, -1.23157, 0, 0, 0, 1, 1,
-0.2145035, 0.6164873, -0.3191572, 0, 0, 0, 1, 1,
-0.213413, 0.5691294, -1.176144, 1, 1, 1, 1, 1,
-0.2111688, 0.4405094, -1.174475, 1, 1, 1, 1, 1,
-0.2111593, 0.6561735, -1.16418, 1, 1, 1, 1, 1,
-0.2092451, -1.229663, -3.733414, 1, 1, 1, 1, 1,
-0.1983106, 0.03886428, -1.579386, 1, 1, 1, 1, 1,
-0.1912034, -0.05929767, -2.839046, 1, 1, 1, 1, 1,
-0.1876963, -0.6709391, -2.272948, 1, 1, 1, 1, 1,
-0.182515, -0.9212319, -3.294675, 1, 1, 1, 1, 1,
-0.1789479, -0.2935954, -2.100083, 1, 1, 1, 1, 1,
-0.1787002, -0.05960254, -0.9184519, 1, 1, 1, 1, 1,
-0.1783959, -0.4529317, -0.3529521, 1, 1, 1, 1, 1,
-0.176828, -0.8687736, -3.3511, 1, 1, 1, 1, 1,
-0.1695328, 0.3193147, -1.009323, 1, 1, 1, 1, 1,
-0.1684621, -0.04046044, -1.180216, 1, 1, 1, 1, 1,
-0.1651808, 1.188824, 0.4087106, 1, 1, 1, 1, 1,
-0.1611381, 0.9834737, -2.186602, 0, 0, 1, 1, 1,
-0.1537924, 0.8256652, -0.08996157, 1, 0, 0, 1, 1,
-0.1520391, 1.196661, 0.8947691, 1, 0, 0, 1, 1,
-0.1450996, -1.30146, -2.164733, 1, 0, 0, 1, 1,
-0.144736, -0.7457373, -2.039331, 1, 0, 0, 1, 1,
-0.1434833, 0.2704509, -0.9225419, 1, 0, 0, 1, 1,
-0.1312255, -0.9049003, -1.661246, 0, 0, 0, 1, 1,
-0.1308601, 0.4535534, 0.7939331, 0, 0, 0, 1, 1,
-0.129108, 0.5222747, 0.2167041, 0, 0, 0, 1, 1,
-0.1279359, -0.2119698, -1.901262, 0, 0, 0, 1, 1,
-0.1267677, 0.06212151, -1.130006, 0, 0, 0, 1, 1,
-0.1244565, 0.03294394, -1.312235, 0, 0, 0, 1, 1,
-0.1218363, -0.03262212, -0.5885748, 0, 0, 0, 1, 1,
-0.1137624, -1.743473, -4.454974, 1, 1, 1, 1, 1,
-0.1134539, 0.230221, -0.2288405, 1, 1, 1, 1, 1,
-0.1132541, 0.664925, 1.134156, 1, 1, 1, 1, 1,
-0.1120201, 0.2010564, -2.677701, 1, 1, 1, 1, 1,
-0.09661981, -2.158139, -3.591688, 1, 1, 1, 1, 1,
-0.09641463, 0.4242523, -1.592561, 1, 1, 1, 1, 1,
-0.09503549, 0.2044617, -0.6061241, 1, 1, 1, 1, 1,
-0.0875752, -2.426362, -1.563465, 1, 1, 1, 1, 1,
-0.0828196, 0.2870025, 0.6872335, 1, 1, 1, 1, 1,
-0.08255123, 3.053114, -0.1569273, 1, 1, 1, 1, 1,
-0.07952883, -0.4876129, -2.192698, 1, 1, 1, 1, 1,
-0.07768489, -0.2190312, -2.68129, 1, 1, 1, 1, 1,
-0.0739987, 2.126668, 0.09954293, 1, 1, 1, 1, 1,
-0.07375986, 0.1286601, -2.156963, 1, 1, 1, 1, 1,
-0.07285513, -0.564594, -3.641141, 1, 1, 1, 1, 1,
-0.07217178, 0.6514828, 0.6306472, 0, 0, 1, 1, 1,
-0.07133035, 1.027358, 0.6022291, 1, 0, 0, 1, 1,
-0.06994254, -0.7263722, -2.482443, 1, 0, 0, 1, 1,
-0.06916659, -1.381458, -2.724973, 1, 0, 0, 1, 1,
-0.06870697, -1.417644, -2.343739, 1, 0, 0, 1, 1,
-0.06743459, 2.118421, -0.4729535, 1, 0, 0, 1, 1,
-0.06259229, -0.546899, -3.855106, 0, 0, 0, 1, 1,
-0.05770258, -0.04746614, -2.39353, 0, 0, 0, 1, 1,
-0.05542646, 1.043755, 1.130163, 0, 0, 0, 1, 1,
-0.05464873, -0.7526301, -3.133982, 0, 0, 0, 1, 1,
-0.04934256, 0.09325445, -0.440206, 0, 0, 0, 1, 1,
-0.04843926, -1.575097, -1.199569, 0, 0, 0, 1, 1,
-0.0454918, 0.9232776, -0.1908869, 0, 0, 0, 1, 1,
-0.04375732, -0.2158348, -2.951987, 1, 1, 1, 1, 1,
-0.04362094, -1.338102, -3.358297, 1, 1, 1, 1, 1,
-0.04004198, -0.4159432, -3.718915, 1, 1, 1, 1, 1,
-0.03836718, -0.8180928, -3.379786, 1, 1, 1, 1, 1,
-0.03555939, -0.5820659, -1.45712, 1, 1, 1, 1, 1,
-0.03253703, 1.570538, -0.6386222, 1, 1, 1, 1, 1,
-0.03132025, -0.1378357, -2.921993, 1, 1, 1, 1, 1,
-0.02536685, -0.2939033, -2.961182, 1, 1, 1, 1, 1,
-0.02505767, -1.522996, -2.698073, 1, 1, 1, 1, 1,
-0.02413463, 0.6778389, -0.4577223, 1, 1, 1, 1, 1,
-0.02332506, 0.7270575, 0.0294079, 1, 1, 1, 1, 1,
-0.02312602, 0.6692159, -1.000227, 1, 1, 1, 1, 1,
-0.02230692, -0.7465245, -3.367048, 1, 1, 1, 1, 1,
-0.01998226, 1.982208, 0.3255387, 1, 1, 1, 1, 1,
-0.01963991, -1.42185, -2.205796, 1, 1, 1, 1, 1,
-0.01881468, -0.3738521, -1.640971, 0, 0, 1, 1, 1,
-0.01449022, 0.03845821, -1.991202, 1, 0, 0, 1, 1,
-0.01274944, 0.9200852, -0.4706183, 1, 0, 0, 1, 1,
-0.009995627, 0.8594507, -0.7988421, 1, 0, 0, 1, 1,
-0.007820788, 1.07891, 0.7081474, 1, 0, 0, 1, 1,
-0.007480472, 1.394779, -1.318596, 1, 0, 0, 1, 1,
-0.004844381, -1.137178, -2.056375, 0, 0, 0, 1, 1,
-0.004094477, 0.4320398, -0.3823366, 0, 0, 0, 1, 1,
-0.002586475, 0.464488, -1.024382, 0, 0, 0, 1, 1,
-0.001650636, -1.127043, -2.404805, 0, 0, 0, 1, 1,
0.005812355, 1.192432, 1.292109, 0, 0, 0, 1, 1,
0.0155762, 0.7470559, 1.172551, 0, 0, 0, 1, 1,
0.02227858, -1.719313, 2.42693, 0, 0, 0, 1, 1,
0.02491569, 0.1153089, 1.957517, 1, 1, 1, 1, 1,
0.02607233, -0.2838485, 1.387354, 1, 1, 1, 1, 1,
0.02826444, 0.786081, -0.1143471, 1, 1, 1, 1, 1,
0.02866229, 0.8061453, -1.073491, 1, 1, 1, 1, 1,
0.02943702, 1.00776, -0.6065629, 1, 1, 1, 1, 1,
0.03050039, -0.4883187, 4.13498, 1, 1, 1, 1, 1,
0.0325231, 0.3160845, 0.8124444, 1, 1, 1, 1, 1,
0.03774647, 1.850767, -0.1480281, 1, 1, 1, 1, 1,
0.03908986, -0.3690013, 1.946382, 1, 1, 1, 1, 1,
0.04099234, -0.6994104, 3.922483, 1, 1, 1, 1, 1,
0.04160792, -2.825466, 2.374744, 1, 1, 1, 1, 1,
0.04170119, -1.147569, 1.914344, 1, 1, 1, 1, 1,
0.04518234, -0.5480508, 2.335977, 1, 1, 1, 1, 1,
0.04709777, -0.1320269, 1.715053, 1, 1, 1, 1, 1,
0.04710233, -0.2808673, 3.032317, 1, 1, 1, 1, 1,
0.05042798, -0.3712465, 1.567105, 0, 0, 1, 1, 1,
0.0516309, 0.2318072, 2.374585, 1, 0, 0, 1, 1,
0.0543933, -0.8589838, 3.193396, 1, 0, 0, 1, 1,
0.06252471, -0.1385031, 1.327655, 1, 0, 0, 1, 1,
0.06584253, 0.4256003, 0.3124452, 1, 0, 0, 1, 1,
0.06719307, -0.7117372, 4.156488, 1, 0, 0, 1, 1,
0.06897198, -1.657938, 3.296291, 0, 0, 0, 1, 1,
0.07091008, -0.701606, 4.313425, 0, 0, 0, 1, 1,
0.07461887, -0.2002124, 2.138962, 0, 0, 0, 1, 1,
0.07581984, -1.755543, 3.784506, 0, 0, 0, 1, 1,
0.07607818, -1.304783, 2.986195, 0, 0, 0, 1, 1,
0.0770646, -0.1167055, 4.466341, 0, 0, 0, 1, 1,
0.0796323, 1.03691, -0.3638279, 0, 0, 0, 1, 1,
0.08420327, -0.9938788, 3.266648, 1, 1, 1, 1, 1,
0.08483799, 0.623616, -0.4686094, 1, 1, 1, 1, 1,
0.09071881, 0.9830183, -0.01766868, 1, 1, 1, 1, 1,
0.09782855, 0.5831684, 0.1171901, 1, 1, 1, 1, 1,
0.09970593, 0.5922498, -1.782739, 1, 1, 1, 1, 1,
0.1018965, -0.2314909, 1.325781, 1, 1, 1, 1, 1,
0.1025173, 0.9647239, -1.0431, 1, 1, 1, 1, 1,
0.1026682, 0.2477246, 0.6077259, 1, 1, 1, 1, 1,
0.1049335, 1.693279, -0.4596211, 1, 1, 1, 1, 1,
0.1057473, 0.6029232, -0.1093198, 1, 1, 1, 1, 1,
0.1061502, -0.351804, 1.991311, 1, 1, 1, 1, 1,
0.1062105, -0.5786504, 1.324131, 1, 1, 1, 1, 1,
0.1107454, 0.2539052, 1.563292, 1, 1, 1, 1, 1,
0.1221756, 1.306321, -0.3284105, 1, 1, 1, 1, 1,
0.1261171, -0.3820283, 2.571198, 1, 1, 1, 1, 1,
0.1276408, 0.1825912, 1.119307, 0, 0, 1, 1, 1,
0.1324305, 0.6653128, -0.6166001, 1, 0, 0, 1, 1,
0.1355608, 0.4291566, -0.7779586, 1, 0, 0, 1, 1,
0.1428395, -1.169227, 3.066491, 1, 0, 0, 1, 1,
0.1441581, 0.5964884, 1.040942, 1, 0, 0, 1, 1,
0.1448957, -1.356588, 2.220081, 1, 0, 0, 1, 1,
0.1466278, 0.7819766, -0.4876204, 0, 0, 0, 1, 1,
0.1473684, -1.293246, 4.062842, 0, 0, 0, 1, 1,
0.151279, 0.1581936, 1.682228, 0, 0, 0, 1, 1,
0.1513513, -1.091051, 3.041559, 0, 0, 0, 1, 1,
0.1516662, -0.2188043, 2.477087, 0, 0, 0, 1, 1,
0.152485, -1.721331, 2.020947, 0, 0, 0, 1, 1,
0.1541571, -0.1147926, 2.460197, 0, 0, 0, 1, 1,
0.158103, 1.961847, 1.833088, 1, 1, 1, 1, 1,
0.1665138, -0.08013039, 1.697401, 1, 1, 1, 1, 1,
0.1729025, -0.0004239043, 1.364088, 1, 1, 1, 1, 1,
0.1775723, -0.6792266, 4.183223, 1, 1, 1, 1, 1,
0.1792616, -0.8689476, 1.361995, 1, 1, 1, 1, 1,
0.1815234, -1.671377, 2.616299, 1, 1, 1, 1, 1,
0.1862757, -0.6013408, 3.613263, 1, 1, 1, 1, 1,
0.1945346, -0.4874896, 2.572707, 1, 1, 1, 1, 1,
0.1950827, 0.2541977, 0.5401483, 1, 1, 1, 1, 1,
0.1995959, 0.4842711, 1.429703, 1, 1, 1, 1, 1,
0.200249, -0.825272, 3.547496, 1, 1, 1, 1, 1,
0.203654, 0.4445528, -1.106259, 1, 1, 1, 1, 1,
0.2038024, 1.14698, -2.456813, 1, 1, 1, 1, 1,
0.2049969, -0.2475965, 2.093974, 1, 1, 1, 1, 1,
0.2070431, -0.4304702, 3.134093, 1, 1, 1, 1, 1,
0.2077234, 1.292328, 0.3970552, 0, 0, 1, 1, 1,
0.2104062, 2.968584, 0.5906894, 1, 0, 0, 1, 1,
0.2150828, 1.542883, 0.6010329, 1, 0, 0, 1, 1,
0.2198453, 1.260664, 0.4855253, 1, 0, 0, 1, 1,
0.222412, 0.6050773, -0.2453034, 1, 0, 0, 1, 1,
0.2240369, 1.451946, -1.34926, 1, 0, 0, 1, 1,
0.2260664, -0.4038815, 1.681418, 0, 0, 0, 1, 1,
0.2271883, -0.5301552, 3.290465, 0, 0, 0, 1, 1,
0.2289669, -1.855631, 2.768635, 0, 0, 0, 1, 1,
0.2308945, -1.28637, 3.051417, 0, 0, 0, 1, 1,
0.2356514, 1.063761, -0.4379799, 0, 0, 0, 1, 1,
0.237326, -1.639298, 3.332288, 0, 0, 0, 1, 1,
0.2380204, -1.300094, 3.622871, 0, 0, 0, 1, 1,
0.2437898, -0.4676317, 3.953741, 1, 1, 1, 1, 1,
0.2496113, -0.9073316, 2.150774, 1, 1, 1, 1, 1,
0.2514948, -0.4844421, 4.185148, 1, 1, 1, 1, 1,
0.2517369, 1.095595, -0.637357, 1, 1, 1, 1, 1,
0.2559339, -0.7828366, 3.653936, 1, 1, 1, 1, 1,
0.2592188, -0.2958687, 2.582312, 1, 1, 1, 1, 1,
0.260764, -1.469839, 1.48615, 1, 1, 1, 1, 1,
0.2627702, 0.123449, 1.234626, 1, 1, 1, 1, 1,
0.2642431, -1.352247, 2.936716, 1, 1, 1, 1, 1,
0.265674, -1.333853, 3.127087, 1, 1, 1, 1, 1,
0.2668844, 0.09292935, 3.185764, 1, 1, 1, 1, 1,
0.2695546, 1.366105, 1.727096, 1, 1, 1, 1, 1,
0.2718472, -0.4301393, 2.226676, 1, 1, 1, 1, 1,
0.2720845, 0.1724869, -0.6633711, 1, 1, 1, 1, 1,
0.2759112, -0.4001776, 2.339429, 1, 1, 1, 1, 1,
0.2801205, 0.2772745, 0.2389988, 0, 0, 1, 1, 1,
0.2821051, -0.751536, 2.225741, 1, 0, 0, 1, 1,
0.2827339, 0.3711142, -0.6062922, 1, 0, 0, 1, 1,
0.2842762, -1.309246, 1.651604, 1, 0, 0, 1, 1,
0.2895578, -0.5222131, 1.71026, 1, 0, 0, 1, 1,
0.2903668, -0.3622081, 3.647121, 1, 0, 0, 1, 1,
0.2949784, -0.7412623, 3.405191, 0, 0, 0, 1, 1,
0.2964028, -1.510735, 2.264882, 0, 0, 0, 1, 1,
0.2971138, 0.4792387, -0.4324876, 0, 0, 0, 1, 1,
0.3018864, 1.169293, -0.3243663, 0, 0, 0, 1, 1,
0.3063361, 0.6036682, 0.5442176, 0, 0, 0, 1, 1,
0.3075121, 2.6032, 0.8904066, 0, 0, 0, 1, 1,
0.308982, 0.322412, 0.9644215, 0, 0, 0, 1, 1,
0.3106932, -0.2085089, -0.001635764, 1, 1, 1, 1, 1,
0.3154335, -1.573974, 1.120826, 1, 1, 1, 1, 1,
0.3184116, -1.897064, 2.598553, 1, 1, 1, 1, 1,
0.3230402, 2.184422, -1.362015, 1, 1, 1, 1, 1,
0.323152, -0.2307404, 1.435106, 1, 1, 1, 1, 1,
0.3232296, -0.2447961, 1.754617, 1, 1, 1, 1, 1,
0.3234245, 0.8899148, 1.028837, 1, 1, 1, 1, 1,
0.3234574, -0.5067841, 2.147397, 1, 1, 1, 1, 1,
0.3237598, -0.4737158, 2.607396, 1, 1, 1, 1, 1,
0.3238081, 0.223522, 0.8821667, 1, 1, 1, 1, 1,
0.3254023, 0.1180419, 0.5910006, 1, 1, 1, 1, 1,
0.3264185, 0.4740828, 0.791495, 1, 1, 1, 1, 1,
0.3270286, 1.08381, 0.1701427, 1, 1, 1, 1, 1,
0.327397, -0.08315636, 2.766692, 1, 1, 1, 1, 1,
0.3276166, -1.638512, 4.538857, 1, 1, 1, 1, 1,
0.3276624, -0.4824966, 4.768112, 0, 0, 1, 1, 1,
0.3287019, 0.9028368, -0.215297, 1, 0, 0, 1, 1,
0.3320374, -0.8324822, 3.522378, 1, 0, 0, 1, 1,
0.3335688, -0.4592008, 2.0269, 1, 0, 0, 1, 1,
0.3402845, -0.6232938, 1.225221, 1, 0, 0, 1, 1,
0.3465126, 0.2471429, 0.5835701, 1, 0, 0, 1, 1,
0.3492406, -1.466274, 4.107181, 0, 0, 0, 1, 1,
0.3521754, -0.2739505, 1.138601, 0, 0, 0, 1, 1,
0.3572972, 0.9914664, 0.3557397, 0, 0, 0, 1, 1,
0.358565, 1.080877, -1.333742, 0, 0, 0, 1, 1,
0.3589976, 0.6312882, 0.5105666, 0, 0, 0, 1, 1,
0.3647827, -1.512537, 3.938581, 0, 0, 0, 1, 1,
0.3663427, -1.57449, 4.11375, 0, 0, 0, 1, 1,
0.3665996, -1.197897, 2.859637, 1, 1, 1, 1, 1,
0.3670985, 0.7576839, 1.932363, 1, 1, 1, 1, 1,
0.371939, 0.5553992, 0.8648339, 1, 1, 1, 1, 1,
0.3730147, 0.563948, 1.772258, 1, 1, 1, 1, 1,
0.3768251, 0.09858382, 1.880254, 1, 1, 1, 1, 1,
0.3831144, 1.328198, 1.566774, 1, 1, 1, 1, 1,
0.3902342, 1.489614, 1.26948, 1, 1, 1, 1, 1,
0.3906558, 0.001433395, 3.315128, 1, 1, 1, 1, 1,
0.3960052, 0.4054282, 1.250573, 1, 1, 1, 1, 1,
0.3991255, 0.8358941, 0.774421, 1, 1, 1, 1, 1,
0.4059297, -0.6423435, 3.50626, 1, 1, 1, 1, 1,
0.410228, -2.572183, 2.71749, 1, 1, 1, 1, 1,
0.4109372, -0.4859631, 2.550017, 1, 1, 1, 1, 1,
0.4138306, -0.7192848, 4.764071, 1, 1, 1, 1, 1,
0.4157422, -0.8520355, 2.834103, 1, 1, 1, 1, 1,
0.416348, -0.670886, 2.092065, 0, 0, 1, 1, 1,
0.4217311, -0.3873883, 3.437711, 1, 0, 0, 1, 1,
0.4218009, -0.04288563, 2.168383, 1, 0, 0, 1, 1,
0.4218886, 0.4400817, 0.9221368, 1, 0, 0, 1, 1,
0.4253015, -0.4679776, 3.456047, 1, 0, 0, 1, 1,
0.4268956, 0.5952132, 1.548506, 1, 0, 0, 1, 1,
0.4270713, 0.1133048, -0.07392032, 0, 0, 0, 1, 1,
0.4299622, 0.4305654, -0.9224847, 0, 0, 0, 1, 1,
0.4320124, 0.04631831, -0.03258107, 0, 0, 0, 1, 1,
0.4376587, 0.5148523, 1.986734, 0, 0, 0, 1, 1,
0.4379269, -1.32396, 2.129106, 0, 0, 0, 1, 1,
0.4404117, -2.387889, 3.345562, 0, 0, 0, 1, 1,
0.4432774, -0.2057766, 3.725107, 0, 0, 0, 1, 1,
0.4495761, -0.1522442, 2.568722, 1, 1, 1, 1, 1,
0.4507799, -2.085601, 3.175507, 1, 1, 1, 1, 1,
0.4516327, 0.1748636, 0.1868216, 1, 1, 1, 1, 1,
0.4516798, 1.834858, -1.190869, 1, 1, 1, 1, 1,
0.4580108, 0.8106788, -0.6888276, 1, 1, 1, 1, 1,
0.458691, -0.02902869, 2.676901, 1, 1, 1, 1, 1,
0.4606968, -0.9456431, 2.063256, 1, 1, 1, 1, 1,
0.4645626, 0.02029907, 0.651733, 1, 1, 1, 1, 1,
0.4652066, 1.615268, -0.2164412, 1, 1, 1, 1, 1,
0.4725768, -1.545461, 4.234748, 1, 1, 1, 1, 1,
0.4738079, -0.8643532, 4.333869, 1, 1, 1, 1, 1,
0.4782329, -0.08911545, 2.915456, 1, 1, 1, 1, 1,
0.4822277, -0.9134706, 0.7780963, 1, 1, 1, 1, 1,
0.4843864, -0.504466, 1.708998, 1, 1, 1, 1, 1,
0.4888784, -0.722519, 3.156411, 1, 1, 1, 1, 1,
0.4943503, -0.8081036, 3.969207, 0, 0, 1, 1, 1,
0.495157, 0.6736084, 1.19733, 1, 0, 0, 1, 1,
0.4968095, -0.5300921, 4.410869, 1, 0, 0, 1, 1,
0.4980164, 1.270966, 0.857467, 1, 0, 0, 1, 1,
0.5001376, 1.131029, -0.9764031, 1, 0, 0, 1, 1,
0.5029247, 1.539189, 0.5176687, 1, 0, 0, 1, 1,
0.5030854, 0.4234773, 0.7902849, 0, 0, 0, 1, 1,
0.5046821, -0.8837329, 3.125328, 0, 0, 0, 1, 1,
0.5062571, 0.9964874, 0.3873426, 0, 0, 0, 1, 1,
0.5097598, 0.9017995, 1.282805, 0, 0, 0, 1, 1,
0.5126505, -0.5880716, 2.439178, 0, 0, 0, 1, 1,
0.5159331, -2.118438, 4.202905, 0, 0, 0, 1, 1,
0.5214852, -0.7989213, 2.087182, 0, 0, 0, 1, 1,
0.5234489, -0.4051852, 1.487323, 1, 1, 1, 1, 1,
0.5243294, -1.362926, 3.353855, 1, 1, 1, 1, 1,
0.528453, 0.03424942, 1.343211, 1, 1, 1, 1, 1,
0.5319114, -1.617102, 1.868009, 1, 1, 1, 1, 1,
0.5323754, -0.5696188, 2.310591, 1, 1, 1, 1, 1,
0.5350214, 1.758704, 0.2220119, 1, 1, 1, 1, 1,
0.5364015, -0.7085132, 2.394129, 1, 1, 1, 1, 1,
0.5395805, -0.1427674, 3.04222, 1, 1, 1, 1, 1,
0.5410064, -0.8052977, 2.858251, 1, 1, 1, 1, 1,
0.5449644, 0.2421863, 0.3500674, 1, 1, 1, 1, 1,
0.5531314, 0.09727766, 2.405429, 1, 1, 1, 1, 1,
0.560112, -1.517848, 2.036058, 1, 1, 1, 1, 1,
0.5612525, -0.1609796, 2.184506, 1, 1, 1, 1, 1,
0.5661103, 0.9388535, 0.196171, 1, 1, 1, 1, 1,
0.5700884, -0.6972451, 4.04881, 1, 1, 1, 1, 1,
0.5717619, 0.4685373, 0.2674765, 0, 0, 1, 1, 1,
0.5748466, -0.2363793, 1.328163, 1, 0, 0, 1, 1,
0.5762486, 0.03140685, 2.814511, 1, 0, 0, 1, 1,
0.5859052, 0.7458846, 0.07152428, 1, 0, 0, 1, 1,
0.5884192, 0.7632004, 2.237077, 1, 0, 0, 1, 1,
0.5885425, 0.3147551, 0.2206115, 1, 0, 0, 1, 1,
0.5897747, 0.4462846, 0.9176058, 0, 0, 0, 1, 1,
0.590599, 1.391088, 0.7637248, 0, 0, 0, 1, 1,
0.5959371, 1.473567, 0.8665874, 0, 0, 0, 1, 1,
0.5959855, 0.8177071, 0.3075012, 0, 0, 0, 1, 1,
0.5979632, 1.289693, 0.09945876, 0, 0, 0, 1, 1,
0.5997985, 0.8384185, 1.350089, 0, 0, 0, 1, 1,
0.6018876, -0.3478977, 3.037623, 0, 0, 0, 1, 1,
0.6064565, -0.5008989, 2.732198, 1, 1, 1, 1, 1,
0.6064715, -1.83299, 1.414727, 1, 1, 1, 1, 1,
0.6070309, 0.1998983, 1.329981, 1, 1, 1, 1, 1,
0.6203886, -1.394717, 2.246703, 1, 1, 1, 1, 1,
0.6226948, 1.961061, 2.35633, 1, 1, 1, 1, 1,
0.6234248, -1.50531, 2.240651, 1, 1, 1, 1, 1,
0.6239517, 1.934203, -0.3103687, 1, 1, 1, 1, 1,
0.6255243, -0.1631679, 3.333735, 1, 1, 1, 1, 1,
0.6259632, 0.03549164, 1.931371, 1, 1, 1, 1, 1,
0.6267726, 0.3180567, 0.630532, 1, 1, 1, 1, 1,
0.6284479, -1.211915, 1.852182, 1, 1, 1, 1, 1,
0.6313037, -0.6651417, 4.341221, 1, 1, 1, 1, 1,
0.6354413, -0.5243288, 2.984387, 1, 1, 1, 1, 1,
0.6371476, 0.6451802, 2.106368, 1, 1, 1, 1, 1,
0.6371672, -0.1402026, 1.757849, 1, 1, 1, 1, 1,
0.637428, 0.9565444, 0.3646598, 0, 0, 1, 1, 1,
0.6383126, 0.8334287, 2.068313, 1, 0, 0, 1, 1,
0.6425626, -0.2125614, 3.604801, 1, 0, 0, 1, 1,
0.6425887, -0.2457991, 1.550787, 1, 0, 0, 1, 1,
0.6464118, -0.327313, 2.092665, 1, 0, 0, 1, 1,
0.6513419, -0.01361655, 0.5501038, 1, 0, 0, 1, 1,
0.6518738, -0.2559621, 2.838892, 0, 0, 0, 1, 1,
0.6520797, -3.772626, 1.980388, 0, 0, 0, 1, 1,
0.6522276, -1.87257, 2.092757, 0, 0, 0, 1, 1,
0.6549702, 1.222252, 0.1798867, 0, 0, 0, 1, 1,
0.6559558, 0.7335079, 0.3419701, 0, 0, 0, 1, 1,
0.65813, 0.2346811, 1.385051, 0, 0, 0, 1, 1,
0.6626976, -0.8702743, 2.403114, 0, 0, 0, 1, 1,
0.6648118, -0.4709728, 2.181, 1, 1, 1, 1, 1,
0.6735882, 0.1964441, 1.47051, 1, 1, 1, 1, 1,
0.675724, 0.3021327, 0.8921517, 1, 1, 1, 1, 1,
0.6772786, 1.042239, -0.5960084, 1, 1, 1, 1, 1,
0.6849233, 0.7208527, -0.181957, 1, 1, 1, 1, 1,
0.6866423, 0.2094947, 3.380484, 1, 1, 1, 1, 1,
0.6868897, 0.8734958, 0.7958172, 1, 1, 1, 1, 1,
0.690468, -1.364545, 3.933352, 1, 1, 1, 1, 1,
0.6924704, 0.07028857, 1.288629, 1, 1, 1, 1, 1,
0.6943598, -2.37157, 2.041387, 1, 1, 1, 1, 1,
0.7013802, 0.4719008, -0.09085444, 1, 1, 1, 1, 1,
0.7015364, -1.094124, 1.255738, 1, 1, 1, 1, 1,
0.710157, 0.03358699, 0.9893166, 1, 1, 1, 1, 1,
0.7145675, 0.4984147, 0.40822, 1, 1, 1, 1, 1,
0.7153603, 1.676647, 0.2752857, 1, 1, 1, 1, 1,
0.7205537, 0.69491, -0.3945461, 0, 0, 1, 1, 1,
0.7259638, 0.9132207, -0.9624937, 1, 0, 0, 1, 1,
0.7353504, 0.2869843, -0.03641852, 1, 0, 0, 1, 1,
0.7401302, -0.7691407, 2.539565, 1, 0, 0, 1, 1,
0.7414197, -0.4170499, 1.723463, 1, 0, 0, 1, 1,
0.7475019, -0.8104588, 2.290166, 1, 0, 0, 1, 1,
0.7496327, 0.1999564, 1.27146, 0, 0, 0, 1, 1,
0.7526118, -0.02708538, 2.07763, 0, 0, 0, 1, 1,
0.7560386, 0.3528121, 0.5844051, 0, 0, 0, 1, 1,
0.7567403, -0.5889228, 1.760092, 0, 0, 0, 1, 1,
0.7592615, 1.009911, 1.695676, 0, 0, 0, 1, 1,
0.7613243, 1.177055, -0.9117414, 0, 0, 0, 1, 1,
0.7698187, 0.9949857, 1.334159, 0, 0, 0, 1, 1,
0.7774578, -0.4135633, 1.886286, 1, 1, 1, 1, 1,
0.7931173, 0.3420978, -0.07956766, 1, 1, 1, 1, 1,
0.7946984, 0.9483332, 1.50027, 1, 1, 1, 1, 1,
0.795638, 0.2628387, 2.312219, 1, 1, 1, 1, 1,
0.8024232, -0.9755316, 2.438672, 1, 1, 1, 1, 1,
0.8028579, 1.752535, 1.105742, 1, 1, 1, 1, 1,
0.8056387, 2.365063, 0.4097905, 1, 1, 1, 1, 1,
0.8080118, 0.3995235, 0.07889125, 1, 1, 1, 1, 1,
0.8098472, -0.09301188, 1.578626, 1, 1, 1, 1, 1,
0.8113009, 0.7401094, 1.101939, 1, 1, 1, 1, 1,
0.8114522, 0.7548684, 2.29987, 1, 1, 1, 1, 1,
0.8166228, -0.3313994, 1.389644, 1, 1, 1, 1, 1,
0.8175283, -0.5311208, 3.910803, 1, 1, 1, 1, 1,
0.8217292, -1.812546, 2.54547, 1, 1, 1, 1, 1,
0.8221868, -0.08876873, 0.9083032, 1, 1, 1, 1, 1,
0.8229381, -0.3839893, 2.886506, 0, 0, 1, 1, 1,
0.8280903, 1.293253, 1.729811, 1, 0, 0, 1, 1,
0.8296684, -0.8612592, 2.175374, 1, 0, 0, 1, 1,
0.8310821, -0.9504219, 0.5734295, 1, 0, 0, 1, 1,
0.8312249, 0.5821385, -0.01051768, 1, 0, 0, 1, 1,
0.8319811, -0.8219057, 1.489699, 1, 0, 0, 1, 1,
0.8393968, -0.88013, 1.933735, 0, 0, 0, 1, 1,
0.8418648, 0.4047337, 1.546322, 0, 0, 0, 1, 1,
0.8431754, -0.1669097, 1.770119, 0, 0, 0, 1, 1,
0.8450232, 1.269892, 0.2675505, 0, 0, 0, 1, 1,
0.8500187, -2.543399, 5.274042, 0, 0, 0, 1, 1,
0.8523136, 1.082168, 1.357177, 0, 0, 0, 1, 1,
0.853832, -1.413909, 2.498281, 0, 0, 0, 1, 1,
0.8566339, -0.284113, 2.107354, 1, 1, 1, 1, 1,
0.857529, 0.9678982, -0.5957143, 1, 1, 1, 1, 1,
0.8607221, -1.611038, 2.368987, 1, 1, 1, 1, 1,
0.8622149, -0.7689463, 2.213037, 1, 1, 1, 1, 1,
0.866016, -0.7198108, 2.554157, 1, 1, 1, 1, 1,
0.867466, 0.5042468, 1.102988, 1, 1, 1, 1, 1,
0.8710111, 0.7641108, 0.7516807, 1, 1, 1, 1, 1,
0.8730804, 0.6785737, 0.6594389, 1, 1, 1, 1, 1,
0.878389, 0.008009433, 0.3770415, 1, 1, 1, 1, 1,
0.8785654, -0.8328285, 2.204308, 1, 1, 1, 1, 1,
0.8799383, 0.01878166, 2.27966, 1, 1, 1, 1, 1,
0.8823853, -0.2718546, 0.72028, 1, 1, 1, 1, 1,
0.8903819, -0.4798573, 0.7747636, 1, 1, 1, 1, 1,
0.8928046, 0.02818391, 1.080882, 1, 1, 1, 1, 1,
0.8972245, -0.6105198, 3.438452, 1, 1, 1, 1, 1,
0.8983282, -1.657982, 3.289638, 0, 0, 1, 1, 1,
0.8989618, 0.1439233, 1.595215, 1, 0, 0, 1, 1,
0.9052667, -0.167089, 1.155212, 1, 0, 0, 1, 1,
0.9103593, -0.743723, 0.3029844, 1, 0, 0, 1, 1,
0.9117562, 0.8512547, 1.105757, 1, 0, 0, 1, 1,
0.9126949, -0.9001252, 2.726212, 1, 0, 0, 1, 1,
0.9163188, 0.6681811, 0.3378609, 0, 0, 0, 1, 1,
0.9171541, 1.395916, 0.1549607, 0, 0, 0, 1, 1,
0.9222024, 0.3556907, 1.864133, 0, 0, 0, 1, 1,
0.9340287, -0.1286244, 3.202745, 0, 0, 0, 1, 1,
0.9353321, -1.265508, 2.426603, 0, 0, 0, 1, 1,
0.9403194, 0.4178764, 1.347764, 0, 0, 0, 1, 1,
0.9425405, 1.726493, 1.388418, 0, 0, 0, 1, 1,
0.9495733, 0.5024586, 1.51442, 1, 1, 1, 1, 1,
0.9555731, 1.590673, 1.25382, 1, 1, 1, 1, 1,
0.9561461, -1.509991, 2.653265, 1, 1, 1, 1, 1,
0.958068, -1.28195, 2.407067, 1, 1, 1, 1, 1,
0.9750874, 0.9137552, 2.383966, 1, 1, 1, 1, 1,
0.9767132, -0.2852236, 4.4876, 1, 1, 1, 1, 1,
0.9772575, -1.036678, 2.535365, 1, 1, 1, 1, 1,
0.9812678, -0.9137056, 2.614798, 1, 1, 1, 1, 1,
0.9824283, 0.06751463, 1.399426, 1, 1, 1, 1, 1,
0.9850874, 0.1284452, 0.5285401, 1, 1, 1, 1, 1,
0.9880795, -1.260049, 0.8247846, 1, 1, 1, 1, 1,
0.988409, -0.7961492, 1.004783, 1, 1, 1, 1, 1,
0.9909228, 0.1415534, 1.775162, 1, 1, 1, 1, 1,
0.9921623, 0.1131552, 3.098586, 1, 1, 1, 1, 1,
0.9926869, 0.4266847, -1.173347, 1, 1, 1, 1, 1,
0.9929575, 0.02248478, 1.058673, 0, 0, 1, 1, 1,
0.9948637, -0.1660195, 3.163193, 1, 0, 0, 1, 1,
0.994961, -1.431922, 2.846404, 1, 0, 0, 1, 1,
0.9972195, -0.7759932, 1.746901, 1, 0, 0, 1, 1,
0.9980777, -1.061494, 1.951123, 1, 0, 0, 1, 1,
1.005377, -0.7005335, 1.887186, 1, 0, 0, 1, 1,
1.008311, -1.662189, 2.486625, 0, 0, 0, 1, 1,
1.01143, 0.5097418, 3.056714, 0, 0, 0, 1, 1,
1.012916, -0.3710436, 1.809822, 0, 0, 0, 1, 1,
1.016109, -0.1126314, 1.03023, 0, 0, 0, 1, 1,
1.021874, 0.4019107, 0.4298029, 0, 0, 0, 1, 1,
1.026488, -1.579044, 3.374806, 0, 0, 0, 1, 1,
1.026561, -0.4762173, 1.876504, 0, 0, 0, 1, 1,
1.054018, 1.567295, -0.2912155, 1, 1, 1, 1, 1,
1.05931, -0.1321387, -0.06971259, 1, 1, 1, 1, 1,
1.060898, 0.438323, 1.60166, 1, 1, 1, 1, 1,
1.063562, 1.232262, 2.578253, 1, 1, 1, 1, 1,
1.063892, -1.795256, 0.8194668, 1, 1, 1, 1, 1,
1.070116, 0.2312801, 0.4339978, 1, 1, 1, 1, 1,
1.070279, -0.5461162, 1.704132, 1, 1, 1, 1, 1,
1.073102, -0.5954548, 0.01472793, 1, 1, 1, 1, 1,
1.077063, 0.03642527, -0.6034287, 1, 1, 1, 1, 1,
1.078758, -0.6902155, 2.258172, 1, 1, 1, 1, 1,
1.095446, 0.3789014, 2.017235, 1, 1, 1, 1, 1,
1.095465, -1.352754, 2.045336, 1, 1, 1, 1, 1,
1.100993, -0.2082575, 3.215587, 1, 1, 1, 1, 1,
1.107324, 1.123688, 3.236163, 1, 1, 1, 1, 1,
1.107703, 0.3617394, 2.201966, 1, 1, 1, 1, 1,
1.115709, -0.5908996, 2.594153, 0, 0, 1, 1, 1,
1.121251, 1.537953, 0.8802554, 1, 0, 0, 1, 1,
1.128719, 1.270961, -0.1291115, 1, 0, 0, 1, 1,
1.131979, -0.6632836, 1.70684, 1, 0, 0, 1, 1,
1.145925, 1.922678, 0.57732, 1, 0, 0, 1, 1,
1.152831, -0.5267453, 0.6445748, 1, 0, 0, 1, 1,
1.157652, -0.8860803, 3.883951, 0, 0, 0, 1, 1,
1.161758, -0.3161837, 1.2207, 0, 0, 0, 1, 1,
1.161985, 0.2100218, -0.1936691, 0, 0, 0, 1, 1,
1.164401, -0.4233479, 0.9184283, 0, 0, 0, 1, 1,
1.165492, 0.4228228, 1.268487, 0, 0, 0, 1, 1,
1.176727, 0.8048543, -1.36381, 0, 0, 0, 1, 1,
1.183504, -0.4586695, 1.455725, 0, 0, 0, 1, 1,
1.189534, 0.1321197, -0.6442165, 1, 1, 1, 1, 1,
1.1898, -0.2014908, 3.36413, 1, 1, 1, 1, 1,
1.190153, -1.040093, 3.853521, 1, 1, 1, 1, 1,
1.201876, 1.486092, 0.37267, 1, 1, 1, 1, 1,
1.207388, -0.6659589, 2.415095, 1, 1, 1, 1, 1,
1.221575, 0.2803543, 1.713893, 1, 1, 1, 1, 1,
1.223587, -0.8345819, 2.417575, 1, 1, 1, 1, 1,
1.223879, 1.308137, 1.692486, 1, 1, 1, 1, 1,
1.224194, -0.06368873, 0.05670489, 1, 1, 1, 1, 1,
1.230348, -1.627367, 2.122983, 1, 1, 1, 1, 1,
1.232326, 1.392289, -0.1259092, 1, 1, 1, 1, 1,
1.238064, -1.003357, 2.00075, 1, 1, 1, 1, 1,
1.239847, 0.3052605, 3.083843, 1, 1, 1, 1, 1,
1.243243, 0.1075303, 2.788124, 1, 1, 1, 1, 1,
1.260481, -0.5591099, 0.03033841, 1, 1, 1, 1, 1,
1.284668, 0.2716487, 1.438192, 0, 0, 1, 1, 1,
1.290537, -0.2869514, 0.1928155, 1, 0, 0, 1, 1,
1.298128, 0.8783596, 2.231216, 1, 0, 0, 1, 1,
1.309021, 0.888803, 1.628306, 1, 0, 0, 1, 1,
1.316877, 1.423264, 2.089585, 1, 0, 0, 1, 1,
1.321035, -0.957356, 2.500983, 1, 0, 0, 1, 1,
1.322429, -1.02018, 2.276719, 0, 0, 0, 1, 1,
1.332555, 1.060609, 1.867572, 0, 0, 0, 1, 1,
1.33303, 1.963777, 0.8755576, 0, 0, 0, 1, 1,
1.340751, -0.5619814, 2.109404, 0, 0, 0, 1, 1,
1.356981, -1.866979, 3.221554, 0, 0, 0, 1, 1,
1.362978, -0.1274969, 3.609311, 0, 0, 0, 1, 1,
1.364643, 0.7031174, 1.619616, 0, 0, 0, 1, 1,
1.375699, 1.340078, 0.5240056, 1, 1, 1, 1, 1,
1.381164, -2.187061, 3.046011, 1, 1, 1, 1, 1,
1.401532, 0.134773, 0.06325726, 1, 1, 1, 1, 1,
1.402694, 0.653395, 1.211458, 1, 1, 1, 1, 1,
1.411822, -0.7344404, 0.3416514, 1, 1, 1, 1, 1,
1.413589, 0.1840962, 1.754747, 1, 1, 1, 1, 1,
1.421583, 1.757043, 1.651676, 1, 1, 1, 1, 1,
1.426209, -0.5016415, 3.457679, 1, 1, 1, 1, 1,
1.429397, 0.2495319, 1.459238, 1, 1, 1, 1, 1,
1.430233, -0.6087801, 1.55328, 1, 1, 1, 1, 1,
1.433275, 1.378163, 0.848639, 1, 1, 1, 1, 1,
1.435909, -0.4474617, 1.104865, 1, 1, 1, 1, 1,
1.445006, 1.910189, 1.163177, 1, 1, 1, 1, 1,
1.450851, -0.7037101, 1.087626, 1, 1, 1, 1, 1,
1.464983, -0.4415786, 1.558487, 1, 1, 1, 1, 1,
1.469299, -0.3789234, 1.458634, 0, 0, 1, 1, 1,
1.472861, -0.1687656, 2.376324, 1, 0, 0, 1, 1,
1.474389, -0.2534425, 2.48106, 1, 0, 0, 1, 1,
1.484294, 0.1641381, 1.022621, 1, 0, 0, 1, 1,
1.495016, -0.6593715, 3.170917, 1, 0, 0, 1, 1,
1.499387, 1.637721, -0.6277483, 1, 0, 0, 1, 1,
1.514815, 0.2390221, 0.3008531, 0, 0, 0, 1, 1,
1.540802, 0.08557569, 0.7804873, 0, 0, 0, 1, 1,
1.552043, -0.3007839, 2.983726, 0, 0, 0, 1, 1,
1.564142, -1.428363, 3.047164, 0, 0, 0, 1, 1,
1.580649, 0.9596009, -0.01482416, 0, 0, 0, 1, 1,
1.59933, -0.2978842, 2.944215, 0, 0, 0, 1, 1,
1.608992, 0.8105599, 2.153782, 0, 0, 0, 1, 1,
1.616471, 1.908392, 0.6820968, 1, 1, 1, 1, 1,
1.618484, -1.435717, 2.290623, 1, 1, 1, 1, 1,
1.621479, 0.4449599, 1.907773, 1, 1, 1, 1, 1,
1.632841, -2.246294, 3.818547, 1, 1, 1, 1, 1,
1.644387, 0.220145, -0.2810437, 1, 1, 1, 1, 1,
1.652186, -0.9837711, 1.848208, 1, 1, 1, 1, 1,
1.65243, -1.329777, 2.814324, 1, 1, 1, 1, 1,
1.653411, 1.396637, 0.02171282, 1, 1, 1, 1, 1,
1.656624, -1.322933, 1.359628, 1, 1, 1, 1, 1,
1.658181, 0.5086927, 0.9197182, 1, 1, 1, 1, 1,
1.6768, -0.1169618, 2.40044, 1, 1, 1, 1, 1,
1.695328, 0.3188773, 1.649852, 1, 1, 1, 1, 1,
1.701407, 1.101112, 1.523744, 1, 1, 1, 1, 1,
1.710987, 0.1913296, 2.732372, 1, 1, 1, 1, 1,
1.711719, 1.207187, 0.5091224, 1, 1, 1, 1, 1,
1.729395, -0.6491969, 1.77958, 0, 0, 1, 1, 1,
1.729802, 0.5004616, 1.878027, 1, 0, 0, 1, 1,
1.733793, 0.597681, 0.8213344, 1, 0, 0, 1, 1,
1.737775, 3.1366, 1.131125, 1, 0, 0, 1, 1,
1.739686, 0.1488668, -0.1674604, 1, 0, 0, 1, 1,
1.745985, -1.583932, 4.486868, 1, 0, 0, 1, 1,
1.780014, 0.1236973, 1.305111, 0, 0, 0, 1, 1,
1.788053, -0.8189145, 2.089731, 0, 0, 0, 1, 1,
1.791675, -1.356665, 2.131338, 0, 0, 0, 1, 1,
1.796518, 1.289497, 0.2588843, 0, 0, 0, 1, 1,
1.819179, 0.2661406, 3.207735, 0, 0, 0, 1, 1,
1.82085, -1.270524, 3.171799, 0, 0, 0, 1, 1,
1.831599, -0.1130435, 3.360152, 0, 0, 0, 1, 1,
1.832489, -1.709217, 3.268889, 1, 1, 1, 1, 1,
1.870339, 1.647959, 1.217487, 1, 1, 1, 1, 1,
1.871984, 0.05317568, 0.9289197, 1, 1, 1, 1, 1,
1.874056, -0.4754124, 3.592511, 1, 1, 1, 1, 1,
1.890721, 0.1848871, 2.132252, 1, 1, 1, 1, 1,
1.919731, 0.2856496, 0.4330635, 1, 1, 1, 1, 1,
1.924588, -0.8963411, 4.575896, 1, 1, 1, 1, 1,
1.927644, 1.582479, 0.3761911, 1, 1, 1, 1, 1,
1.94078, 0.546936, 1.423814, 1, 1, 1, 1, 1,
1.949319, 0.2506046, 1.541853, 1, 1, 1, 1, 1,
1.957214, -0.6558835, 0.949976, 1, 1, 1, 1, 1,
1.967537, -0.8338589, 1.269356, 1, 1, 1, 1, 1,
2.001904, 0.5981439, 1.29542, 1, 1, 1, 1, 1,
2.029756, -0.2239283, 0.2682528, 1, 1, 1, 1, 1,
2.03016, -1.413162, 1.612689, 1, 1, 1, 1, 1,
2.039765, 1.184872, 2.041944, 0, 0, 1, 1, 1,
2.062576, -1.52033, 3.103045, 1, 0, 0, 1, 1,
2.081627, 0.5629832, 1.321059, 1, 0, 0, 1, 1,
2.088367, 1.784473, -0.01747224, 1, 0, 0, 1, 1,
2.094024, -1.631846, 2.049376, 1, 0, 0, 1, 1,
2.095591, -0.8380744, 2.541939, 1, 0, 0, 1, 1,
2.145947, 0.9835712, 0.4471871, 0, 0, 0, 1, 1,
2.21902, 1.185892, -0.4660779, 0, 0, 0, 1, 1,
2.278971, -0.3177017, 0.4466355, 0, 0, 0, 1, 1,
2.379673, 0.09755959, 1.657004, 0, 0, 0, 1, 1,
2.40291, -1.32795, 3.592483, 0, 0, 0, 1, 1,
2.455751, 0.2375891, 0.2106744, 0, 0, 0, 1, 1,
2.460596, -0.3978145, 1.182453, 0, 0, 0, 1, 1,
2.486416, -1.010152, 2.49915, 1, 1, 1, 1, 1,
2.498291, 1.458169, 1.762977, 1, 1, 1, 1, 1,
2.498609, 0.1120589, 1.691078, 1, 1, 1, 1, 1,
2.54124, 1.576268, 1.005014, 1, 1, 1, 1, 1,
2.619048, 1.800048, 2.306387, 1, 1, 1, 1, 1,
2.696535, 0.9272793, 1.269934, 1, 1, 1, 1, 1,
2.712656, -0.1419013, 2.889513, 1, 1, 1, 1, 1
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
var radius = 9.050796;
var distance = 31.79053;
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
mvMatrix.translate( -0.04333782, 0.318013, -0.4095337 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.79053);
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
