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
-3.44829, 0.7752446, -1.860836, 1, 0, 0, 1,
-3.295079, 0.9899478, -0.6636165, 1, 0.007843138, 0, 1,
-3.059263, 0.9167244, -2.107303, 1, 0.01176471, 0, 1,
-3.021044, 0.4729859, -1.911184, 1, 0.01960784, 0, 1,
-2.870861, 0.854091, -0.4686785, 1, 0.02352941, 0, 1,
-2.846567, -0.2939108, -0.2773171, 1, 0.03137255, 0, 1,
-2.726774, 0.4171503, -2.7773, 1, 0.03529412, 0, 1,
-2.598775, -1.423934, -2.531781, 1, 0.04313726, 0, 1,
-2.572636, -0.2097106, -2.336307, 1, 0.04705882, 0, 1,
-2.527783, -0.1848761, -2.048411, 1, 0.05490196, 0, 1,
-2.454566, -0.622282, -2.0934, 1, 0.05882353, 0, 1,
-2.445026, -1.312313, -2.18236, 1, 0.06666667, 0, 1,
-2.443969, 0.7589749, 1.009799, 1, 0.07058824, 0, 1,
-2.426725, -0.1065456, -0.110548, 1, 0.07843138, 0, 1,
-2.339454, 2.437981, -1.355824, 1, 0.08235294, 0, 1,
-2.323117, -0.5851375, -3.394286, 1, 0.09019608, 0, 1,
-2.32123, -1.309603, -2.578155, 1, 0.09411765, 0, 1,
-2.294787, -1.101926, -1.396887, 1, 0.1019608, 0, 1,
-2.276391, 0.5197959, -0.7532587, 1, 0.1098039, 0, 1,
-2.252938, -0.3889832, -1.154503, 1, 0.1137255, 0, 1,
-2.251249, 0.2491935, -2.031181, 1, 0.1215686, 0, 1,
-2.223175, 1.41064, 0.9015921, 1, 0.1254902, 0, 1,
-2.212636, 2.370224, -0.8484294, 1, 0.1333333, 0, 1,
-2.199989, -1.181785, -1.222847, 1, 0.1372549, 0, 1,
-2.187714, 0.05265147, -1.620884, 1, 0.145098, 0, 1,
-2.16332, -2.045563, -1.003563, 1, 0.1490196, 0, 1,
-2.134937, -0.002013099, -1.967329, 1, 0.1568628, 0, 1,
-2.077844, 0.4521106, -1.025507, 1, 0.1607843, 0, 1,
-2.07025, -2.858724, -1.58808, 1, 0.1686275, 0, 1,
-2.017478, -1.851426, -2.478209, 1, 0.172549, 0, 1,
-1.991412, -1.04808, -1.904411, 1, 0.1803922, 0, 1,
-1.985874, -1.35021, -2.258675, 1, 0.1843137, 0, 1,
-1.974737, -1.72427, -1.092791, 1, 0.1921569, 0, 1,
-1.965147, -0.1929708, -2.617796, 1, 0.1960784, 0, 1,
-1.959039, -1.622126, -3.499598, 1, 0.2039216, 0, 1,
-1.941417, -0.2005402, -1.112716, 1, 0.2117647, 0, 1,
-1.918429, 0.6065793, -2.535673, 1, 0.2156863, 0, 1,
-1.883949, 0.2086886, -2.962355, 1, 0.2235294, 0, 1,
-1.852704, -0.1083009, -1.217685, 1, 0.227451, 0, 1,
-1.838204, 0.04622935, -3.05967, 1, 0.2352941, 0, 1,
-1.794668, -0.1841937, -2.779181, 1, 0.2392157, 0, 1,
-1.792138, -1.694755, -2.297977, 1, 0.2470588, 0, 1,
-1.78635, -0.78464, -2.232307, 1, 0.2509804, 0, 1,
-1.772552, 1.676025, -0.9207142, 1, 0.2588235, 0, 1,
-1.770431, -0.5443319, 0.3257397, 1, 0.2627451, 0, 1,
-1.73838, 1.340936, -1.033126, 1, 0.2705882, 0, 1,
-1.733544, 2.49899, -0.3263167, 1, 0.2745098, 0, 1,
-1.701202, 0.2926526, 0.2133604, 1, 0.282353, 0, 1,
-1.660817, -0.9411455, -4.021194, 1, 0.2862745, 0, 1,
-1.65792, 0.251946, -2.02455, 1, 0.2941177, 0, 1,
-1.643809, -0.461975, -2.028177, 1, 0.3019608, 0, 1,
-1.635279, 0.4724677, -0.3083946, 1, 0.3058824, 0, 1,
-1.628435, 0.2020236, -2.988478, 1, 0.3137255, 0, 1,
-1.628315, 2.782561, 0.1145541, 1, 0.3176471, 0, 1,
-1.628151, -0.9601817, -3.551762, 1, 0.3254902, 0, 1,
-1.604396, -1.162599, -1.841741, 1, 0.3294118, 0, 1,
-1.602763, -0.1309843, 0.6751282, 1, 0.3372549, 0, 1,
-1.584972, -0.7501687, -1.740863, 1, 0.3411765, 0, 1,
-1.583676, -0.8090181, -0.7167469, 1, 0.3490196, 0, 1,
-1.582311, 1.123585, -0.5181822, 1, 0.3529412, 0, 1,
-1.582272, 0.6831629, -1.759335, 1, 0.3607843, 0, 1,
-1.581179, -0.737958, -3.625032, 1, 0.3647059, 0, 1,
-1.576413, 0.04785952, -1.337051, 1, 0.372549, 0, 1,
-1.576011, -0.554058, -1.127347, 1, 0.3764706, 0, 1,
-1.552063, 0.6162032, 1.606649, 1, 0.3843137, 0, 1,
-1.551655, 1.410387, -1.664732, 1, 0.3882353, 0, 1,
-1.545907, -0.01117404, -1.569284, 1, 0.3960784, 0, 1,
-1.533862, 1.836176, -0.5518385, 1, 0.4039216, 0, 1,
-1.531962, 1.961188, 0.152802, 1, 0.4078431, 0, 1,
-1.525396, -1.16927, -2.762357, 1, 0.4156863, 0, 1,
-1.510867, -1.545983, -1.358251, 1, 0.4196078, 0, 1,
-1.498151, 0.6349193, -1.342355, 1, 0.427451, 0, 1,
-1.481509, 0.9737307, -0.8878846, 1, 0.4313726, 0, 1,
-1.466797, -0.8265737, -1.099483, 1, 0.4392157, 0, 1,
-1.466786, -0.241338, -1.876331, 1, 0.4431373, 0, 1,
-1.454108, 1.237585, -1.115393, 1, 0.4509804, 0, 1,
-1.450391, 1.692228, 2.181445, 1, 0.454902, 0, 1,
-1.448192, 0.4423637, -1.195433, 1, 0.4627451, 0, 1,
-1.446709, -1.676006, -2.707947, 1, 0.4666667, 0, 1,
-1.445581, -0.8793088, -1.818074, 1, 0.4745098, 0, 1,
-1.444866, -2.259259, -0.1943167, 1, 0.4784314, 0, 1,
-1.440764, 0.3282682, -0.7909737, 1, 0.4862745, 0, 1,
-1.440529, 1.446693, -1.491581, 1, 0.4901961, 0, 1,
-1.42708, -0.01550557, -1.39233, 1, 0.4980392, 0, 1,
-1.409834, 0.9125358, -1.326494, 1, 0.5058824, 0, 1,
-1.391908, -0.1915143, -2.076607, 1, 0.509804, 0, 1,
-1.390603, 0.605263, -1.621204, 1, 0.5176471, 0, 1,
-1.390145, -0.2706947, -2.19527, 1, 0.5215687, 0, 1,
-1.389117, 0.07792896, -1.944207, 1, 0.5294118, 0, 1,
-1.384278, 1.507073, -1.627529, 1, 0.5333334, 0, 1,
-1.375117, 0.4876456, -1.953645, 1, 0.5411765, 0, 1,
-1.368113, -0.6820232, -2.518417, 1, 0.5450981, 0, 1,
-1.364449, -0.4294435, -3.554261, 1, 0.5529412, 0, 1,
-1.359364, 0.0007973566, -0.1822842, 1, 0.5568628, 0, 1,
-1.35786, 0.4991392, -0.3487962, 1, 0.5647059, 0, 1,
-1.343588, 0.5649678, -1.514255, 1, 0.5686275, 0, 1,
-1.342225, -0.4958012, -3.142377, 1, 0.5764706, 0, 1,
-1.337367, -0.8045938, -1.180104, 1, 0.5803922, 0, 1,
-1.330238, 0.656049, -2.798426, 1, 0.5882353, 0, 1,
-1.319166, -2.339334, -1.330505, 1, 0.5921569, 0, 1,
-1.31553, 1.37001, -1.414796, 1, 0.6, 0, 1,
-1.300743, 1.272598, -0.1921577, 1, 0.6078432, 0, 1,
-1.298872, 1.236398, -2.406084, 1, 0.6117647, 0, 1,
-1.291845, -2.006763, -3.947309, 1, 0.6196079, 0, 1,
-1.286367, -1.183332, -2.576403, 1, 0.6235294, 0, 1,
-1.281866, 0.874025, -0.622385, 1, 0.6313726, 0, 1,
-1.278627, -1.186839, -3.294846, 1, 0.6352941, 0, 1,
-1.27841, -0.4536093, -2.621292, 1, 0.6431373, 0, 1,
-1.272676, 0.05553749, -2.621494, 1, 0.6470588, 0, 1,
-1.272395, -0.9959018, -2.934617, 1, 0.654902, 0, 1,
-1.271244, -1.598092, -1.903698, 1, 0.6588235, 0, 1,
-1.270069, -0.6096139, -1.369228, 1, 0.6666667, 0, 1,
-1.263866, -0.5020873, -1.310601, 1, 0.6705883, 0, 1,
-1.25981, -0.4311374, -2.534174, 1, 0.6784314, 0, 1,
-1.259756, -1.0194, -2.982344, 1, 0.682353, 0, 1,
-1.258481, -0.1117306, -4.250934, 1, 0.6901961, 0, 1,
-1.253254, 0.9773303, -0.7549125, 1, 0.6941177, 0, 1,
-1.251376, 0.4922267, 0.2417369, 1, 0.7019608, 0, 1,
-1.250877, -0.05847611, -1.610356, 1, 0.7098039, 0, 1,
-1.24879, 1.573201, -1.159962, 1, 0.7137255, 0, 1,
-1.233916, -0.4225443, -1.434297, 1, 0.7215686, 0, 1,
-1.228555, 1.013272, -1.743276, 1, 0.7254902, 0, 1,
-1.227152, 0.08277897, -2.103136, 1, 0.7333333, 0, 1,
-1.225456, 0.7959313, -0.08678021, 1, 0.7372549, 0, 1,
-1.219372, 0.8858008, -0.9826605, 1, 0.7450981, 0, 1,
-1.209866, -0.08997046, -3.958462, 1, 0.7490196, 0, 1,
-1.20893, 0.5375852, 0.765645, 1, 0.7568628, 0, 1,
-1.203241, 2.294321, -1.95237, 1, 0.7607843, 0, 1,
-1.191083, 1.299485, 0.9670624, 1, 0.7686275, 0, 1,
-1.189056, 0.5141604, -2.900059, 1, 0.772549, 0, 1,
-1.187757, 0.7960438, -0.5516546, 1, 0.7803922, 0, 1,
-1.179414, 0.09191544, -1.14781, 1, 0.7843137, 0, 1,
-1.167786, -2.246585, -3.045096, 1, 0.7921569, 0, 1,
-1.165394, 0.08931264, -0.2953338, 1, 0.7960784, 0, 1,
-1.163915, 2.19113, -1.490275, 1, 0.8039216, 0, 1,
-1.159078, -2.302155, -2.325874, 1, 0.8117647, 0, 1,
-1.143781, 0.733326, 0.02972382, 1, 0.8156863, 0, 1,
-1.141768, -0.5405012, -2.904604, 1, 0.8235294, 0, 1,
-1.138665, 0.3589449, -0.520968, 1, 0.827451, 0, 1,
-1.132431, 0.5226952, -0.7077004, 1, 0.8352941, 0, 1,
-1.129566, -0.06973621, -3.192187, 1, 0.8392157, 0, 1,
-1.121942, 0.6947666, -0.8624513, 1, 0.8470588, 0, 1,
-1.111269, 0.1883714, -1.8923, 1, 0.8509804, 0, 1,
-1.111147, -0.02519481, -1.387725, 1, 0.8588235, 0, 1,
-1.10613, 0.4533552, -1.265331, 1, 0.8627451, 0, 1,
-1.106066, -1.27976, -2.686264, 1, 0.8705882, 0, 1,
-1.097455, 0.7825885, -0.4733049, 1, 0.8745098, 0, 1,
-1.089553, -0.3976077, -2.939456, 1, 0.8823529, 0, 1,
-1.073249, -0.92499, -2.455117, 1, 0.8862745, 0, 1,
-1.065639, 1.022641, 1.952074, 1, 0.8941177, 0, 1,
-1.061608, 0.07790326, -2.027274, 1, 0.8980392, 0, 1,
-1.054061, 1.011851, 0.05151154, 1, 0.9058824, 0, 1,
-1.049896, -0.8762374, -1.428134, 1, 0.9137255, 0, 1,
-1.049879, -2.120473, -2.035853, 1, 0.9176471, 0, 1,
-1.042606, 0.2242149, -0.75395, 1, 0.9254902, 0, 1,
-1.037876, 0.4581051, -1.199051, 1, 0.9294118, 0, 1,
-1.033028, -0.7228965, -2.081431, 1, 0.9372549, 0, 1,
-1.032065, 0.7597122, -1.225553, 1, 0.9411765, 0, 1,
-1.030428, -0.3381903, -0.871639, 1, 0.9490196, 0, 1,
-1.029774, 0.3719307, 0.06877223, 1, 0.9529412, 0, 1,
-1.022943, -1.254781, -1.978914, 1, 0.9607843, 0, 1,
-1.018761, -0.2403432, -2.253282, 1, 0.9647059, 0, 1,
-1.017202, 1.075758, -1.076505, 1, 0.972549, 0, 1,
-1.016931, -0.5164302, -2.459919, 1, 0.9764706, 0, 1,
-1.005394, 1.739536, -0.457185, 1, 0.9843137, 0, 1,
-1.004939, -0.8706117, -3.140133, 1, 0.9882353, 0, 1,
-1.001596, -1.698823, -3.02011, 1, 0.9960784, 0, 1,
-0.9921851, 0.7750539, -1.370555, 0.9960784, 1, 0, 1,
-0.9880599, -0.1297431, -2.384874, 0.9921569, 1, 0, 1,
-0.9818094, 0.3504829, 0.08258203, 0.9843137, 1, 0, 1,
-0.9815115, -0.5076836, -2.665919, 0.9803922, 1, 0, 1,
-0.9787275, -0.03657552, -2.673964, 0.972549, 1, 0, 1,
-0.9787191, 1.514972, -0.01673461, 0.9686275, 1, 0, 1,
-0.977555, -0.4201876, -0.6921306, 0.9607843, 1, 0, 1,
-0.9772497, 2.176429, -2.607342, 0.9568627, 1, 0, 1,
-0.9760605, -0.06707144, -1.514423, 0.9490196, 1, 0, 1,
-0.9754204, -0.3309964, -1.608052, 0.945098, 1, 0, 1,
-0.9692271, 0.3688087, -1.502326, 0.9372549, 1, 0, 1,
-0.9673967, 1.019941, -1.317652, 0.9333333, 1, 0, 1,
-0.956129, -0.8426337, -2.398855, 0.9254902, 1, 0, 1,
-0.9349523, 0.5209463, -2.466871, 0.9215686, 1, 0, 1,
-0.9146404, -1.825205, -4.376112, 0.9137255, 1, 0, 1,
-0.9080576, 0.3549172, -1.653774, 0.9098039, 1, 0, 1,
-0.9076488, 0.6893477, -0.7991264, 0.9019608, 1, 0, 1,
-0.9076329, -0.7798876, -2.195971, 0.8941177, 1, 0, 1,
-0.9074876, 3.007728, -0.1720206, 0.8901961, 1, 0, 1,
-0.8949927, 0.8221524, -0.9929603, 0.8823529, 1, 0, 1,
-0.8941633, -0.3930803, -2.435369, 0.8784314, 1, 0, 1,
-0.8928485, -0.6009869, -1.669958, 0.8705882, 1, 0, 1,
-0.8859433, -0.7869946, -4.200846, 0.8666667, 1, 0, 1,
-0.8806677, 0.8429088, -1.347207, 0.8588235, 1, 0, 1,
-0.8765326, -0.07460478, -0.3999802, 0.854902, 1, 0, 1,
-0.8746492, -0.8672741, -1.527634, 0.8470588, 1, 0, 1,
-0.8687104, 0.7525612, -0.7018046, 0.8431373, 1, 0, 1,
-0.8650402, -0.4155223, -2.836826, 0.8352941, 1, 0, 1,
-0.8633624, 1.458327, -0.7136135, 0.8313726, 1, 0, 1,
-0.8589122, -1.317683, -2.93964, 0.8235294, 1, 0, 1,
-0.8560073, -0.7308482, -0.1428107, 0.8196079, 1, 0, 1,
-0.8553768, -0.2075329, -1.694869, 0.8117647, 1, 0, 1,
-0.8549635, -1.014425, -2.347834, 0.8078431, 1, 0, 1,
-0.8472787, -0.4173155, -0.2814208, 0.8, 1, 0, 1,
-0.8447959, 0.6111609, -2.668096, 0.7921569, 1, 0, 1,
-0.8404299, 1.364589, -1.335214, 0.7882353, 1, 0, 1,
-0.840416, -0.2920118, -1.817187, 0.7803922, 1, 0, 1,
-0.8337774, 0.9327363, -1.306732, 0.7764706, 1, 0, 1,
-0.8332571, 0.4072022, -1.804031, 0.7686275, 1, 0, 1,
-0.8290897, -0.280108, -0.943308, 0.7647059, 1, 0, 1,
-0.8265387, 0.952888, 0.620344, 0.7568628, 1, 0, 1,
-0.8237791, -0.04522408, -2.463529, 0.7529412, 1, 0, 1,
-0.8208544, 0.919008, -0.2055174, 0.7450981, 1, 0, 1,
-0.8186367, 1.180426, 0.05017028, 0.7411765, 1, 0, 1,
-0.814749, 0.3348711, -1.099178, 0.7333333, 1, 0, 1,
-0.8090016, 2.010794, -0.8692248, 0.7294118, 1, 0, 1,
-0.8056617, -1.061998, -1.882951, 0.7215686, 1, 0, 1,
-0.8047405, -0.5971439, -2.989189, 0.7176471, 1, 0, 1,
-0.7988122, -1.541069, -2.112679, 0.7098039, 1, 0, 1,
-0.796811, -0.7888966, -3.301448, 0.7058824, 1, 0, 1,
-0.7966791, -0.3744855, -2.501414, 0.6980392, 1, 0, 1,
-0.784305, 0.4468721, -1.51901, 0.6901961, 1, 0, 1,
-0.7784116, 1.010471, -0.3625282, 0.6862745, 1, 0, 1,
-0.7743689, 0.3160575, 1.030996, 0.6784314, 1, 0, 1,
-0.7689989, 1.13271, -1.920484, 0.6745098, 1, 0, 1,
-0.767951, -1.394079, -1.612885, 0.6666667, 1, 0, 1,
-0.7661408, 0.07202759, -0.933823, 0.6627451, 1, 0, 1,
-0.7640033, -0.7203633, -3.267979, 0.654902, 1, 0, 1,
-0.7623515, 0.4440889, -0.7568703, 0.6509804, 1, 0, 1,
-0.76139, -0.01399069, -1.997178, 0.6431373, 1, 0, 1,
-0.7516013, 0.5059527, 0.2381579, 0.6392157, 1, 0, 1,
-0.7466457, -0.1240302, -2.611039, 0.6313726, 1, 0, 1,
-0.7374927, 1.089319, -1.27477, 0.627451, 1, 0, 1,
-0.7362472, -0.4359303, -2.612229, 0.6196079, 1, 0, 1,
-0.7278798, 1.198618, 0.4207085, 0.6156863, 1, 0, 1,
-0.7263718, 0.9679832, -1.099624, 0.6078432, 1, 0, 1,
-0.7250509, 0.4257407, -0.6372339, 0.6039216, 1, 0, 1,
-0.7185714, -0.4981448, -3.689896, 0.5960785, 1, 0, 1,
-0.7146401, 2.252973, -1.07998, 0.5882353, 1, 0, 1,
-0.710566, -0.001339626, -1.347333, 0.5843138, 1, 0, 1,
-0.7052379, 0.5491648, 0.4900764, 0.5764706, 1, 0, 1,
-0.7035565, -0.4219896, -2.611737, 0.572549, 1, 0, 1,
-0.7000475, 1.205582, 0.353093, 0.5647059, 1, 0, 1,
-0.6988971, -1.223256, -3.555777, 0.5607843, 1, 0, 1,
-0.6974475, 0.1053601, -1.274266, 0.5529412, 1, 0, 1,
-0.6967371, -1.519112, -2.347199, 0.5490196, 1, 0, 1,
-0.6966823, 1.033719, 0.51794, 0.5411765, 1, 0, 1,
-0.6927633, 1.364552, 0.4882721, 0.5372549, 1, 0, 1,
-0.6926827, 1.854222, -0.7117759, 0.5294118, 1, 0, 1,
-0.6894088, 0.7489806, -0.6909864, 0.5254902, 1, 0, 1,
-0.6866798, 1.405227, -0.4818817, 0.5176471, 1, 0, 1,
-0.6834429, -0.4921475, -3.017385, 0.5137255, 1, 0, 1,
-0.6810853, 0.5988125, -0.7068008, 0.5058824, 1, 0, 1,
-0.6775132, -0.2888521, -1.204754, 0.5019608, 1, 0, 1,
-0.6770854, -0.6030178, -3.076454, 0.4941176, 1, 0, 1,
-0.676056, -0.2025837, -1.921971, 0.4862745, 1, 0, 1,
-0.6759189, -1.168678, -3.144773, 0.4823529, 1, 0, 1,
-0.67383, -0.3852702, -2.373602, 0.4745098, 1, 0, 1,
-0.6733274, -0.6719085, -3.52607, 0.4705882, 1, 0, 1,
-0.6654509, 0.1089818, -0.9014698, 0.4627451, 1, 0, 1,
-0.6632347, -1.015873, -2.20507, 0.4588235, 1, 0, 1,
-0.6569389, -0.620943, -4.72065, 0.4509804, 1, 0, 1,
-0.6504098, 0.918232, -1.686846, 0.4470588, 1, 0, 1,
-0.6434871, -0.6171996, -3.494586, 0.4392157, 1, 0, 1,
-0.6428618, 0.03938352, -2.414207, 0.4352941, 1, 0, 1,
-0.6420455, 0.527267, -0.6370397, 0.427451, 1, 0, 1,
-0.6385937, -0.4288498, -1.987401, 0.4235294, 1, 0, 1,
-0.6384404, -0.5141288, -0.4652369, 0.4156863, 1, 0, 1,
-0.6369085, 0.4417512, -1.700754, 0.4117647, 1, 0, 1,
-0.6326352, 0.2552587, -2.149587, 0.4039216, 1, 0, 1,
-0.6266644, -0.2113567, -3.356998, 0.3960784, 1, 0, 1,
-0.6245332, -0.2931224, -1.532257, 0.3921569, 1, 0, 1,
-0.6230561, -0.3934723, -2.673582, 0.3843137, 1, 0, 1,
-0.616198, -0.1881149, -0.4262568, 0.3803922, 1, 0, 1,
-0.6139506, 0.6093876, -1.351046, 0.372549, 1, 0, 1,
-0.6076906, 2.776119, 0.5171589, 0.3686275, 1, 0, 1,
-0.6067106, -0.5002056, -2.536806, 0.3607843, 1, 0, 1,
-0.6065235, 0.678081, -0.6858168, 0.3568628, 1, 0, 1,
-0.6023887, 1.084198, -0.8497732, 0.3490196, 1, 0, 1,
-0.5988323, -0.6576586, -1.601668, 0.345098, 1, 0, 1,
-0.5949622, 0.4192863, -1.99591, 0.3372549, 1, 0, 1,
-0.590404, 0.7109334, -1.430894, 0.3333333, 1, 0, 1,
-0.5826491, 1.564406, -1.069102, 0.3254902, 1, 0, 1,
-0.580868, -0.4746438, -0.8379909, 0.3215686, 1, 0, 1,
-0.5803446, -0.6898118, -2.650336, 0.3137255, 1, 0, 1,
-0.5802462, -0.8875474, -1.383134, 0.3098039, 1, 0, 1,
-0.5791684, 1.044808, 0.8184178, 0.3019608, 1, 0, 1,
-0.5717887, -0.1084098, -1.956268, 0.2941177, 1, 0, 1,
-0.5698938, 0.7085935, -1.465223, 0.2901961, 1, 0, 1,
-0.5692067, 0.6649063, 0.3468075, 0.282353, 1, 0, 1,
-0.5651956, -0.1914449, -2.001111, 0.2784314, 1, 0, 1,
-0.5600181, 0.9317036, -0.4696249, 0.2705882, 1, 0, 1,
-0.5579234, -0.6093743, -1.731876, 0.2666667, 1, 0, 1,
-0.5576146, 1.803796, -0.4007175, 0.2588235, 1, 0, 1,
-0.5557088, 0.1817199, -2.636819, 0.254902, 1, 0, 1,
-0.5547689, 0.4587109, -1.148826, 0.2470588, 1, 0, 1,
-0.5486827, 1.569457, -0.4449614, 0.2431373, 1, 0, 1,
-0.5473361, 2.248774, -0.07323909, 0.2352941, 1, 0, 1,
-0.5461337, -0.8799525, -2.20405, 0.2313726, 1, 0, 1,
-0.5442457, 1.673519, -0.8709989, 0.2235294, 1, 0, 1,
-0.5442128, -1.235914, -0.7274486, 0.2196078, 1, 0, 1,
-0.5370274, 1.543325, -1.196977, 0.2117647, 1, 0, 1,
-0.5369917, 1.9251, 2.769785, 0.2078431, 1, 0, 1,
-0.5332037, 0.576323, -0.6873741, 0.2, 1, 0, 1,
-0.5310329, -0.09633826, -1.496036, 0.1921569, 1, 0, 1,
-0.5290713, -0.404265, -0.9545017, 0.1882353, 1, 0, 1,
-0.5237554, -0.3299707, -1.909562, 0.1803922, 1, 0, 1,
-0.5218869, 1.531873, -0.8290952, 0.1764706, 1, 0, 1,
-0.5210431, 1.222335, -0.3323053, 0.1686275, 1, 0, 1,
-0.5179507, 0.428417, -0.7639525, 0.1647059, 1, 0, 1,
-0.5165649, 1.425706, 0.8835239, 0.1568628, 1, 0, 1,
-0.5153978, 0.05111125, -0.5514588, 0.1529412, 1, 0, 1,
-0.514174, -1.148432, -4.44794, 0.145098, 1, 0, 1,
-0.5113378, 1.097516, -0.5071614, 0.1411765, 1, 0, 1,
-0.4917777, -0.3101887, -1.703752, 0.1333333, 1, 0, 1,
-0.4901599, -1.034335, -2.755618, 0.1294118, 1, 0, 1,
-0.4894421, -1.311363, -1.848472, 0.1215686, 1, 0, 1,
-0.4889425, 1.08985, -1.526163, 0.1176471, 1, 0, 1,
-0.4858901, -1.171631, -1.393232, 0.1098039, 1, 0, 1,
-0.468211, 0.08306959, 0.2054329, 0.1058824, 1, 0, 1,
-0.4667832, 0.7149803, 0.1141824, 0.09803922, 1, 0, 1,
-0.4665022, -0.5751393, -2.057895, 0.09019608, 1, 0, 1,
-0.4651813, -1.980935, -3.010201, 0.08627451, 1, 0, 1,
-0.4594836, 0.6792938, -0.6849247, 0.07843138, 1, 0, 1,
-0.4563797, 0.6009804, -2.05003, 0.07450981, 1, 0, 1,
-0.4517886, 0.6701491, -0.7920477, 0.06666667, 1, 0, 1,
-0.4497692, 0.470293, 0.7859643, 0.0627451, 1, 0, 1,
-0.4452271, 0.5302356, -1.550315, 0.05490196, 1, 0, 1,
-0.4448411, -0.7395704, 0.131019, 0.05098039, 1, 0, 1,
-0.4420004, 0.1809476, -1.560332, 0.04313726, 1, 0, 1,
-0.4395158, -1.166157, -1.195881, 0.03921569, 1, 0, 1,
-0.4369887, -0.2552311, -2.480814, 0.03137255, 1, 0, 1,
-0.4327002, -0.6527841, -2.784912, 0.02745098, 1, 0, 1,
-0.4285392, 0.8031191, 1.034913, 0.01960784, 1, 0, 1,
-0.4279163, -0.1358803, -1.373058, 0.01568628, 1, 0, 1,
-0.4231744, -0.2739767, -2.985486, 0.007843138, 1, 0, 1,
-0.4230719, 0.1391147, -1.434076, 0.003921569, 1, 0, 1,
-0.4151799, 0.3858238, -0.7317522, 0, 1, 0.003921569, 1,
-0.4124559, -0.8329715, -1.92036, 0, 1, 0.01176471, 1,
-0.4124157, -0.1962858, -2.208822, 0, 1, 0.01568628, 1,
-0.4122794, 0.4582935, -1.678193, 0, 1, 0.02352941, 1,
-0.4103374, -1.033769, -3.730285, 0, 1, 0.02745098, 1,
-0.4045414, -0.8354895, -1.661474, 0, 1, 0.03529412, 1,
-0.4043547, -0.5541947, -3.091594, 0, 1, 0.03921569, 1,
-0.4028758, -0.8314157, -3.862437, 0, 1, 0.04705882, 1,
-0.4005901, 1.459628, -1.610171, 0, 1, 0.05098039, 1,
-0.3992777, -0.2304111, -2.628213, 0, 1, 0.05882353, 1,
-0.3992164, -1.456433, -3.936769, 0, 1, 0.0627451, 1,
-0.398297, -0.4782658, -3.700172, 0, 1, 0.07058824, 1,
-0.3934522, 0.03688675, -1.857288, 0, 1, 0.07450981, 1,
-0.3905311, 0.5352875, -0.2086691, 0, 1, 0.08235294, 1,
-0.3885879, 0.873894, 0.3108319, 0, 1, 0.08627451, 1,
-0.3843625, 0.7893635, -1.201088, 0, 1, 0.09411765, 1,
-0.3830653, 0.598079, -0.9212601, 0, 1, 0.1019608, 1,
-0.3827985, -0.008358323, -1.606758, 0, 1, 0.1058824, 1,
-0.3794667, 0.07891039, -0.2612476, 0, 1, 0.1137255, 1,
-0.3742587, 1.172667, 1.735464, 0, 1, 0.1176471, 1,
-0.3661935, -1.114065, -3.665965, 0, 1, 0.1254902, 1,
-0.3644634, -1.151804, -3.429897, 0, 1, 0.1294118, 1,
-0.359702, 1.165681, -0.7646405, 0, 1, 0.1372549, 1,
-0.3589486, 0.06281097, -2.776958, 0, 1, 0.1411765, 1,
-0.3587781, -0.1740824, -3.393749, 0, 1, 0.1490196, 1,
-0.357356, 0.00685339, -0.4637368, 0, 1, 0.1529412, 1,
-0.3565864, -1.118065, -3.642455, 0, 1, 0.1607843, 1,
-0.3542313, 0.1402298, -0.2986292, 0, 1, 0.1647059, 1,
-0.3531749, 0.5370028, -0.7746447, 0, 1, 0.172549, 1,
-0.351946, -1.762154, -2.557386, 0, 1, 0.1764706, 1,
-0.3496208, 0.3366092, -0.6328273, 0, 1, 0.1843137, 1,
-0.3491595, -2.765146, -3.069628, 0, 1, 0.1882353, 1,
-0.3458812, -1.41679, -3.335169, 0, 1, 0.1960784, 1,
-0.3401096, 0.265879, -1.221681, 0, 1, 0.2039216, 1,
-0.3363515, -0.4066976, 0.8746516, 0, 1, 0.2078431, 1,
-0.332926, 2.110117, 0.4487559, 0, 1, 0.2156863, 1,
-0.3313996, -1.278904, -2.892832, 0, 1, 0.2196078, 1,
-0.3216416, -0.01793602, -2.136904, 0, 1, 0.227451, 1,
-0.3211701, 1.820871, -0.185882, 0, 1, 0.2313726, 1,
-0.320921, 0.418889, -0.8839136, 0, 1, 0.2392157, 1,
-0.3169037, 0.5054737, -1.293798, 0, 1, 0.2431373, 1,
-0.3152525, -0.3524655, -2.649276, 0, 1, 0.2509804, 1,
-0.310483, 0.6760889, 0.6550465, 0, 1, 0.254902, 1,
-0.3071756, -0.4532105, -1.055619, 0, 1, 0.2627451, 1,
-0.3018375, -1.580598, -2.957856, 0, 1, 0.2666667, 1,
-0.2957783, 0.6794959, -1.073198, 0, 1, 0.2745098, 1,
-0.292899, -0.286446, -1.779724, 0, 1, 0.2784314, 1,
-0.2880471, 1.167611, 1.163877, 0, 1, 0.2862745, 1,
-0.2859409, -0.4000002, -3.585056, 0, 1, 0.2901961, 1,
-0.2849904, -0.1545926, -2.920478, 0, 1, 0.2980392, 1,
-0.2839088, 1.337914, 0.5431153, 0, 1, 0.3058824, 1,
-0.2828887, 1.330366, -0.8333872, 0, 1, 0.3098039, 1,
-0.2813046, 0.3649151, 1.585221, 0, 1, 0.3176471, 1,
-0.2796286, 1.1905, 0.1015492, 0, 1, 0.3215686, 1,
-0.2762575, -0.935774, -3.712252, 0, 1, 0.3294118, 1,
-0.2737513, 0.6924291, -0.3027557, 0, 1, 0.3333333, 1,
-0.2712386, -2.840963, -2.869994, 0, 1, 0.3411765, 1,
-0.2686905, 0.7244848, -1.28168, 0, 1, 0.345098, 1,
-0.2670535, -0.412354, -3.349167, 0, 1, 0.3529412, 1,
-0.2625619, -1.747976, -3.887706, 0, 1, 0.3568628, 1,
-0.2544659, -0.3653926, -3.068729, 0, 1, 0.3647059, 1,
-0.253813, -0.02760893, -1.534575, 0, 1, 0.3686275, 1,
-0.2501378, -0.7307267, -2.831083, 0, 1, 0.3764706, 1,
-0.2490184, 1.30557, -0.4342021, 0, 1, 0.3803922, 1,
-0.2465545, -0.1114901, -1.805298, 0, 1, 0.3882353, 1,
-0.2397755, 1.07792, -1.69568, 0, 1, 0.3921569, 1,
-0.2383139, 2.088839, 0.6823049, 0, 1, 0.4, 1,
-0.2329839, 0.2832375, 0.168191, 0, 1, 0.4078431, 1,
-0.2324312, -0.8554726, -2.626088, 0, 1, 0.4117647, 1,
-0.2302452, 1.513635, 0.7679594, 0, 1, 0.4196078, 1,
-0.2267406, 0.8933545, -0.5672304, 0, 1, 0.4235294, 1,
-0.224431, 0.1147979, -1.483347, 0, 1, 0.4313726, 1,
-0.2238469, -1.086017, -2.944437, 0, 1, 0.4352941, 1,
-0.2215173, -0.3598798, -1.517504, 0, 1, 0.4431373, 1,
-0.2176357, 1.20724, 0.7250481, 0, 1, 0.4470588, 1,
-0.2101512, 2.063235, -0.09230012, 0, 1, 0.454902, 1,
-0.2091574, 0.5584164, -2.020241, 0, 1, 0.4588235, 1,
-0.2083726, -0.4291463, -2.808984, 0, 1, 0.4666667, 1,
-0.2063232, 0.6502132, 0.286393, 0, 1, 0.4705882, 1,
-0.2024578, 0.04374959, 1.476482, 0, 1, 0.4784314, 1,
-0.1970364, 0.6880192, -0.04906563, 0, 1, 0.4823529, 1,
-0.1949757, 0.5823388, -2.448133, 0, 1, 0.4901961, 1,
-0.1928349, -0.9863141, -2.447959, 0, 1, 0.4941176, 1,
-0.1925286, 0.2114267, 0.3146278, 0, 1, 0.5019608, 1,
-0.191967, -1.291553, -2.982786, 0, 1, 0.509804, 1,
-0.1868446, -0.136193, -0.6653641, 0, 1, 0.5137255, 1,
-0.1848456, -0.01993832, -1.503656, 0, 1, 0.5215687, 1,
-0.1820035, 0.1547032, -0.589056, 0, 1, 0.5254902, 1,
-0.1815385, -0.2867792, -4.4182, 0, 1, 0.5333334, 1,
-0.1800234, -0.4856998, -2.697703, 0, 1, 0.5372549, 1,
-0.1778962, -1.654492, -1.835949, 0, 1, 0.5450981, 1,
-0.1752994, 2.646358, 0.3560709, 0, 1, 0.5490196, 1,
-0.1751641, 1.63175, -0.6856394, 0, 1, 0.5568628, 1,
-0.1704861, 1.505411, 1.549015, 0, 1, 0.5607843, 1,
-0.162229, 0.6252324, -1.036161, 0, 1, 0.5686275, 1,
-0.1615119, 0.1547892, -1.281769, 0, 1, 0.572549, 1,
-0.1606143, -0.2330687, -2.350106, 0, 1, 0.5803922, 1,
-0.1591218, 0.09734127, -1.921239, 0, 1, 0.5843138, 1,
-0.1578643, -0.19666, -3.421834, 0, 1, 0.5921569, 1,
-0.1576742, -1.110251, -3.224829, 0, 1, 0.5960785, 1,
-0.1564736, 0.9067009, -0.6190136, 0, 1, 0.6039216, 1,
-0.1559833, 1.159814, -0.1625049, 0, 1, 0.6117647, 1,
-0.148695, 0.06612793, -0.3357322, 0, 1, 0.6156863, 1,
-0.1478494, 0.6046743, 0.3449094, 0, 1, 0.6235294, 1,
-0.1460078, -0.3972246, -3.477768, 0, 1, 0.627451, 1,
-0.1417303, -0.2700386, -2.500294, 0, 1, 0.6352941, 1,
-0.1397682, 0.6833373, -0.6243611, 0, 1, 0.6392157, 1,
-0.1381669, -0.008004556, -2.778026, 0, 1, 0.6470588, 1,
-0.1372502, -1.228673, -3.947217, 0, 1, 0.6509804, 1,
-0.1365094, -1.358158, -2.63521, 0, 1, 0.6588235, 1,
-0.129068, 0.7162241, 0.05519844, 0, 1, 0.6627451, 1,
-0.1256795, 0.1860087, 1.213433, 0, 1, 0.6705883, 1,
-0.1236784, -0.3017174, -1.711924, 0, 1, 0.6745098, 1,
-0.1234299, 1.662589, 0.01953262, 0, 1, 0.682353, 1,
-0.1228309, 0.2792069, -1.144524, 0, 1, 0.6862745, 1,
-0.1224959, 0.02123194, -2.4088, 0, 1, 0.6941177, 1,
-0.1224511, 1.836871, 0.2942646, 0, 1, 0.7019608, 1,
-0.121662, -1.072869, -2.549199, 0, 1, 0.7058824, 1,
-0.1207729, 0.4924493, -0.05047831, 0, 1, 0.7137255, 1,
-0.1102594, -0.6780793, -3.148705, 0, 1, 0.7176471, 1,
-0.1079647, -0.8527269, -2.190624, 0, 1, 0.7254902, 1,
-0.1058445, 0.2151164, 1.429923, 0, 1, 0.7294118, 1,
-0.1019574, -0.5758094, -3.567082, 0, 1, 0.7372549, 1,
-0.09526646, 0.5894301, 0.9532817, 0, 1, 0.7411765, 1,
-0.09203656, -0.07174628, -2.490108, 0, 1, 0.7490196, 1,
-0.08954437, -0.1139556, -2.594485, 0, 1, 0.7529412, 1,
-0.08930546, -0.4135632, -3.369252, 0, 1, 0.7607843, 1,
-0.08817993, 0.38078, -0.04141478, 0, 1, 0.7647059, 1,
-0.08338896, 0.6310101, 1.73894, 0, 1, 0.772549, 1,
-0.08179153, -1.293327, -2.366246, 0, 1, 0.7764706, 1,
-0.08061399, 0.1853101, -1.099553, 0, 1, 0.7843137, 1,
-0.07861758, 0.7585537, -1.020968, 0, 1, 0.7882353, 1,
-0.0709108, 0.6623425, -0.3544818, 0, 1, 0.7960784, 1,
-0.06612781, -1.045404, -2.408391, 0, 1, 0.8039216, 1,
-0.06578437, -0.03030673, -1.491405, 0, 1, 0.8078431, 1,
-0.06549846, -1.394253, -2.483348, 0, 1, 0.8156863, 1,
-0.06297463, -0.2030316, -5.328898, 0, 1, 0.8196079, 1,
-0.0607546, -1.28199, -2.509514, 0, 1, 0.827451, 1,
-0.05075163, 0.8612408, 0.2188745, 0, 1, 0.8313726, 1,
-0.04952329, 1.931623, 1.866089, 0, 1, 0.8392157, 1,
-0.04780659, 1.363379, 1.936204, 0, 1, 0.8431373, 1,
-0.0459393, -1.795029, -2.061381, 0, 1, 0.8509804, 1,
-0.04523479, -1.192527, -2.586401, 0, 1, 0.854902, 1,
-0.04492657, 0.3802934, -0.06424034, 0, 1, 0.8627451, 1,
-0.04285195, -0.2570807, -4.779367, 0, 1, 0.8666667, 1,
-0.04072374, 0.7224906, 0.4427861, 0, 1, 0.8745098, 1,
-0.03384563, -1.677313, -3.774381, 0, 1, 0.8784314, 1,
-0.03358722, -0.2123933, -3.300814, 0, 1, 0.8862745, 1,
-0.03304943, 0.4742541, 0.1739016, 0, 1, 0.8901961, 1,
-0.03208293, -0.7505741, -4.192393, 0, 1, 0.8980392, 1,
-0.03169835, 0.6919082, -0.795464, 0, 1, 0.9058824, 1,
-0.02368972, 0.0976688, 0.4526753, 0, 1, 0.9098039, 1,
-0.0225648, 0.4772717, 0.202548, 0, 1, 0.9176471, 1,
-0.02085726, 1.147851, 0.2701228, 0, 1, 0.9215686, 1,
-0.01468259, -0.4583513, -2.234106, 0, 1, 0.9294118, 1,
-0.006903903, 0.2957455, -0.9600283, 0, 1, 0.9333333, 1,
-0.006749488, 1.225407, 2.132329, 0, 1, 0.9411765, 1,
-0.005005841, 0.2377355, 1.017364, 0, 1, 0.945098, 1,
-0.00404531, 0.2238526, 1.656553, 0, 1, 0.9529412, 1,
-0.003967744, -0.7379309, -2.982827, 0, 1, 0.9568627, 1,
-0.003307228, 0.6607096, -0.9991278, 0, 1, 0.9647059, 1,
-0.002025391, 0.1153441, -1.643867, 0, 1, 0.9686275, 1,
0.001060389, 1.820001, -1.386441, 0, 1, 0.9764706, 1,
0.001400918, -1.357765, 2.730875, 0, 1, 0.9803922, 1,
0.002028277, 1.629665, -0.7610096, 0, 1, 0.9882353, 1,
0.005901375, -2.039232, 3.391267, 0, 1, 0.9921569, 1,
0.007229431, -1.665362, 4.43748, 0, 1, 1, 1,
0.007769041, -0.5731946, 4.149353, 0, 0.9921569, 1, 1,
0.01198788, -0.3226429, 3.208467, 0, 0.9882353, 1, 1,
0.01655087, -0.541979, 3.762986, 0, 0.9803922, 1, 1,
0.01987468, -0.869956, 0.5920366, 0, 0.9764706, 1, 1,
0.02285461, -0.8553262, 3.37943, 0, 0.9686275, 1, 1,
0.02830006, -1.074261, 2.842355, 0, 0.9647059, 1, 1,
0.03065278, -0.1886912, 2.666623, 0, 0.9568627, 1, 1,
0.03719339, -0.684913, 2.281562, 0, 0.9529412, 1, 1,
0.03806906, -1.000831, 4.850041, 0, 0.945098, 1, 1,
0.03888436, 1.467207, 0.290111, 0, 0.9411765, 1, 1,
0.04383398, 0.8078392, 1.503834, 0, 0.9333333, 1, 1,
0.05079317, -0.5974203, 3.432636, 0, 0.9294118, 1, 1,
0.05251711, -0.7820657, 2.554203, 0, 0.9215686, 1, 1,
0.05471724, -0.3751836, 3.169939, 0, 0.9176471, 1, 1,
0.05679501, 0.2938291, -0.2352112, 0, 0.9098039, 1, 1,
0.06079544, 0.07406548, 0.1174665, 0, 0.9058824, 1, 1,
0.07328213, 0.4426321, -0.009307835, 0, 0.8980392, 1, 1,
0.0748078, -1.671085, 4.014624, 0, 0.8901961, 1, 1,
0.08300602, 1.665133, -0.6948351, 0, 0.8862745, 1, 1,
0.08372347, -0.4911159, 2.510723, 0, 0.8784314, 1, 1,
0.08501414, 0.5850434, 0.7660151, 0, 0.8745098, 1, 1,
0.08543636, -1.492735, 4.560697, 0, 0.8666667, 1, 1,
0.09498104, 0.7386086, 0.9628159, 0, 0.8627451, 1, 1,
0.09618889, 0.3074705, 1.133736, 0, 0.854902, 1, 1,
0.09674545, 0.7832195, 0.6324569, 0, 0.8509804, 1, 1,
0.09886846, -0.2312759, 5.200067, 0, 0.8431373, 1, 1,
0.1010569, 0.7879815, 0.95896, 0, 0.8392157, 1, 1,
0.1014827, -0.5919071, 2.940202, 0, 0.8313726, 1, 1,
0.1028721, 0.1474904, 0.1251578, 0, 0.827451, 1, 1,
0.1072209, 1.121053, 1.194071, 0, 0.8196079, 1, 1,
0.1096195, -0.9222087, 4.114661, 0, 0.8156863, 1, 1,
0.111197, -0.9406338, 3.623221, 0, 0.8078431, 1, 1,
0.1139438, 0.4112552, -0.1458612, 0, 0.8039216, 1, 1,
0.1142229, 0.05606673, 1.017109, 0, 0.7960784, 1, 1,
0.1164503, 0.04882531, 1.085609, 0, 0.7882353, 1, 1,
0.116816, 1.102971, 1.361145, 0, 0.7843137, 1, 1,
0.1181661, -2.182388, 3.882198, 0, 0.7764706, 1, 1,
0.1182262, -1.917022, 3.607816, 0, 0.772549, 1, 1,
0.1205466, -0.3324066, 1.677562, 0, 0.7647059, 1, 1,
0.1265291, -0.3665121, 2.066697, 0, 0.7607843, 1, 1,
0.1267114, -1.979015, 2.601933, 0, 0.7529412, 1, 1,
0.1290736, -0.7799206, 1.877785, 0, 0.7490196, 1, 1,
0.129695, 1.682514, 2.856153, 0, 0.7411765, 1, 1,
0.1315659, -1.677113, 1.785196, 0, 0.7372549, 1, 1,
0.1329586, 0.01239572, 2.378821, 0, 0.7294118, 1, 1,
0.1389007, -0.4885545, 3.54162, 0, 0.7254902, 1, 1,
0.1390561, -0.5017731, 1.854425, 0, 0.7176471, 1, 1,
0.1397834, 0.687098, 0.4749841, 0, 0.7137255, 1, 1,
0.1410403, 0.1564578, 2.008693, 0, 0.7058824, 1, 1,
0.1451232, 0.4182723, 0.4548621, 0, 0.6980392, 1, 1,
0.1455818, -1.042287, 3.073077, 0, 0.6941177, 1, 1,
0.1456306, 0.02755208, 1.395283, 0, 0.6862745, 1, 1,
0.1467412, -0.0119304, 1.57626, 0, 0.682353, 1, 1,
0.1571501, 0.0227072, 0.2673265, 0, 0.6745098, 1, 1,
0.162668, -0.537668, 1.938494, 0, 0.6705883, 1, 1,
0.1632383, 0.150988, 0.5401532, 0, 0.6627451, 1, 1,
0.1659501, -1.584075, 4.117961, 0, 0.6588235, 1, 1,
0.1666988, -0.126147, 2.538924, 0, 0.6509804, 1, 1,
0.1702162, 0.2070152, 0.1483999, 0, 0.6470588, 1, 1,
0.1743911, 0.04196262, 0.2599707, 0, 0.6392157, 1, 1,
0.1767395, -0.5006489, 2.222229, 0, 0.6352941, 1, 1,
0.1796333, 0.8065602, -1.232162, 0, 0.627451, 1, 1,
0.1842211, -0.3129563, 3.641646, 0, 0.6235294, 1, 1,
0.184707, 1.430827, 1.165293, 0, 0.6156863, 1, 1,
0.1847471, 0.3935401, 0.2990594, 0, 0.6117647, 1, 1,
0.1869038, 0.1401984, 0.95131, 0, 0.6039216, 1, 1,
0.1895174, -1.10699, 2.179495, 0, 0.5960785, 1, 1,
0.190784, -0.4935858, 0.9313349, 0, 0.5921569, 1, 1,
0.1919121, -0.2869188, 3.038243, 0, 0.5843138, 1, 1,
0.197494, 0.1987877, 1.463063, 0, 0.5803922, 1, 1,
0.1982483, -1.190705, 1.313525, 0, 0.572549, 1, 1,
0.2085089, -0.3658629, 1.953416, 0, 0.5686275, 1, 1,
0.2092742, -0.5464569, 4.563436, 0, 0.5607843, 1, 1,
0.2104619, 0.1773128, 1.547489, 0, 0.5568628, 1, 1,
0.2120847, -1.033861, 1.385946, 0, 0.5490196, 1, 1,
0.2134944, 1.439338, 0.6487989, 0, 0.5450981, 1, 1,
0.2188334, -0.5143434, 1.495178, 0, 0.5372549, 1, 1,
0.2191812, -2.09754, 1.823543, 0, 0.5333334, 1, 1,
0.2200994, -0.1832665, 1.691062, 0, 0.5254902, 1, 1,
0.2211471, -0.25553, 2.377907, 0, 0.5215687, 1, 1,
0.2233644, 1.006302, 0.8079368, 0, 0.5137255, 1, 1,
0.2277157, -1.015321, 2.568529, 0, 0.509804, 1, 1,
0.2318713, 0.4152235, 1.320317, 0, 0.5019608, 1, 1,
0.2343144, -0.3596291, 2.337297, 0, 0.4941176, 1, 1,
0.2454211, 1.066001, 0.5540655, 0, 0.4901961, 1, 1,
0.2458179, -0.718318, 3.856806, 0, 0.4823529, 1, 1,
0.2477291, 2.029198, 1.690001, 0, 0.4784314, 1, 1,
0.2481246, -0.6627012, 1.829269, 0, 0.4705882, 1, 1,
0.2528343, -0.7446611, 2.199446, 0, 0.4666667, 1, 1,
0.2549146, 0.4982897, -1.453359, 0, 0.4588235, 1, 1,
0.2560503, -1.510726, 2.820956, 0, 0.454902, 1, 1,
0.2610877, -0.6634358, 2.289589, 0, 0.4470588, 1, 1,
0.2659513, -0.2074417, 1.731781, 0, 0.4431373, 1, 1,
0.2760465, -0.1432337, 1.193788, 0, 0.4352941, 1, 1,
0.2767637, 0.2463422, -0.2177727, 0, 0.4313726, 1, 1,
0.276997, 0.9831738, 0.05406935, 0, 0.4235294, 1, 1,
0.2770219, -0.3823242, 1.886866, 0, 0.4196078, 1, 1,
0.2783018, 0.2334637, 1.182759, 0, 0.4117647, 1, 1,
0.2811195, -0.8456487, 1.531991, 0, 0.4078431, 1, 1,
0.2816434, -0.2483901, 3.640061, 0, 0.4, 1, 1,
0.2849685, -0.1845414, 4.408809, 0, 0.3921569, 1, 1,
0.2864875, 1.174658, 0.4930088, 0, 0.3882353, 1, 1,
0.2894646, 1.419743, -0.928173, 0, 0.3803922, 1, 1,
0.2914788, 0.4867367, 1.15557, 0, 0.3764706, 1, 1,
0.2963804, -1.153642, 3.682643, 0, 0.3686275, 1, 1,
0.2964486, 0.3763846, 2.426088, 0, 0.3647059, 1, 1,
0.2968574, -1.472484, 0.3586439, 0, 0.3568628, 1, 1,
0.2988971, 1.051306, 0.254782, 0, 0.3529412, 1, 1,
0.2998752, -1.032224, 3.295289, 0, 0.345098, 1, 1,
0.2999739, 0.1343706, 3.037487, 0, 0.3411765, 1, 1,
0.3035988, -1.184366, 3.510689, 0, 0.3333333, 1, 1,
0.3043895, 1.815967, 1.109858, 0, 0.3294118, 1, 1,
0.3056361, 0.4384933, 3.14394, 0, 0.3215686, 1, 1,
0.3156528, 0.8170531, 0.8704638, 0, 0.3176471, 1, 1,
0.3191939, -0.2098311, 3.80168, 0, 0.3098039, 1, 1,
0.3207358, 0.9020004, 0.356917, 0, 0.3058824, 1, 1,
0.3237733, -1.205075, 3.128826, 0, 0.2980392, 1, 1,
0.3239629, -1.167232, 3.782715, 0, 0.2901961, 1, 1,
0.3262174, -0.3676929, 1.582371, 0, 0.2862745, 1, 1,
0.3265137, -0.4794516, 0.6613857, 0, 0.2784314, 1, 1,
0.3270391, -0.168841, 3.383235, 0, 0.2745098, 1, 1,
0.3301629, 0.07794349, 0.3876959, 0, 0.2666667, 1, 1,
0.3303958, 1.026591, 0.3526535, 0, 0.2627451, 1, 1,
0.3392238, 0.8823801, 1.501561, 0, 0.254902, 1, 1,
0.3412511, 0.3105158, -0.3483934, 0, 0.2509804, 1, 1,
0.3475826, 0.03570114, 2.723032, 0, 0.2431373, 1, 1,
0.3532627, 0.6054879, 1.126042, 0, 0.2392157, 1, 1,
0.3557864, -0.1664281, 2.690382, 0, 0.2313726, 1, 1,
0.3567853, -0.8667768, 2.022087, 0, 0.227451, 1, 1,
0.3600084, -1.763969, 4.674704, 0, 0.2196078, 1, 1,
0.3619614, -1.591602, 1.548394, 0, 0.2156863, 1, 1,
0.3667742, -1.025183, 1.913198, 0, 0.2078431, 1, 1,
0.3675023, 0.1112731, 1.837412, 0, 0.2039216, 1, 1,
0.3705573, 0.2871537, 0.6234064, 0, 0.1960784, 1, 1,
0.3713644, 1.993326, 0.4996384, 0, 0.1882353, 1, 1,
0.3742698, 1.27722, 0.6759679, 0, 0.1843137, 1, 1,
0.3754227, -0.09416707, 2.831698, 0, 0.1764706, 1, 1,
0.3782195, -1.435914, 1.737276, 0, 0.172549, 1, 1,
0.3786812, 0.4833164, -0.3485372, 0, 0.1647059, 1, 1,
0.3800572, 0.7249677, -0.3527725, 0, 0.1607843, 1, 1,
0.3821022, 0.4882359, 2.059021, 0, 0.1529412, 1, 1,
0.3839927, -0.6084753, 1.742251, 0, 0.1490196, 1, 1,
0.3882422, -2.278776, 2.572038, 0, 0.1411765, 1, 1,
0.3942614, -1.463611, 2.349478, 0, 0.1372549, 1, 1,
0.4014531, 1.718899, -0.4390076, 0, 0.1294118, 1, 1,
0.4023072, 0.442079, -0.0563925, 0, 0.1254902, 1, 1,
0.4042223, -1.267509, 2.367839, 0, 0.1176471, 1, 1,
0.4048922, -0.7829585, 3.644201, 0, 0.1137255, 1, 1,
0.4053241, -0.07756223, 2.938931, 0, 0.1058824, 1, 1,
0.408946, -0.20082, 2.00809, 0, 0.09803922, 1, 1,
0.4112555, 0.1502287, 1.72732, 0, 0.09411765, 1, 1,
0.4174204, -0.03682288, 2.433503, 0, 0.08627451, 1, 1,
0.4180495, -0.230061, 2.898081, 0, 0.08235294, 1, 1,
0.4186566, 3.211452, -0.2447477, 0, 0.07450981, 1, 1,
0.4204504, 1.499572, 0.3804168, 0, 0.07058824, 1, 1,
0.4242714, 0.5076424, 1.774922, 0, 0.0627451, 1, 1,
0.4279651, -0.7866418, 3.62824, 0, 0.05882353, 1, 1,
0.4280698, 1.647238, 1.53297, 0, 0.05098039, 1, 1,
0.4306506, -0.1225992, 1.418234, 0, 0.04705882, 1, 1,
0.430934, -0.05810121, -1.140292, 0, 0.03921569, 1, 1,
0.4310684, -0.7071944, 2.789136, 0, 0.03529412, 1, 1,
0.4369731, -0.4156277, 2.013271, 0, 0.02745098, 1, 1,
0.4369779, -0.7199549, 0.4737623, 0, 0.02352941, 1, 1,
0.43734, -0.4420464, 2.878496, 0, 0.01568628, 1, 1,
0.4402988, 0.4715338, 1.018822, 0, 0.01176471, 1, 1,
0.4421358, 1.247569, -0.7186344, 0, 0.003921569, 1, 1,
0.4432971, -1.962268, 1.764215, 0.003921569, 0, 1, 1,
0.4444142, 0.4890838, -0.8937778, 0.007843138, 0, 1, 1,
0.4478627, -0.05558802, 2.190314, 0.01568628, 0, 1, 1,
0.4543405, -1.670391, 1.844768, 0.01960784, 0, 1, 1,
0.4643544, 0.8778213, 0.7854525, 0.02745098, 0, 1, 1,
0.4660636, 1.434243, -1.635007, 0.03137255, 0, 1, 1,
0.4662702, -0.7682226, 1.632262, 0.03921569, 0, 1, 1,
0.4677158, -2.195405, 2.852747, 0.04313726, 0, 1, 1,
0.4724998, -0.1607864, 1.184888, 0.05098039, 0, 1, 1,
0.4746231, -2.661152, 3.517128, 0.05490196, 0, 1, 1,
0.4789792, 0.7887818, -0.3135343, 0.0627451, 0, 1, 1,
0.4793345, 1.150289, 0.2639372, 0.06666667, 0, 1, 1,
0.4798656, 0.5306615, 1.998543, 0.07450981, 0, 1, 1,
0.4878231, 0.3428533, 1.18394, 0.07843138, 0, 1, 1,
0.4885995, 0.982918, 0.4964872, 0.08627451, 0, 1, 1,
0.4903011, -0.7470619, 3.32124, 0.09019608, 0, 1, 1,
0.4910629, 1.929583, 0.1940405, 0.09803922, 0, 1, 1,
0.4920364, 1.2353, 1.41215, 0.1058824, 0, 1, 1,
0.4971616, 1.266325, 0.3246139, 0.1098039, 0, 1, 1,
0.4979331, -1.295504, 2.800423, 0.1176471, 0, 1, 1,
0.500649, -0.1265866, 1.30998, 0.1215686, 0, 1, 1,
0.5033587, 1.39676, 0.3934831, 0.1294118, 0, 1, 1,
0.5069433, -0.9003686, 2.700519, 0.1333333, 0, 1, 1,
0.5122292, 0.09818914, 1.362534, 0.1411765, 0, 1, 1,
0.5179518, 1.068237, -1.351408, 0.145098, 0, 1, 1,
0.5200278, 0.06636652, 1.739534, 0.1529412, 0, 1, 1,
0.5206597, 1.245273, 0.9304198, 0.1568628, 0, 1, 1,
0.521221, 0.3445341, 0.6929044, 0.1647059, 0, 1, 1,
0.5261562, -0.6502627, 1.686529, 0.1686275, 0, 1, 1,
0.5311702, 0.3666622, 1.636556, 0.1764706, 0, 1, 1,
0.5398846, -0.6334883, 1.059577, 0.1803922, 0, 1, 1,
0.5442291, -0.9989608, 2.081434, 0.1882353, 0, 1, 1,
0.5453212, -0.1465859, 2.426659, 0.1921569, 0, 1, 1,
0.5459217, -0.8263178, 3.990637, 0.2, 0, 1, 1,
0.5492722, 1.391849, 0.8114439, 0.2078431, 0, 1, 1,
0.5495369, -0.6776675, 2.866609, 0.2117647, 0, 1, 1,
0.553669, 0.01752906, 0.2291055, 0.2196078, 0, 1, 1,
0.5573662, 1.075459, 1.375178, 0.2235294, 0, 1, 1,
0.558494, -0.02186048, 0.4695692, 0.2313726, 0, 1, 1,
0.5593369, 1.472614, -0.2081302, 0.2352941, 0, 1, 1,
0.5637291, 0.7374617, 0.4095851, 0.2431373, 0, 1, 1,
0.5645522, -0.9101925, 1.69014, 0.2470588, 0, 1, 1,
0.5736991, 0.7749475, 2.739302, 0.254902, 0, 1, 1,
0.5750164, -0.3036959, 0.7957596, 0.2588235, 0, 1, 1,
0.5766523, 0.600743, 0.1098411, 0.2666667, 0, 1, 1,
0.5768077, 1.245242, 0.9882737, 0.2705882, 0, 1, 1,
0.5791718, 0.05830959, 3.63725, 0.2784314, 0, 1, 1,
0.5854504, -0.8137, 2.583975, 0.282353, 0, 1, 1,
0.5877743, -1.114836, 3.356111, 0.2901961, 0, 1, 1,
0.590648, -2.344512, 2.914498, 0.2941177, 0, 1, 1,
0.5985039, -0.04521987, -0.4069466, 0.3019608, 0, 1, 1,
0.5995215, -0.5888229, 2.363468, 0.3098039, 0, 1, 1,
0.6015224, 0.9450558, 1.098677, 0.3137255, 0, 1, 1,
0.6032648, 0.72059, 0.4881492, 0.3215686, 0, 1, 1,
0.6035262, 2.441772, -1.668423, 0.3254902, 0, 1, 1,
0.606121, -1.4358, 2.31078, 0.3333333, 0, 1, 1,
0.6063282, -1.836909, 2.784421, 0.3372549, 0, 1, 1,
0.6125677, 0.2977235, 0.7508374, 0.345098, 0, 1, 1,
0.6197448, 0.1413393, 1.752711, 0.3490196, 0, 1, 1,
0.6235527, 0.1307219, 0.8983887, 0.3568628, 0, 1, 1,
0.6252421, 0.7948111, 1.748013, 0.3607843, 0, 1, 1,
0.62854, -2.636265, 4.238177, 0.3686275, 0, 1, 1,
0.6293038, -0.6841457, 3.929312, 0.372549, 0, 1, 1,
0.631651, -1.051322, 2.78308, 0.3803922, 0, 1, 1,
0.6333838, -1.161818, 2.073347, 0.3843137, 0, 1, 1,
0.6369905, -0.6079252, 1.365101, 0.3921569, 0, 1, 1,
0.6383781, -0.8047451, 1.303264, 0.3960784, 0, 1, 1,
0.6393175, -0.7471773, 1.55442, 0.4039216, 0, 1, 1,
0.6434067, -0.1338508, 0.4398083, 0.4117647, 0, 1, 1,
0.6577076, -1.75288, 2.72228, 0.4156863, 0, 1, 1,
0.6615379, 0.4676571, -0.9916083, 0.4235294, 0, 1, 1,
0.6650218, -0.5618091, 3.894769, 0.427451, 0, 1, 1,
0.6653058, 0.1560154, 2.428335, 0.4352941, 0, 1, 1,
0.6720966, -0.03225284, 2.439902, 0.4392157, 0, 1, 1,
0.6759742, -1.471218, 2.526673, 0.4470588, 0, 1, 1,
0.6762769, 1.556364, -0.2958719, 0.4509804, 0, 1, 1,
0.6836019, -0.4884454, 2.869503, 0.4588235, 0, 1, 1,
0.6857433, 0.1927376, 0.5847691, 0.4627451, 0, 1, 1,
0.6868435, -1.17264, -0.1686493, 0.4705882, 0, 1, 1,
0.6881375, -0.3219155, 1.350546, 0.4745098, 0, 1, 1,
0.6944703, 0.7271465, 1.05632, 0.4823529, 0, 1, 1,
0.6996602, 0.1221247, 3.343278, 0.4862745, 0, 1, 1,
0.7005064, 1.35588, -0.00526012, 0.4941176, 0, 1, 1,
0.7059705, -0.1103438, 1.231001, 0.5019608, 0, 1, 1,
0.7104736, -1.601277, 3.280346, 0.5058824, 0, 1, 1,
0.7150658, 0.7026795, -1.677455, 0.5137255, 0, 1, 1,
0.7189969, 0.594431, 1.459419, 0.5176471, 0, 1, 1,
0.7192613, -0.4234883, 0.9914832, 0.5254902, 0, 1, 1,
0.7196853, 1.666264, -1.30907, 0.5294118, 0, 1, 1,
0.721492, -1.258331, 3.46184, 0.5372549, 0, 1, 1,
0.7300918, -3.218626e-05, 2.461316, 0.5411765, 0, 1, 1,
0.7325548, 1.512845, 2.417116, 0.5490196, 0, 1, 1,
0.7338041, 0.5601022, 1.209108, 0.5529412, 0, 1, 1,
0.7363189, 0.01362469, 3.010454, 0.5607843, 0, 1, 1,
0.7365423, 0.593514, 2.244216, 0.5647059, 0, 1, 1,
0.7377356, -0.2250073, 1.734257, 0.572549, 0, 1, 1,
0.7475669, 0.3917634, 0.1649706, 0.5764706, 0, 1, 1,
0.7546707, -0.8001432, 2.601697, 0.5843138, 0, 1, 1,
0.7580712, -0.6939836, 1.758683, 0.5882353, 0, 1, 1,
0.7604734, -0.5566649, 2.941326, 0.5960785, 0, 1, 1,
0.7609556, 0.1673965, 1.428398, 0.6039216, 0, 1, 1,
0.7624789, 0.4532891, 0.9348289, 0.6078432, 0, 1, 1,
0.7625358, 0.5626618, 2.617303, 0.6156863, 0, 1, 1,
0.7649828, 0.8424039, 0.2991772, 0.6196079, 0, 1, 1,
0.7708571, 0.5470135, 0.39401, 0.627451, 0, 1, 1,
0.7723537, 0.6007348, 1.261132, 0.6313726, 0, 1, 1,
0.7813203, 0.4315659, 2.639654, 0.6392157, 0, 1, 1,
0.7894027, 1.447363, 0.4195078, 0.6431373, 0, 1, 1,
0.7913049, 1.141842, 1.991148, 0.6509804, 0, 1, 1,
0.791639, -1.026998, 1.614377, 0.654902, 0, 1, 1,
0.7916887, 0.698605, 0.3425684, 0.6627451, 0, 1, 1,
0.7927408, 1.83977, -1.315109, 0.6666667, 0, 1, 1,
0.7928731, 1.740932, 0.2386522, 0.6745098, 0, 1, 1,
0.7937185, -0.4143503, 2.429513, 0.6784314, 0, 1, 1,
0.7954352, 1.1464, 1.14856, 0.6862745, 0, 1, 1,
0.7958389, 1.500243, 1.376672, 0.6901961, 0, 1, 1,
0.8000154, -1.976936, 3.344762, 0.6980392, 0, 1, 1,
0.8004458, 0.9948967, 1.234608, 0.7058824, 0, 1, 1,
0.8004699, 0.2535797, 2.930544, 0.7098039, 0, 1, 1,
0.8014367, -1.065055, 1.426197, 0.7176471, 0, 1, 1,
0.8053697, 0.2970425, 2.327399, 0.7215686, 0, 1, 1,
0.8116391, 0.09654693, 1.215001, 0.7294118, 0, 1, 1,
0.8126099, -1.38228, 0.5962122, 0.7333333, 0, 1, 1,
0.8206093, -0.2928531, 2.743652, 0.7411765, 0, 1, 1,
0.8211541, -2.303863, 3.496101, 0.7450981, 0, 1, 1,
0.8329342, 0.146332, 1.638366, 0.7529412, 0, 1, 1,
0.8346278, -0.888371, 3.546508, 0.7568628, 0, 1, 1,
0.8352145, 0.6692905, 1.876212, 0.7647059, 0, 1, 1,
0.8369836, -0.06855417, 2.394738, 0.7686275, 0, 1, 1,
0.8455222, 0.6533325, 3.342836, 0.7764706, 0, 1, 1,
0.8480133, 0.06474821, 1.843111, 0.7803922, 0, 1, 1,
0.8512191, 0.8249714, 2.775785, 0.7882353, 0, 1, 1,
0.8553907, 0.2339351, 0.6186144, 0.7921569, 0, 1, 1,
0.8621018, -0.2528636, 0.9603642, 0.8, 0, 1, 1,
0.875864, 0.2724522, 1.762868, 0.8078431, 0, 1, 1,
0.8762681, -0.551446, 2.656377, 0.8117647, 0, 1, 1,
0.8783201, 0.0050312, 1.159028, 0.8196079, 0, 1, 1,
0.8846554, -0.4421417, -0.7151854, 0.8235294, 0, 1, 1,
0.8847361, 0.7585387, 0.8766159, 0.8313726, 0, 1, 1,
0.8861979, -0.3312288, 1.735012, 0.8352941, 0, 1, 1,
0.8921993, 0.3259942, 1.372423, 0.8431373, 0, 1, 1,
0.9004276, -1.715812, 1.183817, 0.8470588, 0, 1, 1,
0.9015692, -0.9341802, 2.710237, 0.854902, 0, 1, 1,
0.9047745, 0.5828329, -0.5686773, 0.8588235, 0, 1, 1,
0.9114717, 1.313882, -0.8841479, 0.8666667, 0, 1, 1,
0.9115724, 0.7643141, -0.0254322, 0.8705882, 0, 1, 1,
0.9137329, -0.2225074, 2.433762, 0.8784314, 0, 1, 1,
0.9160099, -1.139293, 3.27266, 0.8823529, 0, 1, 1,
0.9182377, 1.091979, 0.6043777, 0.8901961, 0, 1, 1,
0.9259161, 0.3529842, -0.03006367, 0.8941177, 0, 1, 1,
0.9283252, 0.4130085, 0.5890504, 0.9019608, 0, 1, 1,
0.9294424, -0.7474037, 2.292305, 0.9098039, 0, 1, 1,
0.936802, 0.1431381, 1.608494, 0.9137255, 0, 1, 1,
0.9393505, -0.1303009, -1.712236, 0.9215686, 0, 1, 1,
0.9419315, -0.9140127, 1.986856, 0.9254902, 0, 1, 1,
0.9420273, -1.501732, 1.561134, 0.9333333, 0, 1, 1,
0.9425281, 0.7659904, 1.024373, 0.9372549, 0, 1, 1,
0.9450743, 1.236115, 1.983427, 0.945098, 0, 1, 1,
0.9457326, 0.6356624, 1.84226, 0.9490196, 0, 1, 1,
0.9485598, 0.2374627, 2.634749, 0.9568627, 0, 1, 1,
0.9493176, 0.8028145, -0.4466014, 0.9607843, 0, 1, 1,
0.9505007, 0.3203117, 0.9142258, 0.9686275, 0, 1, 1,
0.9551312, 0.8134764, 1.056023, 0.972549, 0, 1, 1,
0.9571263, 0.007771623, 1.215255, 0.9803922, 0, 1, 1,
0.9583663, -0.1170928, 2.100889, 0.9843137, 0, 1, 1,
0.9600375, -1.137565, 2.592218, 0.9921569, 0, 1, 1,
0.9628994, 0.09743592, 2.310107, 0.9960784, 0, 1, 1,
0.9698449, -0.2752586, 2.794595, 1, 0, 0.9960784, 1,
0.9704734, -1.257979, 1.245791, 1, 0, 0.9882353, 1,
0.9728847, 0.8070394, 1.388882, 1, 0, 0.9843137, 1,
0.9831402, -0.3387128, 1.680569, 1, 0, 0.9764706, 1,
0.9845197, -0.4568882, 2.181034, 1, 0, 0.972549, 1,
0.9920778, -0.5649005, 0.6690209, 1, 0, 0.9647059, 1,
0.9969785, 2.034322, 0.7944209, 1, 0, 0.9607843, 1,
0.998787, 1.075142, 1.186555, 1, 0, 0.9529412, 1,
0.9991157, 0.1849443, 1.675681, 1, 0, 0.9490196, 1,
0.9992297, 1.818252, 0.6805091, 1, 0, 0.9411765, 1,
1.001881, 0.2545015, 1.101146, 1, 0, 0.9372549, 1,
1.002656, -0.002625539, 0.5514808, 1, 0, 0.9294118, 1,
1.004009, -0.7149443, 3.346221, 1, 0, 0.9254902, 1,
1.004879, 0.5468332, 1.77576, 1, 0, 0.9176471, 1,
1.005893, -0.07460481, 0.7628472, 1, 0, 0.9137255, 1,
1.009869, 0.3852884, 1.16587, 1, 0, 0.9058824, 1,
1.011944, -0.2707149, 1.95676, 1, 0, 0.9019608, 1,
1.012494, -1.094767, 2.471689, 1, 0, 0.8941177, 1,
1.018643, -0.4258772, 1.376119, 1, 0, 0.8862745, 1,
1.025412, 1.081446, -0.2430964, 1, 0, 0.8823529, 1,
1.026772, -0.461063, 2.150469, 1, 0, 0.8745098, 1,
1.032673, -0.7503927, 1.808917, 1, 0, 0.8705882, 1,
1.039549, 0.7766456, 1.341766, 1, 0, 0.8627451, 1,
1.042415, -0.2965786, 1.964357, 1, 0, 0.8588235, 1,
1.042666, -0.08797693, 2.037593, 1, 0, 0.8509804, 1,
1.043705, 0.4203989, 1.365383, 1, 0, 0.8470588, 1,
1.047215, 0.3455756, 1.233889, 1, 0, 0.8392157, 1,
1.049749, -1.138993, 1.411318, 1, 0, 0.8352941, 1,
1.061185, -1.499526, 4.086075, 1, 0, 0.827451, 1,
1.064319, 1.007505, 2.218419, 1, 0, 0.8235294, 1,
1.067803, 0.8615012, 1.080772, 1, 0, 0.8156863, 1,
1.06874, 1.488199, 2.518254, 1, 0, 0.8117647, 1,
1.069667, 1.031173, 2.640656, 1, 0, 0.8039216, 1,
1.071411, 0.2044051, 0.08637623, 1, 0, 0.7960784, 1,
1.072005, 0.5061442, -0.1511399, 1, 0, 0.7921569, 1,
1.082489, 1.695951, 0.6531128, 1, 0, 0.7843137, 1,
1.089971, -0.6187469, 2.09447, 1, 0, 0.7803922, 1,
1.093241, -0.3874565, 0.8405373, 1, 0, 0.772549, 1,
1.098981, 0.4213503, 1.570827, 1, 0, 0.7686275, 1,
1.112095, -1.388831, 0.9329191, 1, 0, 0.7607843, 1,
1.118225, 0.0913699, 3.009313, 1, 0, 0.7568628, 1,
1.121853, -1.679112, 1.871202, 1, 0, 0.7490196, 1,
1.135898, -0.9003815, 1.491343, 1, 0, 0.7450981, 1,
1.143036, 0.7210512, 1.053532, 1, 0, 0.7372549, 1,
1.145059, 0.4880424, 0.5100388, 1, 0, 0.7333333, 1,
1.14572, 1.497646, 0.8972394, 1, 0, 0.7254902, 1,
1.146546, -0.7222732, 1.946827, 1, 0, 0.7215686, 1,
1.152323, -1.172956, 0.3751386, 1, 0, 0.7137255, 1,
1.152934, -1.544581, 2.84377, 1, 0, 0.7098039, 1,
1.159168, 0.3858859, 0.9581194, 1, 0, 0.7019608, 1,
1.160881, -0.5305447, 1.376636, 1, 0, 0.6941177, 1,
1.164548, -1.118672, 3.794854, 1, 0, 0.6901961, 1,
1.175009, -0.5479206, 0.6261001, 1, 0, 0.682353, 1,
1.185566, -0.6840593, 2.082989, 1, 0, 0.6784314, 1,
1.186048, 0.7548444, 3.67055, 1, 0, 0.6705883, 1,
1.18701, 0.9875249, -0.602258, 1, 0, 0.6666667, 1,
1.192032, 0.2141066, 3.068106, 1, 0, 0.6588235, 1,
1.193548, 1.64928, 0.368815, 1, 0, 0.654902, 1,
1.196558, -0.6488297, 2.07206, 1, 0, 0.6470588, 1,
1.198504, -1.326042, 0.6168094, 1, 0, 0.6431373, 1,
1.214519, -0.3241216, 2.561157, 1, 0, 0.6352941, 1,
1.233205, -1.294448, -0.2538883, 1, 0, 0.6313726, 1,
1.234495, -0.6195044, 2.584727, 1, 0, 0.6235294, 1,
1.239583, 1.731964, 1.448304, 1, 0, 0.6196079, 1,
1.256217, 0.02482013, 0.4367044, 1, 0, 0.6117647, 1,
1.258103, -0.1374901, 1.513917, 1, 0, 0.6078432, 1,
1.260381, -2.252458, 3.323303, 1, 0, 0.6, 1,
1.270058, 0.2616354, 0.2176197, 1, 0, 0.5921569, 1,
1.275814, 0.8967088, 0.9618039, 1, 0, 0.5882353, 1,
1.28057, 0.09713201, 0.9381204, 1, 0, 0.5803922, 1,
1.281516, -1.719088, 4.147876, 1, 0, 0.5764706, 1,
1.292322, -1.285247, 3.160834, 1, 0, 0.5686275, 1,
1.300942, -1.697553, 2.307776, 1, 0, 0.5647059, 1,
1.311979, -0.5013622, 3.589508, 1, 0, 0.5568628, 1,
1.312923, -0.3570954, 3.55039, 1, 0, 0.5529412, 1,
1.314864, 1.239332, 0.05635835, 1, 0, 0.5450981, 1,
1.314967, 0.9841473, -0.5881441, 1, 0, 0.5411765, 1,
1.323359, 1.315356, -0.3753958, 1, 0, 0.5333334, 1,
1.326366, -1.545517, 3.419961, 1, 0, 0.5294118, 1,
1.329716, -0.4079192, 1.62599, 1, 0, 0.5215687, 1,
1.335161, -0.4082088, 0.2692825, 1, 0, 0.5176471, 1,
1.34286, 0.9948588, 1.039584, 1, 0, 0.509804, 1,
1.344268, 1.35528, 1.488986, 1, 0, 0.5058824, 1,
1.344413, 0.0775525, 1.386089, 1, 0, 0.4980392, 1,
1.34876, 0.35468, 1.271895, 1, 0, 0.4901961, 1,
1.349617, 0.07698846, 1.121207, 1, 0, 0.4862745, 1,
1.350063, 0.1006405, 2.625633, 1, 0, 0.4784314, 1,
1.352846, -0.579671, 0.6479545, 1, 0, 0.4745098, 1,
1.369674, 1.117508, -0.7364702, 1, 0, 0.4666667, 1,
1.372378, 2.021728, 0.4822599, 1, 0, 0.4627451, 1,
1.375423, -0.7514181, 0.9162083, 1, 0, 0.454902, 1,
1.385743, -0.08833399, 1.558262, 1, 0, 0.4509804, 1,
1.387621, 0.5936757, 2.647011, 1, 0, 0.4431373, 1,
1.389458, 0.35188, 2.614372, 1, 0, 0.4392157, 1,
1.41336, 0.3790408, 2.523715, 1, 0, 0.4313726, 1,
1.424874, 1.042087, -0.2438389, 1, 0, 0.427451, 1,
1.424974, -2.256983, 2.66068, 1, 0, 0.4196078, 1,
1.435349, -2.145795, 3.952547, 1, 0, 0.4156863, 1,
1.44609, 0.7720517, 0.2043695, 1, 0, 0.4078431, 1,
1.461118, 0.3669116, 0.7660484, 1, 0, 0.4039216, 1,
1.461208, -0.04600487, 1.278729, 1, 0, 0.3960784, 1,
1.469154, 0.5736282, 1.407549, 1, 0, 0.3882353, 1,
1.480834, 0.6953292, 3.256298, 1, 0, 0.3843137, 1,
1.490174, 0.2968737, 2.709287, 1, 0, 0.3764706, 1,
1.49078, 0.9335191, 2.780977, 1, 0, 0.372549, 1,
1.496042, 1.392504, 0.9607881, 1, 0, 0.3647059, 1,
1.504115, 0.7530447, 1.297054, 1, 0, 0.3607843, 1,
1.506863, -0.9180185, 3.263162, 1, 0, 0.3529412, 1,
1.534173, 0.188427, 1.96594, 1, 0, 0.3490196, 1,
1.540727, 0.7197388, 1.607688, 1, 0, 0.3411765, 1,
1.548089, -1.222712, 1.190374, 1, 0, 0.3372549, 1,
1.557442, 1.446013, 1.624326, 1, 0, 0.3294118, 1,
1.561718, 0.9652327, 1.30095, 1, 0, 0.3254902, 1,
1.563495, 0.8630331, 2.5123, 1, 0, 0.3176471, 1,
1.569881, -1.00644, -0.0695246, 1, 0, 0.3137255, 1,
1.578295, 0.247871, 1.603698, 1, 0, 0.3058824, 1,
1.607898, -0.3659415, 3.464805, 1, 0, 0.2980392, 1,
1.628821, -0.2306855, 2.349676, 1, 0, 0.2941177, 1,
1.630916, 0.6814976, 1.124148, 1, 0, 0.2862745, 1,
1.633845, -1.098579, 2.254347, 1, 0, 0.282353, 1,
1.634275, 0.903749, 1.588654, 1, 0, 0.2745098, 1,
1.647064, 0.1176274, 2.263478, 1, 0, 0.2705882, 1,
1.669363, -0.1421548, 1.955886, 1, 0, 0.2627451, 1,
1.690507, -0.1966306, 2.206209, 1, 0, 0.2588235, 1,
1.707243, 0.3758667, 0.6198529, 1, 0, 0.2509804, 1,
1.707728, -0.4616832, 2.226498, 1, 0, 0.2470588, 1,
1.708996, -0.6386134, 2.352504, 1, 0, 0.2392157, 1,
1.713219, -0.4603803, 2.2773, 1, 0, 0.2352941, 1,
1.715812, -0.4598927, 1.151065, 1, 0, 0.227451, 1,
1.717405, -0.4916404, 0.6502876, 1, 0, 0.2235294, 1,
1.717485, 0.9199429, 0.3340562, 1, 0, 0.2156863, 1,
1.727734, -0.2821752, -0.1002381, 1, 0, 0.2117647, 1,
1.728614, 0.1252728, 1.434558, 1, 0, 0.2039216, 1,
1.765185, -0.6837432, 1.394848, 1, 0, 0.1960784, 1,
1.773136, 0.6145669, 1.976916, 1, 0, 0.1921569, 1,
1.783652, -0.6642455, -0.5058852, 1, 0, 0.1843137, 1,
1.804578, 1.901368, 0.2639658, 1, 0, 0.1803922, 1,
1.812724, 0.3653035, 1.417675, 1, 0, 0.172549, 1,
1.819875, 0.3487264, -0.08672061, 1, 0, 0.1686275, 1,
1.837457, -0.7652209, 3.414794, 1, 0, 0.1607843, 1,
1.86612, -1.325769, 2.529865, 1, 0, 0.1568628, 1,
1.881476, -1.606187, 1.935588, 1, 0, 0.1490196, 1,
1.909951, -0.9541487, 2.140731, 1, 0, 0.145098, 1,
2.004486, 0.2080792, 1.768618, 1, 0, 0.1372549, 1,
2.011222, -0.1922166, 1.536354, 1, 0, 0.1333333, 1,
2.014455, -2.451039, 2.267063, 1, 0, 0.1254902, 1,
2.01483, -0.1860252, 1.036254, 1, 0, 0.1215686, 1,
2.025676, -0.291886, -0.5555516, 1, 0, 0.1137255, 1,
2.038622, -2.790353, 2.281433, 1, 0, 0.1098039, 1,
2.054376, 1.078911, 1.240879, 1, 0, 0.1019608, 1,
2.059787, -0.5958946, 1.263943, 1, 0, 0.09411765, 1,
2.127394, 0.331077, 0.6745002, 1, 0, 0.09019608, 1,
2.171553, 0.04137559, 1.58055, 1, 0, 0.08235294, 1,
2.193459, 0.09240375, 3.034522, 1, 0, 0.07843138, 1,
2.267481, -0.6314235, 4.12192, 1, 0, 0.07058824, 1,
2.357462, -0.5782123, 1.993022, 1, 0, 0.06666667, 1,
2.398794, -0.6017645, 1.118493, 1, 0, 0.05882353, 1,
2.400788, -0.2820153, 1.357528, 1, 0, 0.05490196, 1,
2.481877, -0.1358061, 2.002161, 1, 0, 0.04705882, 1,
2.482833, 0.972764, 0.8786023, 1, 0, 0.04313726, 1,
2.508055, 0.7987263, 1.080905, 1, 0, 0.03529412, 1,
2.632437, -2.513896, 1.695819, 1, 0, 0.03137255, 1,
2.656645, 0.2801876, 1.523914, 1, 0, 0.02352941, 1,
2.716593, 0.042574, 1.468106, 1, 0, 0.01960784, 1,
2.852206, -0.7069296, 1.543491, 1, 0, 0.01176471, 1,
3.25001, 1.145159, 0.8142045, 1, 0, 0.007843138, 1
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
-0.09914005, -3.887619, -7.113558, 0, -0.5, 0.5, 0.5,
-0.09914005, -3.887619, -7.113558, 1, -0.5, 0.5, 0.5,
-0.09914005, -3.887619, -7.113558, 1, 1.5, 0.5, 0.5,
-0.09914005, -3.887619, -7.113558, 0, 1.5, 0.5, 0.5
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
-4.583652, 0.1763642, -7.113558, 0, -0.5, 0.5, 0.5,
-4.583652, 0.1763642, -7.113558, 1, -0.5, 0.5, 0.5,
-4.583652, 0.1763642, -7.113558, 1, 1.5, 0.5, 0.5,
-4.583652, 0.1763642, -7.113558, 0, 1.5, 0.5, 0.5
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
-4.583652, -3.887619, -0.06441593, 0, -0.5, 0.5, 0.5,
-4.583652, -3.887619, -0.06441593, 1, -0.5, 0.5, 0.5,
-4.583652, -3.887619, -0.06441593, 1, 1.5, 0.5, 0.5,
-4.583652, -3.887619, -0.06441593, 0, 1.5, 0.5, 0.5
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
-3, -2.949776, -5.486833,
3, -2.949776, -5.486833,
-3, -2.949776, -5.486833,
-3, -3.106084, -5.757954,
-2, -2.949776, -5.486833,
-2, -3.106084, -5.757954,
-1, -2.949776, -5.486833,
-1, -3.106084, -5.757954,
0, -2.949776, -5.486833,
0, -3.106084, -5.757954,
1, -2.949776, -5.486833,
1, -3.106084, -5.757954,
2, -2.949776, -5.486833,
2, -3.106084, -5.757954,
3, -2.949776, -5.486833,
3, -3.106084, -5.757954
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
-3, -3.418698, -6.300195, 0, -0.5, 0.5, 0.5,
-3, -3.418698, -6.300195, 1, -0.5, 0.5, 0.5,
-3, -3.418698, -6.300195, 1, 1.5, 0.5, 0.5,
-3, -3.418698, -6.300195, 0, 1.5, 0.5, 0.5,
-2, -3.418698, -6.300195, 0, -0.5, 0.5, 0.5,
-2, -3.418698, -6.300195, 1, -0.5, 0.5, 0.5,
-2, -3.418698, -6.300195, 1, 1.5, 0.5, 0.5,
-2, -3.418698, -6.300195, 0, 1.5, 0.5, 0.5,
-1, -3.418698, -6.300195, 0, -0.5, 0.5, 0.5,
-1, -3.418698, -6.300195, 1, -0.5, 0.5, 0.5,
-1, -3.418698, -6.300195, 1, 1.5, 0.5, 0.5,
-1, -3.418698, -6.300195, 0, 1.5, 0.5, 0.5,
0, -3.418698, -6.300195, 0, -0.5, 0.5, 0.5,
0, -3.418698, -6.300195, 1, -0.5, 0.5, 0.5,
0, -3.418698, -6.300195, 1, 1.5, 0.5, 0.5,
0, -3.418698, -6.300195, 0, 1.5, 0.5, 0.5,
1, -3.418698, -6.300195, 0, -0.5, 0.5, 0.5,
1, -3.418698, -6.300195, 1, -0.5, 0.5, 0.5,
1, -3.418698, -6.300195, 1, 1.5, 0.5, 0.5,
1, -3.418698, -6.300195, 0, 1.5, 0.5, 0.5,
2, -3.418698, -6.300195, 0, -0.5, 0.5, 0.5,
2, -3.418698, -6.300195, 1, -0.5, 0.5, 0.5,
2, -3.418698, -6.300195, 1, 1.5, 0.5, 0.5,
2, -3.418698, -6.300195, 0, 1.5, 0.5, 0.5,
3, -3.418698, -6.300195, 0, -0.5, 0.5, 0.5,
3, -3.418698, -6.300195, 1, -0.5, 0.5, 0.5,
3, -3.418698, -6.300195, 1, 1.5, 0.5, 0.5,
3, -3.418698, -6.300195, 0, 1.5, 0.5, 0.5
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
-3.548764, -2, -5.486833,
-3.548764, 3, -5.486833,
-3.548764, -2, -5.486833,
-3.721246, -2, -5.757954,
-3.548764, -1, -5.486833,
-3.721246, -1, -5.757954,
-3.548764, 0, -5.486833,
-3.721246, 0, -5.757954,
-3.548764, 1, -5.486833,
-3.721246, 1, -5.757954,
-3.548764, 2, -5.486833,
-3.721246, 2, -5.757954,
-3.548764, 3, -5.486833,
-3.721246, 3, -5.757954
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
-4.066208, -2, -6.300195, 0, -0.5, 0.5, 0.5,
-4.066208, -2, -6.300195, 1, -0.5, 0.5, 0.5,
-4.066208, -2, -6.300195, 1, 1.5, 0.5, 0.5,
-4.066208, -2, -6.300195, 0, 1.5, 0.5, 0.5,
-4.066208, -1, -6.300195, 0, -0.5, 0.5, 0.5,
-4.066208, -1, -6.300195, 1, -0.5, 0.5, 0.5,
-4.066208, -1, -6.300195, 1, 1.5, 0.5, 0.5,
-4.066208, -1, -6.300195, 0, 1.5, 0.5, 0.5,
-4.066208, 0, -6.300195, 0, -0.5, 0.5, 0.5,
-4.066208, 0, -6.300195, 1, -0.5, 0.5, 0.5,
-4.066208, 0, -6.300195, 1, 1.5, 0.5, 0.5,
-4.066208, 0, -6.300195, 0, 1.5, 0.5, 0.5,
-4.066208, 1, -6.300195, 0, -0.5, 0.5, 0.5,
-4.066208, 1, -6.300195, 1, -0.5, 0.5, 0.5,
-4.066208, 1, -6.300195, 1, 1.5, 0.5, 0.5,
-4.066208, 1, -6.300195, 0, 1.5, 0.5, 0.5,
-4.066208, 2, -6.300195, 0, -0.5, 0.5, 0.5,
-4.066208, 2, -6.300195, 1, -0.5, 0.5, 0.5,
-4.066208, 2, -6.300195, 1, 1.5, 0.5, 0.5,
-4.066208, 2, -6.300195, 0, 1.5, 0.5, 0.5,
-4.066208, 3, -6.300195, 0, -0.5, 0.5, 0.5,
-4.066208, 3, -6.300195, 1, -0.5, 0.5, 0.5,
-4.066208, 3, -6.300195, 1, 1.5, 0.5, 0.5,
-4.066208, 3, -6.300195, 0, 1.5, 0.5, 0.5
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
-3.548764, -2.949776, -4,
-3.548764, -2.949776, 4,
-3.548764, -2.949776, -4,
-3.721246, -3.106084, -4,
-3.548764, -2.949776, -2,
-3.721246, -3.106084, -2,
-3.548764, -2.949776, 0,
-3.721246, -3.106084, 0,
-3.548764, -2.949776, 2,
-3.721246, -3.106084, 2,
-3.548764, -2.949776, 4,
-3.721246, -3.106084, 4
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
-4.066208, -3.418698, -4, 0, -0.5, 0.5, 0.5,
-4.066208, -3.418698, -4, 1, -0.5, 0.5, 0.5,
-4.066208, -3.418698, -4, 1, 1.5, 0.5, 0.5,
-4.066208, -3.418698, -4, 0, 1.5, 0.5, 0.5,
-4.066208, -3.418698, -2, 0, -0.5, 0.5, 0.5,
-4.066208, -3.418698, -2, 1, -0.5, 0.5, 0.5,
-4.066208, -3.418698, -2, 1, 1.5, 0.5, 0.5,
-4.066208, -3.418698, -2, 0, 1.5, 0.5, 0.5,
-4.066208, -3.418698, 0, 0, -0.5, 0.5, 0.5,
-4.066208, -3.418698, 0, 1, -0.5, 0.5, 0.5,
-4.066208, -3.418698, 0, 1, 1.5, 0.5, 0.5,
-4.066208, -3.418698, 0, 0, 1.5, 0.5, 0.5,
-4.066208, -3.418698, 2, 0, -0.5, 0.5, 0.5,
-4.066208, -3.418698, 2, 1, -0.5, 0.5, 0.5,
-4.066208, -3.418698, 2, 1, 1.5, 0.5, 0.5,
-4.066208, -3.418698, 2, 0, 1.5, 0.5, 0.5,
-4.066208, -3.418698, 4, 0, -0.5, 0.5, 0.5,
-4.066208, -3.418698, 4, 1, -0.5, 0.5, 0.5,
-4.066208, -3.418698, 4, 1, 1.5, 0.5, 0.5,
-4.066208, -3.418698, 4, 0, 1.5, 0.5, 0.5
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
-3.548764, -2.949776, -5.486833,
-3.548764, 3.302505, -5.486833,
-3.548764, -2.949776, 5.358001,
-3.548764, 3.302505, 5.358001,
-3.548764, -2.949776, -5.486833,
-3.548764, -2.949776, 5.358001,
-3.548764, 3.302505, -5.486833,
-3.548764, 3.302505, 5.358001,
-3.548764, -2.949776, -5.486833,
3.350484, -2.949776, -5.486833,
-3.548764, -2.949776, 5.358001,
3.350484, -2.949776, 5.358001,
-3.548764, 3.302505, -5.486833,
3.350484, 3.302505, -5.486833,
-3.548764, 3.302505, 5.358001,
3.350484, 3.302505, 5.358001,
3.350484, -2.949776, -5.486833,
3.350484, 3.302505, -5.486833,
3.350484, -2.949776, 5.358001,
3.350484, 3.302505, 5.358001,
3.350484, -2.949776, -5.486833,
3.350484, -2.949776, 5.358001,
3.350484, 3.302505, -5.486833,
3.350484, 3.302505, 5.358001
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
var radius = 7.632394;
var distance = 33.95738;
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
mvMatrix.translate( 0.09914005, -0.1763642, 0.06441593 );
mvMatrix.scale( 1.196115, 1.319885, 0.7609424 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.95738);
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


