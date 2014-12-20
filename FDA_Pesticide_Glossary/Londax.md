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
-2.977651, 0.2582349, -1.789863, 1, 0, 0, 1,
-2.85379, -0.9231403, -0.794163, 1, 0.007843138, 0, 1,
-2.690071, -1.52429, -2.756939, 1, 0.01176471, 0, 1,
-2.660603, -1.886009, -3.568763, 1, 0.01960784, 0, 1,
-2.57601, 0.09052063, -0.9944085, 1, 0.02352941, 0, 1,
-2.568204, 0.9755414, -3.107828, 1, 0.03137255, 0, 1,
-2.439598, 3.175139, -1.791955, 1, 0.03529412, 0, 1,
-2.421655, -0.5646978, -2.968936, 1, 0.04313726, 0, 1,
-2.399366, 0.4306305, -2.022561, 1, 0.04705882, 0, 1,
-2.366812, -0.04294853, -1.614451, 1, 0.05490196, 0, 1,
-2.288049, 1.305183, -1.151029, 1, 0.05882353, 0, 1,
-2.201935, -0.9141392, -0.7042185, 1, 0.06666667, 0, 1,
-2.179606, 1.745888, -1.428094, 1, 0.07058824, 0, 1,
-2.177094, -0.099494, -0.6419385, 1, 0.07843138, 0, 1,
-2.176493, 0.5029776, -1.605155, 1, 0.08235294, 0, 1,
-2.170434, -0.7303461, -1.958839, 1, 0.09019608, 0, 1,
-2.159065, 0.7317687, -1.593168, 1, 0.09411765, 0, 1,
-2.107727, -0.0950014, -1.264663, 1, 0.1019608, 0, 1,
-2.091035, -0.5842057, 0.7255366, 1, 0.1098039, 0, 1,
-2.07474, -1.048494, -2.253587, 1, 0.1137255, 0, 1,
-2.06674, -0.9125724, -3.37767, 1, 0.1215686, 0, 1,
-2.02758, -1.42207, -0.5414313, 1, 0.1254902, 0, 1,
-2.011957, 0.4744858, -1.322179, 1, 0.1333333, 0, 1,
-1.978658, -0.040514, -0.2571238, 1, 0.1372549, 0, 1,
-1.970621, 1.119012, 0.06852461, 1, 0.145098, 0, 1,
-1.959642, 0.6151696, -2.336645, 1, 0.1490196, 0, 1,
-1.945006, 0.8839873, -1.116022, 1, 0.1568628, 0, 1,
-1.928147, -1.099215, -2.866099, 1, 0.1607843, 0, 1,
-1.92354, 1.520321, -3.650824, 1, 0.1686275, 0, 1,
-1.906512, 0.226442, -2.747591, 1, 0.172549, 0, 1,
-1.893215, -0.1260394, -0.5558814, 1, 0.1803922, 0, 1,
-1.870259, -0.1787581, -1.620074, 1, 0.1843137, 0, 1,
-1.855569, 1.603215, -1.713223, 1, 0.1921569, 0, 1,
-1.829835, 1.103408, -2.330246, 1, 0.1960784, 0, 1,
-1.814923, 1.091003, -3.198392, 1, 0.2039216, 0, 1,
-1.77012, -1.46711, -0.9393136, 1, 0.2117647, 0, 1,
-1.761468, -0.2410719, -3.260194, 1, 0.2156863, 0, 1,
-1.753845, 1.5725, 0.621407, 1, 0.2235294, 0, 1,
-1.752618, 1.724243, 0.6935822, 1, 0.227451, 0, 1,
-1.733256, -0.589342, -3.868867, 1, 0.2352941, 0, 1,
-1.728113, -0.6887006, -1.556034, 1, 0.2392157, 0, 1,
-1.721614, 0.7586248, -2.507371, 1, 0.2470588, 0, 1,
-1.710476, -1.147464, -1.61153, 1, 0.2509804, 0, 1,
-1.704597, 0.5728279, -1.884951, 1, 0.2588235, 0, 1,
-1.69897, 0.8295382, -1.59227, 1, 0.2627451, 0, 1,
-1.689114, -0.04135064, 0.8625993, 1, 0.2705882, 0, 1,
-1.681307, -0.4210788, -1.68792, 1, 0.2745098, 0, 1,
-1.659436, 1.075481, -2.146303, 1, 0.282353, 0, 1,
-1.644132, -0.6711394, -2.449203, 1, 0.2862745, 0, 1,
-1.63289, -0.7902575, -1.122241, 1, 0.2941177, 0, 1,
-1.614565, 1.501219, 0.01255104, 1, 0.3019608, 0, 1,
-1.613971, -1.300176, -1.469104, 1, 0.3058824, 0, 1,
-1.599302, 0.4612341, 0.4770916, 1, 0.3137255, 0, 1,
-1.588776, -1.007195, -2.319843, 1, 0.3176471, 0, 1,
-1.575404, -0.5990943, -0.4716028, 1, 0.3254902, 0, 1,
-1.574823, -1.856806, -1.640124, 1, 0.3294118, 0, 1,
-1.574146, 1.937742, 0.1344273, 1, 0.3372549, 0, 1,
-1.571206, -0.4637379, -2.70661, 1, 0.3411765, 0, 1,
-1.569448, 0.9140839, -0.9376543, 1, 0.3490196, 0, 1,
-1.560872, 0.9214888, -1.545852, 1, 0.3529412, 0, 1,
-1.55969, -1.726218, -2.212238, 1, 0.3607843, 0, 1,
-1.559583, 1.146142, -1.81947, 1, 0.3647059, 0, 1,
-1.553635, -0.6375796, -1.901564, 1, 0.372549, 0, 1,
-1.540626, -0.3892417, -1.928537, 1, 0.3764706, 0, 1,
-1.536888, -0.4119848, -1.37807, 1, 0.3843137, 0, 1,
-1.514072, -0.3724619, -1.862601, 1, 0.3882353, 0, 1,
-1.510467, 0.1677852, -0.7913082, 1, 0.3960784, 0, 1,
-1.504206, 1.737121, -0.1596038, 1, 0.4039216, 0, 1,
-1.501892, -1.236056, -2.050327, 1, 0.4078431, 0, 1,
-1.477873, 0.1304979, -1.099963, 1, 0.4156863, 0, 1,
-1.473892, 0.08888097, -1.353913, 1, 0.4196078, 0, 1,
-1.462887, -0.8030963, -2.529559, 1, 0.427451, 0, 1,
-1.4619, -0.1071445, -3.096399, 1, 0.4313726, 0, 1,
-1.451667, 0.91904, 0.4105525, 1, 0.4392157, 0, 1,
-1.445742, -1.629967, -1.472547, 1, 0.4431373, 0, 1,
-1.436599, 0.8517064, -0.0407817, 1, 0.4509804, 0, 1,
-1.421192, 0.4689526, -1.230249, 1, 0.454902, 0, 1,
-1.419749, -1.816012, -2.927453, 1, 0.4627451, 0, 1,
-1.413848, 0.7320576, -2.508072, 1, 0.4666667, 0, 1,
-1.409282, -0.3487346, -2.39309, 1, 0.4745098, 0, 1,
-1.385311, -1.458849, -2.602556, 1, 0.4784314, 0, 1,
-1.382375, 0.7922229, 0.3208138, 1, 0.4862745, 0, 1,
-1.377919, 1.448473, 0.4225551, 1, 0.4901961, 0, 1,
-1.373309, 0.2147074, -1.409709, 1, 0.4980392, 0, 1,
-1.36845, 1.055948, -0.02072672, 1, 0.5058824, 0, 1,
-1.351603, -1.584167, -0.1372909, 1, 0.509804, 0, 1,
-1.339826, 0.7047773, 0.9511253, 1, 0.5176471, 0, 1,
-1.334701, -0.9768461, -2.385578, 1, 0.5215687, 0, 1,
-1.332597, -1.602352, -3.865054, 1, 0.5294118, 0, 1,
-1.329665, -0.3362272, -2.875806, 1, 0.5333334, 0, 1,
-1.32465, 0.8671328, -0.8834151, 1, 0.5411765, 0, 1,
-1.322115, -0.7658325, -3.192638, 1, 0.5450981, 0, 1,
-1.317481, 0.5379249, -0.3496456, 1, 0.5529412, 0, 1,
-1.31456, -0.7300407, -1.752558, 1, 0.5568628, 0, 1,
-1.314146, 0.1964412, -2.004748, 1, 0.5647059, 0, 1,
-1.306737, 1.309371, -0.9932193, 1, 0.5686275, 0, 1,
-1.301668, 0.6476029, -1.13621, 1, 0.5764706, 0, 1,
-1.300173, 1.280097, 0.4817609, 1, 0.5803922, 0, 1,
-1.295491, 0.3617938, 1.228431, 1, 0.5882353, 0, 1,
-1.293613, 0.2416819, -3.067034, 1, 0.5921569, 0, 1,
-1.29022, 0.6163239, -0.974331, 1, 0.6, 0, 1,
-1.272082, -0.1300133, -1.278296, 1, 0.6078432, 0, 1,
-1.263782, -2.265524, -3.556805, 1, 0.6117647, 0, 1,
-1.263737, 1.061171, -1.110303, 1, 0.6196079, 0, 1,
-1.25384, 0.2437165, -0.8410036, 1, 0.6235294, 0, 1,
-1.250171, 0.5118151, -3.103958, 1, 0.6313726, 0, 1,
-1.247631, -0.2179989, -1.324444, 1, 0.6352941, 0, 1,
-1.244056, -0.5054321, -1.469932, 1, 0.6431373, 0, 1,
-1.229904, 1.151858, -1.933591, 1, 0.6470588, 0, 1,
-1.229358, -0.05233916, -2.004609, 1, 0.654902, 0, 1,
-1.210759, -0.7916812, -3.311451, 1, 0.6588235, 0, 1,
-1.20768, -0.5578399, -2.839045, 1, 0.6666667, 0, 1,
-1.199663, -0.9355959, -2.427879, 1, 0.6705883, 0, 1,
-1.191775, -0.7615222, -2.680679, 1, 0.6784314, 0, 1,
-1.187958, -0.2174493, -2.529372, 1, 0.682353, 0, 1,
-1.187123, 1.011632, -0.00911198, 1, 0.6901961, 0, 1,
-1.182258, -0.8300537, -2.093468, 1, 0.6941177, 0, 1,
-1.180041, -0.6445194, -0.4156477, 1, 0.7019608, 0, 1,
-1.17875, -0.3213553, -2.010858, 1, 0.7098039, 0, 1,
-1.176461, -0.2176775, -2.591846, 1, 0.7137255, 0, 1,
-1.170197, -1.09535, -1.987032, 1, 0.7215686, 0, 1,
-1.168324, -0.9041751, -2.768074, 1, 0.7254902, 0, 1,
-1.143057, 0.7587675, 0.3774796, 1, 0.7333333, 0, 1,
-1.139511, 0.1892787, -2.334997, 1, 0.7372549, 0, 1,
-1.138716, 0.7934173, -1.256913, 1, 0.7450981, 0, 1,
-1.13087, -0.1862022, -0.3001123, 1, 0.7490196, 0, 1,
-1.125065, 1.874595, -1.220232, 1, 0.7568628, 0, 1,
-1.122314, -0.09088819, -1.145417, 1, 0.7607843, 0, 1,
-1.11965, -1.334036, -0.8180377, 1, 0.7686275, 0, 1,
-1.115056, 1.79648, -2.322029, 1, 0.772549, 0, 1,
-1.113148, 0.6800429, -0.4969332, 1, 0.7803922, 0, 1,
-1.11221, 0.02972527, -0.86485, 1, 0.7843137, 0, 1,
-1.11017, -1.04041, -2.420885, 1, 0.7921569, 0, 1,
-1.108646, 0.6167601, -0.3899546, 1, 0.7960784, 0, 1,
-1.102333, 0.2367874, -2.12878, 1, 0.8039216, 0, 1,
-1.100496, 1.090957, -0.5043189, 1, 0.8117647, 0, 1,
-1.098985, 0.2390763, -1.894152, 1, 0.8156863, 0, 1,
-1.092158, 0.08636031, -2.942107, 1, 0.8235294, 0, 1,
-1.09042, -1.027156, -2.267998, 1, 0.827451, 0, 1,
-1.085239, -0.3643609, -1.930846, 1, 0.8352941, 0, 1,
-1.080147, 0.25788, -0.8130286, 1, 0.8392157, 0, 1,
-1.077459, -0.4578764, -2.653911, 1, 0.8470588, 0, 1,
-1.072972, -1.178631, -3.063913, 1, 0.8509804, 0, 1,
-1.071928, -0.9169143, -1.31151, 1, 0.8588235, 0, 1,
-1.068733, 2.055871, -1.258229, 1, 0.8627451, 0, 1,
-1.061048, -0.5029984, -1.36967, 1, 0.8705882, 0, 1,
-1.055434, 0.05088973, -0.4948182, 1, 0.8745098, 0, 1,
-1.054335, 0.9849893, -0.4205412, 1, 0.8823529, 0, 1,
-1.045237, 0.9381939, -0.7774469, 1, 0.8862745, 0, 1,
-1.044227, -0.627172, -3.541829, 1, 0.8941177, 0, 1,
-1.043376, -1.594125, -2.796248, 1, 0.8980392, 0, 1,
-1.025546, 0.2710747, -1.003809, 1, 0.9058824, 0, 1,
-1.02041, -1.877627, 0.3253542, 1, 0.9137255, 0, 1,
-1.005187, 0.09195839, -2.327875, 1, 0.9176471, 0, 1,
-1.003369, 0.1950658, -0.8151412, 1, 0.9254902, 0, 1,
-0.9962384, -0.9836872, -3.210456, 1, 0.9294118, 0, 1,
-0.9860439, 0.1068191, -2.278381, 1, 0.9372549, 0, 1,
-0.9778008, -0.5293179, -2.158964, 1, 0.9411765, 0, 1,
-0.9763108, 0.4475845, -0.9404644, 1, 0.9490196, 0, 1,
-0.9755644, -0.9652072, -1.58355, 1, 0.9529412, 0, 1,
-0.9748521, -0.2035201, -1.946267, 1, 0.9607843, 0, 1,
-0.9724583, -0.2207422, -0.4919167, 1, 0.9647059, 0, 1,
-0.9667346, -0.4940344, -3.452607, 1, 0.972549, 0, 1,
-0.9623998, 1.273355, -1.608795, 1, 0.9764706, 0, 1,
-0.9595376, -0.503537, -0.04727177, 1, 0.9843137, 0, 1,
-0.9554576, -0.173427, -1.415646, 1, 0.9882353, 0, 1,
-0.952773, -0.390347, -1.455483, 1, 0.9960784, 0, 1,
-0.9514289, 1.194092, 0.1320629, 0.9960784, 1, 0, 1,
-0.943436, 1.628827, 0.4182015, 0.9921569, 1, 0, 1,
-0.9417433, 1.28603, -2.562648, 0.9843137, 1, 0, 1,
-0.9416564, -0.5510541, -3.613848, 0.9803922, 1, 0, 1,
-0.9396339, -0.5399562, -2.764279, 0.972549, 1, 0, 1,
-0.9386389, 1.245499, 0.285835, 0.9686275, 1, 0, 1,
-0.9380744, -0.4096789, -2.502523, 0.9607843, 1, 0, 1,
-0.9379178, 0.7257028, 0.1202001, 0.9568627, 1, 0, 1,
-0.9366807, 0.7522, 2.009794, 0.9490196, 1, 0, 1,
-0.9355097, -0.1704634, -2.525732, 0.945098, 1, 0, 1,
-0.9343863, 1.088479, 0.01654731, 0.9372549, 1, 0, 1,
-0.9321042, -0.6574057, -1.926647, 0.9333333, 1, 0, 1,
-0.9282784, -0.487456, -1.850936, 0.9254902, 1, 0, 1,
-0.9266676, 0.5818592, -1.869389, 0.9215686, 1, 0, 1,
-0.9236796, -1.062551, -2.694168, 0.9137255, 1, 0, 1,
-0.9235882, -0.1643547, -1.623681, 0.9098039, 1, 0, 1,
-0.9113898, -1.22546, -2.467761, 0.9019608, 1, 0, 1,
-0.9092431, 0.6556948, -0.3812459, 0.8941177, 1, 0, 1,
-0.9070948, -0.05778438, -2.931147, 0.8901961, 1, 0, 1,
-0.9025996, 0.6576461, -1.085637, 0.8823529, 1, 0, 1,
-0.8994901, -1.313269, -1.709986, 0.8784314, 1, 0, 1,
-0.8923746, -1.231045, -2.587548, 0.8705882, 1, 0, 1,
-0.8895305, -0.2504757, -1.886396, 0.8666667, 1, 0, 1,
-0.8883982, -0.07450969, -2.73634, 0.8588235, 1, 0, 1,
-0.8879746, -1.045946, -1.989975, 0.854902, 1, 0, 1,
-0.8866878, 0.6399922, -0.740091, 0.8470588, 1, 0, 1,
-0.8802223, 0.5348594, -1.241045, 0.8431373, 1, 0, 1,
-0.8780745, -1.846583, -4.394778, 0.8352941, 1, 0, 1,
-0.8763635, -0.5558412, -0.9887792, 0.8313726, 1, 0, 1,
-0.8751639, 1.719267, -2.338967, 0.8235294, 1, 0, 1,
-0.8719271, -0.9080351, -3.121588, 0.8196079, 1, 0, 1,
-0.8700107, -1.851248, -3.024132, 0.8117647, 1, 0, 1,
-0.8660866, 1.560024, -0.7332919, 0.8078431, 1, 0, 1,
-0.8657082, 1.605923, -0.6644838, 0.8, 1, 0, 1,
-0.8591475, 0.6536466, -1.282101, 0.7921569, 1, 0, 1,
-0.85737, -0.1638202, -2.40992, 0.7882353, 1, 0, 1,
-0.8548368, -0.06211422, -0.07203148, 0.7803922, 1, 0, 1,
-0.8513782, -0.5226855, -2.432103, 0.7764706, 1, 0, 1,
-0.841181, -0.4382248, -2.080191, 0.7686275, 1, 0, 1,
-0.839512, 0.07028866, -2.50959, 0.7647059, 1, 0, 1,
-0.8367779, -0.04681028, -1.761469, 0.7568628, 1, 0, 1,
-0.833919, 1.698206, -0.7014585, 0.7529412, 1, 0, 1,
-0.8304102, 0.2533324, -1.172065, 0.7450981, 1, 0, 1,
-0.8272885, 0.5754964, -2.62443, 0.7411765, 1, 0, 1,
-0.8261808, 0.376696, -0.2242277, 0.7333333, 1, 0, 1,
-0.8261669, 0.3819387, -0.4590651, 0.7294118, 1, 0, 1,
-0.8215008, 0.3207931, -2.258424, 0.7215686, 1, 0, 1,
-0.820895, 0.7216465, -1.490435, 0.7176471, 1, 0, 1,
-0.8118342, 0.615601, -0.5726758, 0.7098039, 1, 0, 1,
-0.8060585, 0.3219784, 0.0115798, 0.7058824, 1, 0, 1,
-0.7966565, 1.104879, -1.973958, 0.6980392, 1, 0, 1,
-0.7878173, -0.04674365, -0.4504194, 0.6901961, 1, 0, 1,
-0.787307, 0.379094, 0.6027594, 0.6862745, 1, 0, 1,
-0.7864571, 1.155449, -1.763281, 0.6784314, 1, 0, 1,
-0.7834217, -0.2144264, -1.945528, 0.6745098, 1, 0, 1,
-0.778473, -1.507929, -0.7692355, 0.6666667, 1, 0, 1,
-0.7779503, -1.300216, -3.134011, 0.6627451, 1, 0, 1,
-0.7758399, -0.05629731, -2.046975, 0.654902, 1, 0, 1,
-0.7709233, 0.4606853, -3.334085, 0.6509804, 1, 0, 1,
-0.7682591, -0.2533801, -2.772449, 0.6431373, 1, 0, 1,
-0.766661, -2.099387, -1.538438, 0.6392157, 1, 0, 1,
-0.7632254, 0.214933, -0.7814123, 0.6313726, 1, 0, 1,
-0.7576495, 0.08444441, -1.60042, 0.627451, 1, 0, 1,
-0.7514747, 0.1946764, -1.676827, 0.6196079, 1, 0, 1,
-0.7493495, -1.707158, -2.973005, 0.6156863, 1, 0, 1,
-0.7453902, 1.169894, -0.7221941, 0.6078432, 1, 0, 1,
-0.7406673, -0.3487077, -3.127755, 0.6039216, 1, 0, 1,
-0.7404229, -0.198766, -3.387787, 0.5960785, 1, 0, 1,
-0.7377192, 1.454131, 1.452132, 0.5882353, 1, 0, 1,
-0.7339173, 1.8835, -0.1044457, 0.5843138, 1, 0, 1,
-0.7323157, -1.219098, -3.68414, 0.5764706, 1, 0, 1,
-0.7296529, 2.396755, 1.213489, 0.572549, 1, 0, 1,
-0.7234758, 0.3700547, -3.633455, 0.5647059, 1, 0, 1,
-0.7231836, 0.6530728, -1.571345, 0.5607843, 1, 0, 1,
-0.7190847, 2.221229, -1.208976, 0.5529412, 1, 0, 1,
-0.7167239, 0.8902128, -1.262156, 0.5490196, 1, 0, 1,
-0.7114037, -0.2984636, -1.916494, 0.5411765, 1, 0, 1,
-0.7103331, -0.4394491, -2.152075, 0.5372549, 1, 0, 1,
-0.7074664, -1.045058, -3.945231, 0.5294118, 1, 0, 1,
-0.7048288, 0.894887, 0.02467449, 0.5254902, 1, 0, 1,
-0.6990289, 0.3248811, -1.053563, 0.5176471, 1, 0, 1,
-0.6949967, -0.4610032, -2.569265, 0.5137255, 1, 0, 1,
-0.6918752, 0.3128201, -2.360056, 0.5058824, 1, 0, 1,
-0.6909662, 0.4509611, -1.786134, 0.5019608, 1, 0, 1,
-0.690963, -0.3322806, -1.764045, 0.4941176, 1, 0, 1,
-0.6893239, 0.3496836, 0.4908361, 0.4862745, 1, 0, 1,
-0.6882577, -0.2313887, -2.013784, 0.4823529, 1, 0, 1,
-0.6832932, 1.131509, 0.2280704, 0.4745098, 1, 0, 1,
-0.6714365, -1.479509, -1.839808, 0.4705882, 1, 0, 1,
-0.6713972, 0.7306908, -2.965322, 0.4627451, 1, 0, 1,
-0.670705, 1.207612, -1.798145, 0.4588235, 1, 0, 1,
-0.6673518, 0.6573154, -1.436079, 0.4509804, 1, 0, 1,
-0.6572397, -0.5652219, -2.565732, 0.4470588, 1, 0, 1,
-0.6529388, 0.672692, 0.5049602, 0.4392157, 1, 0, 1,
-0.649703, -0.646053, -2.462766, 0.4352941, 1, 0, 1,
-0.6461929, -1.15286, -2.19421, 0.427451, 1, 0, 1,
-0.645245, 0.6971475, 0.05776849, 0.4235294, 1, 0, 1,
-0.6436139, -1.002414, -3.381232, 0.4156863, 1, 0, 1,
-0.6358566, -0.7416324, -3.436274, 0.4117647, 1, 0, 1,
-0.6352189, -0.7314087, -0.0816609, 0.4039216, 1, 0, 1,
-0.6341332, 0.4459676, -1.477649, 0.3960784, 1, 0, 1,
-0.6319121, -0.6495883, -0.4849605, 0.3921569, 1, 0, 1,
-0.6301082, -0.07788107, 0.0005990341, 0.3843137, 1, 0, 1,
-0.6286657, -2.183266, -3.86868, 0.3803922, 1, 0, 1,
-0.6211513, 0.6038747, 0.500303, 0.372549, 1, 0, 1,
-0.6187526, 1.865507, -1.307146, 0.3686275, 1, 0, 1,
-0.6183534, 0.1640342, 0.2683966, 0.3607843, 1, 0, 1,
-0.6180922, 0.6502218, -1.074091, 0.3568628, 1, 0, 1,
-0.6146319, 0.01439115, -2.454486, 0.3490196, 1, 0, 1,
-0.6119605, 0.8378655, -0.8297954, 0.345098, 1, 0, 1,
-0.6117212, 0.814235, -1.301437, 0.3372549, 1, 0, 1,
-0.6113197, -0.3001887, -1.965115, 0.3333333, 1, 0, 1,
-0.6095406, -1.086441, -2.62636, 0.3254902, 1, 0, 1,
-0.6064819, 0.4645504, -1.61843, 0.3215686, 1, 0, 1,
-0.6050954, 0.2994482, -2.186222, 0.3137255, 1, 0, 1,
-0.6042527, 1.130861, 1.463699, 0.3098039, 1, 0, 1,
-0.6037232, -1.206699, -1.512506, 0.3019608, 1, 0, 1,
-0.6026801, 1.721151, 0.1474674, 0.2941177, 1, 0, 1,
-0.5995066, 0.6003188, -1.468916, 0.2901961, 1, 0, 1,
-0.5977083, 0.3299779, -1.426735, 0.282353, 1, 0, 1,
-0.5955224, -0.4473993, -1.890516, 0.2784314, 1, 0, 1,
-0.5943261, 0.8875925, -1.20421, 0.2705882, 1, 0, 1,
-0.5930593, -0.9913872, -3.85309, 0.2666667, 1, 0, 1,
-0.5878588, -0.7303059, -4.484403, 0.2588235, 1, 0, 1,
-0.586309, -1.110436, -3.220648, 0.254902, 1, 0, 1,
-0.5805578, -0.3101694, -1.771091, 0.2470588, 1, 0, 1,
-0.5755219, -0.3846802, -2.685827, 0.2431373, 1, 0, 1,
-0.5736877, 1.079479, 0.006367956, 0.2352941, 1, 0, 1,
-0.5733628, 0.03073991, -1.480306, 0.2313726, 1, 0, 1,
-0.5696725, -0.3471063, -2.9816, 0.2235294, 1, 0, 1,
-0.5672577, 0.4125251, 0.01987613, 0.2196078, 1, 0, 1,
-0.5671653, -1.044438, -1.117926, 0.2117647, 1, 0, 1,
-0.5651026, 0.1015195, -1.092533, 0.2078431, 1, 0, 1,
-0.5642973, -1.283353, -2.378198, 0.2, 1, 0, 1,
-0.561319, -0.5406253, -2.54722, 0.1921569, 1, 0, 1,
-0.5543911, 0.4076883, -1.486221, 0.1882353, 1, 0, 1,
-0.5525088, 0.04193687, -2.286353, 0.1803922, 1, 0, 1,
-0.5510815, -0.1088621, -1.928782, 0.1764706, 1, 0, 1,
-0.5506242, -0.6052992, -2.197605, 0.1686275, 1, 0, 1,
-0.5493282, -0.04719208, -1.850462, 0.1647059, 1, 0, 1,
-0.5491853, -2.19346, -3.08184, 0.1568628, 1, 0, 1,
-0.5466156, -0.7914373, -1.567922, 0.1529412, 1, 0, 1,
-0.5451254, -1.676566, -3.289179, 0.145098, 1, 0, 1,
-0.5439236, -0.5116867, -0.4717491, 0.1411765, 1, 0, 1,
-0.5390222, -0.7907042, -1.018854, 0.1333333, 1, 0, 1,
-0.5386778, 0.5739108, -1.237565, 0.1294118, 1, 0, 1,
-0.5374048, 1.687493, 0.1603725, 0.1215686, 1, 0, 1,
-0.5362608, -1.593292, -3.429413, 0.1176471, 1, 0, 1,
-0.5361416, 1.191668, -0.122867, 0.1098039, 1, 0, 1,
-0.534151, -0.6294497, -1.303132, 0.1058824, 1, 0, 1,
-0.534014, -0.6974947, -2.937411, 0.09803922, 1, 0, 1,
-0.5332502, 0.5259361, -0.7021573, 0.09019608, 1, 0, 1,
-0.5280555, 1.108512, -1.192994, 0.08627451, 1, 0, 1,
-0.5191647, 0.4835808, -0.9096164, 0.07843138, 1, 0, 1,
-0.5108209, -1.12221, -2.02534, 0.07450981, 1, 0, 1,
-0.5078837, -0.3180754, -1.891972, 0.06666667, 1, 0, 1,
-0.5078334, -1.522719, -3.602348, 0.0627451, 1, 0, 1,
-0.5069785, 0.7357374, -0.4911672, 0.05490196, 1, 0, 1,
-0.5051806, -0.9018152, -2.779171, 0.05098039, 1, 0, 1,
-0.5040945, 0.4763676, 0.2499959, 0.04313726, 1, 0, 1,
-0.5009727, 0.8425048, -0.9749646, 0.03921569, 1, 0, 1,
-0.4986077, -0.3307313, -3.455208, 0.03137255, 1, 0, 1,
-0.4922855, 1.350288, -0.4184284, 0.02745098, 1, 0, 1,
-0.4906748, 1.291746, 0.001321375, 0.01960784, 1, 0, 1,
-0.4865579, 0.2673317, -0.8449969, 0.01568628, 1, 0, 1,
-0.4809869, -0.6070095, -2.060899, 0.007843138, 1, 0, 1,
-0.4795817, 0.6803478, -0.8412647, 0.003921569, 1, 0, 1,
-0.4781218, 0.1075546, -1.095727, 0, 1, 0.003921569, 1,
-0.4760926, 0.6044375, 0.2390243, 0, 1, 0.01176471, 1,
-0.4718435, -0.6705566, -2.247631, 0, 1, 0.01568628, 1,
-0.4617533, 1.827168, -0.8314831, 0, 1, 0.02352941, 1,
-0.4611783, 0.571492, 0.8985079, 0, 1, 0.02745098, 1,
-0.4607331, 0.09212666, -0.4248694, 0, 1, 0.03529412, 1,
-0.4604386, 1.496629, -0.1083492, 0, 1, 0.03921569, 1,
-0.4587412, 1.021358, -0.2402202, 0, 1, 0.04705882, 1,
-0.45681, -1.428659, -2.699388, 0, 1, 0.05098039, 1,
-0.4563389, -1.167512, -4.237088, 0, 1, 0.05882353, 1,
-0.4515554, -1.234605, -3.171641, 0, 1, 0.0627451, 1,
-0.4478838, 0.4539723, -0.1513193, 0, 1, 0.07058824, 1,
-0.4426267, 1.474655, -1.04663, 0, 1, 0.07450981, 1,
-0.4386673, 0.5462132, -0.7554423, 0, 1, 0.08235294, 1,
-0.436899, -0.1334634, -3.420084, 0, 1, 0.08627451, 1,
-0.433762, -0.2576404, -2.975606, 0, 1, 0.09411765, 1,
-0.4335513, -0.2297209, -0.4952917, 0, 1, 0.1019608, 1,
-0.4262223, 0.4845454, 0.6357879, 0, 1, 0.1058824, 1,
-0.422296, -0.3817508, -1.074901, 0, 1, 0.1137255, 1,
-0.4202824, -2.392817, -3.715184, 0, 1, 0.1176471, 1,
-0.4189125, 2.176992, 1.574505, 0, 1, 0.1254902, 1,
-0.4153027, 0.2691644, -1.314876, 0, 1, 0.1294118, 1,
-0.4140405, 0.1198619, -0.7110251, 0, 1, 0.1372549, 1,
-0.4051402, -1.839991, -2.946709, 0, 1, 0.1411765, 1,
-0.4005949, 1.078847, -0.271882, 0, 1, 0.1490196, 1,
-0.3963533, -0.08856889, -1.487829, 0, 1, 0.1529412, 1,
-0.3939789, -0.3882276, -2.799831, 0, 1, 0.1607843, 1,
-0.3911194, 0.9953687, -0.6472408, 0, 1, 0.1647059, 1,
-0.3909112, 0.5317201, -0.5510074, 0, 1, 0.172549, 1,
-0.3876719, -0.5500146, -2.970141, 0, 1, 0.1764706, 1,
-0.3874556, -0.782931, -1.812262, 0, 1, 0.1843137, 1,
-0.3850787, -2.329196, -2.914235, 0, 1, 0.1882353, 1,
-0.3818533, 0.3988361, 0.3350023, 0, 1, 0.1960784, 1,
-0.3788424, -1.318642, -4.195973, 0, 1, 0.2039216, 1,
-0.3740085, -0.3769462, -0.5114683, 0, 1, 0.2078431, 1,
-0.3702859, 1.311311, -0.402594, 0, 1, 0.2156863, 1,
-0.368577, -0.5935687, -4.595226, 0, 1, 0.2196078, 1,
-0.3652339, 2.84595, 1.081577, 0, 1, 0.227451, 1,
-0.3630484, 0.1974686, 0.1312608, 0, 1, 0.2313726, 1,
-0.3612008, -0.6732662, -0.5700148, 0, 1, 0.2392157, 1,
-0.3603151, -0.403454, -2.853872, 0, 1, 0.2431373, 1,
-0.3575689, 0.183878, -1.108855, 0, 1, 0.2509804, 1,
-0.3520301, -0.6846197, -2.923273, 0, 1, 0.254902, 1,
-0.3473952, -0.1033395, -2.364874, 0, 1, 0.2627451, 1,
-0.3435174, -0.6700697, -1.32964, 0, 1, 0.2666667, 1,
-0.3403278, -0.3306966, -2.17652, 0, 1, 0.2745098, 1,
-0.339135, -0.4872038, -2.091511, 0, 1, 0.2784314, 1,
-0.3355475, -0.8172597, -3.988134, 0, 1, 0.2862745, 1,
-0.3335503, 0.4305337, 0.7224846, 0, 1, 0.2901961, 1,
-0.3311004, -0.07520942, 0.2482109, 0, 1, 0.2980392, 1,
-0.3271904, -0.3672736, -1.284095, 0, 1, 0.3058824, 1,
-0.3269359, -0.5011875, -4.67454, 0, 1, 0.3098039, 1,
-0.325872, -0.520341, -2.739262, 0, 1, 0.3176471, 1,
-0.3226587, 0.5969541, 0.6636454, 0, 1, 0.3215686, 1,
-0.3220122, -1.27555, -2.650824, 0, 1, 0.3294118, 1,
-0.3197597, 0.4980474, -1.229924, 0, 1, 0.3333333, 1,
-0.3190899, 0.4158423, -1.197034, 0, 1, 0.3411765, 1,
-0.316531, -0.7643087, -1.66387, 0, 1, 0.345098, 1,
-0.3163512, -1.814127, -2.972721, 0, 1, 0.3529412, 1,
-0.3142935, 0.05602112, -0.9795985, 0, 1, 0.3568628, 1,
-0.3123966, 0.1809435, 0.414016, 0, 1, 0.3647059, 1,
-0.3115575, -0.3364443, -1.835142, 0, 1, 0.3686275, 1,
-0.3090453, -1.078465, -3.326534, 0, 1, 0.3764706, 1,
-0.3089096, -0.7621121, -0.9198063, 0, 1, 0.3803922, 1,
-0.3052275, 0.3299958, 0.3054294, 0, 1, 0.3882353, 1,
-0.303697, -0.3468023, -2.287303, 0, 1, 0.3921569, 1,
-0.3030574, -0.05136503, -1.821051, 0, 1, 0.4, 1,
-0.302833, -0.3889329, -3.657039, 0, 1, 0.4078431, 1,
-0.3012346, -0.2056029, -3.827301, 0, 1, 0.4117647, 1,
-0.3009683, -1.341427, -2.387643, 0, 1, 0.4196078, 1,
-0.2997718, 1.508678, 0.2582099, 0, 1, 0.4235294, 1,
-0.2975704, 0.6612962, -0.4119937, 0, 1, 0.4313726, 1,
-0.2908715, 0.570327, -0.6629484, 0, 1, 0.4352941, 1,
-0.2862274, 0.4033877, -0.9277188, 0, 1, 0.4431373, 1,
-0.2860088, -0.4318433, -0.1858439, 0, 1, 0.4470588, 1,
-0.2833526, -0.2369326, -1.553889, 0, 1, 0.454902, 1,
-0.2832929, -1.401201, -2.896142, 0, 1, 0.4588235, 1,
-0.2819983, -0.4657221, -2.753296, 0, 1, 0.4666667, 1,
-0.2817205, -1.607189, -2.96813, 0, 1, 0.4705882, 1,
-0.2754374, 0.9268473, -0.01790967, 0, 1, 0.4784314, 1,
-0.2731697, -0.015001, -3.453161, 0, 1, 0.4823529, 1,
-0.2675716, 0.3896886, -1.013776, 0, 1, 0.4901961, 1,
-0.2673218, 1.958067, 1.005212, 0, 1, 0.4941176, 1,
-0.2662978, 0.6560947, 0.3427136, 0, 1, 0.5019608, 1,
-0.2612875, 1.141204, 0.4669499, 0, 1, 0.509804, 1,
-0.2603845, 1.342794, 1.025583, 0, 1, 0.5137255, 1,
-0.2600855, 0.2195797, 0.3644136, 0, 1, 0.5215687, 1,
-0.2567429, -0.5345262, -2.43499, 0, 1, 0.5254902, 1,
-0.2552834, 0.5771878, -0.2466161, 0, 1, 0.5333334, 1,
-0.254878, 1.097539, -0.02033884, 0, 1, 0.5372549, 1,
-0.2544175, -0.9589283, -2.398393, 0, 1, 0.5450981, 1,
-0.253016, 0.4686828, -0.7241816, 0, 1, 0.5490196, 1,
-0.2487838, -0.4654946, -2.628627, 0, 1, 0.5568628, 1,
-0.2483105, 1.067016, -1.069737, 0, 1, 0.5607843, 1,
-0.2428763, -1.939415, -2.878489, 0, 1, 0.5686275, 1,
-0.2426693, -0.9611645, -2.583391, 0, 1, 0.572549, 1,
-0.2359932, -0.2561264, -2.295274, 0, 1, 0.5803922, 1,
-0.2326283, 1.660755, 1.374921, 0, 1, 0.5843138, 1,
-0.2279456, -0.1421172, -2.285314, 0, 1, 0.5921569, 1,
-0.2250573, -0.7605606, -3.191319, 0, 1, 0.5960785, 1,
-0.2242171, -0.1696109, -1.991271, 0, 1, 0.6039216, 1,
-0.2224644, 0.6873203, 0.2267757, 0, 1, 0.6117647, 1,
-0.2224038, 1.656003, 0.248695, 0, 1, 0.6156863, 1,
-0.2207291, 1.966009, -0.160307, 0, 1, 0.6235294, 1,
-0.2198149, 0.1492951, -0.5015495, 0, 1, 0.627451, 1,
-0.2172082, 0.5788627, 0.5139273, 0, 1, 0.6352941, 1,
-0.2145609, 0.4898199, -0.1962329, 0, 1, 0.6392157, 1,
-0.2119425, -0.7009165, -3.223017, 0, 1, 0.6470588, 1,
-0.2090037, -0.972988, -3.860957, 0, 1, 0.6509804, 1,
-0.1968053, 0.8445156, 1.144686, 0, 1, 0.6588235, 1,
-0.1961975, -1.127859, -4.321841, 0, 1, 0.6627451, 1,
-0.1938615, 0.503487, -0.4173798, 0, 1, 0.6705883, 1,
-0.180422, 0.7242911, -1.389842, 0, 1, 0.6745098, 1,
-0.1787699, -1.655851, -2.872963, 0, 1, 0.682353, 1,
-0.1786075, -0.9558781, -3.995018, 0, 1, 0.6862745, 1,
-0.178284, -1.273164, -3.350803, 0, 1, 0.6941177, 1,
-0.1753216, -0.5795904, -0.3558054, 0, 1, 0.7019608, 1,
-0.1719377, -0.430054, -1.623342, 0, 1, 0.7058824, 1,
-0.1706697, -0.08701289, -2.165413, 0, 1, 0.7137255, 1,
-0.1645388, -1.753802, -2.730458, 0, 1, 0.7176471, 1,
-0.1595915, -0.3723093, -1.655609, 0, 1, 0.7254902, 1,
-0.1581924, 0.1044071, 0.1814056, 0, 1, 0.7294118, 1,
-0.1491143, 0.9307425, -0.772971, 0, 1, 0.7372549, 1,
-0.1463292, 0.04327259, -0.9475757, 0, 1, 0.7411765, 1,
-0.1415936, -0.9945276, -2.643654, 0, 1, 0.7490196, 1,
-0.1390278, 0.6371514, 1.260917, 0, 1, 0.7529412, 1,
-0.136774, -0.2551561, -2.498151, 0, 1, 0.7607843, 1,
-0.1347871, 0.6301915, 0.574275, 0, 1, 0.7647059, 1,
-0.1323965, -0.1671985, -1.660768, 0, 1, 0.772549, 1,
-0.1311004, 0.1096165, -1.362244, 0, 1, 0.7764706, 1,
-0.1308042, 0.5510302, -0.304201, 0, 1, 0.7843137, 1,
-0.1257806, -0.4769276, -2.689723, 0, 1, 0.7882353, 1,
-0.1240007, -0.8437198, -2.549045, 0, 1, 0.7960784, 1,
-0.1239919, -0.7044312, -1.959159, 0, 1, 0.8039216, 1,
-0.1233881, 0.8083762, -0.2828594, 0, 1, 0.8078431, 1,
-0.1221516, -0.3814505, -2.389045, 0, 1, 0.8156863, 1,
-0.1089677, 0.3881559, 0.06579328, 0, 1, 0.8196079, 1,
-0.1070109, 0.9152218, -0.6558512, 0, 1, 0.827451, 1,
-0.1056283, -1.014666, -3.057707, 0, 1, 0.8313726, 1,
-0.1021637, 0.09059608, -1.263237, 0, 1, 0.8392157, 1,
-0.1012159, -0.07214965, -2.311453, 0, 1, 0.8431373, 1,
-0.1004379, -0.1538515, -2.72019, 0, 1, 0.8509804, 1,
-0.0949569, 1.675966, -1.60483, 0, 1, 0.854902, 1,
-0.09371014, -0.2005806, -2.833821, 0, 1, 0.8627451, 1,
-0.09350456, 0.660688, 0.3168205, 0, 1, 0.8666667, 1,
-0.0928332, 0.661325, 1.000676, 0, 1, 0.8745098, 1,
-0.09203173, 0.6883792, 0.8521178, 0, 1, 0.8784314, 1,
-0.08892833, 0.9019737, -1.047305, 0, 1, 0.8862745, 1,
-0.08719868, -0.3346329, -4.346071, 0, 1, 0.8901961, 1,
-0.0849427, -0.6831799, -2.381947, 0, 1, 0.8980392, 1,
-0.0833047, 1.603049, -0.4803723, 0, 1, 0.9058824, 1,
-0.08137015, 1.709664, -1.473629, 0, 1, 0.9098039, 1,
-0.07804178, -0.7211666, -0.6188406, 0, 1, 0.9176471, 1,
-0.06987728, 0.04325043, -1.145031, 0, 1, 0.9215686, 1,
-0.06898025, -1.366885, -4.896749, 0, 1, 0.9294118, 1,
-0.0689676, 0.5939712, -0.1534909, 0, 1, 0.9333333, 1,
-0.06646734, 0.9548239, -0.1301383, 0, 1, 0.9411765, 1,
-0.06645562, -0.4712072, -3.688909, 0, 1, 0.945098, 1,
-0.06041968, 2.024339, 0.912299, 0, 1, 0.9529412, 1,
-0.05992173, 1.564182, -1.376653, 0, 1, 0.9568627, 1,
-0.05699179, 1.036951, -1.828037, 0, 1, 0.9647059, 1,
-0.05632823, -0.4019151, -1.784115, 0, 1, 0.9686275, 1,
-0.05601345, -1.130966, -1.323135, 0, 1, 0.9764706, 1,
-0.05004113, 0.4081754, -0.9653818, 0, 1, 0.9803922, 1,
-0.04961876, 0.5879574, -1.486195, 0, 1, 0.9882353, 1,
-0.04908204, 0.01673315, -0.4652862, 0, 1, 0.9921569, 1,
-0.04897527, -1.371153, -3.476704, 0, 1, 1, 1,
-0.04796169, -0.0153748, -2.991071, 0, 0.9921569, 1, 1,
-0.04604772, -0.8621684, -3.305119, 0, 0.9882353, 1, 1,
-0.04517812, 0.2207355, 0.2006861, 0, 0.9803922, 1, 1,
-0.04449128, 2.697725, 3.644952, 0, 0.9764706, 1, 1,
-0.03403759, 0.01698075, -0.2812116, 0, 0.9686275, 1, 1,
-0.02830644, 0.05184214, -0.5119966, 0, 0.9647059, 1, 1,
-0.02787837, 1.022301, -1.175218, 0, 0.9568627, 1, 1,
-0.02649735, -1.126746, -2.030884, 0, 0.9529412, 1, 1,
-0.0236511, 2.106158, 0.9480209, 0, 0.945098, 1, 1,
-0.02339291, -0.8029681, -3.283353, 0, 0.9411765, 1, 1,
-0.02073775, -0.7838999, -3.29467, 0, 0.9333333, 1, 1,
-0.01832921, -1.224026, -2.593411, 0, 0.9294118, 1, 1,
-0.01695737, -0.7189748, -4.359433, 0, 0.9215686, 1, 1,
-0.01507484, 0.9836727, 1.524413, 0, 0.9176471, 1, 1,
-0.01296377, -0.8772518, -3.89113, 0, 0.9098039, 1, 1,
-0.01221599, -1.392942, -2.504585, 0, 0.9058824, 1, 1,
-0.00627776, 1.723666, -0.9020556, 0, 0.8980392, 1, 1,
-0.005002836, 0.7113913, 1.098977, 0, 0.8901961, 1, 1,
-0.004615024, 0.07436859, 0.5792641, 0, 0.8862745, 1, 1,
-0.003122187, -0.8614351, -2.896874, 0, 0.8784314, 1, 1,
0.001098421, 0.3346594, -0.0499974, 0, 0.8745098, 1, 1,
0.00114171, -0.4075743, 5.205157, 0, 0.8666667, 1, 1,
0.001564782, -0.03815927, 3.913978, 0, 0.8627451, 1, 1,
0.003206328, 1.784768, 0.5038336, 0, 0.854902, 1, 1,
0.004875452, -0.1330203, 2.220512, 0, 0.8509804, 1, 1,
0.006690272, -2.280123, 1.851277, 0, 0.8431373, 1, 1,
0.007292701, 1.436393, 0.8438236, 0, 0.8392157, 1, 1,
0.01443649, 0.6625544, -0.8960356, 0, 0.8313726, 1, 1,
0.01638659, -0.05121962, 3.629462, 0, 0.827451, 1, 1,
0.01668603, 1.194891, -0.07400737, 0, 0.8196079, 1, 1,
0.01893848, -0.2872832, 3.827509, 0, 0.8156863, 1, 1,
0.02368872, 0.8258174, -1.865708, 0, 0.8078431, 1, 1,
0.02968566, 1.251926, -0.004540666, 0, 0.8039216, 1, 1,
0.03496023, -0.9170119, 2.908529, 0, 0.7960784, 1, 1,
0.04198446, 1.220156, -0.3723126, 0, 0.7882353, 1, 1,
0.04712043, 2.163825, -0.3647583, 0, 0.7843137, 1, 1,
0.05406372, 0.3072904, 1.165605, 0, 0.7764706, 1, 1,
0.05940399, -0.4349816, 4.539676, 0, 0.772549, 1, 1,
0.06083483, 0.7340658, 1.156731, 0, 0.7647059, 1, 1,
0.06613439, -0.6135693, 2.89993, 0, 0.7607843, 1, 1,
0.06675076, 0.4143523, 0.4169185, 0, 0.7529412, 1, 1,
0.06845088, -0.7764117, 2.368529, 0, 0.7490196, 1, 1,
0.07106823, 1.709425, 0.8190648, 0, 0.7411765, 1, 1,
0.07884891, 0.09094035, 2.10661, 0, 0.7372549, 1, 1,
0.08642331, -0.4151648, 3.499152, 0, 0.7294118, 1, 1,
0.08662338, 2.058261, 1.30376, 0, 0.7254902, 1, 1,
0.08802271, -1.09845, 3.010717, 0, 0.7176471, 1, 1,
0.0925009, 0.05835471, 2.21593, 0, 0.7137255, 1, 1,
0.09472823, -0.2862737, 1.523914, 0, 0.7058824, 1, 1,
0.09639504, -1.33164, 2.894716, 0, 0.6980392, 1, 1,
0.09821626, -0.05725815, 1.214185, 0, 0.6941177, 1, 1,
0.105205, 0.8405622, -1.011901, 0, 0.6862745, 1, 1,
0.1078963, 0.4795589, -0.2182104, 0, 0.682353, 1, 1,
0.1087086, 0.2863597, 0.3716256, 0, 0.6745098, 1, 1,
0.1099268, -0.6343966, 3.397343, 0, 0.6705883, 1, 1,
0.1112583, -1.418604, 3.764817, 0, 0.6627451, 1, 1,
0.1133431, -1.069564, 3.05072, 0, 0.6588235, 1, 1,
0.1148198, 0.2106669, -0.2421153, 0, 0.6509804, 1, 1,
0.1151118, -0.9153801, 2.790725, 0, 0.6470588, 1, 1,
0.1189439, 0.7824593, 0.4738217, 0, 0.6392157, 1, 1,
0.1190816, 1.220184, -1.781381, 0, 0.6352941, 1, 1,
0.1244136, -1.099806, 2.452034, 0, 0.627451, 1, 1,
0.125248, -0.4018168, 2.063045, 0, 0.6235294, 1, 1,
0.1258812, 1.630876, 0.4671544, 0, 0.6156863, 1, 1,
0.1290468, -0.7704931, 3.54599, 0, 0.6117647, 1, 1,
0.1305328, -1.544424, 2.437943, 0, 0.6039216, 1, 1,
0.1380997, -0.4149742, 4.910802, 0, 0.5960785, 1, 1,
0.1392143, -1.059347, 2.882106, 0, 0.5921569, 1, 1,
0.1396361, -0.05925937, 1.220007, 0, 0.5843138, 1, 1,
0.1414713, 0.01292986, 0.8500764, 0, 0.5803922, 1, 1,
0.1419756, -0.1852646, 2.341217, 0, 0.572549, 1, 1,
0.1443522, -1.665559, 2.694656, 0, 0.5686275, 1, 1,
0.1450906, -0.4175904, 2.799306, 0, 0.5607843, 1, 1,
0.1474059, 0.1746544, -0.4897105, 0, 0.5568628, 1, 1,
0.1510876, -0.8458611, 2.616986, 0, 0.5490196, 1, 1,
0.15953, 0.1600637, 1.106982, 0, 0.5450981, 1, 1,
0.1671021, -1.174582, 2.144922, 0, 0.5372549, 1, 1,
0.1697385, -0.8346303, 3.652341, 0, 0.5333334, 1, 1,
0.1709333, 0.1362491, -0.09520701, 0, 0.5254902, 1, 1,
0.1725382, -1.292562, 3.429101, 0, 0.5215687, 1, 1,
0.1727197, 0.04037611, -0.08594785, 0, 0.5137255, 1, 1,
0.1801195, 0.802793, 1.578916, 0, 0.509804, 1, 1,
0.1813697, -0.9144157, 2.521013, 0, 0.5019608, 1, 1,
0.1827556, 0.7205963, -1.942233, 0, 0.4941176, 1, 1,
0.1833441, -1.743305, 2.131158, 0, 0.4901961, 1, 1,
0.1866675, -0.9958191, 1.602929, 0, 0.4823529, 1, 1,
0.1983986, 0.8759226, -1.1589, 0, 0.4784314, 1, 1,
0.2025258, 0.6929654, -0.3172899, 0, 0.4705882, 1, 1,
0.2130766, 0.7140408, -0.1068033, 0, 0.4666667, 1, 1,
0.216502, 0.3625937, 0.6763648, 0, 0.4588235, 1, 1,
0.2185155, -0.2948545, 1.149742, 0, 0.454902, 1, 1,
0.2208093, -1.193084, 2.321873, 0, 0.4470588, 1, 1,
0.222782, -0.7077854, 1.958248, 0, 0.4431373, 1, 1,
0.2238941, -0.9324644, 1.842076, 0, 0.4352941, 1, 1,
0.2245471, -1.115147, 2.401901, 0, 0.4313726, 1, 1,
0.2253539, 0.199996, 1.934124, 0, 0.4235294, 1, 1,
0.2253934, 0.9804847, -0.2539707, 0, 0.4196078, 1, 1,
0.2296814, -0.6327111, 4.333947, 0, 0.4117647, 1, 1,
0.231715, -1.141765, 1.473584, 0, 0.4078431, 1, 1,
0.2340663, 0.03005811, 2.4931, 0, 0.4, 1, 1,
0.2361032, -2.056094, 2.981575, 0, 0.3921569, 1, 1,
0.2361859, -1.467085, 3.279669, 0, 0.3882353, 1, 1,
0.2373356, 1.829762, -1.795711, 0, 0.3803922, 1, 1,
0.2379813, -1.087723, 3.475265, 0, 0.3764706, 1, 1,
0.2403353, -1.848569, 3.711514, 0, 0.3686275, 1, 1,
0.2409636, -0.8843089, 2.584053, 0, 0.3647059, 1, 1,
0.2449055, 0.3917615, 0.1033892, 0, 0.3568628, 1, 1,
0.2457955, 0.05872365, -0.7265457, 0, 0.3529412, 1, 1,
0.2530271, -2.230655, 1.131113, 0, 0.345098, 1, 1,
0.256193, -0.06993321, 3.246968, 0, 0.3411765, 1, 1,
0.2578479, -0.8791519, 3.553174, 0, 0.3333333, 1, 1,
0.2635219, 0.05543098, 1.385416, 0, 0.3294118, 1, 1,
0.2694679, 1.859153, -0.0869972, 0, 0.3215686, 1, 1,
0.2701574, -1.137147, 2.15399, 0, 0.3176471, 1, 1,
0.271179, -1.846573, 4.914521, 0, 0.3098039, 1, 1,
0.2740437, -0.3922615, 0.9766936, 0, 0.3058824, 1, 1,
0.2741896, 0.3760264, 1.825641, 0, 0.2980392, 1, 1,
0.2752317, -1.783533, 2.849536, 0, 0.2901961, 1, 1,
0.2783011, -1.10757, 2.483187, 0, 0.2862745, 1, 1,
0.2790477, 0.49808, -0.5325418, 0, 0.2784314, 1, 1,
0.2854129, 0.7561186, 0.7497185, 0, 0.2745098, 1, 1,
0.2854428, 0.5736831, 1.472751, 0, 0.2666667, 1, 1,
0.2877835, -1.35149, 2.842028, 0, 0.2627451, 1, 1,
0.2895942, -0.02772882, 2.046474, 0, 0.254902, 1, 1,
0.2911654, 1.645582, 0.4583462, 0, 0.2509804, 1, 1,
0.2967402, -0.3797736, 2.31862, 0, 0.2431373, 1, 1,
0.3020062, 0.1856978, 2.047324, 0, 0.2392157, 1, 1,
0.3030584, 0.2181226, 1.288108, 0, 0.2313726, 1, 1,
0.3118856, 1.472473, 2.285304, 0, 0.227451, 1, 1,
0.3195821, -0.3564887, 1.328059, 0, 0.2196078, 1, 1,
0.320967, -1.977857, 5.730723, 0, 0.2156863, 1, 1,
0.321835, 1.109882, 0.3389094, 0, 0.2078431, 1, 1,
0.3252371, -1.24346, 3.852982, 0, 0.2039216, 1, 1,
0.3292823, 1.31186, -1.711286, 0, 0.1960784, 1, 1,
0.3309352, -0.395779, 1.083602, 0, 0.1882353, 1, 1,
0.3318521, 0.0602196, 3.071246, 0, 0.1843137, 1, 1,
0.3318832, -1.627948, 3.107839, 0, 0.1764706, 1, 1,
0.3329929, 0.224986, 0.2863468, 0, 0.172549, 1, 1,
0.3338523, 1.02546, 0.9210477, 0, 0.1647059, 1, 1,
0.3358937, 0.6701533, 0.04504063, 0, 0.1607843, 1, 1,
0.3369304, -0.2378534, 3.832939, 0, 0.1529412, 1, 1,
0.3430978, 0.5832555, 0.182789, 0, 0.1490196, 1, 1,
0.3451588, -0.7401369, 1.957738, 0, 0.1411765, 1, 1,
0.3476611, 1.162635, 1.447979, 0, 0.1372549, 1, 1,
0.3509359, -0.6107465, 2.58209, 0, 0.1294118, 1, 1,
0.3534775, -0.3306311, 3.676955, 0, 0.1254902, 1, 1,
0.3573624, -0.6549469, 0.0467702, 0, 0.1176471, 1, 1,
0.3583345, -1.207738, 3.371693, 0, 0.1137255, 1, 1,
0.3589891, 2.251239, -1.126167, 0, 0.1058824, 1, 1,
0.3644839, 0.08640771, -0.6723934, 0, 0.09803922, 1, 1,
0.3742927, 1.218431, 2.27772, 0, 0.09411765, 1, 1,
0.3749743, 0.7176355, -0.04469652, 0, 0.08627451, 1, 1,
0.375969, 1.506172, -0.7714327, 0, 0.08235294, 1, 1,
0.376507, -0.0283381, 0.4371207, 0, 0.07450981, 1, 1,
0.3910374, 0.9452381, 0.1498608, 0, 0.07058824, 1, 1,
0.3913896, -0.9787118, 2.720292, 0, 0.0627451, 1, 1,
0.3922487, -1.067782, 2.198489, 0, 0.05882353, 1, 1,
0.3960852, 0.2884004, 0.5580563, 0, 0.05098039, 1, 1,
0.3966449, -0.01660143, 1.696746, 0, 0.04705882, 1, 1,
0.3968458, -1.618737, 2.968812, 0, 0.03921569, 1, 1,
0.4059247, 1.021424, 3.361155, 0, 0.03529412, 1, 1,
0.4076559, 2.112803, 0.7393612, 0, 0.02745098, 1, 1,
0.4153173, -0.4219679, 1.762273, 0, 0.02352941, 1, 1,
0.4174878, -0.5799492, 3.218105, 0, 0.01568628, 1, 1,
0.4197336, 0.3653383, -0.1542576, 0, 0.01176471, 1, 1,
0.4234178, 0.9185238, -0.2517752, 0, 0.003921569, 1, 1,
0.4282385, -0.4821316, 3.969031, 0.003921569, 0, 1, 1,
0.4290265, 2.18055, 1.330639, 0.007843138, 0, 1, 1,
0.4306136, -0.3466153, 2.866077, 0.01568628, 0, 1, 1,
0.4321406, 0.2526446, 1.328688, 0.01960784, 0, 1, 1,
0.4383782, -0.09599931, 2.572597, 0.02745098, 0, 1, 1,
0.4385386, 0.5993431, 2.579353, 0.03137255, 0, 1, 1,
0.4388443, -1.165586, 1.593102, 0.03921569, 0, 1, 1,
0.4422857, -2.56092, 3.774897, 0.04313726, 0, 1, 1,
0.4446177, 0.192214, 0.5332531, 0.05098039, 0, 1, 1,
0.4538226, 1.492221, 0.6794187, 0.05490196, 0, 1, 1,
0.4566501, 2.15503, -0.8631194, 0.0627451, 0, 1, 1,
0.4591447, -0.4282666, 0.9402833, 0.06666667, 0, 1, 1,
0.4621635, -0.847472, 3.224828, 0.07450981, 0, 1, 1,
0.4628914, -0.8772001, 2.167302, 0.07843138, 0, 1, 1,
0.463059, 0.1310207, 1.908631, 0.08627451, 0, 1, 1,
0.4648702, 1.771162, 1.172993, 0.09019608, 0, 1, 1,
0.4671186, -1.029492, 1.331437, 0.09803922, 0, 1, 1,
0.4673608, -1.328552, 1.541865, 0.1058824, 0, 1, 1,
0.4694267, -0.05305917, 2.066237, 0.1098039, 0, 1, 1,
0.4779353, 0.04962747, 0.5640074, 0.1176471, 0, 1, 1,
0.4803038, -0.5969813, 3.33464, 0.1215686, 0, 1, 1,
0.4807828, -1.420198, 3.629706, 0.1294118, 0, 1, 1,
0.4858506, -0.290499, 3.628863, 0.1333333, 0, 1, 1,
0.4868152, -0.522503, 1.163843, 0.1411765, 0, 1, 1,
0.4946991, -0.3039632, 2.146481, 0.145098, 0, 1, 1,
0.4954576, 0.480896, 0.4427199, 0.1529412, 0, 1, 1,
0.4977914, -0.8915766, 2.208546, 0.1568628, 0, 1, 1,
0.4992174, 0.5457054, 1.715206, 0.1647059, 0, 1, 1,
0.5020398, -0.4070388, 2.894823, 0.1686275, 0, 1, 1,
0.5027055, -0.1597921, 3.215826, 0.1764706, 0, 1, 1,
0.5070242, -0.1004945, 2.342978, 0.1803922, 0, 1, 1,
0.5084171, -0.1901631, 2.258254, 0.1882353, 0, 1, 1,
0.5096161, 0.9285725, -0.4648567, 0.1921569, 0, 1, 1,
0.5113071, 1.026318, -1.262716, 0.2, 0, 1, 1,
0.5230212, 0.2819633, -0.9728644, 0.2078431, 0, 1, 1,
0.5231057, -0.1340592, 3.825304, 0.2117647, 0, 1, 1,
0.5237648, -1.104031, 2.041379, 0.2196078, 0, 1, 1,
0.5260401, -0.2227504, 3.091282, 0.2235294, 0, 1, 1,
0.5271733, 0.3037228, 2.090939, 0.2313726, 0, 1, 1,
0.5278804, -1.330578, 2.725953, 0.2352941, 0, 1, 1,
0.5288596, -0.4235887, 1.585109, 0.2431373, 0, 1, 1,
0.5301048, 0.8549477, 0.1457617, 0.2470588, 0, 1, 1,
0.5376057, 0.01526668, 1.519774, 0.254902, 0, 1, 1,
0.5376948, -1.736032, 2.299892, 0.2588235, 0, 1, 1,
0.539475, 0.494853, 1.617461, 0.2666667, 0, 1, 1,
0.5405462, 0.1475109, 1.366017, 0.2705882, 0, 1, 1,
0.5415394, -1.566673, 2.629848, 0.2784314, 0, 1, 1,
0.5454703, -1.224605, 2.269023, 0.282353, 0, 1, 1,
0.551114, -0.04949604, 1.214142, 0.2901961, 0, 1, 1,
0.5512083, -0.2980086, 1.962348, 0.2941177, 0, 1, 1,
0.5592431, -0.9978718, 4.168556, 0.3019608, 0, 1, 1,
0.5595993, 1.165174, -0.7241698, 0.3098039, 0, 1, 1,
0.5621238, -0.09298481, 0.0436257, 0.3137255, 0, 1, 1,
0.5632485, 0.8588411, 1.081116, 0.3215686, 0, 1, 1,
0.5671763, -1.409998, 3.426951, 0.3254902, 0, 1, 1,
0.5795377, -0.6613691, 1.831041, 0.3333333, 0, 1, 1,
0.5801635, -1.327276, 2.540705, 0.3372549, 0, 1, 1,
0.5823784, -1.307772, 3.609377, 0.345098, 0, 1, 1,
0.5832474, 0.0413032, 1.498535, 0.3490196, 0, 1, 1,
0.5906501, -0.6490209, 3.590252, 0.3568628, 0, 1, 1,
0.5913528, 0.4379809, 0.9363778, 0.3607843, 0, 1, 1,
0.5919286, 0.7456974, 0.5136104, 0.3686275, 0, 1, 1,
0.5955526, 0.03595201, 1.570596, 0.372549, 0, 1, 1,
0.5961877, -0.6653031, 2.310966, 0.3803922, 0, 1, 1,
0.6020292, 0.677528, 1.339645, 0.3843137, 0, 1, 1,
0.6029339, 0.2548421, -0.2566844, 0.3921569, 0, 1, 1,
0.603391, -0.8923591, 3.022389, 0.3960784, 0, 1, 1,
0.6043516, 1.665127, -1.924821, 0.4039216, 0, 1, 1,
0.6070975, -1.048103, 2.082686, 0.4117647, 0, 1, 1,
0.6071025, 0.4702379, 2.82393, 0.4156863, 0, 1, 1,
0.6100826, -0.5699288, 2.029433, 0.4235294, 0, 1, 1,
0.6115038, -1.958053, 2.413965, 0.427451, 0, 1, 1,
0.6120645, 1.227518, 1.443673, 0.4352941, 0, 1, 1,
0.6185183, -1.7955, 2.543035, 0.4392157, 0, 1, 1,
0.6196606, -1.578142, 2.30274, 0.4470588, 0, 1, 1,
0.6291501, 0.09930819, 1.610559, 0.4509804, 0, 1, 1,
0.6324747, -0.8702546, 3.583025, 0.4588235, 0, 1, 1,
0.6348634, -2.267095, 2.46975, 0.4627451, 0, 1, 1,
0.6368657, -0.2829947, 2.74717, 0.4705882, 0, 1, 1,
0.6388295, 0.5809023, 0.9982129, 0.4745098, 0, 1, 1,
0.6467503, 0.4693846, 0.8938501, 0.4823529, 0, 1, 1,
0.6482661, -0.4331869, 1.410708, 0.4862745, 0, 1, 1,
0.6525729, -0.02955735, 1.745725, 0.4941176, 0, 1, 1,
0.6586153, -0.2041448, 0.2080266, 0.5019608, 0, 1, 1,
0.6653762, -0.8296235, 4.270181, 0.5058824, 0, 1, 1,
0.6705231, 0.2644022, 2.612447, 0.5137255, 0, 1, 1,
0.6716708, 1.199617, -0.724542, 0.5176471, 0, 1, 1,
0.6723872, 0.7381258, 0.5903418, 0.5254902, 0, 1, 1,
0.6724002, -0.7313452, 1.903261, 0.5294118, 0, 1, 1,
0.6740253, -2.644887, 4.023912, 0.5372549, 0, 1, 1,
0.6753139, 1.413091, -0.007451142, 0.5411765, 0, 1, 1,
0.6756549, -0.6064293, 2.106923, 0.5490196, 0, 1, 1,
0.6784577, 0.3752028, 1.627446, 0.5529412, 0, 1, 1,
0.6806442, 2.07176, 1.053663, 0.5607843, 0, 1, 1,
0.6812632, 0.03548997, 1.752768, 0.5647059, 0, 1, 1,
0.6814937, 0.1263978, 1.468892, 0.572549, 0, 1, 1,
0.6822065, 0.9006652, 0.7225759, 0.5764706, 0, 1, 1,
0.6866378, 0.8021916, 0.6376666, 0.5843138, 0, 1, 1,
0.6912692, 0.197062, 1.794389, 0.5882353, 0, 1, 1,
0.6913003, 0.3372606, 2.918558, 0.5960785, 0, 1, 1,
0.6932327, -0.8769983, 3.574369, 0.6039216, 0, 1, 1,
0.6946965, 0.9680464, -0.1930349, 0.6078432, 0, 1, 1,
0.6972355, 0.8056428, -0.4512799, 0.6156863, 0, 1, 1,
0.6989606, -0.06334329, 1.163201, 0.6196079, 0, 1, 1,
0.7003818, 0.4564216, 1.148446, 0.627451, 0, 1, 1,
0.7023205, 0.8635617, -1.341657, 0.6313726, 0, 1, 1,
0.7044778, 0.634302, -0.7474099, 0.6392157, 0, 1, 1,
0.7055655, 0.07561449, 3.028998, 0.6431373, 0, 1, 1,
0.7077608, -0.5629858, 1.864606, 0.6509804, 0, 1, 1,
0.7110074, -0.7624005, 3.337503, 0.654902, 0, 1, 1,
0.7206149, 1.706758, 0.779671, 0.6627451, 0, 1, 1,
0.7260057, 0.2235586, 1.94457, 0.6666667, 0, 1, 1,
0.7331685, 1.225776, 0.4054544, 0.6745098, 0, 1, 1,
0.739656, 0.9658825, 0.4689803, 0.6784314, 0, 1, 1,
0.7463209, 0.5773348, -0.06027063, 0.6862745, 0, 1, 1,
0.7619585, -1.075749, 2.019666, 0.6901961, 0, 1, 1,
0.7629117, -0.3738762, 1.267079, 0.6980392, 0, 1, 1,
0.7656148, 0.5872219, 0.2288333, 0.7058824, 0, 1, 1,
0.7691392, 0.8468558, 0.4841613, 0.7098039, 0, 1, 1,
0.7774129, 0.1243479, 0.1438757, 0.7176471, 0, 1, 1,
0.7789527, 0.4138882, 2.030433, 0.7215686, 0, 1, 1,
0.7802678, -0.2905357, 2.173077, 0.7294118, 0, 1, 1,
0.7805652, -1.058459, 3.172167, 0.7333333, 0, 1, 1,
0.7816982, -2.070507, 2.881164, 0.7411765, 0, 1, 1,
0.7903398, -1.155828, 2.443336, 0.7450981, 0, 1, 1,
0.7943865, 0.2386554, 1.381979, 0.7529412, 0, 1, 1,
0.7969187, 1.442527, 0.5132283, 0.7568628, 0, 1, 1,
0.7976574, 0.8091404, -0.3777389, 0.7647059, 0, 1, 1,
0.8047234, -1.953923, 3.416069, 0.7686275, 0, 1, 1,
0.8069597, -0.1740301, 2.884154, 0.7764706, 0, 1, 1,
0.808252, 0.5883381, 2.702457, 0.7803922, 0, 1, 1,
0.8109885, -0.246137, 1.459796, 0.7882353, 0, 1, 1,
0.8203643, 1.008298, 0.7209239, 0.7921569, 0, 1, 1,
0.8258267, -1.034733, 2.158941, 0.8, 0, 1, 1,
0.8304364, 0.9540529, -1.383042, 0.8078431, 0, 1, 1,
0.832837, -0.6090823, 2.485501, 0.8117647, 0, 1, 1,
0.8399271, -0.6263931, 3.050669, 0.8196079, 0, 1, 1,
0.8604249, 2.266709, 0.9779408, 0.8235294, 0, 1, 1,
0.8636541, -0.3329264, 0.980397, 0.8313726, 0, 1, 1,
0.8695785, 1.437162, 0.8566094, 0.8352941, 0, 1, 1,
0.8718864, -0.08619929, 2.17671, 0.8431373, 0, 1, 1,
0.8740176, 0.9152087, 0.3160963, 0.8470588, 0, 1, 1,
0.8758237, 0.5319225, 0.995352, 0.854902, 0, 1, 1,
0.8760889, -0.5600005, 2.877111, 0.8588235, 0, 1, 1,
0.8775793, -1.193293, 1.926639, 0.8666667, 0, 1, 1,
0.879449, 0.7829959, 1.494137, 0.8705882, 0, 1, 1,
0.883893, 0.3723205, 0.344537, 0.8784314, 0, 1, 1,
0.8916763, 0.3781838, 0.6381686, 0.8823529, 0, 1, 1,
0.8947043, 0.370795, 1.973451, 0.8901961, 0, 1, 1,
0.8980058, 1.027371, 0.6316565, 0.8941177, 0, 1, 1,
0.9069341, 0.6505519, 1.159244, 0.9019608, 0, 1, 1,
0.9128525, -0.4926019, 1.076443, 0.9098039, 0, 1, 1,
0.9138551, 0.809523, 0.7033339, 0.9137255, 0, 1, 1,
0.9144613, -0.1830782, 2.792669, 0.9215686, 0, 1, 1,
0.9175375, -0.2510521, 0.9036529, 0.9254902, 0, 1, 1,
0.9183475, -0.7070724, 0.7807348, 0.9333333, 0, 1, 1,
0.9283965, 1.23124, 1.164168, 0.9372549, 0, 1, 1,
0.9339157, 0.74158, 1.615409, 0.945098, 0, 1, 1,
0.9339964, -1.44355, 3.44765, 0.9490196, 0, 1, 1,
0.9364549, -0.9456478, 2.422669, 0.9568627, 0, 1, 1,
0.9367699, 0.3713916, 2.826538, 0.9607843, 0, 1, 1,
0.9410239, 1.409135, 0.0006354767, 0.9686275, 0, 1, 1,
0.9426619, 1.029215, 0.8794312, 0.972549, 0, 1, 1,
0.9431566, -0.3128239, 2.094648, 0.9803922, 0, 1, 1,
0.943414, 1.316581, 0.801123, 0.9843137, 0, 1, 1,
0.948536, -0.649079, 0.2329338, 0.9921569, 0, 1, 1,
0.9556136, 0.805822, -0.2948929, 0.9960784, 0, 1, 1,
0.9637589, 1.421383, -0.1838218, 1, 0, 0.9960784, 1,
0.9666588, -0.2548626, 0.4417582, 1, 0, 0.9882353, 1,
0.9811414, -0.9333647, 3.692679, 1, 0, 0.9843137, 1,
0.9819379, -0.1172277, 2.70329, 1, 0, 0.9764706, 1,
0.9877049, 0.3652567, 0.7342657, 1, 0, 0.972549, 1,
0.989466, -0.2744412, 2.88865, 1, 0, 0.9647059, 1,
0.9920534, -0.04833376, 1.824554, 1, 0, 0.9607843, 1,
0.9928373, -0.4271045, 1.617975, 1, 0, 0.9529412, 1,
0.9983199, -0.7214499, 1.580392, 1, 0, 0.9490196, 1,
1.001228, -1.050443, 1.716866, 1, 0, 0.9411765, 1,
1.004304, -0.7915636, 3.810522, 1, 0, 0.9372549, 1,
1.005744, -1.425102, 1.277671, 1, 0, 0.9294118, 1,
1.012555, 2.112225, 1.33459, 1, 0, 0.9254902, 1,
1.013818, -0.4758843, 1.398136, 1, 0, 0.9176471, 1,
1.016018, 0.924242, 1.595891, 1, 0, 0.9137255, 1,
1.048578, -0.8158173, 3.482423, 1, 0, 0.9058824, 1,
1.04861, -0.5870702, 2.238154, 1, 0, 0.9019608, 1,
1.049781, -0.06437617, -0.05796609, 1, 0, 0.8941177, 1,
1.052305, -1.842274, 0.8293994, 1, 0, 0.8862745, 1,
1.052306, -1.18311, 2.745737, 1, 0, 0.8823529, 1,
1.057118, 0.9498993, 0.2063403, 1, 0, 0.8745098, 1,
1.060379, 0.239636, 1.70691, 1, 0, 0.8705882, 1,
1.064803, 0.477565, 0.3970816, 1, 0, 0.8627451, 1,
1.065469, -0.7496824, 1.220248, 1, 0, 0.8588235, 1,
1.070383, -0.7275273, 3.420214, 1, 0, 0.8509804, 1,
1.071915, -0.9837275, 2.069974, 1, 0, 0.8470588, 1,
1.078042, -1.023693, 2.315563, 1, 0, 0.8392157, 1,
1.0784, 0.3201678, 2.106708, 1, 0, 0.8352941, 1,
1.086246, -1.8938, 1.692197, 1, 0, 0.827451, 1,
1.100407, 0.5746632, -0.5621492, 1, 0, 0.8235294, 1,
1.1123, -0.5141984, 2.357394, 1, 0, 0.8156863, 1,
1.117344, -0.2076056, 2.145302, 1, 0, 0.8117647, 1,
1.11897, 0.5133135, 1.491802, 1, 0, 0.8039216, 1,
1.122452, -0.9816832, 1.600539, 1, 0, 0.7960784, 1,
1.125312, 0.4439388, 0.7501178, 1, 0, 0.7921569, 1,
1.131019, 1.05525, -0.3305253, 1, 0, 0.7843137, 1,
1.138603, -0.6226612, -0.2235722, 1, 0, 0.7803922, 1,
1.138993, -1.115325, 1.557343, 1, 0, 0.772549, 1,
1.151802, -0.6697162, 3.42362, 1, 0, 0.7686275, 1,
1.153282, -0.06214612, 0.9279123, 1, 0, 0.7607843, 1,
1.157053, 0.117968, 0.4942147, 1, 0, 0.7568628, 1,
1.163739, -0.3594935, 0.8713495, 1, 0, 0.7490196, 1,
1.183444, 1.123943, 0.7014544, 1, 0, 0.7450981, 1,
1.184384, 1.083486, 0.8302935, 1, 0, 0.7372549, 1,
1.185129, -1.096221, 1.133303, 1, 0, 0.7333333, 1,
1.185213, -1.645662, 2.231879, 1, 0, 0.7254902, 1,
1.18779, 1.680013, 0.2938078, 1, 0, 0.7215686, 1,
1.188635, 0.1463262, 1.838446, 1, 0, 0.7137255, 1,
1.195813, 2.79671, -0.385225, 1, 0, 0.7098039, 1,
1.196914, -0.1865431, 1.360051, 1, 0, 0.7019608, 1,
1.196934, 0.9026541, 2.237193, 1, 0, 0.6941177, 1,
1.200303, 0.4551387, 0.2295541, 1, 0, 0.6901961, 1,
1.201576, -1.013012, 2.446417, 1, 0, 0.682353, 1,
1.203805, -0.7493545, 2.101205, 1, 0, 0.6784314, 1,
1.219864, -0.7175264, 1.068505, 1, 0, 0.6705883, 1,
1.221892, 0.4400352, 1.56107, 1, 0, 0.6666667, 1,
1.223922, 0.7192602, 2.990856, 1, 0, 0.6588235, 1,
1.238254, -1.083062, 0.2884068, 1, 0, 0.654902, 1,
1.240483, -0.980547, 2.982784, 1, 0, 0.6470588, 1,
1.243074, -1.99422, 3.289858, 1, 0, 0.6431373, 1,
1.249483, 0.2796821, 2.497467, 1, 0, 0.6352941, 1,
1.250878, -1.230206, 2.793826, 1, 0, 0.6313726, 1,
1.254507, -0.07660781, -0.1190272, 1, 0, 0.6235294, 1,
1.275029, -0.5709021, 0.8562477, 1, 0, 0.6196079, 1,
1.27714, -0.9633505, 1.718843, 1, 0, 0.6117647, 1,
1.281267, -0.6902171, 1.938756, 1, 0, 0.6078432, 1,
1.284194, 0.3854956, 2.020851, 1, 0, 0.6, 1,
1.309762, 0.2687892, -0.2599742, 1, 0, 0.5921569, 1,
1.325156, -1.595006, 2.663575, 1, 0, 0.5882353, 1,
1.326838, 1.061604, 0.02303116, 1, 0, 0.5803922, 1,
1.350226, -0.1942277, 0.5638512, 1, 0, 0.5764706, 1,
1.35508, 0.5508583, 2.899606, 1, 0, 0.5686275, 1,
1.363273, 0.1073551, 2.754823, 1, 0, 0.5647059, 1,
1.370041, 0.7170404, -0.8763492, 1, 0, 0.5568628, 1,
1.370744, 0.2231219, 2.764194, 1, 0, 0.5529412, 1,
1.375939, 0.6484116, 0.3196377, 1, 0, 0.5450981, 1,
1.376986, 0.6938467, 0.06219136, 1, 0, 0.5411765, 1,
1.383164, -0.2494238, 3.188138, 1, 0, 0.5333334, 1,
1.392154, -1.354261, 2.726176, 1, 0, 0.5294118, 1,
1.418607, 0.4180637, 1.653082, 1, 0, 0.5215687, 1,
1.418833, -1.942972, 1.400674, 1, 0, 0.5176471, 1,
1.431303, 0.2331246, 1.934853, 1, 0, 0.509804, 1,
1.442572, -1.640506, 2.392651, 1, 0, 0.5058824, 1,
1.452003, 1.09663, 0.9431465, 1, 0, 0.4980392, 1,
1.454377, 0.2912362, 1.271714, 1, 0, 0.4901961, 1,
1.467827, 0.1892649, 1.587785, 1, 0, 0.4862745, 1,
1.474357, 1.694371, 1.446837, 1, 0, 0.4784314, 1,
1.486394, 0.2013717, 0.6731085, 1, 0, 0.4745098, 1,
1.493878, 0.5435321, 0.8814073, 1, 0, 0.4666667, 1,
1.494388, 1.053423, 2.693033, 1, 0, 0.4627451, 1,
1.501826, -1.632838, 2.583668, 1, 0, 0.454902, 1,
1.522689, -1.354809, 1.835239, 1, 0, 0.4509804, 1,
1.52755, -0.6724082, 2.099947, 1, 0, 0.4431373, 1,
1.53203, -1.137198, 2.680795, 1, 0, 0.4392157, 1,
1.538238, -0.4050734, 2.34354, 1, 0, 0.4313726, 1,
1.547766, 0.4087366, 0.9030544, 1, 0, 0.427451, 1,
1.55818, 1.12642, 2.75331, 1, 0, 0.4196078, 1,
1.560031, 1.728423, 1.281843, 1, 0, 0.4156863, 1,
1.569502, 0.09121851, 1.505319, 1, 0, 0.4078431, 1,
1.588522, -1.467507, 0.7977212, 1, 0, 0.4039216, 1,
1.617288, -1.605442, 2.389384, 1, 0, 0.3960784, 1,
1.617387, -1.40559, 1.293344, 1, 0, 0.3882353, 1,
1.630453, 0.1968058, 0.093251, 1, 0, 0.3843137, 1,
1.632257, 0.3077812, 3.982351, 1, 0, 0.3764706, 1,
1.635388, 0.938956, 0.3642679, 1, 0, 0.372549, 1,
1.648967, 0.2215512, 1.417104, 1, 0, 0.3647059, 1,
1.649495, 0.1300783, 0.6860366, 1, 0, 0.3607843, 1,
1.661278, -2.264881, 2.389263, 1, 0, 0.3529412, 1,
1.682835, 0.3018122, 2.882992, 1, 0, 0.3490196, 1,
1.713523, -0.4239387, 0.418372, 1, 0, 0.3411765, 1,
1.714007, 0.2244409, 1.038743, 1, 0, 0.3372549, 1,
1.720468, -0.7566674, 2.358027, 1, 0, 0.3294118, 1,
1.722117, -0.804766, 2.418352, 1, 0, 0.3254902, 1,
1.731704, 1.239723, 0.1595817, 1, 0, 0.3176471, 1,
1.744191, 0.1668565, 2.121617, 1, 0, 0.3137255, 1,
1.746125, 0.02250458, 1.69796, 1, 0, 0.3058824, 1,
1.754494, 0.379699, 2.010206, 1, 0, 0.2980392, 1,
1.757305, -1.268324, 2.295244, 1, 0, 0.2941177, 1,
1.778659, -1.158106, 1.425279, 1, 0, 0.2862745, 1,
1.780601, -1.098981, 1.988655, 1, 0, 0.282353, 1,
1.782969, -0.1884947, 2.037029, 1, 0, 0.2745098, 1,
1.795824, -1.369203, 2.48995, 1, 0, 0.2705882, 1,
1.79891, -0.1469849, 2.452501, 1, 0, 0.2627451, 1,
1.80758, 0.4042267, 3.300688, 1, 0, 0.2588235, 1,
1.845436, 0.5739123, 0.1820142, 1, 0, 0.2509804, 1,
1.879232, -0.1074344, 0.899955, 1, 0, 0.2470588, 1,
1.898196, -0.4153125, 2.069242, 1, 0, 0.2392157, 1,
1.925489, -0.8403017, 3.291638, 1, 0, 0.2352941, 1,
1.925697, 1.859279, 1.118837, 1, 0, 0.227451, 1,
1.939133, 0.1860938, 1.093412, 1, 0, 0.2235294, 1,
1.950973, -1.140981, 3.52629, 1, 0, 0.2156863, 1,
1.956743, -1.804839, 2.658853, 1, 0, 0.2117647, 1,
1.966063, 0.5139577, 2.378138, 1, 0, 0.2039216, 1,
1.969108, 1.131943, -0.7532149, 1, 0, 0.1960784, 1,
1.978875, -1.38358, 2.932947, 1, 0, 0.1921569, 1,
1.985454, -1.51767, 2.465762, 1, 0, 0.1843137, 1,
2.01857, 0.3324348, 1.326593, 1, 0, 0.1803922, 1,
2.042473, 1.774821, 0.06962018, 1, 0, 0.172549, 1,
2.064298, 1.967692, 0.00328655, 1, 0, 0.1686275, 1,
2.103896, -0.1381737, 2.117241, 1, 0, 0.1607843, 1,
2.131772, 1.982044, 1.815069, 1, 0, 0.1568628, 1,
2.134722, 1.04799, -0.4552534, 1, 0, 0.1490196, 1,
2.139084, -2.297247, 1.063757, 1, 0, 0.145098, 1,
2.188815, -0.48941, 2.300308, 1, 0, 0.1372549, 1,
2.203459, -0.7023641, 2.32283, 1, 0, 0.1333333, 1,
2.20979, 1.259088, 2.977025, 1, 0, 0.1254902, 1,
2.211013, -1.936638, 0.8635584, 1, 0, 0.1215686, 1,
2.251212, -0.01081783, 1.254221, 1, 0, 0.1137255, 1,
2.267826, 0.6522693, 0.8094054, 1, 0, 0.1098039, 1,
2.285163, -1.199172, 1.328561, 1, 0, 0.1019608, 1,
2.286814, -0.5111677, 1.023935, 1, 0, 0.09411765, 1,
2.287772, 0.02550875, 0.7060972, 1, 0, 0.09019608, 1,
2.381731, 0.005557729, 2.533833, 1, 0, 0.08235294, 1,
2.38537, 0.02054026, 1.748284, 1, 0, 0.07843138, 1,
2.388091, 1.808804, 1.066158, 1, 0, 0.07058824, 1,
2.461318, -0.5574035, 2.221026, 1, 0, 0.06666667, 1,
2.465503, 0.1787641, 2.203418, 1, 0, 0.05882353, 1,
2.483434, -1.738017, 3.865295, 1, 0, 0.05490196, 1,
2.486704, 1.125974, 1.012669, 1, 0, 0.04705882, 1,
2.488668, 0.853179, 1.022173, 1, 0, 0.04313726, 1,
2.498712, -0.1201992, 0.09547564, 1, 0, 0.03529412, 1,
2.566849, -1.921539, 2.410554, 1, 0, 0.03137255, 1,
2.576182, 0.6862595, 1.164299, 1, 0, 0.02352941, 1,
2.771341, 1.076318, 0.0847105, 1, 0, 0.01960784, 1,
2.842675, -1.582055, 2.945708, 1, 0, 0.01176471, 1,
3.052322, 0.8364808, 0.7581242, 1, 0, 0.007843138, 1
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
0.0373354, -3.631382, -6.698105, 0, -0.5, 0.5, 0.5,
0.0373354, -3.631382, -6.698105, 1, -0.5, 0.5, 0.5,
0.0373354, -3.631382, -6.698105, 1, 1.5, 0.5, 0.5,
0.0373354, -3.631382, -6.698105, 0, 1.5, 0.5, 0.5
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
-3.999731, 0.2651261, -6.698105, 0, -0.5, 0.5, 0.5,
-3.999731, 0.2651261, -6.698105, 1, -0.5, 0.5, 0.5,
-3.999731, 0.2651261, -6.698105, 1, 1.5, 0.5, 0.5,
-3.999731, 0.2651261, -6.698105, 0, 1.5, 0.5, 0.5
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
-3.999731, -3.631382, 0.4169869, 0, -0.5, 0.5, 0.5,
-3.999731, -3.631382, 0.4169869, 1, -0.5, 0.5, 0.5,
-3.999731, -3.631382, 0.4169869, 1, 1.5, 0.5, 0.5,
-3.999731, -3.631382, 0.4169869, 0, 1.5, 0.5, 0.5
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
-2, -2.732188, -5.056161,
3, -2.732188, -5.056161,
-2, -2.732188, -5.056161,
-2, -2.882053, -5.329819,
-1, -2.732188, -5.056161,
-1, -2.882053, -5.329819,
0, -2.732188, -5.056161,
0, -2.882053, -5.329819,
1, -2.732188, -5.056161,
1, -2.882053, -5.329819,
2, -2.732188, -5.056161,
2, -2.882053, -5.329819,
3, -2.732188, -5.056161,
3, -2.882053, -5.329819
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
-2, -3.181785, -5.877133, 0, -0.5, 0.5, 0.5,
-2, -3.181785, -5.877133, 1, -0.5, 0.5, 0.5,
-2, -3.181785, -5.877133, 1, 1.5, 0.5, 0.5,
-2, -3.181785, -5.877133, 0, 1.5, 0.5, 0.5,
-1, -3.181785, -5.877133, 0, -0.5, 0.5, 0.5,
-1, -3.181785, -5.877133, 1, -0.5, 0.5, 0.5,
-1, -3.181785, -5.877133, 1, 1.5, 0.5, 0.5,
-1, -3.181785, -5.877133, 0, 1.5, 0.5, 0.5,
0, -3.181785, -5.877133, 0, -0.5, 0.5, 0.5,
0, -3.181785, -5.877133, 1, -0.5, 0.5, 0.5,
0, -3.181785, -5.877133, 1, 1.5, 0.5, 0.5,
0, -3.181785, -5.877133, 0, 1.5, 0.5, 0.5,
1, -3.181785, -5.877133, 0, -0.5, 0.5, 0.5,
1, -3.181785, -5.877133, 1, -0.5, 0.5, 0.5,
1, -3.181785, -5.877133, 1, 1.5, 0.5, 0.5,
1, -3.181785, -5.877133, 0, 1.5, 0.5, 0.5,
2, -3.181785, -5.877133, 0, -0.5, 0.5, 0.5,
2, -3.181785, -5.877133, 1, -0.5, 0.5, 0.5,
2, -3.181785, -5.877133, 1, 1.5, 0.5, 0.5,
2, -3.181785, -5.877133, 0, 1.5, 0.5, 0.5,
3, -3.181785, -5.877133, 0, -0.5, 0.5, 0.5,
3, -3.181785, -5.877133, 1, -0.5, 0.5, 0.5,
3, -3.181785, -5.877133, 1, 1.5, 0.5, 0.5,
3, -3.181785, -5.877133, 0, 1.5, 0.5, 0.5
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
-3.0681, -2, -5.056161,
-3.0681, 3, -5.056161,
-3.0681, -2, -5.056161,
-3.223372, -2, -5.329819,
-3.0681, -1, -5.056161,
-3.223372, -1, -5.329819,
-3.0681, 0, -5.056161,
-3.223372, 0, -5.329819,
-3.0681, 1, -5.056161,
-3.223372, 1, -5.329819,
-3.0681, 2, -5.056161,
-3.223372, 2, -5.329819,
-3.0681, 3, -5.056161,
-3.223372, 3, -5.329819
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
-3.533916, -2, -5.877133, 0, -0.5, 0.5, 0.5,
-3.533916, -2, -5.877133, 1, -0.5, 0.5, 0.5,
-3.533916, -2, -5.877133, 1, 1.5, 0.5, 0.5,
-3.533916, -2, -5.877133, 0, 1.5, 0.5, 0.5,
-3.533916, -1, -5.877133, 0, -0.5, 0.5, 0.5,
-3.533916, -1, -5.877133, 1, -0.5, 0.5, 0.5,
-3.533916, -1, -5.877133, 1, 1.5, 0.5, 0.5,
-3.533916, -1, -5.877133, 0, 1.5, 0.5, 0.5,
-3.533916, 0, -5.877133, 0, -0.5, 0.5, 0.5,
-3.533916, 0, -5.877133, 1, -0.5, 0.5, 0.5,
-3.533916, 0, -5.877133, 1, 1.5, 0.5, 0.5,
-3.533916, 0, -5.877133, 0, 1.5, 0.5, 0.5,
-3.533916, 1, -5.877133, 0, -0.5, 0.5, 0.5,
-3.533916, 1, -5.877133, 1, -0.5, 0.5, 0.5,
-3.533916, 1, -5.877133, 1, 1.5, 0.5, 0.5,
-3.533916, 1, -5.877133, 0, 1.5, 0.5, 0.5,
-3.533916, 2, -5.877133, 0, -0.5, 0.5, 0.5,
-3.533916, 2, -5.877133, 1, -0.5, 0.5, 0.5,
-3.533916, 2, -5.877133, 1, 1.5, 0.5, 0.5,
-3.533916, 2, -5.877133, 0, 1.5, 0.5, 0.5,
-3.533916, 3, -5.877133, 0, -0.5, 0.5, 0.5,
-3.533916, 3, -5.877133, 1, -0.5, 0.5, 0.5,
-3.533916, 3, -5.877133, 1, 1.5, 0.5, 0.5,
-3.533916, 3, -5.877133, 0, 1.5, 0.5, 0.5
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
-3.0681, -2.732188, -4,
-3.0681, -2.732188, 4,
-3.0681, -2.732188, -4,
-3.223372, -2.882053, -4,
-3.0681, -2.732188, -2,
-3.223372, -2.882053, -2,
-3.0681, -2.732188, 0,
-3.223372, -2.882053, 0,
-3.0681, -2.732188, 2,
-3.223372, -2.882053, 2,
-3.0681, -2.732188, 4,
-3.223372, -2.882053, 4
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
-3.533916, -3.181785, -4, 0, -0.5, 0.5, 0.5,
-3.533916, -3.181785, -4, 1, -0.5, 0.5, 0.5,
-3.533916, -3.181785, -4, 1, 1.5, 0.5, 0.5,
-3.533916, -3.181785, -4, 0, 1.5, 0.5, 0.5,
-3.533916, -3.181785, -2, 0, -0.5, 0.5, 0.5,
-3.533916, -3.181785, -2, 1, -0.5, 0.5, 0.5,
-3.533916, -3.181785, -2, 1, 1.5, 0.5, 0.5,
-3.533916, -3.181785, -2, 0, 1.5, 0.5, 0.5,
-3.533916, -3.181785, 0, 0, -0.5, 0.5, 0.5,
-3.533916, -3.181785, 0, 1, -0.5, 0.5, 0.5,
-3.533916, -3.181785, 0, 1, 1.5, 0.5, 0.5,
-3.533916, -3.181785, 0, 0, 1.5, 0.5, 0.5,
-3.533916, -3.181785, 2, 0, -0.5, 0.5, 0.5,
-3.533916, -3.181785, 2, 1, -0.5, 0.5, 0.5,
-3.533916, -3.181785, 2, 1, 1.5, 0.5, 0.5,
-3.533916, -3.181785, 2, 0, 1.5, 0.5, 0.5,
-3.533916, -3.181785, 4, 0, -0.5, 0.5, 0.5,
-3.533916, -3.181785, 4, 1, -0.5, 0.5, 0.5,
-3.533916, -3.181785, 4, 1, 1.5, 0.5, 0.5,
-3.533916, -3.181785, 4, 0, 1.5, 0.5, 0.5
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
-3.0681, -2.732188, -5.056161,
-3.0681, 3.26244, -5.056161,
-3.0681, -2.732188, 5.890135,
-3.0681, 3.26244, 5.890135,
-3.0681, -2.732188, -5.056161,
-3.0681, -2.732188, 5.890135,
-3.0681, 3.26244, -5.056161,
-3.0681, 3.26244, 5.890135,
-3.0681, -2.732188, -5.056161,
3.142771, -2.732188, -5.056161,
-3.0681, -2.732188, 5.890135,
3.142771, -2.732188, 5.890135,
-3.0681, 3.26244, -5.056161,
3.142771, 3.26244, -5.056161,
-3.0681, 3.26244, 5.890135,
3.142771, 3.26244, 5.890135,
3.142771, -2.732188, -5.056161,
3.142771, 3.26244, -5.056161,
3.142771, -2.732188, 5.890135,
3.142771, 3.26244, 5.890135,
3.142771, -2.732188, -5.056161,
3.142771, -2.732188, 5.890135,
3.142771, 3.26244, -5.056161,
3.142771, 3.26244, 5.890135
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
var radius = 7.443848;
var distance = 33.11852;
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
mvMatrix.translate( -0.0373354, -0.2651261, -0.4169869 );
mvMatrix.scale( 1.295862, 1.342608, 0.7352656 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.11852);
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
Londax<-read.table("Londax.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Londax$V2
```

```
## Error in eval(expr, envir, enclos): object 'Londax' not found
```

```r
y<-Londax$V3
```

```
## Error in eval(expr, envir, enclos): object 'Londax' not found
```

```r
z<-Londax$V4
```

```
## Error in eval(expr, envir, enclos): object 'Londax' not found
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
-2.977651, 0.2582349, -1.789863, 0, 0, 1, 1, 1,
-2.85379, -0.9231403, -0.794163, 1, 0, 0, 1, 1,
-2.690071, -1.52429, -2.756939, 1, 0, 0, 1, 1,
-2.660603, -1.886009, -3.568763, 1, 0, 0, 1, 1,
-2.57601, 0.09052063, -0.9944085, 1, 0, 0, 1, 1,
-2.568204, 0.9755414, -3.107828, 1, 0, 0, 1, 1,
-2.439598, 3.175139, -1.791955, 0, 0, 0, 1, 1,
-2.421655, -0.5646978, -2.968936, 0, 0, 0, 1, 1,
-2.399366, 0.4306305, -2.022561, 0, 0, 0, 1, 1,
-2.366812, -0.04294853, -1.614451, 0, 0, 0, 1, 1,
-2.288049, 1.305183, -1.151029, 0, 0, 0, 1, 1,
-2.201935, -0.9141392, -0.7042185, 0, 0, 0, 1, 1,
-2.179606, 1.745888, -1.428094, 0, 0, 0, 1, 1,
-2.177094, -0.099494, -0.6419385, 1, 1, 1, 1, 1,
-2.176493, 0.5029776, -1.605155, 1, 1, 1, 1, 1,
-2.170434, -0.7303461, -1.958839, 1, 1, 1, 1, 1,
-2.159065, 0.7317687, -1.593168, 1, 1, 1, 1, 1,
-2.107727, -0.0950014, -1.264663, 1, 1, 1, 1, 1,
-2.091035, -0.5842057, 0.7255366, 1, 1, 1, 1, 1,
-2.07474, -1.048494, -2.253587, 1, 1, 1, 1, 1,
-2.06674, -0.9125724, -3.37767, 1, 1, 1, 1, 1,
-2.02758, -1.42207, -0.5414313, 1, 1, 1, 1, 1,
-2.011957, 0.4744858, -1.322179, 1, 1, 1, 1, 1,
-1.978658, -0.040514, -0.2571238, 1, 1, 1, 1, 1,
-1.970621, 1.119012, 0.06852461, 1, 1, 1, 1, 1,
-1.959642, 0.6151696, -2.336645, 1, 1, 1, 1, 1,
-1.945006, 0.8839873, -1.116022, 1, 1, 1, 1, 1,
-1.928147, -1.099215, -2.866099, 1, 1, 1, 1, 1,
-1.92354, 1.520321, -3.650824, 0, 0, 1, 1, 1,
-1.906512, 0.226442, -2.747591, 1, 0, 0, 1, 1,
-1.893215, -0.1260394, -0.5558814, 1, 0, 0, 1, 1,
-1.870259, -0.1787581, -1.620074, 1, 0, 0, 1, 1,
-1.855569, 1.603215, -1.713223, 1, 0, 0, 1, 1,
-1.829835, 1.103408, -2.330246, 1, 0, 0, 1, 1,
-1.814923, 1.091003, -3.198392, 0, 0, 0, 1, 1,
-1.77012, -1.46711, -0.9393136, 0, 0, 0, 1, 1,
-1.761468, -0.2410719, -3.260194, 0, 0, 0, 1, 1,
-1.753845, 1.5725, 0.621407, 0, 0, 0, 1, 1,
-1.752618, 1.724243, 0.6935822, 0, 0, 0, 1, 1,
-1.733256, -0.589342, -3.868867, 0, 0, 0, 1, 1,
-1.728113, -0.6887006, -1.556034, 0, 0, 0, 1, 1,
-1.721614, 0.7586248, -2.507371, 1, 1, 1, 1, 1,
-1.710476, -1.147464, -1.61153, 1, 1, 1, 1, 1,
-1.704597, 0.5728279, -1.884951, 1, 1, 1, 1, 1,
-1.69897, 0.8295382, -1.59227, 1, 1, 1, 1, 1,
-1.689114, -0.04135064, 0.8625993, 1, 1, 1, 1, 1,
-1.681307, -0.4210788, -1.68792, 1, 1, 1, 1, 1,
-1.659436, 1.075481, -2.146303, 1, 1, 1, 1, 1,
-1.644132, -0.6711394, -2.449203, 1, 1, 1, 1, 1,
-1.63289, -0.7902575, -1.122241, 1, 1, 1, 1, 1,
-1.614565, 1.501219, 0.01255104, 1, 1, 1, 1, 1,
-1.613971, -1.300176, -1.469104, 1, 1, 1, 1, 1,
-1.599302, 0.4612341, 0.4770916, 1, 1, 1, 1, 1,
-1.588776, -1.007195, -2.319843, 1, 1, 1, 1, 1,
-1.575404, -0.5990943, -0.4716028, 1, 1, 1, 1, 1,
-1.574823, -1.856806, -1.640124, 1, 1, 1, 1, 1,
-1.574146, 1.937742, 0.1344273, 0, 0, 1, 1, 1,
-1.571206, -0.4637379, -2.70661, 1, 0, 0, 1, 1,
-1.569448, 0.9140839, -0.9376543, 1, 0, 0, 1, 1,
-1.560872, 0.9214888, -1.545852, 1, 0, 0, 1, 1,
-1.55969, -1.726218, -2.212238, 1, 0, 0, 1, 1,
-1.559583, 1.146142, -1.81947, 1, 0, 0, 1, 1,
-1.553635, -0.6375796, -1.901564, 0, 0, 0, 1, 1,
-1.540626, -0.3892417, -1.928537, 0, 0, 0, 1, 1,
-1.536888, -0.4119848, -1.37807, 0, 0, 0, 1, 1,
-1.514072, -0.3724619, -1.862601, 0, 0, 0, 1, 1,
-1.510467, 0.1677852, -0.7913082, 0, 0, 0, 1, 1,
-1.504206, 1.737121, -0.1596038, 0, 0, 0, 1, 1,
-1.501892, -1.236056, -2.050327, 0, 0, 0, 1, 1,
-1.477873, 0.1304979, -1.099963, 1, 1, 1, 1, 1,
-1.473892, 0.08888097, -1.353913, 1, 1, 1, 1, 1,
-1.462887, -0.8030963, -2.529559, 1, 1, 1, 1, 1,
-1.4619, -0.1071445, -3.096399, 1, 1, 1, 1, 1,
-1.451667, 0.91904, 0.4105525, 1, 1, 1, 1, 1,
-1.445742, -1.629967, -1.472547, 1, 1, 1, 1, 1,
-1.436599, 0.8517064, -0.0407817, 1, 1, 1, 1, 1,
-1.421192, 0.4689526, -1.230249, 1, 1, 1, 1, 1,
-1.419749, -1.816012, -2.927453, 1, 1, 1, 1, 1,
-1.413848, 0.7320576, -2.508072, 1, 1, 1, 1, 1,
-1.409282, -0.3487346, -2.39309, 1, 1, 1, 1, 1,
-1.385311, -1.458849, -2.602556, 1, 1, 1, 1, 1,
-1.382375, 0.7922229, 0.3208138, 1, 1, 1, 1, 1,
-1.377919, 1.448473, 0.4225551, 1, 1, 1, 1, 1,
-1.373309, 0.2147074, -1.409709, 1, 1, 1, 1, 1,
-1.36845, 1.055948, -0.02072672, 0, 0, 1, 1, 1,
-1.351603, -1.584167, -0.1372909, 1, 0, 0, 1, 1,
-1.339826, 0.7047773, 0.9511253, 1, 0, 0, 1, 1,
-1.334701, -0.9768461, -2.385578, 1, 0, 0, 1, 1,
-1.332597, -1.602352, -3.865054, 1, 0, 0, 1, 1,
-1.329665, -0.3362272, -2.875806, 1, 0, 0, 1, 1,
-1.32465, 0.8671328, -0.8834151, 0, 0, 0, 1, 1,
-1.322115, -0.7658325, -3.192638, 0, 0, 0, 1, 1,
-1.317481, 0.5379249, -0.3496456, 0, 0, 0, 1, 1,
-1.31456, -0.7300407, -1.752558, 0, 0, 0, 1, 1,
-1.314146, 0.1964412, -2.004748, 0, 0, 0, 1, 1,
-1.306737, 1.309371, -0.9932193, 0, 0, 0, 1, 1,
-1.301668, 0.6476029, -1.13621, 0, 0, 0, 1, 1,
-1.300173, 1.280097, 0.4817609, 1, 1, 1, 1, 1,
-1.295491, 0.3617938, 1.228431, 1, 1, 1, 1, 1,
-1.293613, 0.2416819, -3.067034, 1, 1, 1, 1, 1,
-1.29022, 0.6163239, -0.974331, 1, 1, 1, 1, 1,
-1.272082, -0.1300133, -1.278296, 1, 1, 1, 1, 1,
-1.263782, -2.265524, -3.556805, 1, 1, 1, 1, 1,
-1.263737, 1.061171, -1.110303, 1, 1, 1, 1, 1,
-1.25384, 0.2437165, -0.8410036, 1, 1, 1, 1, 1,
-1.250171, 0.5118151, -3.103958, 1, 1, 1, 1, 1,
-1.247631, -0.2179989, -1.324444, 1, 1, 1, 1, 1,
-1.244056, -0.5054321, -1.469932, 1, 1, 1, 1, 1,
-1.229904, 1.151858, -1.933591, 1, 1, 1, 1, 1,
-1.229358, -0.05233916, -2.004609, 1, 1, 1, 1, 1,
-1.210759, -0.7916812, -3.311451, 1, 1, 1, 1, 1,
-1.20768, -0.5578399, -2.839045, 1, 1, 1, 1, 1,
-1.199663, -0.9355959, -2.427879, 0, 0, 1, 1, 1,
-1.191775, -0.7615222, -2.680679, 1, 0, 0, 1, 1,
-1.187958, -0.2174493, -2.529372, 1, 0, 0, 1, 1,
-1.187123, 1.011632, -0.00911198, 1, 0, 0, 1, 1,
-1.182258, -0.8300537, -2.093468, 1, 0, 0, 1, 1,
-1.180041, -0.6445194, -0.4156477, 1, 0, 0, 1, 1,
-1.17875, -0.3213553, -2.010858, 0, 0, 0, 1, 1,
-1.176461, -0.2176775, -2.591846, 0, 0, 0, 1, 1,
-1.170197, -1.09535, -1.987032, 0, 0, 0, 1, 1,
-1.168324, -0.9041751, -2.768074, 0, 0, 0, 1, 1,
-1.143057, 0.7587675, 0.3774796, 0, 0, 0, 1, 1,
-1.139511, 0.1892787, -2.334997, 0, 0, 0, 1, 1,
-1.138716, 0.7934173, -1.256913, 0, 0, 0, 1, 1,
-1.13087, -0.1862022, -0.3001123, 1, 1, 1, 1, 1,
-1.125065, 1.874595, -1.220232, 1, 1, 1, 1, 1,
-1.122314, -0.09088819, -1.145417, 1, 1, 1, 1, 1,
-1.11965, -1.334036, -0.8180377, 1, 1, 1, 1, 1,
-1.115056, 1.79648, -2.322029, 1, 1, 1, 1, 1,
-1.113148, 0.6800429, -0.4969332, 1, 1, 1, 1, 1,
-1.11221, 0.02972527, -0.86485, 1, 1, 1, 1, 1,
-1.11017, -1.04041, -2.420885, 1, 1, 1, 1, 1,
-1.108646, 0.6167601, -0.3899546, 1, 1, 1, 1, 1,
-1.102333, 0.2367874, -2.12878, 1, 1, 1, 1, 1,
-1.100496, 1.090957, -0.5043189, 1, 1, 1, 1, 1,
-1.098985, 0.2390763, -1.894152, 1, 1, 1, 1, 1,
-1.092158, 0.08636031, -2.942107, 1, 1, 1, 1, 1,
-1.09042, -1.027156, -2.267998, 1, 1, 1, 1, 1,
-1.085239, -0.3643609, -1.930846, 1, 1, 1, 1, 1,
-1.080147, 0.25788, -0.8130286, 0, 0, 1, 1, 1,
-1.077459, -0.4578764, -2.653911, 1, 0, 0, 1, 1,
-1.072972, -1.178631, -3.063913, 1, 0, 0, 1, 1,
-1.071928, -0.9169143, -1.31151, 1, 0, 0, 1, 1,
-1.068733, 2.055871, -1.258229, 1, 0, 0, 1, 1,
-1.061048, -0.5029984, -1.36967, 1, 0, 0, 1, 1,
-1.055434, 0.05088973, -0.4948182, 0, 0, 0, 1, 1,
-1.054335, 0.9849893, -0.4205412, 0, 0, 0, 1, 1,
-1.045237, 0.9381939, -0.7774469, 0, 0, 0, 1, 1,
-1.044227, -0.627172, -3.541829, 0, 0, 0, 1, 1,
-1.043376, -1.594125, -2.796248, 0, 0, 0, 1, 1,
-1.025546, 0.2710747, -1.003809, 0, 0, 0, 1, 1,
-1.02041, -1.877627, 0.3253542, 0, 0, 0, 1, 1,
-1.005187, 0.09195839, -2.327875, 1, 1, 1, 1, 1,
-1.003369, 0.1950658, -0.8151412, 1, 1, 1, 1, 1,
-0.9962384, -0.9836872, -3.210456, 1, 1, 1, 1, 1,
-0.9860439, 0.1068191, -2.278381, 1, 1, 1, 1, 1,
-0.9778008, -0.5293179, -2.158964, 1, 1, 1, 1, 1,
-0.9763108, 0.4475845, -0.9404644, 1, 1, 1, 1, 1,
-0.9755644, -0.9652072, -1.58355, 1, 1, 1, 1, 1,
-0.9748521, -0.2035201, -1.946267, 1, 1, 1, 1, 1,
-0.9724583, -0.2207422, -0.4919167, 1, 1, 1, 1, 1,
-0.9667346, -0.4940344, -3.452607, 1, 1, 1, 1, 1,
-0.9623998, 1.273355, -1.608795, 1, 1, 1, 1, 1,
-0.9595376, -0.503537, -0.04727177, 1, 1, 1, 1, 1,
-0.9554576, -0.173427, -1.415646, 1, 1, 1, 1, 1,
-0.952773, -0.390347, -1.455483, 1, 1, 1, 1, 1,
-0.9514289, 1.194092, 0.1320629, 1, 1, 1, 1, 1,
-0.943436, 1.628827, 0.4182015, 0, 0, 1, 1, 1,
-0.9417433, 1.28603, -2.562648, 1, 0, 0, 1, 1,
-0.9416564, -0.5510541, -3.613848, 1, 0, 0, 1, 1,
-0.9396339, -0.5399562, -2.764279, 1, 0, 0, 1, 1,
-0.9386389, 1.245499, 0.285835, 1, 0, 0, 1, 1,
-0.9380744, -0.4096789, -2.502523, 1, 0, 0, 1, 1,
-0.9379178, 0.7257028, 0.1202001, 0, 0, 0, 1, 1,
-0.9366807, 0.7522, 2.009794, 0, 0, 0, 1, 1,
-0.9355097, -0.1704634, -2.525732, 0, 0, 0, 1, 1,
-0.9343863, 1.088479, 0.01654731, 0, 0, 0, 1, 1,
-0.9321042, -0.6574057, -1.926647, 0, 0, 0, 1, 1,
-0.9282784, -0.487456, -1.850936, 0, 0, 0, 1, 1,
-0.9266676, 0.5818592, -1.869389, 0, 0, 0, 1, 1,
-0.9236796, -1.062551, -2.694168, 1, 1, 1, 1, 1,
-0.9235882, -0.1643547, -1.623681, 1, 1, 1, 1, 1,
-0.9113898, -1.22546, -2.467761, 1, 1, 1, 1, 1,
-0.9092431, 0.6556948, -0.3812459, 1, 1, 1, 1, 1,
-0.9070948, -0.05778438, -2.931147, 1, 1, 1, 1, 1,
-0.9025996, 0.6576461, -1.085637, 1, 1, 1, 1, 1,
-0.8994901, -1.313269, -1.709986, 1, 1, 1, 1, 1,
-0.8923746, -1.231045, -2.587548, 1, 1, 1, 1, 1,
-0.8895305, -0.2504757, -1.886396, 1, 1, 1, 1, 1,
-0.8883982, -0.07450969, -2.73634, 1, 1, 1, 1, 1,
-0.8879746, -1.045946, -1.989975, 1, 1, 1, 1, 1,
-0.8866878, 0.6399922, -0.740091, 1, 1, 1, 1, 1,
-0.8802223, 0.5348594, -1.241045, 1, 1, 1, 1, 1,
-0.8780745, -1.846583, -4.394778, 1, 1, 1, 1, 1,
-0.8763635, -0.5558412, -0.9887792, 1, 1, 1, 1, 1,
-0.8751639, 1.719267, -2.338967, 0, 0, 1, 1, 1,
-0.8719271, -0.9080351, -3.121588, 1, 0, 0, 1, 1,
-0.8700107, -1.851248, -3.024132, 1, 0, 0, 1, 1,
-0.8660866, 1.560024, -0.7332919, 1, 0, 0, 1, 1,
-0.8657082, 1.605923, -0.6644838, 1, 0, 0, 1, 1,
-0.8591475, 0.6536466, -1.282101, 1, 0, 0, 1, 1,
-0.85737, -0.1638202, -2.40992, 0, 0, 0, 1, 1,
-0.8548368, -0.06211422, -0.07203148, 0, 0, 0, 1, 1,
-0.8513782, -0.5226855, -2.432103, 0, 0, 0, 1, 1,
-0.841181, -0.4382248, -2.080191, 0, 0, 0, 1, 1,
-0.839512, 0.07028866, -2.50959, 0, 0, 0, 1, 1,
-0.8367779, -0.04681028, -1.761469, 0, 0, 0, 1, 1,
-0.833919, 1.698206, -0.7014585, 0, 0, 0, 1, 1,
-0.8304102, 0.2533324, -1.172065, 1, 1, 1, 1, 1,
-0.8272885, 0.5754964, -2.62443, 1, 1, 1, 1, 1,
-0.8261808, 0.376696, -0.2242277, 1, 1, 1, 1, 1,
-0.8261669, 0.3819387, -0.4590651, 1, 1, 1, 1, 1,
-0.8215008, 0.3207931, -2.258424, 1, 1, 1, 1, 1,
-0.820895, 0.7216465, -1.490435, 1, 1, 1, 1, 1,
-0.8118342, 0.615601, -0.5726758, 1, 1, 1, 1, 1,
-0.8060585, 0.3219784, 0.0115798, 1, 1, 1, 1, 1,
-0.7966565, 1.104879, -1.973958, 1, 1, 1, 1, 1,
-0.7878173, -0.04674365, -0.4504194, 1, 1, 1, 1, 1,
-0.787307, 0.379094, 0.6027594, 1, 1, 1, 1, 1,
-0.7864571, 1.155449, -1.763281, 1, 1, 1, 1, 1,
-0.7834217, -0.2144264, -1.945528, 1, 1, 1, 1, 1,
-0.778473, -1.507929, -0.7692355, 1, 1, 1, 1, 1,
-0.7779503, -1.300216, -3.134011, 1, 1, 1, 1, 1,
-0.7758399, -0.05629731, -2.046975, 0, 0, 1, 1, 1,
-0.7709233, 0.4606853, -3.334085, 1, 0, 0, 1, 1,
-0.7682591, -0.2533801, -2.772449, 1, 0, 0, 1, 1,
-0.766661, -2.099387, -1.538438, 1, 0, 0, 1, 1,
-0.7632254, 0.214933, -0.7814123, 1, 0, 0, 1, 1,
-0.7576495, 0.08444441, -1.60042, 1, 0, 0, 1, 1,
-0.7514747, 0.1946764, -1.676827, 0, 0, 0, 1, 1,
-0.7493495, -1.707158, -2.973005, 0, 0, 0, 1, 1,
-0.7453902, 1.169894, -0.7221941, 0, 0, 0, 1, 1,
-0.7406673, -0.3487077, -3.127755, 0, 0, 0, 1, 1,
-0.7404229, -0.198766, -3.387787, 0, 0, 0, 1, 1,
-0.7377192, 1.454131, 1.452132, 0, 0, 0, 1, 1,
-0.7339173, 1.8835, -0.1044457, 0, 0, 0, 1, 1,
-0.7323157, -1.219098, -3.68414, 1, 1, 1, 1, 1,
-0.7296529, 2.396755, 1.213489, 1, 1, 1, 1, 1,
-0.7234758, 0.3700547, -3.633455, 1, 1, 1, 1, 1,
-0.7231836, 0.6530728, -1.571345, 1, 1, 1, 1, 1,
-0.7190847, 2.221229, -1.208976, 1, 1, 1, 1, 1,
-0.7167239, 0.8902128, -1.262156, 1, 1, 1, 1, 1,
-0.7114037, -0.2984636, -1.916494, 1, 1, 1, 1, 1,
-0.7103331, -0.4394491, -2.152075, 1, 1, 1, 1, 1,
-0.7074664, -1.045058, -3.945231, 1, 1, 1, 1, 1,
-0.7048288, 0.894887, 0.02467449, 1, 1, 1, 1, 1,
-0.6990289, 0.3248811, -1.053563, 1, 1, 1, 1, 1,
-0.6949967, -0.4610032, -2.569265, 1, 1, 1, 1, 1,
-0.6918752, 0.3128201, -2.360056, 1, 1, 1, 1, 1,
-0.6909662, 0.4509611, -1.786134, 1, 1, 1, 1, 1,
-0.690963, -0.3322806, -1.764045, 1, 1, 1, 1, 1,
-0.6893239, 0.3496836, 0.4908361, 0, 0, 1, 1, 1,
-0.6882577, -0.2313887, -2.013784, 1, 0, 0, 1, 1,
-0.6832932, 1.131509, 0.2280704, 1, 0, 0, 1, 1,
-0.6714365, -1.479509, -1.839808, 1, 0, 0, 1, 1,
-0.6713972, 0.7306908, -2.965322, 1, 0, 0, 1, 1,
-0.670705, 1.207612, -1.798145, 1, 0, 0, 1, 1,
-0.6673518, 0.6573154, -1.436079, 0, 0, 0, 1, 1,
-0.6572397, -0.5652219, -2.565732, 0, 0, 0, 1, 1,
-0.6529388, 0.672692, 0.5049602, 0, 0, 0, 1, 1,
-0.649703, -0.646053, -2.462766, 0, 0, 0, 1, 1,
-0.6461929, -1.15286, -2.19421, 0, 0, 0, 1, 1,
-0.645245, 0.6971475, 0.05776849, 0, 0, 0, 1, 1,
-0.6436139, -1.002414, -3.381232, 0, 0, 0, 1, 1,
-0.6358566, -0.7416324, -3.436274, 1, 1, 1, 1, 1,
-0.6352189, -0.7314087, -0.0816609, 1, 1, 1, 1, 1,
-0.6341332, 0.4459676, -1.477649, 1, 1, 1, 1, 1,
-0.6319121, -0.6495883, -0.4849605, 1, 1, 1, 1, 1,
-0.6301082, -0.07788107, 0.0005990341, 1, 1, 1, 1, 1,
-0.6286657, -2.183266, -3.86868, 1, 1, 1, 1, 1,
-0.6211513, 0.6038747, 0.500303, 1, 1, 1, 1, 1,
-0.6187526, 1.865507, -1.307146, 1, 1, 1, 1, 1,
-0.6183534, 0.1640342, 0.2683966, 1, 1, 1, 1, 1,
-0.6180922, 0.6502218, -1.074091, 1, 1, 1, 1, 1,
-0.6146319, 0.01439115, -2.454486, 1, 1, 1, 1, 1,
-0.6119605, 0.8378655, -0.8297954, 1, 1, 1, 1, 1,
-0.6117212, 0.814235, -1.301437, 1, 1, 1, 1, 1,
-0.6113197, -0.3001887, -1.965115, 1, 1, 1, 1, 1,
-0.6095406, -1.086441, -2.62636, 1, 1, 1, 1, 1,
-0.6064819, 0.4645504, -1.61843, 0, 0, 1, 1, 1,
-0.6050954, 0.2994482, -2.186222, 1, 0, 0, 1, 1,
-0.6042527, 1.130861, 1.463699, 1, 0, 0, 1, 1,
-0.6037232, -1.206699, -1.512506, 1, 0, 0, 1, 1,
-0.6026801, 1.721151, 0.1474674, 1, 0, 0, 1, 1,
-0.5995066, 0.6003188, -1.468916, 1, 0, 0, 1, 1,
-0.5977083, 0.3299779, -1.426735, 0, 0, 0, 1, 1,
-0.5955224, -0.4473993, -1.890516, 0, 0, 0, 1, 1,
-0.5943261, 0.8875925, -1.20421, 0, 0, 0, 1, 1,
-0.5930593, -0.9913872, -3.85309, 0, 0, 0, 1, 1,
-0.5878588, -0.7303059, -4.484403, 0, 0, 0, 1, 1,
-0.586309, -1.110436, -3.220648, 0, 0, 0, 1, 1,
-0.5805578, -0.3101694, -1.771091, 0, 0, 0, 1, 1,
-0.5755219, -0.3846802, -2.685827, 1, 1, 1, 1, 1,
-0.5736877, 1.079479, 0.006367956, 1, 1, 1, 1, 1,
-0.5733628, 0.03073991, -1.480306, 1, 1, 1, 1, 1,
-0.5696725, -0.3471063, -2.9816, 1, 1, 1, 1, 1,
-0.5672577, 0.4125251, 0.01987613, 1, 1, 1, 1, 1,
-0.5671653, -1.044438, -1.117926, 1, 1, 1, 1, 1,
-0.5651026, 0.1015195, -1.092533, 1, 1, 1, 1, 1,
-0.5642973, -1.283353, -2.378198, 1, 1, 1, 1, 1,
-0.561319, -0.5406253, -2.54722, 1, 1, 1, 1, 1,
-0.5543911, 0.4076883, -1.486221, 1, 1, 1, 1, 1,
-0.5525088, 0.04193687, -2.286353, 1, 1, 1, 1, 1,
-0.5510815, -0.1088621, -1.928782, 1, 1, 1, 1, 1,
-0.5506242, -0.6052992, -2.197605, 1, 1, 1, 1, 1,
-0.5493282, -0.04719208, -1.850462, 1, 1, 1, 1, 1,
-0.5491853, -2.19346, -3.08184, 1, 1, 1, 1, 1,
-0.5466156, -0.7914373, -1.567922, 0, 0, 1, 1, 1,
-0.5451254, -1.676566, -3.289179, 1, 0, 0, 1, 1,
-0.5439236, -0.5116867, -0.4717491, 1, 0, 0, 1, 1,
-0.5390222, -0.7907042, -1.018854, 1, 0, 0, 1, 1,
-0.5386778, 0.5739108, -1.237565, 1, 0, 0, 1, 1,
-0.5374048, 1.687493, 0.1603725, 1, 0, 0, 1, 1,
-0.5362608, -1.593292, -3.429413, 0, 0, 0, 1, 1,
-0.5361416, 1.191668, -0.122867, 0, 0, 0, 1, 1,
-0.534151, -0.6294497, -1.303132, 0, 0, 0, 1, 1,
-0.534014, -0.6974947, -2.937411, 0, 0, 0, 1, 1,
-0.5332502, 0.5259361, -0.7021573, 0, 0, 0, 1, 1,
-0.5280555, 1.108512, -1.192994, 0, 0, 0, 1, 1,
-0.5191647, 0.4835808, -0.9096164, 0, 0, 0, 1, 1,
-0.5108209, -1.12221, -2.02534, 1, 1, 1, 1, 1,
-0.5078837, -0.3180754, -1.891972, 1, 1, 1, 1, 1,
-0.5078334, -1.522719, -3.602348, 1, 1, 1, 1, 1,
-0.5069785, 0.7357374, -0.4911672, 1, 1, 1, 1, 1,
-0.5051806, -0.9018152, -2.779171, 1, 1, 1, 1, 1,
-0.5040945, 0.4763676, 0.2499959, 1, 1, 1, 1, 1,
-0.5009727, 0.8425048, -0.9749646, 1, 1, 1, 1, 1,
-0.4986077, -0.3307313, -3.455208, 1, 1, 1, 1, 1,
-0.4922855, 1.350288, -0.4184284, 1, 1, 1, 1, 1,
-0.4906748, 1.291746, 0.001321375, 1, 1, 1, 1, 1,
-0.4865579, 0.2673317, -0.8449969, 1, 1, 1, 1, 1,
-0.4809869, -0.6070095, -2.060899, 1, 1, 1, 1, 1,
-0.4795817, 0.6803478, -0.8412647, 1, 1, 1, 1, 1,
-0.4781218, 0.1075546, -1.095727, 1, 1, 1, 1, 1,
-0.4760926, 0.6044375, 0.2390243, 1, 1, 1, 1, 1,
-0.4718435, -0.6705566, -2.247631, 0, 0, 1, 1, 1,
-0.4617533, 1.827168, -0.8314831, 1, 0, 0, 1, 1,
-0.4611783, 0.571492, 0.8985079, 1, 0, 0, 1, 1,
-0.4607331, 0.09212666, -0.4248694, 1, 0, 0, 1, 1,
-0.4604386, 1.496629, -0.1083492, 1, 0, 0, 1, 1,
-0.4587412, 1.021358, -0.2402202, 1, 0, 0, 1, 1,
-0.45681, -1.428659, -2.699388, 0, 0, 0, 1, 1,
-0.4563389, -1.167512, -4.237088, 0, 0, 0, 1, 1,
-0.4515554, -1.234605, -3.171641, 0, 0, 0, 1, 1,
-0.4478838, 0.4539723, -0.1513193, 0, 0, 0, 1, 1,
-0.4426267, 1.474655, -1.04663, 0, 0, 0, 1, 1,
-0.4386673, 0.5462132, -0.7554423, 0, 0, 0, 1, 1,
-0.436899, -0.1334634, -3.420084, 0, 0, 0, 1, 1,
-0.433762, -0.2576404, -2.975606, 1, 1, 1, 1, 1,
-0.4335513, -0.2297209, -0.4952917, 1, 1, 1, 1, 1,
-0.4262223, 0.4845454, 0.6357879, 1, 1, 1, 1, 1,
-0.422296, -0.3817508, -1.074901, 1, 1, 1, 1, 1,
-0.4202824, -2.392817, -3.715184, 1, 1, 1, 1, 1,
-0.4189125, 2.176992, 1.574505, 1, 1, 1, 1, 1,
-0.4153027, 0.2691644, -1.314876, 1, 1, 1, 1, 1,
-0.4140405, 0.1198619, -0.7110251, 1, 1, 1, 1, 1,
-0.4051402, -1.839991, -2.946709, 1, 1, 1, 1, 1,
-0.4005949, 1.078847, -0.271882, 1, 1, 1, 1, 1,
-0.3963533, -0.08856889, -1.487829, 1, 1, 1, 1, 1,
-0.3939789, -0.3882276, -2.799831, 1, 1, 1, 1, 1,
-0.3911194, 0.9953687, -0.6472408, 1, 1, 1, 1, 1,
-0.3909112, 0.5317201, -0.5510074, 1, 1, 1, 1, 1,
-0.3876719, -0.5500146, -2.970141, 1, 1, 1, 1, 1,
-0.3874556, -0.782931, -1.812262, 0, 0, 1, 1, 1,
-0.3850787, -2.329196, -2.914235, 1, 0, 0, 1, 1,
-0.3818533, 0.3988361, 0.3350023, 1, 0, 0, 1, 1,
-0.3788424, -1.318642, -4.195973, 1, 0, 0, 1, 1,
-0.3740085, -0.3769462, -0.5114683, 1, 0, 0, 1, 1,
-0.3702859, 1.311311, -0.402594, 1, 0, 0, 1, 1,
-0.368577, -0.5935687, -4.595226, 0, 0, 0, 1, 1,
-0.3652339, 2.84595, 1.081577, 0, 0, 0, 1, 1,
-0.3630484, 0.1974686, 0.1312608, 0, 0, 0, 1, 1,
-0.3612008, -0.6732662, -0.5700148, 0, 0, 0, 1, 1,
-0.3603151, -0.403454, -2.853872, 0, 0, 0, 1, 1,
-0.3575689, 0.183878, -1.108855, 0, 0, 0, 1, 1,
-0.3520301, -0.6846197, -2.923273, 0, 0, 0, 1, 1,
-0.3473952, -0.1033395, -2.364874, 1, 1, 1, 1, 1,
-0.3435174, -0.6700697, -1.32964, 1, 1, 1, 1, 1,
-0.3403278, -0.3306966, -2.17652, 1, 1, 1, 1, 1,
-0.339135, -0.4872038, -2.091511, 1, 1, 1, 1, 1,
-0.3355475, -0.8172597, -3.988134, 1, 1, 1, 1, 1,
-0.3335503, 0.4305337, 0.7224846, 1, 1, 1, 1, 1,
-0.3311004, -0.07520942, 0.2482109, 1, 1, 1, 1, 1,
-0.3271904, -0.3672736, -1.284095, 1, 1, 1, 1, 1,
-0.3269359, -0.5011875, -4.67454, 1, 1, 1, 1, 1,
-0.325872, -0.520341, -2.739262, 1, 1, 1, 1, 1,
-0.3226587, 0.5969541, 0.6636454, 1, 1, 1, 1, 1,
-0.3220122, -1.27555, -2.650824, 1, 1, 1, 1, 1,
-0.3197597, 0.4980474, -1.229924, 1, 1, 1, 1, 1,
-0.3190899, 0.4158423, -1.197034, 1, 1, 1, 1, 1,
-0.316531, -0.7643087, -1.66387, 1, 1, 1, 1, 1,
-0.3163512, -1.814127, -2.972721, 0, 0, 1, 1, 1,
-0.3142935, 0.05602112, -0.9795985, 1, 0, 0, 1, 1,
-0.3123966, 0.1809435, 0.414016, 1, 0, 0, 1, 1,
-0.3115575, -0.3364443, -1.835142, 1, 0, 0, 1, 1,
-0.3090453, -1.078465, -3.326534, 1, 0, 0, 1, 1,
-0.3089096, -0.7621121, -0.9198063, 1, 0, 0, 1, 1,
-0.3052275, 0.3299958, 0.3054294, 0, 0, 0, 1, 1,
-0.303697, -0.3468023, -2.287303, 0, 0, 0, 1, 1,
-0.3030574, -0.05136503, -1.821051, 0, 0, 0, 1, 1,
-0.302833, -0.3889329, -3.657039, 0, 0, 0, 1, 1,
-0.3012346, -0.2056029, -3.827301, 0, 0, 0, 1, 1,
-0.3009683, -1.341427, -2.387643, 0, 0, 0, 1, 1,
-0.2997718, 1.508678, 0.2582099, 0, 0, 0, 1, 1,
-0.2975704, 0.6612962, -0.4119937, 1, 1, 1, 1, 1,
-0.2908715, 0.570327, -0.6629484, 1, 1, 1, 1, 1,
-0.2862274, 0.4033877, -0.9277188, 1, 1, 1, 1, 1,
-0.2860088, -0.4318433, -0.1858439, 1, 1, 1, 1, 1,
-0.2833526, -0.2369326, -1.553889, 1, 1, 1, 1, 1,
-0.2832929, -1.401201, -2.896142, 1, 1, 1, 1, 1,
-0.2819983, -0.4657221, -2.753296, 1, 1, 1, 1, 1,
-0.2817205, -1.607189, -2.96813, 1, 1, 1, 1, 1,
-0.2754374, 0.9268473, -0.01790967, 1, 1, 1, 1, 1,
-0.2731697, -0.015001, -3.453161, 1, 1, 1, 1, 1,
-0.2675716, 0.3896886, -1.013776, 1, 1, 1, 1, 1,
-0.2673218, 1.958067, 1.005212, 1, 1, 1, 1, 1,
-0.2662978, 0.6560947, 0.3427136, 1, 1, 1, 1, 1,
-0.2612875, 1.141204, 0.4669499, 1, 1, 1, 1, 1,
-0.2603845, 1.342794, 1.025583, 1, 1, 1, 1, 1,
-0.2600855, 0.2195797, 0.3644136, 0, 0, 1, 1, 1,
-0.2567429, -0.5345262, -2.43499, 1, 0, 0, 1, 1,
-0.2552834, 0.5771878, -0.2466161, 1, 0, 0, 1, 1,
-0.254878, 1.097539, -0.02033884, 1, 0, 0, 1, 1,
-0.2544175, -0.9589283, -2.398393, 1, 0, 0, 1, 1,
-0.253016, 0.4686828, -0.7241816, 1, 0, 0, 1, 1,
-0.2487838, -0.4654946, -2.628627, 0, 0, 0, 1, 1,
-0.2483105, 1.067016, -1.069737, 0, 0, 0, 1, 1,
-0.2428763, -1.939415, -2.878489, 0, 0, 0, 1, 1,
-0.2426693, -0.9611645, -2.583391, 0, 0, 0, 1, 1,
-0.2359932, -0.2561264, -2.295274, 0, 0, 0, 1, 1,
-0.2326283, 1.660755, 1.374921, 0, 0, 0, 1, 1,
-0.2279456, -0.1421172, -2.285314, 0, 0, 0, 1, 1,
-0.2250573, -0.7605606, -3.191319, 1, 1, 1, 1, 1,
-0.2242171, -0.1696109, -1.991271, 1, 1, 1, 1, 1,
-0.2224644, 0.6873203, 0.2267757, 1, 1, 1, 1, 1,
-0.2224038, 1.656003, 0.248695, 1, 1, 1, 1, 1,
-0.2207291, 1.966009, -0.160307, 1, 1, 1, 1, 1,
-0.2198149, 0.1492951, -0.5015495, 1, 1, 1, 1, 1,
-0.2172082, 0.5788627, 0.5139273, 1, 1, 1, 1, 1,
-0.2145609, 0.4898199, -0.1962329, 1, 1, 1, 1, 1,
-0.2119425, -0.7009165, -3.223017, 1, 1, 1, 1, 1,
-0.2090037, -0.972988, -3.860957, 1, 1, 1, 1, 1,
-0.1968053, 0.8445156, 1.144686, 1, 1, 1, 1, 1,
-0.1961975, -1.127859, -4.321841, 1, 1, 1, 1, 1,
-0.1938615, 0.503487, -0.4173798, 1, 1, 1, 1, 1,
-0.180422, 0.7242911, -1.389842, 1, 1, 1, 1, 1,
-0.1787699, -1.655851, -2.872963, 1, 1, 1, 1, 1,
-0.1786075, -0.9558781, -3.995018, 0, 0, 1, 1, 1,
-0.178284, -1.273164, -3.350803, 1, 0, 0, 1, 1,
-0.1753216, -0.5795904, -0.3558054, 1, 0, 0, 1, 1,
-0.1719377, -0.430054, -1.623342, 1, 0, 0, 1, 1,
-0.1706697, -0.08701289, -2.165413, 1, 0, 0, 1, 1,
-0.1645388, -1.753802, -2.730458, 1, 0, 0, 1, 1,
-0.1595915, -0.3723093, -1.655609, 0, 0, 0, 1, 1,
-0.1581924, 0.1044071, 0.1814056, 0, 0, 0, 1, 1,
-0.1491143, 0.9307425, -0.772971, 0, 0, 0, 1, 1,
-0.1463292, 0.04327259, -0.9475757, 0, 0, 0, 1, 1,
-0.1415936, -0.9945276, -2.643654, 0, 0, 0, 1, 1,
-0.1390278, 0.6371514, 1.260917, 0, 0, 0, 1, 1,
-0.136774, -0.2551561, -2.498151, 0, 0, 0, 1, 1,
-0.1347871, 0.6301915, 0.574275, 1, 1, 1, 1, 1,
-0.1323965, -0.1671985, -1.660768, 1, 1, 1, 1, 1,
-0.1311004, 0.1096165, -1.362244, 1, 1, 1, 1, 1,
-0.1308042, 0.5510302, -0.304201, 1, 1, 1, 1, 1,
-0.1257806, -0.4769276, -2.689723, 1, 1, 1, 1, 1,
-0.1240007, -0.8437198, -2.549045, 1, 1, 1, 1, 1,
-0.1239919, -0.7044312, -1.959159, 1, 1, 1, 1, 1,
-0.1233881, 0.8083762, -0.2828594, 1, 1, 1, 1, 1,
-0.1221516, -0.3814505, -2.389045, 1, 1, 1, 1, 1,
-0.1089677, 0.3881559, 0.06579328, 1, 1, 1, 1, 1,
-0.1070109, 0.9152218, -0.6558512, 1, 1, 1, 1, 1,
-0.1056283, -1.014666, -3.057707, 1, 1, 1, 1, 1,
-0.1021637, 0.09059608, -1.263237, 1, 1, 1, 1, 1,
-0.1012159, -0.07214965, -2.311453, 1, 1, 1, 1, 1,
-0.1004379, -0.1538515, -2.72019, 1, 1, 1, 1, 1,
-0.0949569, 1.675966, -1.60483, 0, 0, 1, 1, 1,
-0.09371014, -0.2005806, -2.833821, 1, 0, 0, 1, 1,
-0.09350456, 0.660688, 0.3168205, 1, 0, 0, 1, 1,
-0.0928332, 0.661325, 1.000676, 1, 0, 0, 1, 1,
-0.09203173, 0.6883792, 0.8521178, 1, 0, 0, 1, 1,
-0.08892833, 0.9019737, -1.047305, 1, 0, 0, 1, 1,
-0.08719868, -0.3346329, -4.346071, 0, 0, 0, 1, 1,
-0.0849427, -0.6831799, -2.381947, 0, 0, 0, 1, 1,
-0.0833047, 1.603049, -0.4803723, 0, 0, 0, 1, 1,
-0.08137015, 1.709664, -1.473629, 0, 0, 0, 1, 1,
-0.07804178, -0.7211666, -0.6188406, 0, 0, 0, 1, 1,
-0.06987728, 0.04325043, -1.145031, 0, 0, 0, 1, 1,
-0.06898025, -1.366885, -4.896749, 0, 0, 0, 1, 1,
-0.0689676, 0.5939712, -0.1534909, 1, 1, 1, 1, 1,
-0.06646734, 0.9548239, -0.1301383, 1, 1, 1, 1, 1,
-0.06645562, -0.4712072, -3.688909, 1, 1, 1, 1, 1,
-0.06041968, 2.024339, 0.912299, 1, 1, 1, 1, 1,
-0.05992173, 1.564182, -1.376653, 1, 1, 1, 1, 1,
-0.05699179, 1.036951, -1.828037, 1, 1, 1, 1, 1,
-0.05632823, -0.4019151, -1.784115, 1, 1, 1, 1, 1,
-0.05601345, -1.130966, -1.323135, 1, 1, 1, 1, 1,
-0.05004113, 0.4081754, -0.9653818, 1, 1, 1, 1, 1,
-0.04961876, 0.5879574, -1.486195, 1, 1, 1, 1, 1,
-0.04908204, 0.01673315, -0.4652862, 1, 1, 1, 1, 1,
-0.04897527, -1.371153, -3.476704, 1, 1, 1, 1, 1,
-0.04796169, -0.0153748, -2.991071, 1, 1, 1, 1, 1,
-0.04604772, -0.8621684, -3.305119, 1, 1, 1, 1, 1,
-0.04517812, 0.2207355, 0.2006861, 1, 1, 1, 1, 1,
-0.04449128, 2.697725, 3.644952, 0, 0, 1, 1, 1,
-0.03403759, 0.01698075, -0.2812116, 1, 0, 0, 1, 1,
-0.02830644, 0.05184214, -0.5119966, 1, 0, 0, 1, 1,
-0.02787837, 1.022301, -1.175218, 1, 0, 0, 1, 1,
-0.02649735, -1.126746, -2.030884, 1, 0, 0, 1, 1,
-0.0236511, 2.106158, 0.9480209, 1, 0, 0, 1, 1,
-0.02339291, -0.8029681, -3.283353, 0, 0, 0, 1, 1,
-0.02073775, -0.7838999, -3.29467, 0, 0, 0, 1, 1,
-0.01832921, -1.224026, -2.593411, 0, 0, 0, 1, 1,
-0.01695737, -0.7189748, -4.359433, 0, 0, 0, 1, 1,
-0.01507484, 0.9836727, 1.524413, 0, 0, 0, 1, 1,
-0.01296377, -0.8772518, -3.89113, 0, 0, 0, 1, 1,
-0.01221599, -1.392942, -2.504585, 0, 0, 0, 1, 1,
-0.00627776, 1.723666, -0.9020556, 1, 1, 1, 1, 1,
-0.005002836, 0.7113913, 1.098977, 1, 1, 1, 1, 1,
-0.004615024, 0.07436859, 0.5792641, 1, 1, 1, 1, 1,
-0.003122187, -0.8614351, -2.896874, 1, 1, 1, 1, 1,
0.001098421, 0.3346594, -0.0499974, 1, 1, 1, 1, 1,
0.00114171, -0.4075743, 5.205157, 1, 1, 1, 1, 1,
0.001564782, -0.03815927, 3.913978, 1, 1, 1, 1, 1,
0.003206328, 1.784768, 0.5038336, 1, 1, 1, 1, 1,
0.004875452, -0.1330203, 2.220512, 1, 1, 1, 1, 1,
0.006690272, -2.280123, 1.851277, 1, 1, 1, 1, 1,
0.007292701, 1.436393, 0.8438236, 1, 1, 1, 1, 1,
0.01443649, 0.6625544, -0.8960356, 1, 1, 1, 1, 1,
0.01638659, -0.05121962, 3.629462, 1, 1, 1, 1, 1,
0.01668603, 1.194891, -0.07400737, 1, 1, 1, 1, 1,
0.01893848, -0.2872832, 3.827509, 1, 1, 1, 1, 1,
0.02368872, 0.8258174, -1.865708, 0, 0, 1, 1, 1,
0.02968566, 1.251926, -0.004540666, 1, 0, 0, 1, 1,
0.03496023, -0.9170119, 2.908529, 1, 0, 0, 1, 1,
0.04198446, 1.220156, -0.3723126, 1, 0, 0, 1, 1,
0.04712043, 2.163825, -0.3647583, 1, 0, 0, 1, 1,
0.05406372, 0.3072904, 1.165605, 1, 0, 0, 1, 1,
0.05940399, -0.4349816, 4.539676, 0, 0, 0, 1, 1,
0.06083483, 0.7340658, 1.156731, 0, 0, 0, 1, 1,
0.06613439, -0.6135693, 2.89993, 0, 0, 0, 1, 1,
0.06675076, 0.4143523, 0.4169185, 0, 0, 0, 1, 1,
0.06845088, -0.7764117, 2.368529, 0, 0, 0, 1, 1,
0.07106823, 1.709425, 0.8190648, 0, 0, 0, 1, 1,
0.07884891, 0.09094035, 2.10661, 0, 0, 0, 1, 1,
0.08642331, -0.4151648, 3.499152, 1, 1, 1, 1, 1,
0.08662338, 2.058261, 1.30376, 1, 1, 1, 1, 1,
0.08802271, -1.09845, 3.010717, 1, 1, 1, 1, 1,
0.0925009, 0.05835471, 2.21593, 1, 1, 1, 1, 1,
0.09472823, -0.2862737, 1.523914, 1, 1, 1, 1, 1,
0.09639504, -1.33164, 2.894716, 1, 1, 1, 1, 1,
0.09821626, -0.05725815, 1.214185, 1, 1, 1, 1, 1,
0.105205, 0.8405622, -1.011901, 1, 1, 1, 1, 1,
0.1078963, 0.4795589, -0.2182104, 1, 1, 1, 1, 1,
0.1087086, 0.2863597, 0.3716256, 1, 1, 1, 1, 1,
0.1099268, -0.6343966, 3.397343, 1, 1, 1, 1, 1,
0.1112583, -1.418604, 3.764817, 1, 1, 1, 1, 1,
0.1133431, -1.069564, 3.05072, 1, 1, 1, 1, 1,
0.1148198, 0.2106669, -0.2421153, 1, 1, 1, 1, 1,
0.1151118, -0.9153801, 2.790725, 1, 1, 1, 1, 1,
0.1189439, 0.7824593, 0.4738217, 0, 0, 1, 1, 1,
0.1190816, 1.220184, -1.781381, 1, 0, 0, 1, 1,
0.1244136, -1.099806, 2.452034, 1, 0, 0, 1, 1,
0.125248, -0.4018168, 2.063045, 1, 0, 0, 1, 1,
0.1258812, 1.630876, 0.4671544, 1, 0, 0, 1, 1,
0.1290468, -0.7704931, 3.54599, 1, 0, 0, 1, 1,
0.1305328, -1.544424, 2.437943, 0, 0, 0, 1, 1,
0.1380997, -0.4149742, 4.910802, 0, 0, 0, 1, 1,
0.1392143, -1.059347, 2.882106, 0, 0, 0, 1, 1,
0.1396361, -0.05925937, 1.220007, 0, 0, 0, 1, 1,
0.1414713, 0.01292986, 0.8500764, 0, 0, 0, 1, 1,
0.1419756, -0.1852646, 2.341217, 0, 0, 0, 1, 1,
0.1443522, -1.665559, 2.694656, 0, 0, 0, 1, 1,
0.1450906, -0.4175904, 2.799306, 1, 1, 1, 1, 1,
0.1474059, 0.1746544, -0.4897105, 1, 1, 1, 1, 1,
0.1510876, -0.8458611, 2.616986, 1, 1, 1, 1, 1,
0.15953, 0.1600637, 1.106982, 1, 1, 1, 1, 1,
0.1671021, -1.174582, 2.144922, 1, 1, 1, 1, 1,
0.1697385, -0.8346303, 3.652341, 1, 1, 1, 1, 1,
0.1709333, 0.1362491, -0.09520701, 1, 1, 1, 1, 1,
0.1725382, -1.292562, 3.429101, 1, 1, 1, 1, 1,
0.1727197, 0.04037611, -0.08594785, 1, 1, 1, 1, 1,
0.1801195, 0.802793, 1.578916, 1, 1, 1, 1, 1,
0.1813697, -0.9144157, 2.521013, 1, 1, 1, 1, 1,
0.1827556, 0.7205963, -1.942233, 1, 1, 1, 1, 1,
0.1833441, -1.743305, 2.131158, 1, 1, 1, 1, 1,
0.1866675, -0.9958191, 1.602929, 1, 1, 1, 1, 1,
0.1983986, 0.8759226, -1.1589, 1, 1, 1, 1, 1,
0.2025258, 0.6929654, -0.3172899, 0, 0, 1, 1, 1,
0.2130766, 0.7140408, -0.1068033, 1, 0, 0, 1, 1,
0.216502, 0.3625937, 0.6763648, 1, 0, 0, 1, 1,
0.2185155, -0.2948545, 1.149742, 1, 0, 0, 1, 1,
0.2208093, -1.193084, 2.321873, 1, 0, 0, 1, 1,
0.222782, -0.7077854, 1.958248, 1, 0, 0, 1, 1,
0.2238941, -0.9324644, 1.842076, 0, 0, 0, 1, 1,
0.2245471, -1.115147, 2.401901, 0, 0, 0, 1, 1,
0.2253539, 0.199996, 1.934124, 0, 0, 0, 1, 1,
0.2253934, 0.9804847, -0.2539707, 0, 0, 0, 1, 1,
0.2296814, -0.6327111, 4.333947, 0, 0, 0, 1, 1,
0.231715, -1.141765, 1.473584, 0, 0, 0, 1, 1,
0.2340663, 0.03005811, 2.4931, 0, 0, 0, 1, 1,
0.2361032, -2.056094, 2.981575, 1, 1, 1, 1, 1,
0.2361859, -1.467085, 3.279669, 1, 1, 1, 1, 1,
0.2373356, 1.829762, -1.795711, 1, 1, 1, 1, 1,
0.2379813, -1.087723, 3.475265, 1, 1, 1, 1, 1,
0.2403353, -1.848569, 3.711514, 1, 1, 1, 1, 1,
0.2409636, -0.8843089, 2.584053, 1, 1, 1, 1, 1,
0.2449055, 0.3917615, 0.1033892, 1, 1, 1, 1, 1,
0.2457955, 0.05872365, -0.7265457, 1, 1, 1, 1, 1,
0.2530271, -2.230655, 1.131113, 1, 1, 1, 1, 1,
0.256193, -0.06993321, 3.246968, 1, 1, 1, 1, 1,
0.2578479, -0.8791519, 3.553174, 1, 1, 1, 1, 1,
0.2635219, 0.05543098, 1.385416, 1, 1, 1, 1, 1,
0.2694679, 1.859153, -0.0869972, 1, 1, 1, 1, 1,
0.2701574, -1.137147, 2.15399, 1, 1, 1, 1, 1,
0.271179, -1.846573, 4.914521, 1, 1, 1, 1, 1,
0.2740437, -0.3922615, 0.9766936, 0, 0, 1, 1, 1,
0.2741896, 0.3760264, 1.825641, 1, 0, 0, 1, 1,
0.2752317, -1.783533, 2.849536, 1, 0, 0, 1, 1,
0.2783011, -1.10757, 2.483187, 1, 0, 0, 1, 1,
0.2790477, 0.49808, -0.5325418, 1, 0, 0, 1, 1,
0.2854129, 0.7561186, 0.7497185, 1, 0, 0, 1, 1,
0.2854428, 0.5736831, 1.472751, 0, 0, 0, 1, 1,
0.2877835, -1.35149, 2.842028, 0, 0, 0, 1, 1,
0.2895942, -0.02772882, 2.046474, 0, 0, 0, 1, 1,
0.2911654, 1.645582, 0.4583462, 0, 0, 0, 1, 1,
0.2967402, -0.3797736, 2.31862, 0, 0, 0, 1, 1,
0.3020062, 0.1856978, 2.047324, 0, 0, 0, 1, 1,
0.3030584, 0.2181226, 1.288108, 0, 0, 0, 1, 1,
0.3118856, 1.472473, 2.285304, 1, 1, 1, 1, 1,
0.3195821, -0.3564887, 1.328059, 1, 1, 1, 1, 1,
0.320967, -1.977857, 5.730723, 1, 1, 1, 1, 1,
0.321835, 1.109882, 0.3389094, 1, 1, 1, 1, 1,
0.3252371, -1.24346, 3.852982, 1, 1, 1, 1, 1,
0.3292823, 1.31186, -1.711286, 1, 1, 1, 1, 1,
0.3309352, -0.395779, 1.083602, 1, 1, 1, 1, 1,
0.3318521, 0.0602196, 3.071246, 1, 1, 1, 1, 1,
0.3318832, -1.627948, 3.107839, 1, 1, 1, 1, 1,
0.3329929, 0.224986, 0.2863468, 1, 1, 1, 1, 1,
0.3338523, 1.02546, 0.9210477, 1, 1, 1, 1, 1,
0.3358937, 0.6701533, 0.04504063, 1, 1, 1, 1, 1,
0.3369304, -0.2378534, 3.832939, 1, 1, 1, 1, 1,
0.3430978, 0.5832555, 0.182789, 1, 1, 1, 1, 1,
0.3451588, -0.7401369, 1.957738, 1, 1, 1, 1, 1,
0.3476611, 1.162635, 1.447979, 0, 0, 1, 1, 1,
0.3509359, -0.6107465, 2.58209, 1, 0, 0, 1, 1,
0.3534775, -0.3306311, 3.676955, 1, 0, 0, 1, 1,
0.3573624, -0.6549469, 0.0467702, 1, 0, 0, 1, 1,
0.3583345, -1.207738, 3.371693, 1, 0, 0, 1, 1,
0.3589891, 2.251239, -1.126167, 1, 0, 0, 1, 1,
0.3644839, 0.08640771, -0.6723934, 0, 0, 0, 1, 1,
0.3742927, 1.218431, 2.27772, 0, 0, 0, 1, 1,
0.3749743, 0.7176355, -0.04469652, 0, 0, 0, 1, 1,
0.375969, 1.506172, -0.7714327, 0, 0, 0, 1, 1,
0.376507, -0.0283381, 0.4371207, 0, 0, 0, 1, 1,
0.3910374, 0.9452381, 0.1498608, 0, 0, 0, 1, 1,
0.3913896, -0.9787118, 2.720292, 0, 0, 0, 1, 1,
0.3922487, -1.067782, 2.198489, 1, 1, 1, 1, 1,
0.3960852, 0.2884004, 0.5580563, 1, 1, 1, 1, 1,
0.3966449, -0.01660143, 1.696746, 1, 1, 1, 1, 1,
0.3968458, -1.618737, 2.968812, 1, 1, 1, 1, 1,
0.4059247, 1.021424, 3.361155, 1, 1, 1, 1, 1,
0.4076559, 2.112803, 0.7393612, 1, 1, 1, 1, 1,
0.4153173, -0.4219679, 1.762273, 1, 1, 1, 1, 1,
0.4174878, -0.5799492, 3.218105, 1, 1, 1, 1, 1,
0.4197336, 0.3653383, -0.1542576, 1, 1, 1, 1, 1,
0.4234178, 0.9185238, -0.2517752, 1, 1, 1, 1, 1,
0.4282385, -0.4821316, 3.969031, 1, 1, 1, 1, 1,
0.4290265, 2.18055, 1.330639, 1, 1, 1, 1, 1,
0.4306136, -0.3466153, 2.866077, 1, 1, 1, 1, 1,
0.4321406, 0.2526446, 1.328688, 1, 1, 1, 1, 1,
0.4383782, -0.09599931, 2.572597, 1, 1, 1, 1, 1,
0.4385386, 0.5993431, 2.579353, 0, 0, 1, 1, 1,
0.4388443, -1.165586, 1.593102, 1, 0, 0, 1, 1,
0.4422857, -2.56092, 3.774897, 1, 0, 0, 1, 1,
0.4446177, 0.192214, 0.5332531, 1, 0, 0, 1, 1,
0.4538226, 1.492221, 0.6794187, 1, 0, 0, 1, 1,
0.4566501, 2.15503, -0.8631194, 1, 0, 0, 1, 1,
0.4591447, -0.4282666, 0.9402833, 0, 0, 0, 1, 1,
0.4621635, -0.847472, 3.224828, 0, 0, 0, 1, 1,
0.4628914, -0.8772001, 2.167302, 0, 0, 0, 1, 1,
0.463059, 0.1310207, 1.908631, 0, 0, 0, 1, 1,
0.4648702, 1.771162, 1.172993, 0, 0, 0, 1, 1,
0.4671186, -1.029492, 1.331437, 0, 0, 0, 1, 1,
0.4673608, -1.328552, 1.541865, 0, 0, 0, 1, 1,
0.4694267, -0.05305917, 2.066237, 1, 1, 1, 1, 1,
0.4779353, 0.04962747, 0.5640074, 1, 1, 1, 1, 1,
0.4803038, -0.5969813, 3.33464, 1, 1, 1, 1, 1,
0.4807828, -1.420198, 3.629706, 1, 1, 1, 1, 1,
0.4858506, -0.290499, 3.628863, 1, 1, 1, 1, 1,
0.4868152, -0.522503, 1.163843, 1, 1, 1, 1, 1,
0.4946991, -0.3039632, 2.146481, 1, 1, 1, 1, 1,
0.4954576, 0.480896, 0.4427199, 1, 1, 1, 1, 1,
0.4977914, -0.8915766, 2.208546, 1, 1, 1, 1, 1,
0.4992174, 0.5457054, 1.715206, 1, 1, 1, 1, 1,
0.5020398, -0.4070388, 2.894823, 1, 1, 1, 1, 1,
0.5027055, -0.1597921, 3.215826, 1, 1, 1, 1, 1,
0.5070242, -0.1004945, 2.342978, 1, 1, 1, 1, 1,
0.5084171, -0.1901631, 2.258254, 1, 1, 1, 1, 1,
0.5096161, 0.9285725, -0.4648567, 1, 1, 1, 1, 1,
0.5113071, 1.026318, -1.262716, 0, 0, 1, 1, 1,
0.5230212, 0.2819633, -0.9728644, 1, 0, 0, 1, 1,
0.5231057, -0.1340592, 3.825304, 1, 0, 0, 1, 1,
0.5237648, -1.104031, 2.041379, 1, 0, 0, 1, 1,
0.5260401, -0.2227504, 3.091282, 1, 0, 0, 1, 1,
0.5271733, 0.3037228, 2.090939, 1, 0, 0, 1, 1,
0.5278804, -1.330578, 2.725953, 0, 0, 0, 1, 1,
0.5288596, -0.4235887, 1.585109, 0, 0, 0, 1, 1,
0.5301048, 0.8549477, 0.1457617, 0, 0, 0, 1, 1,
0.5376057, 0.01526668, 1.519774, 0, 0, 0, 1, 1,
0.5376948, -1.736032, 2.299892, 0, 0, 0, 1, 1,
0.539475, 0.494853, 1.617461, 0, 0, 0, 1, 1,
0.5405462, 0.1475109, 1.366017, 0, 0, 0, 1, 1,
0.5415394, -1.566673, 2.629848, 1, 1, 1, 1, 1,
0.5454703, -1.224605, 2.269023, 1, 1, 1, 1, 1,
0.551114, -0.04949604, 1.214142, 1, 1, 1, 1, 1,
0.5512083, -0.2980086, 1.962348, 1, 1, 1, 1, 1,
0.5592431, -0.9978718, 4.168556, 1, 1, 1, 1, 1,
0.5595993, 1.165174, -0.7241698, 1, 1, 1, 1, 1,
0.5621238, -0.09298481, 0.0436257, 1, 1, 1, 1, 1,
0.5632485, 0.8588411, 1.081116, 1, 1, 1, 1, 1,
0.5671763, -1.409998, 3.426951, 1, 1, 1, 1, 1,
0.5795377, -0.6613691, 1.831041, 1, 1, 1, 1, 1,
0.5801635, -1.327276, 2.540705, 1, 1, 1, 1, 1,
0.5823784, -1.307772, 3.609377, 1, 1, 1, 1, 1,
0.5832474, 0.0413032, 1.498535, 1, 1, 1, 1, 1,
0.5906501, -0.6490209, 3.590252, 1, 1, 1, 1, 1,
0.5913528, 0.4379809, 0.9363778, 1, 1, 1, 1, 1,
0.5919286, 0.7456974, 0.5136104, 0, 0, 1, 1, 1,
0.5955526, 0.03595201, 1.570596, 1, 0, 0, 1, 1,
0.5961877, -0.6653031, 2.310966, 1, 0, 0, 1, 1,
0.6020292, 0.677528, 1.339645, 1, 0, 0, 1, 1,
0.6029339, 0.2548421, -0.2566844, 1, 0, 0, 1, 1,
0.603391, -0.8923591, 3.022389, 1, 0, 0, 1, 1,
0.6043516, 1.665127, -1.924821, 0, 0, 0, 1, 1,
0.6070975, -1.048103, 2.082686, 0, 0, 0, 1, 1,
0.6071025, 0.4702379, 2.82393, 0, 0, 0, 1, 1,
0.6100826, -0.5699288, 2.029433, 0, 0, 0, 1, 1,
0.6115038, -1.958053, 2.413965, 0, 0, 0, 1, 1,
0.6120645, 1.227518, 1.443673, 0, 0, 0, 1, 1,
0.6185183, -1.7955, 2.543035, 0, 0, 0, 1, 1,
0.6196606, -1.578142, 2.30274, 1, 1, 1, 1, 1,
0.6291501, 0.09930819, 1.610559, 1, 1, 1, 1, 1,
0.6324747, -0.8702546, 3.583025, 1, 1, 1, 1, 1,
0.6348634, -2.267095, 2.46975, 1, 1, 1, 1, 1,
0.6368657, -0.2829947, 2.74717, 1, 1, 1, 1, 1,
0.6388295, 0.5809023, 0.9982129, 1, 1, 1, 1, 1,
0.6467503, 0.4693846, 0.8938501, 1, 1, 1, 1, 1,
0.6482661, -0.4331869, 1.410708, 1, 1, 1, 1, 1,
0.6525729, -0.02955735, 1.745725, 1, 1, 1, 1, 1,
0.6586153, -0.2041448, 0.2080266, 1, 1, 1, 1, 1,
0.6653762, -0.8296235, 4.270181, 1, 1, 1, 1, 1,
0.6705231, 0.2644022, 2.612447, 1, 1, 1, 1, 1,
0.6716708, 1.199617, -0.724542, 1, 1, 1, 1, 1,
0.6723872, 0.7381258, 0.5903418, 1, 1, 1, 1, 1,
0.6724002, -0.7313452, 1.903261, 1, 1, 1, 1, 1,
0.6740253, -2.644887, 4.023912, 0, 0, 1, 1, 1,
0.6753139, 1.413091, -0.007451142, 1, 0, 0, 1, 1,
0.6756549, -0.6064293, 2.106923, 1, 0, 0, 1, 1,
0.6784577, 0.3752028, 1.627446, 1, 0, 0, 1, 1,
0.6806442, 2.07176, 1.053663, 1, 0, 0, 1, 1,
0.6812632, 0.03548997, 1.752768, 1, 0, 0, 1, 1,
0.6814937, 0.1263978, 1.468892, 0, 0, 0, 1, 1,
0.6822065, 0.9006652, 0.7225759, 0, 0, 0, 1, 1,
0.6866378, 0.8021916, 0.6376666, 0, 0, 0, 1, 1,
0.6912692, 0.197062, 1.794389, 0, 0, 0, 1, 1,
0.6913003, 0.3372606, 2.918558, 0, 0, 0, 1, 1,
0.6932327, -0.8769983, 3.574369, 0, 0, 0, 1, 1,
0.6946965, 0.9680464, -0.1930349, 0, 0, 0, 1, 1,
0.6972355, 0.8056428, -0.4512799, 1, 1, 1, 1, 1,
0.6989606, -0.06334329, 1.163201, 1, 1, 1, 1, 1,
0.7003818, 0.4564216, 1.148446, 1, 1, 1, 1, 1,
0.7023205, 0.8635617, -1.341657, 1, 1, 1, 1, 1,
0.7044778, 0.634302, -0.7474099, 1, 1, 1, 1, 1,
0.7055655, 0.07561449, 3.028998, 1, 1, 1, 1, 1,
0.7077608, -0.5629858, 1.864606, 1, 1, 1, 1, 1,
0.7110074, -0.7624005, 3.337503, 1, 1, 1, 1, 1,
0.7206149, 1.706758, 0.779671, 1, 1, 1, 1, 1,
0.7260057, 0.2235586, 1.94457, 1, 1, 1, 1, 1,
0.7331685, 1.225776, 0.4054544, 1, 1, 1, 1, 1,
0.739656, 0.9658825, 0.4689803, 1, 1, 1, 1, 1,
0.7463209, 0.5773348, -0.06027063, 1, 1, 1, 1, 1,
0.7619585, -1.075749, 2.019666, 1, 1, 1, 1, 1,
0.7629117, -0.3738762, 1.267079, 1, 1, 1, 1, 1,
0.7656148, 0.5872219, 0.2288333, 0, 0, 1, 1, 1,
0.7691392, 0.8468558, 0.4841613, 1, 0, 0, 1, 1,
0.7774129, 0.1243479, 0.1438757, 1, 0, 0, 1, 1,
0.7789527, 0.4138882, 2.030433, 1, 0, 0, 1, 1,
0.7802678, -0.2905357, 2.173077, 1, 0, 0, 1, 1,
0.7805652, -1.058459, 3.172167, 1, 0, 0, 1, 1,
0.7816982, -2.070507, 2.881164, 0, 0, 0, 1, 1,
0.7903398, -1.155828, 2.443336, 0, 0, 0, 1, 1,
0.7943865, 0.2386554, 1.381979, 0, 0, 0, 1, 1,
0.7969187, 1.442527, 0.5132283, 0, 0, 0, 1, 1,
0.7976574, 0.8091404, -0.3777389, 0, 0, 0, 1, 1,
0.8047234, -1.953923, 3.416069, 0, 0, 0, 1, 1,
0.8069597, -0.1740301, 2.884154, 0, 0, 0, 1, 1,
0.808252, 0.5883381, 2.702457, 1, 1, 1, 1, 1,
0.8109885, -0.246137, 1.459796, 1, 1, 1, 1, 1,
0.8203643, 1.008298, 0.7209239, 1, 1, 1, 1, 1,
0.8258267, -1.034733, 2.158941, 1, 1, 1, 1, 1,
0.8304364, 0.9540529, -1.383042, 1, 1, 1, 1, 1,
0.832837, -0.6090823, 2.485501, 1, 1, 1, 1, 1,
0.8399271, -0.6263931, 3.050669, 1, 1, 1, 1, 1,
0.8604249, 2.266709, 0.9779408, 1, 1, 1, 1, 1,
0.8636541, -0.3329264, 0.980397, 1, 1, 1, 1, 1,
0.8695785, 1.437162, 0.8566094, 1, 1, 1, 1, 1,
0.8718864, -0.08619929, 2.17671, 1, 1, 1, 1, 1,
0.8740176, 0.9152087, 0.3160963, 1, 1, 1, 1, 1,
0.8758237, 0.5319225, 0.995352, 1, 1, 1, 1, 1,
0.8760889, -0.5600005, 2.877111, 1, 1, 1, 1, 1,
0.8775793, -1.193293, 1.926639, 1, 1, 1, 1, 1,
0.879449, 0.7829959, 1.494137, 0, 0, 1, 1, 1,
0.883893, 0.3723205, 0.344537, 1, 0, 0, 1, 1,
0.8916763, 0.3781838, 0.6381686, 1, 0, 0, 1, 1,
0.8947043, 0.370795, 1.973451, 1, 0, 0, 1, 1,
0.8980058, 1.027371, 0.6316565, 1, 0, 0, 1, 1,
0.9069341, 0.6505519, 1.159244, 1, 0, 0, 1, 1,
0.9128525, -0.4926019, 1.076443, 0, 0, 0, 1, 1,
0.9138551, 0.809523, 0.7033339, 0, 0, 0, 1, 1,
0.9144613, -0.1830782, 2.792669, 0, 0, 0, 1, 1,
0.9175375, -0.2510521, 0.9036529, 0, 0, 0, 1, 1,
0.9183475, -0.7070724, 0.7807348, 0, 0, 0, 1, 1,
0.9283965, 1.23124, 1.164168, 0, 0, 0, 1, 1,
0.9339157, 0.74158, 1.615409, 0, 0, 0, 1, 1,
0.9339964, -1.44355, 3.44765, 1, 1, 1, 1, 1,
0.9364549, -0.9456478, 2.422669, 1, 1, 1, 1, 1,
0.9367699, 0.3713916, 2.826538, 1, 1, 1, 1, 1,
0.9410239, 1.409135, 0.0006354767, 1, 1, 1, 1, 1,
0.9426619, 1.029215, 0.8794312, 1, 1, 1, 1, 1,
0.9431566, -0.3128239, 2.094648, 1, 1, 1, 1, 1,
0.943414, 1.316581, 0.801123, 1, 1, 1, 1, 1,
0.948536, -0.649079, 0.2329338, 1, 1, 1, 1, 1,
0.9556136, 0.805822, -0.2948929, 1, 1, 1, 1, 1,
0.9637589, 1.421383, -0.1838218, 1, 1, 1, 1, 1,
0.9666588, -0.2548626, 0.4417582, 1, 1, 1, 1, 1,
0.9811414, -0.9333647, 3.692679, 1, 1, 1, 1, 1,
0.9819379, -0.1172277, 2.70329, 1, 1, 1, 1, 1,
0.9877049, 0.3652567, 0.7342657, 1, 1, 1, 1, 1,
0.989466, -0.2744412, 2.88865, 1, 1, 1, 1, 1,
0.9920534, -0.04833376, 1.824554, 0, 0, 1, 1, 1,
0.9928373, -0.4271045, 1.617975, 1, 0, 0, 1, 1,
0.9983199, -0.7214499, 1.580392, 1, 0, 0, 1, 1,
1.001228, -1.050443, 1.716866, 1, 0, 0, 1, 1,
1.004304, -0.7915636, 3.810522, 1, 0, 0, 1, 1,
1.005744, -1.425102, 1.277671, 1, 0, 0, 1, 1,
1.012555, 2.112225, 1.33459, 0, 0, 0, 1, 1,
1.013818, -0.4758843, 1.398136, 0, 0, 0, 1, 1,
1.016018, 0.924242, 1.595891, 0, 0, 0, 1, 1,
1.048578, -0.8158173, 3.482423, 0, 0, 0, 1, 1,
1.04861, -0.5870702, 2.238154, 0, 0, 0, 1, 1,
1.049781, -0.06437617, -0.05796609, 0, 0, 0, 1, 1,
1.052305, -1.842274, 0.8293994, 0, 0, 0, 1, 1,
1.052306, -1.18311, 2.745737, 1, 1, 1, 1, 1,
1.057118, 0.9498993, 0.2063403, 1, 1, 1, 1, 1,
1.060379, 0.239636, 1.70691, 1, 1, 1, 1, 1,
1.064803, 0.477565, 0.3970816, 1, 1, 1, 1, 1,
1.065469, -0.7496824, 1.220248, 1, 1, 1, 1, 1,
1.070383, -0.7275273, 3.420214, 1, 1, 1, 1, 1,
1.071915, -0.9837275, 2.069974, 1, 1, 1, 1, 1,
1.078042, -1.023693, 2.315563, 1, 1, 1, 1, 1,
1.0784, 0.3201678, 2.106708, 1, 1, 1, 1, 1,
1.086246, -1.8938, 1.692197, 1, 1, 1, 1, 1,
1.100407, 0.5746632, -0.5621492, 1, 1, 1, 1, 1,
1.1123, -0.5141984, 2.357394, 1, 1, 1, 1, 1,
1.117344, -0.2076056, 2.145302, 1, 1, 1, 1, 1,
1.11897, 0.5133135, 1.491802, 1, 1, 1, 1, 1,
1.122452, -0.9816832, 1.600539, 1, 1, 1, 1, 1,
1.125312, 0.4439388, 0.7501178, 0, 0, 1, 1, 1,
1.131019, 1.05525, -0.3305253, 1, 0, 0, 1, 1,
1.138603, -0.6226612, -0.2235722, 1, 0, 0, 1, 1,
1.138993, -1.115325, 1.557343, 1, 0, 0, 1, 1,
1.151802, -0.6697162, 3.42362, 1, 0, 0, 1, 1,
1.153282, -0.06214612, 0.9279123, 1, 0, 0, 1, 1,
1.157053, 0.117968, 0.4942147, 0, 0, 0, 1, 1,
1.163739, -0.3594935, 0.8713495, 0, 0, 0, 1, 1,
1.183444, 1.123943, 0.7014544, 0, 0, 0, 1, 1,
1.184384, 1.083486, 0.8302935, 0, 0, 0, 1, 1,
1.185129, -1.096221, 1.133303, 0, 0, 0, 1, 1,
1.185213, -1.645662, 2.231879, 0, 0, 0, 1, 1,
1.18779, 1.680013, 0.2938078, 0, 0, 0, 1, 1,
1.188635, 0.1463262, 1.838446, 1, 1, 1, 1, 1,
1.195813, 2.79671, -0.385225, 1, 1, 1, 1, 1,
1.196914, -0.1865431, 1.360051, 1, 1, 1, 1, 1,
1.196934, 0.9026541, 2.237193, 1, 1, 1, 1, 1,
1.200303, 0.4551387, 0.2295541, 1, 1, 1, 1, 1,
1.201576, -1.013012, 2.446417, 1, 1, 1, 1, 1,
1.203805, -0.7493545, 2.101205, 1, 1, 1, 1, 1,
1.219864, -0.7175264, 1.068505, 1, 1, 1, 1, 1,
1.221892, 0.4400352, 1.56107, 1, 1, 1, 1, 1,
1.223922, 0.7192602, 2.990856, 1, 1, 1, 1, 1,
1.238254, -1.083062, 0.2884068, 1, 1, 1, 1, 1,
1.240483, -0.980547, 2.982784, 1, 1, 1, 1, 1,
1.243074, -1.99422, 3.289858, 1, 1, 1, 1, 1,
1.249483, 0.2796821, 2.497467, 1, 1, 1, 1, 1,
1.250878, -1.230206, 2.793826, 1, 1, 1, 1, 1,
1.254507, -0.07660781, -0.1190272, 0, 0, 1, 1, 1,
1.275029, -0.5709021, 0.8562477, 1, 0, 0, 1, 1,
1.27714, -0.9633505, 1.718843, 1, 0, 0, 1, 1,
1.281267, -0.6902171, 1.938756, 1, 0, 0, 1, 1,
1.284194, 0.3854956, 2.020851, 1, 0, 0, 1, 1,
1.309762, 0.2687892, -0.2599742, 1, 0, 0, 1, 1,
1.325156, -1.595006, 2.663575, 0, 0, 0, 1, 1,
1.326838, 1.061604, 0.02303116, 0, 0, 0, 1, 1,
1.350226, -0.1942277, 0.5638512, 0, 0, 0, 1, 1,
1.35508, 0.5508583, 2.899606, 0, 0, 0, 1, 1,
1.363273, 0.1073551, 2.754823, 0, 0, 0, 1, 1,
1.370041, 0.7170404, -0.8763492, 0, 0, 0, 1, 1,
1.370744, 0.2231219, 2.764194, 0, 0, 0, 1, 1,
1.375939, 0.6484116, 0.3196377, 1, 1, 1, 1, 1,
1.376986, 0.6938467, 0.06219136, 1, 1, 1, 1, 1,
1.383164, -0.2494238, 3.188138, 1, 1, 1, 1, 1,
1.392154, -1.354261, 2.726176, 1, 1, 1, 1, 1,
1.418607, 0.4180637, 1.653082, 1, 1, 1, 1, 1,
1.418833, -1.942972, 1.400674, 1, 1, 1, 1, 1,
1.431303, 0.2331246, 1.934853, 1, 1, 1, 1, 1,
1.442572, -1.640506, 2.392651, 1, 1, 1, 1, 1,
1.452003, 1.09663, 0.9431465, 1, 1, 1, 1, 1,
1.454377, 0.2912362, 1.271714, 1, 1, 1, 1, 1,
1.467827, 0.1892649, 1.587785, 1, 1, 1, 1, 1,
1.474357, 1.694371, 1.446837, 1, 1, 1, 1, 1,
1.486394, 0.2013717, 0.6731085, 1, 1, 1, 1, 1,
1.493878, 0.5435321, 0.8814073, 1, 1, 1, 1, 1,
1.494388, 1.053423, 2.693033, 1, 1, 1, 1, 1,
1.501826, -1.632838, 2.583668, 0, 0, 1, 1, 1,
1.522689, -1.354809, 1.835239, 1, 0, 0, 1, 1,
1.52755, -0.6724082, 2.099947, 1, 0, 0, 1, 1,
1.53203, -1.137198, 2.680795, 1, 0, 0, 1, 1,
1.538238, -0.4050734, 2.34354, 1, 0, 0, 1, 1,
1.547766, 0.4087366, 0.9030544, 1, 0, 0, 1, 1,
1.55818, 1.12642, 2.75331, 0, 0, 0, 1, 1,
1.560031, 1.728423, 1.281843, 0, 0, 0, 1, 1,
1.569502, 0.09121851, 1.505319, 0, 0, 0, 1, 1,
1.588522, -1.467507, 0.7977212, 0, 0, 0, 1, 1,
1.617288, -1.605442, 2.389384, 0, 0, 0, 1, 1,
1.617387, -1.40559, 1.293344, 0, 0, 0, 1, 1,
1.630453, 0.1968058, 0.093251, 0, 0, 0, 1, 1,
1.632257, 0.3077812, 3.982351, 1, 1, 1, 1, 1,
1.635388, 0.938956, 0.3642679, 1, 1, 1, 1, 1,
1.648967, 0.2215512, 1.417104, 1, 1, 1, 1, 1,
1.649495, 0.1300783, 0.6860366, 1, 1, 1, 1, 1,
1.661278, -2.264881, 2.389263, 1, 1, 1, 1, 1,
1.682835, 0.3018122, 2.882992, 1, 1, 1, 1, 1,
1.713523, -0.4239387, 0.418372, 1, 1, 1, 1, 1,
1.714007, 0.2244409, 1.038743, 1, 1, 1, 1, 1,
1.720468, -0.7566674, 2.358027, 1, 1, 1, 1, 1,
1.722117, -0.804766, 2.418352, 1, 1, 1, 1, 1,
1.731704, 1.239723, 0.1595817, 1, 1, 1, 1, 1,
1.744191, 0.1668565, 2.121617, 1, 1, 1, 1, 1,
1.746125, 0.02250458, 1.69796, 1, 1, 1, 1, 1,
1.754494, 0.379699, 2.010206, 1, 1, 1, 1, 1,
1.757305, -1.268324, 2.295244, 1, 1, 1, 1, 1,
1.778659, -1.158106, 1.425279, 0, 0, 1, 1, 1,
1.780601, -1.098981, 1.988655, 1, 0, 0, 1, 1,
1.782969, -0.1884947, 2.037029, 1, 0, 0, 1, 1,
1.795824, -1.369203, 2.48995, 1, 0, 0, 1, 1,
1.79891, -0.1469849, 2.452501, 1, 0, 0, 1, 1,
1.80758, 0.4042267, 3.300688, 1, 0, 0, 1, 1,
1.845436, 0.5739123, 0.1820142, 0, 0, 0, 1, 1,
1.879232, -0.1074344, 0.899955, 0, 0, 0, 1, 1,
1.898196, -0.4153125, 2.069242, 0, 0, 0, 1, 1,
1.925489, -0.8403017, 3.291638, 0, 0, 0, 1, 1,
1.925697, 1.859279, 1.118837, 0, 0, 0, 1, 1,
1.939133, 0.1860938, 1.093412, 0, 0, 0, 1, 1,
1.950973, -1.140981, 3.52629, 0, 0, 0, 1, 1,
1.956743, -1.804839, 2.658853, 1, 1, 1, 1, 1,
1.966063, 0.5139577, 2.378138, 1, 1, 1, 1, 1,
1.969108, 1.131943, -0.7532149, 1, 1, 1, 1, 1,
1.978875, -1.38358, 2.932947, 1, 1, 1, 1, 1,
1.985454, -1.51767, 2.465762, 1, 1, 1, 1, 1,
2.01857, 0.3324348, 1.326593, 1, 1, 1, 1, 1,
2.042473, 1.774821, 0.06962018, 1, 1, 1, 1, 1,
2.064298, 1.967692, 0.00328655, 1, 1, 1, 1, 1,
2.103896, -0.1381737, 2.117241, 1, 1, 1, 1, 1,
2.131772, 1.982044, 1.815069, 1, 1, 1, 1, 1,
2.134722, 1.04799, -0.4552534, 1, 1, 1, 1, 1,
2.139084, -2.297247, 1.063757, 1, 1, 1, 1, 1,
2.188815, -0.48941, 2.300308, 1, 1, 1, 1, 1,
2.203459, -0.7023641, 2.32283, 1, 1, 1, 1, 1,
2.20979, 1.259088, 2.977025, 1, 1, 1, 1, 1,
2.211013, -1.936638, 0.8635584, 0, 0, 1, 1, 1,
2.251212, -0.01081783, 1.254221, 1, 0, 0, 1, 1,
2.267826, 0.6522693, 0.8094054, 1, 0, 0, 1, 1,
2.285163, -1.199172, 1.328561, 1, 0, 0, 1, 1,
2.286814, -0.5111677, 1.023935, 1, 0, 0, 1, 1,
2.287772, 0.02550875, 0.7060972, 1, 0, 0, 1, 1,
2.381731, 0.005557729, 2.533833, 0, 0, 0, 1, 1,
2.38537, 0.02054026, 1.748284, 0, 0, 0, 1, 1,
2.388091, 1.808804, 1.066158, 0, 0, 0, 1, 1,
2.461318, -0.5574035, 2.221026, 0, 0, 0, 1, 1,
2.465503, 0.1787641, 2.203418, 0, 0, 0, 1, 1,
2.483434, -1.738017, 3.865295, 0, 0, 0, 1, 1,
2.486704, 1.125974, 1.012669, 0, 0, 0, 1, 1,
2.488668, 0.853179, 1.022173, 1, 1, 1, 1, 1,
2.498712, -0.1201992, 0.09547564, 1, 1, 1, 1, 1,
2.566849, -1.921539, 2.410554, 1, 1, 1, 1, 1,
2.576182, 0.6862595, 1.164299, 1, 1, 1, 1, 1,
2.771341, 1.076318, 0.0847105, 1, 1, 1, 1, 1,
2.842675, -1.582055, 2.945708, 1, 1, 1, 1, 1,
3.052322, 0.8364808, 0.7581242, 1, 1, 1, 1, 1
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
var radius = 9.286475;
var distance = 32.61835;
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
mvMatrix.translate( -0.03733528, -0.2651261, -0.4169869 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.61835);
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
