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
-2.887859, -0.05363168, -0.6272509, 1, 0, 0, 1,
-2.779022, -0.2179978, -0.9372461, 1, 0.007843138, 0, 1,
-2.654868, -0.5757954, -0.5459161, 1, 0.01176471, 0, 1,
-2.606614, 1.344191, -1.049042, 1, 0.01960784, 0, 1,
-2.552115, 0.7214827, -1.077159, 1, 0.02352941, 0, 1,
-2.497484, 1.457688, -1.090582, 1, 0.03137255, 0, 1,
-2.426429, -0.3866091, -1.929535, 1, 0.03529412, 0, 1,
-2.417515, 0.2910603, 0.495651, 1, 0.04313726, 0, 1,
-2.381128, 1.658878, -1.844913, 1, 0.04705882, 0, 1,
-2.295598, 2.25335, -1.452412, 1, 0.05490196, 0, 1,
-2.294069, 0.3010131, -1.928963, 1, 0.05882353, 0, 1,
-2.231633, -0.7951244, -1.159881, 1, 0.06666667, 0, 1,
-2.229974, -1.223939, -2.364249, 1, 0.07058824, 0, 1,
-2.227312, 0.6801183, -1.833519, 1, 0.07843138, 0, 1,
-2.200809, -0.1438459, -0.4822424, 1, 0.08235294, 0, 1,
-2.199607, 0.3565182, -2.219159, 1, 0.09019608, 0, 1,
-2.174458, 0.4401356, -1.018597, 1, 0.09411765, 0, 1,
-2.007573, -0.2481203, -4.152302, 1, 0.1019608, 0, 1,
-2.005268, -1.11775, -2.465535, 1, 0.1098039, 0, 1,
-2.000772, -0.848875, -0.5973687, 1, 0.1137255, 0, 1,
-2.000215, 0.05441409, -2.221665, 1, 0.1215686, 0, 1,
-1.979114, -0.6762058, -1.545359, 1, 0.1254902, 0, 1,
-1.97894, -0.99898, -4.172983, 1, 0.1333333, 0, 1,
-1.959542, -0.6298213, -2.923766, 1, 0.1372549, 0, 1,
-1.953244, -0.6212211, -2.407566, 1, 0.145098, 0, 1,
-1.909804, -0.7278504, -0.4844779, 1, 0.1490196, 0, 1,
-1.888154, -2.141215, -1.830199, 1, 0.1568628, 0, 1,
-1.886275, -0.08740386, -1.07353, 1, 0.1607843, 0, 1,
-1.862713, 1.450366, -2.355517, 1, 0.1686275, 0, 1,
-1.852597, 2.58927, -0.2362632, 1, 0.172549, 0, 1,
-1.850818, 0.6149963, -1.364099, 1, 0.1803922, 0, 1,
-1.841293, -0.05513247, -2.231648, 1, 0.1843137, 0, 1,
-1.838805, -0.07168923, -0.5525476, 1, 0.1921569, 0, 1,
-1.833436, -2.936076, -3.080843, 1, 0.1960784, 0, 1,
-1.817433, -0.08001456, -3.597357, 1, 0.2039216, 0, 1,
-1.815979, -0.07871086, -1.750272, 1, 0.2117647, 0, 1,
-1.795125, 0.1345666, 0.03009192, 1, 0.2156863, 0, 1,
-1.793347, -1.050961, -2.658913, 1, 0.2235294, 0, 1,
-1.789045, 1.402763, -0.8883137, 1, 0.227451, 0, 1,
-1.724803, 0.7995713, -1.448221, 1, 0.2352941, 0, 1,
-1.721, 0.06982616, -1.882858, 1, 0.2392157, 0, 1,
-1.712513, -0.4752645, -2.798537, 1, 0.2470588, 0, 1,
-1.70584, 0.9838362, -0.6113163, 1, 0.2509804, 0, 1,
-1.6997, 1.00104, -0.2338708, 1, 0.2588235, 0, 1,
-1.694115, 0.7298457, 0.08484692, 1, 0.2627451, 0, 1,
-1.681237, -0.05869617, -0.3456168, 1, 0.2705882, 0, 1,
-1.667935, -1.787841, -3.493861, 1, 0.2745098, 0, 1,
-1.664969, -0.1527968, -1.471079, 1, 0.282353, 0, 1,
-1.663653, -1.013366, -1.586549, 1, 0.2862745, 0, 1,
-1.64988, 0.896363, 0.8736338, 1, 0.2941177, 0, 1,
-1.648017, -0.9703352, -2.42764, 1, 0.3019608, 0, 1,
-1.645395, -0.4336432, -2.977771, 1, 0.3058824, 0, 1,
-1.626294, 0.1174141, -0.8334108, 1, 0.3137255, 0, 1,
-1.622333, 0.2583699, -0.3007514, 1, 0.3176471, 0, 1,
-1.612708, -0.348854, -2.090122, 1, 0.3254902, 0, 1,
-1.607332, 0.5765992, -1.722805, 1, 0.3294118, 0, 1,
-1.606645, -1.410756, -2.412302, 1, 0.3372549, 0, 1,
-1.604123, 0.9184866, -0.7831513, 1, 0.3411765, 0, 1,
-1.598809, -0.7274141, -2.133668, 1, 0.3490196, 0, 1,
-1.590037, 0.8628184, -0.8089194, 1, 0.3529412, 0, 1,
-1.586287, -1.436688, -2.420255, 1, 0.3607843, 0, 1,
-1.57678, 1.185673, -2.261321, 1, 0.3647059, 0, 1,
-1.573759, -0.4927003, -2.016326, 1, 0.372549, 0, 1,
-1.562163, -0.7222899, -3.399601, 1, 0.3764706, 0, 1,
-1.562081, -0.8945032, -2.161241, 1, 0.3843137, 0, 1,
-1.560943, -1.080525, -1.848855, 1, 0.3882353, 0, 1,
-1.555618, 0.1105702, -1.493462, 1, 0.3960784, 0, 1,
-1.548724, 1.292468, -0.3712312, 1, 0.4039216, 0, 1,
-1.543618, -0.8730522, -1.918634, 1, 0.4078431, 0, 1,
-1.541877, -0.455631, -1.184141, 1, 0.4156863, 0, 1,
-1.540077, -1.30985, -1.858612, 1, 0.4196078, 0, 1,
-1.533969, -1.455885, -1.815456, 1, 0.427451, 0, 1,
-1.524037, -1.184301, -2.079217, 1, 0.4313726, 0, 1,
-1.518097, 0.9704463, 0.0281437, 1, 0.4392157, 0, 1,
-1.51527, 0.6296086, -0.9477429, 1, 0.4431373, 0, 1,
-1.502558, -0.2533568, -0.961385, 1, 0.4509804, 0, 1,
-1.48792, 1.593172, -1.384855, 1, 0.454902, 0, 1,
-1.483491, -0.355741, -2.019976, 1, 0.4627451, 0, 1,
-1.477854, 1.660475, -2.999527, 1, 0.4666667, 0, 1,
-1.463122, 0.6985744, 0.3867067, 1, 0.4745098, 0, 1,
-1.458658, 0.9577026, -0.8396021, 1, 0.4784314, 0, 1,
-1.432531, 0.8230889, -1.772032, 1, 0.4862745, 0, 1,
-1.406887, 0.06386933, -0.3820553, 1, 0.4901961, 0, 1,
-1.40022, -0.3236278, -0.9747733, 1, 0.4980392, 0, 1,
-1.396909, -0.9102307, -1.324838, 1, 0.5058824, 0, 1,
-1.385762, 0.4959021, -1.074142, 1, 0.509804, 0, 1,
-1.37602, 1.419984, 1.290968, 1, 0.5176471, 0, 1,
-1.371112, 0.9999577, 0.9484125, 1, 0.5215687, 0, 1,
-1.362517, -0.05893632, -3.355213, 1, 0.5294118, 0, 1,
-1.362332, -0.1822021, -3.000669, 1, 0.5333334, 0, 1,
-1.342835, 0.2529832, -2.541959, 1, 0.5411765, 0, 1,
-1.33697, -1.273483, -2.836562, 1, 0.5450981, 0, 1,
-1.321156, -0.2740404, -0.9640406, 1, 0.5529412, 0, 1,
-1.320299, 1.15284, -2.538235, 1, 0.5568628, 0, 1,
-1.306994, -0.6414714, -1.790319, 1, 0.5647059, 0, 1,
-1.306237, -0.637527, -2.889805, 1, 0.5686275, 0, 1,
-1.30506, -0.3418521, -3.641026, 1, 0.5764706, 0, 1,
-1.302148, -0.3274907, -2.375747, 1, 0.5803922, 0, 1,
-1.287598, -0.7026797, -2.556438, 1, 0.5882353, 0, 1,
-1.267759, -1.43249, -1.321501, 1, 0.5921569, 0, 1,
-1.265502, 0.444629, -3.220613, 1, 0.6, 0, 1,
-1.258511, -1.298361, -1.711172, 1, 0.6078432, 0, 1,
-1.254488, -1.048332, -3.041799, 1, 0.6117647, 0, 1,
-1.251084, -0.5796266, -1.873054, 1, 0.6196079, 0, 1,
-1.251082, 0.4538904, -2.092119, 1, 0.6235294, 0, 1,
-1.245399, 0.3226742, -1.114927, 1, 0.6313726, 0, 1,
-1.241607, -0.1365768, -1.172534, 1, 0.6352941, 0, 1,
-1.23543, -1.504688, -3.28228, 1, 0.6431373, 0, 1,
-1.228596, -1.055643, -2.672931, 1, 0.6470588, 0, 1,
-1.220879, 0.2155208, -1.84348, 1, 0.654902, 0, 1,
-1.215356, -1.424597, -1.794885, 1, 0.6588235, 0, 1,
-1.214429, 1.686695, -0.7093087, 1, 0.6666667, 0, 1,
-1.213208, 0.3782642, 1.048191, 1, 0.6705883, 0, 1,
-1.201133, -0.5794545, -1.954386, 1, 0.6784314, 0, 1,
-1.193359, -0.1369659, -1.018821, 1, 0.682353, 0, 1,
-1.192147, 0.6689802, -1.613652, 1, 0.6901961, 0, 1,
-1.184151, -0.4968186, -1.500002, 1, 0.6941177, 0, 1,
-1.179601, 0.2543082, -2.700283, 1, 0.7019608, 0, 1,
-1.177513, -6.820844e-05, -1.59831, 1, 0.7098039, 0, 1,
-1.174504, 0.6345702, -0.9580662, 1, 0.7137255, 0, 1,
-1.172007, 0.2871626, -0.6060393, 1, 0.7215686, 0, 1,
-1.170135, -0.8787993, -2.386421, 1, 0.7254902, 0, 1,
-1.167337, 1.461336, 0.06865352, 1, 0.7333333, 0, 1,
-1.163329, 1.177929, 0.9030102, 1, 0.7372549, 0, 1,
-1.157547, 0.1681302, -0.4272564, 1, 0.7450981, 0, 1,
-1.150551, 1.515869, -0.6529509, 1, 0.7490196, 0, 1,
-1.149655, 1.079364, -3.606456, 1, 0.7568628, 0, 1,
-1.139238, 0.9608523, -3.034441, 1, 0.7607843, 0, 1,
-1.128449, 0.6337427, -1.756738, 1, 0.7686275, 0, 1,
-1.125954, 0.2617857, -0.3746946, 1, 0.772549, 0, 1,
-1.106089, 0.142177, -1.376879, 1, 0.7803922, 0, 1,
-1.105421, -1.136011, -2.706382, 1, 0.7843137, 0, 1,
-1.104553, 0.4335801, -0.04301927, 1, 0.7921569, 0, 1,
-1.10426, 0.08785097, -2.032906, 1, 0.7960784, 0, 1,
-1.103401, 1.724269, -0.4441023, 1, 0.8039216, 0, 1,
-1.10107, 1.701606, -0.1385604, 1, 0.8117647, 0, 1,
-1.09849, -1.974445, -2.929729, 1, 0.8156863, 0, 1,
-1.093614, -0.5348801, -2.657354, 1, 0.8235294, 0, 1,
-1.077304, 0.4322408, -2.963089, 1, 0.827451, 0, 1,
-1.075167, 0.2226076, -1.586001, 1, 0.8352941, 0, 1,
-1.06611, 0.7178452, -3.095781, 1, 0.8392157, 0, 1,
-1.065771, 0.9779598, -0.02439888, 1, 0.8470588, 0, 1,
-1.063597, 0.4773334, -0.03989337, 1, 0.8509804, 0, 1,
-1.063426, 0.4974191, -1.649158, 1, 0.8588235, 0, 1,
-1.060095, -1.560977, -3.252579, 1, 0.8627451, 0, 1,
-1.059429, 1.107245, -1.485, 1, 0.8705882, 0, 1,
-1.04429, -0.3978429, -2.874544, 1, 0.8745098, 0, 1,
-1.039928, 0.02059354, -3.378246, 1, 0.8823529, 0, 1,
-1.036409, 0.802819, -0.3093115, 1, 0.8862745, 0, 1,
-1.03555, 0.9052865, -2.386309, 1, 0.8941177, 0, 1,
-1.029347, -0.741243, -2.407149, 1, 0.8980392, 0, 1,
-1.025984, -0.02472857, -0.7402578, 1, 0.9058824, 0, 1,
-1.012784, 0.4931366, -2.484253, 1, 0.9137255, 0, 1,
-1.006434, 0.5354809, -1.288884, 1, 0.9176471, 0, 1,
-1.006318, -0.6047763, -1.962695, 1, 0.9254902, 0, 1,
-0.9991351, 0.5094316, -1.037011, 1, 0.9294118, 0, 1,
-0.9971329, -1.587882, -2.102664, 1, 0.9372549, 0, 1,
-0.9944792, -1.680479, -2.98174, 1, 0.9411765, 0, 1,
-0.9836172, 1.577646, -0.3308288, 1, 0.9490196, 0, 1,
-0.9827393, -0.5808442, -4.452022, 1, 0.9529412, 0, 1,
-0.9813329, 1.091703, -1.649447, 1, 0.9607843, 0, 1,
-0.97729, -0.7803399, -2.794111, 1, 0.9647059, 0, 1,
-0.9749494, -1.073462, -2.343768, 1, 0.972549, 0, 1,
-0.9748375, -0.3298974, -1.485912, 1, 0.9764706, 0, 1,
-0.9732733, -0.153683, -3.230495, 1, 0.9843137, 0, 1,
-0.972805, 0.5690272, -0.5767643, 1, 0.9882353, 0, 1,
-0.9716717, 0.7780949, -1.316056, 1, 0.9960784, 0, 1,
-0.9708332, -0.6167389, -2.582331, 0.9960784, 1, 0, 1,
-0.9703475, 0.9290424, -1.640435, 0.9921569, 1, 0, 1,
-0.9660196, -0.2172807, -2.110291, 0.9843137, 1, 0, 1,
-0.9600663, -0.2801479, -1.552949, 0.9803922, 1, 0, 1,
-0.9591916, -0.216449, -1.4336, 0.972549, 1, 0, 1,
-0.9588305, 0.2219692, -3.683924, 0.9686275, 1, 0, 1,
-0.9504052, 0.5730678, -1.731954, 0.9607843, 1, 0, 1,
-0.944635, 0.04791883, -1.408294, 0.9568627, 1, 0, 1,
-0.9434317, 0.5322004, -1.099668, 0.9490196, 1, 0, 1,
-0.9416862, -0.838587, -4.265921, 0.945098, 1, 0, 1,
-0.937573, 0.6456697, -1.155926, 0.9372549, 1, 0, 1,
-0.9373927, 0.0002402432, 0.8667746, 0.9333333, 1, 0, 1,
-0.9354618, -0.9327522, -2.998908, 0.9254902, 1, 0, 1,
-0.9301621, 0.8861584, -1.420106, 0.9215686, 1, 0, 1,
-0.9280741, -1.185732, -2.902301, 0.9137255, 1, 0, 1,
-0.9236122, -0.006303992, -0.3744666, 0.9098039, 1, 0, 1,
-0.9133883, -1.495628, -2.816658, 0.9019608, 1, 0, 1,
-0.9122325, 1.014205, -1.42951, 0.8941177, 1, 0, 1,
-0.9054492, 1.629413, -0.7916369, 0.8901961, 1, 0, 1,
-0.9028823, -0.843011, -3.341401, 0.8823529, 1, 0, 1,
-0.8990532, 1.185049, 0.4642411, 0.8784314, 1, 0, 1,
-0.8955657, -1.871372, -3.727201, 0.8705882, 1, 0, 1,
-0.8815618, -0.3434796, -0.1874931, 0.8666667, 1, 0, 1,
-0.881244, 0.4809789, -1.039235, 0.8588235, 1, 0, 1,
-0.8802471, 0.3761551, -1.082489, 0.854902, 1, 0, 1,
-0.878495, -0.5186647, -0.5321509, 0.8470588, 1, 0, 1,
-0.8730913, -0.6306449, -0.2736052, 0.8431373, 1, 0, 1,
-0.8727708, -0.0008807488, -0.3632191, 0.8352941, 1, 0, 1,
-0.8692298, 0.319057, -1.594531, 0.8313726, 1, 0, 1,
-0.8681467, 0.6682004, -1.8356, 0.8235294, 1, 0, 1,
-0.8675784, -0.3550342, -3.043446, 0.8196079, 1, 0, 1,
-0.8637571, -0.4950981, -2.621514, 0.8117647, 1, 0, 1,
-0.851077, -0.4285629, -2.121862, 0.8078431, 1, 0, 1,
-0.84715, 1.201879, -1.146619, 0.8, 1, 0, 1,
-0.8435385, -0.3977697, -1.945481, 0.7921569, 1, 0, 1,
-0.8321913, 0.7579848, 0.1588639, 0.7882353, 1, 0, 1,
-0.8321254, 0.736865, -0.1468032, 0.7803922, 1, 0, 1,
-0.8294931, 1.001072, -1.368792, 0.7764706, 1, 0, 1,
-0.8230807, -1.169218, -1.140759, 0.7686275, 1, 0, 1,
-0.8229324, -0.3786578, -0.289168, 0.7647059, 1, 0, 1,
-0.8179764, 0.04685866, -1.044097, 0.7568628, 1, 0, 1,
-0.8095887, 0.4814467, -1.516845, 0.7529412, 1, 0, 1,
-0.8080535, 0.4283132, -0.61102, 0.7450981, 1, 0, 1,
-0.8025389, -0.1891384, -2.121998, 0.7411765, 1, 0, 1,
-0.7987395, -2.165286, -3.953432, 0.7333333, 1, 0, 1,
-0.7939373, -1.173327, -1.279306, 0.7294118, 1, 0, 1,
-0.7934566, 0.153535, 0.2861197, 0.7215686, 1, 0, 1,
-0.7918645, 1.562372, 0.09417715, 0.7176471, 1, 0, 1,
-0.7905025, 1.281017, 0.4012802, 0.7098039, 1, 0, 1,
-0.7902811, 0.3846558, -1.843369, 0.7058824, 1, 0, 1,
-0.790257, 0.842453, -2.202943, 0.6980392, 1, 0, 1,
-0.7889224, -0.6216827, -2.813206, 0.6901961, 1, 0, 1,
-0.7886657, 0.1043433, -1.577155, 0.6862745, 1, 0, 1,
-0.7833701, -0.9807727, -1.462247, 0.6784314, 1, 0, 1,
-0.7816373, 0.7726827, -1.502145, 0.6745098, 1, 0, 1,
-0.7808834, 1.850505, -0.02183685, 0.6666667, 1, 0, 1,
-0.7779601, -3.345887, -3.005441, 0.6627451, 1, 0, 1,
-0.7750043, 0.5357695, -0.2294928, 0.654902, 1, 0, 1,
-0.7738776, 0.3474056, -2.153141, 0.6509804, 1, 0, 1,
-0.7715886, 0.4442101, -0.7497848, 0.6431373, 1, 0, 1,
-0.7688468, -0.638366, -0.9696192, 0.6392157, 1, 0, 1,
-0.7660003, -0.148485, -2.151744, 0.6313726, 1, 0, 1,
-0.7653904, 2.181396, -0.2329015, 0.627451, 1, 0, 1,
-0.7613204, 0.04150232, -2.645339, 0.6196079, 1, 0, 1,
-0.7604762, -0.04504825, -1.996622, 0.6156863, 1, 0, 1,
-0.7586402, 0.617892, -0.2621697, 0.6078432, 1, 0, 1,
-0.7487918, -1.094845, -2.497015, 0.6039216, 1, 0, 1,
-0.7431106, -1.991156, -2.481688, 0.5960785, 1, 0, 1,
-0.7410107, 0.01862204, -1.611254, 0.5882353, 1, 0, 1,
-0.7404987, 0.2809051, -2.400396, 0.5843138, 1, 0, 1,
-0.736509, -1.326804, -1.419751, 0.5764706, 1, 0, 1,
-0.7363847, 1.497718, -0.4276682, 0.572549, 1, 0, 1,
-0.7317756, -0.8508425, -1.447091, 0.5647059, 1, 0, 1,
-0.7305017, 0.3201937, -0.3188565, 0.5607843, 1, 0, 1,
-0.7253538, 0.5035282, 0.06938595, 0.5529412, 1, 0, 1,
-0.7224011, 1.183052, -0.6382391, 0.5490196, 1, 0, 1,
-0.7187074, 0.6263465, -1.621099, 0.5411765, 1, 0, 1,
-0.7179883, -0.3428304, 0.7539527, 0.5372549, 1, 0, 1,
-0.717415, -1.025356, -3.15343, 0.5294118, 1, 0, 1,
-0.7172686, -0.5020637, -2.368557, 0.5254902, 1, 0, 1,
-0.716761, -0.07744007, -2.369817, 0.5176471, 1, 0, 1,
-0.7160287, -1.295495, -2.370664, 0.5137255, 1, 0, 1,
-0.7116909, 0.4372082, -1.153013, 0.5058824, 1, 0, 1,
-0.7110917, 1.354374, -1.035996, 0.5019608, 1, 0, 1,
-0.7108628, -2.388666, -2.814226, 0.4941176, 1, 0, 1,
-0.7092908, -0.6563092, -1.130897, 0.4862745, 1, 0, 1,
-0.7021755, -0.6296173, -2.663004, 0.4823529, 1, 0, 1,
-0.6992263, -0.3025715, -1.541689, 0.4745098, 1, 0, 1,
-0.6963982, -0.9793549, -1.864395, 0.4705882, 1, 0, 1,
-0.6888209, -0.6694633, -2.99455, 0.4627451, 1, 0, 1,
-0.686415, -0.3410986, -1.239889, 0.4588235, 1, 0, 1,
-0.6825542, 0.02252605, -2.189034, 0.4509804, 1, 0, 1,
-0.6799428, -0.01070566, -1.108541, 0.4470588, 1, 0, 1,
-0.6783721, -1.752271, -5.273466, 0.4392157, 1, 0, 1,
-0.6770576, 1.08483, -0.2102214, 0.4352941, 1, 0, 1,
-0.6713562, 0.833064, 0.1911535, 0.427451, 1, 0, 1,
-0.6709357, 0.7900895, -1.972438, 0.4235294, 1, 0, 1,
-0.6652644, -1.081933, -1.822241, 0.4156863, 1, 0, 1,
-0.6611877, -0.2909068, -3.602091, 0.4117647, 1, 0, 1,
-0.6599649, 1.576872, 0.1653379, 0.4039216, 1, 0, 1,
-0.6567022, -1.006024, -2.984566, 0.3960784, 1, 0, 1,
-0.6528267, -0.02035474, -1.518162, 0.3921569, 1, 0, 1,
-0.6494982, -0.3128305, -3.872145, 0.3843137, 1, 0, 1,
-0.6446838, 0.8190002, 0.525866, 0.3803922, 1, 0, 1,
-0.6251897, -0.2430483, -2.246354, 0.372549, 1, 0, 1,
-0.623659, -1.122892, -2.287646, 0.3686275, 1, 0, 1,
-0.6224502, 1.001381, -2.291881, 0.3607843, 1, 0, 1,
-0.6198835, -1.023045, -2.553988, 0.3568628, 1, 0, 1,
-0.6194383, 1.276713, -2.194812, 0.3490196, 1, 0, 1,
-0.6193344, -0.866272, -1.475078, 0.345098, 1, 0, 1,
-0.6091461, 1.446166, -1.840938, 0.3372549, 1, 0, 1,
-0.6077925, 0.782849, -1.372354, 0.3333333, 1, 0, 1,
-0.6075731, -0.1820103, -3.110902, 0.3254902, 1, 0, 1,
-0.6074879, 0.4711351, -1.181689, 0.3215686, 1, 0, 1,
-0.6051182, 0.1656627, -1.686029, 0.3137255, 1, 0, 1,
-0.6000026, -0.4782569, -3.182903, 0.3098039, 1, 0, 1,
-0.5952708, -0.2706436, -1.948669, 0.3019608, 1, 0, 1,
-0.5925673, 1.645146, -1.866171, 0.2941177, 1, 0, 1,
-0.5925201, 0.9187731, -2.034133, 0.2901961, 1, 0, 1,
-0.5923618, -1.080287, -1.383875, 0.282353, 1, 0, 1,
-0.591971, -2.14238, -3.46253, 0.2784314, 1, 0, 1,
-0.5873169, 2.07804, -2.925532, 0.2705882, 1, 0, 1,
-0.5792701, 0.8525419, -0.5564489, 0.2666667, 1, 0, 1,
-0.5785441, -1.062994, -5.124867, 0.2588235, 1, 0, 1,
-0.5762072, 1.739204, -1.847198, 0.254902, 1, 0, 1,
-0.5757082, -0.1347635, -1.307388, 0.2470588, 1, 0, 1,
-0.5726566, 1.380353, -0.3048003, 0.2431373, 1, 0, 1,
-0.5689788, -0.6357411, -3.370934, 0.2352941, 1, 0, 1,
-0.5675457, -0.6745214, -3.644264, 0.2313726, 1, 0, 1,
-0.5652057, 1.252774, 0.4101087, 0.2235294, 1, 0, 1,
-0.5643496, 0.3134802, 0.1830264, 0.2196078, 1, 0, 1,
-0.5641413, -0.3729838, -1.664566, 0.2117647, 1, 0, 1,
-0.5606708, 1.971313, 0.2198268, 0.2078431, 1, 0, 1,
-0.5521532, 0.161541, -1.77844, 0.2, 1, 0, 1,
-0.5493082, -1.115054, -3.853969, 0.1921569, 1, 0, 1,
-0.5483795, 2.018837, -0.877225, 0.1882353, 1, 0, 1,
-0.5477104, 0.4868801, -0.8527422, 0.1803922, 1, 0, 1,
-0.5447831, 0.3894269, -2.037914, 0.1764706, 1, 0, 1,
-0.540578, 0.276851, -0.6410311, 0.1686275, 1, 0, 1,
-0.5354466, -1.855225, -3.196862, 0.1647059, 1, 0, 1,
-0.5349613, -0.7723227, -3.809937, 0.1568628, 1, 0, 1,
-0.5345303, -1.331342, -2.474679, 0.1529412, 1, 0, 1,
-0.5338283, -0.001339149, -2.701782, 0.145098, 1, 0, 1,
-0.5308293, 0.3804722, -1.42852, 0.1411765, 1, 0, 1,
-0.5272074, -1.031517, -3.129231, 0.1333333, 1, 0, 1,
-0.5230426, -0.3330637, -1.514064, 0.1294118, 1, 0, 1,
-0.5214757, -0.1467661, -2.046601, 0.1215686, 1, 0, 1,
-0.5199072, -0.08496141, -2.333148, 0.1176471, 1, 0, 1,
-0.5165644, 0.5189527, 0.5171835, 0.1098039, 1, 0, 1,
-0.5140085, -0.6080154, -2.758075, 0.1058824, 1, 0, 1,
-0.5126594, 0.05408155, -2.101938, 0.09803922, 1, 0, 1,
-0.5064038, -0.1163736, -2.185917, 0.09019608, 1, 0, 1,
-0.5034964, -0.3807434, -2.213019, 0.08627451, 1, 0, 1,
-0.4990421, 0.4378048, 2.788661, 0.07843138, 1, 0, 1,
-0.4974625, 0.371157, -1.187846, 0.07450981, 1, 0, 1,
-0.4919498, -0.4488598, -2.165518, 0.06666667, 1, 0, 1,
-0.4915254, -0.4734345, -1.989644, 0.0627451, 1, 0, 1,
-0.4896054, 0.4696585, 0.1562818, 0.05490196, 1, 0, 1,
-0.4891911, 0.1889457, -1.988477, 0.05098039, 1, 0, 1,
-0.4873858, 0.4912652, -0.8622565, 0.04313726, 1, 0, 1,
-0.4784106, -0.9256814, -3.806914, 0.03921569, 1, 0, 1,
-0.4776542, 0.6034562, -1.064595, 0.03137255, 1, 0, 1,
-0.4649687, 0.7996983, 0.7937558, 0.02745098, 1, 0, 1,
-0.4632389, -1.093563, -2.32049, 0.01960784, 1, 0, 1,
-0.4561704, -0.838966, -2.086123, 0.01568628, 1, 0, 1,
-0.4533211, 0.4828689, -0.6506862, 0.007843138, 1, 0, 1,
-0.450451, -0.5903316, -4.094376, 0.003921569, 1, 0, 1,
-0.4503895, 1.173555, 0.214075, 0, 1, 0.003921569, 1,
-0.4485995, 1.258311, -1.846385, 0, 1, 0.01176471, 1,
-0.4476245, -1.496666, -3.285075, 0, 1, 0.01568628, 1,
-0.4464326, 2.112235, -0.5826753, 0, 1, 0.02352941, 1,
-0.4424078, -0.5230655, -4.721519, 0, 1, 0.02745098, 1,
-0.4422505, 0.0053969, -1.651913, 0, 1, 0.03529412, 1,
-0.4269558, -1.340966, -4.06426, 0, 1, 0.03921569, 1,
-0.4265338, -0.4614256, -2.09037, 0, 1, 0.04705882, 1,
-0.426162, 0.1738601, -2.732263, 0, 1, 0.05098039, 1,
-0.4252232, -0.8778092, -3.369532, 0, 1, 0.05882353, 1,
-0.4234559, 0.006151884, -3.100375, 0, 1, 0.0627451, 1,
-0.419635, -0.1351257, -2.877548, 0, 1, 0.07058824, 1,
-0.4168197, -0.1526912, -2.077526, 0, 1, 0.07450981, 1,
-0.4167037, -0.3701306, -2.687259, 0, 1, 0.08235294, 1,
-0.4093123, -1.196106, -4.444922, 0, 1, 0.08627451, 1,
-0.4077984, -0.2838759, -2.735136, 0, 1, 0.09411765, 1,
-0.4074352, -0.1730775, -2.163175, 0, 1, 0.1019608, 1,
-0.4072493, 1.792874, -0.2907304, 0, 1, 0.1058824, 1,
-0.4070388, 0.4114852, -2.220991, 0, 1, 0.1137255, 1,
-0.4059209, 2.28933, 0.9278231, 0, 1, 0.1176471, 1,
-0.4040703, -0.7269323, -2.103319, 0, 1, 0.1254902, 1,
-0.4036092, 0.04682395, -1.814315, 0, 1, 0.1294118, 1,
-0.4023437, -1.12018, -2.3643, 0, 1, 0.1372549, 1,
-0.3998697, -0.1155668, -1.255939, 0, 1, 0.1411765, 1,
-0.3997596, 0.1326694, -2.700092, 0, 1, 0.1490196, 1,
-0.3978011, 1.618382, 0.1728165, 0, 1, 0.1529412, 1,
-0.396718, -0.3485964, -2.825284, 0, 1, 0.1607843, 1,
-0.3957851, -0.9196773, -3.03035, 0, 1, 0.1647059, 1,
-0.3939653, -0.03059221, -0.6851363, 0, 1, 0.172549, 1,
-0.3938787, 0.9990109, -0.2792567, 0, 1, 0.1764706, 1,
-0.3924343, -0.1105524, -2.873737, 0, 1, 0.1843137, 1,
-0.3884743, -0.2916656, -2.331198, 0, 1, 0.1882353, 1,
-0.3804785, 0.3050235, -1.721695, 0, 1, 0.1960784, 1,
-0.3792709, -1.23701, -4.143923, 0, 1, 0.2039216, 1,
-0.3782188, -0.305535, -1.46735, 0, 1, 0.2078431, 1,
-0.37606, 0.3540557, 1.336434, 0, 1, 0.2156863, 1,
-0.3752741, -0.0817503, -3.764834, 0, 1, 0.2196078, 1,
-0.3751647, -1.56396, -4.629996, 0, 1, 0.227451, 1,
-0.3730739, -0.9872717, -1.756901, 0, 1, 0.2313726, 1,
-0.3719815, -0.4929992, -1.669746, 0, 1, 0.2392157, 1,
-0.3709408, 0.6242694, -1.582747, 0, 1, 0.2431373, 1,
-0.364199, -0.9785774, -2.842903, 0, 1, 0.2509804, 1,
-0.3607351, -0.2257458, -3.140152, 0, 1, 0.254902, 1,
-0.3538014, -0.08695412, -2.002546, 0, 1, 0.2627451, 1,
-0.3522561, 0.7497004, -1.571863, 0, 1, 0.2666667, 1,
-0.3511132, -0.2923617, -1.57129, 0, 1, 0.2745098, 1,
-0.3477123, 0.4786193, -0.08430473, 0, 1, 0.2784314, 1,
-0.3458339, 1.214664, -0.2587494, 0, 1, 0.2862745, 1,
-0.3439701, -0.5390137, -2.574032, 0, 1, 0.2901961, 1,
-0.3433993, -0.4793303, -1.918257, 0, 1, 0.2980392, 1,
-0.3432401, -0.001174421, -0.2420339, 0, 1, 0.3058824, 1,
-0.3418396, 0.6090885, -0.263919, 0, 1, 0.3098039, 1,
-0.3395908, 0.4035943, 0.0552735, 0, 1, 0.3176471, 1,
-0.3371104, -0.2273156, -1.834353, 0, 1, 0.3215686, 1,
-0.336967, 1.114604, -0.9356773, 0, 1, 0.3294118, 1,
-0.3359022, -0.7397299, -2.018314, 0, 1, 0.3333333, 1,
-0.3312952, 0.1573807, -3.927428, 0, 1, 0.3411765, 1,
-0.3300935, -0.5494457, -3.394195, 0, 1, 0.345098, 1,
-0.324984, -1.210248, -3.379405, 0, 1, 0.3529412, 1,
-0.3224219, 0.1012821, -1.459344, 0, 1, 0.3568628, 1,
-0.3180765, -1.487435, -1.732484, 0, 1, 0.3647059, 1,
-0.3169314, 0.3698487, 0.2252901, 0, 1, 0.3686275, 1,
-0.3101271, -0.4658281, -4.337212, 0, 1, 0.3764706, 1,
-0.3062958, -0.2464712, -2.550403, 0, 1, 0.3803922, 1,
-0.2985243, 0.3005097, 0.7363696, 0, 1, 0.3882353, 1,
-0.2981046, 0.6825831, 0.1751907, 0, 1, 0.3921569, 1,
-0.2953823, 1.552319, -0.09930479, 0, 1, 0.4, 1,
-0.294881, -0.5589216, -3.038273, 0, 1, 0.4078431, 1,
-0.2942016, 1.054424, 1.185321, 0, 1, 0.4117647, 1,
-0.2935658, 0.833537, -0.1512604, 0, 1, 0.4196078, 1,
-0.2891775, 0.3713679, -1.297694, 0, 1, 0.4235294, 1,
-0.2880176, 0.4976137, 0.4931956, 0, 1, 0.4313726, 1,
-0.2792482, -0.294124, -2.832643, 0, 1, 0.4352941, 1,
-0.2789594, -0.8304635, -3.347852, 0, 1, 0.4431373, 1,
-0.2687266, 1.356352, -0.2943782, 0, 1, 0.4470588, 1,
-0.2647753, -0.1297905, -0.7005343, 0, 1, 0.454902, 1,
-0.2598581, -1.581511, -3.847746, 0, 1, 0.4588235, 1,
-0.2504692, 0.3422152, -1.07699, 0, 1, 0.4666667, 1,
-0.2446202, 1.366897, 1.003875, 0, 1, 0.4705882, 1,
-0.243127, -1.721397, -3.56913, 0, 1, 0.4784314, 1,
-0.2360926, 1.874998, -0.9012533, 0, 1, 0.4823529, 1,
-0.2256068, -1.981282, -3.248898, 0, 1, 0.4901961, 1,
-0.2254015, -0.1883598, -3.505386, 0, 1, 0.4941176, 1,
-0.2195185, 0.2165877, -1.421941, 0, 1, 0.5019608, 1,
-0.2160181, 1.352057, -2.105455, 0, 1, 0.509804, 1,
-0.2145803, 1.589245, -0.4148687, 0, 1, 0.5137255, 1,
-0.2141993, -0.08757208, 0.3515317, 0, 1, 0.5215687, 1,
-0.2114888, 1.282581, 0.0741591, 0, 1, 0.5254902, 1,
-0.2105449, -2.227084, -2.679945, 0, 1, 0.5333334, 1,
-0.2038857, -1.151951, -1.242487, 0, 1, 0.5372549, 1,
-0.2007252, 0.4040879, -0.7547235, 0, 1, 0.5450981, 1,
-0.1981809, -0.4430162, -3.888277, 0, 1, 0.5490196, 1,
-0.1980324, 1.034655, -0.02928752, 0, 1, 0.5568628, 1,
-0.1965527, 1.632684, -0.8602229, 0, 1, 0.5607843, 1,
-0.1957684, 0.1560928, -2.024922, 0, 1, 0.5686275, 1,
-0.1912487, -1.355517, -2.83753, 0, 1, 0.572549, 1,
-0.1899766, 0.1960604, -0.5169954, 0, 1, 0.5803922, 1,
-0.18932, 0.7912452, 0.248479, 0, 1, 0.5843138, 1,
-0.1885069, 1.56982, -0.4019034, 0, 1, 0.5921569, 1,
-0.1877156, -0.4484306, -1.693268, 0, 1, 0.5960785, 1,
-0.1875635, -1.031372, -2.925575, 0, 1, 0.6039216, 1,
-0.1865303, 1.089493, 2.789062, 0, 1, 0.6117647, 1,
-0.1856196, 0.2722084, -0.9719262, 0, 1, 0.6156863, 1,
-0.1808034, 1.30883, 0.8692771, 0, 1, 0.6235294, 1,
-0.1803538, -0.7005029, -2.612751, 0, 1, 0.627451, 1,
-0.1797425, 0.5990325, 0.5175446, 0, 1, 0.6352941, 1,
-0.1765584, 2.250109, -0.4795749, 0, 1, 0.6392157, 1,
-0.1764097, 1.312062, -0.0402253, 0, 1, 0.6470588, 1,
-0.1726592, -0.1002115, -1.489278, 0, 1, 0.6509804, 1,
-0.1665951, -0.8610678, -4.309129, 0, 1, 0.6588235, 1,
-0.1636408, -0.4825518, -3.107572, 0, 1, 0.6627451, 1,
-0.1610735, 1.983304, -0.08872237, 0, 1, 0.6705883, 1,
-0.1598056, -0.3814256, -2.067616, 0, 1, 0.6745098, 1,
-0.1585414, 1.371754, -0.1748217, 0, 1, 0.682353, 1,
-0.1489947, 0.2113931, -0.1395229, 0, 1, 0.6862745, 1,
-0.141075, -0.8817675, -3.001522, 0, 1, 0.6941177, 1,
-0.1404785, -0.792942, -1.917128, 0, 1, 0.7019608, 1,
-0.14034, 0.2139696, -0.8398434, 0, 1, 0.7058824, 1,
-0.1388234, -0.4861546, -3.97665, 0, 1, 0.7137255, 1,
-0.1367979, -0.1124126, -0.6020734, 0, 1, 0.7176471, 1,
-0.1359466, 0.6781909, -0.5835647, 0, 1, 0.7254902, 1,
-0.1344704, 0.7305974, 0.06077131, 0, 1, 0.7294118, 1,
-0.1294867, -1.775271, -2.338768, 0, 1, 0.7372549, 1,
-0.1205179, 0.7201563, 0.2058725, 0, 1, 0.7411765, 1,
-0.1187694, 0.3295327, -0.2861015, 0, 1, 0.7490196, 1,
-0.1158095, -1.259527, -2.694505, 0, 1, 0.7529412, 1,
-0.1147188, 0.749902, -1.873457, 0, 1, 0.7607843, 1,
-0.1139506, 1.089477, -0.01114256, 0, 1, 0.7647059, 1,
-0.1138923, -0.4510586, -1.981306, 0, 1, 0.772549, 1,
-0.1124304, 1.2915, 0.2725968, 0, 1, 0.7764706, 1,
-0.1110956, -2.431857, -1.867633, 0, 1, 0.7843137, 1,
-0.1105776, -1.183897, -3.450549, 0, 1, 0.7882353, 1,
-0.1096147, 1.147313, 0.6473676, 0, 1, 0.7960784, 1,
-0.1070986, -1.387188, -3.098789, 0, 1, 0.8039216, 1,
-0.1067985, 0.5441149, 0.1445526, 0, 1, 0.8078431, 1,
-0.1057149, 0.8583897, -0.7892393, 0, 1, 0.8156863, 1,
-0.1052491, -1.260856, -5.07497, 0, 1, 0.8196079, 1,
-0.1019652, 1.399335, -0.8862317, 0, 1, 0.827451, 1,
-0.09941763, 0.2823256, -0.3330235, 0, 1, 0.8313726, 1,
-0.09586982, -0.9483866, -5.130558, 0, 1, 0.8392157, 1,
-0.0949295, -0.08510078, -2.744926, 0, 1, 0.8431373, 1,
-0.09258787, 1.555302, -0.03732632, 0, 1, 0.8509804, 1,
-0.09082244, -0.4203219, -1.854424, 0, 1, 0.854902, 1,
-0.0891099, -0.4290636, -2.933545, 0, 1, 0.8627451, 1,
-0.08542511, 1.408811, 0.2007906, 0, 1, 0.8666667, 1,
-0.08396345, 0.8091518, 1.414542, 0, 1, 0.8745098, 1,
-0.0839164, 0.7948615, -1.660469, 0, 1, 0.8784314, 1,
-0.08233232, 0.870217, 0.2741307, 0, 1, 0.8862745, 1,
-0.07538565, 0.3472164, 1.130274, 0, 1, 0.8901961, 1,
-0.07498959, -1.066337, -3.338946, 0, 1, 0.8980392, 1,
-0.07213294, 1.534012, 0.2543913, 0, 1, 0.9058824, 1,
-0.07095537, 0.3873864, 1.278713, 0, 1, 0.9098039, 1,
-0.06934214, -1.039721, -3.678031, 0, 1, 0.9176471, 1,
-0.06819813, 0.1926636, -1.539765, 0, 1, 0.9215686, 1,
-0.06209568, 1.955289, 0.7788901, 0, 1, 0.9294118, 1,
-0.06179089, -1.104797, -3.197076, 0, 1, 0.9333333, 1,
-0.06044649, -0.402485, -3.152785, 0, 1, 0.9411765, 1,
-0.05705688, -0.2129193, -2.281379, 0, 1, 0.945098, 1,
-0.05091555, -0.3391084, -3.246096, 0, 1, 0.9529412, 1,
-0.05026224, -1.690967, -3.291866, 0, 1, 0.9568627, 1,
-0.04850383, -1.375558, -1.828525, 0, 1, 0.9647059, 1,
-0.04291125, 0.01565547, -1.645531, 0, 1, 0.9686275, 1,
-0.04180059, -0.6568382, -3.866455, 0, 1, 0.9764706, 1,
-0.04111097, 1.498866, -0.2123991, 0, 1, 0.9803922, 1,
-0.03694342, -0.2266829, -6.555195, 0, 1, 0.9882353, 1,
-0.02932747, -0.2338896, -2.616684, 0, 1, 0.9921569, 1,
-0.02819481, 0.1450459, -0.935252, 0, 1, 1, 1,
-0.02642443, 0.2421795, 1.082955, 0, 0.9921569, 1, 1,
-0.02508218, -0.06075095, -3.744079, 0, 0.9882353, 1, 1,
-0.02290904, -1.063346, -2.268647, 0, 0.9803922, 1, 1,
-0.02125929, -0.6149517, -5.370507, 0, 0.9764706, 1, 1,
-0.0202163, 0.491736, -0.9639888, 0, 0.9686275, 1, 1,
-0.01933734, -1.778933, -2.498223, 0, 0.9647059, 1, 1,
-0.01441679, 1.525449, -1.065258, 0, 0.9568627, 1, 1,
-0.01406422, -1.144223, -3.242087, 0, 0.9529412, 1, 1,
-0.005043044, -1.108722, -4.433176, 0, 0.945098, 1, 1,
-0.000327784, 1.548432, 0.1260423, 0, 0.9411765, 1, 1,
0.004695409, 0.4321944, 1.15358, 0, 0.9333333, 1, 1,
0.01277797, 0.8774757, 2.405037, 0, 0.9294118, 1, 1,
0.01396659, -0.9050372, 2.168557, 0, 0.9215686, 1, 1,
0.02148145, 0.7332331, -0.6357061, 0, 0.9176471, 1, 1,
0.02257014, 0.03700605, -0.5891552, 0, 0.9098039, 1, 1,
0.02485489, -0.2599591, 3.394182, 0, 0.9058824, 1, 1,
0.02607844, -0.4811257, 3.782774, 0, 0.8980392, 1, 1,
0.02875329, 1.131557, 0.9828517, 0, 0.8901961, 1, 1,
0.02877266, 0.06564154, 1.580565, 0, 0.8862745, 1, 1,
0.03224271, -0.06218021, 3.550135, 0, 0.8784314, 1, 1,
0.03268125, 0.8968268, -0.743229, 0, 0.8745098, 1, 1,
0.03328284, -0.3600512, 0.6498907, 0, 0.8666667, 1, 1,
0.03406922, 0.1492698, -0.5461065, 0, 0.8627451, 1, 1,
0.03692942, 1.245862, -0.8476541, 0, 0.854902, 1, 1,
0.03738159, 0.2273663, 0.2975437, 0, 0.8509804, 1, 1,
0.05161716, -0.4205319, 3.330025, 0, 0.8431373, 1, 1,
0.05189913, 0.04494949, -0.5222165, 0, 0.8392157, 1, 1,
0.05477533, -1.110115, 3.638271, 0, 0.8313726, 1, 1,
0.05489761, 1.025414, 0.2875405, 0, 0.827451, 1, 1,
0.05749813, 0.4923452, -0.003472826, 0, 0.8196079, 1, 1,
0.05792734, 2.339945, 0.5255248, 0, 0.8156863, 1, 1,
0.05847185, 0.5661427, -0.9659354, 0, 0.8078431, 1, 1,
0.05947925, -0.9037258, 2.360288, 0, 0.8039216, 1, 1,
0.0690137, 1.048437, 1.30809, 0, 0.7960784, 1, 1,
0.07363276, -0.5789719, 3.504882, 0, 0.7882353, 1, 1,
0.07464744, 0.9089881, -1.040855, 0, 0.7843137, 1, 1,
0.08978683, -0.8620458, 2.308067, 0, 0.7764706, 1, 1,
0.09451414, 1.42268, 2.739, 0, 0.772549, 1, 1,
0.09853247, 0.6281856, 0.5516863, 0, 0.7647059, 1, 1,
0.1000221, 0.1275459, 0.0364645, 0, 0.7607843, 1, 1,
0.1010797, -0.8155576, 5.380961, 0, 0.7529412, 1, 1,
0.1018457, 0.5195351, 0.6343701, 0, 0.7490196, 1, 1,
0.1025651, -1.343749, 4.126086, 0, 0.7411765, 1, 1,
0.1068018, -2.341922, 4.40923, 0, 0.7372549, 1, 1,
0.1102484, -0.01340264, 2.851699, 0, 0.7294118, 1, 1,
0.1102697, 0.1895235, 1.199712, 0, 0.7254902, 1, 1,
0.1107106, -0.919316, 2.214325, 0, 0.7176471, 1, 1,
0.1202237, 0.6901673, -0.5008726, 0, 0.7137255, 1, 1,
0.1207319, 0.7040423, 0.7295684, 0, 0.7058824, 1, 1,
0.1211975, -0.3537095, 3.740204, 0, 0.6980392, 1, 1,
0.1242287, 1.42471, -1.164024, 0, 0.6941177, 1, 1,
0.1259242, -0.4237884, 4.177423, 0, 0.6862745, 1, 1,
0.1272422, 0.07129671, 1.470598, 0, 0.682353, 1, 1,
0.128414, 0.07553842, 1.336004, 0, 0.6745098, 1, 1,
0.1286555, -1.121526, 2.979469, 0, 0.6705883, 1, 1,
0.1299777, -0.1292329, 3.474099, 0, 0.6627451, 1, 1,
0.1380929, -1.928346, 2.239957, 0, 0.6588235, 1, 1,
0.1480265, 1.287874, 0.2958657, 0, 0.6509804, 1, 1,
0.153498, -0.08915807, 2.134759, 0, 0.6470588, 1, 1,
0.1600116, -0.1294365, 1.582206, 0, 0.6392157, 1, 1,
0.1631498, 1.264587, -0.3436307, 0, 0.6352941, 1, 1,
0.1660531, 0.1799584, 0.7436866, 0, 0.627451, 1, 1,
0.1664305, -2.042849, 3.478416, 0, 0.6235294, 1, 1,
0.1666999, 0.519892, 0.5777441, 0, 0.6156863, 1, 1,
0.1667414, -1.098185, 2.954472, 0, 0.6117647, 1, 1,
0.1674015, -0.763656, 3.777819, 0, 0.6039216, 1, 1,
0.168714, -0.07020815, 3.024242, 0, 0.5960785, 1, 1,
0.1725912, -0.4222677, 3.451844, 0, 0.5921569, 1, 1,
0.1743452, -0.445611, 2.029346, 0, 0.5843138, 1, 1,
0.1772194, 0.05338117, 0.6109651, 0, 0.5803922, 1, 1,
0.177837, 0.9233387, 0.7682492, 0, 0.572549, 1, 1,
0.1780245, -1.035533, 2.726393, 0, 0.5686275, 1, 1,
0.1802286, 0.2035051, 1.509687, 0, 0.5607843, 1, 1,
0.1850582, -0.3334265, 2.657864, 0, 0.5568628, 1, 1,
0.185096, -0.2232889, 1.895744, 0, 0.5490196, 1, 1,
0.1864579, -0.861347, 2.310069, 0, 0.5450981, 1, 1,
0.1882722, 1.490407, 0.9974575, 0, 0.5372549, 1, 1,
0.1922075, -0.07028902, 2.677766, 0, 0.5333334, 1, 1,
0.1947634, 0.5834757, 0.4990137, 0, 0.5254902, 1, 1,
0.1967694, 0.4750068, -0.7874003, 0, 0.5215687, 1, 1,
0.2041882, 0.8162352, 0.3585817, 0, 0.5137255, 1, 1,
0.2059222, 2.283394, -0.2246004, 0, 0.509804, 1, 1,
0.2071617, -0.8999827, 3.229892, 0, 0.5019608, 1, 1,
0.20747, 0.4817664, 1.072182, 0, 0.4941176, 1, 1,
0.2077452, 0.5383013, 0.8302066, 0, 0.4901961, 1, 1,
0.2085088, -0.07341999, 0.7894514, 0, 0.4823529, 1, 1,
0.209865, 0.3412535, 3.000946, 0, 0.4784314, 1, 1,
0.2120576, 0.6564257, 1.334848, 0, 0.4705882, 1, 1,
0.2145841, -0.8065585, 1.524615, 0, 0.4666667, 1, 1,
0.2193339, -1.179797, 1.385914, 0, 0.4588235, 1, 1,
0.2238948, 0.8609948, -1.299212, 0, 0.454902, 1, 1,
0.227911, -1.975503, 5.287879, 0, 0.4470588, 1, 1,
0.2289562, -0.5587537, 3.208207, 0, 0.4431373, 1, 1,
0.232231, 1.037084, 0.5818427, 0, 0.4352941, 1, 1,
0.2372422, -1.449236, 1.86169, 0, 0.4313726, 1, 1,
0.2384849, 0.2452551, 0.156852, 0, 0.4235294, 1, 1,
0.2409848, -1.502401, 4.375577, 0, 0.4196078, 1, 1,
0.2430016, 0.1069062, 2.156865, 0, 0.4117647, 1, 1,
0.2437606, -0.4881229, 2.495777, 0, 0.4078431, 1, 1,
0.2468394, 0.6538685, 0.3469764, 0, 0.4, 1, 1,
0.2471064, 1.28396, 0.291904, 0, 0.3921569, 1, 1,
0.2480749, 0.883399, 1.633371, 0, 0.3882353, 1, 1,
0.2500751, 1.708646, 0.885201, 0, 0.3803922, 1, 1,
0.2509682, 0.09341406, -0.06730638, 0, 0.3764706, 1, 1,
0.2569793, 1.962324, 0.2827441, 0, 0.3686275, 1, 1,
0.2596162, -0.1663759, 3.942448, 0, 0.3647059, 1, 1,
0.2647758, 0.9427091, 1.606269, 0, 0.3568628, 1, 1,
0.2655272, 0.2052328, 0.687235, 0, 0.3529412, 1, 1,
0.2682938, 1.53918, -0.4864559, 0, 0.345098, 1, 1,
0.2696981, -1.434175, 2.64213, 0, 0.3411765, 1, 1,
0.2704441, -0.00190827, 0.8171586, 0, 0.3333333, 1, 1,
0.2714638, 0.7427337, -0.9990408, 0, 0.3294118, 1, 1,
0.2722209, 0.4315058, -1.128253, 0, 0.3215686, 1, 1,
0.2724629, -1.225729, 3.605963, 0, 0.3176471, 1, 1,
0.2751834, -0.5140592, 3.186346, 0, 0.3098039, 1, 1,
0.2811487, -1.173571, 1.884555, 0, 0.3058824, 1, 1,
0.28276, -0.4969338, 3.484912, 0, 0.2980392, 1, 1,
0.284097, 0.5677263, -1.300843, 0, 0.2901961, 1, 1,
0.2864236, -0.5729991, 4.49211, 0, 0.2862745, 1, 1,
0.2931989, -0.6493995, 3.689496, 0, 0.2784314, 1, 1,
0.2967211, -0.8598939, 2.80136, 0, 0.2745098, 1, 1,
0.2985241, -1.929325, 5.085743, 0, 0.2666667, 1, 1,
0.2991024, -0.7960134, 4.965935, 0, 0.2627451, 1, 1,
0.299127, 0.5618746, 0.1399779, 0, 0.254902, 1, 1,
0.3011959, 1.172441, 0.5705356, 0, 0.2509804, 1, 1,
0.3013687, -0.3820742, 2.23137, 0, 0.2431373, 1, 1,
0.3029272, 0.3910384, 2.479836, 0, 0.2392157, 1, 1,
0.3091874, -0.1546415, 4.135675, 0, 0.2313726, 1, 1,
0.3132936, -0.08491375, 2.052262, 0, 0.227451, 1, 1,
0.3168352, 0.4086376, -1.553205, 0, 0.2196078, 1, 1,
0.3269714, 1.212142, -0.6946844, 0, 0.2156863, 1, 1,
0.3369825, 2.781828, -0.3811226, 0, 0.2078431, 1, 1,
0.336991, 0.4668196, 0.1245568, 0, 0.2039216, 1, 1,
0.3532027, -0.5498181, 1.930983, 0, 0.1960784, 1, 1,
0.3560497, -0.3068779, 2.996485, 0, 0.1882353, 1, 1,
0.3600247, -0.2135154, 1.973604, 0, 0.1843137, 1, 1,
0.3616044, 1.775198, 0.2055972, 0, 0.1764706, 1, 1,
0.3624354, -1.099679, 2.338875, 0, 0.172549, 1, 1,
0.3634934, 2.234727, -0.6141819, 0, 0.1647059, 1, 1,
0.3654508, -0.6227137, 2.637007, 0, 0.1607843, 1, 1,
0.3658707, -0.2841747, 2.37782, 0, 0.1529412, 1, 1,
0.3672502, -0.9098375, 2.115763, 0, 0.1490196, 1, 1,
0.3678962, -0.6686928, 1.957086, 0, 0.1411765, 1, 1,
0.3723421, 0.470312, 0.413885, 0, 0.1372549, 1, 1,
0.3775339, 0.6418841, 1.195834, 0, 0.1294118, 1, 1,
0.3794875, -0.858256, 1.886917, 0, 0.1254902, 1, 1,
0.3817853, -1.297225, 1.972398, 0, 0.1176471, 1, 1,
0.3865151, -0.2074154, 1.18883, 0, 0.1137255, 1, 1,
0.3868692, 1.475234, 0.9139322, 0, 0.1058824, 1, 1,
0.3912732, 0.5468385, -1.631252, 0, 0.09803922, 1, 1,
0.4054467, 0.5665447, -0.2697934, 0, 0.09411765, 1, 1,
0.4070152, 0.8530704, 1.697531, 0, 0.08627451, 1, 1,
0.4114837, 1.102023, -0.5198076, 0, 0.08235294, 1, 1,
0.4126049, -0.3212066, -0.02087844, 0, 0.07450981, 1, 1,
0.413922, 0.8560317, 0.414094, 0, 0.07058824, 1, 1,
0.4162272, -0.7329559, 3.735507, 0, 0.0627451, 1, 1,
0.4183514, 0.4022505, -0.5321192, 0, 0.05882353, 1, 1,
0.4215071, -1.136564, 3.877125, 0, 0.05098039, 1, 1,
0.4222954, -0.4620453, -0.1862511, 0, 0.04705882, 1, 1,
0.4230416, 1.564471, 0.295317, 0, 0.03921569, 1, 1,
0.4240985, 1.529237, 0.3483275, 0, 0.03529412, 1, 1,
0.4289771, -0.3258981, 1.418544, 0, 0.02745098, 1, 1,
0.4304163, 1.374826, 0.4735576, 0, 0.02352941, 1, 1,
0.4349878, -0.4318262, 2.304102, 0, 0.01568628, 1, 1,
0.4368338, -0.5613029, 2.954931, 0, 0.01176471, 1, 1,
0.4394959, 2.511454, 0.03179685, 0, 0.003921569, 1, 1,
0.4418598, -0.713757, 4.23256, 0.003921569, 0, 1, 1,
0.4466037, 1.831846, -0.1370093, 0.007843138, 0, 1, 1,
0.4480211, -0.2335108, 1.541028, 0.01568628, 0, 1, 1,
0.4521082, 0.6032672, 0.7518283, 0.01960784, 0, 1, 1,
0.4540741, 1.378401, -0.6706162, 0.02745098, 0, 1, 1,
0.45494, -0.0429318, 2.310879, 0.03137255, 0, 1, 1,
0.4612114, 0.8727831, -0.7799219, 0.03921569, 0, 1, 1,
0.4614064, -0.9041207, 3.240456, 0.04313726, 0, 1, 1,
0.4669515, -0.2899282, 2.811389, 0.05098039, 0, 1, 1,
0.4681361, 0.3559326, 0.6613412, 0.05490196, 0, 1, 1,
0.4682638, -0.7554858, 2.389682, 0.0627451, 0, 1, 1,
0.4708646, 1.221166, -1.216214, 0.06666667, 0, 1, 1,
0.4755196, 0.7854396, -0.2429072, 0.07450981, 0, 1, 1,
0.4763142, -0.1164425, 1.919496, 0.07843138, 0, 1, 1,
0.4765785, 0.08219453, 2.098237, 0.08627451, 0, 1, 1,
0.4769468, -0.4658999, 3.769425, 0.09019608, 0, 1, 1,
0.4823737, 0.1297961, 2.307339, 0.09803922, 0, 1, 1,
0.4832518, 0.9973552, 0.6987767, 0.1058824, 0, 1, 1,
0.4836252, 0.3615662, 1.185772, 0.1098039, 0, 1, 1,
0.4889372, 0.3276211, -0.9228448, 0.1176471, 0, 1, 1,
0.4927999, 1.752391, -0.1302816, 0.1215686, 0, 1, 1,
0.4938342, 1.52963, 1.055978, 0.1294118, 0, 1, 1,
0.4958326, -0.1352485, 3.122018, 0.1333333, 0, 1, 1,
0.4964813, 0.2098126, 0.6731418, 0.1411765, 0, 1, 1,
0.4988247, 0.2028097, 0.4836298, 0.145098, 0, 1, 1,
0.5012436, -0.9794372, 3.473153, 0.1529412, 0, 1, 1,
0.5012829, -0.007371215, 1.695168, 0.1568628, 0, 1, 1,
0.5023029, 1.207752, -0.3278418, 0.1647059, 0, 1, 1,
0.5035123, 0.7226699, -0.59349, 0.1686275, 0, 1, 1,
0.5051565, 0.947572, 0.619787, 0.1764706, 0, 1, 1,
0.5053277, 0.5059009, 2.389086, 0.1803922, 0, 1, 1,
0.5162201, -0.7895709, 2.632309, 0.1882353, 0, 1, 1,
0.5182944, 0.959383, 2.023402, 0.1921569, 0, 1, 1,
0.5207194, 0.2553057, -0.09031145, 0.2, 0, 1, 1,
0.5219465, 0.5200351, -0.3119569, 0.2078431, 0, 1, 1,
0.5231923, 0.3516306, 1.08112, 0.2117647, 0, 1, 1,
0.5261647, 0.5858162, 1.588254, 0.2196078, 0, 1, 1,
0.5264428, 0.4769804, 1.924666, 0.2235294, 0, 1, 1,
0.5290181, 1.496369, -0.05254521, 0.2313726, 0, 1, 1,
0.5307973, 0.8493683, 0.1301588, 0.2352941, 0, 1, 1,
0.5313361, -0.2349961, 2.395956, 0.2431373, 0, 1, 1,
0.5343162, 0.03881147, 0.7967234, 0.2470588, 0, 1, 1,
0.5421446, 0.4795393, 0.2847746, 0.254902, 0, 1, 1,
0.5476428, -1.225601, 2.18461, 0.2588235, 0, 1, 1,
0.5487995, -1.731525, 1.681782, 0.2666667, 0, 1, 1,
0.5499549, 0.5799782, 1.063534, 0.2705882, 0, 1, 1,
0.5500863, -1.156765, 3.20129, 0.2784314, 0, 1, 1,
0.5515433, -0.8023812, 1.709047, 0.282353, 0, 1, 1,
0.5567712, 0.1234426, 2.300546, 0.2901961, 0, 1, 1,
0.5574633, 0.6726611, -1.52168, 0.2941177, 0, 1, 1,
0.5592704, 0.5487404, 1.635089, 0.3019608, 0, 1, 1,
0.5617614, 1.443203, -0.1755905, 0.3098039, 0, 1, 1,
0.5622019, -0.3224141, 3.365303, 0.3137255, 0, 1, 1,
0.564981, -0.1541876, 2.225239, 0.3215686, 0, 1, 1,
0.5712007, -1.080608, 2.419475, 0.3254902, 0, 1, 1,
0.5741746, 0.542992, 0.6933368, 0.3333333, 0, 1, 1,
0.5746499, -0.4369962, 0.6841965, 0.3372549, 0, 1, 1,
0.5758847, 0.3168401, 1.592367, 0.345098, 0, 1, 1,
0.5811616, 0.2851677, -0.4945886, 0.3490196, 0, 1, 1,
0.5833591, -3.068876, 3.444029, 0.3568628, 0, 1, 1,
0.5854005, -0.152109, 3.369003, 0.3607843, 0, 1, 1,
0.5937719, -1.042098, 3.835487, 0.3686275, 0, 1, 1,
0.5958487, -1.697886, 2.116455, 0.372549, 0, 1, 1,
0.5985054, 0.03909625, 1.642447, 0.3803922, 0, 1, 1,
0.6009975, 0.1471011, 1.408136, 0.3843137, 0, 1, 1,
0.6029414, 1.729822, -0.5212113, 0.3921569, 0, 1, 1,
0.6043639, 0.450973, 1.320546, 0.3960784, 0, 1, 1,
0.6090724, -1.075653, 3.303614, 0.4039216, 0, 1, 1,
0.6094664, 0.7519255, 0.6616284, 0.4117647, 0, 1, 1,
0.6116191, -1.941065, 3.043963, 0.4156863, 0, 1, 1,
0.6191661, -0.3042563, 1.787698, 0.4235294, 0, 1, 1,
0.6272196, 0.1221759, 0.3143581, 0.427451, 0, 1, 1,
0.6278475, -0.9839786, 0.9875354, 0.4352941, 0, 1, 1,
0.6278558, -0.2079099, 1.474781, 0.4392157, 0, 1, 1,
0.6282948, -1.67493, 2.393981, 0.4470588, 0, 1, 1,
0.6287605, 0.06582374, 0.5197895, 0.4509804, 0, 1, 1,
0.6339854, 2.398388, 0.6284594, 0.4588235, 0, 1, 1,
0.6395908, 1.286889, 1.237438, 0.4627451, 0, 1, 1,
0.6452895, 0.5913134, 1.369214, 0.4705882, 0, 1, 1,
0.6475179, 2.548488, -0.2346849, 0.4745098, 0, 1, 1,
0.650925, -2.447311, 4.977004, 0.4823529, 0, 1, 1,
0.6526309, -0.4864045, 4.799741, 0.4862745, 0, 1, 1,
0.661096, 0.1403525, 0.6035846, 0.4941176, 0, 1, 1,
0.6623849, -1.046438, 2.776159, 0.5019608, 0, 1, 1,
0.6668403, -0.9518452, 0.7915727, 0.5058824, 0, 1, 1,
0.6698266, 1.137957, -0.3507983, 0.5137255, 0, 1, 1,
0.6703318, 1.779413, 0.4396176, 0.5176471, 0, 1, 1,
0.6771573, -0.09389433, 1.715901, 0.5254902, 0, 1, 1,
0.6806507, -0.2204659, 0.3656173, 0.5294118, 0, 1, 1,
0.6844466, 0.2594277, 1.962534, 0.5372549, 0, 1, 1,
0.6905624, -1.067815, 3.320012, 0.5411765, 0, 1, 1,
0.6917551, -0.9300636, 2.193884, 0.5490196, 0, 1, 1,
0.7016778, -0.9718096, 2.87638, 0.5529412, 0, 1, 1,
0.7020525, 0.231038, 2.807773, 0.5607843, 0, 1, 1,
0.7054193, -0.03835486, 2.548908, 0.5647059, 0, 1, 1,
0.7056584, 0.9713106, -0.5867669, 0.572549, 0, 1, 1,
0.7065708, -0.214168, 2.480847, 0.5764706, 0, 1, 1,
0.7074276, 0.4021077, 1.304944, 0.5843138, 0, 1, 1,
0.7096843, -0.5976956, 1.83477, 0.5882353, 0, 1, 1,
0.7120436, 0.6708127, -0.2579352, 0.5960785, 0, 1, 1,
0.7135369, -0.382549, 2.248552, 0.6039216, 0, 1, 1,
0.7156901, 1.28606, 2.005408, 0.6078432, 0, 1, 1,
0.7160983, -0.2458655, 3.109935, 0.6156863, 0, 1, 1,
0.719474, -1.131218, 2.232485, 0.6196079, 0, 1, 1,
0.7217943, 0.2194483, 1.574275, 0.627451, 0, 1, 1,
0.7266124, 0.06714713, 1.071677, 0.6313726, 0, 1, 1,
0.7275571, 0.4818595, -0.130016, 0.6392157, 0, 1, 1,
0.7292748, 0.5173458, 0.8972244, 0.6431373, 0, 1, 1,
0.7303044, 0.5969706, 0.2959431, 0.6509804, 0, 1, 1,
0.737826, 0.09734035, 2.092619, 0.654902, 0, 1, 1,
0.7390323, 0.6868535, 0.3272724, 0.6627451, 0, 1, 1,
0.7397174, -1.686341, 3.137871, 0.6666667, 0, 1, 1,
0.7408982, -0.1583306, 0.7303858, 0.6745098, 0, 1, 1,
0.751147, -1.620227, 3.307264, 0.6784314, 0, 1, 1,
0.7553736, 1.413086, 0.2701118, 0.6862745, 0, 1, 1,
0.766022, -2.082678, 3.994546, 0.6901961, 0, 1, 1,
0.7665428, 0.1327414, 2.245101, 0.6980392, 0, 1, 1,
0.7675862, -1.382777, 2.090968, 0.7058824, 0, 1, 1,
0.7769525, -2.427335, 2.374891, 0.7098039, 0, 1, 1,
0.7770311, -0.2162002, 3.201376, 0.7176471, 0, 1, 1,
0.7877967, 0.5976668, 0.6080585, 0.7215686, 0, 1, 1,
0.7940065, -0.4524912, 2.409645, 0.7294118, 0, 1, 1,
0.8009999, 0.1889777, 4.131629, 0.7333333, 0, 1, 1,
0.8060174, 0.1260445, 1.033066, 0.7411765, 0, 1, 1,
0.8100126, 0.2033654, 1.165636, 0.7450981, 0, 1, 1,
0.8108342, 0.576305, 1.09646, 0.7529412, 0, 1, 1,
0.8116167, -0.00713511, 1.611166, 0.7568628, 0, 1, 1,
0.8131717, 0.4037191, -1.57215, 0.7647059, 0, 1, 1,
0.813483, 1.630522, 0.848471, 0.7686275, 0, 1, 1,
0.815482, 0.4205582, 0.1602336, 0.7764706, 0, 1, 1,
0.8175594, -0.6785361, 1.800492, 0.7803922, 0, 1, 1,
0.8241065, 0.8875719, 1.08345, 0.7882353, 0, 1, 1,
0.8385565, -0.4545638, 2.18591, 0.7921569, 0, 1, 1,
0.8433544, 0.1315963, 3.040705, 0.8, 0, 1, 1,
0.8438727, 1.304778, 2.413023, 0.8078431, 0, 1, 1,
0.8445866, -0.08690026, 1.744579, 0.8117647, 0, 1, 1,
0.8515092, 0.4929213, -0.3851718, 0.8196079, 0, 1, 1,
0.8560336, -0.1138317, 2.818498, 0.8235294, 0, 1, 1,
0.8592302, 0.2399264, 1.123434, 0.8313726, 0, 1, 1,
0.8755813, 1.49827, -0.6663442, 0.8352941, 0, 1, 1,
0.8764986, -2.274774, 2.946932, 0.8431373, 0, 1, 1,
0.8786463, -1.211427, 2.968395, 0.8470588, 0, 1, 1,
0.8859369, -0.3359255, 0.7426896, 0.854902, 0, 1, 1,
0.8895446, -1.025177, 2.488589, 0.8588235, 0, 1, 1,
0.8896992, -0.2075842, 2.352328, 0.8666667, 0, 1, 1,
0.8907287, -0.7310475, 3.240152, 0.8705882, 0, 1, 1,
0.8971151, 1.819143, 1.607845, 0.8784314, 0, 1, 1,
0.8975624, 2.006984, 0.6792437, 0.8823529, 0, 1, 1,
0.9052289, -0.2540213, 1.178275, 0.8901961, 0, 1, 1,
0.9063795, -0.1731798, 2.029306, 0.8941177, 0, 1, 1,
0.9128463, 2.107927, 0.06738771, 0.9019608, 0, 1, 1,
0.9130523, -0.5522596, 0.5946586, 0.9098039, 0, 1, 1,
0.9153209, -0.48629, 2.004375, 0.9137255, 0, 1, 1,
0.9260545, -0.204492, 1.101466, 0.9215686, 0, 1, 1,
0.9286925, -0.1392788, 1.801247, 0.9254902, 0, 1, 1,
0.9325678, 0.01182329, 1.35148, 0.9333333, 0, 1, 1,
0.9352846, 0.1851469, -0.4957161, 0.9372549, 0, 1, 1,
0.9450569, -0.5391322, 2.814665, 0.945098, 0, 1, 1,
0.9577233, -2.828471, 1.879704, 0.9490196, 0, 1, 1,
0.9607947, -2.308532, 2.402699, 0.9568627, 0, 1, 1,
0.9635758, -0.01060689, 2.012507, 0.9607843, 0, 1, 1,
0.9699067, 0.2407058, 0.3768981, 0.9686275, 0, 1, 1,
0.9706942, -0.2748773, 3.255639, 0.972549, 0, 1, 1,
0.9725007, -1.076929, 2.615738, 0.9803922, 0, 1, 1,
0.9775307, -1.593534, 2.568732, 0.9843137, 0, 1, 1,
0.9777218, 1.272893, 0.3684521, 0.9921569, 0, 1, 1,
0.9788386, 0.3313596, 1.269809, 0.9960784, 0, 1, 1,
0.9934418, 1.747854, 1.864158, 1, 0, 0.9960784, 1,
0.9936335, 1.091009, 1.141981, 1, 0, 0.9882353, 1,
0.9975024, 1.480709, -0.3028499, 1, 0, 0.9843137, 1,
0.9977282, 0.07416409, 1.776233, 1, 0, 0.9764706, 1,
1.000665, 0.2659917, 0.6017907, 1, 0, 0.972549, 1,
1.01517, -0.9053469, 1.38861, 1, 0, 0.9647059, 1,
1.017678, 0.2186818, 1.199785, 1, 0, 0.9607843, 1,
1.018506, 1.104067, 0.01948837, 1, 0, 0.9529412, 1,
1.023065, 0.6994905, 1.17162, 1, 0, 0.9490196, 1,
1.025357, 0.0361054, 2.765985, 1, 0, 0.9411765, 1,
1.032251, 1.223756, 0.1398852, 1, 0, 0.9372549, 1,
1.032839, 1.358384, 1.458214, 1, 0, 0.9294118, 1,
1.035156, 0.3796869, 1.721, 1, 0, 0.9254902, 1,
1.03714, -0.9351996, 1.616996, 1, 0, 0.9176471, 1,
1.042853, 0.1565106, 0.4330507, 1, 0, 0.9137255, 1,
1.046385, -1.172625, 1.250949, 1, 0, 0.9058824, 1,
1.05662, 0.6857852, 2.357507, 1, 0, 0.9019608, 1,
1.057453, -0.6819295, 1.358345, 1, 0, 0.8941177, 1,
1.057709, -1.379052, 3.244618, 1, 0, 0.8862745, 1,
1.060576, 1.383092, 1.005621, 1, 0, 0.8823529, 1,
1.065019, 0.4366198, 1.298616, 1, 0, 0.8745098, 1,
1.071025, 0.3349917, 0.5434598, 1, 0, 0.8705882, 1,
1.079257, -0.08328686, 1.363717, 1, 0, 0.8627451, 1,
1.087421, 0.5321612, -0.02852173, 1, 0, 0.8588235, 1,
1.095267, -0.7044981, 3.108952, 1, 0, 0.8509804, 1,
1.095916, -0.5805941, 1.570951, 1, 0, 0.8470588, 1,
1.104942, -1.008534, 2.717655, 1, 0, 0.8392157, 1,
1.113402, -0.2989179, 1.34542, 1, 0, 0.8352941, 1,
1.120152, -0.9499812, 2.716974, 1, 0, 0.827451, 1,
1.137161, -1.431851, 2.774635, 1, 0, 0.8235294, 1,
1.139108, 1.884979, -0.4602804, 1, 0, 0.8156863, 1,
1.147897, 1.3152, 0.3801042, 1, 0, 0.8117647, 1,
1.151587, 1.649924, -0.7088272, 1, 0, 0.8039216, 1,
1.163402, 0.758446, 1.572527, 1, 0, 0.7960784, 1,
1.171126, 0.9379028, 1.690563, 1, 0, 0.7921569, 1,
1.182408, -0.8762207, 3.525696, 1, 0, 0.7843137, 1,
1.186068, -1.015887, 3.355859, 1, 0, 0.7803922, 1,
1.187442, 0.7702847, 0.5291755, 1, 0, 0.772549, 1,
1.19112, 2.258262, 2.662154, 1, 0, 0.7686275, 1,
1.198989, -1.206017, 3.714717, 1, 0, 0.7607843, 1,
1.199582, 1.100075, 1.670445, 1, 0, 0.7568628, 1,
1.209339, -0.8112088, 3.401389, 1, 0, 0.7490196, 1,
1.21332, -0.7494584, 3.001649, 1, 0, 0.7450981, 1,
1.214766, 0.5497945, 0.8557033, 1, 0, 0.7372549, 1,
1.215891, 0.1096929, 1.813314, 1, 0, 0.7333333, 1,
1.216029, 0.3459798, 1.381115, 1, 0, 0.7254902, 1,
1.221681, 0.4092673, 0.4299915, 1, 0, 0.7215686, 1,
1.223208, -0.7319402, 2.623698, 1, 0, 0.7137255, 1,
1.249578, 0.7339374, 1.291482, 1, 0, 0.7098039, 1,
1.255174, -0.1409126, 2.716992, 1, 0, 0.7019608, 1,
1.265824, 0.6656667, 0.1165198, 1, 0, 0.6941177, 1,
1.266616, -0.4834183, 3.082335, 1, 0, 0.6901961, 1,
1.269594, 1.380036, 0.9640098, 1, 0, 0.682353, 1,
1.274773, -0.113276, 2.811235, 1, 0, 0.6784314, 1,
1.283588, 1.113634, 1.238472, 1, 0, 0.6705883, 1,
1.291491, -0.3629219, 2.175601, 1, 0, 0.6666667, 1,
1.294098, -1.790447, 3.478722, 1, 0, 0.6588235, 1,
1.303607, 0.2314324, 0.7519867, 1, 0, 0.654902, 1,
1.317033, -0.7990624, 2.75196, 1, 0, 0.6470588, 1,
1.317588, 0.0453835, 1.904455, 1, 0, 0.6431373, 1,
1.32254, -0.601545, 2.937187, 1, 0, 0.6352941, 1,
1.323169, 0.9162643, 0.4559065, 1, 0, 0.6313726, 1,
1.323233, 0.09508086, 1.36166, 1, 0, 0.6235294, 1,
1.326589, 0.5772799, 1.345181, 1, 0, 0.6196079, 1,
1.329941, 1.193652, 1.646364, 1, 0, 0.6117647, 1,
1.330069, -0.7527724, 2.809641, 1, 0, 0.6078432, 1,
1.333672, -0.6008266, 3.748747, 1, 0, 0.6, 1,
1.335615, -0.5112687, 1.553047, 1, 0, 0.5921569, 1,
1.33678, -0.5942987, 2.162185, 1, 0, 0.5882353, 1,
1.337581, -0.01875728, 1.98685, 1, 0, 0.5803922, 1,
1.337903, -2.070533, 2.673591, 1, 0, 0.5764706, 1,
1.339393, -0.8087838, 2.086261, 1, 0, 0.5686275, 1,
1.339427, -0.9740987, 2.487416, 1, 0, 0.5647059, 1,
1.34239, 0.01679531, 0.3656211, 1, 0, 0.5568628, 1,
1.349654, 0.3427715, 0.02891165, 1, 0, 0.5529412, 1,
1.354864, -0.5408322, 1.031603, 1, 0, 0.5450981, 1,
1.357557, -0.8109054, 2.201437, 1, 0, 0.5411765, 1,
1.366202, 1.034063, 0.004797123, 1, 0, 0.5333334, 1,
1.387594, -1.094954, 2.527536, 1, 0, 0.5294118, 1,
1.388036, 1.170046, 0.3607796, 1, 0, 0.5215687, 1,
1.388266, 0.5075006, 2.146452, 1, 0, 0.5176471, 1,
1.398028, 0.1529459, 0.4363293, 1, 0, 0.509804, 1,
1.400251, -0.9418302, 1.734092, 1, 0, 0.5058824, 1,
1.401051, -0.6711963, 0.3307047, 1, 0, 0.4980392, 1,
1.411788, -0.2210366, 1.624366, 1, 0, 0.4901961, 1,
1.419555, 0.5027523, 2.442746, 1, 0, 0.4862745, 1,
1.421182, 0.5362564, 2.985615, 1, 0, 0.4784314, 1,
1.422311, 0.9249032, -0.4270118, 1, 0, 0.4745098, 1,
1.423909, 0.8968717, 0.398292, 1, 0, 0.4666667, 1,
1.431603, 0.2953601, 1.51418, 1, 0, 0.4627451, 1,
1.439315, -1.186538, 1.451594, 1, 0, 0.454902, 1,
1.443704, -0.6953818, 1.939453, 1, 0, 0.4509804, 1,
1.447533, 1.274064, 0.8986307, 1, 0, 0.4431373, 1,
1.449826, 1.297878, -0.8402484, 1, 0, 0.4392157, 1,
1.495713, -1.785432, 3.780301, 1, 0, 0.4313726, 1,
1.498021, -0.1534814, 2.095375, 1, 0, 0.427451, 1,
1.498406, -1.136463, 2.664183, 1, 0, 0.4196078, 1,
1.500255, 2.095816, 2.135218, 1, 0, 0.4156863, 1,
1.504547, 0.4314082, 0.5540939, 1, 0, 0.4078431, 1,
1.521933, 1.268842, -0.9622516, 1, 0, 0.4039216, 1,
1.542819, -0.5513243, 1.659667, 1, 0, 0.3960784, 1,
1.543314, -0.2743205, 0.9223586, 1, 0, 0.3882353, 1,
1.549269, 0.777796, -0.130083, 1, 0, 0.3843137, 1,
1.555182, 0.3036073, -0.9376597, 1, 0, 0.3764706, 1,
1.564402, 0.6935545, 1.039088, 1, 0, 0.372549, 1,
1.577684, 1.779836, -0.6621487, 1, 0, 0.3647059, 1,
1.580482, -1.41513, 2.223958, 1, 0, 0.3607843, 1,
1.587153, -0.2781117, 2.696895, 1, 0, 0.3529412, 1,
1.588132, 1.254221, 1.25721, 1, 0, 0.3490196, 1,
1.596203, -2.633022, 1.060006, 1, 0, 0.3411765, 1,
1.596415, -0.8314605, 1.315335, 1, 0, 0.3372549, 1,
1.650734, -0.2032031, 0.252541, 1, 0, 0.3294118, 1,
1.653499, -0.8101223, 2.12365, 1, 0, 0.3254902, 1,
1.667074, 0.3016531, 0.6980392, 1, 0, 0.3176471, 1,
1.68514, -0.5958276, 4.525651, 1, 0, 0.3137255, 1,
1.692958, -2.094839, 3.722978, 1, 0, 0.3058824, 1,
1.700331, -0.103175, 3.293494, 1, 0, 0.2980392, 1,
1.704738, -1.5779, 3.697835, 1, 0, 0.2941177, 1,
1.705157, 0.3091023, 0.3868701, 1, 0, 0.2862745, 1,
1.713334, 0.8836259, -0.7706299, 1, 0, 0.282353, 1,
1.718786, 0.3012594, 1.979689, 1, 0, 0.2745098, 1,
1.72098, 0.3798563, 2.458383, 1, 0, 0.2705882, 1,
1.72434, -0.7026507, 1.833803, 1, 0, 0.2627451, 1,
1.724996, -1.483752, 2.065987, 1, 0, 0.2588235, 1,
1.729787, 0.3805155, 1.747594, 1, 0, 0.2509804, 1,
1.736567, 0.8595861, -0.108746, 1, 0, 0.2470588, 1,
1.76, 0.9646684, 0.9928506, 1, 0, 0.2392157, 1,
1.760471, -0.2178406, 1.405403, 1, 0, 0.2352941, 1,
1.761665, -1.648487, 2.431958, 1, 0, 0.227451, 1,
1.770367, 0.04966979, -0.4097393, 1, 0, 0.2235294, 1,
1.777107, -0.7329754, 0.9691712, 1, 0, 0.2156863, 1,
1.780785, 1.441251, 0.2284715, 1, 0, 0.2117647, 1,
1.792348, 1.765673, 0.2479616, 1, 0, 0.2039216, 1,
1.819157, 1.146143, 1.187797, 1, 0, 0.1960784, 1,
1.827393, 1.325904, 2.353333, 1, 0, 0.1921569, 1,
1.832354, 0.7375491, 0.4949477, 1, 0, 0.1843137, 1,
1.839815, 0.8606114, 0.2156078, 1, 0, 0.1803922, 1,
1.922295, 2.083178, 1.720904, 1, 0, 0.172549, 1,
1.946103, -1.416483, 3.107177, 1, 0, 0.1686275, 1,
1.957056, 1.78997, 1.39329, 1, 0, 0.1607843, 1,
1.96802, -2.11307, 0.6431356, 1, 0, 0.1568628, 1,
2.009661, -0.5081853, 1.869847, 1, 0, 0.1490196, 1,
2.01487, -1.189755, 1.585247, 1, 0, 0.145098, 1,
2.020602, 0.4836193, 1.399155, 1, 0, 0.1372549, 1,
2.066977, -1.125102, 1.488063, 1, 0, 0.1333333, 1,
2.098984, -0.5697783, 2.136728, 1, 0, 0.1254902, 1,
2.104537, -1.186532, 3.730654, 1, 0, 0.1215686, 1,
2.156776, -0.1276309, 2.047138, 1, 0, 0.1137255, 1,
2.1655, 0.1958768, 1.024174, 1, 0, 0.1098039, 1,
2.169754, 0.1764183, 1.375688, 1, 0, 0.1019608, 1,
2.172714, 0.2883418, -0.0321476, 1, 0, 0.09411765, 1,
2.177368, 2.206807, 1.181641, 1, 0, 0.09019608, 1,
2.275386, 0.218211, 1.488767, 1, 0, 0.08235294, 1,
2.305906, 0.2007446, 0.9843849, 1, 0, 0.07843138, 1,
2.372186, 0.3140776, 1.377616, 1, 0, 0.07058824, 1,
2.469182, 0.6384474, 1.776877, 1, 0, 0.06666667, 1,
2.496924, 0.9652205, -0.0274446, 1, 0, 0.05882353, 1,
2.501063, -0.5708213, 1.7667, 1, 0, 0.05490196, 1,
2.521962, -0.5996711, 3.90625, 1, 0, 0.04705882, 1,
2.579055, 0.3924226, -0.7044035, 1, 0, 0.04313726, 1,
2.614277, -0.2135121, 2.756644, 1, 0, 0.03529412, 1,
2.669889, 0.9662508, 1.469222, 1, 0, 0.03137255, 1,
2.744581, 0.6092339, 0.8079675, 1, 0, 0.02352941, 1,
2.752218, -0.8172153, 1.261603, 1, 0, 0.01960784, 1,
2.906126, -0.475935, 2.061156, 1, 0, 0.01176471, 1,
3.440313, -0.9630454, 1.051855, 1, 0, 0.007843138, 1
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
0.2762272, -4.384535, -8.578373, 0, -0.5, 0.5, 0.5,
0.2762272, -4.384535, -8.578373, 1, -0.5, 0.5, 0.5,
0.2762272, -4.384535, -8.578373, 1, 1.5, 0.5, 0.5,
0.2762272, -4.384535, -8.578373, 0, 1.5, 0.5, 0.5
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
-3.960484, -0.2820296, -8.578373, 0, -0.5, 0.5, 0.5,
-3.960484, -0.2820296, -8.578373, 1, -0.5, 0.5, 0.5,
-3.960484, -0.2820296, -8.578373, 1, 1.5, 0.5, 0.5,
-3.960484, -0.2820296, -8.578373, 0, 1.5, 0.5, 0.5
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
-3.960484, -4.384535, -0.5871167, 0, -0.5, 0.5, 0.5,
-3.960484, -4.384535, -0.5871167, 1, -0.5, 0.5, 0.5,
-3.960484, -4.384535, -0.5871167, 1, 1.5, 0.5, 0.5,
-3.960484, -4.384535, -0.5871167, 0, 1.5, 0.5, 0.5
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
-2, -3.437803, -6.734237,
3, -3.437803, -6.734237,
-2, -3.437803, -6.734237,
-2, -3.595592, -7.041593,
-1, -3.437803, -6.734237,
-1, -3.595592, -7.041593,
0, -3.437803, -6.734237,
0, -3.595592, -7.041593,
1, -3.437803, -6.734237,
1, -3.595592, -7.041593,
2, -3.437803, -6.734237,
2, -3.595592, -7.041593,
3, -3.437803, -6.734237,
3, -3.595592, -7.041593
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
-2, -3.911169, -7.656305, 0, -0.5, 0.5, 0.5,
-2, -3.911169, -7.656305, 1, -0.5, 0.5, 0.5,
-2, -3.911169, -7.656305, 1, 1.5, 0.5, 0.5,
-2, -3.911169, -7.656305, 0, 1.5, 0.5, 0.5,
-1, -3.911169, -7.656305, 0, -0.5, 0.5, 0.5,
-1, -3.911169, -7.656305, 1, -0.5, 0.5, 0.5,
-1, -3.911169, -7.656305, 1, 1.5, 0.5, 0.5,
-1, -3.911169, -7.656305, 0, 1.5, 0.5, 0.5,
0, -3.911169, -7.656305, 0, -0.5, 0.5, 0.5,
0, -3.911169, -7.656305, 1, -0.5, 0.5, 0.5,
0, -3.911169, -7.656305, 1, 1.5, 0.5, 0.5,
0, -3.911169, -7.656305, 0, 1.5, 0.5, 0.5,
1, -3.911169, -7.656305, 0, -0.5, 0.5, 0.5,
1, -3.911169, -7.656305, 1, -0.5, 0.5, 0.5,
1, -3.911169, -7.656305, 1, 1.5, 0.5, 0.5,
1, -3.911169, -7.656305, 0, 1.5, 0.5, 0.5,
2, -3.911169, -7.656305, 0, -0.5, 0.5, 0.5,
2, -3.911169, -7.656305, 1, -0.5, 0.5, 0.5,
2, -3.911169, -7.656305, 1, 1.5, 0.5, 0.5,
2, -3.911169, -7.656305, 0, 1.5, 0.5, 0.5,
3, -3.911169, -7.656305, 0, -0.5, 0.5, 0.5,
3, -3.911169, -7.656305, 1, -0.5, 0.5, 0.5,
3, -3.911169, -7.656305, 1, 1.5, 0.5, 0.5,
3, -3.911169, -7.656305, 0, 1.5, 0.5, 0.5
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
-2.982781, -3, -6.734237,
-2.982781, 2, -6.734237,
-2.982781, -3, -6.734237,
-3.145732, -3, -7.041593,
-2.982781, -2, -6.734237,
-3.145732, -2, -7.041593,
-2.982781, -1, -6.734237,
-3.145732, -1, -7.041593,
-2.982781, 0, -6.734237,
-3.145732, 0, -7.041593,
-2.982781, 1, -6.734237,
-3.145732, 1, -7.041593,
-2.982781, 2, -6.734237,
-3.145732, 2, -7.041593
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
-3.471632, -3, -7.656305, 0, -0.5, 0.5, 0.5,
-3.471632, -3, -7.656305, 1, -0.5, 0.5, 0.5,
-3.471632, -3, -7.656305, 1, 1.5, 0.5, 0.5,
-3.471632, -3, -7.656305, 0, 1.5, 0.5, 0.5,
-3.471632, -2, -7.656305, 0, -0.5, 0.5, 0.5,
-3.471632, -2, -7.656305, 1, -0.5, 0.5, 0.5,
-3.471632, -2, -7.656305, 1, 1.5, 0.5, 0.5,
-3.471632, -2, -7.656305, 0, 1.5, 0.5, 0.5,
-3.471632, -1, -7.656305, 0, -0.5, 0.5, 0.5,
-3.471632, -1, -7.656305, 1, -0.5, 0.5, 0.5,
-3.471632, -1, -7.656305, 1, 1.5, 0.5, 0.5,
-3.471632, -1, -7.656305, 0, 1.5, 0.5, 0.5,
-3.471632, 0, -7.656305, 0, -0.5, 0.5, 0.5,
-3.471632, 0, -7.656305, 1, -0.5, 0.5, 0.5,
-3.471632, 0, -7.656305, 1, 1.5, 0.5, 0.5,
-3.471632, 0, -7.656305, 0, 1.5, 0.5, 0.5,
-3.471632, 1, -7.656305, 0, -0.5, 0.5, 0.5,
-3.471632, 1, -7.656305, 1, -0.5, 0.5, 0.5,
-3.471632, 1, -7.656305, 1, 1.5, 0.5, 0.5,
-3.471632, 1, -7.656305, 0, 1.5, 0.5, 0.5,
-3.471632, 2, -7.656305, 0, -0.5, 0.5, 0.5,
-3.471632, 2, -7.656305, 1, -0.5, 0.5, 0.5,
-3.471632, 2, -7.656305, 1, 1.5, 0.5, 0.5,
-3.471632, 2, -7.656305, 0, 1.5, 0.5, 0.5
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
-2.982781, -3.437803, -6,
-2.982781, -3.437803, 4,
-2.982781, -3.437803, -6,
-3.145732, -3.595592, -6,
-2.982781, -3.437803, -4,
-3.145732, -3.595592, -4,
-2.982781, -3.437803, -2,
-3.145732, -3.595592, -2,
-2.982781, -3.437803, 0,
-3.145732, -3.595592, 0,
-2.982781, -3.437803, 2,
-3.145732, -3.595592, 2,
-2.982781, -3.437803, 4,
-3.145732, -3.595592, 4
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
-3.471632, -3.911169, -6, 0, -0.5, 0.5, 0.5,
-3.471632, -3.911169, -6, 1, -0.5, 0.5, 0.5,
-3.471632, -3.911169, -6, 1, 1.5, 0.5, 0.5,
-3.471632, -3.911169, -6, 0, 1.5, 0.5, 0.5,
-3.471632, -3.911169, -4, 0, -0.5, 0.5, 0.5,
-3.471632, -3.911169, -4, 1, -0.5, 0.5, 0.5,
-3.471632, -3.911169, -4, 1, 1.5, 0.5, 0.5,
-3.471632, -3.911169, -4, 0, 1.5, 0.5, 0.5,
-3.471632, -3.911169, -2, 0, -0.5, 0.5, 0.5,
-3.471632, -3.911169, -2, 1, -0.5, 0.5, 0.5,
-3.471632, -3.911169, -2, 1, 1.5, 0.5, 0.5,
-3.471632, -3.911169, -2, 0, 1.5, 0.5, 0.5,
-3.471632, -3.911169, 0, 0, -0.5, 0.5, 0.5,
-3.471632, -3.911169, 0, 1, -0.5, 0.5, 0.5,
-3.471632, -3.911169, 0, 1, 1.5, 0.5, 0.5,
-3.471632, -3.911169, 0, 0, 1.5, 0.5, 0.5,
-3.471632, -3.911169, 2, 0, -0.5, 0.5, 0.5,
-3.471632, -3.911169, 2, 1, -0.5, 0.5, 0.5,
-3.471632, -3.911169, 2, 1, 1.5, 0.5, 0.5,
-3.471632, -3.911169, 2, 0, 1.5, 0.5, 0.5,
-3.471632, -3.911169, 4, 0, -0.5, 0.5, 0.5,
-3.471632, -3.911169, 4, 1, -0.5, 0.5, 0.5,
-3.471632, -3.911169, 4, 1, 1.5, 0.5, 0.5,
-3.471632, -3.911169, 4, 0, 1.5, 0.5, 0.5
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
-2.982781, -3.437803, -6.734237,
-2.982781, 2.873744, -6.734237,
-2.982781, -3.437803, 5.560004,
-2.982781, 2.873744, 5.560004,
-2.982781, -3.437803, -6.734237,
-2.982781, -3.437803, 5.560004,
-2.982781, 2.873744, -6.734237,
-2.982781, 2.873744, 5.560004,
-2.982781, -3.437803, -6.734237,
3.535236, -3.437803, -6.734237,
-2.982781, -3.437803, 5.560004,
3.535236, -3.437803, 5.560004,
-2.982781, 2.873744, -6.734237,
3.535236, 2.873744, -6.734237,
-2.982781, 2.873744, 5.560004,
3.535236, 2.873744, 5.560004,
3.535236, -3.437803, -6.734237,
3.535236, 2.873744, -6.734237,
3.535236, -3.437803, 5.560004,
3.535236, 2.873744, 5.560004,
3.535236, -3.437803, -6.734237,
3.535236, -3.437803, 5.560004,
3.535236, 2.873744, -6.734237,
3.535236, 2.873744, 5.560004
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
var radius = 8.159051;
var distance = 36.30054;
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
mvMatrix.translate( -0.2762272, 0.2820296, 0.5871167 );
mvMatrix.scale( 1.353437, 1.397712, 0.7175494 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.30054);
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
Kasugamycin<-read.table("Kasugamycin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Kasugamycin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Kasugamycin' not found
```

```r
y<-Kasugamycin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Kasugamycin' not found
```

```r
z<-Kasugamycin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Kasugamycin' not found
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
-2.887859, -0.05363168, -0.6272509, 0, 0, 1, 1, 1,
-2.779022, -0.2179978, -0.9372461, 1, 0, 0, 1, 1,
-2.654868, -0.5757954, -0.5459161, 1, 0, 0, 1, 1,
-2.606614, 1.344191, -1.049042, 1, 0, 0, 1, 1,
-2.552115, 0.7214827, -1.077159, 1, 0, 0, 1, 1,
-2.497484, 1.457688, -1.090582, 1, 0, 0, 1, 1,
-2.426429, -0.3866091, -1.929535, 0, 0, 0, 1, 1,
-2.417515, 0.2910603, 0.495651, 0, 0, 0, 1, 1,
-2.381128, 1.658878, -1.844913, 0, 0, 0, 1, 1,
-2.295598, 2.25335, -1.452412, 0, 0, 0, 1, 1,
-2.294069, 0.3010131, -1.928963, 0, 0, 0, 1, 1,
-2.231633, -0.7951244, -1.159881, 0, 0, 0, 1, 1,
-2.229974, -1.223939, -2.364249, 0, 0, 0, 1, 1,
-2.227312, 0.6801183, -1.833519, 1, 1, 1, 1, 1,
-2.200809, -0.1438459, -0.4822424, 1, 1, 1, 1, 1,
-2.199607, 0.3565182, -2.219159, 1, 1, 1, 1, 1,
-2.174458, 0.4401356, -1.018597, 1, 1, 1, 1, 1,
-2.007573, -0.2481203, -4.152302, 1, 1, 1, 1, 1,
-2.005268, -1.11775, -2.465535, 1, 1, 1, 1, 1,
-2.000772, -0.848875, -0.5973687, 1, 1, 1, 1, 1,
-2.000215, 0.05441409, -2.221665, 1, 1, 1, 1, 1,
-1.979114, -0.6762058, -1.545359, 1, 1, 1, 1, 1,
-1.97894, -0.99898, -4.172983, 1, 1, 1, 1, 1,
-1.959542, -0.6298213, -2.923766, 1, 1, 1, 1, 1,
-1.953244, -0.6212211, -2.407566, 1, 1, 1, 1, 1,
-1.909804, -0.7278504, -0.4844779, 1, 1, 1, 1, 1,
-1.888154, -2.141215, -1.830199, 1, 1, 1, 1, 1,
-1.886275, -0.08740386, -1.07353, 1, 1, 1, 1, 1,
-1.862713, 1.450366, -2.355517, 0, 0, 1, 1, 1,
-1.852597, 2.58927, -0.2362632, 1, 0, 0, 1, 1,
-1.850818, 0.6149963, -1.364099, 1, 0, 0, 1, 1,
-1.841293, -0.05513247, -2.231648, 1, 0, 0, 1, 1,
-1.838805, -0.07168923, -0.5525476, 1, 0, 0, 1, 1,
-1.833436, -2.936076, -3.080843, 1, 0, 0, 1, 1,
-1.817433, -0.08001456, -3.597357, 0, 0, 0, 1, 1,
-1.815979, -0.07871086, -1.750272, 0, 0, 0, 1, 1,
-1.795125, 0.1345666, 0.03009192, 0, 0, 0, 1, 1,
-1.793347, -1.050961, -2.658913, 0, 0, 0, 1, 1,
-1.789045, 1.402763, -0.8883137, 0, 0, 0, 1, 1,
-1.724803, 0.7995713, -1.448221, 0, 0, 0, 1, 1,
-1.721, 0.06982616, -1.882858, 0, 0, 0, 1, 1,
-1.712513, -0.4752645, -2.798537, 1, 1, 1, 1, 1,
-1.70584, 0.9838362, -0.6113163, 1, 1, 1, 1, 1,
-1.6997, 1.00104, -0.2338708, 1, 1, 1, 1, 1,
-1.694115, 0.7298457, 0.08484692, 1, 1, 1, 1, 1,
-1.681237, -0.05869617, -0.3456168, 1, 1, 1, 1, 1,
-1.667935, -1.787841, -3.493861, 1, 1, 1, 1, 1,
-1.664969, -0.1527968, -1.471079, 1, 1, 1, 1, 1,
-1.663653, -1.013366, -1.586549, 1, 1, 1, 1, 1,
-1.64988, 0.896363, 0.8736338, 1, 1, 1, 1, 1,
-1.648017, -0.9703352, -2.42764, 1, 1, 1, 1, 1,
-1.645395, -0.4336432, -2.977771, 1, 1, 1, 1, 1,
-1.626294, 0.1174141, -0.8334108, 1, 1, 1, 1, 1,
-1.622333, 0.2583699, -0.3007514, 1, 1, 1, 1, 1,
-1.612708, -0.348854, -2.090122, 1, 1, 1, 1, 1,
-1.607332, 0.5765992, -1.722805, 1, 1, 1, 1, 1,
-1.606645, -1.410756, -2.412302, 0, 0, 1, 1, 1,
-1.604123, 0.9184866, -0.7831513, 1, 0, 0, 1, 1,
-1.598809, -0.7274141, -2.133668, 1, 0, 0, 1, 1,
-1.590037, 0.8628184, -0.8089194, 1, 0, 0, 1, 1,
-1.586287, -1.436688, -2.420255, 1, 0, 0, 1, 1,
-1.57678, 1.185673, -2.261321, 1, 0, 0, 1, 1,
-1.573759, -0.4927003, -2.016326, 0, 0, 0, 1, 1,
-1.562163, -0.7222899, -3.399601, 0, 0, 0, 1, 1,
-1.562081, -0.8945032, -2.161241, 0, 0, 0, 1, 1,
-1.560943, -1.080525, -1.848855, 0, 0, 0, 1, 1,
-1.555618, 0.1105702, -1.493462, 0, 0, 0, 1, 1,
-1.548724, 1.292468, -0.3712312, 0, 0, 0, 1, 1,
-1.543618, -0.8730522, -1.918634, 0, 0, 0, 1, 1,
-1.541877, -0.455631, -1.184141, 1, 1, 1, 1, 1,
-1.540077, -1.30985, -1.858612, 1, 1, 1, 1, 1,
-1.533969, -1.455885, -1.815456, 1, 1, 1, 1, 1,
-1.524037, -1.184301, -2.079217, 1, 1, 1, 1, 1,
-1.518097, 0.9704463, 0.0281437, 1, 1, 1, 1, 1,
-1.51527, 0.6296086, -0.9477429, 1, 1, 1, 1, 1,
-1.502558, -0.2533568, -0.961385, 1, 1, 1, 1, 1,
-1.48792, 1.593172, -1.384855, 1, 1, 1, 1, 1,
-1.483491, -0.355741, -2.019976, 1, 1, 1, 1, 1,
-1.477854, 1.660475, -2.999527, 1, 1, 1, 1, 1,
-1.463122, 0.6985744, 0.3867067, 1, 1, 1, 1, 1,
-1.458658, 0.9577026, -0.8396021, 1, 1, 1, 1, 1,
-1.432531, 0.8230889, -1.772032, 1, 1, 1, 1, 1,
-1.406887, 0.06386933, -0.3820553, 1, 1, 1, 1, 1,
-1.40022, -0.3236278, -0.9747733, 1, 1, 1, 1, 1,
-1.396909, -0.9102307, -1.324838, 0, 0, 1, 1, 1,
-1.385762, 0.4959021, -1.074142, 1, 0, 0, 1, 1,
-1.37602, 1.419984, 1.290968, 1, 0, 0, 1, 1,
-1.371112, 0.9999577, 0.9484125, 1, 0, 0, 1, 1,
-1.362517, -0.05893632, -3.355213, 1, 0, 0, 1, 1,
-1.362332, -0.1822021, -3.000669, 1, 0, 0, 1, 1,
-1.342835, 0.2529832, -2.541959, 0, 0, 0, 1, 1,
-1.33697, -1.273483, -2.836562, 0, 0, 0, 1, 1,
-1.321156, -0.2740404, -0.9640406, 0, 0, 0, 1, 1,
-1.320299, 1.15284, -2.538235, 0, 0, 0, 1, 1,
-1.306994, -0.6414714, -1.790319, 0, 0, 0, 1, 1,
-1.306237, -0.637527, -2.889805, 0, 0, 0, 1, 1,
-1.30506, -0.3418521, -3.641026, 0, 0, 0, 1, 1,
-1.302148, -0.3274907, -2.375747, 1, 1, 1, 1, 1,
-1.287598, -0.7026797, -2.556438, 1, 1, 1, 1, 1,
-1.267759, -1.43249, -1.321501, 1, 1, 1, 1, 1,
-1.265502, 0.444629, -3.220613, 1, 1, 1, 1, 1,
-1.258511, -1.298361, -1.711172, 1, 1, 1, 1, 1,
-1.254488, -1.048332, -3.041799, 1, 1, 1, 1, 1,
-1.251084, -0.5796266, -1.873054, 1, 1, 1, 1, 1,
-1.251082, 0.4538904, -2.092119, 1, 1, 1, 1, 1,
-1.245399, 0.3226742, -1.114927, 1, 1, 1, 1, 1,
-1.241607, -0.1365768, -1.172534, 1, 1, 1, 1, 1,
-1.23543, -1.504688, -3.28228, 1, 1, 1, 1, 1,
-1.228596, -1.055643, -2.672931, 1, 1, 1, 1, 1,
-1.220879, 0.2155208, -1.84348, 1, 1, 1, 1, 1,
-1.215356, -1.424597, -1.794885, 1, 1, 1, 1, 1,
-1.214429, 1.686695, -0.7093087, 1, 1, 1, 1, 1,
-1.213208, 0.3782642, 1.048191, 0, 0, 1, 1, 1,
-1.201133, -0.5794545, -1.954386, 1, 0, 0, 1, 1,
-1.193359, -0.1369659, -1.018821, 1, 0, 0, 1, 1,
-1.192147, 0.6689802, -1.613652, 1, 0, 0, 1, 1,
-1.184151, -0.4968186, -1.500002, 1, 0, 0, 1, 1,
-1.179601, 0.2543082, -2.700283, 1, 0, 0, 1, 1,
-1.177513, -6.820844e-05, -1.59831, 0, 0, 0, 1, 1,
-1.174504, 0.6345702, -0.9580662, 0, 0, 0, 1, 1,
-1.172007, 0.2871626, -0.6060393, 0, 0, 0, 1, 1,
-1.170135, -0.8787993, -2.386421, 0, 0, 0, 1, 1,
-1.167337, 1.461336, 0.06865352, 0, 0, 0, 1, 1,
-1.163329, 1.177929, 0.9030102, 0, 0, 0, 1, 1,
-1.157547, 0.1681302, -0.4272564, 0, 0, 0, 1, 1,
-1.150551, 1.515869, -0.6529509, 1, 1, 1, 1, 1,
-1.149655, 1.079364, -3.606456, 1, 1, 1, 1, 1,
-1.139238, 0.9608523, -3.034441, 1, 1, 1, 1, 1,
-1.128449, 0.6337427, -1.756738, 1, 1, 1, 1, 1,
-1.125954, 0.2617857, -0.3746946, 1, 1, 1, 1, 1,
-1.106089, 0.142177, -1.376879, 1, 1, 1, 1, 1,
-1.105421, -1.136011, -2.706382, 1, 1, 1, 1, 1,
-1.104553, 0.4335801, -0.04301927, 1, 1, 1, 1, 1,
-1.10426, 0.08785097, -2.032906, 1, 1, 1, 1, 1,
-1.103401, 1.724269, -0.4441023, 1, 1, 1, 1, 1,
-1.10107, 1.701606, -0.1385604, 1, 1, 1, 1, 1,
-1.09849, -1.974445, -2.929729, 1, 1, 1, 1, 1,
-1.093614, -0.5348801, -2.657354, 1, 1, 1, 1, 1,
-1.077304, 0.4322408, -2.963089, 1, 1, 1, 1, 1,
-1.075167, 0.2226076, -1.586001, 1, 1, 1, 1, 1,
-1.06611, 0.7178452, -3.095781, 0, 0, 1, 1, 1,
-1.065771, 0.9779598, -0.02439888, 1, 0, 0, 1, 1,
-1.063597, 0.4773334, -0.03989337, 1, 0, 0, 1, 1,
-1.063426, 0.4974191, -1.649158, 1, 0, 0, 1, 1,
-1.060095, -1.560977, -3.252579, 1, 0, 0, 1, 1,
-1.059429, 1.107245, -1.485, 1, 0, 0, 1, 1,
-1.04429, -0.3978429, -2.874544, 0, 0, 0, 1, 1,
-1.039928, 0.02059354, -3.378246, 0, 0, 0, 1, 1,
-1.036409, 0.802819, -0.3093115, 0, 0, 0, 1, 1,
-1.03555, 0.9052865, -2.386309, 0, 0, 0, 1, 1,
-1.029347, -0.741243, -2.407149, 0, 0, 0, 1, 1,
-1.025984, -0.02472857, -0.7402578, 0, 0, 0, 1, 1,
-1.012784, 0.4931366, -2.484253, 0, 0, 0, 1, 1,
-1.006434, 0.5354809, -1.288884, 1, 1, 1, 1, 1,
-1.006318, -0.6047763, -1.962695, 1, 1, 1, 1, 1,
-0.9991351, 0.5094316, -1.037011, 1, 1, 1, 1, 1,
-0.9971329, -1.587882, -2.102664, 1, 1, 1, 1, 1,
-0.9944792, -1.680479, -2.98174, 1, 1, 1, 1, 1,
-0.9836172, 1.577646, -0.3308288, 1, 1, 1, 1, 1,
-0.9827393, -0.5808442, -4.452022, 1, 1, 1, 1, 1,
-0.9813329, 1.091703, -1.649447, 1, 1, 1, 1, 1,
-0.97729, -0.7803399, -2.794111, 1, 1, 1, 1, 1,
-0.9749494, -1.073462, -2.343768, 1, 1, 1, 1, 1,
-0.9748375, -0.3298974, -1.485912, 1, 1, 1, 1, 1,
-0.9732733, -0.153683, -3.230495, 1, 1, 1, 1, 1,
-0.972805, 0.5690272, -0.5767643, 1, 1, 1, 1, 1,
-0.9716717, 0.7780949, -1.316056, 1, 1, 1, 1, 1,
-0.9708332, -0.6167389, -2.582331, 1, 1, 1, 1, 1,
-0.9703475, 0.9290424, -1.640435, 0, 0, 1, 1, 1,
-0.9660196, -0.2172807, -2.110291, 1, 0, 0, 1, 1,
-0.9600663, -0.2801479, -1.552949, 1, 0, 0, 1, 1,
-0.9591916, -0.216449, -1.4336, 1, 0, 0, 1, 1,
-0.9588305, 0.2219692, -3.683924, 1, 0, 0, 1, 1,
-0.9504052, 0.5730678, -1.731954, 1, 0, 0, 1, 1,
-0.944635, 0.04791883, -1.408294, 0, 0, 0, 1, 1,
-0.9434317, 0.5322004, -1.099668, 0, 0, 0, 1, 1,
-0.9416862, -0.838587, -4.265921, 0, 0, 0, 1, 1,
-0.937573, 0.6456697, -1.155926, 0, 0, 0, 1, 1,
-0.9373927, 0.0002402432, 0.8667746, 0, 0, 0, 1, 1,
-0.9354618, -0.9327522, -2.998908, 0, 0, 0, 1, 1,
-0.9301621, 0.8861584, -1.420106, 0, 0, 0, 1, 1,
-0.9280741, -1.185732, -2.902301, 1, 1, 1, 1, 1,
-0.9236122, -0.006303992, -0.3744666, 1, 1, 1, 1, 1,
-0.9133883, -1.495628, -2.816658, 1, 1, 1, 1, 1,
-0.9122325, 1.014205, -1.42951, 1, 1, 1, 1, 1,
-0.9054492, 1.629413, -0.7916369, 1, 1, 1, 1, 1,
-0.9028823, -0.843011, -3.341401, 1, 1, 1, 1, 1,
-0.8990532, 1.185049, 0.4642411, 1, 1, 1, 1, 1,
-0.8955657, -1.871372, -3.727201, 1, 1, 1, 1, 1,
-0.8815618, -0.3434796, -0.1874931, 1, 1, 1, 1, 1,
-0.881244, 0.4809789, -1.039235, 1, 1, 1, 1, 1,
-0.8802471, 0.3761551, -1.082489, 1, 1, 1, 1, 1,
-0.878495, -0.5186647, -0.5321509, 1, 1, 1, 1, 1,
-0.8730913, -0.6306449, -0.2736052, 1, 1, 1, 1, 1,
-0.8727708, -0.0008807488, -0.3632191, 1, 1, 1, 1, 1,
-0.8692298, 0.319057, -1.594531, 1, 1, 1, 1, 1,
-0.8681467, 0.6682004, -1.8356, 0, 0, 1, 1, 1,
-0.8675784, -0.3550342, -3.043446, 1, 0, 0, 1, 1,
-0.8637571, -0.4950981, -2.621514, 1, 0, 0, 1, 1,
-0.851077, -0.4285629, -2.121862, 1, 0, 0, 1, 1,
-0.84715, 1.201879, -1.146619, 1, 0, 0, 1, 1,
-0.8435385, -0.3977697, -1.945481, 1, 0, 0, 1, 1,
-0.8321913, 0.7579848, 0.1588639, 0, 0, 0, 1, 1,
-0.8321254, 0.736865, -0.1468032, 0, 0, 0, 1, 1,
-0.8294931, 1.001072, -1.368792, 0, 0, 0, 1, 1,
-0.8230807, -1.169218, -1.140759, 0, 0, 0, 1, 1,
-0.8229324, -0.3786578, -0.289168, 0, 0, 0, 1, 1,
-0.8179764, 0.04685866, -1.044097, 0, 0, 0, 1, 1,
-0.8095887, 0.4814467, -1.516845, 0, 0, 0, 1, 1,
-0.8080535, 0.4283132, -0.61102, 1, 1, 1, 1, 1,
-0.8025389, -0.1891384, -2.121998, 1, 1, 1, 1, 1,
-0.7987395, -2.165286, -3.953432, 1, 1, 1, 1, 1,
-0.7939373, -1.173327, -1.279306, 1, 1, 1, 1, 1,
-0.7934566, 0.153535, 0.2861197, 1, 1, 1, 1, 1,
-0.7918645, 1.562372, 0.09417715, 1, 1, 1, 1, 1,
-0.7905025, 1.281017, 0.4012802, 1, 1, 1, 1, 1,
-0.7902811, 0.3846558, -1.843369, 1, 1, 1, 1, 1,
-0.790257, 0.842453, -2.202943, 1, 1, 1, 1, 1,
-0.7889224, -0.6216827, -2.813206, 1, 1, 1, 1, 1,
-0.7886657, 0.1043433, -1.577155, 1, 1, 1, 1, 1,
-0.7833701, -0.9807727, -1.462247, 1, 1, 1, 1, 1,
-0.7816373, 0.7726827, -1.502145, 1, 1, 1, 1, 1,
-0.7808834, 1.850505, -0.02183685, 1, 1, 1, 1, 1,
-0.7779601, -3.345887, -3.005441, 1, 1, 1, 1, 1,
-0.7750043, 0.5357695, -0.2294928, 0, 0, 1, 1, 1,
-0.7738776, 0.3474056, -2.153141, 1, 0, 0, 1, 1,
-0.7715886, 0.4442101, -0.7497848, 1, 0, 0, 1, 1,
-0.7688468, -0.638366, -0.9696192, 1, 0, 0, 1, 1,
-0.7660003, -0.148485, -2.151744, 1, 0, 0, 1, 1,
-0.7653904, 2.181396, -0.2329015, 1, 0, 0, 1, 1,
-0.7613204, 0.04150232, -2.645339, 0, 0, 0, 1, 1,
-0.7604762, -0.04504825, -1.996622, 0, 0, 0, 1, 1,
-0.7586402, 0.617892, -0.2621697, 0, 0, 0, 1, 1,
-0.7487918, -1.094845, -2.497015, 0, 0, 0, 1, 1,
-0.7431106, -1.991156, -2.481688, 0, 0, 0, 1, 1,
-0.7410107, 0.01862204, -1.611254, 0, 0, 0, 1, 1,
-0.7404987, 0.2809051, -2.400396, 0, 0, 0, 1, 1,
-0.736509, -1.326804, -1.419751, 1, 1, 1, 1, 1,
-0.7363847, 1.497718, -0.4276682, 1, 1, 1, 1, 1,
-0.7317756, -0.8508425, -1.447091, 1, 1, 1, 1, 1,
-0.7305017, 0.3201937, -0.3188565, 1, 1, 1, 1, 1,
-0.7253538, 0.5035282, 0.06938595, 1, 1, 1, 1, 1,
-0.7224011, 1.183052, -0.6382391, 1, 1, 1, 1, 1,
-0.7187074, 0.6263465, -1.621099, 1, 1, 1, 1, 1,
-0.7179883, -0.3428304, 0.7539527, 1, 1, 1, 1, 1,
-0.717415, -1.025356, -3.15343, 1, 1, 1, 1, 1,
-0.7172686, -0.5020637, -2.368557, 1, 1, 1, 1, 1,
-0.716761, -0.07744007, -2.369817, 1, 1, 1, 1, 1,
-0.7160287, -1.295495, -2.370664, 1, 1, 1, 1, 1,
-0.7116909, 0.4372082, -1.153013, 1, 1, 1, 1, 1,
-0.7110917, 1.354374, -1.035996, 1, 1, 1, 1, 1,
-0.7108628, -2.388666, -2.814226, 1, 1, 1, 1, 1,
-0.7092908, -0.6563092, -1.130897, 0, 0, 1, 1, 1,
-0.7021755, -0.6296173, -2.663004, 1, 0, 0, 1, 1,
-0.6992263, -0.3025715, -1.541689, 1, 0, 0, 1, 1,
-0.6963982, -0.9793549, -1.864395, 1, 0, 0, 1, 1,
-0.6888209, -0.6694633, -2.99455, 1, 0, 0, 1, 1,
-0.686415, -0.3410986, -1.239889, 1, 0, 0, 1, 1,
-0.6825542, 0.02252605, -2.189034, 0, 0, 0, 1, 1,
-0.6799428, -0.01070566, -1.108541, 0, 0, 0, 1, 1,
-0.6783721, -1.752271, -5.273466, 0, 0, 0, 1, 1,
-0.6770576, 1.08483, -0.2102214, 0, 0, 0, 1, 1,
-0.6713562, 0.833064, 0.1911535, 0, 0, 0, 1, 1,
-0.6709357, 0.7900895, -1.972438, 0, 0, 0, 1, 1,
-0.6652644, -1.081933, -1.822241, 0, 0, 0, 1, 1,
-0.6611877, -0.2909068, -3.602091, 1, 1, 1, 1, 1,
-0.6599649, 1.576872, 0.1653379, 1, 1, 1, 1, 1,
-0.6567022, -1.006024, -2.984566, 1, 1, 1, 1, 1,
-0.6528267, -0.02035474, -1.518162, 1, 1, 1, 1, 1,
-0.6494982, -0.3128305, -3.872145, 1, 1, 1, 1, 1,
-0.6446838, 0.8190002, 0.525866, 1, 1, 1, 1, 1,
-0.6251897, -0.2430483, -2.246354, 1, 1, 1, 1, 1,
-0.623659, -1.122892, -2.287646, 1, 1, 1, 1, 1,
-0.6224502, 1.001381, -2.291881, 1, 1, 1, 1, 1,
-0.6198835, -1.023045, -2.553988, 1, 1, 1, 1, 1,
-0.6194383, 1.276713, -2.194812, 1, 1, 1, 1, 1,
-0.6193344, -0.866272, -1.475078, 1, 1, 1, 1, 1,
-0.6091461, 1.446166, -1.840938, 1, 1, 1, 1, 1,
-0.6077925, 0.782849, -1.372354, 1, 1, 1, 1, 1,
-0.6075731, -0.1820103, -3.110902, 1, 1, 1, 1, 1,
-0.6074879, 0.4711351, -1.181689, 0, 0, 1, 1, 1,
-0.6051182, 0.1656627, -1.686029, 1, 0, 0, 1, 1,
-0.6000026, -0.4782569, -3.182903, 1, 0, 0, 1, 1,
-0.5952708, -0.2706436, -1.948669, 1, 0, 0, 1, 1,
-0.5925673, 1.645146, -1.866171, 1, 0, 0, 1, 1,
-0.5925201, 0.9187731, -2.034133, 1, 0, 0, 1, 1,
-0.5923618, -1.080287, -1.383875, 0, 0, 0, 1, 1,
-0.591971, -2.14238, -3.46253, 0, 0, 0, 1, 1,
-0.5873169, 2.07804, -2.925532, 0, 0, 0, 1, 1,
-0.5792701, 0.8525419, -0.5564489, 0, 0, 0, 1, 1,
-0.5785441, -1.062994, -5.124867, 0, 0, 0, 1, 1,
-0.5762072, 1.739204, -1.847198, 0, 0, 0, 1, 1,
-0.5757082, -0.1347635, -1.307388, 0, 0, 0, 1, 1,
-0.5726566, 1.380353, -0.3048003, 1, 1, 1, 1, 1,
-0.5689788, -0.6357411, -3.370934, 1, 1, 1, 1, 1,
-0.5675457, -0.6745214, -3.644264, 1, 1, 1, 1, 1,
-0.5652057, 1.252774, 0.4101087, 1, 1, 1, 1, 1,
-0.5643496, 0.3134802, 0.1830264, 1, 1, 1, 1, 1,
-0.5641413, -0.3729838, -1.664566, 1, 1, 1, 1, 1,
-0.5606708, 1.971313, 0.2198268, 1, 1, 1, 1, 1,
-0.5521532, 0.161541, -1.77844, 1, 1, 1, 1, 1,
-0.5493082, -1.115054, -3.853969, 1, 1, 1, 1, 1,
-0.5483795, 2.018837, -0.877225, 1, 1, 1, 1, 1,
-0.5477104, 0.4868801, -0.8527422, 1, 1, 1, 1, 1,
-0.5447831, 0.3894269, -2.037914, 1, 1, 1, 1, 1,
-0.540578, 0.276851, -0.6410311, 1, 1, 1, 1, 1,
-0.5354466, -1.855225, -3.196862, 1, 1, 1, 1, 1,
-0.5349613, -0.7723227, -3.809937, 1, 1, 1, 1, 1,
-0.5345303, -1.331342, -2.474679, 0, 0, 1, 1, 1,
-0.5338283, -0.001339149, -2.701782, 1, 0, 0, 1, 1,
-0.5308293, 0.3804722, -1.42852, 1, 0, 0, 1, 1,
-0.5272074, -1.031517, -3.129231, 1, 0, 0, 1, 1,
-0.5230426, -0.3330637, -1.514064, 1, 0, 0, 1, 1,
-0.5214757, -0.1467661, -2.046601, 1, 0, 0, 1, 1,
-0.5199072, -0.08496141, -2.333148, 0, 0, 0, 1, 1,
-0.5165644, 0.5189527, 0.5171835, 0, 0, 0, 1, 1,
-0.5140085, -0.6080154, -2.758075, 0, 0, 0, 1, 1,
-0.5126594, 0.05408155, -2.101938, 0, 0, 0, 1, 1,
-0.5064038, -0.1163736, -2.185917, 0, 0, 0, 1, 1,
-0.5034964, -0.3807434, -2.213019, 0, 0, 0, 1, 1,
-0.4990421, 0.4378048, 2.788661, 0, 0, 0, 1, 1,
-0.4974625, 0.371157, -1.187846, 1, 1, 1, 1, 1,
-0.4919498, -0.4488598, -2.165518, 1, 1, 1, 1, 1,
-0.4915254, -0.4734345, -1.989644, 1, 1, 1, 1, 1,
-0.4896054, 0.4696585, 0.1562818, 1, 1, 1, 1, 1,
-0.4891911, 0.1889457, -1.988477, 1, 1, 1, 1, 1,
-0.4873858, 0.4912652, -0.8622565, 1, 1, 1, 1, 1,
-0.4784106, -0.9256814, -3.806914, 1, 1, 1, 1, 1,
-0.4776542, 0.6034562, -1.064595, 1, 1, 1, 1, 1,
-0.4649687, 0.7996983, 0.7937558, 1, 1, 1, 1, 1,
-0.4632389, -1.093563, -2.32049, 1, 1, 1, 1, 1,
-0.4561704, -0.838966, -2.086123, 1, 1, 1, 1, 1,
-0.4533211, 0.4828689, -0.6506862, 1, 1, 1, 1, 1,
-0.450451, -0.5903316, -4.094376, 1, 1, 1, 1, 1,
-0.4503895, 1.173555, 0.214075, 1, 1, 1, 1, 1,
-0.4485995, 1.258311, -1.846385, 1, 1, 1, 1, 1,
-0.4476245, -1.496666, -3.285075, 0, 0, 1, 1, 1,
-0.4464326, 2.112235, -0.5826753, 1, 0, 0, 1, 1,
-0.4424078, -0.5230655, -4.721519, 1, 0, 0, 1, 1,
-0.4422505, 0.0053969, -1.651913, 1, 0, 0, 1, 1,
-0.4269558, -1.340966, -4.06426, 1, 0, 0, 1, 1,
-0.4265338, -0.4614256, -2.09037, 1, 0, 0, 1, 1,
-0.426162, 0.1738601, -2.732263, 0, 0, 0, 1, 1,
-0.4252232, -0.8778092, -3.369532, 0, 0, 0, 1, 1,
-0.4234559, 0.006151884, -3.100375, 0, 0, 0, 1, 1,
-0.419635, -0.1351257, -2.877548, 0, 0, 0, 1, 1,
-0.4168197, -0.1526912, -2.077526, 0, 0, 0, 1, 1,
-0.4167037, -0.3701306, -2.687259, 0, 0, 0, 1, 1,
-0.4093123, -1.196106, -4.444922, 0, 0, 0, 1, 1,
-0.4077984, -0.2838759, -2.735136, 1, 1, 1, 1, 1,
-0.4074352, -0.1730775, -2.163175, 1, 1, 1, 1, 1,
-0.4072493, 1.792874, -0.2907304, 1, 1, 1, 1, 1,
-0.4070388, 0.4114852, -2.220991, 1, 1, 1, 1, 1,
-0.4059209, 2.28933, 0.9278231, 1, 1, 1, 1, 1,
-0.4040703, -0.7269323, -2.103319, 1, 1, 1, 1, 1,
-0.4036092, 0.04682395, -1.814315, 1, 1, 1, 1, 1,
-0.4023437, -1.12018, -2.3643, 1, 1, 1, 1, 1,
-0.3998697, -0.1155668, -1.255939, 1, 1, 1, 1, 1,
-0.3997596, 0.1326694, -2.700092, 1, 1, 1, 1, 1,
-0.3978011, 1.618382, 0.1728165, 1, 1, 1, 1, 1,
-0.396718, -0.3485964, -2.825284, 1, 1, 1, 1, 1,
-0.3957851, -0.9196773, -3.03035, 1, 1, 1, 1, 1,
-0.3939653, -0.03059221, -0.6851363, 1, 1, 1, 1, 1,
-0.3938787, 0.9990109, -0.2792567, 1, 1, 1, 1, 1,
-0.3924343, -0.1105524, -2.873737, 0, 0, 1, 1, 1,
-0.3884743, -0.2916656, -2.331198, 1, 0, 0, 1, 1,
-0.3804785, 0.3050235, -1.721695, 1, 0, 0, 1, 1,
-0.3792709, -1.23701, -4.143923, 1, 0, 0, 1, 1,
-0.3782188, -0.305535, -1.46735, 1, 0, 0, 1, 1,
-0.37606, 0.3540557, 1.336434, 1, 0, 0, 1, 1,
-0.3752741, -0.0817503, -3.764834, 0, 0, 0, 1, 1,
-0.3751647, -1.56396, -4.629996, 0, 0, 0, 1, 1,
-0.3730739, -0.9872717, -1.756901, 0, 0, 0, 1, 1,
-0.3719815, -0.4929992, -1.669746, 0, 0, 0, 1, 1,
-0.3709408, 0.6242694, -1.582747, 0, 0, 0, 1, 1,
-0.364199, -0.9785774, -2.842903, 0, 0, 0, 1, 1,
-0.3607351, -0.2257458, -3.140152, 0, 0, 0, 1, 1,
-0.3538014, -0.08695412, -2.002546, 1, 1, 1, 1, 1,
-0.3522561, 0.7497004, -1.571863, 1, 1, 1, 1, 1,
-0.3511132, -0.2923617, -1.57129, 1, 1, 1, 1, 1,
-0.3477123, 0.4786193, -0.08430473, 1, 1, 1, 1, 1,
-0.3458339, 1.214664, -0.2587494, 1, 1, 1, 1, 1,
-0.3439701, -0.5390137, -2.574032, 1, 1, 1, 1, 1,
-0.3433993, -0.4793303, -1.918257, 1, 1, 1, 1, 1,
-0.3432401, -0.001174421, -0.2420339, 1, 1, 1, 1, 1,
-0.3418396, 0.6090885, -0.263919, 1, 1, 1, 1, 1,
-0.3395908, 0.4035943, 0.0552735, 1, 1, 1, 1, 1,
-0.3371104, -0.2273156, -1.834353, 1, 1, 1, 1, 1,
-0.336967, 1.114604, -0.9356773, 1, 1, 1, 1, 1,
-0.3359022, -0.7397299, -2.018314, 1, 1, 1, 1, 1,
-0.3312952, 0.1573807, -3.927428, 1, 1, 1, 1, 1,
-0.3300935, -0.5494457, -3.394195, 1, 1, 1, 1, 1,
-0.324984, -1.210248, -3.379405, 0, 0, 1, 1, 1,
-0.3224219, 0.1012821, -1.459344, 1, 0, 0, 1, 1,
-0.3180765, -1.487435, -1.732484, 1, 0, 0, 1, 1,
-0.3169314, 0.3698487, 0.2252901, 1, 0, 0, 1, 1,
-0.3101271, -0.4658281, -4.337212, 1, 0, 0, 1, 1,
-0.3062958, -0.2464712, -2.550403, 1, 0, 0, 1, 1,
-0.2985243, 0.3005097, 0.7363696, 0, 0, 0, 1, 1,
-0.2981046, 0.6825831, 0.1751907, 0, 0, 0, 1, 1,
-0.2953823, 1.552319, -0.09930479, 0, 0, 0, 1, 1,
-0.294881, -0.5589216, -3.038273, 0, 0, 0, 1, 1,
-0.2942016, 1.054424, 1.185321, 0, 0, 0, 1, 1,
-0.2935658, 0.833537, -0.1512604, 0, 0, 0, 1, 1,
-0.2891775, 0.3713679, -1.297694, 0, 0, 0, 1, 1,
-0.2880176, 0.4976137, 0.4931956, 1, 1, 1, 1, 1,
-0.2792482, -0.294124, -2.832643, 1, 1, 1, 1, 1,
-0.2789594, -0.8304635, -3.347852, 1, 1, 1, 1, 1,
-0.2687266, 1.356352, -0.2943782, 1, 1, 1, 1, 1,
-0.2647753, -0.1297905, -0.7005343, 1, 1, 1, 1, 1,
-0.2598581, -1.581511, -3.847746, 1, 1, 1, 1, 1,
-0.2504692, 0.3422152, -1.07699, 1, 1, 1, 1, 1,
-0.2446202, 1.366897, 1.003875, 1, 1, 1, 1, 1,
-0.243127, -1.721397, -3.56913, 1, 1, 1, 1, 1,
-0.2360926, 1.874998, -0.9012533, 1, 1, 1, 1, 1,
-0.2256068, -1.981282, -3.248898, 1, 1, 1, 1, 1,
-0.2254015, -0.1883598, -3.505386, 1, 1, 1, 1, 1,
-0.2195185, 0.2165877, -1.421941, 1, 1, 1, 1, 1,
-0.2160181, 1.352057, -2.105455, 1, 1, 1, 1, 1,
-0.2145803, 1.589245, -0.4148687, 1, 1, 1, 1, 1,
-0.2141993, -0.08757208, 0.3515317, 0, 0, 1, 1, 1,
-0.2114888, 1.282581, 0.0741591, 1, 0, 0, 1, 1,
-0.2105449, -2.227084, -2.679945, 1, 0, 0, 1, 1,
-0.2038857, -1.151951, -1.242487, 1, 0, 0, 1, 1,
-0.2007252, 0.4040879, -0.7547235, 1, 0, 0, 1, 1,
-0.1981809, -0.4430162, -3.888277, 1, 0, 0, 1, 1,
-0.1980324, 1.034655, -0.02928752, 0, 0, 0, 1, 1,
-0.1965527, 1.632684, -0.8602229, 0, 0, 0, 1, 1,
-0.1957684, 0.1560928, -2.024922, 0, 0, 0, 1, 1,
-0.1912487, -1.355517, -2.83753, 0, 0, 0, 1, 1,
-0.1899766, 0.1960604, -0.5169954, 0, 0, 0, 1, 1,
-0.18932, 0.7912452, 0.248479, 0, 0, 0, 1, 1,
-0.1885069, 1.56982, -0.4019034, 0, 0, 0, 1, 1,
-0.1877156, -0.4484306, -1.693268, 1, 1, 1, 1, 1,
-0.1875635, -1.031372, -2.925575, 1, 1, 1, 1, 1,
-0.1865303, 1.089493, 2.789062, 1, 1, 1, 1, 1,
-0.1856196, 0.2722084, -0.9719262, 1, 1, 1, 1, 1,
-0.1808034, 1.30883, 0.8692771, 1, 1, 1, 1, 1,
-0.1803538, -0.7005029, -2.612751, 1, 1, 1, 1, 1,
-0.1797425, 0.5990325, 0.5175446, 1, 1, 1, 1, 1,
-0.1765584, 2.250109, -0.4795749, 1, 1, 1, 1, 1,
-0.1764097, 1.312062, -0.0402253, 1, 1, 1, 1, 1,
-0.1726592, -0.1002115, -1.489278, 1, 1, 1, 1, 1,
-0.1665951, -0.8610678, -4.309129, 1, 1, 1, 1, 1,
-0.1636408, -0.4825518, -3.107572, 1, 1, 1, 1, 1,
-0.1610735, 1.983304, -0.08872237, 1, 1, 1, 1, 1,
-0.1598056, -0.3814256, -2.067616, 1, 1, 1, 1, 1,
-0.1585414, 1.371754, -0.1748217, 1, 1, 1, 1, 1,
-0.1489947, 0.2113931, -0.1395229, 0, 0, 1, 1, 1,
-0.141075, -0.8817675, -3.001522, 1, 0, 0, 1, 1,
-0.1404785, -0.792942, -1.917128, 1, 0, 0, 1, 1,
-0.14034, 0.2139696, -0.8398434, 1, 0, 0, 1, 1,
-0.1388234, -0.4861546, -3.97665, 1, 0, 0, 1, 1,
-0.1367979, -0.1124126, -0.6020734, 1, 0, 0, 1, 1,
-0.1359466, 0.6781909, -0.5835647, 0, 0, 0, 1, 1,
-0.1344704, 0.7305974, 0.06077131, 0, 0, 0, 1, 1,
-0.1294867, -1.775271, -2.338768, 0, 0, 0, 1, 1,
-0.1205179, 0.7201563, 0.2058725, 0, 0, 0, 1, 1,
-0.1187694, 0.3295327, -0.2861015, 0, 0, 0, 1, 1,
-0.1158095, -1.259527, -2.694505, 0, 0, 0, 1, 1,
-0.1147188, 0.749902, -1.873457, 0, 0, 0, 1, 1,
-0.1139506, 1.089477, -0.01114256, 1, 1, 1, 1, 1,
-0.1138923, -0.4510586, -1.981306, 1, 1, 1, 1, 1,
-0.1124304, 1.2915, 0.2725968, 1, 1, 1, 1, 1,
-0.1110956, -2.431857, -1.867633, 1, 1, 1, 1, 1,
-0.1105776, -1.183897, -3.450549, 1, 1, 1, 1, 1,
-0.1096147, 1.147313, 0.6473676, 1, 1, 1, 1, 1,
-0.1070986, -1.387188, -3.098789, 1, 1, 1, 1, 1,
-0.1067985, 0.5441149, 0.1445526, 1, 1, 1, 1, 1,
-0.1057149, 0.8583897, -0.7892393, 1, 1, 1, 1, 1,
-0.1052491, -1.260856, -5.07497, 1, 1, 1, 1, 1,
-0.1019652, 1.399335, -0.8862317, 1, 1, 1, 1, 1,
-0.09941763, 0.2823256, -0.3330235, 1, 1, 1, 1, 1,
-0.09586982, -0.9483866, -5.130558, 1, 1, 1, 1, 1,
-0.0949295, -0.08510078, -2.744926, 1, 1, 1, 1, 1,
-0.09258787, 1.555302, -0.03732632, 1, 1, 1, 1, 1,
-0.09082244, -0.4203219, -1.854424, 0, 0, 1, 1, 1,
-0.0891099, -0.4290636, -2.933545, 1, 0, 0, 1, 1,
-0.08542511, 1.408811, 0.2007906, 1, 0, 0, 1, 1,
-0.08396345, 0.8091518, 1.414542, 1, 0, 0, 1, 1,
-0.0839164, 0.7948615, -1.660469, 1, 0, 0, 1, 1,
-0.08233232, 0.870217, 0.2741307, 1, 0, 0, 1, 1,
-0.07538565, 0.3472164, 1.130274, 0, 0, 0, 1, 1,
-0.07498959, -1.066337, -3.338946, 0, 0, 0, 1, 1,
-0.07213294, 1.534012, 0.2543913, 0, 0, 0, 1, 1,
-0.07095537, 0.3873864, 1.278713, 0, 0, 0, 1, 1,
-0.06934214, -1.039721, -3.678031, 0, 0, 0, 1, 1,
-0.06819813, 0.1926636, -1.539765, 0, 0, 0, 1, 1,
-0.06209568, 1.955289, 0.7788901, 0, 0, 0, 1, 1,
-0.06179089, -1.104797, -3.197076, 1, 1, 1, 1, 1,
-0.06044649, -0.402485, -3.152785, 1, 1, 1, 1, 1,
-0.05705688, -0.2129193, -2.281379, 1, 1, 1, 1, 1,
-0.05091555, -0.3391084, -3.246096, 1, 1, 1, 1, 1,
-0.05026224, -1.690967, -3.291866, 1, 1, 1, 1, 1,
-0.04850383, -1.375558, -1.828525, 1, 1, 1, 1, 1,
-0.04291125, 0.01565547, -1.645531, 1, 1, 1, 1, 1,
-0.04180059, -0.6568382, -3.866455, 1, 1, 1, 1, 1,
-0.04111097, 1.498866, -0.2123991, 1, 1, 1, 1, 1,
-0.03694342, -0.2266829, -6.555195, 1, 1, 1, 1, 1,
-0.02932747, -0.2338896, -2.616684, 1, 1, 1, 1, 1,
-0.02819481, 0.1450459, -0.935252, 1, 1, 1, 1, 1,
-0.02642443, 0.2421795, 1.082955, 1, 1, 1, 1, 1,
-0.02508218, -0.06075095, -3.744079, 1, 1, 1, 1, 1,
-0.02290904, -1.063346, -2.268647, 1, 1, 1, 1, 1,
-0.02125929, -0.6149517, -5.370507, 0, 0, 1, 1, 1,
-0.0202163, 0.491736, -0.9639888, 1, 0, 0, 1, 1,
-0.01933734, -1.778933, -2.498223, 1, 0, 0, 1, 1,
-0.01441679, 1.525449, -1.065258, 1, 0, 0, 1, 1,
-0.01406422, -1.144223, -3.242087, 1, 0, 0, 1, 1,
-0.005043044, -1.108722, -4.433176, 1, 0, 0, 1, 1,
-0.000327784, 1.548432, 0.1260423, 0, 0, 0, 1, 1,
0.004695409, 0.4321944, 1.15358, 0, 0, 0, 1, 1,
0.01277797, 0.8774757, 2.405037, 0, 0, 0, 1, 1,
0.01396659, -0.9050372, 2.168557, 0, 0, 0, 1, 1,
0.02148145, 0.7332331, -0.6357061, 0, 0, 0, 1, 1,
0.02257014, 0.03700605, -0.5891552, 0, 0, 0, 1, 1,
0.02485489, -0.2599591, 3.394182, 0, 0, 0, 1, 1,
0.02607844, -0.4811257, 3.782774, 1, 1, 1, 1, 1,
0.02875329, 1.131557, 0.9828517, 1, 1, 1, 1, 1,
0.02877266, 0.06564154, 1.580565, 1, 1, 1, 1, 1,
0.03224271, -0.06218021, 3.550135, 1, 1, 1, 1, 1,
0.03268125, 0.8968268, -0.743229, 1, 1, 1, 1, 1,
0.03328284, -0.3600512, 0.6498907, 1, 1, 1, 1, 1,
0.03406922, 0.1492698, -0.5461065, 1, 1, 1, 1, 1,
0.03692942, 1.245862, -0.8476541, 1, 1, 1, 1, 1,
0.03738159, 0.2273663, 0.2975437, 1, 1, 1, 1, 1,
0.05161716, -0.4205319, 3.330025, 1, 1, 1, 1, 1,
0.05189913, 0.04494949, -0.5222165, 1, 1, 1, 1, 1,
0.05477533, -1.110115, 3.638271, 1, 1, 1, 1, 1,
0.05489761, 1.025414, 0.2875405, 1, 1, 1, 1, 1,
0.05749813, 0.4923452, -0.003472826, 1, 1, 1, 1, 1,
0.05792734, 2.339945, 0.5255248, 1, 1, 1, 1, 1,
0.05847185, 0.5661427, -0.9659354, 0, 0, 1, 1, 1,
0.05947925, -0.9037258, 2.360288, 1, 0, 0, 1, 1,
0.0690137, 1.048437, 1.30809, 1, 0, 0, 1, 1,
0.07363276, -0.5789719, 3.504882, 1, 0, 0, 1, 1,
0.07464744, 0.9089881, -1.040855, 1, 0, 0, 1, 1,
0.08978683, -0.8620458, 2.308067, 1, 0, 0, 1, 1,
0.09451414, 1.42268, 2.739, 0, 0, 0, 1, 1,
0.09853247, 0.6281856, 0.5516863, 0, 0, 0, 1, 1,
0.1000221, 0.1275459, 0.0364645, 0, 0, 0, 1, 1,
0.1010797, -0.8155576, 5.380961, 0, 0, 0, 1, 1,
0.1018457, 0.5195351, 0.6343701, 0, 0, 0, 1, 1,
0.1025651, -1.343749, 4.126086, 0, 0, 0, 1, 1,
0.1068018, -2.341922, 4.40923, 0, 0, 0, 1, 1,
0.1102484, -0.01340264, 2.851699, 1, 1, 1, 1, 1,
0.1102697, 0.1895235, 1.199712, 1, 1, 1, 1, 1,
0.1107106, -0.919316, 2.214325, 1, 1, 1, 1, 1,
0.1202237, 0.6901673, -0.5008726, 1, 1, 1, 1, 1,
0.1207319, 0.7040423, 0.7295684, 1, 1, 1, 1, 1,
0.1211975, -0.3537095, 3.740204, 1, 1, 1, 1, 1,
0.1242287, 1.42471, -1.164024, 1, 1, 1, 1, 1,
0.1259242, -0.4237884, 4.177423, 1, 1, 1, 1, 1,
0.1272422, 0.07129671, 1.470598, 1, 1, 1, 1, 1,
0.128414, 0.07553842, 1.336004, 1, 1, 1, 1, 1,
0.1286555, -1.121526, 2.979469, 1, 1, 1, 1, 1,
0.1299777, -0.1292329, 3.474099, 1, 1, 1, 1, 1,
0.1380929, -1.928346, 2.239957, 1, 1, 1, 1, 1,
0.1480265, 1.287874, 0.2958657, 1, 1, 1, 1, 1,
0.153498, -0.08915807, 2.134759, 1, 1, 1, 1, 1,
0.1600116, -0.1294365, 1.582206, 0, 0, 1, 1, 1,
0.1631498, 1.264587, -0.3436307, 1, 0, 0, 1, 1,
0.1660531, 0.1799584, 0.7436866, 1, 0, 0, 1, 1,
0.1664305, -2.042849, 3.478416, 1, 0, 0, 1, 1,
0.1666999, 0.519892, 0.5777441, 1, 0, 0, 1, 1,
0.1667414, -1.098185, 2.954472, 1, 0, 0, 1, 1,
0.1674015, -0.763656, 3.777819, 0, 0, 0, 1, 1,
0.168714, -0.07020815, 3.024242, 0, 0, 0, 1, 1,
0.1725912, -0.4222677, 3.451844, 0, 0, 0, 1, 1,
0.1743452, -0.445611, 2.029346, 0, 0, 0, 1, 1,
0.1772194, 0.05338117, 0.6109651, 0, 0, 0, 1, 1,
0.177837, 0.9233387, 0.7682492, 0, 0, 0, 1, 1,
0.1780245, -1.035533, 2.726393, 0, 0, 0, 1, 1,
0.1802286, 0.2035051, 1.509687, 1, 1, 1, 1, 1,
0.1850582, -0.3334265, 2.657864, 1, 1, 1, 1, 1,
0.185096, -0.2232889, 1.895744, 1, 1, 1, 1, 1,
0.1864579, -0.861347, 2.310069, 1, 1, 1, 1, 1,
0.1882722, 1.490407, 0.9974575, 1, 1, 1, 1, 1,
0.1922075, -0.07028902, 2.677766, 1, 1, 1, 1, 1,
0.1947634, 0.5834757, 0.4990137, 1, 1, 1, 1, 1,
0.1967694, 0.4750068, -0.7874003, 1, 1, 1, 1, 1,
0.2041882, 0.8162352, 0.3585817, 1, 1, 1, 1, 1,
0.2059222, 2.283394, -0.2246004, 1, 1, 1, 1, 1,
0.2071617, -0.8999827, 3.229892, 1, 1, 1, 1, 1,
0.20747, 0.4817664, 1.072182, 1, 1, 1, 1, 1,
0.2077452, 0.5383013, 0.8302066, 1, 1, 1, 1, 1,
0.2085088, -0.07341999, 0.7894514, 1, 1, 1, 1, 1,
0.209865, 0.3412535, 3.000946, 1, 1, 1, 1, 1,
0.2120576, 0.6564257, 1.334848, 0, 0, 1, 1, 1,
0.2145841, -0.8065585, 1.524615, 1, 0, 0, 1, 1,
0.2193339, -1.179797, 1.385914, 1, 0, 0, 1, 1,
0.2238948, 0.8609948, -1.299212, 1, 0, 0, 1, 1,
0.227911, -1.975503, 5.287879, 1, 0, 0, 1, 1,
0.2289562, -0.5587537, 3.208207, 1, 0, 0, 1, 1,
0.232231, 1.037084, 0.5818427, 0, 0, 0, 1, 1,
0.2372422, -1.449236, 1.86169, 0, 0, 0, 1, 1,
0.2384849, 0.2452551, 0.156852, 0, 0, 0, 1, 1,
0.2409848, -1.502401, 4.375577, 0, 0, 0, 1, 1,
0.2430016, 0.1069062, 2.156865, 0, 0, 0, 1, 1,
0.2437606, -0.4881229, 2.495777, 0, 0, 0, 1, 1,
0.2468394, 0.6538685, 0.3469764, 0, 0, 0, 1, 1,
0.2471064, 1.28396, 0.291904, 1, 1, 1, 1, 1,
0.2480749, 0.883399, 1.633371, 1, 1, 1, 1, 1,
0.2500751, 1.708646, 0.885201, 1, 1, 1, 1, 1,
0.2509682, 0.09341406, -0.06730638, 1, 1, 1, 1, 1,
0.2569793, 1.962324, 0.2827441, 1, 1, 1, 1, 1,
0.2596162, -0.1663759, 3.942448, 1, 1, 1, 1, 1,
0.2647758, 0.9427091, 1.606269, 1, 1, 1, 1, 1,
0.2655272, 0.2052328, 0.687235, 1, 1, 1, 1, 1,
0.2682938, 1.53918, -0.4864559, 1, 1, 1, 1, 1,
0.2696981, -1.434175, 2.64213, 1, 1, 1, 1, 1,
0.2704441, -0.00190827, 0.8171586, 1, 1, 1, 1, 1,
0.2714638, 0.7427337, -0.9990408, 1, 1, 1, 1, 1,
0.2722209, 0.4315058, -1.128253, 1, 1, 1, 1, 1,
0.2724629, -1.225729, 3.605963, 1, 1, 1, 1, 1,
0.2751834, -0.5140592, 3.186346, 1, 1, 1, 1, 1,
0.2811487, -1.173571, 1.884555, 0, 0, 1, 1, 1,
0.28276, -0.4969338, 3.484912, 1, 0, 0, 1, 1,
0.284097, 0.5677263, -1.300843, 1, 0, 0, 1, 1,
0.2864236, -0.5729991, 4.49211, 1, 0, 0, 1, 1,
0.2931989, -0.6493995, 3.689496, 1, 0, 0, 1, 1,
0.2967211, -0.8598939, 2.80136, 1, 0, 0, 1, 1,
0.2985241, -1.929325, 5.085743, 0, 0, 0, 1, 1,
0.2991024, -0.7960134, 4.965935, 0, 0, 0, 1, 1,
0.299127, 0.5618746, 0.1399779, 0, 0, 0, 1, 1,
0.3011959, 1.172441, 0.5705356, 0, 0, 0, 1, 1,
0.3013687, -0.3820742, 2.23137, 0, 0, 0, 1, 1,
0.3029272, 0.3910384, 2.479836, 0, 0, 0, 1, 1,
0.3091874, -0.1546415, 4.135675, 0, 0, 0, 1, 1,
0.3132936, -0.08491375, 2.052262, 1, 1, 1, 1, 1,
0.3168352, 0.4086376, -1.553205, 1, 1, 1, 1, 1,
0.3269714, 1.212142, -0.6946844, 1, 1, 1, 1, 1,
0.3369825, 2.781828, -0.3811226, 1, 1, 1, 1, 1,
0.336991, 0.4668196, 0.1245568, 1, 1, 1, 1, 1,
0.3532027, -0.5498181, 1.930983, 1, 1, 1, 1, 1,
0.3560497, -0.3068779, 2.996485, 1, 1, 1, 1, 1,
0.3600247, -0.2135154, 1.973604, 1, 1, 1, 1, 1,
0.3616044, 1.775198, 0.2055972, 1, 1, 1, 1, 1,
0.3624354, -1.099679, 2.338875, 1, 1, 1, 1, 1,
0.3634934, 2.234727, -0.6141819, 1, 1, 1, 1, 1,
0.3654508, -0.6227137, 2.637007, 1, 1, 1, 1, 1,
0.3658707, -0.2841747, 2.37782, 1, 1, 1, 1, 1,
0.3672502, -0.9098375, 2.115763, 1, 1, 1, 1, 1,
0.3678962, -0.6686928, 1.957086, 1, 1, 1, 1, 1,
0.3723421, 0.470312, 0.413885, 0, 0, 1, 1, 1,
0.3775339, 0.6418841, 1.195834, 1, 0, 0, 1, 1,
0.3794875, -0.858256, 1.886917, 1, 0, 0, 1, 1,
0.3817853, -1.297225, 1.972398, 1, 0, 0, 1, 1,
0.3865151, -0.2074154, 1.18883, 1, 0, 0, 1, 1,
0.3868692, 1.475234, 0.9139322, 1, 0, 0, 1, 1,
0.3912732, 0.5468385, -1.631252, 0, 0, 0, 1, 1,
0.4054467, 0.5665447, -0.2697934, 0, 0, 0, 1, 1,
0.4070152, 0.8530704, 1.697531, 0, 0, 0, 1, 1,
0.4114837, 1.102023, -0.5198076, 0, 0, 0, 1, 1,
0.4126049, -0.3212066, -0.02087844, 0, 0, 0, 1, 1,
0.413922, 0.8560317, 0.414094, 0, 0, 0, 1, 1,
0.4162272, -0.7329559, 3.735507, 0, 0, 0, 1, 1,
0.4183514, 0.4022505, -0.5321192, 1, 1, 1, 1, 1,
0.4215071, -1.136564, 3.877125, 1, 1, 1, 1, 1,
0.4222954, -0.4620453, -0.1862511, 1, 1, 1, 1, 1,
0.4230416, 1.564471, 0.295317, 1, 1, 1, 1, 1,
0.4240985, 1.529237, 0.3483275, 1, 1, 1, 1, 1,
0.4289771, -0.3258981, 1.418544, 1, 1, 1, 1, 1,
0.4304163, 1.374826, 0.4735576, 1, 1, 1, 1, 1,
0.4349878, -0.4318262, 2.304102, 1, 1, 1, 1, 1,
0.4368338, -0.5613029, 2.954931, 1, 1, 1, 1, 1,
0.4394959, 2.511454, 0.03179685, 1, 1, 1, 1, 1,
0.4418598, -0.713757, 4.23256, 1, 1, 1, 1, 1,
0.4466037, 1.831846, -0.1370093, 1, 1, 1, 1, 1,
0.4480211, -0.2335108, 1.541028, 1, 1, 1, 1, 1,
0.4521082, 0.6032672, 0.7518283, 1, 1, 1, 1, 1,
0.4540741, 1.378401, -0.6706162, 1, 1, 1, 1, 1,
0.45494, -0.0429318, 2.310879, 0, 0, 1, 1, 1,
0.4612114, 0.8727831, -0.7799219, 1, 0, 0, 1, 1,
0.4614064, -0.9041207, 3.240456, 1, 0, 0, 1, 1,
0.4669515, -0.2899282, 2.811389, 1, 0, 0, 1, 1,
0.4681361, 0.3559326, 0.6613412, 1, 0, 0, 1, 1,
0.4682638, -0.7554858, 2.389682, 1, 0, 0, 1, 1,
0.4708646, 1.221166, -1.216214, 0, 0, 0, 1, 1,
0.4755196, 0.7854396, -0.2429072, 0, 0, 0, 1, 1,
0.4763142, -0.1164425, 1.919496, 0, 0, 0, 1, 1,
0.4765785, 0.08219453, 2.098237, 0, 0, 0, 1, 1,
0.4769468, -0.4658999, 3.769425, 0, 0, 0, 1, 1,
0.4823737, 0.1297961, 2.307339, 0, 0, 0, 1, 1,
0.4832518, 0.9973552, 0.6987767, 0, 0, 0, 1, 1,
0.4836252, 0.3615662, 1.185772, 1, 1, 1, 1, 1,
0.4889372, 0.3276211, -0.9228448, 1, 1, 1, 1, 1,
0.4927999, 1.752391, -0.1302816, 1, 1, 1, 1, 1,
0.4938342, 1.52963, 1.055978, 1, 1, 1, 1, 1,
0.4958326, -0.1352485, 3.122018, 1, 1, 1, 1, 1,
0.4964813, 0.2098126, 0.6731418, 1, 1, 1, 1, 1,
0.4988247, 0.2028097, 0.4836298, 1, 1, 1, 1, 1,
0.5012436, -0.9794372, 3.473153, 1, 1, 1, 1, 1,
0.5012829, -0.007371215, 1.695168, 1, 1, 1, 1, 1,
0.5023029, 1.207752, -0.3278418, 1, 1, 1, 1, 1,
0.5035123, 0.7226699, -0.59349, 1, 1, 1, 1, 1,
0.5051565, 0.947572, 0.619787, 1, 1, 1, 1, 1,
0.5053277, 0.5059009, 2.389086, 1, 1, 1, 1, 1,
0.5162201, -0.7895709, 2.632309, 1, 1, 1, 1, 1,
0.5182944, 0.959383, 2.023402, 1, 1, 1, 1, 1,
0.5207194, 0.2553057, -0.09031145, 0, 0, 1, 1, 1,
0.5219465, 0.5200351, -0.3119569, 1, 0, 0, 1, 1,
0.5231923, 0.3516306, 1.08112, 1, 0, 0, 1, 1,
0.5261647, 0.5858162, 1.588254, 1, 0, 0, 1, 1,
0.5264428, 0.4769804, 1.924666, 1, 0, 0, 1, 1,
0.5290181, 1.496369, -0.05254521, 1, 0, 0, 1, 1,
0.5307973, 0.8493683, 0.1301588, 0, 0, 0, 1, 1,
0.5313361, -0.2349961, 2.395956, 0, 0, 0, 1, 1,
0.5343162, 0.03881147, 0.7967234, 0, 0, 0, 1, 1,
0.5421446, 0.4795393, 0.2847746, 0, 0, 0, 1, 1,
0.5476428, -1.225601, 2.18461, 0, 0, 0, 1, 1,
0.5487995, -1.731525, 1.681782, 0, 0, 0, 1, 1,
0.5499549, 0.5799782, 1.063534, 0, 0, 0, 1, 1,
0.5500863, -1.156765, 3.20129, 1, 1, 1, 1, 1,
0.5515433, -0.8023812, 1.709047, 1, 1, 1, 1, 1,
0.5567712, 0.1234426, 2.300546, 1, 1, 1, 1, 1,
0.5574633, 0.6726611, -1.52168, 1, 1, 1, 1, 1,
0.5592704, 0.5487404, 1.635089, 1, 1, 1, 1, 1,
0.5617614, 1.443203, -0.1755905, 1, 1, 1, 1, 1,
0.5622019, -0.3224141, 3.365303, 1, 1, 1, 1, 1,
0.564981, -0.1541876, 2.225239, 1, 1, 1, 1, 1,
0.5712007, -1.080608, 2.419475, 1, 1, 1, 1, 1,
0.5741746, 0.542992, 0.6933368, 1, 1, 1, 1, 1,
0.5746499, -0.4369962, 0.6841965, 1, 1, 1, 1, 1,
0.5758847, 0.3168401, 1.592367, 1, 1, 1, 1, 1,
0.5811616, 0.2851677, -0.4945886, 1, 1, 1, 1, 1,
0.5833591, -3.068876, 3.444029, 1, 1, 1, 1, 1,
0.5854005, -0.152109, 3.369003, 1, 1, 1, 1, 1,
0.5937719, -1.042098, 3.835487, 0, 0, 1, 1, 1,
0.5958487, -1.697886, 2.116455, 1, 0, 0, 1, 1,
0.5985054, 0.03909625, 1.642447, 1, 0, 0, 1, 1,
0.6009975, 0.1471011, 1.408136, 1, 0, 0, 1, 1,
0.6029414, 1.729822, -0.5212113, 1, 0, 0, 1, 1,
0.6043639, 0.450973, 1.320546, 1, 0, 0, 1, 1,
0.6090724, -1.075653, 3.303614, 0, 0, 0, 1, 1,
0.6094664, 0.7519255, 0.6616284, 0, 0, 0, 1, 1,
0.6116191, -1.941065, 3.043963, 0, 0, 0, 1, 1,
0.6191661, -0.3042563, 1.787698, 0, 0, 0, 1, 1,
0.6272196, 0.1221759, 0.3143581, 0, 0, 0, 1, 1,
0.6278475, -0.9839786, 0.9875354, 0, 0, 0, 1, 1,
0.6278558, -0.2079099, 1.474781, 0, 0, 0, 1, 1,
0.6282948, -1.67493, 2.393981, 1, 1, 1, 1, 1,
0.6287605, 0.06582374, 0.5197895, 1, 1, 1, 1, 1,
0.6339854, 2.398388, 0.6284594, 1, 1, 1, 1, 1,
0.6395908, 1.286889, 1.237438, 1, 1, 1, 1, 1,
0.6452895, 0.5913134, 1.369214, 1, 1, 1, 1, 1,
0.6475179, 2.548488, -0.2346849, 1, 1, 1, 1, 1,
0.650925, -2.447311, 4.977004, 1, 1, 1, 1, 1,
0.6526309, -0.4864045, 4.799741, 1, 1, 1, 1, 1,
0.661096, 0.1403525, 0.6035846, 1, 1, 1, 1, 1,
0.6623849, -1.046438, 2.776159, 1, 1, 1, 1, 1,
0.6668403, -0.9518452, 0.7915727, 1, 1, 1, 1, 1,
0.6698266, 1.137957, -0.3507983, 1, 1, 1, 1, 1,
0.6703318, 1.779413, 0.4396176, 1, 1, 1, 1, 1,
0.6771573, -0.09389433, 1.715901, 1, 1, 1, 1, 1,
0.6806507, -0.2204659, 0.3656173, 1, 1, 1, 1, 1,
0.6844466, 0.2594277, 1.962534, 0, 0, 1, 1, 1,
0.6905624, -1.067815, 3.320012, 1, 0, 0, 1, 1,
0.6917551, -0.9300636, 2.193884, 1, 0, 0, 1, 1,
0.7016778, -0.9718096, 2.87638, 1, 0, 0, 1, 1,
0.7020525, 0.231038, 2.807773, 1, 0, 0, 1, 1,
0.7054193, -0.03835486, 2.548908, 1, 0, 0, 1, 1,
0.7056584, 0.9713106, -0.5867669, 0, 0, 0, 1, 1,
0.7065708, -0.214168, 2.480847, 0, 0, 0, 1, 1,
0.7074276, 0.4021077, 1.304944, 0, 0, 0, 1, 1,
0.7096843, -0.5976956, 1.83477, 0, 0, 0, 1, 1,
0.7120436, 0.6708127, -0.2579352, 0, 0, 0, 1, 1,
0.7135369, -0.382549, 2.248552, 0, 0, 0, 1, 1,
0.7156901, 1.28606, 2.005408, 0, 0, 0, 1, 1,
0.7160983, -0.2458655, 3.109935, 1, 1, 1, 1, 1,
0.719474, -1.131218, 2.232485, 1, 1, 1, 1, 1,
0.7217943, 0.2194483, 1.574275, 1, 1, 1, 1, 1,
0.7266124, 0.06714713, 1.071677, 1, 1, 1, 1, 1,
0.7275571, 0.4818595, -0.130016, 1, 1, 1, 1, 1,
0.7292748, 0.5173458, 0.8972244, 1, 1, 1, 1, 1,
0.7303044, 0.5969706, 0.2959431, 1, 1, 1, 1, 1,
0.737826, 0.09734035, 2.092619, 1, 1, 1, 1, 1,
0.7390323, 0.6868535, 0.3272724, 1, 1, 1, 1, 1,
0.7397174, -1.686341, 3.137871, 1, 1, 1, 1, 1,
0.7408982, -0.1583306, 0.7303858, 1, 1, 1, 1, 1,
0.751147, -1.620227, 3.307264, 1, 1, 1, 1, 1,
0.7553736, 1.413086, 0.2701118, 1, 1, 1, 1, 1,
0.766022, -2.082678, 3.994546, 1, 1, 1, 1, 1,
0.7665428, 0.1327414, 2.245101, 1, 1, 1, 1, 1,
0.7675862, -1.382777, 2.090968, 0, 0, 1, 1, 1,
0.7769525, -2.427335, 2.374891, 1, 0, 0, 1, 1,
0.7770311, -0.2162002, 3.201376, 1, 0, 0, 1, 1,
0.7877967, 0.5976668, 0.6080585, 1, 0, 0, 1, 1,
0.7940065, -0.4524912, 2.409645, 1, 0, 0, 1, 1,
0.8009999, 0.1889777, 4.131629, 1, 0, 0, 1, 1,
0.8060174, 0.1260445, 1.033066, 0, 0, 0, 1, 1,
0.8100126, 0.2033654, 1.165636, 0, 0, 0, 1, 1,
0.8108342, 0.576305, 1.09646, 0, 0, 0, 1, 1,
0.8116167, -0.00713511, 1.611166, 0, 0, 0, 1, 1,
0.8131717, 0.4037191, -1.57215, 0, 0, 0, 1, 1,
0.813483, 1.630522, 0.848471, 0, 0, 0, 1, 1,
0.815482, 0.4205582, 0.1602336, 0, 0, 0, 1, 1,
0.8175594, -0.6785361, 1.800492, 1, 1, 1, 1, 1,
0.8241065, 0.8875719, 1.08345, 1, 1, 1, 1, 1,
0.8385565, -0.4545638, 2.18591, 1, 1, 1, 1, 1,
0.8433544, 0.1315963, 3.040705, 1, 1, 1, 1, 1,
0.8438727, 1.304778, 2.413023, 1, 1, 1, 1, 1,
0.8445866, -0.08690026, 1.744579, 1, 1, 1, 1, 1,
0.8515092, 0.4929213, -0.3851718, 1, 1, 1, 1, 1,
0.8560336, -0.1138317, 2.818498, 1, 1, 1, 1, 1,
0.8592302, 0.2399264, 1.123434, 1, 1, 1, 1, 1,
0.8755813, 1.49827, -0.6663442, 1, 1, 1, 1, 1,
0.8764986, -2.274774, 2.946932, 1, 1, 1, 1, 1,
0.8786463, -1.211427, 2.968395, 1, 1, 1, 1, 1,
0.8859369, -0.3359255, 0.7426896, 1, 1, 1, 1, 1,
0.8895446, -1.025177, 2.488589, 1, 1, 1, 1, 1,
0.8896992, -0.2075842, 2.352328, 1, 1, 1, 1, 1,
0.8907287, -0.7310475, 3.240152, 0, 0, 1, 1, 1,
0.8971151, 1.819143, 1.607845, 1, 0, 0, 1, 1,
0.8975624, 2.006984, 0.6792437, 1, 0, 0, 1, 1,
0.9052289, -0.2540213, 1.178275, 1, 0, 0, 1, 1,
0.9063795, -0.1731798, 2.029306, 1, 0, 0, 1, 1,
0.9128463, 2.107927, 0.06738771, 1, 0, 0, 1, 1,
0.9130523, -0.5522596, 0.5946586, 0, 0, 0, 1, 1,
0.9153209, -0.48629, 2.004375, 0, 0, 0, 1, 1,
0.9260545, -0.204492, 1.101466, 0, 0, 0, 1, 1,
0.9286925, -0.1392788, 1.801247, 0, 0, 0, 1, 1,
0.9325678, 0.01182329, 1.35148, 0, 0, 0, 1, 1,
0.9352846, 0.1851469, -0.4957161, 0, 0, 0, 1, 1,
0.9450569, -0.5391322, 2.814665, 0, 0, 0, 1, 1,
0.9577233, -2.828471, 1.879704, 1, 1, 1, 1, 1,
0.9607947, -2.308532, 2.402699, 1, 1, 1, 1, 1,
0.9635758, -0.01060689, 2.012507, 1, 1, 1, 1, 1,
0.9699067, 0.2407058, 0.3768981, 1, 1, 1, 1, 1,
0.9706942, -0.2748773, 3.255639, 1, 1, 1, 1, 1,
0.9725007, -1.076929, 2.615738, 1, 1, 1, 1, 1,
0.9775307, -1.593534, 2.568732, 1, 1, 1, 1, 1,
0.9777218, 1.272893, 0.3684521, 1, 1, 1, 1, 1,
0.9788386, 0.3313596, 1.269809, 1, 1, 1, 1, 1,
0.9934418, 1.747854, 1.864158, 1, 1, 1, 1, 1,
0.9936335, 1.091009, 1.141981, 1, 1, 1, 1, 1,
0.9975024, 1.480709, -0.3028499, 1, 1, 1, 1, 1,
0.9977282, 0.07416409, 1.776233, 1, 1, 1, 1, 1,
1.000665, 0.2659917, 0.6017907, 1, 1, 1, 1, 1,
1.01517, -0.9053469, 1.38861, 1, 1, 1, 1, 1,
1.017678, 0.2186818, 1.199785, 0, 0, 1, 1, 1,
1.018506, 1.104067, 0.01948837, 1, 0, 0, 1, 1,
1.023065, 0.6994905, 1.17162, 1, 0, 0, 1, 1,
1.025357, 0.0361054, 2.765985, 1, 0, 0, 1, 1,
1.032251, 1.223756, 0.1398852, 1, 0, 0, 1, 1,
1.032839, 1.358384, 1.458214, 1, 0, 0, 1, 1,
1.035156, 0.3796869, 1.721, 0, 0, 0, 1, 1,
1.03714, -0.9351996, 1.616996, 0, 0, 0, 1, 1,
1.042853, 0.1565106, 0.4330507, 0, 0, 0, 1, 1,
1.046385, -1.172625, 1.250949, 0, 0, 0, 1, 1,
1.05662, 0.6857852, 2.357507, 0, 0, 0, 1, 1,
1.057453, -0.6819295, 1.358345, 0, 0, 0, 1, 1,
1.057709, -1.379052, 3.244618, 0, 0, 0, 1, 1,
1.060576, 1.383092, 1.005621, 1, 1, 1, 1, 1,
1.065019, 0.4366198, 1.298616, 1, 1, 1, 1, 1,
1.071025, 0.3349917, 0.5434598, 1, 1, 1, 1, 1,
1.079257, -0.08328686, 1.363717, 1, 1, 1, 1, 1,
1.087421, 0.5321612, -0.02852173, 1, 1, 1, 1, 1,
1.095267, -0.7044981, 3.108952, 1, 1, 1, 1, 1,
1.095916, -0.5805941, 1.570951, 1, 1, 1, 1, 1,
1.104942, -1.008534, 2.717655, 1, 1, 1, 1, 1,
1.113402, -0.2989179, 1.34542, 1, 1, 1, 1, 1,
1.120152, -0.9499812, 2.716974, 1, 1, 1, 1, 1,
1.137161, -1.431851, 2.774635, 1, 1, 1, 1, 1,
1.139108, 1.884979, -0.4602804, 1, 1, 1, 1, 1,
1.147897, 1.3152, 0.3801042, 1, 1, 1, 1, 1,
1.151587, 1.649924, -0.7088272, 1, 1, 1, 1, 1,
1.163402, 0.758446, 1.572527, 1, 1, 1, 1, 1,
1.171126, 0.9379028, 1.690563, 0, 0, 1, 1, 1,
1.182408, -0.8762207, 3.525696, 1, 0, 0, 1, 1,
1.186068, -1.015887, 3.355859, 1, 0, 0, 1, 1,
1.187442, 0.7702847, 0.5291755, 1, 0, 0, 1, 1,
1.19112, 2.258262, 2.662154, 1, 0, 0, 1, 1,
1.198989, -1.206017, 3.714717, 1, 0, 0, 1, 1,
1.199582, 1.100075, 1.670445, 0, 0, 0, 1, 1,
1.209339, -0.8112088, 3.401389, 0, 0, 0, 1, 1,
1.21332, -0.7494584, 3.001649, 0, 0, 0, 1, 1,
1.214766, 0.5497945, 0.8557033, 0, 0, 0, 1, 1,
1.215891, 0.1096929, 1.813314, 0, 0, 0, 1, 1,
1.216029, 0.3459798, 1.381115, 0, 0, 0, 1, 1,
1.221681, 0.4092673, 0.4299915, 0, 0, 0, 1, 1,
1.223208, -0.7319402, 2.623698, 1, 1, 1, 1, 1,
1.249578, 0.7339374, 1.291482, 1, 1, 1, 1, 1,
1.255174, -0.1409126, 2.716992, 1, 1, 1, 1, 1,
1.265824, 0.6656667, 0.1165198, 1, 1, 1, 1, 1,
1.266616, -0.4834183, 3.082335, 1, 1, 1, 1, 1,
1.269594, 1.380036, 0.9640098, 1, 1, 1, 1, 1,
1.274773, -0.113276, 2.811235, 1, 1, 1, 1, 1,
1.283588, 1.113634, 1.238472, 1, 1, 1, 1, 1,
1.291491, -0.3629219, 2.175601, 1, 1, 1, 1, 1,
1.294098, -1.790447, 3.478722, 1, 1, 1, 1, 1,
1.303607, 0.2314324, 0.7519867, 1, 1, 1, 1, 1,
1.317033, -0.7990624, 2.75196, 1, 1, 1, 1, 1,
1.317588, 0.0453835, 1.904455, 1, 1, 1, 1, 1,
1.32254, -0.601545, 2.937187, 1, 1, 1, 1, 1,
1.323169, 0.9162643, 0.4559065, 1, 1, 1, 1, 1,
1.323233, 0.09508086, 1.36166, 0, 0, 1, 1, 1,
1.326589, 0.5772799, 1.345181, 1, 0, 0, 1, 1,
1.329941, 1.193652, 1.646364, 1, 0, 0, 1, 1,
1.330069, -0.7527724, 2.809641, 1, 0, 0, 1, 1,
1.333672, -0.6008266, 3.748747, 1, 0, 0, 1, 1,
1.335615, -0.5112687, 1.553047, 1, 0, 0, 1, 1,
1.33678, -0.5942987, 2.162185, 0, 0, 0, 1, 1,
1.337581, -0.01875728, 1.98685, 0, 0, 0, 1, 1,
1.337903, -2.070533, 2.673591, 0, 0, 0, 1, 1,
1.339393, -0.8087838, 2.086261, 0, 0, 0, 1, 1,
1.339427, -0.9740987, 2.487416, 0, 0, 0, 1, 1,
1.34239, 0.01679531, 0.3656211, 0, 0, 0, 1, 1,
1.349654, 0.3427715, 0.02891165, 0, 0, 0, 1, 1,
1.354864, -0.5408322, 1.031603, 1, 1, 1, 1, 1,
1.357557, -0.8109054, 2.201437, 1, 1, 1, 1, 1,
1.366202, 1.034063, 0.004797123, 1, 1, 1, 1, 1,
1.387594, -1.094954, 2.527536, 1, 1, 1, 1, 1,
1.388036, 1.170046, 0.3607796, 1, 1, 1, 1, 1,
1.388266, 0.5075006, 2.146452, 1, 1, 1, 1, 1,
1.398028, 0.1529459, 0.4363293, 1, 1, 1, 1, 1,
1.400251, -0.9418302, 1.734092, 1, 1, 1, 1, 1,
1.401051, -0.6711963, 0.3307047, 1, 1, 1, 1, 1,
1.411788, -0.2210366, 1.624366, 1, 1, 1, 1, 1,
1.419555, 0.5027523, 2.442746, 1, 1, 1, 1, 1,
1.421182, 0.5362564, 2.985615, 1, 1, 1, 1, 1,
1.422311, 0.9249032, -0.4270118, 1, 1, 1, 1, 1,
1.423909, 0.8968717, 0.398292, 1, 1, 1, 1, 1,
1.431603, 0.2953601, 1.51418, 1, 1, 1, 1, 1,
1.439315, -1.186538, 1.451594, 0, 0, 1, 1, 1,
1.443704, -0.6953818, 1.939453, 1, 0, 0, 1, 1,
1.447533, 1.274064, 0.8986307, 1, 0, 0, 1, 1,
1.449826, 1.297878, -0.8402484, 1, 0, 0, 1, 1,
1.495713, -1.785432, 3.780301, 1, 0, 0, 1, 1,
1.498021, -0.1534814, 2.095375, 1, 0, 0, 1, 1,
1.498406, -1.136463, 2.664183, 0, 0, 0, 1, 1,
1.500255, 2.095816, 2.135218, 0, 0, 0, 1, 1,
1.504547, 0.4314082, 0.5540939, 0, 0, 0, 1, 1,
1.521933, 1.268842, -0.9622516, 0, 0, 0, 1, 1,
1.542819, -0.5513243, 1.659667, 0, 0, 0, 1, 1,
1.543314, -0.2743205, 0.9223586, 0, 0, 0, 1, 1,
1.549269, 0.777796, -0.130083, 0, 0, 0, 1, 1,
1.555182, 0.3036073, -0.9376597, 1, 1, 1, 1, 1,
1.564402, 0.6935545, 1.039088, 1, 1, 1, 1, 1,
1.577684, 1.779836, -0.6621487, 1, 1, 1, 1, 1,
1.580482, -1.41513, 2.223958, 1, 1, 1, 1, 1,
1.587153, -0.2781117, 2.696895, 1, 1, 1, 1, 1,
1.588132, 1.254221, 1.25721, 1, 1, 1, 1, 1,
1.596203, -2.633022, 1.060006, 1, 1, 1, 1, 1,
1.596415, -0.8314605, 1.315335, 1, 1, 1, 1, 1,
1.650734, -0.2032031, 0.252541, 1, 1, 1, 1, 1,
1.653499, -0.8101223, 2.12365, 1, 1, 1, 1, 1,
1.667074, 0.3016531, 0.6980392, 1, 1, 1, 1, 1,
1.68514, -0.5958276, 4.525651, 1, 1, 1, 1, 1,
1.692958, -2.094839, 3.722978, 1, 1, 1, 1, 1,
1.700331, -0.103175, 3.293494, 1, 1, 1, 1, 1,
1.704738, -1.5779, 3.697835, 1, 1, 1, 1, 1,
1.705157, 0.3091023, 0.3868701, 0, 0, 1, 1, 1,
1.713334, 0.8836259, -0.7706299, 1, 0, 0, 1, 1,
1.718786, 0.3012594, 1.979689, 1, 0, 0, 1, 1,
1.72098, 0.3798563, 2.458383, 1, 0, 0, 1, 1,
1.72434, -0.7026507, 1.833803, 1, 0, 0, 1, 1,
1.724996, -1.483752, 2.065987, 1, 0, 0, 1, 1,
1.729787, 0.3805155, 1.747594, 0, 0, 0, 1, 1,
1.736567, 0.8595861, -0.108746, 0, 0, 0, 1, 1,
1.76, 0.9646684, 0.9928506, 0, 0, 0, 1, 1,
1.760471, -0.2178406, 1.405403, 0, 0, 0, 1, 1,
1.761665, -1.648487, 2.431958, 0, 0, 0, 1, 1,
1.770367, 0.04966979, -0.4097393, 0, 0, 0, 1, 1,
1.777107, -0.7329754, 0.9691712, 0, 0, 0, 1, 1,
1.780785, 1.441251, 0.2284715, 1, 1, 1, 1, 1,
1.792348, 1.765673, 0.2479616, 1, 1, 1, 1, 1,
1.819157, 1.146143, 1.187797, 1, 1, 1, 1, 1,
1.827393, 1.325904, 2.353333, 1, 1, 1, 1, 1,
1.832354, 0.7375491, 0.4949477, 1, 1, 1, 1, 1,
1.839815, 0.8606114, 0.2156078, 1, 1, 1, 1, 1,
1.922295, 2.083178, 1.720904, 1, 1, 1, 1, 1,
1.946103, -1.416483, 3.107177, 1, 1, 1, 1, 1,
1.957056, 1.78997, 1.39329, 1, 1, 1, 1, 1,
1.96802, -2.11307, 0.6431356, 1, 1, 1, 1, 1,
2.009661, -0.5081853, 1.869847, 1, 1, 1, 1, 1,
2.01487, -1.189755, 1.585247, 1, 1, 1, 1, 1,
2.020602, 0.4836193, 1.399155, 1, 1, 1, 1, 1,
2.066977, -1.125102, 1.488063, 1, 1, 1, 1, 1,
2.098984, -0.5697783, 2.136728, 1, 1, 1, 1, 1,
2.104537, -1.186532, 3.730654, 0, 0, 1, 1, 1,
2.156776, -0.1276309, 2.047138, 1, 0, 0, 1, 1,
2.1655, 0.1958768, 1.024174, 1, 0, 0, 1, 1,
2.169754, 0.1764183, 1.375688, 1, 0, 0, 1, 1,
2.172714, 0.2883418, -0.0321476, 1, 0, 0, 1, 1,
2.177368, 2.206807, 1.181641, 1, 0, 0, 1, 1,
2.275386, 0.218211, 1.488767, 0, 0, 0, 1, 1,
2.305906, 0.2007446, 0.9843849, 0, 0, 0, 1, 1,
2.372186, 0.3140776, 1.377616, 0, 0, 0, 1, 1,
2.469182, 0.6384474, 1.776877, 0, 0, 0, 1, 1,
2.496924, 0.9652205, -0.0274446, 0, 0, 0, 1, 1,
2.501063, -0.5708213, 1.7667, 0, 0, 0, 1, 1,
2.521962, -0.5996711, 3.90625, 0, 0, 0, 1, 1,
2.579055, 0.3924226, -0.7044035, 1, 1, 1, 1, 1,
2.614277, -0.2135121, 2.756644, 1, 1, 1, 1, 1,
2.669889, 0.9662508, 1.469222, 1, 1, 1, 1, 1,
2.744581, 0.6092339, 0.8079675, 1, 1, 1, 1, 1,
2.752218, -0.8172153, 1.261603, 1, 1, 1, 1, 1,
2.906126, -0.475935, 2.061156, 1, 1, 1, 1, 1,
3.440313, -0.9630454, 1.051855, 1, 1, 1, 1, 1
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
var radius = 9.985714;
var distance = 35.0744;
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
mvMatrix.translate( -0.2762274, 0.2820295, 0.5871167 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.0744);
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
