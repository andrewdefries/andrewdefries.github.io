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
-2.787866, -0.2164551, -1.968804, 1, 0, 0, 1,
-2.777541, 0.1751265, -0.4298171, 1, 0.007843138, 0, 1,
-2.653053, -1.369412, -0.177579, 1, 0.01176471, 0, 1,
-2.543856, 0.4286218, -2.298406, 1, 0.01960784, 0, 1,
-2.505706, -0.9604679, -2.395854, 1, 0.02352941, 0, 1,
-2.474919, 0.5478472, -1.329747, 1, 0.03137255, 0, 1,
-2.382826, -0.4457313, -3.712183, 1, 0.03529412, 0, 1,
-2.376639, -0.762399, -1.719727, 1, 0.04313726, 0, 1,
-2.34737, -1.122635, -1.381969, 1, 0.04705882, 0, 1,
-2.341636, 0.1718343, -0.9607681, 1, 0.05490196, 0, 1,
-2.315032, -0.01734767, -1.892576, 1, 0.05882353, 0, 1,
-2.276093, -1.110674, 0.08538116, 1, 0.06666667, 0, 1,
-2.251382, -1.481875, -2.679445, 1, 0.07058824, 0, 1,
-2.173184, 0.9312082, -0.7404824, 1, 0.07843138, 0, 1,
-2.121852, 0.1901859, -2.845889, 1, 0.08235294, 0, 1,
-2.10353, 0.0859635, -2.606609, 1, 0.09019608, 0, 1,
-2.102977, -1.515985, -2.825387, 1, 0.09411765, 0, 1,
-2.096205, 1.145895, 0.5129076, 1, 0.1019608, 0, 1,
-2.090039, 0.9475453, -2.131121, 1, 0.1098039, 0, 1,
-2.088906, 0.4909933, -0.6151969, 1, 0.1137255, 0, 1,
-2.086495, 0.3900301, -1.08017, 1, 0.1215686, 0, 1,
-2.084464, -1.754851, -1.338688, 1, 0.1254902, 0, 1,
-2.034794, -1.150023, -1.445792, 1, 0.1333333, 0, 1,
-1.957959, 0.4194351, -1.488579, 1, 0.1372549, 0, 1,
-1.954355, -0.1240214, -1.510794, 1, 0.145098, 0, 1,
-1.917777, 0.1145598, -2.150056, 1, 0.1490196, 0, 1,
-1.891341, -1.250109, 0.4347267, 1, 0.1568628, 0, 1,
-1.878009, -1.524701, -3.779162, 1, 0.1607843, 0, 1,
-1.866939, -1.736123, -2.89387, 1, 0.1686275, 0, 1,
-1.855659, 0.8410344, 0.4340516, 1, 0.172549, 0, 1,
-1.847723, 0.004890515, -2.685562, 1, 0.1803922, 0, 1,
-1.844336, 0.2977346, -0.9044038, 1, 0.1843137, 0, 1,
-1.834803, -0.2844349, -2.566597, 1, 0.1921569, 0, 1,
-1.829882, 2.826839, -0.4994082, 1, 0.1960784, 0, 1,
-1.794904, -0.2696426, -0.949187, 1, 0.2039216, 0, 1,
-1.793862, -0.9767269, -1.196519, 1, 0.2117647, 0, 1,
-1.773297, -0.00995099, -1.916011, 1, 0.2156863, 0, 1,
-1.742981, 0.2060897, -0.3252704, 1, 0.2235294, 0, 1,
-1.738962, 0.2551337, -1.763252, 1, 0.227451, 0, 1,
-1.7343, -1.040801, -2.465103, 1, 0.2352941, 0, 1,
-1.721385, -0.06667096, -2.159491, 1, 0.2392157, 0, 1,
-1.72124, -0.3635969, -1.514744, 1, 0.2470588, 0, 1,
-1.69003, -0.806279, -0.2436232, 1, 0.2509804, 0, 1,
-1.676009, 0.8708698, -2.276526, 1, 0.2588235, 0, 1,
-1.66836, 0.1250053, -1.631574, 1, 0.2627451, 0, 1,
-1.666919, 0.2342002, -0.445953, 1, 0.2705882, 0, 1,
-1.66451, -2.1755, -0.9947376, 1, 0.2745098, 0, 1,
-1.643822, -0.9320197, -3.049685, 1, 0.282353, 0, 1,
-1.643429, 0.1962312, -0.6189443, 1, 0.2862745, 0, 1,
-1.627172, 0.757734, -0.6771776, 1, 0.2941177, 0, 1,
-1.599068, -0.04304305, -1.834889, 1, 0.3019608, 0, 1,
-1.585157, -2.39472, -2.827727, 1, 0.3058824, 0, 1,
-1.577977, -0.002241601, -1.432694, 1, 0.3137255, 0, 1,
-1.577905, 0.5242515, 0.06443316, 1, 0.3176471, 0, 1,
-1.572392, 0.003995336, -0.8447982, 1, 0.3254902, 0, 1,
-1.566444, -0.4078585, -3.335968, 1, 0.3294118, 0, 1,
-1.552365, 0.5566657, -0.8306779, 1, 0.3372549, 0, 1,
-1.541693, -1.138304, -2.863272, 1, 0.3411765, 0, 1,
-1.539148, -0.428409, -1.620043, 1, 0.3490196, 0, 1,
-1.539063, -0.1959725, -3.036503, 1, 0.3529412, 0, 1,
-1.510182, -0.6844317, -2.254194, 1, 0.3607843, 0, 1,
-1.50111, -0.1954162, -1.248833, 1, 0.3647059, 0, 1,
-1.500679, -0.4820147, -2.025139, 1, 0.372549, 0, 1,
-1.496783, -1.421116, -1.843439, 1, 0.3764706, 0, 1,
-1.485047, -0.3226195, -0.681887, 1, 0.3843137, 0, 1,
-1.485006, -0.3097839, -1.363917, 1, 0.3882353, 0, 1,
-1.473039, 0.5605401, -1.355407, 1, 0.3960784, 0, 1,
-1.471055, -0.6975967, -2.430515, 1, 0.4039216, 0, 1,
-1.466406, 1.650583, -2.111437, 1, 0.4078431, 0, 1,
-1.458686, -0.5337588, -2.124908, 1, 0.4156863, 0, 1,
-1.453496, 1.312175, -0.1246941, 1, 0.4196078, 0, 1,
-1.443327, -0.7452571, -1.867919, 1, 0.427451, 0, 1,
-1.44062, -0.911976, -1.44304, 1, 0.4313726, 0, 1,
-1.438487, 1.936316, -0.6102099, 1, 0.4392157, 0, 1,
-1.435345, 0.3167972, -0.7671266, 1, 0.4431373, 0, 1,
-1.434342, 0.001960079, 0.01565382, 1, 0.4509804, 0, 1,
-1.432811, 2.234563, 0.7990944, 1, 0.454902, 0, 1,
-1.431402, -0.5429995, -1.406978, 1, 0.4627451, 0, 1,
-1.42328, 0.6353981, -2.845905, 1, 0.4666667, 0, 1,
-1.422954, 0.219238, -1.281226, 1, 0.4745098, 0, 1,
-1.422167, 1.730754, -1.759215, 1, 0.4784314, 0, 1,
-1.421186, -1.539846, -1.343626, 1, 0.4862745, 0, 1,
-1.419947, 1.435843, -0.1945651, 1, 0.4901961, 0, 1,
-1.418279, -0.8067673, -1.702043, 1, 0.4980392, 0, 1,
-1.418069, -0.006048521, 0.8068793, 1, 0.5058824, 0, 1,
-1.400746, 0.1186525, -2.062572, 1, 0.509804, 0, 1,
-1.387084, -0.1052742, -0.9179503, 1, 0.5176471, 0, 1,
-1.380968, 0.3675574, -0.7471189, 1, 0.5215687, 0, 1,
-1.377589, -1.678426, -2.417191, 1, 0.5294118, 0, 1,
-1.375977, -0.1529363, -2.394542, 1, 0.5333334, 0, 1,
-1.368691, -0.8042927, -0.9140469, 1, 0.5411765, 0, 1,
-1.364722, 0.08440173, -0.3399764, 1, 0.5450981, 0, 1,
-1.34957, -0.1557335, -1.820038, 1, 0.5529412, 0, 1,
-1.345465, 1.295232, -0.8926744, 1, 0.5568628, 0, 1,
-1.32182, -0.2932992, -1.850216, 1, 0.5647059, 0, 1,
-1.31657, -0.1287183, -2.084337, 1, 0.5686275, 0, 1,
-1.313816, 0.8468903, -0.2728142, 1, 0.5764706, 0, 1,
-1.303777, 1.380443, 0.4666451, 1, 0.5803922, 0, 1,
-1.297565, 0.9636586, 0.2218471, 1, 0.5882353, 0, 1,
-1.264241, -0.1003023, 0.08252556, 1, 0.5921569, 0, 1,
-1.26056, -0.9499305, -2.8181, 1, 0.6, 0, 1,
-1.255243, 1.725057, -0.215506, 1, 0.6078432, 0, 1,
-1.253844, -0.5073877, -2.333966, 1, 0.6117647, 0, 1,
-1.252722, -0.05375313, -3.072911, 1, 0.6196079, 0, 1,
-1.247409, -0.1803118, -1.624269, 1, 0.6235294, 0, 1,
-1.241872, -0.4148052, -3.521113, 1, 0.6313726, 0, 1,
-1.233545, -0.1285833, -1.00398, 1, 0.6352941, 0, 1,
-1.233285, 1.182261, -0.5333338, 1, 0.6431373, 0, 1,
-1.23281, -0.3372151, -1.776299, 1, 0.6470588, 0, 1,
-1.231942, 0.4768062, -0.07705468, 1, 0.654902, 0, 1,
-1.230659, -0.2757559, -1.62111, 1, 0.6588235, 0, 1,
-1.228726, 0.2701532, -2.220239, 1, 0.6666667, 0, 1,
-1.22184, -0.5382804, -3.312167, 1, 0.6705883, 0, 1,
-1.218647, 0.8221854, -1.662288, 1, 0.6784314, 0, 1,
-1.21418, -0.1517097, -2.750414, 1, 0.682353, 0, 1,
-1.212446, -0.348713, -1.667563, 1, 0.6901961, 0, 1,
-1.212435, 2.1156, -0.3329257, 1, 0.6941177, 0, 1,
-1.209949, -0.9893344, -2.646388, 1, 0.7019608, 0, 1,
-1.209588, -0.4383433, -2.417632, 1, 0.7098039, 0, 1,
-1.20485, -0.1870282, -2.554831, 1, 0.7137255, 0, 1,
-1.199741, -1.868155, -2.376265, 1, 0.7215686, 0, 1,
-1.197642, -1.904844, -2.921525, 1, 0.7254902, 0, 1,
-1.18978, -1.316717, -1.965883, 1, 0.7333333, 0, 1,
-1.178282, -1.522733, -1.449919, 1, 0.7372549, 0, 1,
-1.16331, 0.6176507, -1.084844, 1, 0.7450981, 0, 1,
-1.158528, -0.07953358, -3.114702, 1, 0.7490196, 0, 1,
-1.156264, -1.321301, -2.56863, 1, 0.7568628, 0, 1,
-1.15198, 0.6311547, -1.091131, 1, 0.7607843, 0, 1,
-1.150525, 0.1597862, -0.9645032, 1, 0.7686275, 0, 1,
-1.148273, -0.2885864, -1.37383, 1, 0.772549, 0, 1,
-1.148267, -0.5997654, -1.905663, 1, 0.7803922, 0, 1,
-1.137609, 0.3642789, 1.191056, 1, 0.7843137, 0, 1,
-1.13623, 0.05716071, -2.181677, 1, 0.7921569, 0, 1,
-1.133456, -0.19515, -1.464768, 1, 0.7960784, 0, 1,
-1.12751, 2.036264, -0.01327312, 1, 0.8039216, 0, 1,
-1.120144, -0.6554503, -2.445085, 1, 0.8117647, 0, 1,
-1.108816, -0.04028667, -1.77827, 1, 0.8156863, 0, 1,
-1.106073, -0.2217403, -1.597785, 1, 0.8235294, 0, 1,
-1.090938, 0.524331, -2.620835, 1, 0.827451, 0, 1,
-1.088163, 1.439207, -1.448256, 1, 0.8352941, 0, 1,
-1.087791, -0.4777211, -1.797504, 1, 0.8392157, 0, 1,
-1.082965, -0.8118395, -2.219313, 1, 0.8470588, 0, 1,
-1.082737, -0.6702889, -1.405699, 1, 0.8509804, 0, 1,
-1.082159, -0.08464353, -0.4236906, 1, 0.8588235, 0, 1,
-1.072812, -1.3037, -2.470767, 1, 0.8627451, 0, 1,
-1.061141, 1.068111, -1.517604, 1, 0.8705882, 0, 1,
-1.052629, 0.6558086, -3.548802, 1, 0.8745098, 0, 1,
-1.05108, -0.290806, -1.82025, 1, 0.8823529, 0, 1,
-1.049089, 1.882146, -1.488249, 1, 0.8862745, 0, 1,
-1.04455, 0.4144776, -1.020904, 1, 0.8941177, 0, 1,
-1.041237, 1.240076, -0.5873307, 1, 0.8980392, 0, 1,
-1.04011, 0.2401041, -0.8828958, 1, 0.9058824, 0, 1,
-1.036978, -0.5330522, -1.845763, 1, 0.9137255, 0, 1,
-1.033918, -0.5314425, -2.7566, 1, 0.9176471, 0, 1,
-1.024405, 0.02889293, -1.077031, 1, 0.9254902, 0, 1,
-1.019431, -0.3148431, -0.7492223, 1, 0.9294118, 0, 1,
-1.017444, 1.496024, -1.667337, 1, 0.9372549, 0, 1,
-1.013519, -0.5434623, -3.846674, 1, 0.9411765, 0, 1,
-1.012281, 0.8063609, -1.233232, 1, 0.9490196, 0, 1,
-1.011997, -1.656399, -1.605255, 1, 0.9529412, 0, 1,
-1.009228, 1.646056, 0.345995, 1, 0.9607843, 0, 1,
-1.008104, 0.5611352, 0.1068802, 1, 0.9647059, 0, 1,
-1.00519, 1.515982, 0.6213742, 1, 0.972549, 0, 1,
-1.004012, 0.68274, -2.917268, 1, 0.9764706, 0, 1,
-1.003597, 0.6221959, -1.103209, 1, 0.9843137, 0, 1,
-0.9969147, 0.8815505, -2.93516, 1, 0.9882353, 0, 1,
-0.9947462, 1.659351, -1.584369, 1, 0.9960784, 0, 1,
-0.9913414, -1.139297, -2.812844, 0.9960784, 1, 0, 1,
-0.9882722, 0.7487605, 0.6532372, 0.9921569, 1, 0, 1,
-0.9850751, 1.917541, -0.4518072, 0.9843137, 1, 0, 1,
-0.9833896, 0.3377773, -1.865767, 0.9803922, 1, 0, 1,
-0.9802907, 0.3385619, -1.298937, 0.972549, 1, 0, 1,
-0.9633773, 0.5593112, -1.365873, 0.9686275, 1, 0, 1,
-0.962954, -0.192681, -1.034053, 0.9607843, 1, 0, 1,
-0.9545078, -0.379042, -1.581324, 0.9568627, 1, 0, 1,
-0.9527394, 1.236673, -0.392738, 0.9490196, 1, 0, 1,
-0.9480303, -1.235595, -3.34431, 0.945098, 1, 0, 1,
-0.9453302, -1.120123, -0.5779668, 0.9372549, 1, 0, 1,
-0.9364911, 1.59102, 0.177754, 0.9333333, 1, 0, 1,
-0.9350562, 1.235316, -1.513108, 0.9254902, 1, 0, 1,
-0.9292539, -0.6811748, -2.492259, 0.9215686, 1, 0, 1,
-0.9248021, -1.028431, -2.785988, 0.9137255, 1, 0, 1,
-0.9084643, -2.14609, -1.352569, 0.9098039, 1, 0, 1,
-0.9039546, 1.592654, -1.77521, 0.9019608, 1, 0, 1,
-0.9024582, -0.1874066, -2.833355, 0.8941177, 1, 0, 1,
-0.8955896, 0.8714987, 0.7425963, 0.8901961, 1, 0, 1,
-0.8904709, 0.4659692, -2.044965, 0.8823529, 1, 0, 1,
-0.8902839, -0.4140789, -2.364056, 0.8784314, 1, 0, 1,
-0.888021, 0.932739, -0.5181904, 0.8705882, 1, 0, 1,
-0.8875034, 0.2210331, -1.049595, 0.8666667, 1, 0, 1,
-0.8831481, -0.3329338, -2.686297, 0.8588235, 1, 0, 1,
-0.8820387, -0.8129414, -3.208115, 0.854902, 1, 0, 1,
-0.8819605, -0.1915556, -0.414381, 0.8470588, 1, 0, 1,
-0.8748751, -1.447785, -4.281917, 0.8431373, 1, 0, 1,
-0.8731259, 0.9422644, -0.5573404, 0.8352941, 1, 0, 1,
-0.8700947, -0.9759595, -0.2290351, 0.8313726, 1, 0, 1,
-0.8622971, 1.101581, -0.7611654, 0.8235294, 1, 0, 1,
-0.8554322, 0.5327623, 0.05501557, 0.8196079, 1, 0, 1,
-0.8553466, 0.2790476, -0.5588682, 0.8117647, 1, 0, 1,
-0.8481482, 0.5191883, -1.884921, 0.8078431, 1, 0, 1,
-0.840939, 0.5023571, -1.641083, 0.8, 1, 0, 1,
-0.8359675, 0.07440557, -0.4832076, 0.7921569, 1, 0, 1,
-0.8277259, 1.991888, -1.182704, 0.7882353, 1, 0, 1,
-0.8276137, 1.617525, -2.623898, 0.7803922, 1, 0, 1,
-0.8270961, -0.5420317, -2.956759, 0.7764706, 1, 0, 1,
-0.8242708, -1.682703, -4.406594, 0.7686275, 1, 0, 1,
-0.8233582, -0.4871348, -3.481681, 0.7647059, 1, 0, 1,
-0.820618, -0.5920121, -2.899351, 0.7568628, 1, 0, 1,
-0.8194761, -0.007732832, 0.3807084, 0.7529412, 1, 0, 1,
-0.8177356, 0.2521359, -2.22657, 0.7450981, 1, 0, 1,
-0.790033, -0.5436188, -3.547371, 0.7411765, 1, 0, 1,
-0.7877507, 0.4193975, 1.016371, 0.7333333, 1, 0, 1,
-0.7765009, 0.5686071, -1.424787, 0.7294118, 1, 0, 1,
-0.7756485, -1.102911, -0.5962718, 0.7215686, 1, 0, 1,
-0.7750314, -1.537203, -4.969357, 0.7176471, 1, 0, 1,
-0.769492, -0.8091332, -2.073892, 0.7098039, 1, 0, 1,
-0.7687607, -0.1271404, 0.3884415, 0.7058824, 1, 0, 1,
-0.7594736, 0.895728, -0.8574868, 0.6980392, 1, 0, 1,
-0.7568759, -1.100409, -2.388745, 0.6901961, 1, 0, 1,
-0.7535038, 0.05812424, -2.535608, 0.6862745, 1, 0, 1,
-0.7504067, 0.9127851, -2.624433, 0.6784314, 1, 0, 1,
-0.7498308, -0.7028176, -2.236829, 0.6745098, 1, 0, 1,
-0.7486117, -0.4668593, -2.902555, 0.6666667, 1, 0, 1,
-0.7484098, 1.270916, 0.6090339, 0.6627451, 1, 0, 1,
-0.7449569, 1.947355, -0.8154665, 0.654902, 1, 0, 1,
-0.7403405, 0.9002047, -0.3924546, 0.6509804, 1, 0, 1,
-0.739933, -0.065855, -3.017459, 0.6431373, 1, 0, 1,
-0.7342629, 0.7542337, -0.4388828, 0.6392157, 1, 0, 1,
-0.7335069, 1.813385, -0.07297586, 0.6313726, 1, 0, 1,
-0.7264126, -0.501583, -2.711566, 0.627451, 1, 0, 1,
-0.7259988, 0.2288186, -0.5809216, 0.6196079, 1, 0, 1,
-0.7234833, 0.8079751, 0.4572287, 0.6156863, 1, 0, 1,
-0.7207057, -1.019462, -3.332214, 0.6078432, 1, 0, 1,
-0.7188033, -0.3373951, -2.435745, 0.6039216, 1, 0, 1,
-0.7180739, 0.3234523, 0.5582314, 0.5960785, 1, 0, 1,
-0.7098705, -1.346815, -3.106862, 0.5882353, 1, 0, 1,
-0.7096919, 1.027584, -0.5101235, 0.5843138, 1, 0, 1,
-0.7087381, -1.490818, -2.257818, 0.5764706, 1, 0, 1,
-0.7069116, 0.2220058, -1.417843, 0.572549, 1, 0, 1,
-0.705348, 1.232318, -0.9482744, 0.5647059, 1, 0, 1,
-0.7050608, -0.06065173, -2.198862, 0.5607843, 1, 0, 1,
-0.7022948, 0.1243309, -2.28904, 0.5529412, 1, 0, 1,
-0.6931533, 1.246216, -0.06370407, 0.5490196, 1, 0, 1,
-0.6895117, 0.9547523, -2.551652, 0.5411765, 1, 0, 1,
-0.6868954, -0.2714089, -0.6031291, 0.5372549, 1, 0, 1,
-0.6845595, -0.0665868, -0.6181986, 0.5294118, 1, 0, 1,
-0.6771715, 0.68751, 0.3441867, 0.5254902, 1, 0, 1,
-0.6735058, 1.870713, 0.5133364, 0.5176471, 1, 0, 1,
-0.6667106, 0.5087504, -1.464439, 0.5137255, 1, 0, 1,
-0.6639977, -0.1771611, -2.289073, 0.5058824, 1, 0, 1,
-0.6616676, -1.049538, -3.152603, 0.5019608, 1, 0, 1,
-0.6578314, -0.1265569, -1.761456, 0.4941176, 1, 0, 1,
-0.6552876, -0.6451781, -2.299324, 0.4862745, 1, 0, 1,
-0.6510217, -1.164969, -2.58274, 0.4823529, 1, 0, 1,
-0.6480847, -0.9528988, -2.856261, 0.4745098, 1, 0, 1,
-0.647482, -0.1654672, -1.286512, 0.4705882, 1, 0, 1,
-0.6424385, -1.112786, -2.321982, 0.4627451, 1, 0, 1,
-0.6423047, 1.072273, -1.622784, 0.4588235, 1, 0, 1,
-0.6399794, 2.47075, 1.37696, 0.4509804, 1, 0, 1,
-0.6355613, -0.3568181, -2.663338, 0.4470588, 1, 0, 1,
-0.634379, 0.2599744, -1.066477, 0.4392157, 1, 0, 1,
-0.6342939, 1.327282, 0.5106557, 0.4352941, 1, 0, 1,
-0.6337422, -0.1638707, -1.087209, 0.427451, 1, 0, 1,
-0.6333036, -0.2897136, -2.868563, 0.4235294, 1, 0, 1,
-0.6290879, -1.326862, -2.025188, 0.4156863, 1, 0, 1,
-0.6255978, 1.393213, -0.723861, 0.4117647, 1, 0, 1,
-0.6182023, -0.1085754, -2.518188, 0.4039216, 1, 0, 1,
-0.6178208, -0.4925363, -1.931465, 0.3960784, 1, 0, 1,
-0.6146101, -0.8500096, -2.493574, 0.3921569, 1, 0, 1,
-0.6110995, -1.231119, -4.911314, 0.3843137, 1, 0, 1,
-0.6092979, -0.3873328, -3.372421, 0.3803922, 1, 0, 1,
-0.6027201, 0.82684, -1.573484, 0.372549, 1, 0, 1,
-0.6013752, 0.8437906, 0.09885066, 0.3686275, 1, 0, 1,
-0.5980113, -0.2198796, -1.508991, 0.3607843, 1, 0, 1,
-0.5956622, 1.17826, 0.7036834, 0.3568628, 1, 0, 1,
-0.5955312, -0.884707, -3.648451, 0.3490196, 1, 0, 1,
-0.5941592, 1.620663, -1.104924, 0.345098, 1, 0, 1,
-0.5941207, -2.848286, -3.327815, 0.3372549, 1, 0, 1,
-0.5929591, -0.978682, -2.03337, 0.3333333, 1, 0, 1,
-0.5903984, 0.6162138, 0.1712938, 0.3254902, 1, 0, 1,
-0.5896479, -0.067463, -2.044258, 0.3215686, 1, 0, 1,
-0.5857795, 1.574054, 0.655163, 0.3137255, 1, 0, 1,
-0.5812428, 0.3421271, -1.459549, 0.3098039, 1, 0, 1,
-0.580693, -1.023131, -2.162969, 0.3019608, 1, 0, 1,
-0.580571, 1.080336, -0.6956137, 0.2941177, 1, 0, 1,
-0.5778919, -0.318157, -1.726855, 0.2901961, 1, 0, 1,
-0.5677453, 0.5037884, -2.006793, 0.282353, 1, 0, 1,
-0.5658402, -0.6350186, -3.303295, 0.2784314, 1, 0, 1,
-0.5642745, 0.7293275, -0.9373533, 0.2705882, 1, 0, 1,
-0.5631323, 0.5892801, -1.655391, 0.2666667, 1, 0, 1,
-0.5624515, -1.168067, -3.588597, 0.2588235, 1, 0, 1,
-0.5524763, -0.4967414, -2.374866, 0.254902, 1, 0, 1,
-0.5515576, 1.291985, -0.9016877, 0.2470588, 1, 0, 1,
-0.5499862, 0.2358308, -1.13929, 0.2431373, 1, 0, 1,
-0.5494582, 0.6932638, 0.1895273, 0.2352941, 1, 0, 1,
-0.5476271, 0.01966725, -2.420347, 0.2313726, 1, 0, 1,
-0.5442597, -0.01347616, -0.6776161, 0.2235294, 1, 0, 1,
-0.5414176, -0.3033314, -2.472161, 0.2196078, 1, 0, 1,
-0.5398834, 0.307531, -0.4319527, 0.2117647, 1, 0, 1,
-0.530268, 0.968104, 0.04050027, 0.2078431, 1, 0, 1,
-0.5299361, 0.2802985, -0.1439499, 0.2, 1, 0, 1,
-0.5292839, 0.09641113, 0.2266244, 0.1921569, 1, 0, 1,
-0.5187541, 0.697988, -1.26217, 0.1882353, 1, 0, 1,
-0.5164289, -0.002584869, -2.267753, 0.1803922, 1, 0, 1,
-0.5109534, 0.5574319, -1.296742, 0.1764706, 1, 0, 1,
-0.4993816, 0.264432, -0.1365148, 0.1686275, 1, 0, 1,
-0.4971795, 0.4823537, -0.02226107, 0.1647059, 1, 0, 1,
-0.4961091, 0.9141163, -0.8011219, 0.1568628, 1, 0, 1,
-0.4959729, -1.568204, -2.736498, 0.1529412, 1, 0, 1,
-0.4921924, 0.2461218, -1.373582, 0.145098, 1, 0, 1,
-0.4880571, 0.7537155, -1.475093, 0.1411765, 1, 0, 1,
-0.4862526, -0.5416805, -1.647909, 0.1333333, 1, 0, 1,
-0.484015, 0.6687946, -0.8338898, 0.1294118, 1, 0, 1,
-0.4838609, 0.3825208, -0.7455686, 0.1215686, 1, 0, 1,
-0.4817207, -0.8229876, -2.173738, 0.1176471, 1, 0, 1,
-0.4807834, 0.8398967, -3.433141, 0.1098039, 1, 0, 1,
-0.4775678, -1.336028, -2.258229, 0.1058824, 1, 0, 1,
-0.4774674, -1.248698, -1.578395, 0.09803922, 1, 0, 1,
-0.4770918, -2.002713, -1.229221, 0.09019608, 1, 0, 1,
-0.47501, 0.2771877, -2.160383, 0.08627451, 1, 0, 1,
-0.4702102, 0.2329903, 0.1613832, 0.07843138, 1, 0, 1,
-0.4694356, -0.09167183, -1.392, 0.07450981, 1, 0, 1,
-0.467054, -0.5837071, -1.44573, 0.06666667, 1, 0, 1,
-0.4669327, 0.831409, -0.3899725, 0.0627451, 1, 0, 1,
-0.464164, -1.245507, -3.183779, 0.05490196, 1, 0, 1,
-0.4526215, -1.133039, -3.020179, 0.05098039, 1, 0, 1,
-0.4508011, 1.138351, -0.7356843, 0.04313726, 1, 0, 1,
-0.4454222, -0.592521, -3.305805, 0.03921569, 1, 0, 1,
-0.4411316, 0.3874701, -1.136589, 0.03137255, 1, 0, 1,
-0.4407244, 0.7894967, -0.7262921, 0.02745098, 1, 0, 1,
-0.4377551, 1.103865, -0.6585529, 0.01960784, 1, 0, 1,
-0.4356898, 1.144494, -0.5882737, 0.01568628, 1, 0, 1,
-0.4311273, 0.2740684, 0.5572454, 0.007843138, 1, 0, 1,
-0.4227807, 0.2679685, -1.908822, 0.003921569, 1, 0, 1,
-0.4214619, 0.6151813, -0.6705754, 0, 1, 0.003921569, 1,
-0.4212265, -0.1671147, -2.740621, 0, 1, 0.01176471, 1,
-0.4187072, -0.5961989, -2.025615, 0, 1, 0.01568628, 1,
-0.4178066, -1.449914, -2.964113, 0, 1, 0.02352941, 1,
-0.4156371, -0.4843121, -2.312012, 0, 1, 0.02745098, 1,
-0.4146588, -0.0278315, -1.26456, 0, 1, 0.03529412, 1,
-0.4137631, -0.3453196, -0.5600592, 0, 1, 0.03921569, 1,
-0.4119202, -2.230469, -3.006828, 0, 1, 0.04705882, 1,
-0.4086927, -0.06949215, -0.7822384, 0, 1, 0.05098039, 1,
-0.4068513, -0.7806583, -3.515091, 0, 1, 0.05882353, 1,
-0.3936294, 0.5631734, 0.7923865, 0, 1, 0.0627451, 1,
-0.3931991, -0.1163878, -2.622006, 0, 1, 0.07058824, 1,
-0.3868347, -0.4367177, -4.551372, 0, 1, 0.07450981, 1,
-0.3811305, -0.6437606, -3.089985, 0, 1, 0.08235294, 1,
-0.3780177, -0.05903396, -1.546007, 0, 1, 0.08627451, 1,
-0.3750413, 0.7862272, -0.8425283, 0, 1, 0.09411765, 1,
-0.372283, 1.616195, 0.998993, 0, 1, 0.1019608, 1,
-0.3710141, -0.5506904, -2.757929, 0, 1, 0.1058824, 1,
-0.3606652, -0.6797397, -3.531278, 0, 1, 0.1137255, 1,
-0.3562555, 2.256635, 0.2496114, 0, 1, 0.1176471, 1,
-0.3522998, 1.22629, -1.899832, 0, 1, 0.1254902, 1,
-0.3490843, -0.1878723, -2.071161, 0, 1, 0.1294118, 1,
-0.3487689, 0.9773, -0.5812938, 0, 1, 0.1372549, 1,
-0.3440753, -0.07359131, -2.146132, 0, 1, 0.1411765, 1,
-0.3393248, 0.7757663, 2.013858, 0, 1, 0.1490196, 1,
-0.3380044, -0.1999729, -0.606856, 0, 1, 0.1529412, 1,
-0.3377383, -0.3927253, -1.792993, 0, 1, 0.1607843, 1,
-0.3340364, 0.1525655, -1.203615, 0, 1, 0.1647059, 1,
-0.3315063, 0.09348002, -1.551871, 0, 1, 0.172549, 1,
-0.3254986, 0.2852802, -1.839275, 0, 1, 0.1764706, 1,
-0.3217131, -2.720524, -3.269491, 0, 1, 0.1843137, 1,
-0.3214817, 2.216126, -0.1613311, 0, 1, 0.1882353, 1,
-0.3198015, -0.3042746, -3.035774, 0, 1, 0.1960784, 1,
-0.3168309, -0.7695235, -2.047784, 0, 1, 0.2039216, 1,
-0.3140554, 1.223482, -0.09925935, 0, 1, 0.2078431, 1,
-0.313348, 0.03161187, -2.047785, 0, 1, 0.2156863, 1,
-0.3091041, -0.9995044, -3.225167, 0, 1, 0.2196078, 1,
-0.309047, -1.151381, -4.706966, 0, 1, 0.227451, 1,
-0.3062947, -0.7446246, -2.70538, 0, 1, 0.2313726, 1,
-0.305423, -0.6317875, -2.600582, 0, 1, 0.2392157, 1,
-0.2916637, 0.4368023, -1.578938, 0, 1, 0.2431373, 1,
-0.289593, -0.9031033, -1.624339, 0, 1, 0.2509804, 1,
-0.2835928, -0.8026214, -2.495306, 0, 1, 0.254902, 1,
-0.279522, 1.43762, 0.2808555, 0, 1, 0.2627451, 1,
-0.278774, 0.5888719, -0.7054393, 0, 1, 0.2666667, 1,
-0.2781369, 1.510641, 1.024205, 0, 1, 0.2745098, 1,
-0.277603, -0.9105592, -3.534508, 0, 1, 0.2784314, 1,
-0.2737968, -0.239109, -3.246811, 0, 1, 0.2862745, 1,
-0.2676359, 1.614228, -1.648668, 0, 1, 0.2901961, 1,
-0.2669356, 1.940478, -1.3918, 0, 1, 0.2980392, 1,
-0.2632166, 1.050369, -0.3929194, 0, 1, 0.3058824, 1,
-0.2600417, 0.2921164, -0.8656648, 0, 1, 0.3098039, 1,
-0.2543249, 0.04125896, -0.9017898, 0, 1, 0.3176471, 1,
-0.252233, -0.2812126, -1.208832, 0, 1, 0.3215686, 1,
-0.2514148, -0.2293055, -2.736762, 0, 1, 0.3294118, 1,
-0.2487481, -2.355839, -4.409237, 0, 1, 0.3333333, 1,
-0.2480441, -1.448662, -1.664992, 0, 1, 0.3411765, 1,
-0.2454149, -0.4892274, -1.73482, 0, 1, 0.345098, 1,
-0.2421213, 0.6233288, -1.242613, 0, 1, 0.3529412, 1,
-0.2357338, -0.5775837, -3.718708, 0, 1, 0.3568628, 1,
-0.2340516, -0.3485633, -0.2478968, 0, 1, 0.3647059, 1,
-0.2265915, -1.074926, -2.102168, 0, 1, 0.3686275, 1,
-0.2231482, 1.139772, 0.6904694, 0, 1, 0.3764706, 1,
-0.2170974, -1.261294, -0.1501384, 0, 1, 0.3803922, 1,
-0.2110264, 0.4898247, -1.441971, 0, 1, 0.3882353, 1,
-0.2100188, 0.4110951, 0.5055802, 0, 1, 0.3921569, 1,
-0.2067223, -0.04093945, -2.927782, 0, 1, 0.4, 1,
-0.206318, -0.9190866, -3.368981, 0, 1, 0.4078431, 1,
-0.2026157, 1.608004, 1.632272, 0, 1, 0.4117647, 1,
-0.2015591, 0.8304009, 0.3136817, 0, 1, 0.4196078, 1,
-0.1991142, -1.367212, -3.012859, 0, 1, 0.4235294, 1,
-0.1975725, -0.7204601, -1.35064, 0, 1, 0.4313726, 1,
-0.1967367, 0.114367, -1.088862, 0, 1, 0.4352941, 1,
-0.1962369, -1.810664, -3.666511, 0, 1, 0.4431373, 1,
-0.1960809, 0.5310155, -0.71249, 0, 1, 0.4470588, 1,
-0.1953903, 0.3151574, -1.065536, 0, 1, 0.454902, 1,
-0.1938382, -0.1296319, -3.611102, 0, 1, 0.4588235, 1,
-0.1936646, -0.1305439, -3.295481, 0, 1, 0.4666667, 1,
-0.1933145, -1.147306, -3.473335, 0, 1, 0.4705882, 1,
-0.192441, 0.8592795, -0.287522, 0, 1, 0.4784314, 1,
-0.1923824, -1.345603, -3.726749, 0, 1, 0.4823529, 1,
-0.1868228, -2.332597, -1.538218, 0, 1, 0.4901961, 1,
-0.184808, -0.4816796, -2.117677, 0, 1, 0.4941176, 1,
-0.1804914, 0.7001982, -1.190228, 0, 1, 0.5019608, 1,
-0.1802084, -0.1039412, -2.508668, 0, 1, 0.509804, 1,
-0.1801868, 0.8342054, -0.8637676, 0, 1, 0.5137255, 1,
-0.1786184, -1.593165, -2.483207, 0, 1, 0.5215687, 1,
-0.1776934, 0.05660962, -0.921025, 0, 1, 0.5254902, 1,
-0.1692664, -1.36746, -2.036888, 0, 1, 0.5333334, 1,
-0.1639265, 0.926093, 0.3872401, 0, 1, 0.5372549, 1,
-0.1633017, -0.3948808, -2.02231, 0, 1, 0.5450981, 1,
-0.1614828, 0.2242578, -2.107803, 0, 1, 0.5490196, 1,
-0.1581405, -0.02186615, -1.712903, 0, 1, 0.5568628, 1,
-0.1576055, -0.1062349, -1.318233, 0, 1, 0.5607843, 1,
-0.1567756, -0.08804792, -1.394944, 0, 1, 0.5686275, 1,
-0.1564916, 0.6837702, -0.9977725, 0, 1, 0.572549, 1,
-0.1535928, 0.8755452, -0.6388281, 0, 1, 0.5803922, 1,
-0.1489486, 1.448371, 0.5159156, 0, 1, 0.5843138, 1,
-0.138253, 0.8265007, 0.9897095, 0, 1, 0.5921569, 1,
-0.1352095, 1.140129, -0.1957542, 0, 1, 0.5960785, 1,
-0.1290024, -0.02750027, -1.89537, 0, 1, 0.6039216, 1,
-0.1276977, -0.5859637, -3.083559, 0, 1, 0.6117647, 1,
-0.1216031, 0.1219177, 0.1930317, 0, 1, 0.6156863, 1,
-0.1190785, -0.7146657, -1.754813, 0, 1, 0.6235294, 1,
-0.117428, 1.223399, -1.304556, 0, 1, 0.627451, 1,
-0.1167902, -0.9796258, -2.449836, 0, 1, 0.6352941, 1,
-0.1151088, -0.805661, -3.446348, 0, 1, 0.6392157, 1,
-0.1111859, -0.734332, -3.700788, 0, 1, 0.6470588, 1,
-0.101576, -0.2118905, -2.157744, 0, 1, 0.6509804, 1,
-0.09932117, 1.696313, -2.286566, 0, 1, 0.6588235, 1,
-0.09896182, -1.24834, -4.157149, 0, 1, 0.6627451, 1,
-0.09827238, -0.1931501, -3.300806, 0, 1, 0.6705883, 1,
-0.09677195, -1.759192, -4.049649, 0, 1, 0.6745098, 1,
-0.09498905, -0.2969982, -2.466156, 0, 1, 0.682353, 1,
-0.09348909, -1.042576, -2.279036, 0, 1, 0.6862745, 1,
-0.09330215, -0.9864388, -4.568792, 0, 1, 0.6941177, 1,
-0.09108362, -1.639778, -0.9794195, 0, 1, 0.7019608, 1,
-0.0821317, 0.3336583, -0.7198186, 0, 1, 0.7058824, 1,
-0.07888924, 0.5029441, -0.4892985, 0, 1, 0.7137255, 1,
-0.07847647, 0.1913771, -1.834367, 0, 1, 0.7176471, 1,
-0.07682204, -0.6923, -2.83686, 0, 1, 0.7254902, 1,
-0.07486267, -0.02866913, -1.881625, 0, 1, 0.7294118, 1,
-0.07422451, 0.9162788, 1.782377, 0, 1, 0.7372549, 1,
-0.06993802, -1.164344, -4.813026, 0, 1, 0.7411765, 1,
-0.06991783, 0.7590189, 0.2870994, 0, 1, 0.7490196, 1,
-0.06797622, -0.7530848, -4.33863, 0, 1, 0.7529412, 1,
-0.06749041, 0.2470383, -1.727877, 0, 1, 0.7607843, 1,
-0.06427394, 0.404132, 0.7376239, 0, 1, 0.7647059, 1,
-0.06207452, -0.4829611, -3.019507, 0, 1, 0.772549, 1,
-0.06160044, 1.247871, -1.50242, 0, 1, 0.7764706, 1,
-0.0604655, 1.044058, -0.8599833, 0, 1, 0.7843137, 1,
-0.05870245, 1.732101, 0.3487394, 0, 1, 0.7882353, 1,
-0.05599456, -0.3892794, -3.21298, 0, 1, 0.7960784, 1,
-0.05213849, -0.1036283, -4.737476, 0, 1, 0.8039216, 1,
-0.05104035, -0.9816741, -2.370716, 0, 1, 0.8078431, 1,
-0.04758881, -0.941922, -2.513092, 0, 1, 0.8156863, 1,
-0.04601666, 1.993242, 1.53702, 0, 1, 0.8196079, 1,
-0.04583838, 0.3721924, 0.08642439, 0, 1, 0.827451, 1,
-0.0454215, -0.3044941, -4.728087, 0, 1, 0.8313726, 1,
-0.04432965, -0.3581661, -3.323218, 0, 1, 0.8392157, 1,
-0.04285109, -0.7506591, -4.868331, 0, 1, 0.8431373, 1,
-0.04265209, -1.201639, -3.178632, 0, 1, 0.8509804, 1,
-0.0392892, -0.2705273, -4.316136, 0, 1, 0.854902, 1,
-0.03701229, -1.501248, -3.281708, 0, 1, 0.8627451, 1,
-0.02955547, 0.6671056, -1.805948, 0, 1, 0.8666667, 1,
-0.0265273, 0.2412247, 0.1312843, 0, 1, 0.8745098, 1,
-0.02587484, -0.3751227, -4.349607, 0, 1, 0.8784314, 1,
-0.01948269, 1.401594, -0.8998626, 0, 1, 0.8862745, 1,
-0.01932364, 0.3036802, -1.625764, 0, 1, 0.8901961, 1,
-0.01373236, -1.544476, -3.432877, 0, 1, 0.8980392, 1,
-0.0136535, -0.5563462, -2.660015, 0, 1, 0.9058824, 1,
-0.01248629, -0.02570368, -3.624517, 0, 1, 0.9098039, 1,
-0.01234769, -0.6932184, -2.778408, 0, 1, 0.9176471, 1,
-0.009818677, 1.189476, 1.120325, 0, 1, 0.9215686, 1,
-0.006854414, 2.187659, -0.5977311, 0, 1, 0.9294118, 1,
-0.005233084, -0.4466059, -3.60125, 0, 1, 0.9333333, 1,
-0.004473312, -0.758492, -2.459571, 0, 1, 0.9411765, 1,
-0.003853117, -1.472655, -3.532614, 0, 1, 0.945098, 1,
-0.001171025, -0.4335245, -4.213664, 0, 1, 0.9529412, 1,
-0.001142652, 0.1304134, 0.2282909, 0, 1, 0.9568627, 1,
-0.0006660478, 0.360223, -0.881061, 0, 1, 0.9647059, 1,
0.002104073, -1.024184, 1.565742, 0, 1, 0.9686275, 1,
0.01357463, 0.8669053, -0.1420185, 0, 1, 0.9764706, 1,
0.01401295, -1.618772, 1.951835, 0, 1, 0.9803922, 1,
0.01729914, -0.2313196, 1.825621, 0, 1, 0.9882353, 1,
0.02043815, 0.04648134, 1.543562, 0, 1, 0.9921569, 1,
0.02233659, 0.6597011, -0.9278395, 0, 1, 1, 1,
0.02353373, -0.7663237, 1.995234, 0, 0.9921569, 1, 1,
0.0242196, 0.6139924, 1.313889, 0, 0.9882353, 1, 1,
0.02475162, 0.0201492, 1.711309, 0, 0.9803922, 1, 1,
0.02590329, 0.5878308, -0.4033418, 0, 0.9764706, 1, 1,
0.03089271, 0.3780294, 2.141012, 0, 0.9686275, 1, 1,
0.03341385, 0.7151189, -0.667212, 0, 0.9647059, 1, 1,
0.0349479, 0.6117064, 0.6517984, 0, 0.9568627, 1, 1,
0.03703459, 0.5380861, 0.9047031, 0, 0.9529412, 1, 1,
0.04041108, 1.567806, 0.2097325, 0, 0.945098, 1, 1,
0.043908, 1.901713, 1.424892, 0, 0.9411765, 1, 1,
0.04463812, -2.933826, 3.387582, 0, 0.9333333, 1, 1,
0.04633491, -0.4284768, 3.700342, 0, 0.9294118, 1, 1,
0.04827027, -0.4245888, 4.808934, 0, 0.9215686, 1, 1,
0.05090877, -0.7314596, 1.102596, 0, 0.9176471, 1, 1,
0.0517076, -0.6471987, 4.420253, 0, 0.9098039, 1, 1,
0.05697847, 1.853038, -0.4474867, 0, 0.9058824, 1, 1,
0.06202068, 0.8073521, 0.1109438, 0, 0.8980392, 1, 1,
0.06480911, 0.04439168, -1.00889, 0, 0.8901961, 1, 1,
0.06507873, -0.3425409, 2.618545, 0, 0.8862745, 1, 1,
0.06890052, -0.8283739, 2.346127, 0, 0.8784314, 1, 1,
0.06961485, 1.020024, 0.3277124, 0, 0.8745098, 1, 1,
0.06990453, 0.3915052, 0.4454699, 0, 0.8666667, 1, 1,
0.07659135, -0.03990363, 2.673709, 0, 0.8627451, 1, 1,
0.08023074, -0.8215618, 2.467375, 0, 0.854902, 1, 1,
0.08466481, -1.87043, 3.8318, 0, 0.8509804, 1, 1,
0.08470415, -0.07726734, 2.941824, 0, 0.8431373, 1, 1,
0.08773134, 1.244831, -0.8624647, 0, 0.8392157, 1, 1,
0.08989426, -0.3196464, 2.077771, 0, 0.8313726, 1, 1,
0.09175462, 0.7802376, -2.489206, 0, 0.827451, 1, 1,
0.09313811, 0.3012427, 0.6948652, 0, 0.8196079, 1, 1,
0.09399013, 0.9504064, 0.4528839, 0, 0.8156863, 1, 1,
0.094882, -1.280683, 2.632022, 0, 0.8078431, 1, 1,
0.09597599, -0.4837176, 3.086262, 0, 0.8039216, 1, 1,
0.096312, 0.3794529, 0.56231, 0, 0.7960784, 1, 1,
0.09930827, 0.5606825, 0.9137955, 0, 0.7882353, 1, 1,
0.09974587, -1.870806, 2.075581, 0, 0.7843137, 1, 1,
0.1011273, 0.5714128, 0.07858365, 0, 0.7764706, 1, 1,
0.1040717, 1.607896, -0.4316954, 0, 0.772549, 1, 1,
0.1076795, -1.427178, 3.348787, 0, 0.7647059, 1, 1,
0.1092566, -1.105485, 2.586482, 0, 0.7607843, 1, 1,
0.1098862, 0.2265599, 1.461334, 0, 0.7529412, 1, 1,
0.1119809, 0.4655919, 0.7534169, 0, 0.7490196, 1, 1,
0.1176522, 0.2228476, 1.73995, 0, 0.7411765, 1, 1,
0.1189604, 0.8561885, 1.518, 0, 0.7372549, 1, 1,
0.1209545, -0.3485422, 0.7719421, 0, 0.7294118, 1, 1,
0.1270604, -1.349463, 2.322492, 0, 0.7254902, 1, 1,
0.1282093, -1.517595, 2.264828, 0, 0.7176471, 1, 1,
0.1293535, -0.7221369, 3.698174, 0, 0.7137255, 1, 1,
0.1354641, 0.1182036, 0.3311087, 0, 0.7058824, 1, 1,
0.1360462, 0.4231182, 1.314209, 0, 0.6980392, 1, 1,
0.1437016, -0.9578242, 3.795072, 0, 0.6941177, 1, 1,
0.1448627, 0.4028491, 0.1184001, 0, 0.6862745, 1, 1,
0.1448645, -1.227639, 2.444408, 0, 0.682353, 1, 1,
0.1487839, -0.5085025, 2.862179, 0, 0.6745098, 1, 1,
0.1493778, 1.015862, -1.056667, 0, 0.6705883, 1, 1,
0.1495313, 0.2522509, 1.548751, 0, 0.6627451, 1, 1,
0.1508909, 0.1206313, -0.1529505, 0, 0.6588235, 1, 1,
0.1511534, -0.6944094, 3.50251, 0, 0.6509804, 1, 1,
0.1542496, -2.064363, 4.056637, 0, 0.6470588, 1, 1,
0.1551062, 0.1245895, -0.6004851, 0, 0.6392157, 1, 1,
0.1563861, -1.631894, 1.65115, 0, 0.6352941, 1, 1,
0.1643037, 0.6768502, -1.187436, 0, 0.627451, 1, 1,
0.1701194, 0.6497096, -0.718297, 0, 0.6235294, 1, 1,
0.1719215, 0.621694, 0.5124515, 0, 0.6156863, 1, 1,
0.1725408, -1.418817, 1.531451, 0, 0.6117647, 1, 1,
0.1749551, 0.4949219, -0.5026086, 0, 0.6039216, 1, 1,
0.1792071, -1.14026, 0.772265, 0, 0.5960785, 1, 1,
0.180794, 1.045254, -0.5829896, 0, 0.5921569, 1, 1,
0.1809879, 0.1800711, 1.713071, 0, 0.5843138, 1, 1,
0.1822279, -0.9673049, 3.53635, 0, 0.5803922, 1, 1,
0.1829435, -0.3382718, 2.451721, 0, 0.572549, 1, 1,
0.1829513, 0.1142989, 0.62252, 0, 0.5686275, 1, 1,
0.1847795, 0.4115147, 0.2391804, 0, 0.5607843, 1, 1,
0.1854149, -0.2183845, 2.303817, 0, 0.5568628, 1, 1,
0.185974, 0.03930089, 1.994401, 0, 0.5490196, 1, 1,
0.1868795, 0.6960487, 0.7207035, 0, 0.5450981, 1, 1,
0.189425, 0.03368257, 3.44425, 0, 0.5372549, 1, 1,
0.1949921, 0.382938, 1.396092, 0, 0.5333334, 1, 1,
0.1961418, 1.708034, 0.3934756, 0, 0.5254902, 1, 1,
0.1974934, 0.1009246, -1.327928, 0, 0.5215687, 1, 1,
0.1975852, -0.8472292, 1.422875, 0, 0.5137255, 1, 1,
0.2004024, 1.138776, 1.329871, 0, 0.509804, 1, 1,
0.2024613, -0.1227098, 1.284443, 0, 0.5019608, 1, 1,
0.2057339, -0.3826664, 2.695416, 0, 0.4941176, 1, 1,
0.2069582, 0.06524669, 2.415672, 0, 0.4901961, 1, 1,
0.2071404, -2.063761, 3.376156, 0, 0.4823529, 1, 1,
0.2078361, -0.07709575, 2.361181, 0, 0.4784314, 1, 1,
0.2160941, -0.9512632, 2.972878, 0, 0.4705882, 1, 1,
0.2168202, 0.1137607, 1.492328, 0, 0.4666667, 1, 1,
0.2174972, -1.105025, 1.553629, 0, 0.4588235, 1, 1,
0.2277523, -0.665006, 1.836829, 0, 0.454902, 1, 1,
0.2320526, 1.055329, 1.868019, 0, 0.4470588, 1, 1,
0.2365897, -0.7566182, 1.078802, 0, 0.4431373, 1, 1,
0.239142, 0.05739858, 2.020756, 0, 0.4352941, 1, 1,
0.2415874, 0.8901415, 0.8983086, 0, 0.4313726, 1, 1,
0.2428904, -1.255839, 4.165235, 0, 0.4235294, 1, 1,
0.2501931, -0.3401182, 2.860813, 0, 0.4196078, 1, 1,
0.2522244, -0.9144434, 1.18491, 0, 0.4117647, 1, 1,
0.2540076, 0.6591271, -0.01328341, 0, 0.4078431, 1, 1,
0.2567084, 0.537087, 0.2191598, 0, 0.4, 1, 1,
0.2572994, -0.01402983, 1.613945, 0, 0.3921569, 1, 1,
0.2586684, -0.1480663, 3.599663, 0, 0.3882353, 1, 1,
0.2636186, -0.09681764, 1.839375, 0, 0.3803922, 1, 1,
0.2658924, -1.282557, 3.741834, 0, 0.3764706, 1, 1,
0.2704155, 0.6774176, -0.4388038, 0, 0.3686275, 1, 1,
0.2705228, -1.215388, 3.742593, 0, 0.3647059, 1, 1,
0.2708205, -1.138213, 4.355803, 0, 0.3568628, 1, 1,
0.272375, -0.8894132, 3.137743, 0, 0.3529412, 1, 1,
0.2782062, 1.639598, -0.8755289, 0, 0.345098, 1, 1,
0.2803446, -0.02478976, 1.973016, 0, 0.3411765, 1, 1,
0.2808272, -0.8044428, 1.535995, 0, 0.3333333, 1, 1,
0.2809973, -0.5504387, 2.534507, 0, 0.3294118, 1, 1,
0.2812009, 0.2117324, 0.4233731, 0, 0.3215686, 1, 1,
0.2814262, -0.8029677, 3.87312, 0, 0.3176471, 1, 1,
0.28322, -0.3390304, 2.906081, 0, 0.3098039, 1, 1,
0.2854569, 0.8351869, -0.925621, 0, 0.3058824, 1, 1,
0.2865418, 1.303517, 2.262126, 0, 0.2980392, 1, 1,
0.2878146, -0.7527376, 2.740258, 0, 0.2901961, 1, 1,
0.2878418, 0.6265781, 0.6480823, 0, 0.2862745, 1, 1,
0.2894805, -0.6689467, 2.506478, 0, 0.2784314, 1, 1,
0.2981015, 0.3469294, 1.17358, 0, 0.2745098, 1, 1,
0.3002313, -1.028612, 3.589581, 0, 0.2666667, 1, 1,
0.3009243, 0.7514711, 0.1942597, 0, 0.2627451, 1, 1,
0.3043051, -0.3529697, 1.749998, 0, 0.254902, 1, 1,
0.3066525, -0.7371191, 1.324491, 0, 0.2509804, 1, 1,
0.3138656, -0.9872698, 1.452454, 0, 0.2431373, 1, 1,
0.3182781, 1.031021, -1.491408, 0, 0.2392157, 1, 1,
0.3194582, -1.664351, 2.719157, 0, 0.2313726, 1, 1,
0.3211682, -0.4468826, 1.994774, 0, 0.227451, 1, 1,
0.3221317, -0.2855731, 2.885841, 0, 0.2196078, 1, 1,
0.3281041, 0.5194016, -0.1791141, 0, 0.2156863, 1, 1,
0.3286903, 0.3576894, 1.957582, 0, 0.2078431, 1, 1,
0.3292405, 0.2737826, 1.30896, 0, 0.2039216, 1, 1,
0.3306607, 0.2897071, 0.3674664, 0, 0.1960784, 1, 1,
0.330827, 1.096924, -0.2499204, 0, 0.1882353, 1, 1,
0.3385955, 1.473561, 0.02621852, 0, 0.1843137, 1, 1,
0.3389871, 1.934343, 0.1683936, 0, 0.1764706, 1, 1,
0.3409036, 1.266515, 0.2698588, 0, 0.172549, 1, 1,
0.3471223, -0.562296, 4.186363, 0, 0.1647059, 1, 1,
0.3497222, -0.349515, 1.940806, 0, 0.1607843, 1, 1,
0.3515881, 1.070979, 0.9446513, 0, 0.1529412, 1, 1,
0.3586068, 0.9200237, -0.09983117, 0, 0.1490196, 1, 1,
0.3660233, 0.06818882, 2.351154, 0, 0.1411765, 1, 1,
0.3673535, -0.6594521, 3.561228, 0, 0.1372549, 1, 1,
0.3678808, -0.452094, 2.905841, 0, 0.1294118, 1, 1,
0.3689461, 0.6358412, 0.2926247, 0, 0.1254902, 1, 1,
0.3693397, -0.4451399, 2.937441, 0, 0.1176471, 1, 1,
0.3708605, 0.6257244, 1.320319, 0, 0.1137255, 1, 1,
0.3718284, -1.367162, 4.228522, 0, 0.1058824, 1, 1,
0.3721146, 0.8559055, 0.02327963, 0, 0.09803922, 1, 1,
0.3738837, 2.752825, -0.1609666, 0, 0.09411765, 1, 1,
0.3756176, 0.637243, 1.430434, 0, 0.08627451, 1, 1,
0.3770642, -0.9749587, 2.809819, 0, 0.08235294, 1, 1,
0.3812478, 1.222629, 0.09558038, 0, 0.07450981, 1, 1,
0.3818346, 0.3174873, -1.761472, 0, 0.07058824, 1, 1,
0.3833311, 0.4398597, 1.925434, 0, 0.0627451, 1, 1,
0.3847251, -0.3743129, 0.2161118, 0, 0.05882353, 1, 1,
0.3908458, -0.6088883, 3.912433, 0, 0.05098039, 1, 1,
0.396266, -0.6176946, 2.390095, 0, 0.04705882, 1, 1,
0.3980306, 0.2709531, 1.10764, 0, 0.03921569, 1, 1,
0.3994343, 2.603104, 0.4329959, 0, 0.03529412, 1, 1,
0.4014903, 0.2782097, 2.965097, 0, 0.02745098, 1, 1,
0.4015186, -0.4367487, 2.670161, 0, 0.02352941, 1, 1,
0.4024541, 0.4911682, 1.255114, 0, 0.01568628, 1, 1,
0.4050491, -1.805166, 4.396555, 0, 0.01176471, 1, 1,
0.4053676, -1.429336, 2.279949, 0, 0.003921569, 1, 1,
0.4088041, 0.6705401, 1.416189, 0.003921569, 0, 1, 1,
0.4093595, 1.11742, -0.7746865, 0.007843138, 0, 1, 1,
0.4108877, -0.04714356, 1.391665, 0.01568628, 0, 1, 1,
0.4130243, -1.01282, 3.571538, 0.01960784, 0, 1, 1,
0.4139818, -0.9847692, 2.190231, 0.02745098, 0, 1, 1,
0.4147457, 0.6339834, 1.63143, 0.03137255, 0, 1, 1,
0.4186414, -0.59212, 1.710881, 0.03921569, 0, 1, 1,
0.4264163, -0.8817446, 4.355088, 0.04313726, 0, 1, 1,
0.4292232, -0.1056417, 3.465196, 0.05098039, 0, 1, 1,
0.4403727, 1.252703, 1.30139, 0.05490196, 0, 1, 1,
0.4411425, -0.1604291, 2.232013, 0.0627451, 0, 1, 1,
0.4445088, 0.2366412, 1.72955, 0.06666667, 0, 1, 1,
0.4495293, 0.7964366, 1.429353, 0.07450981, 0, 1, 1,
0.4506465, 0.1621863, 1.079153, 0.07843138, 0, 1, 1,
0.4514608, 0.0192619, 1.505076, 0.08627451, 0, 1, 1,
0.4520512, -0.7397325, 1.587346, 0.09019608, 0, 1, 1,
0.4544526, 0.3144509, -0.8665762, 0.09803922, 0, 1, 1,
0.4551743, 1.180319, 0.2446878, 0.1058824, 0, 1, 1,
0.4577055, 1.509007, -1.477348, 0.1098039, 0, 1, 1,
0.4605358, -1.411844, 3.611357, 0.1176471, 0, 1, 1,
0.4654338, -0.8846069, 2.836072, 0.1215686, 0, 1, 1,
0.4657023, 1.447966, 0.8000122, 0.1294118, 0, 1, 1,
0.472158, 1.111332, 0.827503, 0.1333333, 0, 1, 1,
0.4744599, 0.2250098, 1.433083, 0.1411765, 0, 1, 1,
0.4760605, -1.787024, 2.144595, 0.145098, 0, 1, 1,
0.4775254, 0.4089744, 1.829723, 0.1529412, 0, 1, 1,
0.4839985, 1.06717, -0.06036863, 0.1568628, 0, 1, 1,
0.4849451, -0.4577953, 3.275045, 0.1647059, 0, 1, 1,
0.4870739, -2.104169, 2.41695, 0.1686275, 0, 1, 1,
0.4958886, -1.221437, 2.175406, 0.1764706, 0, 1, 1,
0.4981997, 0.8065144, 2.414187, 0.1803922, 0, 1, 1,
0.5048575, -0.4651375, 3.595746, 0.1882353, 0, 1, 1,
0.5134647, 0.9201381, 1.917417, 0.1921569, 0, 1, 1,
0.5164536, 0.7136601, 1.431135, 0.2, 0, 1, 1,
0.523558, 1.639754, -1.143737, 0.2078431, 0, 1, 1,
0.5236371, 0.004541386, 3.349307, 0.2117647, 0, 1, 1,
0.5243514, -2.16209, 3.267952, 0.2196078, 0, 1, 1,
0.5253313, 0.9685376, -1.038165, 0.2235294, 0, 1, 1,
0.5261372, -0.1948591, 1.63189, 0.2313726, 0, 1, 1,
0.5304321, -1.451864, 3.338512, 0.2352941, 0, 1, 1,
0.5324845, -0.8393252, 3.825024, 0.2431373, 0, 1, 1,
0.5331864, -0.1667777, 1.452764, 0.2470588, 0, 1, 1,
0.5333607, 0.82999, -1.084848, 0.254902, 0, 1, 1,
0.5337445, 1.785636, 0.288565, 0.2588235, 0, 1, 1,
0.5348402, -0.710508, 2.761123, 0.2666667, 0, 1, 1,
0.5361129, -0.03092326, 3.105101, 0.2705882, 0, 1, 1,
0.543231, -0.1489029, 2.068262, 0.2784314, 0, 1, 1,
0.5433126, -1.055264, 1.978423, 0.282353, 0, 1, 1,
0.5433331, -0.408181, 3.323762, 0.2901961, 0, 1, 1,
0.5465173, 0.7719385, 1.182616, 0.2941177, 0, 1, 1,
0.5483337, 0.9464228, -0.2529877, 0.3019608, 0, 1, 1,
0.5510012, -0.3779466, 2.826208, 0.3098039, 0, 1, 1,
0.559488, 1.185613, -1.043056, 0.3137255, 0, 1, 1,
0.5651874, 0.5859702, 0.7342325, 0.3215686, 0, 1, 1,
0.5670132, 0.7219997, 0.4205371, 0.3254902, 0, 1, 1,
0.5685347, 0.5021641, 2.658803, 0.3333333, 0, 1, 1,
0.5700241, 2.009146, -0.02029959, 0.3372549, 0, 1, 1,
0.5734199, -0.8852196, 2.235071, 0.345098, 0, 1, 1,
0.5756013, 0.03569708, 2.52688, 0.3490196, 0, 1, 1,
0.5778355, 0.7458313, 1.370509, 0.3568628, 0, 1, 1,
0.5808964, -0.1433907, 1.4853, 0.3607843, 0, 1, 1,
0.582085, 0.3021931, 1.111265, 0.3686275, 0, 1, 1,
0.5879653, 0.1769383, 1.567272, 0.372549, 0, 1, 1,
0.5879976, -0.4293422, 3.00142, 0.3803922, 0, 1, 1,
0.5904778, 2.490496, 0.7822461, 0.3843137, 0, 1, 1,
0.592562, 0.5265754, 0.1573284, 0.3921569, 0, 1, 1,
0.5979759, 0.4209572, 1.198185, 0.3960784, 0, 1, 1,
0.60013, -0.04251936, 1.10869, 0.4039216, 0, 1, 1,
0.6033356, -0.3592425, 3.873089, 0.4117647, 0, 1, 1,
0.6061376, 0.5828139, 0.3070344, 0.4156863, 0, 1, 1,
0.6071513, -1.465175, 4.667703, 0.4235294, 0, 1, 1,
0.6078103, -0.9299307, 2.137734, 0.427451, 0, 1, 1,
0.6093751, 0.3114977, 0.6061327, 0.4352941, 0, 1, 1,
0.6097489, 0.02291535, 1.595875, 0.4392157, 0, 1, 1,
0.611366, -0.3118973, 2.72529, 0.4470588, 0, 1, 1,
0.6159329, 0.1014994, 2.069056, 0.4509804, 0, 1, 1,
0.618042, -1.163624, 4.299253, 0.4588235, 0, 1, 1,
0.6304463, 0.1042664, 1.233894, 0.4627451, 0, 1, 1,
0.6388761, -0.3997409, 3.019213, 0.4705882, 0, 1, 1,
0.6421077, 0.1496486, 0.9192019, 0.4745098, 0, 1, 1,
0.6442265, 0.4385945, -0.553582, 0.4823529, 0, 1, 1,
0.64577, -1.050424, 2.184761, 0.4862745, 0, 1, 1,
0.6491475, -0.4357888, 1.751393, 0.4941176, 0, 1, 1,
0.6507593, -1.509089, 3.987233, 0.5019608, 0, 1, 1,
0.6516548, -0.7486327, 2.491066, 0.5058824, 0, 1, 1,
0.655755, -1.00853, 1.972022, 0.5137255, 0, 1, 1,
0.6601468, 1.44007, 0.3297498, 0.5176471, 0, 1, 1,
0.6636186, -0.7806231, 2.549326, 0.5254902, 0, 1, 1,
0.6638968, 0.6911734, 2.523196, 0.5294118, 0, 1, 1,
0.670068, 2.03986, -0.556349, 0.5372549, 0, 1, 1,
0.6710084, 0.7246039, 0.5023586, 0.5411765, 0, 1, 1,
0.6729826, -0.6538132, 1.808894, 0.5490196, 0, 1, 1,
0.6835324, 1.571909, -0.4228005, 0.5529412, 0, 1, 1,
0.6850147, -0.8724192, 3.485968, 0.5607843, 0, 1, 1,
0.6851192, 0.4803449, -0.4364846, 0.5647059, 0, 1, 1,
0.6863371, -0.06717003, 1.919111, 0.572549, 0, 1, 1,
0.6887133, 1.835412, -0.1867707, 0.5764706, 0, 1, 1,
0.6908357, -1.244095, 0.7203714, 0.5843138, 0, 1, 1,
0.7012028, 2.402252, -0.179996, 0.5882353, 0, 1, 1,
0.7013985, -0.3115095, 2.564552, 0.5960785, 0, 1, 1,
0.7053055, -2.347299, 3.042261, 0.6039216, 0, 1, 1,
0.7112502, 0.4241759, 1.350365, 0.6078432, 0, 1, 1,
0.7164136, 1.546668, 1.433173, 0.6156863, 0, 1, 1,
0.7189682, -0.3370013, -0.6735415, 0.6196079, 0, 1, 1,
0.7210925, -2.846795, 2.087735, 0.627451, 0, 1, 1,
0.7232814, 0.0422929, 1.667632, 0.6313726, 0, 1, 1,
0.7260239, 1.048333, 1.408601, 0.6392157, 0, 1, 1,
0.7342403, -0.1577222, 2.238868, 0.6431373, 0, 1, 1,
0.7440038, -0.3416803, 2.099859, 0.6509804, 0, 1, 1,
0.7445257, 0.1683469, 0.6369442, 0.654902, 0, 1, 1,
0.749447, -0.7620175, 0.1592019, 0.6627451, 0, 1, 1,
0.7597749, 0.8390443, 1.953914, 0.6666667, 0, 1, 1,
0.7729381, 0.1199196, 1.533129, 0.6745098, 0, 1, 1,
0.7802384, 0.1435434, 2.343106, 0.6784314, 0, 1, 1,
0.7826886, 0.004052971, 1.958918, 0.6862745, 0, 1, 1,
0.7846951, 1.123615, 1.538242, 0.6901961, 0, 1, 1,
0.7857385, -1.605296, 1.834979, 0.6980392, 0, 1, 1,
0.7872778, -0.5209504, 1.728567, 0.7058824, 0, 1, 1,
0.7874951, -1.567664, 4.046828, 0.7098039, 0, 1, 1,
0.7903143, 0.09566177, 2.041365, 0.7176471, 0, 1, 1,
0.7916271, -0.1476708, 2.729118, 0.7215686, 0, 1, 1,
0.7944424, 0.7676104, 0.6209278, 0.7294118, 0, 1, 1,
0.7973319, -0.7857509, 1.342505, 0.7333333, 0, 1, 1,
0.8023192, 0.2692406, 3.23303, 0.7411765, 0, 1, 1,
0.8093599, 0.4967715, 0.5581835, 0.7450981, 0, 1, 1,
0.8159824, 0.1321325, 1.678256, 0.7529412, 0, 1, 1,
0.8163005, -0.4992354, 3.96507, 0.7568628, 0, 1, 1,
0.8168262, -0.1682643, 2.665121, 0.7647059, 0, 1, 1,
0.8190894, -0.1140875, 2.53548, 0.7686275, 0, 1, 1,
0.8208695, 2.033736, -0.3010388, 0.7764706, 0, 1, 1,
0.822602, -0.6769397, 0.4855839, 0.7803922, 0, 1, 1,
0.8235283, 1.587732, 1.75081, 0.7882353, 0, 1, 1,
0.8255868, 0.03502109, 1.615096, 0.7921569, 0, 1, 1,
0.8268998, -0.9972713, 4.105871, 0.8, 0, 1, 1,
0.8271236, -1.071297, 2.445087, 0.8078431, 0, 1, 1,
0.8274719, 0.2344068, 2.214771, 0.8117647, 0, 1, 1,
0.8314422, 2.407539, -0.1615329, 0.8196079, 0, 1, 1,
0.8485743, 0.5124461, -2.065667, 0.8235294, 0, 1, 1,
0.8489841, 0.7457427, 0.2243415, 0.8313726, 0, 1, 1,
0.8519011, 0.6834341, 0.6283316, 0.8352941, 0, 1, 1,
0.8546809, -0.3565559, 1.580464, 0.8431373, 0, 1, 1,
0.8558569, 1.126941, -0.5502722, 0.8470588, 0, 1, 1,
0.8577642, -0.1533511, 2.163341, 0.854902, 0, 1, 1,
0.8609872, 1.206087, -0.7634459, 0.8588235, 0, 1, 1,
0.8719313, -0.5563753, 1.278791, 0.8666667, 0, 1, 1,
0.8739288, 0.6666896, 0.3856945, 0.8705882, 0, 1, 1,
0.8785027, 0.6566916, 0.578053, 0.8784314, 0, 1, 1,
0.8842531, 0.7634122, 0.07486234, 0.8823529, 0, 1, 1,
0.900032, -1.22961, 3.88837, 0.8901961, 0, 1, 1,
0.9228429, 0.203634, 2.012082, 0.8941177, 0, 1, 1,
0.9246065, -0.6413087, 2.692986, 0.9019608, 0, 1, 1,
0.9285107, -0.4361836, 2.529093, 0.9098039, 0, 1, 1,
0.9286642, -1.006311, 3.193459, 0.9137255, 0, 1, 1,
0.9348367, -0.1522138, 1.659149, 0.9215686, 0, 1, 1,
0.9377382, -1.25336, 2.872521, 0.9254902, 0, 1, 1,
0.9393346, -0.0005281278, 2.302022, 0.9333333, 0, 1, 1,
0.9400717, -0.0962372, 2.415323, 0.9372549, 0, 1, 1,
0.9449632, -1.231357, 2.030883, 0.945098, 0, 1, 1,
0.9491525, -0.7310018, 2.20663, 0.9490196, 0, 1, 1,
0.9517042, 1.466367, -0.01645935, 0.9568627, 0, 1, 1,
0.9617081, -2.622406, 3.391821, 0.9607843, 0, 1, 1,
0.9754784, 1.092796, 1.953722, 0.9686275, 0, 1, 1,
0.9784262, 0.01885164, 1.240628, 0.972549, 0, 1, 1,
0.9798669, -1.824165, 2.672307, 0.9803922, 0, 1, 1,
0.9849518, -0.14337, 0.9472204, 0.9843137, 0, 1, 1,
0.9854705, -1.327462, 3.196548, 0.9921569, 0, 1, 1,
0.9865696, 1.187404, 0.1365198, 0.9960784, 0, 1, 1,
0.9897163, 0.7887696, 2.268657, 1, 0, 0.9960784, 1,
0.9989234, 0.112034, 3.176202, 1, 0, 0.9882353, 1,
1.001466, 0.8238469, 0.4079805, 1, 0, 0.9843137, 1,
1.006672, 0.8890253, 1.657383, 1, 0, 0.9764706, 1,
1.010152, -0.5075305, 2.725832, 1, 0, 0.972549, 1,
1.021525, -0.7130287, 2.238237, 1, 0, 0.9647059, 1,
1.022673, -0.01333305, 4.266511, 1, 0, 0.9607843, 1,
1.026084, 0.002213169, 3.179714, 1, 0, 0.9529412, 1,
1.027953, 0.5077322, 1.077519, 1, 0, 0.9490196, 1,
1.029391, -0.1911841, 2.582991, 1, 0, 0.9411765, 1,
1.03048, 0.05791607, 0.4746921, 1, 0, 0.9372549, 1,
1.032707, -0.6386266, 1.147729, 1, 0, 0.9294118, 1,
1.035511, -0.9687169, 1.261395, 1, 0, 0.9254902, 1,
1.036998, -1.246588, 1.702806, 1, 0, 0.9176471, 1,
1.044199, 0.6975527, -0.1101747, 1, 0, 0.9137255, 1,
1.047506, -0.9300742, 2.946082, 1, 0, 0.9058824, 1,
1.04862, 1.16687, 1.585233, 1, 0, 0.9019608, 1,
1.055598, 0.9073088, -0.2152323, 1, 0, 0.8941177, 1,
1.061036, -1.04581, 2.717255, 1, 0, 0.8862745, 1,
1.06705, -1.360159, -0.2582545, 1, 0, 0.8823529, 1,
1.073778, 0.1276781, 1.541628, 1, 0, 0.8745098, 1,
1.08207, -2.351743, 3.061911, 1, 0, 0.8705882, 1,
1.08454, 0.01287198, 1.201349, 1, 0, 0.8627451, 1,
1.088045, -0.04447524, 2.209189, 1, 0, 0.8588235, 1,
1.099117, 0.3503512, 0.5579613, 1, 0, 0.8509804, 1,
1.100225, 0.7960786, 0.3643504, 1, 0, 0.8470588, 1,
1.100415, 2.178959, 3.209391, 1, 0, 0.8392157, 1,
1.100421, 1.009372, 1.033348, 1, 0, 0.8352941, 1,
1.110556, 1.039733, 0.5082909, 1, 0, 0.827451, 1,
1.113225, -1.420895, 2.597202, 1, 0, 0.8235294, 1,
1.11355, -0.1077198, 1.385555, 1, 0, 0.8156863, 1,
1.118891, -1.331647, 2.529254, 1, 0, 0.8117647, 1,
1.119174, 0.7444294, 1.845351, 1, 0, 0.8039216, 1,
1.126716, 0.04419774, 1.845291, 1, 0, 0.7960784, 1,
1.131366, -0.2825582, 1.272009, 1, 0, 0.7921569, 1,
1.132812, 0.7931055, 0.3968536, 1, 0, 0.7843137, 1,
1.134775, -0.2618677, 0.9446101, 1, 0, 0.7803922, 1,
1.141082, -0.2302319, 2.502407, 1, 0, 0.772549, 1,
1.143008, 0.9979095, 0.3636705, 1, 0, 0.7686275, 1,
1.14443, -0.5441233, 2.505921, 1, 0, 0.7607843, 1,
1.152603, -1.04011, 1.767659, 1, 0, 0.7568628, 1,
1.152733, 0.09885921, 0.3334118, 1, 0, 0.7490196, 1,
1.154556, -1.205753, 1.735998, 1, 0, 0.7450981, 1,
1.154597, 1.530792, 1.397892, 1, 0, 0.7372549, 1,
1.159394, 0.2042312, 1.520091, 1, 0, 0.7333333, 1,
1.161924, 0.5963855, -0.1461473, 1, 0, 0.7254902, 1,
1.167154, 0.3821751, 1.817081, 1, 0, 0.7215686, 1,
1.167317, 0.7802618, 0.214446, 1, 0, 0.7137255, 1,
1.179885, 1.141472, 1.134516, 1, 0, 0.7098039, 1,
1.18095, 0.5062979, -0.1675337, 1, 0, 0.7019608, 1,
1.184366, -0.1983733, 3.689449, 1, 0, 0.6941177, 1,
1.185755, 2.50746, 0.2330514, 1, 0, 0.6901961, 1,
1.20301, -0.4432568, 2.6193, 1, 0, 0.682353, 1,
1.210527, -0.315915, 1.029257, 1, 0, 0.6784314, 1,
1.211613, 0.650553, 1.439722, 1, 0, 0.6705883, 1,
1.214835, 0.9495678, 0.8410383, 1, 0, 0.6666667, 1,
1.21885, 0.3204018, 1.631397, 1, 0, 0.6588235, 1,
1.221117, -2.048418, 1.968881, 1, 0, 0.654902, 1,
1.222217, -0.707798, 1.550308, 1, 0, 0.6470588, 1,
1.229501, -0.8551128, 2.723108, 1, 0, 0.6431373, 1,
1.237407, -0.474168, 0.7728929, 1, 0, 0.6352941, 1,
1.245784, -2.372595, 2.544594, 1, 0, 0.6313726, 1,
1.249108, -1.666683, 4.067067, 1, 0, 0.6235294, 1,
1.252129, 0.6744372, 0.958333, 1, 0, 0.6196079, 1,
1.283235, -2.52959, 3.380512, 1, 0, 0.6117647, 1,
1.294623, -0.1814653, 1.341573, 1, 0, 0.6078432, 1,
1.298342, -0.9630502, 0.2297861, 1, 0, 0.6, 1,
1.298671, -1.235741, 0.405864, 1, 0, 0.5921569, 1,
1.312266, 1.844945, 3.579844, 1, 0, 0.5882353, 1,
1.318904, -0.728039, 1.774467, 1, 0, 0.5803922, 1,
1.319562, 0.1434335, 2.384222, 1, 0, 0.5764706, 1,
1.320068, 0.488298, 1.231506, 1, 0, 0.5686275, 1,
1.321064, -2.069715, 1.79723, 1, 0, 0.5647059, 1,
1.32259, 1.674775, 1.274615, 1, 0, 0.5568628, 1,
1.32382, 2.274367, 0.7308804, 1, 0, 0.5529412, 1,
1.327185, 0.1688533, 0.9305069, 1, 0, 0.5450981, 1,
1.34873, -1.686905, 2.218109, 1, 0, 0.5411765, 1,
1.353685, -0.8947079, 1.316797, 1, 0, 0.5333334, 1,
1.355645, -0.9311402, 2.348837, 1, 0, 0.5294118, 1,
1.358197, 0.7642796, 1.736012, 1, 0, 0.5215687, 1,
1.361075, 0.04092223, 0.988037, 1, 0, 0.5176471, 1,
1.36816, 0.1375418, 1.212486, 1, 0, 0.509804, 1,
1.373361, 0.8499215, 0.5039791, 1, 0, 0.5058824, 1,
1.375124, 0.06551507, 1.019409, 1, 0, 0.4980392, 1,
1.376388, -0.9564987, 3.555821, 1, 0, 0.4901961, 1,
1.382214, -2.080742, 3.280625, 1, 0, 0.4862745, 1,
1.382447, 2.113741, -0.8098987, 1, 0, 0.4784314, 1,
1.388036, -0.4713663, 1.688689, 1, 0, 0.4745098, 1,
1.388092, -0.5405893, 2.330735, 1, 0, 0.4666667, 1,
1.389842, 0.4898088, 0.8141872, 1, 0, 0.4627451, 1,
1.390417, -0.1457649, 2.769965, 1, 0, 0.454902, 1,
1.399888, 1.017418, 0.06238669, 1, 0, 0.4509804, 1,
1.400663, -0.08771514, 1.864379, 1, 0, 0.4431373, 1,
1.402873, 0.160527, 3.145185, 1, 0, 0.4392157, 1,
1.408512, 0.8124831, 0.8883993, 1, 0, 0.4313726, 1,
1.427799, -0.8754306, 1.207149, 1, 0, 0.427451, 1,
1.445703, -0.5620807, 3.42256, 1, 0, 0.4196078, 1,
1.44751, 0.5976871, 1.433507, 1, 0, 0.4156863, 1,
1.448269, -1.648282, 2.864313, 1, 0, 0.4078431, 1,
1.461139, 0.08314513, 1.05851, 1, 0, 0.4039216, 1,
1.467258, -1.173532, 0.8763196, 1, 0, 0.3960784, 1,
1.473345, 0.3189759, 1.099184, 1, 0, 0.3882353, 1,
1.491049, 0.9010996, 3.431948, 1, 0, 0.3843137, 1,
1.507746, -0.120825, 1.999743, 1, 0, 0.3764706, 1,
1.518151, -0.7588531, 3.537237, 1, 0, 0.372549, 1,
1.529432, -0.447754, 2.120724, 1, 0, 0.3647059, 1,
1.541986, -0.8450567, 2.128093, 1, 0, 0.3607843, 1,
1.551024, 0.3185624, -0.03225559, 1, 0, 0.3529412, 1,
1.553222, -1.922592, 4.494472, 1, 0, 0.3490196, 1,
1.556379, -0.3328716, 1.948475, 1, 0, 0.3411765, 1,
1.561683, 0.9590507, 3.26817, 1, 0, 0.3372549, 1,
1.563697, 0.04270023, 2.449117, 1, 0, 0.3294118, 1,
1.58007, 1.626245, -1.080748, 1, 0, 0.3254902, 1,
1.646055, 0.710687, 1.491239, 1, 0, 0.3176471, 1,
1.64717, -0.410529, 1.946093, 1, 0, 0.3137255, 1,
1.648369, -0.7647393, 0.9456221, 1, 0, 0.3058824, 1,
1.65551, 0.8190134, 3.25877, 1, 0, 0.2980392, 1,
1.658027, -0.9458249, 2.331799, 1, 0, 0.2941177, 1,
1.675422, 0.245723, -0.4667884, 1, 0, 0.2862745, 1,
1.718523, 0.288713, 3.363887, 1, 0, 0.282353, 1,
1.740571, 0.3079054, 1.887766, 1, 0, 0.2745098, 1,
1.741384, -0.4713857, 2.376175, 1, 0, 0.2705882, 1,
1.745118, 1.474063, 0.3674393, 1, 0, 0.2627451, 1,
1.748275, -0.03216727, 1.710527, 1, 0, 0.2588235, 1,
1.758279, 2.226487, -0.9971724, 1, 0, 0.2509804, 1,
1.786022, 0.009065766, -0.5661086, 1, 0, 0.2470588, 1,
1.792026, -0.3237193, 3.497362, 1, 0, 0.2392157, 1,
1.818988, 0.7481762, -0.4317919, 1, 0, 0.2352941, 1,
1.845067, -0.2168945, 1.937408, 1, 0, 0.227451, 1,
1.846377, 0.7137396, 1.674947, 1, 0, 0.2235294, 1,
1.856969, -0.2878068, 1.851108, 1, 0, 0.2156863, 1,
1.862832, 1.742706, -0.2968879, 1, 0, 0.2117647, 1,
1.867138, -0.3946736, 3.395983, 1, 0, 0.2039216, 1,
1.876241, -1.365496, 2.933252, 1, 0, 0.1960784, 1,
1.886737, -1.651141, 3.569334, 1, 0, 0.1921569, 1,
1.907753, 0.7722709, 2.131948, 1, 0, 0.1843137, 1,
1.929311, 1.741862, 0.2630891, 1, 0, 0.1803922, 1,
1.933902, 0.3972301, 0.8212633, 1, 0, 0.172549, 1,
1.939663, -0.4256101, 0.5453833, 1, 0, 0.1686275, 1,
1.945929, -1.129272, 0.8562672, 1, 0, 0.1607843, 1,
1.9537, 0.8020187, 1.331851, 1, 0, 0.1568628, 1,
1.962144, 1.658311, -0.04658683, 1, 0, 0.1490196, 1,
1.986935, -0.1921695, 0.3507983, 1, 0, 0.145098, 1,
2.000165, -0.4819284, 0.4526904, 1, 0, 0.1372549, 1,
2.002188, 0.7225828, 2.452369, 1, 0, 0.1333333, 1,
2.003922, -0.4141009, 2.162115, 1, 0, 0.1254902, 1,
2.032981, 0.3533387, 0.6942277, 1, 0, 0.1215686, 1,
2.080817, 1.202921, 0.8197447, 1, 0, 0.1137255, 1,
2.093556, 2.506517, -0.9948997, 1, 0, 0.1098039, 1,
2.096077, -0.1702494, 3.316218, 1, 0, 0.1019608, 1,
2.142569, 0.07477992, 0.2532076, 1, 0, 0.09411765, 1,
2.160083, 1.134593, 1.34821, 1, 0, 0.09019608, 1,
2.164418, -1.038437, 1.377159, 1, 0, 0.08235294, 1,
2.181858, -0.3878578, 2.462107, 1, 0, 0.07843138, 1,
2.195839, -1.146547, 2.868358, 1, 0, 0.07058824, 1,
2.268775, 0.4885142, 1.427941, 1, 0, 0.06666667, 1,
2.294232, 0.9947456, 1.451215, 1, 0, 0.05882353, 1,
2.346519, -1.12739, 2.182986, 1, 0, 0.05490196, 1,
2.36255, -0.3559922, 1.688096, 1, 0, 0.04705882, 1,
2.534746, 1.214812, 2.409775, 1, 0, 0.04313726, 1,
2.536553, -1.126585, 1.992785, 1, 0, 0.03529412, 1,
2.660074, -0.9150148, 1.172161, 1, 0, 0.03137255, 1,
2.689117, 0.2352859, 3.472132, 1, 0, 0.02352941, 1,
2.963668, 0.4457049, -0.4180847, 1, 0, 0.01960784, 1,
3.007993, 0.674016, 1.042738, 1, 0, 0.01176471, 1,
3.254589, 0.549229, 0.9768544, 1, 0, 0.007843138, 1
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
0.2333615, -3.910259, -6.626778, 0, -0.5, 0.5, 0.5,
0.2333615, -3.910259, -6.626778, 1, -0.5, 0.5, 0.5,
0.2333615, -3.910259, -6.626778, 1, 1.5, 0.5, 0.5,
0.2333615, -3.910259, -6.626778, 0, 1.5, 0.5, 0.5
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
-3.812062, -0.0534935, -6.626778, 0, -0.5, 0.5, 0.5,
-3.812062, -0.0534935, -6.626778, 1, -0.5, 0.5, 0.5,
-3.812062, -0.0534935, -6.626778, 1, 1.5, 0.5, 0.5,
-3.812062, -0.0534935, -6.626778, 0, 1.5, 0.5, 0.5
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
-3.812062, -3.910259, -0.08021164, 0, -0.5, 0.5, 0.5,
-3.812062, -3.910259, -0.08021164, 1, -0.5, 0.5, 0.5,
-3.812062, -3.910259, -0.08021164, 1, 1.5, 0.5, 0.5,
-3.812062, -3.910259, -0.08021164, 0, 1.5, 0.5, 0.5
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
-2, -3.020236, -5.116032,
3, -3.020236, -5.116032,
-2, -3.020236, -5.116032,
-2, -3.168573, -5.367823,
-1, -3.020236, -5.116032,
-1, -3.168573, -5.367823,
0, -3.020236, -5.116032,
0, -3.168573, -5.367823,
1, -3.020236, -5.116032,
1, -3.168573, -5.367823,
2, -3.020236, -5.116032,
2, -3.168573, -5.367823,
3, -3.020236, -5.116032,
3, -3.168573, -5.367823
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
-2, -3.465247, -5.871405, 0, -0.5, 0.5, 0.5,
-2, -3.465247, -5.871405, 1, -0.5, 0.5, 0.5,
-2, -3.465247, -5.871405, 1, 1.5, 0.5, 0.5,
-2, -3.465247, -5.871405, 0, 1.5, 0.5, 0.5,
-1, -3.465247, -5.871405, 0, -0.5, 0.5, 0.5,
-1, -3.465247, -5.871405, 1, -0.5, 0.5, 0.5,
-1, -3.465247, -5.871405, 1, 1.5, 0.5, 0.5,
-1, -3.465247, -5.871405, 0, 1.5, 0.5, 0.5,
0, -3.465247, -5.871405, 0, -0.5, 0.5, 0.5,
0, -3.465247, -5.871405, 1, -0.5, 0.5, 0.5,
0, -3.465247, -5.871405, 1, 1.5, 0.5, 0.5,
0, -3.465247, -5.871405, 0, 1.5, 0.5, 0.5,
1, -3.465247, -5.871405, 0, -0.5, 0.5, 0.5,
1, -3.465247, -5.871405, 1, -0.5, 0.5, 0.5,
1, -3.465247, -5.871405, 1, 1.5, 0.5, 0.5,
1, -3.465247, -5.871405, 0, 1.5, 0.5, 0.5,
2, -3.465247, -5.871405, 0, -0.5, 0.5, 0.5,
2, -3.465247, -5.871405, 1, -0.5, 0.5, 0.5,
2, -3.465247, -5.871405, 1, 1.5, 0.5, 0.5,
2, -3.465247, -5.871405, 0, 1.5, 0.5, 0.5,
3, -3.465247, -5.871405, 0, -0.5, 0.5, 0.5,
3, -3.465247, -5.871405, 1, -0.5, 0.5, 0.5,
3, -3.465247, -5.871405, 1, 1.5, 0.5, 0.5,
3, -3.465247, -5.871405, 0, 1.5, 0.5, 0.5
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
-2.878503, -2, -5.116032,
-2.878503, 2, -5.116032,
-2.878503, -2, -5.116032,
-3.034096, -2, -5.367823,
-2.878503, -1, -5.116032,
-3.034096, -1, -5.367823,
-2.878503, 0, -5.116032,
-3.034096, 0, -5.367823,
-2.878503, 1, -5.116032,
-3.034096, 1, -5.367823,
-2.878503, 2, -5.116032,
-3.034096, 2, -5.367823
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
-3.345283, -2, -5.871405, 0, -0.5, 0.5, 0.5,
-3.345283, -2, -5.871405, 1, -0.5, 0.5, 0.5,
-3.345283, -2, -5.871405, 1, 1.5, 0.5, 0.5,
-3.345283, -2, -5.871405, 0, 1.5, 0.5, 0.5,
-3.345283, -1, -5.871405, 0, -0.5, 0.5, 0.5,
-3.345283, -1, -5.871405, 1, -0.5, 0.5, 0.5,
-3.345283, -1, -5.871405, 1, 1.5, 0.5, 0.5,
-3.345283, -1, -5.871405, 0, 1.5, 0.5, 0.5,
-3.345283, 0, -5.871405, 0, -0.5, 0.5, 0.5,
-3.345283, 0, -5.871405, 1, -0.5, 0.5, 0.5,
-3.345283, 0, -5.871405, 1, 1.5, 0.5, 0.5,
-3.345283, 0, -5.871405, 0, 1.5, 0.5, 0.5,
-3.345283, 1, -5.871405, 0, -0.5, 0.5, 0.5,
-3.345283, 1, -5.871405, 1, -0.5, 0.5, 0.5,
-3.345283, 1, -5.871405, 1, 1.5, 0.5, 0.5,
-3.345283, 1, -5.871405, 0, 1.5, 0.5, 0.5,
-3.345283, 2, -5.871405, 0, -0.5, 0.5, 0.5,
-3.345283, 2, -5.871405, 1, -0.5, 0.5, 0.5,
-3.345283, 2, -5.871405, 1, 1.5, 0.5, 0.5,
-3.345283, 2, -5.871405, 0, 1.5, 0.5, 0.5
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
-2.878503, -3.020236, -4,
-2.878503, -3.020236, 4,
-2.878503, -3.020236, -4,
-3.034096, -3.168573, -4,
-2.878503, -3.020236, -2,
-3.034096, -3.168573, -2,
-2.878503, -3.020236, 0,
-3.034096, -3.168573, 0,
-2.878503, -3.020236, 2,
-3.034096, -3.168573, 2,
-2.878503, -3.020236, 4,
-3.034096, -3.168573, 4
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
-3.345283, -3.465247, -4, 0, -0.5, 0.5, 0.5,
-3.345283, -3.465247, -4, 1, -0.5, 0.5, 0.5,
-3.345283, -3.465247, -4, 1, 1.5, 0.5, 0.5,
-3.345283, -3.465247, -4, 0, 1.5, 0.5, 0.5,
-3.345283, -3.465247, -2, 0, -0.5, 0.5, 0.5,
-3.345283, -3.465247, -2, 1, -0.5, 0.5, 0.5,
-3.345283, -3.465247, -2, 1, 1.5, 0.5, 0.5,
-3.345283, -3.465247, -2, 0, 1.5, 0.5, 0.5,
-3.345283, -3.465247, 0, 0, -0.5, 0.5, 0.5,
-3.345283, -3.465247, 0, 1, -0.5, 0.5, 0.5,
-3.345283, -3.465247, 0, 1, 1.5, 0.5, 0.5,
-3.345283, -3.465247, 0, 0, 1.5, 0.5, 0.5,
-3.345283, -3.465247, 2, 0, -0.5, 0.5, 0.5,
-3.345283, -3.465247, 2, 1, -0.5, 0.5, 0.5,
-3.345283, -3.465247, 2, 1, 1.5, 0.5, 0.5,
-3.345283, -3.465247, 2, 0, 1.5, 0.5, 0.5,
-3.345283, -3.465247, 4, 0, -0.5, 0.5, 0.5,
-3.345283, -3.465247, 4, 1, -0.5, 0.5, 0.5,
-3.345283, -3.465247, 4, 1, 1.5, 0.5, 0.5,
-3.345283, -3.465247, 4, 0, 1.5, 0.5, 0.5
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
-2.878503, -3.020236, -5.116032,
-2.878503, 2.913249, -5.116032,
-2.878503, -3.020236, 4.955608,
-2.878503, 2.913249, 4.955608,
-2.878503, -3.020236, -5.116032,
-2.878503, -3.020236, 4.955608,
-2.878503, 2.913249, -5.116032,
-2.878503, 2.913249, 4.955608,
-2.878503, -3.020236, -5.116032,
3.345226, -3.020236, -5.116032,
-2.878503, -3.020236, 4.955608,
3.345226, -3.020236, 4.955608,
-2.878503, 2.913249, -5.116032,
3.345226, 2.913249, -5.116032,
-2.878503, 2.913249, 4.955608,
3.345226, 2.913249, 4.955608,
3.345226, -3.020236, -5.116032,
3.345226, 2.913249, -5.116032,
3.345226, -3.020236, 4.955608,
3.345226, 2.913249, 4.955608,
3.345226, -3.020236, -5.116032,
3.345226, -3.020236, 4.955608,
3.345226, 2.913249, -5.116032,
3.345226, 2.913249, 4.955608
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
var radius = 7.071544;
var distance = 31.4621;
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
mvMatrix.translate( -0.2333615, 0.0534935, 0.08021164 );
mvMatrix.scale( 1.228507, 1.288601, 0.7591506 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.4621);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Kidan<-read.table("Kidan.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Kidan$V2
```

```
## Error in eval(expr, envir, enclos): object 'Kidan' not found
```

```r
y<-Kidan$V3
```

```
## Error in eval(expr, envir, enclos): object 'Kidan' not found
```

```r
z<-Kidan$V4
```

```
## Error in eval(expr, envir, enclos): object 'Kidan' not found
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
-2.787866, -0.2164551, -1.968804, 0, 0, 1, 1, 1,
-2.777541, 0.1751265, -0.4298171, 1, 0, 0, 1, 1,
-2.653053, -1.369412, -0.177579, 1, 0, 0, 1, 1,
-2.543856, 0.4286218, -2.298406, 1, 0, 0, 1, 1,
-2.505706, -0.9604679, -2.395854, 1, 0, 0, 1, 1,
-2.474919, 0.5478472, -1.329747, 1, 0, 0, 1, 1,
-2.382826, -0.4457313, -3.712183, 0, 0, 0, 1, 1,
-2.376639, -0.762399, -1.719727, 0, 0, 0, 1, 1,
-2.34737, -1.122635, -1.381969, 0, 0, 0, 1, 1,
-2.341636, 0.1718343, -0.9607681, 0, 0, 0, 1, 1,
-2.315032, -0.01734767, -1.892576, 0, 0, 0, 1, 1,
-2.276093, -1.110674, 0.08538116, 0, 0, 0, 1, 1,
-2.251382, -1.481875, -2.679445, 0, 0, 0, 1, 1,
-2.173184, 0.9312082, -0.7404824, 1, 1, 1, 1, 1,
-2.121852, 0.1901859, -2.845889, 1, 1, 1, 1, 1,
-2.10353, 0.0859635, -2.606609, 1, 1, 1, 1, 1,
-2.102977, -1.515985, -2.825387, 1, 1, 1, 1, 1,
-2.096205, 1.145895, 0.5129076, 1, 1, 1, 1, 1,
-2.090039, 0.9475453, -2.131121, 1, 1, 1, 1, 1,
-2.088906, 0.4909933, -0.6151969, 1, 1, 1, 1, 1,
-2.086495, 0.3900301, -1.08017, 1, 1, 1, 1, 1,
-2.084464, -1.754851, -1.338688, 1, 1, 1, 1, 1,
-2.034794, -1.150023, -1.445792, 1, 1, 1, 1, 1,
-1.957959, 0.4194351, -1.488579, 1, 1, 1, 1, 1,
-1.954355, -0.1240214, -1.510794, 1, 1, 1, 1, 1,
-1.917777, 0.1145598, -2.150056, 1, 1, 1, 1, 1,
-1.891341, -1.250109, 0.4347267, 1, 1, 1, 1, 1,
-1.878009, -1.524701, -3.779162, 1, 1, 1, 1, 1,
-1.866939, -1.736123, -2.89387, 0, 0, 1, 1, 1,
-1.855659, 0.8410344, 0.4340516, 1, 0, 0, 1, 1,
-1.847723, 0.004890515, -2.685562, 1, 0, 0, 1, 1,
-1.844336, 0.2977346, -0.9044038, 1, 0, 0, 1, 1,
-1.834803, -0.2844349, -2.566597, 1, 0, 0, 1, 1,
-1.829882, 2.826839, -0.4994082, 1, 0, 0, 1, 1,
-1.794904, -0.2696426, -0.949187, 0, 0, 0, 1, 1,
-1.793862, -0.9767269, -1.196519, 0, 0, 0, 1, 1,
-1.773297, -0.00995099, -1.916011, 0, 0, 0, 1, 1,
-1.742981, 0.2060897, -0.3252704, 0, 0, 0, 1, 1,
-1.738962, 0.2551337, -1.763252, 0, 0, 0, 1, 1,
-1.7343, -1.040801, -2.465103, 0, 0, 0, 1, 1,
-1.721385, -0.06667096, -2.159491, 0, 0, 0, 1, 1,
-1.72124, -0.3635969, -1.514744, 1, 1, 1, 1, 1,
-1.69003, -0.806279, -0.2436232, 1, 1, 1, 1, 1,
-1.676009, 0.8708698, -2.276526, 1, 1, 1, 1, 1,
-1.66836, 0.1250053, -1.631574, 1, 1, 1, 1, 1,
-1.666919, 0.2342002, -0.445953, 1, 1, 1, 1, 1,
-1.66451, -2.1755, -0.9947376, 1, 1, 1, 1, 1,
-1.643822, -0.9320197, -3.049685, 1, 1, 1, 1, 1,
-1.643429, 0.1962312, -0.6189443, 1, 1, 1, 1, 1,
-1.627172, 0.757734, -0.6771776, 1, 1, 1, 1, 1,
-1.599068, -0.04304305, -1.834889, 1, 1, 1, 1, 1,
-1.585157, -2.39472, -2.827727, 1, 1, 1, 1, 1,
-1.577977, -0.002241601, -1.432694, 1, 1, 1, 1, 1,
-1.577905, 0.5242515, 0.06443316, 1, 1, 1, 1, 1,
-1.572392, 0.003995336, -0.8447982, 1, 1, 1, 1, 1,
-1.566444, -0.4078585, -3.335968, 1, 1, 1, 1, 1,
-1.552365, 0.5566657, -0.8306779, 0, 0, 1, 1, 1,
-1.541693, -1.138304, -2.863272, 1, 0, 0, 1, 1,
-1.539148, -0.428409, -1.620043, 1, 0, 0, 1, 1,
-1.539063, -0.1959725, -3.036503, 1, 0, 0, 1, 1,
-1.510182, -0.6844317, -2.254194, 1, 0, 0, 1, 1,
-1.50111, -0.1954162, -1.248833, 1, 0, 0, 1, 1,
-1.500679, -0.4820147, -2.025139, 0, 0, 0, 1, 1,
-1.496783, -1.421116, -1.843439, 0, 0, 0, 1, 1,
-1.485047, -0.3226195, -0.681887, 0, 0, 0, 1, 1,
-1.485006, -0.3097839, -1.363917, 0, 0, 0, 1, 1,
-1.473039, 0.5605401, -1.355407, 0, 0, 0, 1, 1,
-1.471055, -0.6975967, -2.430515, 0, 0, 0, 1, 1,
-1.466406, 1.650583, -2.111437, 0, 0, 0, 1, 1,
-1.458686, -0.5337588, -2.124908, 1, 1, 1, 1, 1,
-1.453496, 1.312175, -0.1246941, 1, 1, 1, 1, 1,
-1.443327, -0.7452571, -1.867919, 1, 1, 1, 1, 1,
-1.44062, -0.911976, -1.44304, 1, 1, 1, 1, 1,
-1.438487, 1.936316, -0.6102099, 1, 1, 1, 1, 1,
-1.435345, 0.3167972, -0.7671266, 1, 1, 1, 1, 1,
-1.434342, 0.001960079, 0.01565382, 1, 1, 1, 1, 1,
-1.432811, 2.234563, 0.7990944, 1, 1, 1, 1, 1,
-1.431402, -0.5429995, -1.406978, 1, 1, 1, 1, 1,
-1.42328, 0.6353981, -2.845905, 1, 1, 1, 1, 1,
-1.422954, 0.219238, -1.281226, 1, 1, 1, 1, 1,
-1.422167, 1.730754, -1.759215, 1, 1, 1, 1, 1,
-1.421186, -1.539846, -1.343626, 1, 1, 1, 1, 1,
-1.419947, 1.435843, -0.1945651, 1, 1, 1, 1, 1,
-1.418279, -0.8067673, -1.702043, 1, 1, 1, 1, 1,
-1.418069, -0.006048521, 0.8068793, 0, 0, 1, 1, 1,
-1.400746, 0.1186525, -2.062572, 1, 0, 0, 1, 1,
-1.387084, -0.1052742, -0.9179503, 1, 0, 0, 1, 1,
-1.380968, 0.3675574, -0.7471189, 1, 0, 0, 1, 1,
-1.377589, -1.678426, -2.417191, 1, 0, 0, 1, 1,
-1.375977, -0.1529363, -2.394542, 1, 0, 0, 1, 1,
-1.368691, -0.8042927, -0.9140469, 0, 0, 0, 1, 1,
-1.364722, 0.08440173, -0.3399764, 0, 0, 0, 1, 1,
-1.34957, -0.1557335, -1.820038, 0, 0, 0, 1, 1,
-1.345465, 1.295232, -0.8926744, 0, 0, 0, 1, 1,
-1.32182, -0.2932992, -1.850216, 0, 0, 0, 1, 1,
-1.31657, -0.1287183, -2.084337, 0, 0, 0, 1, 1,
-1.313816, 0.8468903, -0.2728142, 0, 0, 0, 1, 1,
-1.303777, 1.380443, 0.4666451, 1, 1, 1, 1, 1,
-1.297565, 0.9636586, 0.2218471, 1, 1, 1, 1, 1,
-1.264241, -0.1003023, 0.08252556, 1, 1, 1, 1, 1,
-1.26056, -0.9499305, -2.8181, 1, 1, 1, 1, 1,
-1.255243, 1.725057, -0.215506, 1, 1, 1, 1, 1,
-1.253844, -0.5073877, -2.333966, 1, 1, 1, 1, 1,
-1.252722, -0.05375313, -3.072911, 1, 1, 1, 1, 1,
-1.247409, -0.1803118, -1.624269, 1, 1, 1, 1, 1,
-1.241872, -0.4148052, -3.521113, 1, 1, 1, 1, 1,
-1.233545, -0.1285833, -1.00398, 1, 1, 1, 1, 1,
-1.233285, 1.182261, -0.5333338, 1, 1, 1, 1, 1,
-1.23281, -0.3372151, -1.776299, 1, 1, 1, 1, 1,
-1.231942, 0.4768062, -0.07705468, 1, 1, 1, 1, 1,
-1.230659, -0.2757559, -1.62111, 1, 1, 1, 1, 1,
-1.228726, 0.2701532, -2.220239, 1, 1, 1, 1, 1,
-1.22184, -0.5382804, -3.312167, 0, 0, 1, 1, 1,
-1.218647, 0.8221854, -1.662288, 1, 0, 0, 1, 1,
-1.21418, -0.1517097, -2.750414, 1, 0, 0, 1, 1,
-1.212446, -0.348713, -1.667563, 1, 0, 0, 1, 1,
-1.212435, 2.1156, -0.3329257, 1, 0, 0, 1, 1,
-1.209949, -0.9893344, -2.646388, 1, 0, 0, 1, 1,
-1.209588, -0.4383433, -2.417632, 0, 0, 0, 1, 1,
-1.20485, -0.1870282, -2.554831, 0, 0, 0, 1, 1,
-1.199741, -1.868155, -2.376265, 0, 0, 0, 1, 1,
-1.197642, -1.904844, -2.921525, 0, 0, 0, 1, 1,
-1.18978, -1.316717, -1.965883, 0, 0, 0, 1, 1,
-1.178282, -1.522733, -1.449919, 0, 0, 0, 1, 1,
-1.16331, 0.6176507, -1.084844, 0, 0, 0, 1, 1,
-1.158528, -0.07953358, -3.114702, 1, 1, 1, 1, 1,
-1.156264, -1.321301, -2.56863, 1, 1, 1, 1, 1,
-1.15198, 0.6311547, -1.091131, 1, 1, 1, 1, 1,
-1.150525, 0.1597862, -0.9645032, 1, 1, 1, 1, 1,
-1.148273, -0.2885864, -1.37383, 1, 1, 1, 1, 1,
-1.148267, -0.5997654, -1.905663, 1, 1, 1, 1, 1,
-1.137609, 0.3642789, 1.191056, 1, 1, 1, 1, 1,
-1.13623, 0.05716071, -2.181677, 1, 1, 1, 1, 1,
-1.133456, -0.19515, -1.464768, 1, 1, 1, 1, 1,
-1.12751, 2.036264, -0.01327312, 1, 1, 1, 1, 1,
-1.120144, -0.6554503, -2.445085, 1, 1, 1, 1, 1,
-1.108816, -0.04028667, -1.77827, 1, 1, 1, 1, 1,
-1.106073, -0.2217403, -1.597785, 1, 1, 1, 1, 1,
-1.090938, 0.524331, -2.620835, 1, 1, 1, 1, 1,
-1.088163, 1.439207, -1.448256, 1, 1, 1, 1, 1,
-1.087791, -0.4777211, -1.797504, 0, 0, 1, 1, 1,
-1.082965, -0.8118395, -2.219313, 1, 0, 0, 1, 1,
-1.082737, -0.6702889, -1.405699, 1, 0, 0, 1, 1,
-1.082159, -0.08464353, -0.4236906, 1, 0, 0, 1, 1,
-1.072812, -1.3037, -2.470767, 1, 0, 0, 1, 1,
-1.061141, 1.068111, -1.517604, 1, 0, 0, 1, 1,
-1.052629, 0.6558086, -3.548802, 0, 0, 0, 1, 1,
-1.05108, -0.290806, -1.82025, 0, 0, 0, 1, 1,
-1.049089, 1.882146, -1.488249, 0, 0, 0, 1, 1,
-1.04455, 0.4144776, -1.020904, 0, 0, 0, 1, 1,
-1.041237, 1.240076, -0.5873307, 0, 0, 0, 1, 1,
-1.04011, 0.2401041, -0.8828958, 0, 0, 0, 1, 1,
-1.036978, -0.5330522, -1.845763, 0, 0, 0, 1, 1,
-1.033918, -0.5314425, -2.7566, 1, 1, 1, 1, 1,
-1.024405, 0.02889293, -1.077031, 1, 1, 1, 1, 1,
-1.019431, -0.3148431, -0.7492223, 1, 1, 1, 1, 1,
-1.017444, 1.496024, -1.667337, 1, 1, 1, 1, 1,
-1.013519, -0.5434623, -3.846674, 1, 1, 1, 1, 1,
-1.012281, 0.8063609, -1.233232, 1, 1, 1, 1, 1,
-1.011997, -1.656399, -1.605255, 1, 1, 1, 1, 1,
-1.009228, 1.646056, 0.345995, 1, 1, 1, 1, 1,
-1.008104, 0.5611352, 0.1068802, 1, 1, 1, 1, 1,
-1.00519, 1.515982, 0.6213742, 1, 1, 1, 1, 1,
-1.004012, 0.68274, -2.917268, 1, 1, 1, 1, 1,
-1.003597, 0.6221959, -1.103209, 1, 1, 1, 1, 1,
-0.9969147, 0.8815505, -2.93516, 1, 1, 1, 1, 1,
-0.9947462, 1.659351, -1.584369, 1, 1, 1, 1, 1,
-0.9913414, -1.139297, -2.812844, 1, 1, 1, 1, 1,
-0.9882722, 0.7487605, 0.6532372, 0, 0, 1, 1, 1,
-0.9850751, 1.917541, -0.4518072, 1, 0, 0, 1, 1,
-0.9833896, 0.3377773, -1.865767, 1, 0, 0, 1, 1,
-0.9802907, 0.3385619, -1.298937, 1, 0, 0, 1, 1,
-0.9633773, 0.5593112, -1.365873, 1, 0, 0, 1, 1,
-0.962954, -0.192681, -1.034053, 1, 0, 0, 1, 1,
-0.9545078, -0.379042, -1.581324, 0, 0, 0, 1, 1,
-0.9527394, 1.236673, -0.392738, 0, 0, 0, 1, 1,
-0.9480303, -1.235595, -3.34431, 0, 0, 0, 1, 1,
-0.9453302, -1.120123, -0.5779668, 0, 0, 0, 1, 1,
-0.9364911, 1.59102, 0.177754, 0, 0, 0, 1, 1,
-0.9350562, 1.235316, -1.513108, 0, 0, 0, 1, 1,
-0.9292539, -0.6811748, -2.492259, 0, 0, 0, 1, 1,
-0.9248021, -1.028431, -2.785988, 1, 1, 1, 1, 1,
-0.9084643, -2.14609, -1.352569, 1, 1, 1, 1, 1,
-0.9039546, 1.592654, -1.77521, 1, 1, 1, 1, 1,
-0.9024582, -0.1874066, -2.833355, 1, 1, 1, 1, 1,
-0.8955896, 0.8714987, 0.7425963, 1, 1, 1, 1, 1,
-0.8904709, 0.4659692, -2.044965, 1, 1, 1, 1, 1,
-0.8902839, -0.4140789, -2.364056, 1, 1, 1, 1, 1,
-0.888021, 0.932739, -0.5181904, 1, 1, 1, 1, 1,
-0.8875034, 0.2210331, -1.049595, 1, 1, 1, 1, 1,
-0.8831481, -0.3329338, -2.686297, 1, 1, 1, 1, 1,
-0.8820387, -0.8129414, -3.208115, 1, 1, 1, 1, 1,
-0.8819605, -0.1915556, -0.414381, 1, 1, 1, 1, 1,
-0.8748751, -1.447785, -4.281917, 1, 1, 1, 1, 1,
-0.8731259, 0.9422644, -0.5573404, 1, 1, 1, 1, 1,
-0.8700947, -0.9759595, -0.2290351, 1, 1, 1, 1, 1,
-0.8622971, 1.101581, -0.7611654, 0, 0, 1, 1, 1,
-0.8554322, 0.5327623, 0.05501557, 1, 0, 0, 1, 1,
-0.8553466, 0.2790476, -0.5588682, 1, 0, 0, 1, 1,
-0.8481482, 0.5191883, -1.884921, 1, 0, 0, 1, 1,
-0.840939, 0.5023571, -1.641083, 1, 0, 0, 1, 1,
-0.8359675, 0.07440557, -0.4832076, 1, 0, 0, 1, 1,
-0.8277259, 1.991888, -1.182704, 0, 0, 0, 1, 1,
-0.8276137, 1.617525, -2.623898, 0, 0, 0, 1, 1,
-0.8270961, -0.5420317, -2.956759, 0, 0, 0, 1, 1,
-0.8242708, -1.682703, -4.406594, 0, 0, 0, 1, 1,
-0.8233582, -0.4871348, -3.481681, 0, 0, 0, 1, 1,
-0.820618, -0.5920121, -2.899351, 0, 0, 0, 1, 1,
-0.8194761, -0.007732832, 0.3807084, 0, 0, 0, 1, 1,
-0.8177356, 0.2521359, -2.22657, 1, 1, 1, 1, 1,
-0.790033, -0.5436188, -3.547371, 1, 1, 1, 1, 1,
-0.7877507, 0.4193975, 1.016371, 1, 1, 1, 1, 1,
-0.7765009, 0.5686071, -1.424787, 1, 1, 1, 1, 1,
-0.7756485, -1.102911, -0.5962718, 1, 1, 1, 1, 1,
-0.7750314, -1.537203, -4.969357, 1, 1, 1, 1, 1,
-0.769492, -0.8091332, -2.073892, 1, 1, 1, 1, 1,
-0.7687607, -0.1271404, 0.3884415, 1, 1, 1, 1, 1,
-0.7594736, 0.895728, -0.8574868, 1, 1, 1, 1, 1,
-0.7568759, -1.100409, -2.388745, 1, 1, 1, 1, 1,
-0.7535038, 0.05812424, -2.535608, 1, 1, 1, 1, 1,
-0.7504067, 0.9127851, -2.624433, 1, 1, 1, 1, 1,
-0.7498308, -0.7028176, -2.236829, 1, 1, 1, 1, 1,
-0.7486117, -0.4668593, -2.902555, 1, 1, 1, 1, 1,
-0.7484098, 1.270916, 0.6090339, 1, 1, 1, 1, 1,
-0.7449569, 1.947355, -0.8154665, 0, 0, 1, 1, 1,
-0.7403405, 0.9002047, -0.3924546, 1, 0, 0, 1, 1,
-0.739933, -0.065855, -3.017459, 1, 0, 0, 1, 1,
-0.7342629, 0.7542337, -0.4388828, 1, 0, 0, 1, 1,
-0.7335069, 1.813385, -0.07297586, 1, 0, 0, 1, 1,
-0.7264126, -0.501583, -2.711566, 1, 0, 0, 1, 1,
-0.7259988, 0.2288186, -0.5809216, 0, 0, 0, 1, 1,
-0.7234833, 0.8079751, 0.4572287, 0, 0, 0, 1, 1,
-0.7207057, -1.019462, -3.332214, 0, 0, 0, 1, 1,
-0.7188033, -0.3373951, -2.435745, 0, 0, 0, 1, 1,
-0.7180739, 0.3234523, 0.5582314, 0, 0, 0, 1, 1,
-0.7098705, -1.346815, -3.106862, 0, 0, 0, 1, 1,
-0.7096919, 1.027584, -0.5101235, 0, 0, 0, 1, 1,
-0.7087381, -1.490818, -2.257818, 1, 1, 1, 1, 1,
-0.7069116, 0.2220058, -1.417843, 1, 1, 1, 1, 1,
-0.705348, 1.232318, -0.9482744, 1, 1, 1, 1, 1,
-0.7050608, -0.06065173, -2.198862, 1, 1, 1, 1, 1,
-0.7022948, 0.1243309, -2.28904, 1, 1, 1, 1, 1,
-0.6931533, 1.246216, -0.06370407, 1, 1, 1, 1, 1,
-0.6895117, 0.9547523, -2.551652, 1, 1, 1, 1, 1,
-0.6868954, -0.2714089, -0.6031291, 1, 1, 1, 1, 1,
-0.6845595, -0.0665868, -0.6181986, 1, 1, 1, 1, 1,
-0.6771715, 0.68751, 0.3441867, 1, 1, 1, 1, 1,
-0.6735058, 1.870713, 0.5133364, 1, 1, 1, 1, 1,
-0.6667106, 0.5087504, -1.464439, 1, 1, 1, 1, 1,
-0.6639977, -0.1771611, -2.289073, 1, 1, 1, 1, 1,
-0.6616676, -1.049538, -3.152603, 1, 1, 1, 1, 1,
-0.6578314, -0.1265569, -1.761456, 1, 1, 1, 1, 1,
-0.6552876, -0.6451781, -2.299324, 0, 0, 1, 1, 1,
-0.6510217, -1.164969, -2.58274, 1, 0, 0, 1, 1,
-0.6480847, -0.9528988, -2.856261, 1, 0, 0, 1, 1,
-0.647482, -0.1654672, -1.286512, 1, 0, 0, 1, 1,
-0.6424385, -1.112786, -2.321982, 1, 0, 0, 1, 1,
-0.6423047, 1.072273, -1.622784, 1, 0, 0, 1, 1,
-0.6399794, 2.47075, 1.37696, 0, 0, 0, 1, 1,
-0.6355613, -0.3568181, -2.663338, 0, 0, 0, 1, 1,
-0.634379, 0.2599744, -1.066477, 0, 0, 0, 1, 1,
-0.6342939, 1.327282, 0.5106557, 0, 0, 0, 1, 1,
-0.6337422, -0.1638707, -1.087209, 0, 0, 0, 1, 1,
-0.6333036, -0.2897136, -2.868563, 0, 0, 0, 1, 1,
-0.6290879, -1.326862, -2.025188, 0, 0, 0, 1, 1,
-0.6255978, 1.393213, -0.723861, 1, 1, 1, 1, 1,
-0.6182023, -0.1085754, -2.518188, 1, 1, 1, 1, 1,
-0.6178208, -0.4925363, -1.931465, 1, 1, 1, 1, 1,
-0.6146101, -0.8500096, -2.493574, 1, 1, 1, 1, 1,
-0.6110995, -1.231119, -4.911314, 1, 1, 1, 1, 1,
-0.6092979, -0.3873328, -3.372421, 1, 1, 1, 1, 1,
-0.6027201, 0.82684, -1.573484, 1, 1, 1, 1, 1,
-0.6013752, 0.8437906, 0.09885066, 1, 1, 1, 1, 1,
-0.5980113, -0.2198796, -1.508991, 1, 1, 1, 1, 1,
-0.5956622, 1.17826, 0.7036834, 1, 1, 1, 1, 1,
-0.5955312, -0.884707, -3.648451, 1, 1, 1, 1, 1,
-0.5941592, 1.620663, -1.104924, 1, 1, 1, 1, 1,
-0.5941207, -2.848286, -3.327815, 1, 1, 1, 1, 1,
-0.5929591, -0.978682, -2.03337, 1, 1, 1, 1, 1,
-0.5903984, 0.6162138, 0.1712938, 1, 1, 1, 1, 1,
-0.5896479, -0.067463, -2.044258, 0, 0, 1, 1, 1,
-0.5857795, 1.574054, 0.655163, 1, 0, 0, 1, 1,
-0.5812428, 0.3421271, -1.459549, 1, 0, 0, 1, 1,
-0.580693, -1.023131, -2.162969, 1, 0, 0, 1, 1,
-0.580571, 1.080336, -0.6956137, 1, 0, 0, 1, 1,
-0.5778919, -0.318157, -1.726855, 1, 0, 0, 1, 1,
-0.5677453, 0.5037884, -2.006793, 0, 0, 0, 1, 1,
-0.5658402, -0.6350186, -3.303295, 0, 0, 0, 1, 1,
-0.5642745, 0.7293275, -0.9373533, 0, 0, 0, 1, 1,
-0.5631323, 0.5892801, -1.655391, 0, 0, 0, 1, 1,
-0.5624515, -1.168067, -3.588597, 0, 0, 0, 1, 1,
-0.5524763, -0.4967414, -2.374866, 0, 0, 0, 1, 1,
-0.5515576, 1.291985, -0.9016877, 0, 0, 0, 1, 1,
-0.5499862, 0.2358308, -1.13929, 1, 1, 1, 1, 1,
-0.5494582, 0.6932638, 0.1895273, 1, 1, 1, 1, 1,
-0.5476271, 0.01966725, -2.420347, 1, 1, 1, 1, 1,
-0.5442597, -0.01347616, -0.6776161, 1, 1, 1, 1, 1,
-0.5414176, -0.3033314, -2.472161, 1, 1, 1, 1, 1,
-0.5398834, 0.307531, -0.4319527, 1, 1, 1, 1, 1,
-0.530268, 0.968104, 0.04050027, 1, 1, 1, 1, 1,
-0.5299361, 0.2802985, -0.1439499, 1, 1, 1, 1, 1,
-0.5292839, 0.09641113, 0.2266244, 1, 1, 1, 1, 1,
-0.5187541, 0.697988, -1.26217, 1, 1, 1, 1, 1,
-0.5164289, -0.002584869, -2.267753, 1, 1, 1, 1, 1,
-0.5109534, 0.5574319, -1.296742, 1, 1, 1, 1, 1,
-0.4993816, 0.264432, -0.1365148, 1, 1, 1, 1, 1,
-0.4971795, 0.4823537, -0.02226107, 1, 1, 1, 1, 1,
-0.4961091, 0.9141163, -0.8011219, 1, 1, 1, 1, 1,
-0.4959729, -1.568204, -2.736498, 0, 0, 1, 1, 1,
-0.4921924, 0.2461218, -1.373582, 1, 0, 0, 1, 1,
-0.4880571, 0.7537155, -1.475093, 1, 0, 0, 1, 1,
-0.4862526, -0.5416805, -1.647909, 1, 0, 0, 1, 1,
-0.484015, 0.6687946, -0.8338898, 1, 0, 0, 1, 1,
-0.4838609, 0.3825208, -0.7455686, 1, 0, 0, 1, 1,
-0.4817207, -0.8229876, -2.173738, 0, 0, 0, 1, 1,
-0.4807834, 0.8398967, -3.433141, 0, 0, 0, 1, 1,
-0.4775678, -1.336028, -2.258229, 0, 0, 0, 1, 1,
-0.4774674, -1.248698, -1.578395, 0, 0, 0, 1, 1,
-0.4770918, -2.002713, -1.229221, 0, 0, 0, 1, 1,
-0.47501, 0.2771877, -2.160383, 0, 0, 0, 1, 1,
-0.4702102, 0.2329903, 0.1613832, 0, 0, 0, 1, 1,
-0.4694356, -0.09167183, -1.392, 1, 1, 1, 1, 1,
-0.467054, -0.5837071, -1.44573, 1, 1, 1, 1, 1,
-0.4669327, 0.831409, -0.3899725, 1, 1, 1, 1, 1,
-0.464164, -1.245507, -3.183779, 1, 1, 1, 1, 1,
-0.4526215, -1.133039, -3.020179, 1, 1, 1, 1, 1,
-0.4508011, 1.138351, -0.7356843, 1, 1, 1, 1, 1,
-0.4454222, -0.592521, -3.305805, 1, 1, 1, 1, 1,
-0.4411316, 0.3874701, -1.136589, 1, 1, 1, 1, 1,
-0.4407244, 0.7894967, -0.7262921, 1, 1, 1, 1, 1,
-0.4377551, 1.103865, -0.6585529, 1, 1, 1, 1, 1,
-0.4356898, 1.144494, -0.5882737, 1, 1, 1, 1, 1,
-0.4311273, 0.2740684, 0.5572454, 1, 1, 1, 1, 1,
-0.4227807, 0.2679685, -1.908822, 1, 1, 1, 1, 1,
-0.4214619, 0.6151813, -0.6705754, 1, 1, 1, 1, 1,
-0.4212265, -0.1671147, -2.740621, 1, 1, 1, 1, 1,
-0.4187072, -0.5961989, -2.025615, 0, 0, 1, 1, 1,
-0.4178066, -1.449914, -2.964113, 1, 0, 0, 1, 1,
-0.4156371, -0.4843121, -2.312012, 1, 0, 0, 1, 1,
-0.4146588, -0.0278315, -1.26456, 1, 0, 0, 1, 1,
-0.4137631, -0.3453196, -0.5600592, 1, 0, 0, 1, 1,
-0.4119202, -2.230469, -3.006828, 1, 0, 0, 1, 1,
-0.4086927, -0.06949215, -0.7822384, 0, 0, 0, 1, 1,
-0.4068513, -0.7806583, -3.515091, 0, 0, 0, 1, 1,
-0.3936294, 0.5631734, 0.7923865, 0, 0, 0, 1, 1,
-0.3931991, -0.1163878, -2.622006, 0, 0, 0, 1, 1,
-0.3868347, -0.4367177, -4.551372, 0, 0, 0, 1, 1,
-0.3811305, -0.6437606, -3.089985, 0, 0, 0, 1, 1,
-0.3780177, -0.05903396, -1.546007, 0, 0, 0, 1, 1,
-0.3750413, 0.7862272, -0.8425283, 1, 1, 1, 1, 1,
-0.372283, 1.616195, 0.998993, 1, 1, 1, 1, 1,
-0.3710141, -0.5506904, -2.757929, 1, 1, 1, 1, 1,
-0.3606652, -0.6797397, -3.531278, 1, 1, 1, 1, 1,
-0.3562555, 2.256635, 0.2496114, 1, 1, 1, 1, 1,
-0.3522998, 1.22629, -1.899832, 1, 1, 1, 1, 1,
-0.3490843, -0.1878723, -2.071161, 1, 1, 1, 1, 1,
-0.3487689, 0.9773, -0.5812938, 1, 1, 1, 1, 1,
-0.3440753, -0.07359131, -2.146132, 1, 1, 1, 1, 1,
-0.3393248, 0.7757663, 2.013858, 1, 1, 1, 1, 1,
-0.3380044, -0.1999729, -0.606856, 1, 1, 1, 1, 1,
-0.3377383, -0.3927253, -1.792993, 1, 1, 1, 1, 1,
-0.3340364, 0.1525655, -1.203615, 1, 1, 1, 1, 1,
-0.3315063, 0.09348002, -1.551871, 1, 1, 1, 1, 1,
-0.3254986, 0.2852802, -1.839275, 1, 1, 1, 1, 1,
-0.3217131, -2.720524, -3.269491, 0, 0, 1, 1, 1,
-0.3214817, 2.216126, -0.1613311, 1, 0, 0, 1, 1,
-0.3198015, -0.3042746, -3.035774, 1, 0, 0, 1, 1,
-0.3168309, -0.7695235, -2.047784, 1, 0, 0, 1, 1,
-0.3140554, 1.223482, -0.09925935, 1, 0, 0, 1, 1,
-0.313348, 0.03161187, -2.047785, 1, 0, 0, 1, 1,
-0.3091041, -0.9995044, -3.225167, 0, 0, 0, 1, 1,
-0.309047, -1.151381, -4.706966, 0, 0, 0, 1, 1,
-0.3062947, -0.7446246, -2.70538, 0, 0, 0, 1, 1,
-0.305423, -0.6317875, -2.600582, 0, 0, 0, 1, 1,
-0.2916637, 0.4368023, -1.578938, 0, 0, 0, 1, 1,
-0.289593, -0.9031033, -1.624339, 0, 0, 0, 1, 1,
-0.2835928, -0.8026214, -2.495306, 0, 0, 0, 1, 1,
-0.279522, 1.43762, 0.2808555, 1, 1, 1, 1, 1,
-0.278774, 0.5888719, -0.7054393, 1, 1, 1, 1, 1,
-0.2781369, 1.510641, 1.024205, 1, 1, 1, 1, 1,
-0.277603, -0.9105592, -3.534508, 1, 1, 1, 1, 1,
-0.2737968, -0.239109, -3.246811, 1, 1, 1, 1, 1,
-0.2676359, 1.614228, -1.648668, 1, 1, 1, 1, 1,
-0.2669356, 1.940478, -1.3918, 1, 1, 1, 1, 1,
-0.2632166, 1.050369, -0.3929194, 1, 1, 1, 1, 1,
-0.2600417, 0.2921164, -0.8656648, 1, 1, 1, 1, 1,
-0.2543249, 0.04125896, -0.9017898, 1, 1, 1, 1, 1,
-0.252233, -0.2812126, -1.208832, 1, 1, 1, 1, 1,
-0.2514148, -0.2293055, -2.736762, 1, 1, 1, 1, 1,
-0.2487481, -2.355839, -4.409237, 1, 1, 1, 1, 1,
-0.2480441, -1.448662, -1.664992, 1, 1, 1, 1, 1,
-0.2454149, -0.4892274, -1.73482, 1, 1, 1, 1, 1,
-0.2421213, 0.6233288, -1.242613, 0, 0, 1, 1, 1,
-0.2357338, -0.5775837, -3.718708, 1, 0, 0, 1, 1,
-0.2340516, -0.3485633, -0.2478968, 1, 0, 0, 1, 1,
-0.2265915, -1.074926, -2.102168, 1, 0, 0, 1, 1,
-0.2231482, 1.139772, 0.6904694, 1, 0, 0, 1, 1,
-0.2170974, -1.261294, -0.1501384, 1, 0, 0, 1, 1,
-0.2110264, 0.4898247, -1.441971, 0, 0, 0, 1, 1,
-0.2100188, 0.4110951, 0.5055802, 0, 0, 0, 1, 1,
-0.2067223, -0.04093945, -2.927782, 0, 0, 0, 1, 1,
-0.206318, -0.9190866, -3.368981, 0, 0, 0, 1, 1,
-0.2026157, 1.608004, 1.632272, 0, 0, 0, 1, 1,
-0.2015591, 0.8304009, 0.3136817, 0, 0, 0, 1, 1,
-0.1991142, -1.367212, -3.012859, 0, 0, 0, 1, 1,
-0.1975725, -0.7204601, -1.35064, 1, 1, 1, 1, 1,
-0.1967367, 0.114367, -1.088862, 1, 1, 1, 1, 1,
-0.1962369, -1.810664, -3.666511, 1, 1, 1, 1, 1,
-0.1960809, 0.5310155, -0.71249, 1, 1, 1, 1, 1,
-0.1953903, 0.3151574, -1.065536, 1, 1, 1, 1, 1,
-0.1938382, -0.1296319, -3.611102, 1, 1, 1, 1, 1,
-0.1936646, -0.1305439, -3.295481, 1, 1, 1, 1, 1,
-0.1933145, -1.147306, -3.473335, 1, 1, 1, 1, 1,
-0.192441, 0.8592795, -0.287522, 1, 1, 1, 1, 1,
-0.1923824, -1.345603, -3.726749, 1, 1, 1, 1, 1,
-0.1868228, -2.332597, -1.538218, 1, 1, 1, 1, 1,
-0.184808, -0.4816796, -2.117677, 1, 1, 1, 1, 1,
-0.1804914, 0.7001982, -1.190228, 1, 1, 1, 1, 1,
-0.1802084, -0.1039412, -2.508668, 1, 1, 1, 1, 1,
-0.1801868, 0.8342054, -0.8637676, 1, 1, 1, 1, 1,
-0.1786184, -1.593165, -2.483207, 0, 0, 1, 1, 1,
-0.1776934, 0.05660962, -0.921025, 1, 0, 0, 1, 1,
-0.1692664, -1.36746, -2.036888, 1, 0, 0, 1, 1,
-0.1639265, 0.926093, 0.3872401, 1, 0, 0, 1, 1,
-0.1633017, -0.3948808, -2.02231, 1, 0, 0, 1, 1,
-0.1614828, 0.2242578, -2.107803, 1, 0, 0, 1, 1,
-0.1581405, -0.02186615, -1.712903, 0, 0, 0, 1, 1,
-0.1576055, -0.1062349, -1.318233, 0, 0, 0, 1, 1,
-0.1567756, -0.08804792, -1.394944, 0, 0, 0, 1, 1,
-0.1564916, 0.6837702, -0.9977725, 0, 0, 0, 1, 1,
-0.1535928, 0.8755452, -0.6388281, 0, 0, 0, 1, 1,
-0.1489486, 1.448371, 0.5159156, 0, 0, 0, 1, 1,
-0.138253, 0.8265007, 0.9897095, 0, 0, 0, 1, 1,
-0.1352095, 1.140129, -0.1957542, 1, 1, 1, 1, 1,
-0.1290024, -0.02750027, -1.89537, 1, 1, 1, 1, 1,
-0.1276977, -0.5859637, -3.083559, 1, 1, 1, 1, 1,
-0.1216031, 0.1219177, 0.1930317, 1, 1, 1, 1, 1,
-0.1190785, -0.7146657, -1.754813, 1, 1, 1, 1, 1,
-0.117428, 1.223399, -1.304556, 1, 1, 1, 1, 1,
-0.1167902, -0.9796258, -2.449836, 1, 1, 1, 1, 1,
-0.1151088, -0.805661, -3.446348, 1, 1, 1, 1, 1,
-0.1111859, -0.734332, -3.700788, 1, 1, 1, 1, 1,
-0.101576, -0.2118905, -2.157744, 1, 1, 1, 1, 1,
-0.09932117, 1.696313, -2.286566, 1, 1, 1, 1, 1,
-0.09896182, -1.24834, -4.157149, 1, 1, 1, 1, 1,
-0.09827238, -0.1931501, -3.300806, 1, 1, 1, 1, 1,
-0.09677195, -1.759192, -4.049649, 1, 1, 1, 1, 1,
-0.09498905, -0.2969982, -2.466156, 1, 1, 1, 1, 1,
-0.09348909, -1.042576, -2.279036, 0, 0, 1, 1, 1,
-0.09330215, -0.9864388, -4.568792, 1, 0, 0, 1, 1,
-0.09108362, -1.639778, -0.9794195, 1, 0, 0, 1, 1,
-0.0821317, 0.3336583, -0.7198186, 1, 0, 0, 1, 1,
-0.07888924, 0.5029441, -0.4892985, 1, 0, 0, 1, 1,
-0.07847647, 0.1913771, -1.834367, 1, 0, 0, 1, 1,
-0.07682204, -0.6923, -2.83686, 0, 0, 0, 1, 1,
-0.07486267, -0.02866913, -1.881625, 0, 0, 0, 1, 1,
-0.07422451, 0.9162788, 1.782377, 0, 0, 0, 1, 1,
-0.06993802, -1.164344, -4.813026, 0, 0, 0, 1, 1,
-0.06991783, 0.7590189, 0.2870994, 0, 0, 0, 1, 1,
-0.06797622, -0.7530848, -4.33863, 0, 0, 0, 1, 1,
-0.06749041, 0.2470383, -1.727877, 0, 0, 0, 1, 1,
-0.06427394, 0.404132, 0.7376239, 1, 1, 1, 1, 1,
-0.06207452, -0.4829611, -3.019507, 1, 1, 1, 1, 1,
-0.06160044, 1.247871, -1.50242, 1, 1, 1, 1, 1,
-0.0604655, 1.044058, -0.8599833, 1, 1, 1, 1, 1,
-0.05870245, 1.732101, 0.3487394, 1, 1, 1, 1, 1,
-0.05599456, -0.3892794, -3.21298, 1, 1, 1, 1, 1,
-0.05213849, -0.1036283, -4.737476, 1, 1, 1, 1, 1,
-0.05104035, -0.9816741, -2.370716, 1, 1, 1, 1, 1,
-0.04758881, -0.941922, -2.513092, 1, 1, 1, 1, 1,
-0.04601666, 1.993242, 1.53702, 1, 1, 1, 1, 1,
-0.04583838, 0.3721924, 0.08642439, 1, 1, 1, 1, 1,
-0.0454215, -0.3044941, -4.728087, 1, 1, 1, 1, 1,
-0.04432965, -0.3581661, -3.323218, 1, 1, 1, 1, 1,
-0.04285109, -0.7506591, -4.868331, 1, 1, 1, 1, 1,
-0.04265209, -1.201639, -3.178632, 1, 1, 1, 1, 1,
-0.0392892, -0.2705273, -4.316136, 0, 0, 1, 1, 1,
-0.03701229, -1.501248, -3.281708, 1, 0, 0, 1, 1,
-0.02955547, 0.6671056, -1.805948, 1, 0, 0, 1, 1,
-0.0265273, 0.2412247, 0.1312843, 1, 0, 0, 1, 1,
-0.02587484, -0.3751227, -4.349607, 1, 0, 0, 1, 1,
-0.01948269, 1.401594, -0.8998626, 1, 0, 0, 1, 1,
-0.01932364, 0.3036802, -1.625764, 0, 0, 0, 1, 1,
-0.01373236, -1.544476, -3.432877, 0, 0, 0, 1, 1,
-0.0136535, -0.5563462, -2.660015, 0, 0, 0, 1, 1,
-0.01248629, -0.02570368, -3.624517, 0, 0, 0, 1, 1,
-0.01234769, -0.6932184, -2.778408, 0, 0, 0, 1, 1,
-0.009818677, 1.189476, 1.120325, 0, 0, 0, 1, 1,
-0.006854414, 2.187659, -0.5977311, 0, 0, 0, 1, 1,
-0.005233084, -0.4466059, -3.60125, 1, 1, 1, 1, 1,
-0.004473312, -0.758492, -2.459571, 1, 1, 1, 1, 1,
-0.003853117, -1.472655, -3.532614, 1, 1, 1, 1, 1,
-0.001171025, -0.4335245, -4.213664, 1, 1, 1, 1, 1,
-0.001142652, 0.1304134, 0.2282909, 1, 1, 1, 1, 1,
-0.0006660478, 0.360223, -0.881061, 1, 1, 1, 1, 1,
0.002104073, -1.024184, 1.565742, 1, 1, 1, 1, 1,
0.01357463, 0.8669053, -0.1420185, 1, 1, 1, 1, 1,
0.01401295, -1.618772, 1.951835, 1, 1, 1, 1, 1,
0.01729914, -0.2313196, 1.825621, 1, 1, 1, 1, 1,
0.02043815, 0.04648134, 1.543562, 1, 1, 1, 1, 1,
0.02233659, 0.6597011, -0.9278395, 1, 1, 1, 1, 1,
0.02353373, -0.7663237, 1.995234, 1, 1, 1, 1, 1,
0.0242196, 0.6139924, 1.313889, 1, 1, 1, 1, 1,
0.02475162, 0.0201492, 1.711309, 1, 1, 1, 1, 1,
0.02590329, 0.5878308, -0.4033418, 0, 0, 1, 1, 1,
0.03089271, 0.3780294, 2.141012, 1, 0, 0, 1, 1,
0.03341385, 0.7151189, -0.667212, 1, 0, 0, 1, 1,
0.0349479, 0.6117064, 0.6517984, 1, 0, 0, 1, 1,
0.03703459, 0.5380861, 0.9047031, 1, 0, 0, 1, 1,
0.04041108, 1.567806, 0.2097325, 1, 0, 0, 1, 1,
0.043908, 1.901713, 1.424892, 0, 0, 0, 1, 1,
0.04463812, -2.933826, 3.387582, 0, 0, 0, 1, 1,
0.04633491, -0.4284768, 3.700342, 0, 0, 0, 1, 1,
0.04827027, -0.4245888, 4.808934, 0, 0, 0, 1, 1,
0.05090877, -0.7314596, 1.102596, 0, 0, 0, 1, 1,
0.0517076, -0.6471987, 4.420253, 0, 0, 0, 1, 1,
0.05697847, 1.853038, -0.4474867, 0, 0, 0, 1, 1,
0.06202068, 0.8073521, 0.1109438, 1, 1, 1, 1, 1,
0.06480911, 0.04439168, -1.00889, 1, 1, 1, 1, 1,
0.06507873, -0.3425409, 2.618545, 1, 1, 1, 1, 1,
0.06890052, -0.8283739, 2.346127, 1, 1, 1, 1, 1,
0.06961485, 1.020024, 0.3277124, 1, 1, 1, 1, 1,
0.06990453, 0.3915052, 0.4454699, 1, 1, 1, 1, 1,
0.07659135, -0.03990363, 2.673709, 1, 1, 1, 1, 1,
0.08023074, -0.8215618, 2.467375, 1, 1, 1, 1, 1,
0.08466481, -1.87043, 3.8318, 1, 1, 1, 1, 1,
0.08470415, -0.07726734, 2.941824, 1, 1, 1, 1, 1,
0.08773134, 1.244831, -0.8624647, 1, 1, 1, 1, 1,
0.08989426, -0.3196464, 2.077771, 1, 1, 1, 1, 1,
0.09175462, 0.7802376, -2.489206, 1, 1, 1, 1, 1,
0.09313811, 0.3012427, 0.6948652, 1, 1, 1, 1, 1,
0.09399013, 0.9504064, 0.4528839, 1, 1, 1, 1, 1,
0.094882, -1.280683, 2.632022, 0, 0, 1, 1, 1,
0.09597599, -0.4837176, 3.086262, 1, 0, 0, 1, 1,
0.096312, 0.3794529, 0.56231, 1, 0, 0, 1, 1,
0.09930827, 0.5606825, 0.9137955, 1, 0, 0, 1, 1,
0.09974587, -1.870806, 2.075581, 1, 0, 0, 1, 1,
0.1011273, 0.5714128, 0.07858365, 1, 0, 0, 1, 1,
0.1040717, 1.607896, -0.4316954, 0, 0, 0, 1, 1,
0.1076795, -1.427178, 3.348787, 0, 0, 0, 1, 1,
0.1092566, -1.105485, 2.586482, 0, 0, 0, 1, 1,
0.1098862, 0.2265599, 1.461334, 0, 0, 0, 1, 1,
0.1119809, 0.4655919, 0.7534169, 0, 0, 0, 1, 1,
0.1176522, 0.2228476, 1.73995, 0, 0, 0, 1, 1,
0.1189604, 0.8561885, 1.518, 0, 0, 0, 1, 1,
0.1209545, -0.3485422, 0.7719421, 1, 1, 1, 1, 1,
0.1270604, -1.349463, 2.322492, 1, 1, 1, 1, 1,
0.1282093, -1.517595, 2.264828, 1, 1, 1, 1, 1,
0.1293535, -0.7221369, 3.698174, 1, 1, 1, 1, 1,
0.1354641, 0.1182036, 0.3311087, 1, 1, 1, 1, 1,
0.1360462, 0.4231182, 1.314209, 1, 1, 1, 1, 1,
0.1437016, -0.9578242, 3.795072, 1, 1, 1, 1, 1,
0.1448627, 0.4028491, 0.1184001, 1, 1, 1, 1, 1,
0.1448645, -1.227639, 2.444408, 1, 1, 1, 1, 1,
0.1487839, -0.5085025, 2.862179, 1, 1, 1, 1, 1,
0.1493778, 1.015862, -1.056667, 1, 1, 1, 1, 1,
0.1495313, 0.2522509, 1.548751, 1, 1, 1, 1, 1,
0.1508909, 0.1206313, -0.1529505, 1, 1, 1, 1, 1,
0.1511534, -0.6944094, 3.50251, 1, 1, 1, 1, 1,
0.1542496, -2.064363, 4.056637, 1, 1, 1, 1, 1,
0.1551062, 0.1245895, -0.6004851, 0, 0, 1, 1, 1,
0.1563861, -1.631894, 1.65115, 1, 0, 0, 1, 1,
0.1643037, 0.6768502, -1.187436, 1, 0, 0, 1, 1,
0.1701194, 0.6497096, -0.718297, 1, 0, 0, 1, 1,
0.1719215, 0.621694, 0.5124515, 1, 0, 0, 1, 1,
0.1725408, -1.418817, 1.531451, 1, 0, 0, 1, 1,
0.1749551, 0.4949219, -0.5026086, 0, 0, 0, 1, 1,
0.1792071, -1.14026, 0.772265, 0, 0, 0, 1, 1,
0.180794, 1.045254, -0.5829896, 0, 0, 0, 1, 1,
0.1809879, 0.1800711, 1.713071, 0, 0, 0, 1, 1,
0.1822279, -0.9673049, 3.53635, 0, 0, 0, 1, 1,
0.1829435, -0.3382718, 2.451721, 0, 0, 0, 1, 1,
0.1829513, 0.1142989, 0.62252, 0, 0, 0, 1, 1,
0.1847795, 0.4115147, 0.2391804, 1, 1, 1, 1, 1,
0.1854149, -0.2183845, 2.303817, 1, 1, 1, 1, 1,
0.185974, 0.03930089, 1.994401, 1, 1, 1, 1, 1,
0.1868795, 0.6960487, 0.7207035, 1, 1, 1, 1, 1,
0.189425, 0.03368257, 3.44425, 1, 1, 1, 1, 1,
0.1949921, 0.382938, 1.396092, 1, 1, 1, 1, 1,
0.1961418, 1.708034, 0.3934756, 1, 1, 1, 1, 1,
0.1974934, 0.1009246, -1.327928, 1, 1, 1, 1, 1,
0.1975852, -0.8472292, 1.422875, 1, 1, 1, 1, 1,
0.2004024, 1.138776, 1.329871, 1, 1, 1, 1, 1,
0.2024613, -0.1227098, 1.284443, 1, 1, 1, 1, 1,
0.2057339, -0.3826664, 2.695416, 1, 1, 1, 1, 1,
0.2069582, 0.06524669, 2.415672, 1, 1, 1, 1, 1,
0.2071404, -2.063761, 3.376156, 1, 1, 1, 1, 1,
0.2078361, -0.07709575, 2.361181, 1, 1, 1, 1, 1,
0.2160941, -0.9512632, 2.972878, 0, 0, 1, 1, 1,
0.2168202, 0.1137607, 1.492328, 1, 0, 0, 1, 1,
0.2174972, -1.105025, 1.553629, 1, 0, 0, 1, 1,
0.2277523, -0.665006, 1.836829, 1, 0, 0, 1, 1,
0.2320526, 1.055329, 1.868019, 1, 0, 0, 1, 1,
0.2365897, -0.7566182, 1.078802, 1, 0, 0, 1, 1,
0.239142, 0.05739858, 2.020756, 0, 0, 0, 1, 1,
0.2415874, 0.8901415, 0.8983086, 0, 0, 0, 1, 1,
0.2428904, -1.255839, 4.165235, 0, 0, 0, 1, 1,
0.2501931, -0.3401182, 2.860813, 0, 0, 0, 1, 1,
0.2522244, -0.9144434, 1.18491, 0, 0, 0, 1, 1,
0.2540076, 0.6591271, -0.01328341, 0, 0, 0, 1, 1,
0.2567084, 0.537087, 0.2191598, 0, 0, 0, 1, 1,
0.2572994, -0.01402983, 1.613945, 1, 1, 1, 1, 1,
0.2586684, -0.1480663, 3.599663, 1, 1, 1, 1, 1,
0.2636186, -0.09681764, 1.839375, 1, 1, 1, 1, 1,
0.2658924, -1.282557, 3.741834, 1, 1, 1, 1, 1,
0.2704155, 0.6774176, -0.4388038, 1, 1, 1, 1, 1,
0.2705228, -1.215388, 3.742593, 1, 1, 1, 1, 1,
0.2708205, -1.138213, 4.355803, 1, 1, 1, 1, 1,
0.272375, -0.8894132, 3.137743, 1, 1, 1, 1, 1,
0.2782062, 1.639598, -0.8755289, 1, 1, 1, 1, 1,
0.2803446, -0.02478976, 1.973016, 1, 1, 1, 1, 1,
0.2808272, -0.8044428, 1.535995, 1, 1, 1, 1, 1,
0.2809973, -0.5504387, 2.534507, 1, 1, 1, 1, 1,
0.2812009, 0.2117324, 0.4233731, 1, 1, 1, 1, 1,
0.2814262, -0.8029677, 3.87312, 1, 1, 1, 1, 1,
0.28322, -0.3390304, 2.906081, 1, 1, 1, 1, 1,
0.2854569, 0.8351869, -0.925621, 0, 0, 1, 1, 1,
0.2865418, 1.303517, 2.262126, 1, 0, 0, 1, 1,
0.2878146, -0.7527376, 2.740258, 1, 0, 0, 1, 1,
0.2878418, 0.6265781, 0.6480823, 1, 0, 0, 1, 1,
0.2894805, -0.6689467, 2.506478, 1, 0, 0, 1, 1,
0.2981015, 0.3469294, 1.17358, 1, 0, 0, 1, 1,
0.3002313, -1.028612, 3.589581, 0, 0, 0, 1, 1,
0.3009243, 0.7514711, 0.1942597, 0, 0, 0, 1, 1,
0.3043051, -0.3529697, 1.749998, 0, 0, 0, 1, 1,
0.3066525, -0.7371191, 1.324491, 0, 0, 0, 1, 1,
0.3138656, -0.9872698, 1.452454, 0, 0, 0, 1, 1,
0.3182781, 1.031021, -1.491408, 0, 0, 0, 1, 1,
0.3194582, -1.664351, 2.719157, 0, 0, 0, 1, 1,
0.3211682, -0.4468826, 1.994774, 1, 1, 1, 1, 1,
0.3221317, -0.2855731, 2.885841, 1, 1, 1, 1, 1,
0.3281041, 0.5194016, -0.1791141, 1, 1, 1, 1, 1,
0.3286903, 0.3576894, 1.957582, 1, 1, 1, 1, 1,
0.3292405, 0.2737826, 1.30896, 1, 1, 1, 1, 1,
0.3306607, 0.2897071, 0.3674664, 1, 1, 1, 1, 1,
0.330827, 1.096924, -0.2499204, 1, 1, 1, 1, 1,
0.3385955, 1.473561, 0.02621852, 1, 1, 1, 1, 1,
0.3389871, 1.934343, 0.1683936, 1, 1, 1, 1, 1,
0.3409036, 1.266515, 0.2698588, 1, 1, 1, 1, 1,
0.3471223, -0.562296, 4.186363, 1, 1, 1, 1, 1,
0.3497222, -0.349515, 1.940806, 1, 1, 1, 1, 1,
0.3515881, 1.070979, 0.9446513, 1, 1, 1, 1, 1,
0.3586068, 0.9200237, -0.09983117, 1, 1, 1, 1, 1,
0.3660233, 0.06818882, 2.351154, 1, 1, 1, 1, 1,
0.3673535, -0.6594521, 3.561228, 0, 0, 1, 1, 1,
0.3678808, -0.452094, 2.905841, 1, 0, 0, 1, 1,
0.3689461, 0.6358412, 0.2926247, 1, 0, 0, 1, 1,
0.3693397, -0.4451399, 2.937441, 1, 0, 0, 1, 1,
0.3708605, 0.6257244, 1.320319, 1, 0, 0, 1, 1,
0.3718284, -1.367162, 4.228522, 1, 0, 0, 1, 1,
0.3721146, 0.8559055, 0.02327963, 0, 0, 0, 1, 1,
0.3738837, 2.752825, -0.1609666, 0, 0, 0, 1, 1,
0.3756176, 0.637243, 1.430434, 0, 0, 0, 1, 1,
0.3770642, -0.9749587, 2.809819, 0, 0, 0, 1, 1,
0.3812478, 1.222629, 0.09558038, 0, 0, 0, 1, 1,
0.3818346, 0.3174873, -1.761472, 0, 0, 0, 1, 1,
0.3833311, 0.4398597, 1.925434, 0, 0, 0, 1, 1,
0.3847251, -0.3743129, 0.2161118, 1, 1, 1, 1, 1,
0.3908458, -0.6088883, 3.912433, 1, 1, 1, 1, 1,
0.396266, -0.6176946, 2.390095, 1, 1, 1, 1, 1,
0.3980306, 0.2709531, 1.10764, 1, 1, 1, 1, 1,
0.3994343, 2.603104, 0.4329959, 1, 1, 1, 1, 1,
0.4014903, 0.2782097, 2.965097, 1, 1, 1, 1, 1,
0.4015186, -0.4367487, 2.670161, 1, 1, 1, 1, 1,
0.4024541, 0.4911682, 1.255114, 1, 1, 1, 1, 1,
0.4050491, -1.805166, 4.396555, 1, 1, 1, 1, 1,
0.4053676, -1.429336, 2.279949, 1, 1, 1, 1, 1,
0.4088041, 0.6705401, 1.416189, 1, 1, 1, 1, 1,
0.4093595, 1.11742, -0.7746865, 1, 1, 1, 1, 1,
0.4108877, -0.04714356, 1.391665, 1, 1, 1, 1, 1,
0.4130243, -1.01282, 3.571538, 1, 1, 1, 1, 1,
0.4139818, -0.9847692, 2.190231, 1, 1, 1, 1, 1,
0.4147457, 0.6339834, 1.63143, 0, 0, 1, 1, 1,
0.4186414, -0.59212, 1.710881, 1, 0, 0, 1, 1,
0.4264163, -0.8817446, 4.355088, 1, 0, 0, 1, 1,
0.4292232, -0.1056417, 3.465196, 1, 0, 0, 1, 1,
0.4403727, 1.252703, 1.30139, 1, 0, 0, 1, 1,
0.4411425, -0.1604291, 2.232013, 1, 0, 0, 1, 1,
0.4445088, 0.2366412, 1.72955, 0, 0, 0, 1, 1,
0.4495293, 0.7964366, 1.429353, 0, 0, 0, 1, 1,
0.4506465, 0.1621863, 1.079153, 0, 0, 0, 1, 1,
0.4514608, 0.0192619, 1.505076, 0, 0, 0, 1, 1,
0.4520512, -0.7397325, 1.587346, 0, 0, 0, 1, 1,
0.4544526, 0.3144509, -0.8665762, 0, 0, 0, 1, 1,
0.4551743, 1.180319, 0.2446878, 0, 0, 0, 1, 1,
0.4577055, 1.509007, -1.477348, 1, 1, 1, 1, 1,
0.4605358, -1.411844, 3.611357, 1, 1, 1, 1, 1,
0.4654338, -0.8846069, 2.836072, 1, 1, 1, 1, 1,
0.4657023, 1.447966, 0.8000122, 1, 1, 1, 1, 1,
0.472158, 1.111332, 0.827503, 1, 1, 1, 1, 1,
0.4744599, 0.2250098, 1.433083, 1, 1, 1, 1, 1,
0.4760605, -1.787024, 2.144595, 1, 1, 1, 1, 1,
0.4775254, 0.4089744, 1.829723, 1, 1, 1, 1, 1,
0.4839985, 1.06717, -0.06036863, 1, 1, 1, 1, 1,
0.4849451, -0.4577953, 3.275045, 1, 1, 1, 1, 1,
0.4870739, -2.104169, 2.41695, 1, 1, 1, 1, 1,
0.4958886, -1.221437, 2.175406, 1, 1, 1, 1, 1,
0.4981997, 0.8065144, 2.414187, 1, 1, 1, 1, 1,
0.5048575, -0.4651375, 3.595746, 1, 1, 1, 1, 1,
0.5134647, 0.9201381, 1.917417, 1, 1, 1, 1, 1,
0.5164536, 0.7136601, 1.431135, 0, 0, 1, 1, 1,
0.523558, 1.639754, -1.143737, 1, 0, 0, 1, 1,
0.5236371, 0.004541386, 3.349307, 1, 0, 0, 1, 1,
0.5243514, -2.16209, 3.267952, 1, 0, 0, 1, 1,
0.5253313, 0.9685376, -1.038165, 1, 0, 0, 1, 1,
0.5261372, -0.1948591, 1.63189, 1, 0, 0, 1, 1,
0.5304321, -1.451864, 3.338512, 0, 0, 0, 1, 1,
0.5324845, -0.8393252, 3.825024, 0, 0, 0, 1, 1,
0.5331864, -0.1667777, 1.452764, 0, 0, 0, 1, 1,
0.5333607, 0.82999, -1.084848, 0, 0, 0, 1, 1,
0.5337445, 1.785636, 0.288565, 0, 0, 0, 1, 1,
0.5348402, -0.710508, 2.761123, 0, 0, 0, 1, 1,
0.5361129, -0.03092326, 3.105101, 0, 0, 0, 1, 1,
0.543231, -0.1489029, 2.068262, 1, 1, 1, 1, 1,
0.5433126, -1.055264, 1.978423, 1, 1, 1, 1, 1,
0.5433331, -0.408181, 3.323762, 1, 1, 1, 1, 1,
0.5465173, 0.7719385, 1.182616, 1, 1, 1, 1, 1,
0.5483337, 0.9464228, -0.2529877, 1, 1, 1, 1, 1,
0.5510012, -0.3779466, 2.826208, 1, 1, 1, 1, 1,
0.559488, 1.185613, -1.043056, 1, 1, 1, 1, 1,
0.5651874, 0.5859702, 0.7342325, 1, 1, 1, 1, 1,
0.5670132, 0.7219997, 0.4205371, 1, 1, 1, 1, 1,
0.5685347, 0.5021641, 2.658803, 1, 1, 1, 1, 1,
0.5700241, 2.009146, -0.02029959, 1, 1, 1, 1, 1,
0.5734199, -0.8852196, 2.235071, 1, 1, 1, 1, 1,
0.5756013, 0.03569708, 2.52688, 1, 1, 1, 1, 1,
0.5778355, 0.7458313, 1.370509, 1, 1, 1, 1, 1,
0.5808964, -0.1433907, 1.4853, 1, 1, 1, 1, 1,
0.582085, 0.3021931, 1.111265, 0, 0, 1, 1, 1,
0.5879653, 0.1769383, 1.567272, 1, 0, 0, 1, 1,
0.5879976, -0.4293422, 3.00142, 1, 0, 0, 1, 1,
0.5904778, 2.490496, 0.7822461, 1, 0, 0, 1, 1,
0.592562, 0.5265754, 0.1573284, 1, 0, 0, 1, 1,
0.5979759, 0.4209572, 1.198185, 1, 0, 0, 1, 1,
0.60013, -0.04251936, 1.10869, 0, 0, 0, 1, 1,
0.6033356, -0.3592425, 3.873089, 0, 0, 0, 1, 1,
0.6061376, 0.5828139, 0.3070344, 0, 0, 0, 1, 1,
0.6071513, -1.465175, 4.667703, 0, 0, 0, 1, 1,
0.6078103, -0.9299307, 2.137734, 0, 0, 0, 1, 1,
0.6093751, 0.3114977, 0.6061327, 0, 0, 0, 1, 1,
0.6097489, 0.02291535, 1.595875, 0, 0, 0, 1, 1,
0.611366, -0.3118973, 2.72529, 1, 1, 1, 1, 1,
0.6159329, 0.1014994, 2.069056, 1, 1, 1, 1, 1,
0.618042, -1.163624, 4.299253, 1, 1, 1, 1, 1,
0.6304463, 0.1042664, 1.233894, 1, 1, 1, 1, 1,
0.6388761, -0.3997409, 3.019213, 1, 1, 1, 1, 1,
0.6421077, 0.1496486, 0.9192019, 1, 1, 1, 1, 1,
0.6442265, 0.4385945, -0.553582, 1, 1, 1, 1, 1,
0.64577, -1.050424, 2.184761, 1, 1, 1, 1, 1,
0.6491475, -0.4357888, 1.751393, 1, 1, 1, 1, 1,
0.6507593, -1.509089, 3.987233, 1, 1, 1, 1, 1,
0.6516548, -0.7486327, 2.491066, 1, 1, 1, 1, 1,
0.655755, -1.00853, 1.972022, 1, 1, 1, 1, 1,
0.6601468, 1.44007, 0.3297498, 1, 1, 1, 1, 1,
0.6636186, -0.7806231, 2.549326, 1, 1, 1, 1, 1,
0.6638968, 0.6911734, 2.523196, 1, 1, 1, 1, 1,
0.670068, 2.03986, -0.556349, 0, 0, 1, 1, 1,
0.6710084, 0.7246039, 0.5023586, 1, 0, 0, 1, 1,
0.6729826, -0.6538132, 1.808894, 1, 0, 0, 1, 1,
0.6835324, 1.571909, -0.4228005, 1, 0, 0, 1, 1,
0.6850147, -0.8724192, 3.485968, 1, 0, 0, 1, 1,
0.6851192, 0.4803449, -0.4364846, 1, 0, 0, 1, 1,
0.6863371, -0.06717003, 1.919111, 0, 0, 0, 1, 1,
0.6887133, 1.835412, -0.1867707, 0, 0, 0, 1, 1,
0.6908357, -1.244095, 0.7203714, 0, 0, 0, 1, 1,
0.7012028, 2.402252, -0.179996, 0, 0, 0, 1, 1,
0.7013985, -0.3115095, 2.564552, 0, 0, 0, 1, 1,
0.7053055, -2.347299, 3.042261, 0, 0, 0, 1, 1,
0.7112502, 0.4241759, 1.350365, 0, 0, 0, 1, 1,
0.7164136, 1.546668, 1.433173, 1, 1, 1, 1, 1,
0.7189682, -0.3370013, -0.6735415, 1, 1, 1, 1, 1,
0.7210925, -2.846795, 2.087735, 1, 1, 1, 1, 1,
0.7232814, 0.0422929, 1.667632, 1, 1, 1, 1, 1,
0.7260239, 1.048333, 1.408601, 1, 1, 1, 1, 1,
0.7342403, -0.1577222, 2.238868, 1, 1, 1, 1, 1,
0.7440038, -0.3416803, 2.099859, 1, 1, 1, 1, 1,
0.7445257, 0.1683469, 0.6369442, 1, 1, 1, 1, 1,
0.749447, -0.7620175, 0.1592019, 1, 1, 1, 1, 1,
0.7597749, 0.8390443, 1.953914, 1, 1, 1, 1, 1,
0.7729381, 0.1199196, 1.533129, 1, 1, 1, 1, 1,
0.7802384, 0.1435434, 2.343106, 1, 1, 1, 1, 1,
0.7826886, 0.004052971, 1.958918, 1, 1, 1, 1, 1,
0.7846951, 1.123615, 1.538242, 1, 1, 1, 1, 1,
0.7857385, -1.605296, 1.834979, 1, 1, 1, 1, 1,
0.7872778, -0.5209504, 1.728567, 0, 0, 1, 1, 1,
0.7874951, -1.567664, 4.046828, 1, 0, 0, 1, 1,
0.7903143, 0.09566177, 2.041365, 1, 0, 0, 1, 1,
0.7916271, -0.1476708, 2.729118, 1, 0, 0, 1, 1,
0.7944424, 0.7676104, 0.6209278, 1, 0, 0, 1, 1,
0.7973319, -0.7857509, 1.342505, 1, 0, 0, 1, 1,
0.8023192, 0.2692406, 3.23303, 0, 0, 0, 1, 1,
0.8093599, 0.4967715, 0.5581835, 0, 0, 0, 1, 1,
0.8159824, 0.1321325, 1.678256, 0, 0, 0, 1, 1,
0.8163005, -0.4992354, 3.96507, 0, 0, 0, 1, 1,
0.8168262, -0.1682643, 2.665121, 0, 0, 0, 1, 1,
0.8190894, -0.1140875, 2.53548, 0, 0, 0, 1, 1,
0.8208695, 2.033736, -0.3010388, 0, 0, 0, 1, 1,
0.822602, -0.6769397, 0.4855839, 1, 1, 1, 1, 1,
0.8235283, 1.587732, 1.75081, 1, 1, 1, 1, 1,
0.8255868, 0.03502109, 1.615096, 1, 1, 1, 1, 1,
0.8268998, -0.9972713, 4.105871, 1, 1, 1, 1, 1,
0.8271236, -1.071297, 2.445087, 1, 1, 1, 1, 1,
0.8274719, 0.2344068, 2.214771, 1, 1, 1, 1, 1,
0.8314422, 2.407539, -0.1615329, 1, 1, 1, 1, 1,
0.8485743, 0.5124461, -2.065667, 1, 1, 1, 1, 1,
0.8489841, 0.7457427, 0.2243415, 1, 1, 1, 1, 1,
0.8519011, 0.6834341, 0.6283316, 1, 1, 1, 1, 1,
0.8546809, -0.3565559, 1.580464, 1, 1, 1, 1, 1,
0.8558569, 1.126941, -0.5502722, 1, 1, 1, 1, 1,
0.8577642, -0.1533511, 2.163341, 1, 1, 1, 1, 1,
0.8609872, 1.206087, -0.7634459, 1, 1, 1, 1, 1,
0.8719313, -0.5563753, 1.278791, 1, 1, 1, 1, 1,
0.8739288, 0.6666896, 0.3856945, 0, 0, 1, 1, 1,
0.8785027, 0.6566916, 0.578053, 1, 0, 0, 1, 1,
0.8842531, 0.7634122, 0.07486234, 1, 0, 0, 1, 1,
0.900032, -1.22961, 3.88837, 1, 0, 0, 1, 1,
0.9228429, 0.203634, 2.012082, 1, 0, 0, 1, 1,
0.9246065, -0.6413087, 2.692986, 1, 0, 0, 1, 1,
0.9285107, -0.4361836, 2.529093, 0, 0, 0, 1, 1,
0.9286642, -1.006311, 3.193459, 0, 0, 0, 1, 1,
0.9348367, -0.1522138, 1.659149, 0, 0, 0, 1, 1,
0.9377382, -1.25336, 2.872521, 0, 0, 0, 1, 1,
0.9393346, -0.0005281278, 2.302022, 0, 0, 0, 1, 1,
0.9400717, -0.0962372, 2.415323, 0, 0, 0, 1, 1,
0.9449632, -1.231357, 2.030883, 0, 0, 0, 1, 1,
0.9491525, -0.7310018, 2.20663, 1, 1, 1, 1, 1,
0.9517042, 1.466367, -0.01645935, 1, 1, 1, 1, 1,
0.9617081, -2.622406, 3.391821, 1, 1, 1, 1, 1,
0.9754784, 1.092796, 1.953722, 1, 1, 1, 1, 1,
0.9784262, 0.01885164, 1.240628, 1, 1, 1, 1, 1,
0.9798669, -1.824165, 2.672307, 1, 1, 1, 1, 1,
0.9849518, -0.14337, 0.9472204, 1, 1, 1, 1, 1,
0.9854705, -1.327462, 3.196548, 1, 1, 1, 1, 1,
0.9865696, 1.187404, 0.1365198, 1, 1, 1, 1, 1,
0.9897163, 0.7887696, 2.268657, 1, 1, 1, 1, 1,
0.9989234, 0.112034, 3.176202, 1, 1, 1, 1, 1,
1.001466, 0.8238469, 0.4079805, 1, 1, 1, 1, 1,
1.006672, 0.8890253, 1.657383, 1, 1, 1, 1, 1,
1.010152, -0.5075305, 2.725832, 1, 1, 1, 1, 1,
1.021525, -0.7130287, 2.238237, 1, 1, 1, 1, 1,
1.022673, -0.01333305, 4.266511, 0, 0, 1, 1, 1,
1.026084, 0.002213169, 3.179714, 1, 0, 0, 1, 1,
1.027953, 0.5077322, 1.077519, 1, 0, 0, 1, 1,
1.029391, -0.1911841, 2.582991, 1, 0, 0, 1, 1,
1.03048, 0.05791607, 0.4746921, 1, 0, 0, 1, 1,
1.032707, -0.6386266, 1.147729, 1, 0, 0, 1, 1,
1.035511, -0.9687169, 1.261395, 0, 0, 0, 1, 1,
1.036998, -1.246588, 1.702806, 0, 0, 0, 1, 1,
1.044199, 0.6975527, -0.1101747, 0, 0, 0, 1, 1,
1.047506, -0.9300742, 2.946082, 0, 0, 0, 1, 1,
1.04862, 1.16687, 1.585233, 0, 0, 0, 1, 1,
1.055598, 0.9073088, -0.2152323, 0, 0, 0, 1, 1,
1.061036, -1.04581, 2.717255, 0, 0, 0, 1, 1,
1.06705, -1.360159, -0.2582545, 1, 1, 1, 1, 1,
1.073778, 0.1276781, 1.541628, 1, 1, 1, 1, 1,
1.08207, -2.351743, 3.061911, 1, 1, 1, 1, 1,
1.08454, 0.01287198, 1.201349, 1, 1, 1, 1, 1,
1.088045, -0.04447524, 2.209189, 1, 1, 1, 1, 1,
1.099117, 0.3503512, 0.5579613, 1, 1, 1, 1, 1,
1.100225, 0.7960786, 0.3643504, 1, 1, 1, 1, 1,
1.100415, 2.178959, 3.209391, 1, 1, 1, 1, 1,
1.100421, 1.009372, 1.033348, 1, 1, 1, 1, 1,
1.110556, 1.039733, 0.5082909, 1, 1, 1, 1, 1,
1.113225, -1.420895, 2.597202, 1, 1, 1, 1, 1,
1.11355, -0.1077198, 1.385555, 1, 1, 1, 1, 1,
1.118891, -1.331647, 2.529254, 1, 1, 1, 1, 1,
1.119174, 0.7444294, 1.845351, 1, 1, 1, 1, 1,
1.126716, 0.04419774, 1.845291, 1, 1, 1, 1, 1,
1.131366, -0.2825582, 1.272009, 0, 0, 1, 1, 1,
1.132812, 0.7931055, 0.3968536, 1, 0, 0, 1, 1,
1.134775, -0.2618677, 0.9446101, 1, 0, 0, 1, 1,
1.141082, -0.2302319, 2.502407, 1, 0, 0, 1, 1,
1.143008, 0.9979095, 0.3636705, 1, 0, 0, 1, 1,
1.14443, -0.5441233, 2.505921, 1, 0, 0, 1, 1,
1.152603, -1.04011, 1.767659, 0, 0, 0, 1, 1,
1.152733, 0.09885921, 0.3334118, 0, 0, 0, 1, 1,
1.154556, -1.205753, 1.735998, 0, 0, 0, 1, 1,
1.154597, 1.530792, 1.397892, 0, 0, 0, 1, 1,
1.159394, 0.2042312, 1.520091, 0, 0, 0, 1, 1,
1.161924, 0.5963855, -0.1461473, 0, 0, 0, 1, 1,
1.167154, 0.3821751, 1.817081, 0, 0, 0, 1, 1,
1.167317, 0.7802618, 0.214446, 1, 1, 1, 1, 1,
1.179885, 1.141472, 1.134516, 1, 1, 1, 1, 1,
1.18095, 0.5062979, -0.1675337, 1, 1, 1, 1, 1,
1.184366, -0.1983733, 3.689449, 1, 1, 1, 1, 1,
1.185755, 2.50746, 0.2330514, 1, 1, 1, 1, 1,
1.20301, -0.4432568, 2.6193, 1, 1, 1, 1, 1,
1.210527, -0.315915, 1.029257, 1, 1, 1, 1, 1,
1.211613, 0.650553, 1.439722, 1, 1, 1, 1, 1,
1.214835, 0.9495678, 0.8410383, 1, 1, 1, 1, 1,
1.21885, 0.3204018, 1.631397, 1, 1, 1, 1, 1,
1.221117, -2.048418, 1.968881, 1, 1, 1, 1, 1,
1.222217, -0.707798, 1.550308, 1, 1, 1, 1, 1,
1.229501, -0.8551128, 2.723108, 1, 1, 1, 1, 1,
1.237407, -0.474168, 0.7728929, 1, 1, 1, 1, 1,
1.245784, -2.372595, 2.544594, 1, 1, 1, 1, 1,
1.249108, -1.666683, 4.067067, 0, 0, 1, 1, 1,
1.252129, 0.6744372, 0.958333, 1, 0, 0, 1, 1,
1.283235, -2.52959, 3.380512, 1, 0, 0, 1, 1,
1.294623, -0.1814653, 1.341573, 1, 0, 0, 1, 1,
1.298342, -0.9630502, 0.2297861, 1, 0, 0, 1, 1,
1.298671, -1.235741, 0.405864, 1, 0, 0, 1, 1,
1.312266, 1.844945, 3.579844, 0, 0, 0, 1, 1,
1.318904, -0.728039, 1.774467, 0, 0, 0, 1, 1,
1.319562, 0.1434335, 2.384222, 0, 0, 0, 1, 1,
1.320068, 0.488298, 1.231506, 0, 0, 0, 1, 1,
1.321064, -2.069715, 1.79723, 0, 0, 0, 1, 1,
1.32259, 1.674775, 1.274615, 0, 0, 0, 1, 1,
1.32382, 2.274367, 0.7308804, 0, 0, 0, 1, 1,
1.327185, 0.1688533, 0.9305069, 1, 1, 1, 1, 1,
1.34873, -1.686905, 2.218109, 1, 1, 1, 1, 1,
1.353685, -0.8947079, 1.316797, 1, 1, 1, 1, 1,
1.355645, -0.9311402, 2.348837, 1, 1, 1, 1, 1,
1.358197, 0.7642796, 1.736012, 1, 1, 1, 1, 1,
1.361075, 0.04092223, 0.988037, 1, 1, 1, 1, 1,
1.36816, 0.1375418, 1.212486, 1, 1, 1, 1, 1,
1.373361, 0.8499215, 0.5039791, 1, 1, 1, 1, 1,
1.375124, 0.06551507, 1.019409, 1, 1, 1, 1, 1,
1.376388, -0.9564987, 3.555821, 1, 1, 1, 1, 1,
1.382214, -2.080742, 3.280625, 1, 1, 1, 1, 1,
1.382447, 2.113741, -0.8098987, 1, 1, 1, 1, 1,
1.388036, -0.4713663, 1.688689, 1, 1, 1, 1, 1,
1.388092, -0.5405893, 2.330735, 1, 1, 1, 1, 1,
1.389842, 0.4898088, 0.8141872, 1, 1, 1, 1, 1,
1.390417, -0.1457649, 2.769965, 0, 0, 1, 1, 1,
1.399888, 1.017418, 0.06238669, 1, 0, 0, 1, 1,
1.400663, -0.08771514, 1.864379, 1, 0, 0, 1, 1,
1.402873, 0.160527, 3.145185, 1, 0, 0, 1, 1,
1.408512, 0.8124831, 0.8883993, 1, 0, 0, 1, 1,
1.427799, -0.8754306, 1.207149, 1, 0, 0, 1, 1,
1.445703, -0.5620807, 3.42256, 0, 0, 0, 1, 1,
1.44751, 0.5976871, 1.433507, 0, 0, 0, 1, 1,
1.448269, -1.648282, 2.864313, 0, 0, 0, 1, 1,
1.461139, 0.08314513, 1.05851, 0, 0, 0, 1, 1,
1.467258, -1.173532, 0.8763196, 0, 0, 0, 1, 1,
1.473345, 0.3189759, 1.099184, 0, 0, 0, 1, 1,
1.491049, 0.9010996, 3.431948, 0, 0, 0, 1, 1,
1.507746, -0.120825, 1.999743, 1, 1, 1, 1, 1,
1.518151, -0.7588531, 3.537237, 1, 1, 1, 1, 1,
1.529432, -0.447754, 2.120724, 1, 1, 1, 1, 1,
1.541986, -0.8450567, 2.128093, 1, 1, 1, 1, 1,
1.551024, 0.3185624, -0.03225559, 1, 1, 1, 1, 1,
1.553222, -1.922592, 4.494472, 1, 1, 1, 1, 1,
1.556379, -0.3328716, 1.948475, 1, 1, 1, 1, 1,
1.561683, 0.9590507, 3.26817, 1, 1, 1, 1, 1,
1.563697, 0.04270023, 2.449117, 1, 1, 1, 1, 1,
1.58007, 1.626245, -1.080748, 1, 1, 1, 1, 1,
1.646055, 0.710687, 1.491239, 1, 1, 1, 1, 1,
1.64717, -0.410529, 1.946093, 1, 1, 1, 1, 1,
1.648369, -0.7647393, 0.9456221, 1, 1, 1, 1, 1,
1.65551, 0.8190134, 3.25877, 1, 1, 1, 1, 1,
1.658027, -0.9458249, 2.331799, 1, 1, 1, 1, 1,
1.675422, 0.245723, -0.4667884, 0, 0, 1, 1, 1,
1.718523, 0.288713, 3.363887, 1, 0, 0, 1, 1,
1.740571, 0.3079054, 1.887766, 1, 0, 0, 1, 1,
1.741384, -0.4713857, 2.376175, 1, 0, 0, 1, 1,
1.745118, 1.474063, 0.3674393, 1, 0, 0, 1, 1,
1.748275, -0.03216727, 1.710527, 1, 0, 0, 1, 1,
1.758279, 2.226487, -0.9971724, 0, 0, 0, 1, 1,
1.786022, 0.009065766, -0.5661086, 0, 0, 0, 1, 1,
1.792026, -0.3237193, 3.497362, 0, 0, 0, 1, 1,
1.818988, 0.7481762, -0.4317919, 0, 0, 0, 1, 1,
1.845067, -0.2168945, 1.937408, 0, 0, 0, 1, 1,
1.846377, 0.7137396, 1.674947, 0, 0, 0, 1, 1,
1.856969, -0.2878068, 1.851108, 0, 0, 0, 1, 1,
1.862832, 1.742706, -0.2968879, 1, 1, 1, 1, 1,
1.867138, -0.3946736, 3.395983, 1, 1, 1, 1, 1,
1.876241, -1.365496, 2.933252, 1, 1, 1, 1, 1,
1.886737, -1.651141, 3.569334, 1, 1, 1, 1, 1,
1.907753, 0.7722709, 2.131948, 1, 1, 1, 1, 1,
1.929311, 1.741862, 0.2630891, 1, 1, 1, 1, 1,
1.933902, 0.3972301, 0.8212633, 1, 1, 1, 1, 1,
1.939663, -0.4256101, 0.5453833, 1, 1, 1, 1, 1,
1.945929, -1.129272, 0.8562672, 1, 1, 1, 1, 1,
1.9537, 0.8020187, 1.331851, 1, 1, 1, 1, 1,
1.962144, 1.658311, -0.04658683, 1, 1, 1, 1, 1,
1.986935, -0.1921695, 0.3507983, 1, 1, 1, 1, 1,
2.000165, -0.4819284, 0.4526904, 1, 1, 1, 1, 1,
2.002188, 0.7225828, 2.452369, 1, 1, 1, 1, 1,
2.003922, -0.4141009, 2.162115, 1, 1, 1, 1, 1,
2.032981, 0.3533387, 0.6942277, 0, 0, 1, 1, 1,
2.080817, 1.202921, 0.8197447, 1, 0, 0, 1, 1,
2.093556, 2.506517, -0.9948997, 1, 0, 0, 1, 1,
2.096077, -0.1702494, 3.316218, 1, 0, 0, 1, 1,
2.142569, 0.07477992, 0.2532076, 1, 0, 0, 1, 1,
2.160083, 1.134593, 1.34821, 1, 0, 0, 1, 1,
2.164418, -1.038437, 1.377159, 0, 0, 0, 1, 1,
2.181858, -0.3878578, 2.462107, 0, 0, 0, 1, 1,
2.195839, -1.146547, 2.868358, 0, 0, 0, 1, 1,
2.268775, 0.4885142, 1.427941, 0, 0, 0, 1, 1,
2.294232, 0.9947456, 1.451215, 0, 0, 0, 1, 1,
2.346519, -1.12739, 2.182986, 0, 0, 0, 1, 1,
2.36255, -0.3559922, 1.688096, 0, 0, 0, 1, 1,
2.534746, 1.214812, 2.409775, 1, 1, 1, 1, 1,
2.536553, -1.126585, 1.992785, 1, 1, 1, 1, 1,
2.660074, -0.9150148, 1.172161, 1, 1, 1, 1, 1,
2.689117, 0.2352859, 3.472132, 1, 1, 1, 1, 1,
2.963668, 0.4457049, -0.4180847, 1, 1, 1, 1, 1,
3.007993, 0.674016, 1.042738, 1, 1, 1, 1, 1,
3.254589, 0.549229, 0.9768544, 1, 1, 1, 1, 1
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
var radius = 8.930299;
var distance = 31.36729;
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
mvMatrix.translate( -0.2333615, 0.0534935, 0.08021164 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.36729);
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
