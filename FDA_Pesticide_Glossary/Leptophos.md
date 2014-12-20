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
-3.567212, -0.3014644, -2.059521, 1, 0, 0, 1,
-3.10815, 0.6635106, -1.554359, 1, 0.007843138, 0, 1,
-2.907814, -1.5712, -2.780664, 1, 0.01176471, 0, 1,
-2.630433, -2.46668, -3.308234, 1, 0.01960784, 0, 1,
-2.53393, -0.01100643, -2.054611, 1, 0.02352941, 0, 1,
-2.45313, -0.2535165, -1.974731, 1, 0.03137255, 0, 1,
-2.443246, -0.8059528, -3.612537, 1, 0.03529412, 0, 1,
-2.433013, 0.6327043, 0.9602208, 1, 0.04313726, 0, 1,
-2.421654, 1.610826, -1.995644, 1, 0.04705882, 0, 1,
-2.416534, -1.292979, -1.860134, 1, 0.05490196, 0, 1,
-2.403178, -0.2588, -1.639233, 1, 0.05882353, 0, 1,
-2.372514, 0.03974261, -1.439993, 1, 0.06666667, 0, 1,
-2.355185, 0.2045392, -1.564384, 1, 0.07058824, 0, 1,
-2.336804, -0.465613, -2.493759, 1, 0.07843138, 0, 1,
-2.31794, 1.097747, -2.360784, 1, 0.08235294, 0, 1,
-2.293791, 1.059049, -1.024348, 1, 0.09019608, 0, 1,
-2.229082, -0.8898379, -3.000897, 1, 0.09411765, 0, 1,
-2.195451, 0.1114423, -2.871461, 1, 0.1019608, 0, 1,
-2.150261, -0.4274465, -2.186419, 1, 0.1098039, 0, 1,
-2.145504, -1.34523, -1.962151, 1, 0.1137255, 0, 1,
-2.129105, -0.606643, -1.643636, 1, 0.1215686, 0, 1,
-2.111183, -1.346349, -1.989207, 1, 0.1254902, 0, 1,
-2.06981, -1.192909, -2.489417, 1, 0.1333333, 0, 1,
-2.049824, -0.4809069, -1.95114, 1, 0.1372549, 0, 1,
-2.03917, 0.4818343, -0.2753268, 1, 0.145098, 0, 1,
-2.035564, -0.4443271, -1.305941, 1, 0.1490196, 0, 1,
-2.032032, 0.98237, -1.878065, 1, 0.1568628, 0, 1,
-1.983626, 1.25993, -0.8975436, 1, 0.1607843, 0, 1,
-1.95293, 0.5852076, -2.048699, 1, 0.1686275, 0, 1,
-1.949285, -0.116459, 0.006970574, 1, 0.172549, 0, 1,
-1.918347, 0.7507025, -0.008426183, 1, 0.1803922, 0, 1,
-1.842618, 0.4531183, -2.373473, 1, 0.1843137, 0, 1,
-1.810761, 0.05260337, -2.59934, 1, 0.1921569, 0, 1,
-1.807423, 1.395269, 0.40941, 1, 0.1960784, 0, 1,
-1.798145, 1.100541, -0.1948096, 1, 0.2039216, 0, 1,
-1.769799, 3.065391, -1.264065, 1, 0.2117647, 0, 1,
-1.740917, -0.9651456, -2.380775, 1, 0.2156863, 0, 1,
-1.73635, -0.6854196, -3.227067, 1, 0.2235294, 0, 1,
-1.719091, 0.4864059, 0.1519427, 1, 0.227451, 0, 1,
-1.70922, 0.4489271, -1.47175, 1, 0.2352941, 0, 1,
-1.686248, 0.2036524, -2.088482, 1, 0.2392157, 0, 1,
-1.655728, -0.2515856, -1.907516, 1, 0.2470588, 0, 1,
-1.650126, -0.817476, -2.300307, 1, 0.2509804, 0, 1,
-1.647638, 0.2336241, -1.062541, 1, 0.2588235, 0, 1,
-1.643905, 0.2022247, 0.7133061, 1, 0.2627451, 0, 1,
-1.641408, 0.2146402, -1.527977, 1, 0.2705882, 0, 1,
-1.638826, -0.1923408, -0.4671509, 1, 0.2745098, 0, 1,
-1.63227, -0.5627058, -2.170149, 1, 0.282353, 0, 1,
-1.629448, -0.04479872, -2.617574, 1, 0.2862745, 0, 1,
-1.616234, 1.235084, 0.1614106, 1, 0.2941177, 0, 1,
-1.609896, -1.118843, -1.722179, 1, 0.3019608, 0, 1,
-1.6028, -0.3974821, -0.8909414, 1, 0.3058824, 0, 1,
-1.602282, -1.45213, -2.722886, 1, 0.3137255, 0, 1,
-1.598328, 0.4447997, -1.26308, 1, 0.3176471, 0, 1,
-1.597796, 1.986591, -0.3747887, 1, 0.3254902, 0, 1,
-1.592395, 0.6629562, -1.015222, 1, 0.3294118, 0, 1,
-1.588124, -1.295467, -3.18533, 1, 0.3372549, 0, 1,
-1.571142, -0.5598062, -1.827024, 1, 0.3411765, 0, 1,
-1.56824, -0.672299, -2.056793, 1, 0.3490196, 0, 1,
-1.536266, -1.052645, -0.4519912, 1, 0.3529412, 0, 1,
-1.536163, 0.03011625, -0.8061388, 1, 0.3607843, 0, 1,
-1.528794, 0.6927012, -0.7408614, 1, 0.3647059, 0, 1,
-1.515906, 0.7720478, -2.45751, 1, 0.372549, 0, 1,
-1.499867, -2.318453, -1.964685, 1, 0.3764706, 0, 1,
-1.499225, 0.5475616, -2.000323, 1, 0.3843137, 0, 1,
-1.488641, -0.6858732, -0.8827189, 1, 0.3882353, 0, 1,
-1.481821, -0.007858642, -1.885339, 1, 0.3960784, 0, 1,
-1.480633, 1.784002, -1.420998, 1, 0.4039216, 0, 1,
-1.471645, -0.7714939, -2.342959, 1, 0.4078431, 0, 1,
-1.468181, -0.6068862, -1.95738, 1, 0.4156863, 0, 1,
-1.454447, 0.1651065, -1.636281, 1, 0.4196078, 0, 1,
-1.435267, -0.694452, -2.478831, 1, 0.427451, 0, 1,
-1.434423, -0.389888, -3.420929, 1, 0.4313726, 0, 1,
-1.433555, 0.1474583, -1.055893, 1, 0.4392157, 0, 1,
-1.431796, -1.845103, -1.937281, 1, 0.4431373, 0, 1,
-1.431723, -0.305402, -3.345216, 1, 0.4509804, 0, 1,
-1.418372, 0.7771211, -1.088155, 1, 0.454902, 0, 1,
-1.402565, -1.488955, -1.523776, 1, 0.4627451, 0, 1,
-1.383586, -1.544819, -1.694853, 1, 0.4666667, 0, 1,
-1.38351, 1.421035, -1.505724, 1, 0.4745098, 0, 1,
-1.382888, -0.5060974, -0.3934489, 1, 0.4784314, 0, 1,
-1.360244, 0.4942256, -1.527868, 1, 0.4862745, 0, 1,
-1.34715, -1.020477, -2.653313, 1, 0.4901961, 0, 1,
-1.337791, 1.77507, -0.9310452, 1, 0.4980392, 0, 1,
-1.325102, -0.5376471, -1.18774, 1, 0.5058824, 0, 1,
-1.323544, 2.503596, -0.5073913, 1, 0.509804, 0, 1,
-1.319761, 0.4077398, -2.173429, 1, 0.5176471, 0, 1,
-1.319724, 0.2752104, -2.462019, 1, 0.5215687, 0, 1,
-1.311194, -0.1033747, -2.415861, 1, 0.5294118, 0, 1,
-1.300519, -0.1774479, -1.681052, 1, 0.5333334, 0, 1,
-1.288932, -1.018678, -3.409657, 1, 0.5411765, 0, 1,
-1.287318, 0.9250284, -1.697368, 1, 0.5450981, 0, 1,
-1.287272, -1.622547, -1.8664, 1, 0.5529412, 0, 1,
-1.273079, 0.5182524, -2.417217, 1, 0.5568628, 0, 1,
-1.260136, 1.334799, -0.8231934, 1, 0.5647059, 0, 1,
-1.249366, 0.1441379, -2.960269, 1, 0.5686275, 0, 1,
-1.249215, 1.3338, -0.137606, 1, 0.5764706, 0, 1,
-1.234032, -1.448305, -1.188974, 1, 0.5803922, 0, 1,
-1.231984, 0.6351959, 0.007325544, 1, 0.5882353, 0, 1,
-1.230349, -0.8700288, -1.88052, 1, 0.5921569, 0, 1,
-1.226276, -1.597932, -3.053487, 1, 0.6, 0, 1,
-1.217139, 1.205596, -1.553262, 1, 0.6078432, 0, 1,
-1.207862, 0.3499882, -1.038573, 1, 0.6117647, 0, 1,
-1.205102, 0.141523, -0.9566983, 1, 0.6196079, 0, 1,
-1.203201, 1.893568, -0.7380171, 1, 0.6235294, 0, 1,
-1.20258, -0.5109439, -1.619236, 1, 0.6313726, 0, 1,
-1.200074, 0.5194749, -0.8165172, 1, 0.6352941, 0, 1,
-1.195672, 0.3266933, 0.3133548, 1, 0.6431373, 0, 1,
-1.18001, -0.3643953, -1.994416, 1, 0.6470588, 0, 1,
-1.17799, -0.8319614, -0.5059642, 1, 0.654902, 0, 1,
-1.175956, -1.345655, -3.690886, 1, 0.6588235, 0, 1,
-1.165501, -0.09039351, -1.569834, 1, 0.6666667, 0, 1,
-1.164973, -2.106827, -3.257341, 1, 0.6705883, 0, 1,
-1.159647, -1.432154, -2.463963, 1, 0.6784314, 0, 1,
-1.152702, -1.767258, -3.990238, 1, 0.682353, 0, 1,
-1.151502, -0.8974919, -1.432021, 1, 0.6901961, 0, 1,
-1.148955, -0.8608834, -2.051976, 1, 0.6941177, 0, 1,
-1.148102, -1.493727, -2.076581, 1, 0.7019608, 0, 1,
-1.146694, 0.7011366, -2.48732, 1, 0.7098039, 0, 1,
-1.144838, 1.550389, 0.5767489, 1, 0.7137255, 0, 1,
-1.143304, 0.3214501, -1.162392, 1, 0.7215686, 0, 1,
-1.137946, -0.4719534, -2.362725, 1, 0.7254902, 0, 1,
-1.120675, -0.1188385, -1.428548, 1, 0.7333333, 0, 1,
-1.114635, -0.1628822, -2.172715, 1, 0.7372549, 0, 1,
-1.1118, -0.478075, -1.903351, 1, 0.7450981, 0, 1,
-1.10327, 1.423017, -0.4200933, 1, 0.7490196, 0, 1,
-1.099945, -0.2000777, -1.934873, 1, 0.7568628, 0, 1,
-1.095481, -0.06071017, -3.662824, 1, 0.7607843, 0, 1,
-1.090707, 0.2543684, -1.575742, 1, 0.7686275, 0, 1,
-1.088603, 0.2183871, 0.03704672, 1, 0.772549, 0, 1,
-1.082861, -0.3558815, -1.780898, 1, 0.7803922, 0, 1,
-1.080487, -2.469755, -2.355133, 1, 0.7843137, 0, 1,
-1.072554, -0.1232343, -1.527013, 1, 0.7921569, 0, 1,
-1.060934, 0.07086788, -2.987405, 1, 0.7960784, 0, 1,
-1.051173, 0.3660412, -1.944085, 1, 0.8039216, 0, 1,
-1.045305, -1.62814, -2.918643, 1, 0.8117647, 0, 1,
-1.041993, 0.02393809, -1.952508, 1, 0.8156863, 0, 1,
-1.041707, 0.602062, -1.189611, 1, 0.8235294, 0, 1,
-1.039809, 0.947282, -0.429383, 1, 0.827451, 0, 1,
-1.028543, 0.1923842, -3.085205, 1, 0.8352941, 0, 1,
-1.021188, -2.897773, -2.938088, 1, 0.8392157, 0, 1,
-1.019134, 1.557663, 0.4895394, 1, 0.8470588, 0, 1,
-1.016515, -2.051771, -2.717517, 1, 0.8509804, 0, 1,
-1.009665, 1.525977, -0.6447741, 1, 0.8588235, 0, 1,
-1.006852, -0.3164193, -1.733381, 1, 0.8627451, 0, 1,
-0.9999537, 0.9030101, -0.7443674, 1, 0.8705882, 0, 1,
-0.9905515, 1.595864, -0.6595554, 1, 0.8745098, 0, 1,
-0.9823221, 0.3111823, -1.729687, 1, 0.8823529, 0, 1,
-0.9805341, -2.580093, -2.573974, 1, 0.8862745, 0, 1,
-0.980222, 1.621998, -0.1739005, 1, 0.8941177, 0, 1,
-0.977855, 1.936625, -1.3974, 1, 0.8980392, 0, 1,
-0.9724109, -0.9721907, -0.7906619, 1, 0.9058824, 0, 1,
-0.9715763, 0.9796156, -0.1147542, 1, 0.9137255, 0, 1,
-0.9632839, -0.06415698, -2.222428, 1, 0.9176471, 0, 1,
-0.9583482, -0.1599918, -2.281302, 1, 0.9254902, 0, 1,
-0.9526691, -1.169877, -2.364809, 1, 0.9294118, 0, 1,
-0.9494639, 1.044897, -2.03545, 1, 0.9372549, 0, 1,
-0.9460741, -0.6854935, -5.581813, 1, 0.9411765, 0, 1,
-0.9448966, 1.672265, -0.5180343, 1, 0.9490196, 0, 1,
-0.9447125, -0.24198, -1.166867, 1, 0.9529412, 0, 1,
-0.9424475, 0.1988993, -1.327051, 1, 0.9607843, 0, 1,
-0.9387166, -0.03206227, -1.44818, 1, 0.9647059, 0, 1,
-0.9289741, -0.6124248, -2.618443, 1, 0.972549, 0, 1,
-0.9140471, -0.5450896, -1.196479, 1, 0.9764706, 0, 1,
-0.9108318, -2.290637, -2.703664, 1, 0.9843137, 0, 1,
-0.9045707, 0.4858359, -0.3201422, 1, 0.9882353, 0, 1,
-0.9036874, -0.7155998, 0.4691648, 1, 0.9960784, 0, 1,
-0.898051, -0.4276004, -1.425845, 0.9960784, 1, 0, 1,
-0.8945754, -0.2201365, -2.867298, 0.9921569, 1, 0, 1,
-0.8929101, -0.7525637, -1.518598, 0.9843137, 1, 0, 1,
-0.8911627, 0.3861187, -2.104252, 0.9803922, 1, 0, 1,
-0.8890552, -1.226824, -1.169786, 0.972549, 1, 0, 1,
-0.8867973, 1.889515, -0.5455875, 0.9686275, 1, 0, 1,
-0.8854815, -0.2447845, -2.571333, 0.9607843, 1, 0, 1,
-0.8845937, 0.3885854, -1.517034, 0.9568627, 1, 0, 1,
-0.8844385, -0.6780553, -1.115562, 0.9490196, 1, 0, 1,
-0.8817424, -0.8673643, -1.551036, 0.945098, 1, 0, 1,
-0.8815153, 0.4659694, -1.219547, 0.9372549, 1, 0, 1,
-0.8650479, -0.006436317, -1.11403, 0.9333333, 1, 0, 1,
-0.8526101, 0.4979565, -1.486143, 0.9254902, 1, 0, 1,
-0.8501475, -0.3295538, -2.683364, 0.9215686, 1, 0, 1,
-0.8465272, 0.1274922, -2.565413, 0.9137255, 1, 0, 1,
-0.8442867, -0.3299357, -2.909548, 0.9098039, 1, 0, 1,
-0.8417616, 0.8215261, -1.088959, 0.9019608, 1, 0, 1,
-0.8402742, 1.000248, -0.8973435, 0.8941177, 1, 0, 1,
-0.8384382, -0.6309525, -2.008588, 0.8901961, 1, 0, 1,
-0.8362291, 0.6373495, -0.3264632, 0.8823529, 1, 0, 1,
-0.8235297, -1.609614, -2.149847, 0.8784314, 1, 0, 1,
-0.8233875, -0.8147261, -2.255012, 0.8705882, 1, 0, 1,
-0.8214563, 0.2762071, -0.8244374, 0.8666667, 1, 0, 1,
-0.8211773, 0.7838809, -2.296082, 0.8588235, 1, 0, 1,
-0.816138, 0.348519, -4.279524, 0.854902, 1, 0, 1,
-0.8153955, 0.2718598, -2.535193, 0.8470588, 1, 0, 1,
-0.8140253, -0.4866452, -4.12425, 0.8431373, 1, 0, 1,
-0.8093962, -0.5732512, -2.101383, 0.8352941, 1, 0, 1,
-0.8083671, -0.684261, -1.114763, 0.8313726, 1, 0, 1,
-0.8047386, -1.207638, -2.231528, 0.8235294, 1, 0, 1,
-0.8031307, -0.8913735, -2.194107, 0.8196079, 1, 0, 1,
-0.7970436, 0.7849842, -0.8475786, 0.8117647, 1, 0, 1,
-0.7922825, -0.06337019, -2.279854, 0.8078431, 1, 0, 1,
-0.7904255, 0.8621667, -1.204767, 0.8, 1, 0, 1,
-0.7837279, 0.7946497, 2.569113, 0.7921569, 1, 0, 1,
-0.7812168, -1.047909, -2.348032, 0.7882353, 1, 0, 1,
-0.7778898, -0.2718192, -1.032216, 0.7803922, 1, 0, 1,
-0.7770936, 1.407555, -0.7683039, 0.7764706, 1, 0, 1,
-0.7750475, -0.3563696, -1.235706, 0.7686275, 1, 0, 1,
-0.7741802, -0.6955878, -1.925589, 0.7647059, 1, 0, 1,
-0.7733971, 0.06610078, -1.89938, 0.7568628, 1, 0, 1,
-0.7706121, -0.9927453, -2.211407, 0.7529412, 1, 0, 1,
-0.7654608, 0.1235606, -0.5301296, 0.7450981, 1, 0, 1,
-0.7639024, -0.3744946, -2.582002, 0.7411765, 1, 0, 1,
-0.7617351, -0.2499471, -1.520678, 0.7333333, 1, 0, 1,
-0.7612569, 1.339571, -0.8913797, 0.7294118, 1, 0, 1,
-0.7582946, 0.7015083, -1.989948, 0.7215686, 1, 0, 1,
-0.7566593, -0.2216565, -3.571776, 0.7176471, 1, 0, 1,
-0.7546912, -1.011528, -2.298015, 0.7098039, 1, 0, 1,
-0.7542117, 0.2796496, -0.6564449, 0.7058824, 1, 0, 1,
-0.7523091, 0.9606027, 0.09127393, 0.6980392, 1, 0, 1,
-0.7447984, 0.8501453, -1.244609, 0.6901961, 1, 0, 1,
-0.7432081, -0.8122217, -2.994664, 0.6862745, 1, 0, 1,
-0.7375451, 0.0889442, -1.71498, 0.6784314, 1, 0, 1,
-0.736022, 0.5455571, -1.291061, 0.6745098, 1, 0, 1,
-0.7283964, -0.05024035, -1.486728, 0.6666667, 1, 0, 1,
-0.7262948, -1.069367, -1.593342, 0.6627451, 1, 0, 1,
-0.723304, -1.574573, -3.726268, 0.654902, 1, 0, 1,
-0.7230122, -0.1582966, -2.93661, 0.6509804, 1, 0, 1,
-0.7158589, 0.7385232, 0.1133537, 0.6431373, 1, 0, 1,
-0.7137011, 0.4361269, -1.825179, 0.6392157, 1, 0, 1,
-0.711898, -0.7090564, -4.030478, 0.6313726, 1, 0, 1,
-0.7115951, 0.2603854, -1.388353, 0.627451, 1, 0, 1,
-0.7095008, -0.6460605, -3.021976, 0.6196079, 1, 0, 1,
-0.7053156, 0.4428239, -1.216512, 0.6156863, 1, 0, 1,
-0.7045197, -0.3855422, -1.84115, 0.6078432, 1, 0, 1,
-0.7028981, -0.9275534, -4.14038, 0.6039216, 1, 0, 1,
-0.7001144, 0.7411531, -1.24916, 0.5960785, 1, 0, 1,
-0.6988652, -1.011784, -3.066456, 0.5882353, 1, 0, 1,
-0.6913223, 1.169228, 2.234013, 0.5843138, 1, 0, 1,
-0.6871021, -1.138481, -5.559945, 0.5764706, 1, 0, 1,
-0.6815302, -1.429767, -2.021292, 0.572549, 1, 0, 1,
-0.6761731, -1.189548, -3.015208, 0.5647059, 1, 0, 1,
-0.674016, -0.923467, -3.058434, 0.5607843, 1, 0, 1,
-0.6739579, 0.5090607, -0.4657338, 0.5529412, 1, 0, 1,
-0.6737928, 0.9612923, -1.772063, 0.5490196, 1, 0, 1,
-0.664457, -0.4617422, -1.758934, 0.5411765, 1, 0, 1,
-0.6640434, 0.5806985, -2.479204, 0.5372549, 1, 0, 1,
-0.6631631, -0.07099687, -1.080306, 0.5294118, 1, 0, 1,
-0.6593269, 0.03471261, -2.14089, 0.5254902, 1, 0, 1,
-0.6575223, 1.21187, 0.6844056, 0.5176471, 1, 0, 1,
-0.6528753, -0.133782, -3.550806, 0.5137255, 1, 0, 1,
-0.6520114, -0.4911145, -3.808886, 0.5058824, 1, 0, 1,
-0.6502053, 0.03879585, -2.743403, 0.5019608, 1, 0, 1,
-0.6473327, -3.020024, -2.399274, 0.4941176, 1, 0, 1,
-0.6439365, -1.261482, -1.618267, 0.4862745, 1, 0, 1,
-0.6375551, 0.3079946, -0.2069082, 0.4823529, 1, 0, 1,
-0.6322315, -1.264907, -2.078805, 0.4745098, 1, 0, 1,
-0.6280154, -0.5434391, -2.31223, 0.4705882, 1, 0, 1,
-0.6263899, -0.2687027, -1.691206, 0.4627451, 1, 0, 1,
-0.6261603, 0.08353336, -3.035075, 0.4588235, 1, 0, 1,
-0.6233341, -1.374823, -2.973116, 0.4509804, 1, 0, 1,
-0.6180323, -0.3076445, -2.228822, 0.4470588, 1, 0, 1,
-0.6172307, 0.4650125, -1.922577, 0.4392157, 1, 0, 1,
-0.6098966, -1.577305, -1.237428, 0.4352941, 1, 0, 1,
-0.6071759, -0.2028482, -3.506063, 0.427451, 1, 0, 1,
-0.6071754, 0.6462492, -2.828168, 0.4235294, 1, 0, 1,
-0.606582, -1.301789, -2.30891, 0.4156863, 1, 0, 1,
-0.6065235, 0.1190375, -1.672881, 0.4117647, 1, 0, 1,
-0.6053918, -0.3207179, -3.757801, 0.4039216, 1, 0, 1,
-0.6023796, -0.09143996, -3.061936, 0.3960784, 1, 0, 1,
-0.5991876, 0.5357586, 0.5248657, 0.3921569, 1, 0, 1,
-0.5990568, 0.0486333, -0.8749446, 0.3843137, 1, 0, 1,
-0.5953135, -0.6076019, -3.24633, 0.3803922, 1, 0, 1,
-0.5949453, -0.445538, -2.349196, 0.372549, 1, 0, 1,
-0.5935967, 0.3719502, -0.7103376, 0.3686275, 1, 0, 1,
-0.5919308, 0.6055368, -0.46878, 0.3607843, 1, 0, 1,
-0.5902653, -2.426415, -1.984902, 0.3568628, 1, 0, 1,
-0.5900776, -1.223125, -3.026443, 0.3490196, 1, 0, 1,
-0.5899179, 2.086335, 0.6107232, 0.345098, 1, 0, 1,
-0.589811, -1.270413, -2.329111, 0.3372549, 1, 0, 1,
-0.587535, -0.4189589, -1.554295, 0.3333333, 1, 0, 1,
-0.5798159, -1.257069, -3.045233, 0.3254902, 1, 0, 1,
-0.57445, -0.7590065, -3.090986, 0.3215686, 1, 0, 1,
-0.5681667, -1.247638, -2.064542, 0.3137255, 1, 0, 1,
-0.5650189, -0.03432275, -2.275809, 0.3098039, 1, 0, 1,
-0.5642018, 0.3555346, 0.3280739, 0.3019608, 1, 0, 1,
-0.5555909, -0.5693325, 0.001249417, 0.2941177, 1, 0, 1,
-0.5469478, -0.5346551, -2.419114, 0.2901961, 1, 0, 1,
-0.5418394, 0.840893, -0.9480533, 0.282353, 1, 0, 1,
-0.5402758, 1.812524, -0.5317246, 0.2784314, 1, 0, 1,
-0.5363512, 1.185805, -0.7525474, 0.2705882, 1, 0, 1,
-0.5352753, -0.02667482, -2.90796, 0.2666667, 1, 0, 1,
-0.5346277, 0.6954498, -2.267845, 0.2588235, 1, 0, 1,
-0.5322414, -0.4770398, -1.736379, 0.254902, 1, 0, 1,
-0.527007, -2.984459, -2.360745, 0.2470588, 1, 0, 1,
-0.5259627, 0.2199269, -0.5944097, 0.2431373, 1, 0, 1,
-0.5250834, -1.589619, -3.414144, 0.2352941, 1, 0, 1,
-0.5210438, -0.760291, -0.01135075, 0.2313726, 1, 0, 1,
-0.5196922, -0.720176, -3.579433, 0.2235294, 1, 0, 1,
-0.5178283, -1.510167, -4.010506, 0.2196078, 1, 0, 1,
-0.5118639, 0.4170465, -0.8016649, 0.2117647, 1, 0, 1,
-0.5051148, 0.3668141, -1.933817, 0.2078431, 1, 0, 1,
-0.5015856, -0.2026511, -1.332871, 0.2, 1, 0, 1,
-0.4994255, -1.738387, -3.727958, 0.1921569, 1, 0, 1,
-0.4994142, 2.130057, 0.4188865, 0.1882353, 1, 0, 1,
-0.4958073, -0.4097815, -1.866099, 0.1803922, 1, 0, 1,
-0.493266, -0.7634986, -2.809292, 0.1764706, 1, 0, 1,
-0.492252, -0.005532789, -1.952147, 0.1686275, 1, 0, 1,
-0.4891807, -1.623475, -4.809816, 0.1647059, 1, 0, 1,
-0.4888963, -0.4879539, -2.274176, 0.1568628, 1, 0, 1,
-0.4888175, 0.299976, -1.438268, 0.1529412, 1, 0, 1,
-0.4861341, -0.04278742, -1.620261, 0.145098, 1, 0, 1,
-0.4812364, 0.1232025, -0.1960216, 0.1411765, 1, 0, 1,
-0.4779037, -0.5885145, -3.596135, 0.1333333, 1, 0, 1,
-0.4772003, 0.01762471, -2.145942, 0.1294118, 1, 0, 1,
-0.4756462, -0.9403523, -1.685782, 0.1215686, 1, 0, 1,
-0.4705693, -0.4112858, -0.967622, 0.1176471, 1, 0, 1,
-0.4595073, -1.072224, -3.125953, 0.1098039, 1, 0, 1,
-0.4591385, 0.2263701, 0.7167436, 0.1058824, 1, 0, 1,
-0.4580393, -1.672858, -3.648999, 0.09803922, 1, 0, 1,
-0.4578779, 0.2213792, -1.585156, 0.09019608, 1, 0, 1,
-0.4524993, 1.692602, -0.2225611, 0.08627451, 1, 0, 1,
-0.4502917, -0.7075208, -1.610446, 0.07843138, 1, 0, 1,
-0.4462202, 1.690858, 0.3786337, 0.07450981, 1, 0, 1,
-0.4455748, -0.8360944, -2.869372, 0.06666667, 1, 0, 1,
-0.4445038, 0.05820125, -1.712942, 0.0627451, 1, 0, 1,
-0.4413479, -0.489608, -1.734847, 0.05490196, 1, 0, 1,
-0.440973, -1.757021, -0.3343261, 0.05098039, 1, 0, 1,
-0.4363956, 0.2779909, -1.572361, 0.04313726, 1, 0, 1,
-0.435984, 1.723388, 0.3581352, 0.03921569, 1, 0, 1,
-0.4351501, -0.3292413, -2.243437, 0.03137255, 1, 0, 1,
-0.4349738, 0.6120925, 1.058398, 0.02745098, 1, 0, 1,
-0.430569, 0.3230298, -1.27791, 0.01960784, 1, 0, 1,
-0.4299045, 0.7859579, -1.470465, 0.01568628, 1, 0, 1,
-0.4208618, -0.1008263, -3.100831, 0.007843138, 1, 0, 1,
-0.4202073, 1.717054, -0.657734, 0.003921569, 1, 0, 1,
-0.4163089, 1.47193, -1.337058, 0, 1, 0.003921569, 1,
-0.4149051, 1.147543, -1.968323, 0, 1, 0.01176471, 1,
-0.4090745, 1.09603, -0.2685042, 0, 1, 0.01568628, 1,
-0.4081401, -0.1660474, -1.851713, 0, 1, 0.02352941, 1,
-0.4026702, -1.169487, -2.605757, 0, 1, 0.02745098, 1,
-0.3968286, 1.709824, -0.09802661, 0, 1, 0.03529412, 1,
-0.3960584, -0.1191926, 0.06214356, 0, 1, 0.03921569, 1,
-0.3948227, 1.090411, -1.115305, 0, 1, 0.04705882, 1,
-0.3915208, 1.303498, -2.177722, 0, 1, 0.05098039, 1,
-0.3887657, 1.435547, -2.281756, 0, 1, 0.05882353, 1,
-0.3846757, -0.1149016, -1.410555, 0, 1, 0.0627451, 1,
-0.3838489, -2.127043, -3.028308, 0, 1, 0.07058824, 1,
-0.3835238, 1.396731, 0.1176907, 0, 1, 0.07450981, 1,
-0.3770669, 0.3075944, -0.6452023, 0, 1, 0.08235294, 1,
-0.3767897, 1.090104, -0.2182839, 0, 1, 0.08627451, 1,
-0.3758152, -1.036351, -3.686303, 0, 1, 0.09411765, 1,
-0.3737657, 1.382502, -1.782464, 0, 1, 0.1019608, 1,
-0.373027, 0.2406636, -1.14156, 0, 1, 0.1058824, 1,
-0.3712666, -0.4652371, -2.527256, 0, 1, 0.1137255, 1,
-0.357373, 0.3892898, -0.5772863, 0, 1, 0.1176471, 1,
-0.3549897, 0.8216661, -0.5255575, 0, 1, 0.1254902, 1,
-0.3529275, 0.1644875, -0.296383, 0, 1, 0.1294118, 1,
-0.3524808, -1.444432, -4.318669, 0, 1, 0.1372549, 1,
-0.3502241, 2.149992, -1.290866, 0, 1, 0.1411765, 1,
-0.3486173, -0.06360271, -1.063172, 0, 1, 0.1490196, 1,
-0.3482434, 0.1773656, -1.022899, 0, 1, 0.1529412, 1,
-0.3464808, -0.02662879, -0.6121101, 0, 1, 0.1607843, 1,
-0.3456925, -0.6196878, -2.428399, 0, 1, 0.1647059, 1,
-0.3369515, -1.757609, -1.054087, 0, 1, 0.172549, 1,
-0.3330339, 1.354109, 1.070687, 0, 1, 0.1764706, 1,
-0.330763, 1.746703, 0.1870436, 0, 1, 0.1843137, 1,
-0.3303967, 0.02004736, -1.033459, 0, 1, 0.1882353, 1,
-0.3291664, -1.69097, -3.122371, 0, 1, 0.1960784, 1,
-0.3289981, 1.279671, 0.4346313, 0, 1, 0.2039216, 1,
-0.3259562, 1.268715, -0.5501536, 0, 1, 0.2078431, 1,
-0.3256061, 0.3215536, -0.4415671, 0, 1, 0.2156863, 1,
-0.3239416, -0.1505842, -1.148295, 0, 1, 0.2196078, 1,
-0.3237668, -0.8252607, -2.410113, 0, 1, 0.227451, 1,
-0.317182, -0.6347269, -2.958996, 0, 1, 0.2313726, 1,
-0.3149195, -0.299702, -3.391363, 0, 1, 0.2392157, 1,
-0.3129918, 0.8615404, -0.7340348, 0, 1, 0.2431373, 1,
-0.3127485, -2.241147, -2.253292, 0, 1, 0.2509804, 1,
-0.3126083, -0.4130118, -0.7418486, 0, 1, 0.254902, 1,
-0.3072509, 1.508867, 1.012573, 0, 1, 0.2627451, 1,
-0.307084, -2.036094, -3.478832, 0, 1, 0.2666667, 1,
-0.3023346, 1.35029, 0.1667744, 0, 1, 0.2745098, 1,
-0.3016222, 0.784933, -0.6019557, 0, 1, 0.2784314, 1,
-0.2965104, 1.340764, -1.509657, 0, 1, 0.2862745, 1,
-0.2950545, 1.1711, -0.1797679, 0, 1, 0.2901961, 1,
-0.2788339, 1.077871, -0.1083547, 0, 1, 0.2980392, 1,
-0.275386, -0.02440308, -3.15312, 0, 1, 0.3058824, 1,
-0.2746222, 0.06713954, -2.159225, 0, 1, 0.3098039, 1,
-0.2672983, -0.3096732, -1.694741, 0, 1, 0.3176471, 1,
-0.2663385, -0.08987486, -0.6484779, 0, 1, 0.3215686, 1,
-0.2648598, 0.1243567, -1.338324, 0, 1, 0.3294118, 1,
-0.2584379, -1.588686, -3.634555, 0, 1, 0.3333333, 1,
-0.2583309, 1.501869, -0.6647673, 0, 1, 0.3411765, 1,
-0.2581713, -1.054332, -1.979292, 0, 1, 0.345098, 1,
-0.2544492, 0.3452274, -0.9753487, 0, 1, 0.3529412, 1,
-0.2481598, 0.2296272, -1.079717, 0, 1, 0.3568628, 1,
-0.2476705, 0.5869212, -0.8013404, 0, 1, 0.3647059, 1,
-0.2454704, 0.552153, -0.1125328, 0, 1, 0.3686275, 1,
-0.2433805, -0.2910633, -4.439065, 0, 1, 0.3764706, 1,
-0.2432489, -0.2588102, -1.970237, 0, 1, 0.3803922, 1,
-0.2421693, -1.15509, -2.281528, 0, 1, 0.3882353, 1,
-0.2410337, 0.1738531, 0.4779079, 0, 1, 0.3921569, 1,
-0.2405657, -0.6377692, -2.147782, 0, 1, 0.4, 1,
-0.2396205, 1.448636, 0.01766377, 0, 1, 0.4078431, 1,
-0.2281531, 0.9590307, 1.845007, 0, 1, 0.4117647, 1,
-0.2273359, -0.8929205, -2.261434, 0, 1, 0.4196078, 1,
-0.2256057, -0.08274372, -1.65868, 0, 1, 0.4235294, 1,
-0.2251921, 2.130808, 0.9936352, 0, 1, 0.4313726, 1,
-0.2247265, 0.8993221, -2.051485, 0, 1, 0.4352941, 1,
-0.2210384, -1.251901, -2.762172, 0, 1, 0.4431373, 1,
-0.2167794, 1.367239, 0.2136554, 0, 1, 0.4470588, 1,
-0.212516, 0.6466427, 0.2006119, 0, 1, 0.454902, 1,
-0.2104254, -0.1165926, -2.977736, 0, 1, 0.4588235, 1,
-0.2084802, 0.8487328, -0.3322397, 0, 1, 0.4666667, 1,
-0.2082603, 0.3360143, 0.2311502, 0, 1, 0.4705882, 1,
-0.2064812, 0.8556257, 1.032061, 0, 1, 0.4784314, 1,
-0.2060483, 0.3003275, -0.8681598, 0, 1, 0.4823529, 1,
-0.2043785, -0.5350414, -2.306784, 0, 1, 0.4901961, 1,
-0.2032968, -0.394201, -3.650733, 0, 1, 0.4941176, 1,
-0.2011705, -1.312121, -0.6356156, 0, 1, 0.5019608, 1,
-0.199279, 1.054658, -0.4729486, 0, 1, 0.509804, 1,
-0.1935242, 0.2374701, -0.77931, 0, 1, 0.5137255, 1,
-0.1934458, 0.2350131, -2.511142, 0, 1, 0.5215687, 1,
-0.1930773, 1.031239, -0.6985294, 0, 1, 0.5254902, 1,
-0.1923758, -0.1883406, -1.203537, 0, 1, 0.5333334, 1,
-0.1893584, 0.1505453, -0.6549928, 0, 1, 0.5372549, 1,
-0.1872415, 0.1094129, -1.603744, 0, 1, 0.5450981, 1,
-0.1821471, -1.333039, -3.193541, 0, 1, 0.5490196, 1,
-0.1783547, -1.047932, -3.151166, 0, 1, 0.5568628, 1,
-0.1692989, 0.6989844, -1.383998, 0, 1, 0.5607843, 1,
-0.1665205, -1.411872, -3.579634, 0, 1, 0.5686275, 1,
-0.1611313, -0.1271306, -4.086852, 0, 1, 0.572549, 1,
-0.1583585, -0.2409909, -2.879183, 0, 1, 0.5803922, 1,
-0.1576714, 0.2859429, 0.2349971, 0, 1, 0.5843138, 1,
-0.1546938, 0.4208914, -1.382841, 0, 1, 0.5921569, 1,
-0.15455, -1.893729, -1.917625, 0, 1, 0.5960785, 1,
-0.1525437, -2.335645, -1.738969, 0, 1, 0.6039216, 1,
-0.1376799, 0.1993407, -1.245606, 0, 1, 0.6117647, 1,
-0.1336349, -0.171783, -1.990159, 0, 1, 0.6156863, 1,
-0.1303738, 0.5359823, -1.0566, 0, 1, 0.6235294, 1,
-0.1268655, 1.347266, 0.01528957, 0, 1, 0.627451, 1,
-0.1264219, -0.1475357, -1.753929, 0, 1, 0.6352941, 1,
-0.1253981, 1.313979, -0.3047611, 0, 1, 0.6392157, 1,
-0.1243352, 1.936828, -0.9402428, 0, 1, 0.6470588, 1,
-0.1225496, -0.9648961, -4.418193, 0, 1, 0.6509804, 1,
-0.1199556, -0.776655, -3.992162, 0, 1, 0.6588235, 1,
-0.1147808, 0.4249425, -0.6087889, 0, 1, 0.6627451, 1,
-0.1146196, 0.3800596, -0.9963526, 0, 1, 0.6705883, 1,
-0.1130969, 0.2385711, -1.833117, 0, 1, 0.6745098, 1,
-0.1117334, -1.627513, -2.332305, 0, 1, 0.682353, 1,
-0.1073441, -0.5911869, -3.64256, 0, 1, 0.6862745, 1,
-0.1072725, -0.0145681, -1.342193, 0, 1, 0.6941177, 1,
-0.1059845, 1.515883, -0.3602962, 0, 1, 0.7019608, 1,
-0.1032357, -0.7079941, -2.598787, 0, 1, 0.7058824, 1,
-0.1025315, -0.01887477, -3.189737, 0, 1, 0.7137255, 1,
-0.1012409, -0.7317473, -2.068451, 0, 1, 0.7176471, 1,
-0.09986034, -1.245885, -2.441954, 0, 1, 0.7254902, 1,
-0.09849057, -1.405164, -5.526121, 0, 1, 0.7294118, 1,
-0.09625077, -1.2258, -2.080511, 0, 1, 0.7372549, 1,
-0.09575531, 1.262694, -0.3641895, 0, 1, 0.7411765, 1,
-0.09572572, 0.0291546, -1.218749, 0, 1, 0.7490196, 1,
-0.09390181, 0.8760871, 0.3832407, 0, 1, 0.7529412, 1,
-0.09384269, 0.07087235, 1.865635, 0, 1, 0.7607843, 1,
-0.08736425, -0.2690298, -1.780932, 0, 1, 0.7647059, 1,
-0.08588616, -1.898981, -1.625653, 0, 1, 0.772549, 1,
-0.08558757, 0.2590911, -0.9746225, 0, 1, 0.7764706, 1,
-0.08391413, -0.02249862, -2.2573, 0, 1, 0.7843137, 1,
-0.0781988, -1.128308, -2.929569, 0, 1, 0.7882353, 1,
-0.07378975, 0.177539, -1.199643, 0, 1, 0.7960784, 1,
-0.07059075, -0.1815303, -2.011483, 0, 1, 0.8039216, 1,
-0.07037331, 1.351832, -0.7557119, 0, 1, 0.8078431, 1,
-0.06631598, -1.41376, -3.878498, 0, 1, 0.8156863, 1,
-0.06611655, 2.093388, -1.441258, 0, 1, 0.8196079, 1,
-0.06076249, 1.142622, -0.1494415, 0, 1, 0.827451, 1,
-0.055891, -0.3943503, -4.717846, 0, 1, 0.8313726, 1,
-0.05358245, -0.3636208, -2.07286, 0, 1, 0.8392157, 1,
-0.04748257, 1.01383, -0.106072, 0, 1, 0.8431373, 1,
-0.04097532, 0.4109085, 0.09537914, 0, 1, 0.8509804, 1,
-0.03614189, 1.489869, -0.2343365, 0, 1, 0.854902, 1,
-0.03058401, -0.02299985, -1.674936, 0, 1, 0.8627451, 1,
-0.02814298, -0.6376209, -3.851848, 0, 1, 0.8666667, 1,
-0.02616225, -1.202738, -2.331206, 0, 1, 0.8745098, 1,
-0.02504945, 0.4133176, 0.7597193, 0, 1, 0.8784314, 1,
-0.02302621, 0.0722141, 1.374271, 0, 1, 0.8862745, 1,
-0.02024719, 3.162727, 0.1260628, 0, 1, 0.8901961, 1,
-0.01656283, -0.50311, -4.117918, 0, 1, 0.8980392, 1,
-0.0151051, -1.956932, -2.497174, 0, 1, 0.9058824, 1,
-0.01459243, -0.02910964, -3.622443, 0, 1, 0.9098039, 1,
-0.01372133, -0.7046995, -5.584698, 0, 1, 0.9176471, 1,
-0.01022172, 0.8934076, -0.4295197, 0, 1, 0.9215686, 1,
-0.007769927, -1.294442, -2.327399, 0, 1, 0.9294118, 1,
-0.006257173, -1.225376, -3.413471, 0, 1, 0.9333333, 1,
-0.005910278, -0.5185097, -4.88217, 0, 1, 0.9411765, 1,
-0.0005595411, 0.9905206, -0.07581106, 0, 1, 0.945098, 1,
-0.0004795301, 0.1085414, 1.276236, 0, 1, 0.9529412, 1,
-0.0002630104, 2.73467, -2.127724, 0, 1, 0.9568627, 1,
2.079875e-05, -1.622029, 2.256512, 0, 1, 0.9647059, 1,
0.01454882, -1.028411, 1.674486, 0, 1, 0.9686275, 1,
0.01553916, -0.2204645, 5.232275, 0, 1, 0.9764706, 1,
0.01896827, 1.12187, -0.6790417, 0, 1, 0.9803922, 1,
0.01938478, 0.6228278, 2.432702, 0, 1, 0.9882353, 1,
0.02027759, -1.235358, 2.835745, 0, 1, 0.9921569, 1,
0.02109446, -0.4614657, 4.174693, 0, 1, 1, 1,
0.02113584, 0.6020062, -0.3796146, 0, 0.9921569, 1, 1,
0.02201534, 1.134491, 1.784287, 0, 0.9882353, 1, 1,
0.02334527, -0.7744503, 3.232729, 0, 0.9803922, 1, 1,
0.02468511, -0.1628074, 3.638745, 0, 0.9764706, 1, 1,
0.02967282, -0.5383652, 3.67586, 0, 0.9686275, 1, 1,
0.0308338, -0.7056131, 3.725327, 0, 0.9647059, 1, 1,
0.03328088, -0.1273812, 2.958727, 0, 0.9568627, 1, 1,
0.03377692, 1.359676, 0.2721174, 0, 0.9529412, 1, 1,
0.03628153, 0.04517249, 0.4825264, 0, 0.945098, 1, 1,
0.03689733, -0.725989, 2.146525, 0, 0.9411765, 1, 1,
0.03801719, -3.193054, 3.300827, 0, 0.9333333, 1, 1,
0.04051663, -0.9154213, 3.430266, 0, 0.9294118, 1, 1,
0.04405656, -2.394325, 2.322147, 0, 0.9215686, 1, 1,
0.04522648, -0.460493, 1.009164, 0, 0.9176471, 1, 1,
0.04741096, -0.6375472, 1.760524, 0, 0.9098039, 1, 1,
0.04760928, 0.4114237, 1.461763, 0, 0.9058824, 1, 1,
0.04789047, 2.374481, 0.1756794, 0, 0.8980392, 1, 1,
0.0510147, 0.5427391, 0.2802804, 0, 0.8901961, 1, 1,
0.0558056, -1.561596, 5.048185, 0, 0.8862745, 1, 1,
0.05714747, 0.7783799, 0.3571666, 0, 0.8784314, 1, 1,
0.06377008, -1.375701, 3.585252, 0, 0.8745098, 1, 1,
0.06456757, -0.7226782, 3.717936, 0, 0.8666667, 1, 1,
0.06594495, -1.102513, 2.228905, 0, 0.8627451, 1, 1,
0.06664182, -0.01662373, 1.544051, 0, 0.854902, 1, 1,
0.06984694, 0.936892, 0.4777371, 0, 0.8509804, 1, 1,
0.07147039, 0.9593378, 0.2960177, 0, 0.8431373, 1, 1,
0.07454699, -0.2669211, 2.073146, 0, 0.8392157, 1, 1,
0.07550378, -1.065611, 3.080271, 0, 0.8313726, 1, 1,
0.07589716, 0.1544986, 2.16795, 0, 0.827451, 1, 1,
0.08268676, -1.068164, 2.47672, 0, 0.8196079, 1, 1,
0.08279021, -0.5222461, 2.831431, 0, 0.8156863, 1, 1,
0.08537009, 0.9069972, 0.9267629, 0, 0.8078431, 1, 1,
0.09167772, 1.338109, 0.2500229, 0, 0.8039216, 1, 1,
0.09260398, -1.520034, 2.030307, 0, 0.7960784, 1, 1,
0.0941579, -2.215183, 2.294766, 0, 0.7882353, 1, 1,
0.103426, -0.07236331, 2.38518, 0, 0.7843137, 1, 1,
0.1039825, 0.5986035, 0.5199757, 0, 0.7764706, 1, 1,
0.1062029, 0.4532959, 2.329641, 0, 0.772549, 1, 1,
0.1073761, 0.8133523, 0.930708, 0, 0.7647059, 1, 1,
0.1081166, -0.5234423, 3.309346, 0, 0.7607843, 1, 1,
0.1093896, 2.809964, -0.6225691, 0, 0.7529412, 1, 1,
0.1130767, -2.073795, 2.729712, 0, 0.7490196, 1, 1,
0.117208, -0.7532483, 3.267248, 0, 0.7411765, 1, 1,
0.118284, -0.5779437, 2.301101, 0, 0.7372549, 1, 1,
0.1186427, 0.3147116, -1.311231, 0, 0.7294118, 1, 1,
0.1191663, -0.508565, 2.405424, 0, 0.7254902, 1, 1,
0.1261521, -0.17574, 4.099, 0, 0.7176471, 1, 1,
0.1272396, 0.945588, -0.6159783, 0, 0.7137255, 1, 1,
0.1281145, -1.772911, 5.092643, 0, 0.7058824, 1, 1,
0.1333244, 1.078359, 0.08760376, 0, 0.6980392, 1, 1,
0.1357982, 0.1258621, -1.151308, 0, 0.6941177, 1, 1,
0.1361623, -0.8264848, 2.387414, 0, 0.6862745, 1, 1,
0.1380993, -2.370384, 2.08619, 0, 0.682353, 1, 1,
0.1396508, -0.4455574, 3.934974, 0, 0.6745098, 1, 1,
0.1447645, -2.39777, 4.57918, 0, 0.6705883, 1, 1,
0.1454821, -1.051458, 2.157433, 0, 0.6627451, 1, 1,
0.1455852, 1.321528, -0.2342593, 0, 0.6588235, 1, 1,
0.1470663, -0.8592089, 1.640327, 0, 0.6509804, 1, 1,
0.147203, -0.297073, 2.646553, 0, 0.6470588, 1, 1,
0.1476364, -1.101876, 3.208426, 0, 0.6392157, 1, 1,
0.1524622, 0.415408, 2.549479, 0, 0.6352941, 1, 1,
0.1532656, 1.013896, 0.479033, 0, 0.627451, 1, 1,
0.1576359, 0.7380462, 1.186944, 0, 0.6235294, 1, 1,
0.1615543, 1.147107, -0.1606591, 0, 0.6156863, 1, 1,
0.1620103, 1.040978, 0.4245686, 0, 0.6117647, 1, 1,
0.167476, 1.162511, 1.683819, 0, 0.6039216, 1, 1,
0.1685835, -1.353261, 2.502543, 0, 0.5960785, 1, 1,
0.1712377, 0.9520769, -0.6130721, 0, 0.5921569, 1, 1,
0.1718965, 0.4826437, -0.2881742, 0, 0.5843138, 1, 1,
0.174244, -0.8030871, 3.089785, 0, 0.5803922, 1, 1,
0.1797848, -0.9096219, 3.254168, 0, 0.572549, 1, 1,
0.1807496, 1.484887, 0.8322679, 0, 0.5686275, 1, 1,
0.1810942, 1.562758, -1.147092, 0, 0.5607843, 1, 1,
0.1821406, -0.3858094, 2.153792, 0, 0.5568628, 1, 1,
0.1878236, 0.2127765, 0.736155, 0, 0.5490196, 1, 1,
0.188114, 0.8560442, 0.9711068, 0, 0.5450981, 1, 1,
0.189787, -0.3947012, 3.325564, 0, 0.5372549, 1, 1,
0.1900645, -1.369964, 2.50749, 0, 0.5333334, 1, 1,
0.1926163, -0.8067032, 4.598507, 0, 0.5254902, 1, 1,
0.1937743, 0.9037666, 0.4362659, 0, 0.5215687, 1, 1,
0.1995618, 1.437791, 0.8573754, 0, 0.5137255, 1, 1,
0.2013379, -1.303925, 1.698298, 0, 0.509804, 1, 1,
0.2052319, 0.3715084, 0.5800275, 0, 0.5019608, 1, 1,
0.2065963, -0.623413, 3.005538, 0, 0.4941176, 1, 1,
0.2091013, -1.494761, 2.020431, 0, 0.4901961, 1, 1,
0.2092025, 0.7860314, -0.1485874, 0, 0.4823529, 1, 1,
0.2115765, 0.4564588, 1.583242, 0, 0.4784314, 1, 1,
0.2127438, -0.05150582, 0.9132847, 0, 0.4705882, 1, 1,
0.2143931, -1.807765, 3.940043, 0, 0.4666667, 1, 1,
0.2179633, 0.9454151, -0.2427551, 0, 0.4588235, 1, 1,
0.2201318, 1.203778, 0.5668844, 0, 0.454902, 1, 1,
0.2264388, -1.056996, 0.5454748, 0, 0.4470588, 1, 1,
0.2319796, -0.5203379, 1.799372, 0, 0.4431373, 1, 1,
0.2376092, -1.126451, 1.040936, 0, 0.4352941, 1, 1,
0.2396849, -0.1201734, 1.267205, 0, 0.4313726, 1, 1,
0.239976, -0.2766406, 1.995777, 0, 0.4235294, 1, 1,
0.2401421, -0.05064582, 2.058054, 0, 0.4196078, 1, 1,
0.2447653, -0.7710957, 2.503944, 0, 0.4117647, 1, 1,
0.2457596, -0.8696618, 3.479208, 0, 0.4078431, 1, 1,
0.2478462, 0.4351788, 1.835126, 0, 0.4, 1, 1,
0.248251, 0.397725, 1.486814, 0, 0.3921569, 1, 1,
0.2493194, -1.721724, 1.960125, 0, 0.3882353, 1, 1,
0.2503881, -0.2956512, 3.344032, 0, 0.3803922, 1, 1,
0.2521306, -3.262, 4.24277, 0, 0.3764706, 1, 1,
0.2545393, 0.237728, 0.6522117, 0, 0.3686275, 1, 1,
0.254753, -0.5738863, 2.203822, 0, 0.3647059, 1, 1,
0.2554194, -2.619933, 3.462976, 0, 0.3568628, 1, 1,
0.2643579, -0.7469191, 3.441417, 0, 0.3529412, 1, 1,
0.2665699, 0.1520437, 0.2636681, 0, 0.345098, 1, 1,
0.2711645, -1.661381, 4.145696, 0, 0.3411765, 1, 1,
0.2752335, -0.2022036, 1.521965, 0, 0.3333333, 1, 1,
0.2795715, 0.7291864, 1.700474, 0, 0.3294118, 1, 1,
0.2828493, -1.318838, 3.005867, 0, 0.3215686, 1, 1,
0.284961, -0.1000578, 0.7423419, 0, 0.3176471, 1, 1,
0.294159, 1.507939, 0.3166997, 0, 0.3098039, 1, 1,
0.2980494, 0.4597787, 0.4410468, 0, 0.3058824, 1, 1,
0.3018989, 0.6364583, 0.314441, 0, 0.2980392, 1, 1,
0.3020634, 1.866665, -0.4082547, 0, 0.2901961, 1, 1,
0.3021965, 0.01891897, 2.626344, 0, 0.2862745, 1, 1,
0.3070494, -0.2661766, 3.535862, 0, 0.2784314, 1, 1,
0.3146361, -1.974909, 4.115183, 0, 0.2745098, 1, 1,
0.3173529, 0.617319, 0.8206649, 0, 0.2666667, 1, 1,
0.317566, -2.572517, 3.62376, 0, 0.2627451, 1, 1,
0.3188034, -0.7737728, 1.986812, 0, 0.254902, 1, 1,
0.3201262, -0.2231995, 3.009689, 0, 0.2509804, 1, 1,
0.3257778, -0.6438673, 1.489899, 0, 0.2431373, 1, 1,
0.3350059, 1.06901, 0.6564777, 0, 0.2392157, 1, 1,
0.3409504, 0.9359353, -0.2114323, 0, 0.2313726, 1, 1,
0.3463596, 1.914539, 1.182647, 0, 0.227451, 1, 1,
0.3479559, 0.2219719, -1.092129, 0, 0.2196078, 1, 1,
0.3531179, -1.431517, 3.144873, 0, 0.2156863, 1, 1,
0.353597, -1.422109, 2.550281, 0, 0.2078431, 1, 1,
0.3565982, 0.2049352, 1.048836, 0, 0.2039216, 1, 1,
0.3569838, 0.838936, 2.647187, 0, 0.1960784, 1, 1,
0.358773, -0.1856606, 2.820816, 0, 0.1882353, 1, 1,
0.3607475, -1.629183, 4.215652, 0, 0.1843137, 1, 1,
0.3615706, -0.6975068, 4.04634, 0, 0.1764706, 1, 1,
0.3659262, 1.102834, 0.960893, 0, 0.172549, 1, 1,
0.3666586, 0.08125129, 0.09946049, 0, 0.1647059, 1, 1,
0.3694831, 1.024741, -1.158633, 0, 0.1607843, 1, 1,
0.3720439, 0.2172345, 0.3768224, 0, 0.1529412, 1, 1,
0.3769525, 2.313085, 1.0118, 0, 0.1490196, 1, 1,
0.3804565, 1.277174, -0.3341348, 0, 0.1411765, 1, 1,
0.3821882, 0.2042898, 2.984758, 0, 0.1372549, 1, 1,
0.3829434, 0.9830668, -0.4887223, 0, 0.1294118, 1, 1,
0.3885553, 1.310927, -0.3088155, 0, 0.1254902, 1, 1,
0.3923212, 0.8051398, 0.6627309, 0, 0.1176471, 1, 1,
0.3948772, -0.1056393, 2.736136, 0, 0.1137255, 1, 1,
0.3985591, 0.3153286, 1.202859, 0, 0.1058824, 1, 1,
0.4026697, -0.5095559, 2.830091, 0, 0.09803922, 1, 1,
0.4029981, -0.3044215, 2.303071, 0, 0.09411765, 1, 1,
0.403578, -0.3500633, 2.087249, 0, 0.08627451, 1, 1,
0.4071088, -0.5885612, 1.551708, 0, 0.08235294, 1, 1,
0.4115234, -2.165515, 3.942577, 0, 0.07450981, 1, 1,
0.4124137, -1.590277, 3.744442, 0, 0.07058824, 1, 1,
0.4126498, -1.007513, 2.101556, 0, 0.0627451, 1, 1,
0.4148088, -1.807729, 2.258499, 0, 0.05882353, 1, 1,
0.4153906, 0.3472319, 0.1834493, 0, 0.05098039, 1, 1,
0.4157991, 1.621976, -0.6907514, 0, 0.04705882, 1, 1,
0.420866, 0.5212333, 0.1938236, 0, 0.03921569, 1, 1,
0.426814, 1.196962, 1.478861, 0, 0.03529412, 1, 1,
0.4271194, -0.4014875, 3.872561, 0, 0.02745098, 1, 1,
0.428279, 1.996855, 0.5837978, 0, 0.02352941, 1, 1,
0.4292099, -0.8830585, 1.402916, 0, 0.01568628, 1, 1,
0.4323115, 0.7001455, -0.8160938, 0, 0.01176471, 1, 1,
0.4354624, 1.224194, 2.867928, 0, 0.003921569, 1, 1,
0.4369999, 0.790126, 1.013075, 0.003921569, 0, 1, 1,
0.4381697, 0.7665897, -0.296031, 0.007843138, 0, 1, 1,
0.4456557, 1.646564, 1.222271, 0.01568628, 0, 1, 1,
0.4465394, -0.5689163, 3.060859, 0.01960784, 0, 1, 1,
0.4480594, -0.4958884, 3.075884, 0.02745098, 0, 1, 1,
0.4486876, 0.2740913, 2.066188, 0.03137255, 0, 1, 1,
0.4489124, 1.160092, -0.7788678, 0.03921569, 0, 1, 1,
0.4502786, 0.7613251, -0.6761693, 0.04313726, 0, 1, 1,
0.4526622, 1.453091, 2.264767, 0.05098039, 0, 1, 1,
0.4569542, 0.6240643, 0.7798468, 0.05490196, 0, 1, 1,
0.4584303, 0.3817155, 0.765595, 0.0627451, 0, 1, 1,
0.4630836, 0.2796354, 0.9166718, 0.06666667, 0, 1, 1,
0.4657604, -1.137806, 3.546425, 0.07450981, 0, 1, 1,
0.4693899, 1.428453, 0.6700181, 0.07843138, 0, 1, 1,
0.4738238, 0.04942275, 0.978964, 0.08627451, 0, 1, 1,
0.474223, 1.021744, 0.2980709, 0.09019608, 0, 1, 1,
0.4785137, -0.2114154, 3.421089, 0.09803922, 0, 1, 1,
0.4785331, 0.1335572, 0.8283208, 0.1058824, 0, 1, 1,
0.4791509, 1.138932, -1.104271, 0.1098039, 0, 1, 1,
0.4917637, -1.259567, 2.763153, 0.1176471, 0, 1, 1,
0.4968179, -1.764308, 1.071257, 0.1215686, 0, 1, 1,
0.4997446, 2.186792, -0.4703429, 0.1294118, 0, 1, 1,
0.5043739, -0.4289064, 2.824583, 0.1333333, 0, 1, 1,
0.5046828, 1.479324, -0.2756619, 0.1411765, 0, 1, 1,
0.5048956, -0.02445039, 0.6630148, 0.145098, 0, 1, 1,
0.505065, 1.225254, 0.810654, 0.1529412, 0, 1, 1,
0.5061396, 0.6023809, 0.879396, 0.1568628, 0, 1, 1,
0.5097279, 0.3484575, -0.6152527, 0.1647059, 0, 1, 1,
0.5101512, -1.181284, 3.811626, 0.1686275, 0, 1, 1,
0.5127662, -0.4460722, 3.005555, 0.1764706, 0, 1, 1,
0.5153929, 0.278453, 1.087279, 0.1803922, 0, 1, 1,
0.5154753, -0.7131944, 3.195206, 0.1882353, 0, 1, 1,
0.5155075, 0.5934873, 0.7850276, 0.1921569, 0, 1, 1,
0.5203484, -1.175625, 3.882833, 0.2, 0, 1, 1,
0.5215984, -0.6903458, 2.810385, 0.2078431, 0, 1, 1,
0.5219283, 0.7546213, 0.8764843, 0.2117647, 0, 1, 1,
0.5245528, 0.5811772, 0.2726671, 0.2196078, 0, 1, 1,
0.5248899, -1.130908, 1.81691, 0.2235294, 0, 1, 1,
0.5255281, -0.8515472, 2.069321, 0.2313726, 0, 1, 1,
0.5312297, -1.102566, 2.443318, 0.2352941, 0, 1, 1,
0.536361, -0.2203095, 3.010551, 0.2431373, 0, 1, 1,
0.5383679, 0.107645, 0.8644413, 0.2470588, 0, 1, 1,
0.5473814, 0.04078637, 2.37174, 0.254902, 0, 1, 1,
0.5491092, -0.03486477, 3.231824, 0.2588235, 0, 1, 1,
0.5502056, 1.32967, 0.2783326, 0.2666667, 0, 1, 1,
0.5588343, -1.217035, 4.080057, 0.2705882, 0, 1, 1,
0.5588754, 0.2511076, 2.029528, 0.2784314, 0, 1, 1,
0.5606334, -1.004298, 2.444559, 0.282353, 0, 1, 1,
0.561791, -1.700004, 3.559024, 0.2901961, 0, 1, 1,
0.562997, 1.15727, -0.2039248, 0.2941177, 0, 1, 1,
0.565056, 0.709762, 0.7865804, 0.3019608, 0, 1, 1,
0.5655696, 0.4579941, 0.25978, 0.3098039, 0, 1, 1,
0.5667008, 1.205634, -0.4979895, 0.3137255, 0, 1, 1,
0.5699172, 0.8721595, 0.223163, 0.3215686, 0, 1, 1,
0.5726047, 0.1189597, 0.3737625, 0.3254902, 0, 1, 1,
0.5738763, -1.947256, 5.626357, 0.3333333, 0, 1, 1,
0.5740406, 0.1549195, 1.411246, 0.3372549, 0, 1, 1,
0.5762279, 0.03612802, 0.9896601, 0.345098, 0, 1, 1,
0.5841122, -0.7967106, 1.944751, 0.3490196, 0, 1, 1,
0.5842621, 0.1546856, 1.491677, 0.3568628, 0, 1, 1,
0.5863567, 0.007420066, 1.578882, 0.3607843, 0, 1, 1,
0.5863817, 0.4974972, 1.181396, 0.3686275, 0, 1, 1,
0.5910055, -1.486521, 2.225191, 0.372549, 0, 1, 1,
0.5928699, 0.1263133, 0.3655676, 0.3803922, 0, 1, 1,
0.5985631, -0.9860442, 2.223957, 0.3843137, 0, 1, 1,
0.6013307, -2.314621, 4.815282, 0.3921569, 0, 1, 1,
0.6032462, -1.307316, 3.999393, 0.3960784, 0, 1, 1,
0.6053298, 0.6668311, 0.7572184, 0.4039216, 0, 1, 1,
0.6147231, 0.02619708, 0.1566736, 0.4117647, 0, 1, 1,
0.6292272, -0.647541, 2.863597, 0.4156863, 0, 1, 1,
0.6303545, -0.8923403, 2.182125, 0.4235294, 0, 1, 1,
0.6335692, -1.20819, 1.4976, 0.427451, 0, 1, 1,
0.633821, 0.5285551, 1.760408, 0.4352941, 0, 1, 1,
0.6358313, -0.8350977, 2.917757, 0.4392157, 0, 1, 1,
0.6387323, 0.02797943, 0.3030605, 0.4470588, 0, 1, 1,
0.6420147, 0.8083819, -1.29428, 0.4509804, 0, 1, 1,
0.6523345, -1.644882, 1.589301, 0.4588235, 0, 1, 1,
0.6560436, -1.665761, 2.556388, 0.4627451, 0, 1, 1,
0.6695297, -0.5270646, 1.602, 0.4705882, 0, 1, 1,
0.672077, -0.3394333, 2.847702, 0.4745098, 0, 1, 1,
0.6728877, -2.532736, 3.432661, 0.4823529, 0, 1, 1,
0.691446, -0.519503, 3.075691, 0.4862745, 0, 1, 1,
0.707198, 0.7072145, 0.5926877, 0.4941176, 0, 1, 1,
0.7101518, 0.7842996, 0.6417879, 0.5019608, 0, 1, 1,
0.7121985, -0.281978, 0.9104044, 0.5058824, 0, 1, 1,
0.726377, 0.9119752, 0.1987125, 0.5137255, 0, 1, 1,
0.7269223, 0.03869548, 1.005764, 0.5176471, 0, 1, 1,
0.728421, 0.6245709, -0.4802074, 0.5254902, 0, 1, 1,
0.7285655, -0.2194237, 4.076579, 0.5294118, 0, 1, 1,
0.7339377, 1.440213, -0.9541388, 0.5372549, 0, 1, 1,
0.7345632, 1.455789, 0.6966096, 0.5411765, 0, 1, 1,
0.7348226, -0.01361112, 0.5881093, 0.5490196, 0, 1, 1,
0.7365984, -0.6145661, 1.594104, 0.5529412, 0, 1, 1,
0.7423929, 0.7626888, 0.06921104, 0.5607843, 0, 1, 1,
0.7489595, 0.437398, 0.6842589, 0.5647059, 0, 1, 1,
0.7515708, -0.347115, 2.017073, 0.572549, 0, 1, 1,
0.7543522, -0.2327621, 2.033443, 0.5764706, 0, 1, 1,
0.7572701, 1.844005, 0.5777787, 0.5843138, 0, 1, 1,
0.7596821, -0.7517142, 0.8260974, 0.5882353, 0, 1, 1,
0.7604308, 0.9482118, 0.5937424, 0.5960785, 0, 1, 1,
0.7618932, 1.616335, 0.9633473, 0.6039216, 0, 1, 1,
0.7702997, -0.4283116, 1.042856, 0.6078432, 0, 1, 1,
0.7707582, 0.1982959, 0.7882606, 0.6156863, 0, 1, 1,
0.7749604, 0.5569879, 0.4388631, 0.6196079, 0, 1, 1,
0.7755837, 1.128431, 0.5162675, 0.627451, 0, 1, 1,
0.7808868, 0.4684445, 0.5210963, 0.6313726, 0, 1, 1,
0.7817845, -0.6016422, 4.514712, 0.6392157, 0, 1, 1,
0.7853724, 0.2482056, 2.146701, 0.6431373, 0, 1, 1,
0.7888281, -0.6886865, 2.346383, 0.6509804, 0, 1, 1,
0.7894308, -0.05265421, 0.4145064, 0.654902, 0, 1, 1,
0.7914802, 0.3371811, 1.160752, 0.6627451, 0, 1, 1,
0.8018154, 1.551427, 0.816889, 0.6666667, 0, 1, 1,
0.8046942, 1.114393, 0.2509555, 0.6745098, 0, 1, 1,
0.8049935, -1.481256, 2.940656, 0.6784314, 0, 1, 1,
0.8081771, -1.377789, 2.525158, 0.6862745, 0, 1, 1,
0.8093205, -0.9205237, 1.96802, 0.6901961, 0, 1, 1,
0.8097033, -0.002485742, 2.880052, 0.6980392, 0, 1, 1,
0.8097703, 0.1575541, -0.01115789, 0.7058824, 0, 1, 1,
0.8104097, -0.9215915, 2.484348, 0.7098039, 0, 1, 1,
0.8162271, 0.9086528, 0.8910677, 0.7176471, 0, 1, 1,
0.817682, -0.9728479, 2.134577, 0.7215686, 0, 1, 1,
0.8179367, 1.118012, 0.02023919, 0.7294118, 0, 1, 1,
0.8210955, -0.4563516, 2.765941, 0.7333333, 0, 1, 1,
0.8279058, -0.157587, 1.664035, 0.7411765, 0, 1, 1,
0.831123, 1.129447, -1.166636, 0.7450981, 0, 1, 1,
0.8318596, 0.2933024, 1.428631, 0.7529412, 0, 1, 1,
0.8324701, -0.1375558, 1.762852, 0.7568628, 0, 1, 1,
0.8330699, 0.9720002, -1.26637, 0.7647059, 0, 1, 1,
0.8394616, 0.5860163, 1.356533, 0.7686275, 0, 1, 1,
0.8397678, -0.09083978, 2.301984, 0.7764706, 0, 1, 1,
0.8409987, -0.4373839, 2.37651, 0.7803922, 0, 1, 1,
0.8438607, -0.8035083, 0.5937593, 0.7882353, 0, 1, 1,
0.8468614, 0.569241, 0.1055439, 0.7921569, 0, 1, 1,
0.8545518, 0.2449181, -0.2161389, 0.8, 0, 1, 1,
0.8549032, -0.5508648, 2.951672, 0.8078431, 0, 1, 1,
0.8569391, 0.4231234, 1.003709, 0.8117647, 0, 1, 1,
0.8638596, -2.174093, 3.728361, 0.8196079, 0, 1, 1,
0.8673206, -3.911078, 4.183306, 0.8235294, 0, 1, 1,
0.8703751, 0.06585903, 1.806203, 0.8313726, 0, 1, 1,
0.8727236, 0.1256068, 2.294183, 0.8352941, 0, 1, 1,
0.8744569, -0.118776, 1.102977, 0.8431373, 0, 1, 1,
0.883212, 1.199256, -0.7445133, 0.8470588, 0, 1, 1,
0.9029762, 0.961324, 1.288366, 0.854902, 0, 1, 1,
0.9035695, -1.208687, 2.088785, 0.8588235, 0, 1, 1,
0.9037668, -1.911135, 2.322685, 0.8666667, 0, 1, 1,
0.9041298, -1.328928, 2.180154, 0.8705882, 0, 1, 1,
0.906158, 2.020721, 1.524735, 0.8784314, 0, 1, 1,
0.9064475, -1.417561, 2.285303, 0.8823529, 0, 1, 1,
0.9088628, 0.4733976, 2.233606, 0.8901961, 0, 1, 1,
0.9141099, 0.1584532, 1.416078, 0.8941177, 0, 1, 1,
0.9147196, -0.6225961, 1.521344, 0.9019608, 0, 1, 1,
0.9167597, 1.204412, 0.07716592, 0.9098039, 0, 1, 1,
0.9185821, -1.733531, 4.111142, 0.9137255, 0, 1, 1,
0.9208601, 0.5907157, 1.216345, 0.9215686, 0, 1, 1,
0.9237536, -1.49805, 5.450625, 0.9254902, 0, 1, 1,
0.9310387, -0.07564681, 1.558923, 0.9333333, 0, 1, 1,
0.9312688, -0.2564295, -0.2739548, 0.9372549, 0, 1, 1,
0.9340419, -0.1497076, 3.781897, 0.945098, 0, 1, 1,
0.9341235, 1.672337, 0.9652007, 0.9490196, 0, 1, 1,
0.9379095, 0.02588966, 0.6435712, 0.9568627, 0, 1, 1,
0.9402887, -1.737272, 0.2580257, 0.9607843, 0, 1, 1,
0.948561, 0.5221268, 2.088385, 0.9686275, 0, 1, 1,
0.9516717, 0.7375385, 1.449611, 0.972549, 0, 1, 1,
0.9518403, 0.01784827, 1.692559, 0.9803922, 0, 1, 1,
0.952262, 0.02795031, 1.372344, 0.9843137, 0, 1, 1,
0.953447, 0.7916778, 1.261721, 0.9921569, 0, 1, 1,
0.9543903, 1.593302, 1.063591, 0.9960784, 0, 1, 1,
0.9571697, -0.7366505, 2.916943, 1, 0, 0.9960784, 1,
0.9606239, -0.5440195, 0.4503785, 1, 0, 0.9882353, 1,
0.961718, -1.614811, 2.199328, 1, 0, 0.9843137, 1,
0.9620661, -1.22127, 3.614619, 1, 0, 0.9764706, 1,
0.9653793, 1.987839, 1.246498, 1, 0, 0.972549, 1,
0.9660975, -0.05377607, 1.933887, 1, 0, 0.9647059, 1,
0.9663523, -0.09709398, 1.348632, 1, 0, 0.9607843, 1,
0.9691653, 0.07248822, 2.857288, 1, 0, 0.9529412, 1,
0.969632, 1.105353, 0.1627395, 1, 0, 0.9490196, 1,
0.9743356, -0.4033327, 1.180705, 1, 0, 0.9411765, 1,
0.9792401, -1.266771, 2.694674, 1, 0, 0.9372549, 1,
0.9825566, -0.8487417, 1.941452, 1, 0, 0.9294118, 1,
0.9897522, -0.2078039, 1.342991, 1, 0, 0.9254902, 1,
0.9920641, -0.4826372, 0.9595039, 1, 0, 0.9176471, 1,
0.9993714, -0.6768875, 3.311017, 1, 0, 0.9137255, 1,
1.00194, -0.3349038, 1.51985, 1, 0, 0.9058824, 1,
1.011606, -1.626927, 2.631664, 1, 0, 0.9019608, 1,
1.025753, 1.198747, 2.288815, 1, 0, 0.8941177, 1,
1.035109, 1.853863, 2.020152, 1, 0, 0.8862745, 1,
1.037459, -0.3984411, 1.680283, 1, 0, 0.8823529, 1,
1.038135, 0.5778301, 1.062037, 1, 0, 0.8745098, 1,
1.045569, 0.4918352, 0.9621279, 1, 0, 0.8705882, 1,
1.050886, 1.153404, 0.3554802, 1, 0, 0.8627451, 1,
1.053149, 0.05385343, 0.2320497, 1, 0, 0.8588235, 1,
1.057258, -2.394853, 3.593463, 1, 0, 0.8509804, 1,
1.060357, 1.454684, 1.796583, 1, 0, 0.8470588, 1,
1.068714, -0.1696574, 0.4522958, 1, 0, 0.8392157, 1,
1.069456, -0.2872723, 0.7713511, 1, 0, 0.8352941, 1,
1.071489, 1.142057, 1.24895, 1, 0, 0.827451, 1,
1.081768, 0.810579, -0.2393726, 1, 0, 0.8235294, 1,
1.108752, -0.7858316, 0.1444295, 1, 0, 0.8156863, 1,
1.116049, -0.3285144, 2.345951, 1, 0, 0.8117647, 1,
1.116743, 0.844945, 0.09333448, 1, 0, 0.8039216, 1,
1.117391, 0.522688, 1.258463, 1, 0, 0.7960784, 1,
1.12004, 0.4016412, 1.830213, 1, 0, 0.7921569, 1,
1.135672, 1.015139, -1.244095, 1, 0, 0.7843137, 1,
1.135955, -1.103194, 1.895264, 1, 0, 0.7803922, 1,
1.14008, 0.3044153, 1.998392, 1, 0, 0.772549, 1,
1.14052, 2.268207, 1.176911, 1, 0, 0.7686275, 1,
1.144679, 0.3849911, 1.607254, 1, 0, 0.7607843, 1,
1.144997, 0.2934777, 1.503729, 1, 0, 0.7568628, 1,
1.151195, 0.01210695, 2.215998, 1, 0, 0.7490196, 1,
1.151632, -1.169497, 4.797346, 1, 0, 0.7450981, 1,
1.155561, 0.09615669, 0.5748991, 1, 0, 0.7372549, 1,
1.158423, 0.04655305, 1.028327, 1, 0, 0.7333333, 1,
1.16398, 0.6551053, 1.220234, 1, 0, 0.7254902, 1,
1.164014, 0.2855257, 1.304191, 1, 0, 0.7215686, 1,
1.168712, 0.9475574, 1.355079, 1, 0, 0.7137255, 1,
1.179106, -0.1189666, 0.5864894, 1, 0, 0.7098039, 1,
1.182247, -1.560233, 1.584162, 1, 0, 0.7019608, 1,
1.186507, 2.054905, 3.125146, 1, 0, 0.6941177, 1,
1.187009, 0.197073, 0.624072, 1, 0, 0.6901961, 1,
1.188159, -1.343783, 0.3228994, 1, 0, 0.682353, 1,
1.189218, -0.5754953, 1.773968, 1, 0, 0.6784314, 1,
1.190106, 0.1508839, 0.1460638, 1, 0, 0.6705883, 1,
1.205692, -0.3132331, 3.990144, 1, 0, 0.6666667, 1,
1.208025, -0.1599834, 2.863434, 1, 0, 0.6588235, 1,
1.2104, -0.1527467, 1.877652, 1, 0, 0.654902, 1,
1.220598, 0.07802653, 2.058459, 1, 0, 0.6470588, 1,
1.22218, -2.636508, 4.258906, 1, 0, 0.6431373, 1,
1.222922, 2.118428, 0.9360561, 1, 0, 0.6352941, 1,
1.226722, -1.097433, 0.3546776, 1, 0, 0.6313726, 1,
1.227379, 0.4843589, 0.9832588, 1, 0, 0.6235294, 1,
1.235854, 0.2905468, 0.5256601, 1, 0, 0.6196079, 1,
1.240072, -1.096897, 2.794226, 1, 0, 0.6117647, 1,
1.24021, 0.8063031, 0.5650938, 1, 0, 0.6078432, 1,
1.243948, -0.8333288, 1.84222, 1, 0, 0.6, 1,
1.253295, -0.5602274, 2.012593, 1, 0, 0.5921569, 1,
1.261301, -1.200565, 1.093856, 1, 0, 0.5882353, 1,
1.261833, -0.4535163, 2.712839, 1, 0, 0.5803922, 1,
1.262232, 0.319127, 1.979067, 1, 0, 0.5764706, 1,
1.264346, 0.7935615, 1.079637, 1, 0, 0.5686275, 1,
1.281357, -0.3824133, 0.5988691, 1, 0, 0.5647059, 1,
1.281935, -0.8451385, 1.913529, 1, 0, 0.5568628, 1,
1.282389, 0.2248602, 1.059047, 1, 0, 0.5529412, 1,
1.290177, -0.3999143, 1.74074, 1, 0, 0.5450981, 1,
1.291289, 1.376025, 0.5520448, 1, 0, 0.5411765, 1,
1.300563, 0.003113571, 0.8158758, 1, 0, 0.5333334, 1,
1.304101, -2.64754, 3.573304, 1, 0, 0.5294118, 1,
1.304492, 0.06397084, 2.077952, 1, 0, 0.5215687, 1,
1.329969, 1.444568, -0.6661824, 1, 0, 0.5176471, 1,
1.351128, -1.423062, 2.961221, 1, 0, 0.509804, 1,
1.370169, 0.694976, 0.2791689, 1, 0, 0.5058824, 1,
1.383175, -0.4814298, 2.139864, 1, 0, 0.4980392, 1,
1.385855, -0.5596454, 1.241993, 1, 0, 0.4901961, 1,
1.386773, -0.7197027, 1.84186, 1, 0, 0.4862745, 1,
1.395068, 0.02697538, 2.57841, 1, 0, 0.4784314, 1,
1.395124, -0.5151332, 1.661446, 1, 0, 0.4745098, 1,
1.398531, 1.538482, -0.4843436, 1, 0, 0.4666667, 1,
1.401584, -0.2346229, 0.6883496, 1, 0, 0.4627451, 1,
1.411577, 0.8934146, 0.2464574, 1, 0, 0.454902, 1,
1.424135, 0.8162024, 1.466149, 1, 0, 0.4509804, 1,
1.431237, -1.494596, 1.921344, 1, 0, 0.4431373, 1,
1.445016, -0.2301108, 1.406369, 1, 0, 0.4392157, 1,
1.446206, 0.4995801, 1.778959, 1, 0, 0.4313726, 1,
1.457051, 0.8019016, 0.6437998, 1, 0, 0.427451, 1,
1.484324, 0.199124, 0.53783, 1, 0, 0.4196078, 1,
1.485092, -0.7907277, 3.091411, 1, 0, 0.4156863, 1,
1.487276, 0.8285612, 1.248015, 1, 0, 0.4078431, 1,
1.49962, 0.6641935, 2.734258, 1, 0, 0.4039216, 1,
1.510445, -1.742471, 1.859758, 1, 0, 0.3960784, 1,
1.525123, 1.535893, 2.466431, 1, 0, 0.3882353, 1,
1.533479, 1.022951, 0.2358585, 1, 0, 0.3843137, 1,
1.539901, -0.5706679, 2.058515, 1, 0, 0.3764706, 1,
1.545253, -0.9651961, 3.111773, 1, 0, 0.372549, 1,
1.553726, 1.172613, 3.605098, 1, 0, 0.3647059, 1,
1.555829, -0.7269322, 0.9182637, 1, 0, 0.3607843, 1,
1.55863, -0.6779642, 1.65272, 1, 0, 0.3529412, 1,
1.560008, 0.7502355, 0.2211163, 1, 0, 0.3490196, 1,
1.564871, -1.119622, 1.886726, 1, 0, 0.3411765, 1,
1.573077, -1.019847, 2.44768, 1, 0, 0.3372549, 1,
1.574575, 0.6382845, 1.924332, 1, 0, 0.3294118, 1,
1.57642, -0.7770235, 3.170645, 1, 0, 0.3254902, 1,
1.577151, 0.9526712, 2.54498, 1, 0, 0.3176471, 1,
1.629066, -0.9004648, 2.427592, 1, 0, 0.3137255, 1,
1.632349, -0.1206556, 2.276765, 1, 0, 0.3058824, 1,
1.654283, -0.5450014, 1.169377, 1, 0, 0.2980392, 1,
1.65498, 0.4606553, 2.042431, 1, 0, 0.2941177, 1,
1.660792, 0.03234925, 1.219503, 1, 0, 0.2862745, 1,
1.665869, 0.7871382, 0.2396582, 1, 0, 0.282353, 1,
1.699779, -0.1763179, 2.501212, 1, 0, 0.2745098, 1,
1.707505, -0.7224099, 2.760696, 1, 0, 0.2705882, 1,
1.716428, 1.061161, 2.969152, 1, 0, 0.2627451, 1,
1.728932, 1.694637, 1.560887, 1, 0, 0.2588235, 1,
1.75277, -1.104073, 2.649581, 1, 0, 0.2509804, 1,
1.772947, 0.6166109, -0.7935558, 1, 0, 0.2470588, 1,
1.782778, -2.397588, 3.036009, 1, 0, 0.2392157, 1,
1.785128, -0.2922352, 0.8257017, 1, 0, 0.2352941, 1,
1.796923, 1.573186, 1.87395, 1, 0, 0.227451, 1,
1.809766, 1.356923, 3.153767, 1, 0, 0.2235294, 1,
1.8221, -0.1035787, 2.241746, 1, 0, 0.2156863, 1,
1.835958, 1.752285, -0.1216318, 1, 0, 0.2117647, 1,
1.854, 1.461229, 1.184288, 1, 0, 0.2039216, 1,
1.864998, -0.850035, 2.155858, 1, 0, 0.1960784, 1,
1.86934, 0.8021988, 0.666765, 1, 0, 0.1921569, 1,
1.869639, -0.8314017, 2.258688, 1, 0, 0.1843137, 1,
1.875686, 2.088239, -0.966089, 1, 0, 0.1803922, 1,
1.899595, -1.336108, 2.126041, 1, 0, 0.172549, 1,
1.901866, -1.067703, 1.076407, 1, 0, 0.1686275, 1,
1.920026, -0.3568947, 1.368963, 1, 0, 0.1607843, 1,
1.946589, -0.2398395, 1.449748, 1, 0, 0.1568628, 1,
1.964488, 0.005313484, 0.6801001, 1, 0, 0.1490196, 1,
2.005173, 0.06953829, 0.04445292, 1, 0, 0.145098, 1,
2.037517, -0.3015772, 1.6495, 1, 0, 0.1372549, 1,
2.054999, -0.9993849, 0.8297394, 1, 0, 0.1333333, 1,
2.056371, -0.6690068, 1.768458, 1, 0, 0.1254902, 1,
2.077347, 2.519465, 0.7133176, 1, 0, 0.1215686, 1,
2.083503, 1.025266, 2.368894, 1, 0, 0.1137255, 1,
2.086891, 0.2731469, 2.568686, 1, 0, 0.1098039, 1,
2.11501, 1.625809, -0.4015835, 1, 0, 0.1019608, 1,
2.148911, -0.2474266, 1.840667, 1, 0, 0.09411765, 1,
2.199515, -1.257345, 1.992413, 1, 0, 0.09019608, 1,
2.238405, 0.1027276, 2.094424, 1, 0, 0.08235294, 1,
2.262763, -0.3460456, 1.626809, 1, 0, 0.07843138, 1,
2.284286, -1.395798, 2.076905, 1, 0, 0.07058824, 1,
2.334488, -1.497468, 2.457642, 1, 0, 0.06666667, 1,
2.374967, 0.5011286, 0.2894544, 1, 0, 0.05882353, 1,
2.382492, -0.5953996, 0.7207927, 1, 0, 0.05490196, 1,
2.396361, 0.9192575, -0.2167423, 1, 0, 0.04705882, 1,
2.511179, 0.6270605, 2.266889, 1, 0, 0.04313726, 1,
2.665273, -1.204016, 1.81247, 1, 0, 0.03529412, 1,
2.716943, 0.1543235, 0.7407954, 1, 0, 0.03137255, 1,
2.847598, -1.189939, 0.08705352, 1, 0, 0.02352941, 1,
3.078658, -0.9953116, 2.015487, 1, 0, 0.01960784, 1,
3.287915, -0.6616045, 2.282999, 1, 0, 0.01176471, 1,
3.52317, 1.372819, 0.4045941, 1, 0, 0.007843138, 1
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
-0.02202117, -5.110088, -7.484972, 0, -0.5, 0.5, 0.5,
-0.02202117, -5.110088, -7.484972, 1, -0.5, 0.5, 0.5,
-0.02202117, -5.110088, -7.484972, 1, 1.5, 0.5, 0.5,
-0.02202117, -5.110088, -7.484972, 0, 1.5, 0.5, 0.5
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
-4.769032, -0.3741753, -7.484972, 0, -0.5, 0.5, 0.5,
-4.769032, -0.3741753, -7.484972, 1, -0.5, 0.5, 0.5,
-4.769032, -0.3741753, -7.484972, 1, 1.5, 0.5, 0.5,
-4.769032, -0.3741753, -7.484972, 0, 1.5, 0.5, 0.5
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
-4.769032, -5.110088, 0.0208292, 0, -0.5, 0.5, 0.5,
-4.769032, -5.110088, 0.0208292, 1, -0.5, 0.5, 0.5,
-4.769032, -5.110088, 0.0208292, 1, 1.5, 0.5, 0.5,
-4.769032, -5.110088, 0.0208292, 0, 1.5, 0.5, 0.5
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
-2, -4.017185, -5.752864,
2, -4.017185, -5.752864,
-2, -4.017185, -5.752864,
-2, -4.199336, -6.041549,
0, -4.017185, -5.752864,
0, -4.199336, -6.041549,
2, -4.017185, -5.752864,
2, -4.199336, -6.041549
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
-2, -4.563636, -6.618918, 0, -0.5, 0.5, 0.5,
-2, -4.563636, -6.618918, 1, -0.5, 0.5, 0.5,
-2, -4.563636, -6.618918, 1, 1.5, 0.5, 0.5,
-2, -4.563636, -6.618918, 0, 1.5, 0.5, 0.5,
0, -4.563636, -6.618918, 0, -0.5, 0.5, 0.5,
0, -4.563636, -6.618918, 1, -0.5, 0.5, 0.5,
0, -4.563636, -6.618918, 1, 1.5, 0.5, 0.5,
0, -4.563636, -6.618918, 0, 1.5, 0.5, 0.5,
2, -4.563636, -6.618918, 0, -0.5, 0.5, 0.5,
2, -4.563636, -6.618918, 1, -0.5, 0.5, 0.5,
2, -4.563636, -6.618918, 1, 1.5, 0.5, 0.5,
2, -4.563636, -6.618918, 0, 1.5, 0.5, 0.5
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
-3.673568, -2, -5.752864,
-3.673568, 2, -5.752864,
-3.673568, -2, -5.752864,
-3.856145, -2, -6.041549,
-3.673568, 0, -5.752864,
-3.856145, 0, -6.041549,
-3.673568, 2, -5.752864,
-3.856145, 2, -6.041549
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
-4.2213, -2, -6.618918, 0, -0.5, 0.5, 0.5,
-4.2213, -2, -6.618918, 1, -0.5, 0.5, 0.5,
-4.2213, -2, -6.618918, 1, 1.5, 0.5, 0.5,
-4.2213, -2, -6.618918, 0, 1.5, 0.5, 0.5,
-4.2213, 0, -6.618918, 0, -0.5, 0.5, 0.5,
-4.2213, 0, -6.618918, 1, -0.5, 0.5, 0.5,
-4.2213, 0, -6.618918, 1, 1.5, 0.5, 0.5,
-4.2213, 0, -6.618918, 0, 1.5, 0.5, 0.5,
-4.2213, 2, -6.618918, 0, -0.5, 0.5, 0.5,
-4.2213, 2, -6.618918, 1, -0.5, 0.5, 0.5,
-4.2213, 2, -6.618918, 1, 1.5, 0.5, 0.5,
-4.2213, 2, -6.618918, 0, 1.5, 0.5, 0.5
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
-3.673568, -4.017185, -4,
-3.673568, -4.017185, 4,
-3.673568, -4.017185, -4,
-3.856145, -4.199336, -4,
-3.673568, -4.017185, -2,
-3.856145, -4.199336, -2,
-3.673568, -4.017185, 0,
-3.856145, -4.199336, 0,
-3.673568, -4.017185, 2,
-3.856145, -4.199336, 2,
-3.673568, -4.017185, 4,
-3.856145, -4.199336, 4
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
-4.2213, -4.563636, -4, 0, -0.5, 0.5, 0.5,
-4.2213, -4.563636, -4, 1, -0.5, 0.5, 0.5,
-4.2213, -4.563636, -4, 1, 1.5, 0.5, 0.5,
-4.2213, -4.563636, -4, 0, 1.5, 0.5, 0.5,
-4.2213, -4.563636, -2, 0, -0.5, 0.5, 0.5,
-4.2213, -4.563636, -2, 1, -0.5, 0.5, 0.5,
-4.2213, -4.563636, -2, 1, 1.5, 0.5, 0.5,
-4.2213, -4.563636, -2, 0, 1.5, 0.5, 0.5,
-4.2213, -4.563636, 0, 0, -0.5, 0.5, 0.5,
-4.2213, -4.563636, 0, 1, -0.5, 0.5, 0.5,
-4.2213, -4.563636, 0, 1, 1.5, 0.5, 0.5,
-4.2213, -4.563636, 0, 0, 1.5, 0.5, 0.5,
-4.2213, -4.563636, 2, 0, -0.5, 0.5, 0.5,
-4.2213, -4.563636, 2, 1, -0.5, 0.5, 0.5,
-4.2213, -4.563636, 2, 1, 1.5, 0.5, 0.5,
-4.2213, -4.563636, 2, 0, 1.5, 0.5, 0.5,
-4.2213, -4.563636, 4, 0, -0.5, 0.5, 0.5,
-4.2213, -4.563636, 4, 1, -0.5, 0.5, 0.5,
-4.2213, -4.563636, 4, 1, 1.5, 0.5, 0.5,
-4.2213, -4.563636, 4, 0, 1.5, 0.5, 0.5
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
-3.673568, -4.017185, -5.752864,
-3.673568, 3.268834, -5.752864,
-3.673568, -4.017185, 5.794522,
-3.673568, 3.268834, 5.794522,
-3.673568, -4.017185, -5.752864,
-3.673568, -4.017185, 5.794522,
-3.673568, 3.268834, -5.752864,
-3.673568, 3.268834, 5.794522,
-3.673568, -4.017185, -5.752864,
3.629525, -4.017185, -5.752864,
-3.673568, -4.017185, 5.794522,
3.629525, -4.017185, 5.794522,
-3.673568, 3.268834, -5.752864,
3.629525, 3.268834, -5.752864,
-3.673568, 3.268834, 5.794522,
3.629525, 3.268834, 5.794522,
3.629525, -4.017185, -5.752864,
3.629525, 3.268834, -5.752864,
3.629525, -4.017185, 5.794522,
3.629525, 3.268834, 5.794522,
3.629525, -4.017185, -5.752864,
3.629525, -4.017185, 5.794522,
3.629525, 3.268834, -5.752864,
3.629525, 3.268834, 5.794522
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
var radius = 8.268313;
var distance = 36.78666;
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
mvMatrix.translate( 0.02202117, 0.3741753, -0.0208292 );
mvMatrix.scale( 1.22412, 1.226988, 0.7741892 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.78666);
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
Leptophos<-read.table("Leptophos.xyz")
```

```
## Error in read.table("Leptophos.xyz"): no lines available in input
```

```r
x<-Leptophos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Leptophos' not found
```

```r
y<-Leptophos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Leptophos' not found
```

```r
z<-Leptophos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Leptophos' not found
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
-3.567212, -0.3014644, -2.059521, 0, 0, 1, 1, 1,
-3.10815, 0.6635106, -1.554359, 1, 0, 0, 1, 1,
-2.907814, -1.5712, -2.780664, 1, 0, 0, 1, 1,
-2.630433, -2.46668, -3.308234, 1, 0, 0, 1, 1,
-2.53393, -0.01100643, -2.054611, 1, 0, 0, 1, 1,
-2.45313, -0.2535165, -1.974731, 1, 0, 0, 1, 1,
-2.443246, -0.8059528, -3.612537, 0, 0, 0, 1, 1,
-2.433013, 0.6327043, 0.9602208, 0, 0, 0, 1, 1,
-2.421654, 1.610826, -1.995644, 0, 0, 0, 1, 1,
-2.416534, -1.292979, -1.860134, 0, 0, 0, 1, 1,
-2.403178, -0.2588, -1.639233, 0, 0, 0, 1, 1,
-2.372514, 0.03974261, -1.439993, 0, 0, 0, 1, 1,
-2.355185, 0.2045392, -1.564384, 0, 0, 0, 1, 1,
-2.336804, -0.465613, -2.493759, 1, 1, 1, 1, 1,
-2.31794, 1.097747, -2.360784, 1, 1, 1, 1, 1,
-2.293791, 1.059049, -1.024348, 1, 1, 1, 1, 1,
-2.229082, -0.8898379, -3.000897, 1, 1, 1, 1, 1,
-2.195451, 0.1114423, -2.871461, 1, 1, 1, 1, 1,
-2.150261, -0.4274465, -2.186419, 1, 1, 1, 1, 1,
-2.145504, -1.34523, -1.962151, 1, 1, 1, 1, 1,
-2.129105, -0.606643, -1.643636, 1, 1, 1, 1, 1,
-2.111183, -1.346349, -1.989207, 1, 1, 1, 1, 1,
-2.06981, -1.192909, -2.489417, 1, 1, 1, 1, 1,
-2.049824, -0.4809069, -1.95114, 1, 1, 1, 1, 1,
-2.03917, 0.4818343, -0.2753268, 1, 1, 1, 1, 1,
-2.035564, -0.4443271, -1.305941, 1, 1, 1, 1, 1,
-2.032032, 0.98237, -1.878065, 1, 1, 1, 1, 1,
-1.983626, 1.25993, -0.8975436, 1, 1, 1, 1, 1,
-1.95293, 0.5852076, -2.048699, 0, 0, 1, 1, 1,
-1.949285, -0.116459, 0.006970574, 1, 0, 0, 1, 1,
-1.918347, 0.7507025, -0.008426183, 1, 0, 0, 1, 1,
-1.842618, 0.4531183, -2.373473, 1, 0, 0, 1, 1,
-1.810761, 0.05260337, -2.59934, 1, 0, 0, 1, 1,
-1.807423, 1.395269, 0.40941, 1, 0, 0, 1, 1,
-1.798145, 1.100541, -0.1948096, 0, 0, 0, 1, 1,
-1.769799, 3.065391, -1.264065, 0, 0, 0, 1, 1,
-1.740917, -0.9651456, -2.380775, 0, 0, 0, 1, 1,
-1.73635, -0.6854196, -3.227067, 0, 0, 0, 1, 1,
-1.719091, 0.4864059, 0.1519427, 0, 0, 0, 1, 1,
-1.70922, 0.4489271, -1.47175, 0, 0, 0, 1, 1,
-1.686248, 0.2036524, -2.088482, 0, 0, 0, 1, 1,
-1.655728, -0.2515856, -1.907516, 1, 1, 1, 1, 1,
-1.650126, -0.817476, -2.300307, 1, 1, 1, 1, 1,
-1.647638, 0.2336241, -1.062541, 1, 1, 1, 1, 1,
-1.643905, 0.2022247, 0.7133061, 1, 1, 1, 1, 1,
-1.641408, 0.2146402, -1.527977, 1, 1, 1, 1, 1,
-1.638826, -0.1923408, -0.4671509, 1, 1, 1, 1, 1,
-1.63227, -0.5627058, -2.170149, 1, 1, 1, 1, 1,
-1.629448, -0.04479872, -2.617574, 1, 1, 1, 1, 1,
-1.616234, 1.235084, 0.1614106, 1, 1, 1, 1, 1,
-1.609896, -1.118843, -1.722179, 1, 1, 1, 1, 1,
-1.6028, -0.3974821, -0.8909414, 1, 1, 1, 1, 1,
-1.602282, -1.45213, -2.722886, 1, 1, 1, 1, 1,
-1.598328, 0.4447997, -1.26308, 1, 1, 1, 1, 1,
-1.597796, 1.986591, -0.3747887, 1, 1, 1, 1, 1,
-1.592395, 0.6629562, -1.015222, 1, 1, 1, 1, 1,
-1.588124, -1.295467, -3.18533, 0, 0, 1, 1, 1,
-1.571142, -0.5598062, -1.827024, 1, 0, 0, 1, 1,
-1.56824, -0.672299, -2.056793, 1, 0, 0, 1, 1,
-1.536266, -1.052645, -0.4519912, 1, 0, 0, 1, 1,
-1.536163, 0.03011625, -0.8061388, 1, 0, 0, 1, 1,
-1.528794, 0.6927012, -0.7408614, 1, 0, 0, 1, 1,
-1.515906, 0.7720478, -2.45751, 0, 0, 0, 1, 1,
-1.499867, -2.318453, -1.964685, 0, 0, 0, 1, 1,
-1.499225, 0.5475616, -2.000323, 0, 0, 0, 1, 1,
-1.488641, -0.6858732, -0.8827189, 0, 0, 0, 1, 1,
-1.481821, -0.007858642, -1.885339, 0, 0, 0, 1, 1,
-1.480633, 1.784002, -1.420998, 0, 0, 0, 1, 1,
-1.471645, -0.7714939, -2.342959, 0, 0, 0, 1, 1,
-1.468181, -0.6068862, -1.95738, 1, 1, 1, 1, 1,
-1.454447, 0.1651065, -1.636281, 1, 1, 1, 1, 1,
-1.435267, -0.694452, -2.478831, 1, 1, 1, 1, 1,
-1.434423, -0.389888, -3.420929, 1, 1, 1, 1, 1,
-1.433555, 0.1474583, -1.055893, 1, 1, 1, 1, 1,
-1.431796, -1.845103, -1.937281, 1, 1, 1, 1, 1,
-1.431723, -0.305402, -3.345216, 1, 1, 1, 1, 1,
-1.418372, 0.7771211, -1.088155, 1, 1, 1, 1, 1,
-1.402565, -1.488955, -1.523776, 1, 1, 1, 1, 1,
-1.383586, -1.544819, -1.694853, 1, 1, 1, 1, 1,
-1.38351, 1.421035, -1.505724, 1, 1, 1, 1, 1,
-1.382888, -0.5060974, -0.3934489, 1, 1, 1, 1, 1,
-1.360244, 0.4942256, -1.527868, 1, 1, 1, 1, 1,
-1.34715, -1.020477, -2.653313, 1, 1, 1, 1, 1,
-1.337791, 1.77507, -0.9310452, 1, 1, 1, 1, 1,
-1.325102, -0.5376471, -1.18774, 0, 0, 1, 1, 1,
-1.323544, 2.503596, -0.5073913, 1, 0, 0, 1, 1,
-1.319761, 0.4077398, -2.173429, 1, 0, 0, 1, 1,
-1.319724, 0.2752104, -2.462019, 1, 0, 0, 1, 1,
-1.311194, -0.1033747, -2.415861, 1, 0, 0, 1, 1,
-1.300519, -0.1774479, -1.681052, 1, 0, 0, 1, 1,
-1.288932, -1.018678, -3.409657, 0, 0, 0, 1, 1,
-1.287318, 0.9250284, -1.697368, 0, 0, 0, 1, 1,
-1.287272, -1.622547, -1.8664, 0, 0, 0, 1, 1,
-1.273079, 0.5182524, -2.417217, 0, 0, 0, 1, 1,
-1.260136, 1.334799, -0.8231934, 0, 0, 0, 1, 1,
-1.249366, 0.1441379, -2.960269, 0, 0, 0, 1, 1,
-1.249215, 1.3338, -0.137606, 0, 0, 0, 1, 1,
-1.234032, -1.448305, -1.188974, 1, 1, 1, 1, 1,
-1.231984, 0.6351959, 0.007325544, 1, 1, 1, 1, 1,
-1.230349, -0.8700288, -1.88052, 1, 1, 1, 1, 1,
-1.226276, -1.597932, -3.053487, 1, 1, 1, 1, 1,
-1.217139, 1.205596, -1.553262, 1, 1, 1, 1, 1,
-1.207862, 0.3499882, -1.038573, 1, 1, 1, 1, 1,
-1.205102, 0.141523, -0.9566983, 1, 1, 1, 1, 1,
-1.203201, 1.893568, -0.7380171, 1, 1, 1, 1, 1,
-1.20258, -0.5109439, -1.619236, 1, 1, 1, 1, 1,
-1.200074, 0.5194749, -0.8165172, 1, 1, 1, 1, 1,
-1.195672, 0.3266933, 0.3133548, 1, 1, 1, 1, 1,
-1.18001, -0.3643953, -1.994416, 1, 1, 1, 1, 1,
-1.17799, -0.8319614, -0.5059642, 1, 1, 1, 1, 1,
-1.175956, -1.345655, -3.690886, 1, 1, 1, 1, 1,
-1.165501, -0.09039351, -1.569834, 1, 1, 1, 1, 1,
-1.164973, -2.106827, -3.257341, 0, 0, 1, 1, 1,
-1.159647, -1.432154, -2.463963, 1, 0, 0, 1, 1,
-1.152702, -1.767258, -3.990238, 1, 0, 0, 1, 1,
-1.151502, -0.8974919, -1.432021, 1, 0, 0, 1, 1,
-1.148955, -0.8608834, -2.051976, 1, 0, 0, 1, 1,
-1.148102, -1.493727, -2.076581, 1, 0, 0, 1, 1,
-1.146694, 0.7011366, -2.48732, 0, 0, 0, 1, 1,
-1.144838, 1.550389, 0.5767489, 0, 0, 0, 1, 1,
-1.143304, 0.3214501, -1.162392, 0, 0, 0, 1, 1,
-1.137946, -0.4719534, -2.362725, 0, 0, 0, 1, 1,
-1.120675, -0.1188385, -1.428548, 0, 0, 0, 1, 1,
-1.114635, -0.1628822, -2.172715, 0, 0, 0, 1, 1,
-1.1118, -0.478075, -1.903351, 0, 0, 0, 1, 1,
-1.10327, 1.423017, -0.4200933, 1, 1, 1, 1, 1,
-1.099945, -0.2000777, -1.934873, 1, 1, 1, 1, 1,
-1.095481, -0.06071017, -3.662824, 1, 1, 1, 1, 1,
-1.090707, 0.2543684, -1.575742, 1, 1, 1, 1, 1,
-1.088603, 0.2183871, 0.03704672, 1, 1, 1, 1, 1,
-1.082861, -0.3558815, -1.780898, 1, 1, 1, 1, 1,
-1.080487, -2.469755, -2.355133, 1, 1, 1, 1, 1,
-1.072554, -0.1232343, -1.527013, 1, 1, 1, 1, 1,
-1.060934, 0.07086788, -2.987405, 1, 1, 1, 1, 1,
-1.051173, 0.3660412, -1.944085, 1, 1, 1, 1, 1,
-1.045305, -1.62814, -2.918643, 1, 1, 1, 1, 1,
-1.041993, 0.02393809, -1.952508, 1, 1, 1, 1, 1,
-1.041707, 0.602062, -1.189611, 1, 1, 1, 1, 1,
-1.039809, 0.947282, -0.429383, 1, 1, 1, 1, 1,
-1.028543, 0.1923842, -3.085205, 1, 1, 1, 1, 1,
-1.021188, -2.897773, -2.938088, 0, 0, 1, 1, 1,
-1.019134, 1.557663, 0.4895394, 1, 0, 0, 1, 1,
-1.016515, -2.051771, -2.717517, 1, 0, 0, 1, 1,
-1.009665, 1.525977, -0.6447741, 1, 0, 0, 1, 1,
-1.006852, -0.3164193, -1.733381, 1, 0, 0, 1, 1,
-0.9999537, 0.9030101, -0.7443674, 1, 0, 0, 1, 1,
-0.9905515, 1.595864, -0.6595554, 0, 0, 0, 1, 1,
-0.9823221, 0.3111823, -1.729687, 0, 0, 0, 1, 1,
-0.9805341, -2.580093, -2.573974, 0, 0, 0, 1, 1,
-0.980222, 1.621998, -0.1739005, 0, 0, 0, 1, 1,
-0.977855, 1.936625, -1.3974, 0, 0, 0, 1, 1,
-0.9724109, -0.9721907, -0.7906619, 0, 0, 0, 1, 1,
-0.9715763, 0.9796156, -0.1147542, 0, 0, 0, 1, 1,
-0.9632839, -0.06415698, -2.222428, 1, 1, 1, 1, 1,
-0.9583482, -0.1599918, -2.281302, 1, 1, 1, 1, 1,
-0.9526691, -1.169877, -2.364809, 1, 1, 1, 1, 1,
-0.9494639, 1.044897, -2.03545, 1, 1, 1, 1, 1,
-0.9460741, -0.6854935, -5.581813, 1, 1, 1, 1, 1,
-0.9448966, 1.672265, -0.5180343, 1, 1, 1, 1, 1,
-0.9447125, -0.24198, -1.166867, 1, 1, 1, 1, 1,
-0.9424475, 0.1988993, -1.327051, 1, 1, 1, 1, 1,
-0.9387166, -0.03206227, -1.44818, 1, 1, 1, 1, 1,
-0.9289741, -0.6124248, -2.618443, 1, 1, 1, 1, 1,
-0.9140471, -0.5450896, -1.196479, 1, 1, 1, 1, 1,
-0.9108318, -2.290637, -2.703664, 1, 1, 1, 1, 1,
-0.9045707, 0.4858359, -0.3201422, 1, 1, 1, 1, 1,
-0.9036874, -0.7155998, 0.4691648, 1, 1, 1, 1, 1,
-0.898051, -0.4276004, -1.425845, 1, 1, 1, 1, 1,
-0.8945754, -0.2201365, -2.867298, 0, 0, 1, 1, 1,
-0.8929101, -0.7525637, -1.518598, 1, 0, 0, 1, 1,
-0.8911627, 0.3861187, -2.104252, 1, 0, 0, 1, 1,
-0.8890552, -1.226824, -1.169786, 1, 0, 0, 1, 1,
-0.8867973, 1.889515, -0.5455875, 1, 0, 0, 1, 1,
-0.8854815, -0.2447845, -2.571333, 1, 0, 0, 1, 1,
-0.8845937, 0.3885854, -1.517034, 0, 0, 0, 1, 1,
-0.8844385, -0.6780553, -1.115562, 0, 0, 0, 1, 1,
-0.8817424, -0.8673643, -1.551036, 0, 0, 0, 1, 1,
-0.8815153, 0.4659694, -1.219547, 0, 0, 0, 1, 1,
-0.8650479, -0.006436317, -1.11403, 0, 0, 0, 1, 1,
-0.8526101, 0.4979565, -1.486143, 0, 0, 0, 1, 1,
-0.8501475, -0.3295538, -2.683364, 0, 0, 0, 1, 1,
-0.8465272, 0.1274922, -2.565413, 1, 1, 1, 1, 1,
-0.8442867, -0.3299357, -2.909548, 1, 1, 1, 1, 1,
-0.8417616, 0.8215261, -1.088959, 1, 1, 1, 1, 1,
-0.8402742, 1.000248, -0.8973435, 1, 1, 1, 1, 1,
-0.8384382, -0.6309525, -2.008588, 1, 1, 1, 1, 1,
-0.8362291, 0.6373495, -0.3264632, 1, 1, 1, 1, 1,
-0.8235297, -1.609614, -2.149847, 1, 1, 1, 1, 1,
-0.8233875, -0.8147261, -2.255012, 1, 1, 1, 1, 1,
-0.8214563, 0.2762071, -0.8244374, 1, 1, 1, 1, 1,
-0.8211773, 0.7838809, -2.296082, 1, 1, 1, 1, 1,
-0.816138, 0.348519, -4.279524, 1, 1, 1, 1, 1,
-0.8153955, 0.2718598, -2.535193, 1, 1, 1, 1, 1,
-0.8140253, -0.4866452, -4.12425, 1, 1, 1, 1, 1,
-0.8093962, -0.5732512, -2.101383, 1, 1, 1, 1, 1,
-0.8083671, -0.684261, -1.114763, 1, 1, 1, 1, 1,
-0.8047386, -1.207638, -2.231528, 0, 0, 1, 1, 1,
-0.8031307, -0.8913735, -2.194107, 1, 0, 0, 1, 1,
-0.7970436, 0.7849842, -0.8475786, 1, 0, 0, 1, 1,
-0.7922825, -0.06337019, -2.279854, 1, 0, 0, 1, 1,
-0.7904255, 0.8621667, -1.204767, 1, 0, 0, 1, 1,
-0.7837279, 0.7946497, 2.569113, 1, 0, 0, 1, 1,
-0.7812168, -1.047909, -2.348032, 0, 0, 0, 1, 1,
-0.7778898, -0.2718192, -1.032216, 0, 0, 0, 1, 1,
-0.7770936, 1.407555, -0.7683039, 0, 0, 0, 1, 1,
-0.7750475, -0.3563696, -1.235706, 0, 0, 0, 1, 1,
-0.7741802, -0.6955878, -1.925589, 0, 0, 0, 1, 1,
-0.7733971, 0.06610078, -1.89938, 0, 0, 0, 1, 1,
-0.7706121, -0.9927453, -2.211407, 0, 0, 0, 1, 1,
-0.7654608, 0.1235606, -0.5301296, 1, 1, 1, 1, 1,
-0.7639024, -0.3744946, -2.582002, 1, 1, 1, 1, 1,
-0.7617351, -0.2499471, -1.520678, 1, 1, 1, 1, 1,
-0.7612569, 1.339571, -0.8913797, 1, 1, 1, 1, 1,
-0.7582946, 0.7015083, -1.989948, 1, 1, 1, 1, 1,
-0.7566593, -0.2216565, -3.571776, 1, 1, 1, 1, 1,
-0.7546912, -1.011528, -2.298015, 1, 1, 1, 1, 1,
-0.7542117, 0.2796496, -0.6564449, 1, 1, 1, 1, 1,
-0.7523091, 0.9606027, 0.09127393, 1, 1, 1, 1, 1,
-0.7447984, 0.8501453, -1.244609, 1, 1, 1, 1, 1,
-0.7432081, -0.8122217, -2.994664, 1, 1, 1, 1, 1,
-0.7375451, 0.0889442, -1.71498, 1, 1, 1, 1, 1,
-0.736022, 0.5455571, -1.291061, 1, 1, 1, 1, 1,
-0.7283964, -0.05024035, -1.486728, 1, 1, 1, 1, 1,
-0.7262948, -1.069367, -1.593342, 1, 1, 1, 1, 1,
-0.723304, -1.574573, -3.726268, 0, 0, 1, 1, 1,
-0.7230122, -0.1582966, -2.93661, 1, 0, 0, 1, 1,
-0.7158589, 0.7385232, 0.1133537, 1, 0, 0, 1, 1,
-0.7137011, 0.4361269, -1.825179, 1, 0, 0, 1, 1,
-0.711898, -0.7090564, -4.030478, 1, 0, 0, 1, 1,
-0.7115951, 0.2603854, -1.388353, 1, 0, 0, 1, 1,
-0.7095008, -0.6460605, -3.021976, 0, 0, 0, 1, 1,
-0.7053156, 0.4428239, -1.216512, 0, 0, 0, 1, 1,
-0.7045197, -0.3855422, -1.84115, 0, 0, 0, 1, 1,
-0.7028981, -0.9275534, -4.14038, 0, 0, 0, 1, 1,
-0.7001144, 0.7411531, -1.24916, 0, 0, 0, 1, 1,
-0.6988652, -1.011784, -3.066456, 0, 0, 0, 1, 1,
-0.6913223, 1.169228, 2.234013, 0, 0, 0, 1, 1,
-0.6871021, -1.138481, -5.559945, 1, 1, 1, 1, 1,
-0.6815302, -1.429767, -2.021292, 1, 1, 1, 1, 1,
-0.6761731, -1.189548, -3.015208, 1, 1, 1, 1, 1,
-0.674016, -0.923467, -3.058434, 1, 1, 1, 1, 1,
-0.6739579, 0.5090607, -0.4657338, 1, 1, 1, 1, 1,
-0.6737928, 0.9612923, -1.772063, 1, 1, 1, 1, 1,
-0.664457, -0.4617422, -1.758934, 1, 1, 1, 1, 1,
-0.6640434, 0.5806985, -2.479204, 1, 1, 1, 1, 1,
-0.6631631, -0.07099687, -1.080306, 1, 1, 1, 1, 1,
-0.6593269, 0.03471261, -2.14089, 1, 1, 1, 1, 1,
-0.6575223, 1.21187, 0.6844056, 1, 1, 1, 1, 1,
-0.6528753, -0.133782, -3.550806, 1, 1, 1, 1, 1,
-0.6520114, -0.4911145, -3.808886, 1, 1, 1, 1, 1,
-0.6502053, 0.03879585, -2.743403, 1, 1, 1, 1, 1,
-0.6473327, -3.020024, -2.399274, 1, 1, 1, 1, 1,
-0.6439365, -1.261482, -1.618267, 0, 0, 1, 1, 1,
-0.6375551, 0.3079946, -0.2069082, 1, 0, 0, 1, 1,
-0.6322315, -1.264907, -2.078805, 1, 0, 0, 1, 1,
-0.6280154, -0.5434391, -2.31223, 1, 0, 0, 1, 1,
-0.6263899, -0.2687027, -1.691206, 1, 0, 0, 1, 1,
-0.6261603, 0.08353336, -3.035075, 1, 0, 0, 1, 1,
-0.6233341, -1.374823, -2.973116, 0, 0, 0, 1, 1,
-0.6180323, -0.3076445, -2.228822, 0, 0, 0, 1, 1,
-0.6172307, 0.4650125, -1.922577, 0, 0, 0, 1, 1,
-0.6098966, -1.577305, -1.237428, 0, 0, 0, 1, 1,
-0.6071759, -0.2028482, -3.506063, 0, 0, 0, 1, 1,
-0.6071754, 0.6462492, -2.828168, 0, 0, 0, 1, 1,
-0.606582, -1.301789, -2.30891, 0, 0, 0, 1, 1,
-0.6065235, 0.1190375, -1.672881, 1, 1, 1, 1, 1,
-0.6053918, -0.3207179, -3.757801, 1, 1, 1, 1, 1,
-0.6023796, -0.09143996, -3.061936, 1, 1, 1, 1, 1,
-0.5991876, 0.5357586, 0.5248657, 1, 1, 1, 1, 1,
-0.5990568, 0.0486333, -0.8749446, 1, 1, 1, 1, 1,
-0.5953135, -0.6076019, -3.24633, 1, 1, 1, 1, 1,
-0.5949453, -0.445538, -2.349196, 1, 1, 1, 1, 1,
-0.5935967, 0.3719502, -0.7103376, 1, 1, 1, 1, 1,
-0.5919308, 0.6055368, -0.46878, 1, 1, 1, 1, 1,
-0.5902653, -2.426415, -1.984902, 1, 1, 1, 1, 1,
-0.5900776, -1.223125, -3.026443, 1, 1, 1, 1, 1,
-0.5899179, 2.086335, 0.6107232, 1, 1, 1, 1, 1,
-0.589811, -1.270413, -2.329111, 1, 1, 1, 1, 1,
-0.587535, -0.4189589, -1.554295, 1, 1, 1, 1, 1,
-0.5798159, -1.257069, -3.045233, 1, 1, 1, 1, 1,
-0.57445, -0.7590065, -3.090986, 0, 0, 1, 1, 1,
-0.5681667, -1.247638, -2.064542, 1, 0, 0, 1, 1,
-0.5650189, -0.03432275, -2.275809, 1, 0, 0, 1, 1,
-0.5642018, 0.3555346, 0.3280739, 1, 0, 0, 1, 1,
-0.5555909, -0.5693325, 0.001249417, 1, 0, 0, 1, 1,
-0.5469478, -0.5346551, -2.419114, 1, 0, 0, 1, 1,
-0.5418394, 0.840893, -0.9480533, 0, 0, 0, 1, 1,
-0.5402758, 1.812524, -0.5317246, 0, 0, 0, 1, 1,
-0.5363512, 1.185805, -0.7525474, 0, 0, 0, 1, 1,
-0.5352753, -0.02667482, -2.90796, 0, 0, 0, 1, 1,
-0.5346277, 0.6954498, -2.267845, 0, 0, 0, 1, 1,
-0.5322414, -0.4770398, -1.736379, 0, 0, 0, 1, 1,
-0.527007, -2.984459, -2.360745, 0, 0, 0, 1, 1,
-0.5259627, 0.2199269, -0.5944097, 1, 1, 1, 1, 1,
-0.5250834, -1.589619, -3.414144, 1, 1, 1, 1, 1,
-0.5210438, -0.760291, -0.01135075, 1, 1, 1, 1, 1,
-0.5196922, -0.720176, -3.579433, 1, 1, 1, 1, 1,
-0.5178283, -1.510167, -4.010506, 1, 1, 1, 1, 1,
-0.5118639, 0.4170465, -0.8016649, 1, 1, 1, 1, 1,
-0.5051148, 0.3668141, -1.933817, 1, 1, 1, 1, 1,
-0.5015856, -0.2026511, -1.332871, 1, 1, 1, 1, 1,
-0.4994255, -1.738387, -3.727958, 1, 1, 1, 1, 1,
-0.4994142, 2.130057, 0.4188865, 1, 1, 1, 1, 1,
-0.4958073, -0.4097815, -1.866099, 1, 1, 1, 1, 1,
-0.493266, -0.7634986, -2.809292, 1, 1, 1, 1, 1,
-0.492252, -0.005532789, -1.952147, 1, 1, 1, 1, 1,
-0.4891807, -1.623475, -4.809816, 1, 1, 1, 1, 1,
-0.4888963, -0.4879539, -2.274176, 1, 1, 1, 1, 1,
-0.4888175, 0.299976, -1.438268, 0, 0, 1, 1, 1,
-0.4861341, -0.04278742, -1.620261, 1, 0, 0, 1, 1,
-0.4812364, 0.1232025, -0.1960216, 1, 0, 0, 1, 1,
-0.4779037, -0.5885145, -3.596135, 1, 0, 0, 1, 1,
-0.4772003, 0.01762471, -2.145942, 1, 0, 0, 1, 1,
-0.4756462, -0.9403523, -1.685782, 1, 0, 0, 1, 1,
-0.4705693, -0.4112858, -0.967622, 0, 0, 0, 1, 1,
-0.4595073, -1.072224, -3.125953, 0, 0, 0, 1, 1,
-0.4591385, 0.2263701, 0.7167436, 0, 0, 0, 1, 1,
-0.4580393, -1.672858, -3.648999, 0, 0, 0, 1, 1,
-0.4578779, 0.2213792, -1.585156, 0, 0, 0, 1, 1,
-0.4524993, 1.692602, -0.2225611, 0, 0, 0, 1, 1,
-0.4502917, -0.7075208, -1.610446, 0, 0, 0, 1, 1,
-0.4462202, 1.690858, 0.3786337, 1, 1, 1, 1, 1,
-0.4455748, -0.8360944, -2.869372, 1, 1, 1, 1, 1,
-0.4445038, 0.05820125, -1.712942, 1, 1, 1, 1, 1,
-0.4413479, -0.489608, -1.734847, 1, 1, 1, 1, 1,
-0.440973, -1.757021, -0.3343261, 1, 1, 1, 1, 1,
-0.4363956, 0.2779909, -1.572361, 1, 1, 1, 1, 1,
-0.435984, 1.723388, 0.3581352, 1, 1, 1, 1, 1,
-0.4351501, -0.3292413, -2.243437, 1, 1, 1, 1, 1,
-0.4349738, 0.6120925, 1.058398, 1, 1, 1, 1, 1,
-0.430569, 0.3230298, -1.27791, 1, 1, 1, 1, 1,
-0.4299045, 0.7859579, -1.470465, 1, 1, 1, 1, 1,
-0.4208618, -0.1008263, -3.100831, 1, 1, 1, 1, 1,
-0.4202073, 1.717054, -0.657734, 1, 1, 1, 1, 1,
-0.4163089, 1.47193, -1.337058, 1, 1, 1, 1, 1,
-0.4149051, 1.147543, -1.968323, 1, 1, 1, 1, 1,
-0.4090745, 1.09603, -0.2685042, 0, 0, 1, 1, 1,
-0.4081401, -0.1660474, -1.851713, 1, 0, 0, 1, 1,
-0.4026702, -1.169487, -2.605757, 1, 0, 0, 1, 1,
-0.3968286, 1.709824, -0.09802661, 1, 0, 0, 1, 1,
-0.3960584, -0.1191926, 0.06214356, 1, 0, 0, 1, 1,
-0.3948227, 1.090411, -1.115305, 1, 0, 0, 1, 1,
-0.3915208, 1.303498, -2.177722, 0, 0, 0, 1, 1,
-0.3887657, 1.435547, -2.281756, 0, 0, 0, 1, 1,
-0.3846757, -0.1149016, -1.410555, 0, 0, 0, 1, 1,
-0.3838489, -2.127043, -3.028308, 0, 0, 0, 1, 1,
-0.3835238, 1.396731, 0.1176907, 0, 0, 0, 1, 1,
-0.3770669, 0.3075944, -0.6452023, 0, 0, 0, 1, 1,
-0.3767897, 1.090104, -0.2182839, 0, 0, 0, 1, 1,
-0.3758152, -1.036351, -3.686303, 1, 1, 1, 1, 1,
-0.3737657, 1.382502, -1.782464, 1, 1, 1, 1, 1,
-0.373027, 0.2406636, -1.14156, 1, 1, 1, 1, 1,
-0.3712666, -0.4652371, -2.527256, 1, 1, 1, 1, 1,
-0.357373, 0.3892898, -0.5772863, 1, 1, 1, 1, 1,
-0.3549897, 0.8216661, -0.5255575, 1, 1, 1, 1, 1,
-0.3529275, 0.1644875, -0.296383, 1, 1, 1, 1, 1,
-0.3524808, -1.444432, -4.318669, 1, 1, 1, 1, 1,
-0.3502241, 2.149992, -1.290866, 1, 1, 1, 1, 1,
-0.3486173, -0.06360271, -1.063172, 1, 1, 1, 1, 1,
-0.3482434, 0.1773656, -1.022899, 1, 1, 1, 1, 1,
-0.3464808, -0.02662879, -0.6121101, 1, 1, 1, 1, 1,
-0.3456925, -0.6196878, -2.428399, 1, 1, 1, 1, 1,
-0.3369515, -1.757609, -1.054087, 1, 1, 1, 1, 1,
-0.3330339, 1.354109, 1.070687, 1, 1, 1, 1, 1,
-0.330763, 1.746703, 0.1870436, 0, 0, 1, 1, 1,
-0.3303967, 0.02004736, -1.033459, 1, 0, 0, 1, 1,
-0.3291664, -1.69097, -3.122371, 1, 0, 0, 1, 1,
-0.3289981, 1.279671, 0.4346313, 1, 0, 0, 1, 1,
-0.3259562, 1.268715, -0.5501536, 1, 0, 0, 1, 1,
-0.3256061, 0.3215536, -0.4415671, 1, 0, 0, 1, 1,
-0.3239416, -0.1505842, -1.148295, 0, 0, 0, 1, 1,
-0.3237668, -0.8252607, -2.410113, 0, 0, 0, 1, 1,
-0.317182, -0.6347269, -2.958996, 0, 0, 0, 1, 1,
-0.3149195, -0.299702, -3.391363, 0, 0, 0, 1, 1,
-0.3129918, 0.8615404, -0.7340348, 0, 0, 0, 1, 1,
-0.3127485, -2.241147, -2.253292, 0, 0, 0, 1, 1,
-0.3126083, -0.4130118, -0.7418486, 0, 0, 0, 1, 1,
-0.3072509, 1.508867, 1.012573, 1, 1, 1, 1, 1,
-0.307084, -2.036094, -3.478832, 1, 1, 1, 1, 1,
-0.3023346, 1.35029, 0.1667744, 1, 1, 1, 1, 1,
-0.3016222, 0.784933, -0.6019557, 1, 1, 1, 1, 1,
-0.2965104, 1.340764, -1.509657, 1, 1, 1, 1, 1,
-0.2950545, 1.1711, -0.1797679, 1, 1, 1, 1, 1,
-0.2788339, 1.077871, -0.1083547, 1, 1, 1, 1, 1,
-0.275386, -0.02440308, -3.15312, 1, 1, 1, 1, 1,
-0.2746222, 0.06713954, -2.159225, 1, 1, 1, 1, 1,
-0.2672983, -0.3096732, -1.694741, 1, 1, 1, 1, 1,
-0.2663385, -0.08987486, -0.6484779, 1, 1, 1, 1, 1,
-0.2648598, 0.1243567, -1.338324, 1, 1, 1, 1, 1,
-0.2584379, -1.588686, -3.634555, 1, 1, 1, 1, 1,
-0.2583309, 1.501869, -0.6647673, 1, 1, 1, 1, 1,
-0.2581713, -1.054332, -1.979292, 1, 1, 1, 1, 1,
-0.2544492, 0.3452274, -0.9753487, 0, 0, 1, 1, 1,
-0.2481598, 0.2296272, -1.079717, 1, 0, 0, 1, 1,
-0.2476705, 0.5869212, -0.8013404, 1, 0, 0, 1, 1,
-0.2454704, 0.552153, -0.1125328, 1, 0, 0, 1, 1,
-0.2433805, -0.2910633, -4.439065, 1, 0, 0, 1, 1,
-0.2432489, -0.2588102, -1.970237, 1, 0, 0, 1, 1,
-0.2421693, -1.15509, -2.281528, 0, 0, 0, 1, 1,
-0.2410337, 0.1738531, 0.4779079, 0, 0, 0, 1, 1,
-0.2405657, -0.6377692, -2.147782, 0, 0, 0, 1, 1,
-0.2396205, 1.448636, 0.01766377, 0, 0, 0, 1, 1,
-0.2281531, 0.9590307, 1.845007, 0, 0, 0, 1, 1,
-0.2273359, -0.8929205, -2.261434, 0, 0, 0, 1, 1,
-0.2256057, -0.08274372, -1.65868, 0, 0, 0, 1, 1,
-0.2251921, 2.130808, 0.9936352, 1, 1, 1, 1, 1,
-0.2247265, 0.8993221, -2.051485, 1, 1, 1, 1, 1,
-0.2210384, -1.251901, -2.762172, 1, 1, 1, 1, 1,
-0.2167794, 1.367239, 0.2136554, 1, 1, 1, 1, 1,
-0.212516, 0.6466427, 0.2006119, 1, 1, 1, 1, 1,
-0.2104254, -0.1165926, -2.977736, 1, 1, 1, 1, 1,
-0.2084802, 0.8487328, -0.3322397, 1, 1, 1, 1, 1,
-0.2082603, 0.3360143, 0.2311502, 1, 1, 1, 1, 1,
-0.2064812, 0.8556257, 1.032061, 1, 1, 1, 1, 1,
-0.2060483, 0.3003275, -0.8681598, 1, 1, 1, 1, 1,
-0.2043785, -0.5350414, -2.306784, 1, 1, 1, 1, 1,
-0.2032968, -0.394201, -3.650733, 1, 1, 1, 1, 1,
-0.2011705, -1.312121, -0.6356156, 1, 1, 1, 1, 1,
-0.199279, 1.054658, -0.4729486, 1, 1, 1, 1, 1,
-0.1935242, 0.2374701, -0.77931, 1, 1, 1, 1, 1,
-0.1934458, 0.2350131, -2.511142, 0, 0, 1, 1, 1,
-0.1930773, 1.031239, -0.6985294, 1, 0, 0, 1, 1,
-0.1923758, -0.1883406, -1.203537, 1, 0, 0, 1, 1,
-0.1893584, 0.1505453, -0.6549928, 1, 0, 0, 1, 1,
-0.1872415, 0.1094129, -1.603744, 1, 0, 0, 1, 1,
-0.1821471, -1.333039, -3.193541, 1, 0, 0, 1, 1,
-0.1783547, -1.047932, -3.151166, 0, 0, 0, 1, 1,
-0.1692989, 0.6989844, -1.383998, 0, 0, 0, 1, 1,
-0.1665205, -1.411872, -3.579634, 0, 0, 0, 1, 1,
-0.1611313, -0.1271306, -4.086852, 0, 0, 0, 1, 1,
-0.1583585, -0.2409909, -2.879183, 0, 0, 0, 1, 1,
-0.1576714, 0.2859429, 0.2349971, 0, 0, 0, 1, 1,
-0.1546938, 0.4208914, -1.382841, 0, 0, 0, 1, 1,
-0.15455, -1.893729, -1.917625, 1, 1, 1, 1, 1,
-0.1525437, -2.335645, -1.738969, 1, 1, 1, 1, 1,
-0.1376799, 0.1993407, -1.245606, 1, 1, 1, 1, 1,
-0.1336349, -0.171783, -1.990159, 1, 1, 1, 1, 1,
-0.1303738, 0.5359823, -1.0566, 1, 1, 1, 1, 1,
-0.1268655, 1.347266, 0.01528957, 1, 1, 1, 1, 1,
-0.1264219, -0.1475357, -1.753929, 1, 1, 1, 1, 1,
-0.1253981, 1.313979, -0.3047611, 1, 1, 1, 1, 1,
-0.1243352, 1.936828, -0.9402428, 1, 1, 1, 1, 1,
-0.1225496, -0.9648961, -4.418193, 1, 1, 1, 1, 1,
-0.1199556, -0.776655, -3.992162, 1, 1, 1, 1, 1,
-0.1147808, 0.4249425, -0.6087889, 1, 1, 1, 1, 1,
-0.1146196, 0.3800596, -0.9963526, 1, 1, 1, 1, 1,
-0.1130969, 0.2385711, -1.833117, 1, 1, 1, 1, 1,
-0.1117334, -1.627513, -2.332305, 1, 1, 1, 1, 1,
-0.1073441, -0.5911869, -3.64256, 0, 0, 1, 1, 1,
-0.1072725, -0.0145681, -1.342193, 1, 0, 0, 1, 1,
-0.1059845, 1.515883, -0.3602962, 1, 0, 0, 1, 1,
-0.1032357, -0.7079941, -2.598787, 1, 0, 0, 1, 1,
-0.1025315, -0.01887477, -3.189737, 1, 0, 0, 1, 1,
-0.1012409, -0.7317473, -2.068451, 1, 0, 0, 1, 1,
-0.09986034, -1.245885, -2.441954, 0, 0, 0, 1, 1,
-0.09849057, -1.405164, -5.526121, 0, 0, 0, 1, 1,
-0.09625077, -1.2258, -2.080511, 0, 0, 0, 1, 1,
-0.09575531, 1.262694, -0.3641895, 0, 0, 0, 1, 1,
-0.09572572, 0.0291546, -1.218749, 0, 0, 0, 1, 1,
-0.09390181, 0.8760871, 0.3832407, 0, 0, 0, 1, 1,
-0.09384269, 0.07087235, 1.865635, 0, 0, 0, 1, 1,
-0.08736425, -0.2690298, -1.780932, 1, 1, 1, 1, 1,
-0.08588616, -1.898981, -1.625653, 1, 1, 1, 1, 1,
-0.08558757, 0.2590911, -0.9746225, 1, 1, 1, 1, 1,
-0.08391413, -0.02249862, -2.2573, 1, 1, 1, 1, 1,
-0.0781988, -1.128308, -2.929569, 1, 1, 1, 1, 1,
-0.07378975, 0.177539, -1.199643, 1, 1, 1, 1, 1,
-0.07059075, -0.1815303, -2.011483, 1, 1, 1, 1, 1,
-0.07037331, 1.351832, -0.7557119, 1, 1, 1, 1, 1,
-0.06631598, -1.41376, -3.878498, 1, 1, 1, 1, 1,
-0.06611655, 2.093388, -1.441258, 1, 1, 1, 1, 1,
-0.06076249, 1.142622, -0.1494415, 1, 1, 1, 1, 1,
-0.055891, -0.3943503, -4.717846, 1, 1, 1, 1, 1,
-0.05358245, -0.3636208, -2.07286, 1, 1, 1, 1, 1,
-0.04748257, 1.01383, -0.106072, 1, 1, 1, 1, 1,
-0.04097532, 0.4109085, 0.09537914, 1, 1, 1, 1, 1,
-0.03614189, 1.489869, -0.2343365, 0, 0, 1, 1, 1,
-0.03058401, -0.02299985, -1.674936, 1, 0, 0, 1, 1,
-0.02814298, -0.6376209, -3.851848, 1, 0, 0, 1, 1,
-0.02616225, -1.202738, -2.331206, 1, 0, 0, 1, 1,
-0.02504945, 0.4133176, 0.7597193, 1, 0, 0, 1, 1,
-0.02302621, 0.0722141, 1.374271, 1, 0, 0, 1, 1,
-0.02024719, 3.162727, 0.1260628, 0, 0, 0, 1, 1,
-0.01656283, -0.50311, -4.117918, 0, 0, 0, 1, 1,
-0.0151051, -1.956932, -2.497174, 0, 0, 0, 1, 1,
-0.01459243, -0.02910964, -3.622443, 0, 0, 0, 1, 1,
-0.01372133, -0.7046995, -5.584698, 0, 0, 0, 1, 1,
-0.01022172, 0.8934076, -0.4295197, 0, 0, 0, 1, 1,
-0.007769927, -1.294442, -2.327399, 0, 0, 0, 1, 1,
-0.006257173, -1.225376, -3.413471, 1, 1, 1, 1, 1,
-0.005910278, -0.5185097, -4.88217, 1, 1, 1, 1, 1,
-0.0005595411, 0.9905206, -0.07581106, 1, 1, 1, 1, 1,
-0.0004795301, 0.1085414, 1.276236, 1, 1, 1, 1, 1,
-0.0002630104, 2.73467, -2.127724, 1, 1, 1, 1, 1,
2.079875e-05, -1.622029, 2.256512, 1, 1, 1, 1, 1,
0.01454882, -1.028411, 1.674486, 1, 1, 1, 1, 1,
0.01553916, -0.2204645, 5.232275, 1, 1, 1, 1, 1,
0.01896827, 1.12187, -0.6790417, 1, 1, 1, 1, 1,
0.01938478, 0.6228278, 2.432702, 1, 1, 1, 1, 1,
0.02027759, -1.235358, 2.835745, 1, 1, 1, 1, 1,
0.02109446, -0.4614657, 4.174693, 1, 1, 1, 1, 1,
0.02113584, 0.6020062, -0.3796146, 1, 1, 1, 1, 1,
0.02201534, 1.134491, 1.784287, 1, 1, 1, 1, 1,
0.02334527, -0.7744503, 3.232729, 1, 1, 1, 1, 1,
0.02468511, -0.1628074, 3.638745, 0, 0, 1, 1, 1,
0.02967282, -0.5383652, 3.67586, 1, 0, 0, 1, 1,
0.0308338, -0.7056131, 3.725327, 1, 0, 0, 1, 1,
0.03328088, -0.1273812, 2.958727, 1, 0, 0, 1, 1,
0.03377692, 1.359676, 0.2721174, 1, 0, 0, 1, 1,
0.03628153, 0.04517249, 0.4825264, 1, 0, 0, 1, 1,
0.03689733, -0.725989, 2.146525, 0, 0, 0, 1, 1,
0.03801719, -3.193054, 3.300827, 0, 0, 0, 1, 1,
0.04051663, -0.9154213, 3.430266, 0, 0, 0, 1, 1,
0.04405656, -2.394325, 2.322147, 0, 0, 0, 1, 1,
0.04522648, -0.460493, 1.009164, 0, 0, 0, 1, 1,
0.04741096, -0.6375472, 1.760524, 0, 0, 0, 1, 1,
0.04760928, 0.4114237, 1.461763, 0, 0, 0, 1, 1,
0.04789047, 2.374481, 0.1756794, 1, 1, 1, 1, 1,
0.0510147, 0.5427391, 0.2802804, 1, 1, 1, 1, 1,
0.0558056, -1.561596, 5.048185, 1, 1, 1, 1, 1,
0.05714747, 0.7783799, 0.3571666, 1, 1, 1, 1, 1,
0.06377008, -1.375701, 3.585252, 1, 1, 1, 1, 1,
0.06456757, -0.7226782, 3.717936, 1, 1, 1, 1, 1,
0.06594495, -1.102513, 2.228905, 1, 1, 1, 1, 1,
0.06664182, -0.01662373, 1.544051, 1, 1, 1, 1, 1,
0.06984694, 0.936892, 0.4777371, 1, 1, 1, 1, 1,
0.07147039, 0.9593378, 0.2960177, 1, 1, 1, 1, 1,
0.07454699, -0.2669211, 2.073146, 1, 1, 1, 1, 1,
0.07550378, -1.065611, 3.080271, 1, 1, 1, 1, 1,
0.07589716, 0.1544986, 2.16795, 1, 1, 1, 1, 1,
0.08268676, -1.068164, 2.47672, 1, 1, 1, 1, 1,
0.08279021, -0.5222461, 2.831431, 1, 1, 1, 1, 1,
0.08537009, 0.9069972, 0.9267629, 0, 0, 1, 1, 1,
0.09167772, 1.338109, 0.2500229, 1, 0, 0, 1, 1,
0.09260398, -1.520034, 2.030307, 1, 0, 0, 1, 1,
0.0941579, -2.215183, 2.294766, 1, 0, 0, 1, 1,
0.103426, -0.07236331, 2.38518, 1, 0, 0, 1, 1,
0.1039825, 0.5986035, 0.5199757, 1, 0, 0, 1, 1,
0.1062029, 0.4532959, 2.329641, 0, 0, 0, 1, 1,
0.1073761, 0.8133523, 0.930708, 0, 0, 0, 1, 1,
0.1081166, -0.5234423, 3.309346, 0, 0, 0, 1, 1,
0.1093896, 2.809964, -0.6225691, 0, 0, 0, 1, 1,
0.1130767, -2.073795, 2.729712, 0, 0, 0, 1, 1,
0.117208, -0.7532483, 3.267248, 0, 0, 0, 1, 1,
0.118284, -0.5779437, 2.301101, 0, 0, 0, 1, 1,
0.1186427, 0.3147116, -1.311231, 1, 1, 1, 1, 1,
0.1191663, -0.508565, 2.405424, 1, 1, 1, 1, 1,
0.1261521, -0.17574, 4.099, 1, 1, 1, 1, 1,
0.1272396, 0.945588, -0.6159783, 1, 1, 1, 1, 1,
0.1281145, -1.772911, 5.092643, 1, 1, 1, 1, 1,
0.1333244, 1.078359, 0.08760376, 1, 1, 1, 1, 1,
0.1357982, 0.1258621, -1.151308, 1, 1, 1, 1, 1,
0.1361623, -0.8264848, 2.387414, 1, 1, 1, 1, 1,
0.1380993, -2.370384, 2.08619, 1, 1, 1, 1, 1,
0.1396508, -0.4455574, 3.934974, 1, 1, 1, 1, 1,
0.1447645, -2.39777, 4.57918, 1, 1, 1, 1, 1,
0.1454821, -1.051458, 2.157433, 1, 1, 1, 1, 1,
0.1455852, 1.321528, -0.2342593, 1, 1, 1, 1, 1,
0.1470663, -0.8592089, 1.640327, 1, 1, 1, 1, 1,
0.147203, -0.297073, 2.646553, 1, 1, 1, 1, 1,
0.1476364, -1.101876, 3.208426, 0, 0, 1, 1, 1,
0.1524622, 0.415408, 2.549479, 1, 0, 0, 1, 1,
0.1532656, 1.013896, 0.479033, 1, 0, 0, 1, 1,
0.1576359, 0.7380462, 1.186944, 1, 0, 0, 1, 1,
0.1615543, 1.147107, -0.1606591, 1, 0, 0, 1, 1,
0.1620103, 1.040978, 0.4245686, 1, 0, 0, 1, 1,
0.167476, 1.162511, 1.683819, 0, 0, 0, 1, 1,
0.1685835, -1.353261, 2.502543, 0, 0, 0, 1, 1,
0.1712377, 0.9520769, -0.6130721, 0, 0, 0, 1, 1,
0.1718965, 0.4826437, -0.2881742, 0, 0, 0, 1, 1,
0.174244, -0.8030871, 3.089785, 0, 0, 0, 1, 1,
0.1797848, -0.9096219, 3.254168, 0, 0, 0, 1, 1,
0.1807496, 1.484887, 0.8322679, 0, 0, 0, 1, 1,
0.1810942, 1.562758, -1.147092, 1, 1, 1, 1, 1,
0.1821406, -0.3858094, 2.153792, 1, 1, 1, 1, 1,
0.1878236, 0.2127765, 0.736155, 1, 1, 1, 1, 1,
0.188114, 0.8560442, 0.9711068, 1, 1, 1, 1, 1,
0.189787, -0.3947012, 3.325564, 1, 1, 1, 1, 1,
0.1900645, -1.369964, 2.50749, 1, 1, 1, 1, 1,
0.1926163, -0.8067032, 4.598507, 1, 1, 1, 1, 1,
0.1937743, 0.9037666, 0.4362659, 1, 1, 1, 1, 1,
0.1995618, 1.437791, 0.8573754, 1, 1, 1, 1, 1,
0.2013379, -1.303925, 1.698298, 1, 1, 1, 1, 1,
0.2052319, 0.3715084, 0.5800275, 1, 1, 1, 1, 1,
0.2065963, -0.623413, 3.005538, 1, 1, 1, 1, 1,
0.2091013, -1.494761, 2.020431, 1, 1, 1, 1, 1,
0.2092025, 0.7860314, -0.1485874, 1, 1, 1, 1, 1,
0.2115765, 0.4564588, 1.583242, 1, 1, 1, 1, 1,
0.2127438, -0.05150582, 0.9132847, 0, 0, 1, 1, 1,
0.2143931, -1.807765, 3.940043, 1, 0, 0, 1, 1,
0.2179633, 0.9454151, -0.2427551, 1, 0, 0, 1, 1,
0.2201318, 1.203778, 0.5668844, 1, 0, 0, 1, 1,
0.2264388, -1.056996, 0.5454748, 1, 0, 0, 1, 1,
0.2319796, -0.5203379, 1.799372, 1, 0, 0, 1, 1,
0.2376092, -1.126451, 1.040936, 0, 0, 0, 1, 1,
0.2396849, -0.1201734, 1.267205, 0, 0, 0, 1, 1,
0.239976, -0.2766406, 1.995777, 0, 0, 0, 1, 1,
0.2401421, -0.05064582, 2.058054, 0, 0, 0, 1, 1,
0.2447653, -0.7710957, 2.503944, 0, 0, 0, 1, 1,
0.2457596, -0.8696618, 3.479208, 0, 0, 0, 1, 1,
0.2478462, 0.4351788, 1.835126, 0, 0, 0, 1, 1,
0.248251, 0.397725, 1.486814, 1, 1, 1, 1, 1,
0.2493194, -1.721724, 1.960125, 1, 1, 1, 1, 1,
0.2503881, -0.2956512, 3.344032, 1, 1, 1, 1, 1,
0.2521306, -3.262, 4.24277, 1, 1, 1, 1, 1,
0.2545393, 0.237728, 0.6522117, 1, 1, 1, 1, 1,
0.254753, -0.5738863, 2.203822, 1, 1, 1, 1, 1,
0.2554194, -2.619933, 3.462976, 1, 1, 1, 1, 1,
0.2643579, -0.7469191, 3.441417, 1, 1, 1, 1, 1,
0.2665699, 0.1520437, 0.2636681, 1, 1, 1, 1, 1,
0.2711645, -1.661381, 4.145696, 1, 1, 1, 1, 1,
0.2752335, -0.2022036, 1.521965, 1, 1, 1, 1, 1,
0.2795715, 0.7291864, 1.700474, 1, 1, 1, 1, 1,
0.2828493, -1.318838, 3.005867, 1, 1, 1, 1, 1,
0.284961, -0.1000578, 0.7423419, 1, 1, 1, 1, 1,
0.294159, 1.507939, 0.3166997, 1, 1, 1, 1, 1,
0.2980494, 0.4597787, 0.4410468, 0, 0, 1, 1, 1,
0.3018989, 0.6364583, 0.314441, 1, 0, 0, 1, 1,
0.3020634, 1.866665, -0.4082547, 1, 0, 0, 1, 1,
0.3021965, 0.01891897, 2.626344, 1, 0, 0, 1, 1,
0.3070494, -0.2661766, 3.535862, 1, 0, 0, 1, 1,
0.3146361, -1.974909, 4.115183, 1, 0, 0, 1, 1,
0.3173529, 0.617319, 0.8206649, 0, 0, 0, 1, 1,
0.317566, -2.572517, 3.62376, 0, 0, 0, 1, 1,
0.3188034, -0.7737728, 1.986812, 0, 0, 0, 1, 1,
0.3201262, -0.2231995, 3.009689, 0, 0, 0, 1, 1,
0.3257778, -0.6438673, 1.489899, 0, 0, 0, 1, 1,
0.3350059, 1.06901, 0.6564777, 0, 0, 0, 1, 1,
0.3409504, 0.9359353, -0.2114323, 0, 0, 0, 1, 1,
0.3463596, 1.914539, 1.182647, 1, 1, 1, 1, 1,
0.3479559, 0.2219719, -1.092129, 1, 1, 1, 1, 1,
0.3531179, -1.431517, 3.144873, 1, 1, 1, 1, 1,
0.353597, -1.422109, 2.550281, 1, 1, 1, 1, 1,
0.3565982, 0.2049352, 1.048836, 1, 1, 1, 1, 1,
0.3569838, 0.838936, 2.647187, 1, 1, 1, 1, 1,
0.358773, -0.1856606, 2.820816, 1, 1, 1, 1, 1,
0.3607475, -1.629183, 4.215652, 1, 1, 1, 1, 1,
0.3615706, -0.6975068, 4.04634, 1, 1, 1, 1, 1,
0.3659262, 1.102834, 0.960893, 1, 1, 1, 1, 1,
0.3666586, 0.08125129, 0.09946049, 1, 1, 1, 1, 1,
0.3694831, 1.024741, -1.158633, 1, 1, 1, 1, 1,
0.3720439, 0.2172345, 0.3768224, 1, 1, 1, 1, 1,
0.3769525, 2.313085, 1.0118, 1, 1, 1, 1, 1,
0.3804565, 1.277174, -0.3341348, 1, 1, 1, 1, 1,
0.3821882, 0.2042898, 2.984758, 0, 0, 1, 1, 1,
0.3829434, 0.9830668, -0.4887223, 1, 0, 0, 1, 1,
0.3885553, 1.310927, -0.3088155, 1, 0, 0, 1, 1,
0.3923212, 0.8051398, 0.6627309, 1, 0, 0, 1, 1,
0.3948772, -0.1056393, 2.736136, 1, 0, 0, 1, 1,
0.3985591, 0.3153286, 1.202859, 1, 0, 0, 1, 1,
0.4026697, -0.5095559, 2.830091, 0, 0, 0, 1, 1,
0.4029981, -0.3044215, 2.303071, 0, 0, 0, 1, 1,
0.403578, -0.3500633, 2.087249, 0, 0, 0, 1, 1,
0.4071088, -0.5885612, 1.551708, 0, 0, 0, 1, 1,
0.4115234, -2.165515, 3.942577, 0, 0, 0, 1, 1,
0.4124137, -1.590277, 3.744442, 0, 0, 0, 1, 1,
0.4126498, -1.007513, 2.101556, 0, 0, 0, 1, 1,
0.4148088, -1.807729, 2.258499, 1, 1, 1, 1, 1,
0.4153906, 0.3472319, 0.1834493, 1, 1, 1, 1, 1,
0.4157991, 1.621976, -0.6907514, 1, 1, 1, 1, 1,
0.420866, 0.5212333, 0.1938236, 1, 1, 1, 1, 1,
0.426814, 1.196962, 1.478861, 1, 1, 1, 1, 1,
0.4271194, -0.4014875, 3.872561, 1, 1, 1, 1, 1,
0.428279, 1.996855, 0.5837978, 1, 1, 1, 1, 1,
0.4292099, -0.8830585, 1.402916, 1, 1, 1, 1, 1,
0.4323115, 0.7001455, -0.8160938, 1, 1, 1, 1, 1,
0.4354624, 1.224194, 2.867928, 1, 1, 1, 1, 1,
0.4369999, 0.790126, 1.013075, 1, 1, 1, 1, 1,
0.4381697, 0.7665897, -0.296031, 1, 1, 1, 1, 1,
0.4456557, 1.646564, 1.222271, 1, 1, 1, 1, 1,
0.4465394, -0.5689163, 3.060859, 1, 1, 1, 1, 1,
0.4480594, -0.4958884, 3.075884, 1, 1, 1, 1, 1,
0.4486876, 0.2740913, 2.066188, 0, 0, 1, 1, 1,
0.4489124, 1.160092, -0.7788678, 1, 0, 0, 1, 1,
0.4502786, 0.7613251, -0.6761693, 1, 0, 0, 1, 1,
0.4526622, 1.453091, 2.264767, 1, 0, 0, 1, 1,
0.4569542, 0.6240643, 0.7798468, 1, 0, 0, 1, 1,
0.4584303, 0.3817155, 0.765595, 1, 0, 0, 1, 1,
0.4630836, 0.2796354, 0.9166718, 0, 0, 0, 1, 1,
0.4657604, -1.137806, 3.546425, 0, 0, 0, 1, 1,
0.4693899, 1.428453, 0.6700181, 0, 0, 0, 1, 1,
0.4738238, 0.04942275, 0.978964, 0, 0, 0, 1, 1,
0.474223, 1.021744, 0.2980709, 0, 0, 0, 1, 1,
0.4785137, -0.2114154, 3.421089, 0, 0, 0, 1, 1,
0.4785331, 0.1335572, 0.8283208, 0, 0, 0, 1, 1,
0.4791509, 1.138932, -1.104271, 1, 1, 1, 1, 1,
0.4917637, -1.259567, 2.763153, 1, 1, 1, 1, 1,
0.4968179, -1.764308, 1.071257, 1, 1, 1, 1, 1,
0.4997446, 2.186792, -0.4703429, 1, 1, 1, 1, 1,
0.5043739, -0.4289064, 2.824583, 1, 1, 1, 1, 1,
0.5046828, 1.479324, -0.2756619, 1, 1, 1, 1, 1,
0.5048956, -0.02445039, 0.6630148, 1, 1, 1, 1, 1,
0.505065, 1.225254, 0.810654, 1, 1, 1, 1, 1,
0.5061396, 0.6023809, 0.879396, 1, 1, 1, 1, 1,
0.5097279, 0.3484575, -0.6152527, 1, 1, 1, 1, 1,
0.5101512, -1.181284, 3.811626, 1, 1, 1, 1, 1,
0.5127662, -0.4460722, 3.005555, 1, 1, 1, 1, 1,
0.5153929, 0.278453, 1.087279, 1, 1, 1, 1, 1,
0.5154753, -0.7131944, 3.195206, 1, 1, 1, 1, 1,
0.5155075, 0.5934873, 0.7850276, 1, 1, 1, 1, 1,
0.5203484, -1.175625, 3.882833, 0, 0, 1, 1, 1,
0.5215984, -0.6903458, 2.810385, 1, 0, 0, 1, 1,
0.5219283, 0.7546213, 0.8764843, 1, 0, 0, 1, 1,
0.5245528, 0.5811772, 0.2726671, 1, 0, 0, 1, 1,
0.5248899, -1.130908, 1.81691, 1, 0, 0, 1, 1,
0.5255281, -0.8515472, 2.069321, 1, 0, 0, 1, 1,
0.5312297, -1.102566, 2.443318, 0, 0, 0, 1, 1,
0.536361, -0.2203095, 3.010551, 0, 0, 0, 1, 1,
0.5383679, 0.107645, 0.8644413, 0, 0, 0, 1, 1,
0.5473814, 0.04078637, 2.37174, 0, 0, 0, 1, 1,
0.5491092, -0.03486477, 3.231824, 0, 0, 0, 1, 1,
0.5502056, 1.32967, 0.2783326, 0, 0, 0, 1, 1,
0.5588343, -1.217035, 4.080057, 0, 0, 0, 1, 1,
0.5588754, 0.2511076, 2.029528, 1, 1, 1, 1, 1,
0.5606334, -1.004298, 2.444559, 1, 1, 1, 1, 1,
0.561791, -1.700004, 3.559024, 1, 1, 1, 1, 1,
0.562997, 1.15727, -0.2039248, 1, 1, 1, 1, 1,
0.565056, 0.709762, 0.7865804, 1, 1, 1, 1, 1,
0.5655696, 0.4579941, 0.25978, 1, 1, 1, 1, 1,
0.5667008, 1.205634, -0.4979895, 1, 1, 1, 1, 1,
0.5699172, 0.8721595, 0.223163, 1, 1, 1, 1, 1,
0.5726047, 0.1189597, 0.3737625, 1, 1, 1, 1, 1,
0.5738763, -1.947256, 5.626357, 1, 1, 1, 1, 1,
0.5740406, 0.1549195, 1.411246, 1, 1, 1, 1, 1,
0.5762279, 0.03612802, 0.9896601, 1, 1, 1, 1, 1,
0.5841122, -0.7967106, 1.944751, 1, 1, 1, 1, 1,
0.5842621, 0.1546856, 1.491677, 1, 1, 1, 1, 1,
0.5863567, 0.007420066, 1.578882, 1, 1, 1, 1, 1,
0.5863817, 0.4974972, 1.181396, 0, 0, 1, 1, 1,
0.5910055, -1.486521, 2.225191, 1, 0, 0, 1, 1,
0.5928699, 0.1263133, 0.3655676, 1, 0, 0, 1, 1,
0.5985631, -0.9860442, 2.223957, 1, 0, 0, 1, 1,
0.6013307, -2.314621, 4.815282, 1, 0, 0, 1, 1,
0.6032462, -1.307316, 3.999393, 1, 0, 0, 1, 1,
0.6053298, 0.6668311, 0.7572184, 0, 0, 0, 1, 1,
0.6147231, 0.02619708, 0.1566736, 0, 0, 0, 1, 1,
0.6292272, -0.647541, 2.863597, 0, 0, 0, 1, 1,
0.6303545, -0.8923403, 2.182125, 0, 0, 0, 1, 1,
0.6335692, -1.20819, 1.4976, 0, 0, 0, 1, 1,
0.633821, 0.5285551, 1.760408, 0, 0, 0, 1, 1,
0.6358313, -0.8350977, 2.917757, 0, 0, 0, 1, 1,
0.6387323, 0.02797943, 0.3030605, 1, 1, 1, 1, 1,
0.6420147, 0.8083819, -1.29428, 1, 1, 1, 1, 1,
0.6523345, -1.644882, 1.589301, 1, 1, 1, 1, 1,
0.6560436, -1.665761, 2.556388, 1, 1, 1, 1, 1,
0.6695297, -0.5270646, 1.602, 1, 1, 1, 1, 1,
0.672077, -0.3394333, 2.847702, 1, 1, 1, 1, 1,
0.6728877, -2.532736, 3.432661, 1, 1, 1, 1, 1,
0.691446, -0.519503, 3.075691, 1, 1, 1, 1, 1,
0.707198, 0.7072145, 0.5926877, 1, 1, 1, 1, 1,
0.7101518, 0.7842996, 0.6417879, 1, 1, 1, 1, 1,
0.7121985, -0.281978, 0.9104044, 1, 1, 1, 1, 1,
0.726377, 0.9119752, 0.1987125, 1, 1, 1, 1, 1,
0.7269223, 0.03869548, 1.005764, 1, 1, 1, 1, 1,
0.728421, 0.6245709, -0.4802074, 1, 1, 1, 1, 1,
0.7285655, -0.2194237, 4.076579, 1, 1, 1, 1, 1,
0.7339377, 1.440213, -0.9541388, 0, 0, 1, 1, 1,
0.7345632, 1.455789, 0.6966096, 1, 0, 0, 1, 1,
0.7348226, -0.01361112, 0.5881093, 1, 0, 0, 1, 1,
0.7365984, -0.6145661, 1.594104, 1, 0, 0, 1, 1,
0.7423929, 0.7626888, 0.06921104, 1, 0, 0, 1, 1,
0.7489595, 0.437398, 0.6842589, 1, 0, 0, 1, 1,
0.7515708, -0.347115, 2.017073, 0, 0, 0, 1, 1,
0.7543522, -0.2327621, 2.033443, 0, 0, 0, 1, 1,
0.7572701, 1.844005, 0.5777787, 0, 0, 0, 1, 1,
0.7596821, -0.7517142, 0.8260974, 0, 0, 0, 1, 1,
0.7604308, 0.9482118, 0.5937424, 0, 0, 0, 1, 1,
0.7618932, 1.616335, 0.9633473, 0, 0, 0, 1, 1,
0.7702997, -0.4283116, 1.042856, 0, 0, 0, 1, 1,
0.7707582, 0.1982959, 0.7882606, 1, 1, 1, 1, 1,
0.7749604, 0.5569879, 0.4388631, 1, 1, 1, 1, 1,
0.7755837, 1.128431, 0.5162675, 1, 1, 1, 1, 1,
0.7808868, 0.4684445, 0.5210963, 1, 1, 1, 1, 1,
0.7817845, -0.6016422, 4.514712, 1, 1, 1, 1, 1,
0.7853724, 0.2482056, 2.146701, 1, 1, 1, 1, 1,
0.7888281, -0.6886865, 2.346383, 1, 1, 1, 1, 1,
0.7894308, -0.05265421, 0.4145064, 1, 1, 1, 1, 1,
0.7914802, 0.3371811, 1.160752, 1, 1, 1, 1, 1,
0.8018154, 1.551427, 0.816889, 1, 1, 1, 1, 1,
0.8046942, 1.114393, 0.2509555, 1, 1, 1, 1, 1,
0.8049935, -1.481256, 2.940656, 1, 1, 1, 1, 1,
0.8081771, -1.377789, 2.525158, 1, 1, 1, 1, 1,
0.8093205, -0.9205237, 1.96802, 1, 1, 1, 1, 1,
0.8097033, -0.002485742, 2.880052, 1, 1, 1, 1, 1,
0.8097703, 0.1575541, -0.01115789, 0, 0, 1, 1, 1,
0.8104097, -0.9215915, 2.484348, 1, 0, 0, 1, 1,
0.8162271, 0.9086528, 0.8910677, 1, 0, 0, 1, 1,
0.817682, -0.9728479, 2.134577, 1, 0, 0, 1, 1,
0.8179367, 1.118012, 0.02023919, 1, 0, 0, 1, 1,
0.8210955, -0.4563516, 2.765941, 1, 0, 0, 1, 1,
0.8279058, -0.157587, 1.664035, 0, 0, 0, 1, 1,
0.831123, 1.129447, -1.166636, 0, 0, 0, 1, 1,
0.8318596, 0.2933024, 1.428631, 0, 0, 0, 1, 1,
0.8324701, -0.1375558, 1.762852, 0, 0, 0, 1, 1,
0.8330699, 0.9720002, -1.26637, 0, 0, 0, 1, 1,
0.8394616, 0.5860163, 1.356533, 0, 0, 0, 1, 1,
0.8397678, -0.09083978, 2.301984, 0, 0, 0, 1, 1,
0.8409987, -0.4373839, 2.37651, 1, 1, 1, 1, 1,
0.8438607, -0.8035083, 0.5937593, 1, 1, 1, 1, 1,
0.8468614, 0.569241, 0.1055439, 1, 1, 1, 1, 1,
0.8545518, 0.2449181, -0.2161389, 1, 1, 1, 1, 1,
0.8549032, -0.5508648, 2.951672, 1, 1, 1, 1, 1,
0.8569391, 0.4231234, 1.003709, 1, 1, 1, 1, 1,
0.8638596, -2.174093, 3.728361, 1, 1, 1, 1, 1,
0.8673206, -3.911078, 4.183306, 1, 1, 1, 1, 1,
0.8703751, 0.06585903, 1.806203, 1, 1, 1, 1, 1,
0.8727236, 0.1256068, 2.294183, 1, 1, 1, 1, 1,
0.8744569, -0.118776, 1.102977, 1, 1, 1, 1, 1,
0.883212, 1.199256, -0.7445133, 1, 1, 1, 1, 1,
0.9029762, 0.961324, 1.288366, 1, 1, 1, 1, 1,
0.9035695, -1.208687, 2.088785, 1, 1, 1, 1, 1,
0.9037668, -1.911135, 2.322685, 1, 1, 1, 1, 1,
0.9041298, -1.328928, 2.180154, 0, 0, 1, 1, 1,
0.906158, 2.020721, 1.524735, 1, 0, 0, 1, 1,
0.9064475, -1.417561, 2.285303, 1, 0, 0, 1, 1,
0.9088628, 0.4733976, 2.233606, 1, 0, 0, 1, 1,
0.9141099, 0.1584532, 1.416078, 1, 0, 0, 1, 1,
0.9147196, -0.6225961, 1.521344, 1, 0, 0, 1, 1,
0.9167597, 1.204412, 0.07716592, 0, 0, 0, 1, 1,
0.9185821, -1.733531, 4.111142, 0, 0, 0, 1, 1,
0.9208601, 0.5907157, 1.216345, 0, 0, 0, 1, 1,
0.9237536, -1.49805, 5.450625, 0, 0, 0, 1, 1,
0.9310387, -0.07564681, 1.558923, 0, 0, 0, 1, 1,
0.9312688, -0.2564295, -0.2739548, 0, 0, 0, 1, 1,
0.9340419, -0.1497076, 3.781897, 0, 0, 0, 1, 1,
0.9341235, 1.672337, 0.9652007, 1, 1, 1, 1, 1,
0.9379095, 0.02588966, 0.6435712, 1, 1, 1, 1, 1,
0.9402887, -1.737272, 0.2580257, 1, 1, 1, 1, 1,
0.948561, 0.5221268, 2.088385, 1, 1, 1, 1, 1,
0.9516717, 0.7375385, 1.449611, 1, 1, 1, 1, 1,
0.9518403, 0.01784827, 1.692559, 1, 1, 1, 1, 1,
0.952262, 0.02795031, 1.372344, 1, 1, 1, 1, 1,
0.953447, 0.7916778, 1.261721, 1, 1, 1, 1, 1,
0.9543903, 1.593302, 1.063591, 1, 1, 1, 1, 1,
0.9571697, -0.7366505, 2.916943, 1, 1, 1, 1, 1,
0.9606239, -0.5440195, 0.4503785, 1, 1, 1, 1, 1,
0.961718, -1.614811, 2.199328, 1, 1, 1, 1, 1,
0.9620661, -1.22127, 3.614619, 1, 1, 1, 1, 1,
0.9653793, 1.987839, 1.246498, 1, 1, 1, 1, 1,
0.9660975, -0.05377607, 1.933887, 1, 1, 1, 1, 1,
0.9663523, -0.09709398, 1.348632, 0, 0, 1, 1, 1,
0.9691653, 0.07248822, 2.857288, 1, 0, 0, 1, 1,
0.969632, 1.105353, 0.1627395, 1, 0, 0, 1, 1,
0.9743356, -0.4033327, 1.180705, 1, 0, 0, 1, 1,
0.9792401, -1.266771, 2.694674, 1, 0, 0, 1, 1,
0.9825566, -0.8487417, 1.941452, 1, 0, 0, 1, 1,
0.9897522, -0.2078039, 1.342991, 0, 0, 0, 1, 1,
0.9920641, -0.4826372, 0.9595039, 0, 0, 0, 1, 1,
0.9993714, -0.6768875, 3.311017, 0, 0, 0, 1, 1,
1.00194, -0.3349038, 1.51985, 0, 0, 0, 1, 1,
1.011606, -1.626927, 2.631664, 0, 0, 0, 1, 1,
1.025753, 1.198747, 2.288815, 0, 0, 0, 1, 1,
1.035109, 1.853863, 2.020152, 0, 0, 0, 1, 1,
1.037459, -0.3984411, 1.680283, 1, 1, 1, 1, 1,
1.038135, 0.5778301, 1.062037, 1, 1, 1, 1, 1,
1.045569, 0.4918352, 0.9621279, 1, 1, 1, 1, 1,
1.050886, 1.153404, 0.3554802, 1, 1, 1, 1, 1,
1.053149, 0.05385343, 0.2320497, 1, 1, 1, 1, 1,
1.057258, -2.394853, 3.593463, 1, 1, 1, 1, 1,
1.060357, 1.454684, 1.796583, 1, 1, 1, 1, 1,
1.068714, -0.1696574, 0.4522958, 1, 1, 1, 1, 1,
1.069456, -0.2872723, 0.7713511, 1, 1, 1, 1, 1,
1.071489, 1.142057, 1.24895, 1, 1, 1, 1, 1,
1.081768, 0.810579, -0.2393726, 1, 1, 1, 1, 1,
1.108752, -0.7858316, 0.1444295, 1, 1, 1, 1, 1,
1.116049, -0.3285144, 2.345951, 1, 1, 1, 1, 1,
1.116743, 0.844945, 0.09333448, 1, 1, 1, 1, 1,
1.117391, 0.522688, 1.258463, 1, 1, 1, 1, 1,
1.12004, 0.4016412, 1.830213, 0, 0, 1, 1, 1,
1.135672, 1.015139, -1.244095, 1, 0, 0, 1, 1,
1.135955, -1.103194, 1.895264, 1, 0, 0, 1, 1,
1.14008, 0.3044153, 1.998392, 1, 0, 0, 1, 1,
1.14052, 2.268207, 1.176911, 1, 0, 0, 1, 1,
1.144679, 0.3849911, 1.607254, 1, 0, 0, 1, 1,
1.144997, 0.2934777, 1.503729, 0, 0, 0, 1, 1,
1.151195, 0.01210695, 2.215998, 0, 0, 0, 1, 1,
1.151632, -1.169497, 4.797346, 0, 0, 0, 1, 1,
1.155561, 0.09615669, 0.5748991, 0, 0, 0, 1, 1,
1.158423, 0.04655305, 1.028327, 0, 0, 0, 1, 1,
1.16398, 0.6551053, 1.220234, 0, 0, 0, 1, 1,
1.164014, 0.2855257, 1.304191, 0, 0, 0, 1, 1,
1.168712, 0.9475574, 1.355079, 1, 1, 1, 1, 1,
1.179106, -0.1189666, 0.5864894, 1, 1, 1, 1, 1,
1.182247, -1.560233, 1.584162, 1, 1, 1, 1, 1,
1.186507, 2.054905, 3.125146, 1, 1, 1, 1, 1,
1.187009, 0.197073, 0.624072, 1, 1, 1, 1, 1,
1.188159, -1.343783, 0.3228994, 1, 1, 1, 1, 1,
1.189218, -0.5754953, 1.773968, 1, 1, 1, 1, 1,
1.190106, 0.1508839, 0.1460638, 1, 1, 1, 1, 1,
1.205692, -0.3132331, 3.990144, 1, 1, 1, 1, 1,
1.208025, -0.1599834, 2.863434, 1, 1, 1, 1, 1,
1.2104, -0.1527467, 1.877652, 1, 1, 1, 1, 1,
1.220598, 0.07802653, 2.058459, 1, 1, 1, 1, 1,
1.22218, -2.636508, 4.258906, 1, 1, 1, 1, 1,
1.222922, 2.118428, 0.9360561, 1, 1, 1, 1, 1,
1.226722, -1.097433, 0.3546776, 1, 1, 1, 1, 1,
1.227379, 0.4843589, 0.9832588, 0, 0, 1, 1, 1,
1.235854, 0.2905468, 0.5256601, 1, 0, 0, 1, 1,
1.240072, -1.096897, 2.794226, 1, 0, 0, 1, 1,
1.24021, 0.8063031, 0.5650938, 1, 0, 0, 1, 1,
1.243948, -0.8333288, 1.84222, 1, 0, 0, 1, 1,
1.253295, -0.5602274, 2.012593, 1, 0, 0, 1, 1,
1.261301, -1.200565, 1.093856, 0, 0, 0, 1, 1,
1.261833, -0.4535163, 2.712839, 0, 0, 0, 1, 1,
1.262232, 0.319127, 1.979067, 0, 0, 0, 1, 1,
1.264346, 0.7935615, 1.079637, 0, 0, 0, 1, 1,
1.281357, -0.3824133, 0.5988691, 0, 0, 0, 1, 1,
1.281935, -0.8451385, 1.913529, 0, 0, 0, 1, 1,
1.282389, 0.2248602, 1.059047, 0, 0, 0, 1, 1,
1.290177, -0.3999143, 1.74074, 1, 1, 1, 1, 1,
1.291289, 1.376025, 0.5520448, 1, 1, 1, 1, 1,
1.300563, 0.003113571, 0.8158758, 1, 1, 1, 1, 1,
1.304101, -2.64754, 3.573304, 1, 1, 1, 1, 1,
1.304492, 0.06397084, 2.077952, 1, 1, 1, 1, 1,
1.329969, 1.444568, -0.6661824, 1, 1, 1, 1, 1,
1.351128, -1.423062, 2.961221, 1, 1, 1, 1, 1,
1.370169, 0.694976, 0.2791689, 1, 1, 1, 1, 1,
1.383175, -0.4814298, 2.139864, 1, 1, 1, 1, 1,
1.385855, -0.5596454, 1.241993, 1, 1, 1, 1, 1,
1.386773, -0.7197027, 1.84186, 1, 1, 1, 1, 1,
1.395068, 0.02697538, 2.57841, 1, 1, 1, 1, 1,
1.395124, -0.5151332, 1.661446, 1, 1, 1, 1, 1,
1.398531, 1.538482, -0.4843436, 1, 1, 1, 1, 1,
1.401584, -0.2346229, 0.6883496, 1, 1, 1, 1, 1,
1.411577, 0.8934146, 0.2464574, 0, 0, 1, 1, 1,
1.424135, 0.8162024, 1.466149, 1, 0, 0, 1, 1,
1.431237, -1.494596, 1.921344, 1, 0, 0, 1, 1,
1.445016, -0.2301108, 1.406369, 1, 0, 0, 1, 1,
1.446206, 0.4995801, 1.778959, 1, 0, 0, 1, 1,
1.457051, 0.8019016, 0.6437998, 1, 0, 0, 1, 1,
1.484324, 0.199124, 0.53783, 0, 0, 0, 1, 1,
1.485092, -0.7907277, 3.091411, 0, 0, 0, 1, 1,
1.487276, 0.8285612, 1.248015, 0, 0, 0, 1, 1,
1.49962, 0.6641935, 2.734258, 0, 0, 0, 1, 1,
1.510445, -1.742471, 1.859758, 0, 0, 0, 1, 1,
1.525123, 1.535893, 2.466431, 0, 0, 0, 1, 1,
1.533479, 1.022951, 0.2358585, 0, 0, 0, 1, 1,
1.539901, -0.5706679, 2.058515, 1, 1, 1, 1, 1,
1.545253, -0.9651961, 3.111773, 1, 1, 1, 1, 1,
1.553726, 1.172613, 3.605098, 1, 1, 1, 1, 1,
1.555829, -0.7269322, 0.9182637, 1, 1, 1, 1, 1,
1.55863, -0.6779642, 1.65272, 1, 1, 1, 1, 1,
1.560008, 0.7502355, 0.2211163, 1, 1, 1, 1, 1,
1.564871, -1.119622, 1.886726, 1, 1, 1, 1, 1,
1.573077, -1.019847, 2.44768, 1, 1, 1, 1, 1,
1.574575, 0.6382845, 1.924332, 1, 1, 1, 1, 1,
1.57642, -0.7770235, 3.170645, 1, 1, 1, 1, 1,
1.577151, 0.9526712, 2.54498, 1, 1, 1, 1, 1,
1.629066, -0.9004648, 2.427592, 1, 1, 1, 1, 1,
1.632349, -0.1206556, 2.276765, 1, 1, 1, 1, 1,
1.654283, -0.5450014, 1.169377, 1, 1, 1, 1, 1,
1.65498, 0.4606553, 2.042431, 1, 1, 1, 1, 1,
1.660792, 0.03234925, 1.219503, 0, 0, 1, 1, 1,
1.665869, 0.7871382, 0.2396582, 1, 0, 0, 1, 1,
1.699779, -0.1763179, 2.501212, 1, 0, 0, 1, 1,
1.707505, -0.7224099, 2.760696, 1, 0, 0, 1, 1,
1.716428, 1.061161, 2.969152, 1, 0, 0, 1, 1,
1.728932, 1.694637, 1.560887, 1, 0, 0, 1, 1,
1.75277, -1.104073, 2.649581, 0, 0, 0, 1, 1,
1.772947, 0.6166109, -0.7935558, 0, 0, 0, 1, 1,
1.782778, -2.397588, 3.036009, 0, 0, 0, 1, 1,
1.785128, -0.2922352, 0.8257017, 0, 0, 0, 1, 1,
1.796923, 1.573186, 1.87395, 0, 0, 0, 1, 1,
1.809766, 1.356923, 3.153767, 0, 0, 0, 1, 1,
1.8221, -0.1035787, 2.241746, 0, 0, 0, 1, 1,
1.835958, 1.752285, -0.1216318, 1, 1, 1, 1, 1,
1.854, 1.461229, 1.184288, 1, 1, 1, 1, 1,
1.864998, -0.850035, 2.155858, 1, 1, 1, 1, 1,
1.86934, 0.8021988, 0.666765, 1, 1, 1, 1, 1,
1.869639, -0.8314017, 2.258688, 1, 1, 1, 1, 1,
1.875686, 2.088239, -0.966089, 1, 1, 1, 1, 1,
1.899595, -1.336108, 2.126041, 1, 1, 1, 1, 1,
1.901866, -1.067703, 1.076407, 1, 1, 1, 1, 1,
1.920026, -0.3568947, 1.368963, 1, 1, 1, 1, 1,
1.946589, -0.2398395, 1.449748, 1, 1, 1, 1, 1,
1.964488, 0.005313484, 0.6801001, 1, 1, 1, 1, 1,
2.005173, 0.06953829, 0.04445292, 1, 1, 1, 1, 1,
2.037517, -0.3015772, 1.6495, 1, 1, 1, 1, 1,
2.054999, -0.9993849, 0.8297394, 1, 1, 1, 1, 1,
2.056371, -0.6690068, 1.768458, 1, 1, 1, 1, 1,
2.077347, 2.519465, 0.7133176, 0, 0, 1, 1, 1,
2.083503, 1.025266, 2.368894, 1, 0, 0, 1, 1,
2.086891, 0.2731469, 2.568686, 1, 0, 0, 1, 1,
2.11501, 1.625809, -0.4015835, 1, 0, 0, 1, 1,
2.148911, -0.2474266, 1.840667, 1, 0, 0, 1, 1,
2.199515, -1.257345, 1.992413, 1, 0, 0, 1, 1,
2.238405, 0.1027276, 2.094424, 0, 0, 0, 1, 1,
2.262763, -0.3460456, 1.626809, 0, 0, 0, 1, 1,
2.284286, -1.395798, 2.076905, 0, 0, 0, 1, 1,
2.334488, -1.497468, 2.457642, 0, 0, 0, 1, 1,
2.374967, 0.5011286, 0.2894544, 0, 0, 0, 1, 1,
2.382492, -0.5953996, 0.7207927, 0, 0, 0, 1, 1,
2.396361, 0.9192575, -0.2167423, 0, 0, 0, 1, 1,
2.511179, 0.6270605, 2.266889, 1, 1, 1, 1, 1,
2.665273, -1.204016, 1.81247, 1, 1, 1, 1, 1,
2.716943, 0.1543235, 0.7407954, 1, 1, 1, 1, 1,
2.847598, -1.189939, 0.08705352, 1, 1, 1, 1, 1,
3.078658, -0.9953116, 2.015487, 1, 1, 1, 1, 1,
3.287915, -0.6616045, 2.282999, 1, 1, 1, 1, 1,
3.52317, 1.372819, 0.4045941, 1, 1, 1, 1, 1
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
var radius = 10.13405;
var distance = 35.59543;
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
mvMatrix.translate( 0.02202129, 0.3741753, -0.0208292 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.59543);
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
