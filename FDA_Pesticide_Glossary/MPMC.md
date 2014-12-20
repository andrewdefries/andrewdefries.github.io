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
-2.684155, -1.312954, -1.884234, 1, 0, 0, 1,
-2.587862, -0.9837527, -1.770684, 1, 0.007843138, 0, 1,
-2.582392, -1.265826, -2.455694, 1, 0.01176471, 0, 1,
-2.529316, -0.4539035, -0.5803874, 1, 0.01960784, 0, 1,
-2.498674, 0.2423985, -2.286893, 1, 0.02352941, 0, 1,
-2.44181, -2.15709, -2.74207, 1, 0.03137255, 0, 1,
-2.386663, -0.9633776, -3.241603, 1, 0.03529412, 0, 1,
-2.378028, -0.6516476, -1.700789, 1, 0.04313726, 0, 1,
-2.352785, -0.03735981, -1.063932, 1, 0.04705882, 0, 1,
-2.346894, 2.137032, -0.799728, 1, 0.05490196, 0, 1,
-2.344226, -0.355687, -2.739179, 1, 0.05882353, 0, 1,
-2.2789, 0.9854961, -0.7160481, 1, 0.06666667, 0, 1,
-2.277455, -0.1467649, -2.387763, 1, 0.07058824, 0, 1,
-2.226303, -1.47644, -0.3060248, 1, 0.07843138, 0, 1,
-2.17759, 3.351845, -0.6142364, 1, 0.08235294, 0, 1,
-2.163096, 1.295379, -1.874624, 1, 0.09019608, 0, 1,
-2.157684, 0.7037392, -1.016957, 1, 0.09411765, 0, 1,
-2.140132, 0.8348539, 0.1829417, 1, 0.1019608, 0, 1,
-2.117188, -1.099698, -4.95743, 1, 0.1098039, 0, 1,
-2.092981, -1.10011, -2.039758, 1, 0.1137255, 0, 1,
-2.05036, 0.2488565, -1.998201, 1, 0.1215686, 0, 1,
-2.048568, 0.3502258, -0.9236594, 1, 0.1254902, 0, 1,
-2.000062, -0.2173223, -0.2962528, 1, 0.1333333, 0, 1,
-1.948224, 0.5412284, -1.225608, 1, 0.1372549, 0, 1,
-1.928685, 1.155458, -0.5266477, 1, 0.145098, 0, 1,
-1.917419, 0.2582342, 0.7660484, 1, 0.1490196, 0, 1,
-1.882847, -0.1777535, -2.177342, 1, 0.1568628, 0, 1,
-1.878318, -0.5444644, -1.66626, 1, 0.1607843, 0, 1,
-1.875384, -0.8044805, -2.552322, 1, 0.1686275, 0, 1,
-1.864317, 0.1817259, -3.388141, 1, 0.172549, 0, 1,
-1.842427, 1.363141, -1.410383, 1, 0.1803922, 0, 1,
-1.825959, 0.8610132, -2.502638, 1, 0.1843137, 0, 1,
-1.790193, -0.1392873, 1.750633, 1, 0.1921569, 0, 1,
-1.774729, 0.2157962, -1.802766, 1, 0.1960784, 0, 1,
-1.761788, 0.1485446, -2.325158, 1, 0.2039216, 0, 1,
-1.737375, 0.4846435, -1.974418, 1, 0.2117647, 0, 1,
-1.732609, -1.420306, -1.76665, 1, 0.2156863, 0, 1,
-1.730969, 0.4762867, -1.104753, 1, 0.2235294, 0, 1,
-1.725816, 0.8348624, -1.656263, 1, 0.227451, 0, 1,
-1.714695, 1.553674, -0.1195019, 1, 0.2352941, 0, 1,
-1.712874, -0.7023211, -2.718254, 1, 0.2392157, 0, 1,
-1.704915, 0.5452937, -1.061658, 1, 0.2470588, 0, 1,
-1.703483, -0.4195636, -2.145299, 1, 0.2509804, 0, 1,
-1.703173, -0.1461099, -2.048649, 1, 0.2588235, 0, 1,
-1.686138, 1.708216, -0.4500123, 1, 0.2627451, 0, 1,
-1.668414, 0.6836333, -1.180387, 1, 0.2705882, 0, 1,
-1.655323, 0.1644878, -2.507727, 1, 0.2745098, 0, 1,
-1.654004, -0.4773724, -2.462672, 1, 0.282353, 0, 1,
-1.645312, -1.098107, -2.243979, 1, 0.2862745, 0, 1,
-1.644066, 0.4624909, -0.6014503, 1, 0.2941177, 0, 1,
-1.64153, 0.1160273, -2.255872, 1, 0.3019608, 0, 1,
-1.600284, -0.7502599, -1.523973, 1, 0.3058824, 0, 1,
-1.586579, -0.2022613, -1.989675, 1, 0.3137255, 0, 1,
-1.57575, -0.4516719, -0.8913276, 1, 0.3176471, 0, 1,
-1.560633, 1.446994, -0.3686816, 1, 0.3254902, 0, 1,
-1.553354, -1.181096, -1.703124, 1, 0.3294118, 0, 1,
-1.540335, -1.468667, -2.206187, 1, 0.3372549, 0, 1,
-1.536382, -0.2832124, -1.40793, 1, 0.3411765, 0, 1,
-1.53471, -1.536483, -2.359474, 1, 0.3490196, 0, 1,
-1.529603, -0.5397793, -2.863855, 1, 0.3529412, 0, 1,
-1.517861, 0.6991711, -0.0460282, 1, 0.3607843, 0, 1,
-1.512709, 0.2579216, -0.9476847, 1, 0.3647059, 0, 1,
-1.497208, 0.1324782, -2.116601, 1, 0.372549, 0, 1,
-1.493131, -1.455261, -2.632869, 1, 0.3764706, 0, 1,
-1.488013, 0.7286683, 0.09926932, 1, 0.3843137, 0, 1,
-1.486468, -0.9718493, -2.534223, 1, 0.3882353, 0, 1,
-1.48628, 1.121829, -0.6471666, 1, 0.3960784, 0, 1,
-1.481175, -0.7339116, -0.9741746, 1, 0.4039216, 0, 1,
-1.461436, 0.3060496, 0.4807387, 1, 0.4078431, 0, 1,
-1.449073, -0.5705031, -2.222486, 1, 0.4156863, 0, 1,
-1.448095, -0.8061843, -0.3319185, 1, 0.4196078, 0, 1,
-1.446818, -0.3981694, -0.8079714, 1, 0.427451, 0, 1,
-1.437645, -0.9861058, -4.124324, 1, 0.4313726, 0, 1,
-1.435592, -1.222353, -2.628495, 1, 0.4392157, 0, 1,
-1.431907, 0.09337132, -0.8974636, 1, 0.4431373, 0, 1,
-1.422059, 1.595933, 0.08069465, 1, 0.4509804, 0, 1,
-1.421944, 0.08805528, -1.819456, 1, 0.454902, 0, 1,
-1.387723, -0.3522997, -0.9334384, 1, 0.4627451, 0, 1,
-1.381315, 0.9449463, 0.2759405, 1, 0.4666667, 0, 1,
-1.379536, 0.1367109, -1.766544, 1, 0.4745098, 0, 1,
-1.378032, -0.83114, -2.110693, 1, 0.4784314, 0, 1,
-1.374493, 1.070913, -1.73396, 1, 0.4862745, 0, 1,
-1.373167, -1.617199, -1.307968, 1, 0.4901961, 0, 1,
-1.347652, -0.6356879, -2.304991, 1, 0.4980392, 0, 1,
-1.338243, -0.0740864, -1.224022, 1, 0.5058824, 0, 1,
-1.336126, -0.7596346, -2.619749, 1, 0.509804, 0, 1,
-1.330967, -1.219378, -2.485257, 1, 0.5176471, 0, 1,
-1.326318, 0.02720411, -1.54785, 1, 0.5215687, 0, 1,
-1.324381, -1.124496, -1.142853, 1, 0.5294118, 0, 1,
-1.312186, 0.09512809, -0.517297, 1, 0.5333334, 0, 1,
-1.310248, -1.515591, -0.260427, 1, 0.5411765, 0, 1,
-1.303493, -0.4648188, -0.4770492, 1, 0.5450981, 0, 1,
-1.302536, -0.4356764, -1.802975, 1, 0.5529412, 0, 1,
-1.301341, 0.4881976, -0.3569648, 1, 0.5568628, 0, 1,
-1.300608, 1.015985, -1.089323, 1, 0.5647059, 0, 1,
-1.298414, -1.058641, -1.75761, 1, 0.5686275, 0, 1,
-1.292732, 2.364994, -0.3800678, 1, 0.5764706, 0, 1,
-1.282221, -0.8060602, 0.3558234, 1, 0.5803922, 0, 1,
-1.271461, 0.7560674, 0.09727738, 1, 0.5882353, 0, 1,
-1.266635, 0.676326, -2.236684, 1, 0.5921569, 0, 1,
-1.262664, -0.2849326, -1.212199, 1, 0.6, 0, 1,
-1.250392, 0.2561208, -1.554489, 1, 0.6078432, 0, 1,
-1.239425, 0.5905434, -2.760153, 1, 0.6117647, 0, 1,
-1.234772, 1.017534, -1.015852, 1, 0.6196079, 0, 1,
-1.230592, 2.046479, -1.492126, 1, 0.6235294, 0, 1,
-1.219547, -1.27309, -0.4280205, 1, 0.6313726, 0, 1,
-1.21534, -0.4556254, -0.2103225, 1, 0.6352941, 0, 1,
-1.207204, -0.4286319, -1.654514, 1, 0.6431373, 0, 1,
-1.205115, -0.2062374, -0.9179752, 1, 0.6470588, 0, 1,
-1.20461, 0.4364584, -2.106578, 1, 0.654902, 0, 1,
-1.201405, 0.601343, -1.071007, 1, 0.6588235, 0, 1,
-1.19628, 1.012688, -0.2792508, 1, 0.6666667, 0, 1,
-1.19058, 1.347639, -3.2397, 1, 0.6705883, 0, 1,
-1.187443, -0.5522301, -3.051395, 1, 0.6784314, 0, 1,
-1.187412, 1.009781, -1.89155, 1, 0.682353, 0, 1,
-1.174213, -0.6071411, -2.877621, 1, 0.6901961, 0, 1,
-1.168078, -1.199625, -1.897912, 1, 0.6941177, 0, 1,
-1.167704, -0.3067142, -1.767849, 1, 0.7019608, 0, 1,
-1.162815, -0.4265419, -2.311315, 1, 0.7098039, 0, 1,
-1.162673, -0.4267617, -2.22368, 1, 0.7137255, 0, 1,
-1.161918, -0.1291663, -2.801761, 1, 0.7215686, 0, 1,
-1.160097, -0.1401137, -0.4847722, 1, 0.7254902, 0, 1,
-1.154806, -2.185974, -2.251215, 1, 0.7333333, 0, 1,
-1.139223, 1.447603, 0.4497487, 1, 0.7372549, 0, 1,
-1.12799, -0.12331, -2.953417, 1, 0.7450981, 0, 1,
-1.127529, -0.1498546, -0.7248424, 1, 0.7490196, 0, 1,
-1.125744, -1.109316, -3.368201, 1, 0.7568628, 0, 1,
-1.122373, 0.4423831, -0.5405342, 1, 0.7607843, 0, 1,
-1.121175, -0.8922052, -1.833988, 1, 0.7686275, 0, 1,
-1.120563, -1.779189, -1.962223, 1, 0.772549, 0, 1,
-1.1203, -1.106162, -0.6795555, 1, 0.7803922, 0, 1,
-1.119096, 1.431757, -1.906092, 1, 0.7843137, 0, 1,
-1.086967, -0.8655599, -0.2801667, 1, 0.7921569, 0, 1,
-1.085908, 0.2690069, -2.42966, 1, 0.7960784, 0, 1,
-1.085183, 0.02666919, -1.110922, 1, 0.8039216, 0, 1,
-1.08236, -0.2021622, -2.629192, 1, 0.8117647, 0, 1,
-1.076907, 0.778731, -1.597191, 1, 0.8156863, 0, 1,
-1.07193, 2.4422, -0.8740904, 1, 0.8235294, 0, 1,
-1.071696, -0.6881482, -0.8685961, 1, 0.827451, 0, 1,
-1.068762, -0.3536679, -3.652933, 1, 0.8352941, 0, 1,
-1.068659, -0.3191851, -2.186787, 1, 0.8392157, 0, 1,
-1.066817, -0.1505843, -2.041631, 1, 0.8470588, 0, 1,
-1.064909, -0.3047935, -0.7793798, 1, 0.8509804, 0, 1,
-1.064225, 0.962103, 0.6056201, 1, 0.8588235, 0, 1,
-1.062124, 0.09932104, -2.120786, 1, 0.8627451, 0, 1,
-1.054475, -0.5548742, -0.5365877, 1, 0.8705882, 0, 1,
-1.050773, -1.320883, -3.204369, 1, 0.8745098, 0, 1,
-1.050005, -0.3122828, -0.4156913, 1, 0.8823529, 0, 1,
-1.049609, -0.3258544, -1.998214, 1, 0.8862745, 0, 1,
-1.045638, 0.791946, -0.02273321, 1, 0.8941177, 0, 1,
-1.044446, 0.5394784, -0.2447782, 1, 0.8980392, 0, 1,
-1.041171, 1.504592, -0.940266, 1, 0.9058824, 0, 1,
-1.023141, 0.1651772, -0.556506, 1, 0.9137255, 0, 1,
-1.02206, -0.1834998, -1.132208, 1, 0.9176471, 0, 1,
-1.017764, -0.6682447, -2.598691, 1, 0.9254902, 0, 1,
-1.013546, 0.358357, 0.8941292, 1, 0.9294118, 0, 1,
-1.007995, -0.2549217, -0.6396049, 1, 0.9372549, 0, 1,
-0.993149, -1.452642, -4.119488, 1, 0.9411765, 0, 1,
-0.9919038, -0.06685243, -1.036863, 1, 0.9490196, 0, 1,
-0.9916767, 1.97944, -0.9063472, 1, 0.9529412, 0, 1,
-0.9908139, 0.3962019, 0.09203184, 1, 0.9607843, 0, 1,
-0.9892658, -0.1389485, -2.664455, 1, 0.9647059, 0, 1,
-0.9889596, 0.6743215, 0.3865507, 1, 0.972549, 0, 1,
-0.9884967, 0.427081, -1.652993, 1, 0.9764706, 0, 1,
-0.9807228, -0.6260103, -1.523939, 1, 0.9843137, 0, 1,
-0.9758623, 1.066191, -1.082811, 1, 0.9882353, 0, 1,
-0.9749374, -0.6804499, -2.051768, 1, 0.9960784, 0, 1,
-0.9730875, -0.4320047, -2.78082, 0.9960784, 1, 0, 1,
-0.9697, 1.387841, -0.6033256, 0.9921569, 1, 0, 1,
-0.9679852, -0.1513152, -1.592132, 0.9843137, 1, 0, 1,
-0.9674857, -0.7805529, -2.721226, 0.9803922, 1, 0, 1,
-0.9571874, 1.295174, -0.2210018, 0.972549, 1, 0, 1,
-0.9556467, 0.5689989, -1.831198, 0.9686275, 1, 0, 1,
-0.9518203, -0.5441357, -1.942661, 0.9607843, 1, 0, 1,
-0.9454505, -0.5922185, -3.862781, 0.9568627, 1, 0, 1,
-0.9436867, -0.1031911, -0.681859, 0.9490196, 1, 0, 1,
-0.9436378, 1.716867, -0.2600909, 0.945098, 1, 0, 1,
-0.9413387, -0.1161839, -2.945896, 0.9372549, 1, 0, 1,
-0.9400468, 1.573934, -1.168051, 0.9333333, 1, 0, 1,
-0.9367728, 1.497735, -0.007444167, 0.9254902, 1, 0, 1,
-0.9365398, 1.744326, -1.585716, 0.9215686, 1, 0, 1,
-0.9278448, 0.1326758, -1.867335, 0.9137255, 1, 0, 1,
-0.9276152, 1.920491, 0.7012647, 0.9098039, 1, 0, 1,
-0.9264287, 0.9016679, -0.5948086, 0.9019608, 1, 0, 1,
-0.920253, 0.6268752, -0.7598348, 0.8941177, 1, 0, 1,
-0.9188494, -1.60902, -3.668917, 0.8901961, 1, 0, 1,
-0.9105717, -0.06460591, -0.6416884, 0.8823529, 1, 0, 1,
-0.9100534, 0.3074999, -3.856225, 0.8784314, 1, 0, 1,
-0.905808, 0.2566092, 0.5621089, 0.8705882, 1, 0, 1,
-0.9045165, -0.8469769, -1.162943, 0.8666667, 1, 0, 1,
-0.9038754, 1.83913, -1.342247, 0.8588235, 1, 0, 1,
-0.8957661, 0.5828991, -1.47584, 0.854902, 1, 0, 1,
-0.8950705, 0.414771, -2.299423, 0.8470588, 1, 0, 1,
-0.8912331, 0.2825955, -1.2667, 0.8431373, 1, 0, 1,
-0.8845683, -0.4419272, -1.564716, 0.8352941, 1, 0, 1,
-0.8801616, 0.1809635, -0.6313368, 0.8313726, 1, 0, 1,
-0.8797689, -0.4389089, -2.744304, 0.8235294, 1, 0, 1,
-0.8793532, -0.5306118, -1.297502, 0.8196079, 1, 0, 1,
-0.8739167, -0.8744117, -2.295923, 0.8117647, 1, 0, 1,
-0.8719117, -0.09455525, -1.947881, 0.8078431, 1, 0, 1,
-0.8687082, -0.4243626, -1.620283, 0.8, 1, 0, 1,
-0.8614994, 1.062137, 0.09324188, 0.7921569, 1, 0, 1,
-0.8594481, 2.756763, 0.4970421, 0.7882353, 1, 0, 1,
-0.8555788, 0.6087574, -0.979421, 0.7803922, 1, 0, 1,
-0.8523303, -0.3639113, -3.626329, 0.7764706, 1, 0, 1,
-0.8491257, -0.1271276, -3.016848, 0.7686275, 1, 0, 1,
-0.8451048, -0.7405851, -1.536104, 0.7647059, 1, 0, 1,
-0.8444851, 0.1438718, -1.792539, 0.7568628, 1, 0, 1,
-0.84233, -0.197489, -1.23429, 0.7529412, 1, 0, 1,
-0.8390073, 0.6913879, -2.211405, 0.7450981, 1, 0, 1,
-0.8369527, -0.243146, -3.327153, 0.7411765, 1, 0, 1,
-0.8337362, -0.1287599, -1.110608, 0.7333333, 1, 0, 1,
-0.8298016, 1.43221, 0.5272081, 0.7294118, 1, 0, 1,
-0.825216, 0.09297206, -1.898167, 0.7215686, 1, 0, 1,
-0.8198376, 0.6129819, -1.042556, 0.7176471, 1, 0, 1,
-0.8165086, -0.02186865, -3.215268, 0.7098039, 1, 0, 1,
-0.8097574, -1.037225, -1.41149, 0.7058824, 1, 0, 1,
-0.8010647, -1.454403, -3.731717, 0.6980392, 1, 0, 1,
-0.7987227, -0.8629541, -2.008987, 0.6901961, 1, 0, 1,
-0.797755, 2.154677, -0.2368259, 0.6862745, 1, 0, 1,
-0.79469, 0.3463553, 0.01095111, 0.6784314, 1, 0, 1,
-0.7920251, -0.7580492, -3.520405, 0.6745098, 1, 0, 1,
-0.7905712, 0.2146349, -2.253142, 0.6666667, 1, 0, 1,
-0.7827488, 0.7364168, -0.9430014, 0.6627451, 1, 0, 1,
-0.7816848, -0.511348, -2.693992, 0.654902, 1, 0, 1,
-0.7803859, -0.4283025, -0.3978777, 0.6509804, 1, 0, 1,
-0.779501, -0.6198055, -3.825808, 0.6431373, 1, 0, 1,
-0.7787408, -1.490664, -3.537439, 0.6392157, 1, 0, 1,
-0.7767229, -1.174316, -1.83027, 0.6313726, 1, 0, 1,
-0.7750187, 0.5520531, -1.728605, 0.627451, 1, 0, 1,
-0.7724162, 0.9678839, -1.439105, 0.6196079, 1, 0, 1,
-0.7612203, -1.17897, -2.743815, 0.6156863, 1, 0, 1,
-0.7557836, 0.1529011, -0.4464421, 0.6078432, 1, 0, 1,
-0.7546713, -0.3214487, -2.429373, 0.6039216, 1, 0, 1,
-0.7478729, -1.854315, 0.1384925, 0.5960785, 1, 0, 1,
-0.7432433, 0.3849338, -1.138701, 0.5882353, 1, 0, 1,
-0.742451, -0.4589829, -3.08247, 0.5843138, 1, 0, 1,
-0.7417359, -0.3308784, -1.025178, 0.5764706, 1, 0, 1,
-0.7395717, -1.090548, -3.69828, 0.572549, 1, 0, 1,
-0.7360017, -1.471588, -2.673243, 0.5647059, 1, 0, 1,
-0.7337726, -1.705398, -2.799339, 0.5607843, 1, 0, 1,
-0.7334495, -1.683648, -1.813663, 0.5529412, 1, 0, 1,
-0.7300178, -0.4633234, -2.662309, 0.5490196, 1, 0, 1,
-0.7283158, -0.08839799, -2.507764, 0.5411765, 1, 0, 1,
-0.7250732, 0.01187268, -2.517854, 0.5372549, 1, 0, 1,
-0.7242557, 0.1204645, -2.799479, 0.5294118, 1, 0, 1,
-0.7205638, -1.391381, -3.609416, 0.5254902, 1, 0, 1,
-0.7150693, 0.1489032, -2.832268, 0.5176471, 1, 0, 1,
-0.7133668, -1.423126, -3.345326, 0.5137255, 1, 0, 1,
-0.7131667, 0.2177787, -0.4280623, 0.5058824, 1, 0, 1,
-0.7124349, 1.864934, -0.4821508, 0.5019608, 1, 0, 1,
-0.7062432, -0.04930185, -1.794773, 0.4941176, 1, 0, 1,
-0.7004753, -1.669266, -2.907486, 0.4862745, 1, 0, 1,
-0.6961724, 0.9497077, -0.5078329, 0.4823529, 1, 0, 1,
-0.6904904, 0.9526656, -0.1563412, 0.4745098, 1, 0, 1,
-0.6896636, 0.5483983, -0.7778143, 0.4705882, 1, 0, 1,
-0.6875169, -0.6226807, -1.828264, 0.4627451, 1, 0, 1,
-0.6844904, 0.5525442, -0.7563051, 0.4588235, 1, 0, 1,
-0.679781, -1.01468, -2.106314, 0.4509804, 1, 0, 1,
-0.6693633, -0.9717507, -2.817341, 0.4470588, 1, 0, 1,
-0.665648, -1.049263, -2.774442, 0.4392157, 1, 0, 1,
-0.6653323, -1.584223, -3.29308, 0.4352941, 1, 0, 1,
-0.659714, -0.5922635, -1.896061, 0.427451, 1, 0, 1,
-0.6570603, -0.6675616, -1.416997, 0.4235294, 1, 0, 1,
-0.6569482, 1.296043, 1.924908, 0.4156863, 1, 0, 1,
-0.6559158, 0.5984538, -0.1346987, 0.4117647, 1, 0, 1,
-0.648835, 0.2274177, -2.61299, 0.4039216, 1, 0, 1,
-0.6474501, 3.337567, -0.4467176, 0.3960784, 1, 0, 1,
-0.64461, 0.2863987, -0.6823892, 0.3921569, 1, 0, 1,
-0.6410952, 0.9373542, -0.6333962, 0.3843137, 1, 0, 1,
-0.6381074, 1.178901, -0.9822097, 0.3803922, 1, 0, 1,
-0.6359521, 0.6497613, -1.057163, 0.372549, 1, 0, 1,
-0.6351366, -1.062358, -2.134544, 0.3686275, 1, 0, 1,
-0.634663, -0.2426038, -0.3933077, 0.3607843, 1, 0, 1,
-0.6239904, 0.2682321, -1.380738, 0.3568628, 1, 0, 1,
-0.6226613, 0.3215517, -0.921719, 0.3490196, 1, 0, 1,
-0.6211604, 1.356364, -0.5419202, 0.345098, 1, 0, 1,
-0.6158486, 0.1812556, -0.9662868, 0.3372549, 1, 0, 1,
-0.6129793, 0.2168893, -1.755654, 0.3333333, 1, 0, 1,
-0.6107034, 0.9950786, -0.6623973, 0.3254902, 1, 0, 1,
-0.6021831, 0.4962987, 0.5852562, 0.3215686, 1, 0, 1,
-0.6016874, -1.073077, -2.199162, 0.3137255, 1, 0, 1,
-0.6002674, 0.8843083, -0.1363, 0.3098039, 1, 0, 1,
-0.5975107, -1.216284, -2.202446, 0.3019608, 1, 0, 1,
-0.5964426, -0.4787502, -0.1571142, 0.2941177, 1, 0, 1,
-0.591715, 0.2813329, -0.7821382, 0.2901961, 1, 0, 1,
-0.5868282, 0.8813357, -0.7342285, 0.282353, 1, 0, 1,
-0.5860398, 1.176042, -0.5437197, 0.2784314, 1, 0, 1,
-0.5831892, 0.2512918, 0.4334281, 0.2705882, 1, 0, 1,
-0.5791461, -2.302157, -3.028339, 0.2666667, 1, 0, 1,
-0.5758389, -0.05152222, -0.8611358, 0.2588235, 1, 0, 1,
-0.5735131, 0.09826403, -0.6847292, 0.254902, 1, 0, 1,
-0.5732204, 0.3122101, -2.658079, 0.2470588, 1, 0, 1,
-0.5726232, 1.145774, 1.366461, 0.2431373, 1, 0, 1,
-0.5722442, -0.1636532, -1.799909, 0.2352941, 1, 0, 1,
-0.5641977, 0.323816, -2.101494, 0.2313726, 1, 0, 1,
-0.5620379, -1.068736, -2.876215, 0.2235294, 1, 0, 1,
-0.5599882, -0.313233, -3.049107, 0.2196078, 1, 0, 1,
-0.5551869, 0.7091903, 0.1632188, 0.2117647, 1, 0, 1,
-0.5544004, 0.1462686, -1.942052, 0.2078431, 1, 0, 1,
-0.5499861, -0.714171, -2.087936, 0.2, 1, 0, 1,
-0.5459643, 0.5615086, 0.536308, 0.1921569, 1, 0, 1,
-0.5364439, 0.6258622, -0.1879841, 0.1882353, 1, 0, 1,
-0.531473, -0.5057892, -1.775318, 0.1803922, 1, 0, 1,
-0.5297877, -0.1966302, -3.916037, 0.1764706, 1, 0, 1,
-0.5271029, 0.05679547, -0.7853116, 0.1686275, 1, 0, 1,
-0.5236177, -0.4154645, -1.96218, 0.1647059, 1, 0, 1,
-0.5229722, 1.019563, -1.182686, 0.1568628, 1, 0, 1,
-0.5149364, -1.207848, -0.1027275, 0.1529412, 1, 0, 1,
-0.5135444, 1.970333, 1.159423, 0.145098, 1, 0, 1,
-0.5100664, 0.5192706, -3.338877, 0.1411765, 1, 0, 1,
-0.5071713, 2.256791, -0.3054177, 0.1333333, 1, 0, 1,
-0.5054867, -0.4046935, -3.464141, 0.1294118, 1, 0, 1,
-0.5042623, -0.6283697, -1.532868, 0.1215686, 1, 0, 1,
-0.4987788, -1.931491, -3.061816, 0.1176471, 1, 0, 1,
-0.4969346, -0.3118539, -2.254023, 0.1098039, 1, 0, 1,
-0.4911328, -1.331683, -2.622956, 0.1058824, 1, 0, 1,
-0.4866406, -0.2530512, -0.8351141, 0.09803922, 1, 0, 1,
-0.4848278, 0.09749481, -1.247658, 0.09019608, 1, 0, 1,
-0.4821824, -1.265078, -1.732688, 0.08627451, 1, 0, 1,
-0.4782452, -1.100179, -2.409171, 0.07843138, 1, 0, 1,
-0.4779751, -1.697222, -1.903021, 0.07450981, 1, 0, 1,
-0.4759694, -1.032247, -2.082761, 0.06666667, 1, 0, 1,
-0.4757628, 0.6590244, -1.485297, 0.0627451, 1, 0, 1,
-0.4723186, -0.8860275, -2.535215, 0.05490196, 1, 0, 1,
-0.4662507, -0.6662803, -2.487887, 0.05098039, 1, 0, 1,
-0.462994, 0.7063952, -2.221378, 0.04313726, 1, 0, 1,
-0.4514207, -2.902093, -1.405913, 0.03921569, 1, 0, 1,
-0.4468822, -0.1222786, -2.698754, 0.03137255, 1, 0, 1,
-0.4404025, -0.4263806, -2.730444, 0.02745098, 1, 0, 1,
-0.4243673, 0.1076357, -0.8516569, 0.01960784, 1, 0, 1,
-0.4174063, 0.1840815, -0.6681209, 0.01568628, 1, 0, 1,
-0.4151769, 0.7437941, -0.3143895, 0.007843138, 1, 0, 1,
-0.4150927, 1.241828, 0.5729002, 0.003921569, 1, 0, 1,
-0.4140612, 1.712097, 1.101568, 0, 1, 0.003921569, 1,
-0.4072201, 0.4136826, -0.5893918, 0, 1, 0.01176471, 1,
-0.3975975, -0.7008015, -3.413185, 0, 1, 0.01568628, 1,
-0.3941533, -0.1158948, -1.685327, 0, 1, 0.02352941, 1,
-0.3935459, 0.3319122, -0.5255787, 0, 1, 0.02745098, 1,
-0.3929273, -0.6015599, -4.389851, 0, 1, 0.03529412, 1,
-0.387096, 0.4256022, 0.8519884, 0, 1, 0.03921569, 1,
-0.3862295, 1.695237, 0.02376939, 0, 1, 0.04705882, 1,
-0.3784141, 0.9678612, -1.147741, 0, 1, 0.05098039, 1,
-0.3780266, 0.07225347, -0.06402373, 0, 1, 0.05882353, 1,
-0.3735373, 0.8626637, -2.870942, 0, 1, 0.0627451, 1,
-0.3679175, -0.5086824, -1.183223, 0, 1, 0.07058824, 1,
-0.3644117, -1.630974, -2.356667, 0, 1, 0.07450981, 1,
-0.3626442, -2.249432, -4.124988, 0, 1, 0.08235294, 1,
-0.3591017, 0.6996315, -1.525847, 0, 1, 0.08627451, 1,
-0.3478794, -1.347326, -2.035838, 0, 1, 0.09411765, 1,
-0.3445481, 2.186483, 0.9321015, 0, 1, 0.1019608, 1,
-0.3421052, -0.1720978, -0.969798, 0, 1, 0.1058824, 1,
-0.3414336, 0.7543323, 0.3296418, 0, 1, 0.1137255, 1,
-0.3401124, 0.9609577, -0.5074095, 0, 1, 0.1176471, 1,
-0.335396, 0.3862366, -1.171923, 0, 1, 0.1254902, 1,
-0.3324982, -1.091584, -3.767175, 0, 1, 0.1294118, 1,
-0.3320448, 0.4703112, -1.417651, 0, 1, 0.1372549, 1,
-0.3314888, -0.2089685, -1.393944, 0, 1, 0.1411765, 1,
-0.327722, 1.56987, -0.1880663, 0, 1, 0.1490196, 1,
-0.3239025, 0.488607, -0.4685521, 0, 1, 0.1529412, 1,
-0.3209021, -0.05504739, -0.1985347, 0, 1, 0.1607843, 1,
-0.3187038, 0.8911554, 0.1100309, 0, 1, 0.1647059, 1,
-0.3099941, -0.9161575, -1.889367, 0, 1, 0.172549, 1,
-0.3065071, 0.01833573, -1.334382, 0, 1, 0.1764706, 1,
-0.3064781, -0.1835822, -2.076997, 0, 1, 0.1843137, 1,
-0.3041864, -1.136429, -1.970466, 0, 1, 0.1882353, 1,
-0.2946105, -0.6603667, -4.074597, 0, 1, 0.1960784, 1,
-0.2945766, -0.5601894, -1.591204, 0, 1, 0.2039216, 1,
-0.2893679, 0.7669451, -0.9436232, 0, 1, 0.2078431, 1,
-0.2893595, -1.184598, -1.635376, 0, 1, 0.2156863, 1,
-0.2892366, 0.4133521, 0.8521008, 0, 1, 0.2196078, 1,
-0.2880146, 0.456567, -2.384076, 0, 1, 0.227451, 1,
-0.2863546, -0.2452001, -2.384343, 0, 1, 0.2313726, 1,
-0.2846592, 1.182425, 0.1774069, 0, 1, 0.2392157, 1,
-0.2729634, -1.741161, -1.12414, 0, 1, 0.2431373, 1,
-0.2728107, -0.1659704, -2.062055, 0, 1, 0.2509804, 1,
-0.2715933, 0.775681, -0.3155951, 0, 1, 0.254902, 1,
-0.2654877, -0.4527127, -2.913208, 0, 1, 0.2627451, 1,
-0.2628404, 0.8832104, -0.09675013, 0, 1, 0.2666667, 1,
-0.2605694, 0.5197947, 1.775133, 0, 1, 0.2745098, 1,
-0.2589214, 1.001332, -0.1594954, 0, 1, 0.2784314, 1,
-0.2515053, -0.3934753, -0.5827061, 0, 1, 0.2862745, 1,
-0.2498403, -0.7986418, -1.821885, 0, 1, 0.2901961, 1,
-0.2492469, -0.1552719, -0.7882496, 0, 1, 0.2980392, 1,
-0.2476629, -0.6968026, -2.097609, 0, 1, 0.3058824, 1,
-0.2461188, 0.7168102, -1.750023, 0, 1, 0.3098039, 1,
-0.2430416, 0.3336052, -0.8256956, 0, 1, 0.3176471, 1,
-0.2427706, 1.356037, -0.5878956, 0, 1, 0.3215686, 1,
-0.2395734, 0.5390949, -0.05045674, 0, 1, 0.3294118, 1,
-0.2361675, 0.3698913, 0.106045, 0, 1, 0.3333333, 1,
-0.232889, -0.2480679, -3.459323, 0, 1, 0.3411765, 1,
-0.229483, -0.9773194, -1.393409, 0, 1, 0.345098, 1,
-0.215665, -0.1223563, -1.867737, 0, 1, 0.3529412, 1,
-0.2156344, 1.483607, 0.734164, 0, 1, 0.3568628, 1,
-0.2136063, 0.5080943, -1.062022, 0, 1, 0.3647059, 1,
-0.2129473, -0.0396113, -1.048059, 0, 1, 0.3686275, 1,
-0.2121891, -0.3690105, -2.151227, 0, 1, 0.3764706, 1,
-0.2119576, 0.3381749, -0.4218652, 0, 1, 0.3803922, 1,
-0.2086335, 1.365866, -3.663647, 0, 1, 0.3882353, 1,
-0.2023887, 1.5769, -1.293946, 0, 1, 0.3921569, 1,
-0.2003602, 0.2036168, -0.721026, 0, 1, 0.4, 1,
-0.197804, -0.450016, -2.965126, 0, 1, 0.4078431, 1,
-0.1962013, -1.213357, -2.728791, 0, 1, 0.4117647, 1,
-0.1930666, 1.053492, 1.028001, 0, 1, 0.4196078, 1,
-0.1884591, 2.258937, -0.03226752, 0, 1, 0.4235294, 1,
-0.1881639, 0.1199802, -0.5028171, 0, 1, 0.4313726, 1,
-0.187034, 0.4042956, 0.8190819, 0, 1, 0.4352941, 1,
-0.1760749, 0.3812456, -0.1026686, 0, 1, 0.4431373, 1,
-0.1727684, -0.01470818, 0.1130271, 0, 1, 0.4470588, 1,
-0.1717117, -0.4646248, -2.94262, 0, 1, 0.454902, 1,
-0.1702313, 1.540781, 0.2731023, 0, 1, 0.4588235, 1,
-0.1676537, -0.04674451, -0.9651739, 0, 1, 0.4666667, 1,
-0.1590594, 1.141305, 0.2908794, 0, 1, 0.4705882, 1,
-0.1590492, -0.2765274, -1.952524, 0, 1, 0.4784314, 1,
-0.1566038, -0.6950382, -3.88262, 0, 1, 0.4823529, 1,
-0.1522793, -0.5704991, -2.626158, 0, 1, 0.4901961, 1,
-0.152108, 0.9051937, 0.860209, 0, 1, 0.4941176, 1,
-0.1512104, -1.474914, -3.652664, 0, 1, 0.5019608, 1,
-0.1483203, -1.430106, -4.106367, 0, 1, 0.509804, 1,
-0.1474894, 0.7039651, 0.3156667, 0, 1, 0.5137255, 1,
-0.1452201, 0.332983, -0.9320797, 0, 1, 0.5215687, 1,
-0.142789, 0.1803347, -1.282135, 0, 1, 0.5254902, 1,
-0.1388074, -0.6390407, -4.586533, 0, 1, 0.5333334, 1,
-0.1364752, 2.046195, 0.9970046, 0, 1, 0.5372549, 1,
-0.1356716, -0.7035128, -4.25186, 0, 1, 0.5450981, 1,
-0.1320275, 0.2476795, -1.838892, 0, 1, 0.5490196, 1,
-0.1315496, -2.200529, -3.248802, 0, 1, 0.5568628, 1,
-0.129626, 0.07423485, -1.829202, 0, 1, 0.5607843, 1,
-0.124158, -2.295178, -3.474074, 0, 1, 0.5686275, 1,
-0.1160533, -0.6925096, -2.106243, 0, 1, 0.572549, 1,
-0.1130431, 0.2298588, 1.295462, 0, 1, 0.5803922, 1,
-0.1126103, 0.6950245, -1.399645, 0, 1, 0.5843138, 1,
-0.1124983, -0.3705254, -3.023262, 0, 1, 0.5921569, 1,
-0.112069, -1.355392, -2.713033, 0, 1, 0.5960785, 1,
-0.1047219, 0.5498585, 2.417736, 0, 1, 0.6039216, 1,
-0.1041064, 1.016443, -0.387653, 0, 1, 0.6117647, 1,
-0.1027253, 0.4780922, -1.129246, 0, 1, 0.6156863, 1,
-0.09424578, -0.7025596, -4.045054, 0, 1, 0.6235294, 1,
-0.09312744, 1.073979, -1.032057, 0, 1, 0.627451, 1,
-0.08645988, 0.1920274, -1.494448, 0, 1, 0.6352941, 1,
-0.08505693, 0.7189564, 0.3305944, 0, 1, 0.6392157, 1,
-0.06533548, 0.3737842, 2.4351, 0, 1, 0.6470588, 1,
-0.05441877, 0.3803322, -0.5956415, 0, 1, 0.6509804, 1,
-0.04808564, -0.5466782, -3.880103, 0, 1, 0.6588235, 1,
-0.04359443, -0.524879, -6.035887, 0, 1, 0.6627451, 1,
-0.0367135, 1.606545, -0.6774839, 0, 1, 0.6705883, 1,
-0.03344372, -1.291811, -2.76621, 0, 1, 0.6745098, 1,
-0.03226929, 0.4945155, 0.3075421, 0, 1, 0.682353, 1,
-0.02710898, 1.063115, -0.2545654, 0, 1, 0.6862745, 1,
-0.02680814, 0.3861242, -0.4405631, 0, 1, 0.6941177, 1,
-0.02155708, -1.158707, -2.943538, 0, 1, 0.7019608, 1,
-0.01872229, -1.017908, -4.779631, 0, 1, 0.7058824, 1,
-0.01513277, -1.48171, -2.276704, 0, 1, 0.7137255, 1,
-0.01093594, -0.8900947, -2.146897, 0, 1, 0.7176471, 1,
-0.0108806, -1.449577, -2.927994, 0, 1, 0.7254902, 1,
-0.009178468, -0.05527233, -1.835321, 0, 1, 0.7294118, 1,
-0.006785934, -1.750736, -1.664792, 0, 1, 0.7372549, 1,
-0.00562598, 0.1900666, 1.115612, 0, 1, 0.7411765, 1,
-0.002311429, -2.004304, -1.952779, 0, 1, 0.7490196, 1,
0.006546736, -0.7733063, 3.556293, 0, 1, 0.7529412, 1,
0.01050947, 1.495642, 0.3762086, 0, 1, 0.7607843, 1,
0.01114555, 0.3981326, 0.4526378, 0, 1, 0.7647059, 1,
0.01507977, -0.208147, 2.725209, 0, 1, 0.772549, 1,
0.01658425, 1.237277, 0.58153, 0, 1, 0.7764706, 1,
0.01722393, 2.285184, 1.305614, 0, 1, 0.7843137, 1,
0.01752783, -0.5015284, 4.215527, 0, 1, 0.7882353, 1,
0.01768108, -1.822778, 2.683932, 0, 1, 0.7960784, 1,
0.01828773, 0.9386672, -1.175429, 0, 1, 0.8039216, 1,
0.02244444, 0.4549124, -0.3497058, 0, 1, 0.8078431, 1,
0.02570765, -0.2668794, 1.514856, 0, 1, 0.8156863, 1,
0.0263702, 0.8465897, -0.2969077, 0, 1, 0.8196079, 1,
0.03293016, 0.04316288, -0.9432223, 0, 1, 0.827451, 1,
0.0352969, 1.91717, 0.5788606, 0, 1, 0.8313726, 1,
0.03775271, 0.6298329, -0.9659466, 0, 1, 0.8392157, 1,
0.03984359, 1.367801, -0.5024672, 0, 1, 0.8431373, 1,
0.04182038, 0.6141341, -0.5162458, 0, 1, 0.8509804, 1,
0.04282997, 0.7704622, 0.3786727, 0, 1, 0.854902, 1,
0.04330897, 0.4742242, -1.221035, 0, 1, 0.8627451, 1,
0.04546595, 0.6667871, 0.8561268, 0, 1, 0.8666667, 1,
0.0490687, 0.5169173, 0.5559205, 0, 1, 0.8745098, 1,
0.05761369, -0.5300475, 1.609849, 0, 1, 0.8784314, 1,
0.06023072, -0.8570375, 1.608415, 0, 1, 0.8862745, 1,
0.06045182, 1.574898, 1.311373, 0, 1, 0.8901961, 1,
0.06337976, -0.9941481, 1.806934, 0, 1, 0.8980392, 1,
0.06373729, -0.8075396, 0.7931832, 0, 1, 0.9058824, 1,
0.06645159, 0.5203828, 1.323093, 0, 1, 0.9098039, 1,
0.07333631, 1.040842, 1.663537, 0, 1, 0.9176471, 1,
0.07473332, -0.6239684, 3.794476, 0, 1, 0.9215686, 1,
0.08043827, 0.7192904, 1.224724, 0, 1, 0.9294118, 1,
0.0806312, 2.882019, 0.6511493, 0, 1, 0.9333333, 1,
0.08214997, -1.215156, 4.812606, 0, 1, 0.9411765, 1,
0.08309589, 1.087448, -1.027443, 0, 1, 0.945098, 1,
0.08392808, -0.02497447, 1.096067, 0, 1, 0.9529412, 1,
0.08449207, -0.1967605, 3.277975, 0, 1, 0.9568627, 1,
0.08747043, -0.4300926, 5.205086, 0, 1, 0.9647059, 1,
0.08758545, -1.626963, 3.31771, 0, 1, 0.9686275, 1,
0.08989631, -1.96662, 3.110775, 0, 1, 0.9764706, 1,
0.09094954, -0.4700291, 1.833951, 0, 1, 0.9803922, 1,
0.09110072, -1.921952, 6.013857, 0, 1, 0.9882353, 1,
0.09127007, -0.8654584, 2.332062, 0, 1, 0.9921569, 1,
0.09213831, -1.483355, 3.944133, 0, 1, 1, 1,
0.0942032, 0.999393, -1.849964, 0, 0.9921569, 1, 1,
0.09492914, 0.6704708, 0.8307959, 0, 0.9882353, 1, 1,
0.09615167, 1.057307, 0.04286574, 0, 0.9803922, 1, 1,
0.09706668, -0.5395439, 3.026335, 0, 0.9764706, 1, 1,
0.09826981, -0.5405275, 4.412282, 0, 0.9686275, 1, 1,
0.09879994, -0.06189179, 1.948499, 0, 0.9647059, 1, 1,
0.1032969, 0.5584151, -0.5619957, 0, 0.9568627, 1, 1,
0.1048257, -0.3967294, 2.671322, 0, 0.9529412, 1, 1,
0.1056944, 1.283672, 0.7878332, 0, 0.945098, 1, 1,
0.1084259, -0.8323099, 3.065706, 0, 0.9411765, 1, 1,
0.1093318, 0.8419418, 1.040848, 0, 0.9333333, 1, 1,
0.1101094, -0.2035035, 3.411024, 0, 0.9294118, 1, 1,
0.1118684, -1.363946, 4.276314, 0, 0.9215686, 1, 1,
0.1147027, 0.2274986, -0.2483504, 0, 0.9176471, 1, 1,
0.1175133, 0.2541509, 0.4686106, 0, 0.9098039, 1, 1,
0.1245124, -1.390208, 1.311047, 0, 0.9058824, 1, 1,
0.1259908, 0.9557608, 0.9158976, 0, 0.8980392, 1, 1,
0.1268544, 1.715358, 1.599366, 0, 0.8901961, 1, 1,
0.1284745, -2.584753, 2.63899, 0, 0.8862745, 1, 1,
0.1300557, -0.7218257, 3.945234, 0, 0.8784314, 1, 1,
0.130148, -1.519676, 3.808202, 0, 0.8745098, 1, 1,
0.1326532, -0.05295819, 0.7404118, 0, 0.8666667, 1, 1,
0.1329844, 1.75607, -0.5456617, 0, 0.8627451, 1, 1,
0.1336417, 0.02902148, 0.6649411, 0, 0.854902, 1, 1,
0.1350835, -0.2261201, 1.275357, 0, 0.8509804, 1, 1,
0.1354997, 0.5115625, -0.01191775, 0, 0.8431373, 1, 1,
0.1362856, 1.080199, -0.2447067, 0, 0.8392157, 1, 1,
0.138073, 1.946611, -0.03006509, 0, 0.8313726, 1, 1,
0.1392356, -1.507787, 3.276013, 0, 0.827451, 1, 1,
0.1404931, 0.03471694, 1.299071, 0, 0.8196079, 1, 1,
0.1433127, -0.6717308, 2.145435, 0, 0.8156863, 1, 1,
0.1468535, 0.2372971, -0.7510377, 0, 0.8078431, 1, 1,
0.1479656, -1.102413, 2.396148, 0, 0.8039216, 1, 1,
0.1489421, -0.5640787, 3.466448, 0, 0.7960784, 1, 1,
0.1499875, -0.6531408, 2.886539, 0, 0.7882353, 1, 1,
0.1506372, 1.731903, 0.9095041, 0, 0.7843137, 1, 1,
0.1526974, -1.244957, 5.097136, 0, 0.7764706, 1, 1,
0.1531925, -0.6538504, 3.653801, 0, 0.772549, 1, 1,
0.1548451, 0.2592818, 1.465115, 0, 0.7647059, 1, 1,
0.1569189, 0.7442286, -0.6121251, 0, 0.7607843, 1, 1,
0.157192, -1.471936, 2.69389, 0, 0.7529412, 1, 1,
0.164037, -0.1439339, 2.458344, 0, 0.7490196, 1, 1,
0.166229, 1.245585, -0.1240447, 0, 0.7411765, 1, 1,
0.1676948, 0.2921211, 1.630604, 0, 0.7372549, 1, 1,
0.1687376, 0.1101111, 0.5152275, 0, 0.7294118, 1, 1,
0.1757801, 0.4706669, 1.050752, 0, 0.7254902, 1, 1,
0.1835319, 0.4744673, 0.7321093, 0, 0.7176471, 1, 1,
0.1837615, -0.5377584, 2.708883, 0, 0.7137255, 1, 1,
0.1860783, 1.033365, -0.01267813, 0, 0.7058824, 1, 1,
0.1873884, -0.1764552, 1.705018, 0, 0.6980392, 1, 1,
0.1874775, -1.959904, 2.963103, 0, 0.6941177, 1, 1,
0.1892154, 0.3044753, -0.9665452, 0, 0.6862745, 1, 1,
0.189383, 0.2292295, -2.069713, 0, 0.682353, 1, 1,
0.1920166, 1.578781, 1.005153, 0, 0.6745098, 1, 1,
0.192852, -0.1814597, 3.339914, 0, 0.6705883, 1, 1,
0.1983223, 0.428496, 0.2542061, 0, 0.6627451, 1, 1,
0.1997509, -0.00968926, 1.455003, 0, 0.6588235, 1, 1,
0.200436, 0.2311462, 0.7710258, 0, 0.6509804, 1, 1,
0.2026636, -0.2123186, 2.438852, 0, 0.6470588, 1, 1,
0.2030633, 1.321188, -0.8593649, 0, 0.6392157, 1, 1,
0.2033513, 0.8011577, 1.430745, 0, 0.6352941, 1, 1,
0.2037688, -0.1904049, 1.362166, 0, 0.627451, 1, 1,
0.2069994, -0.4970058, 3.492083, 0, 0.6235294, 1, 1,
0.2102815, 1.612134, 1.439533, 0, 0.6156863, 1, 1,
0.2105051, -1.788652, 1.567173, 0, 0.6117647, 1, 1,
0.2118126, -0.4501361, 5.149083, 0, 0.6039216, 1, 1,
0.2130068, -0.2041887, 2.347534, 0, 0.5960785, 1, 1,
0.2154014, 0.6477361, -1.163279, 0, 0.5921569, 1, 1,
0.2156709, -0.4239139, 1.125673, 0, 0.5843138, 1, 1,
0.2174454, -1.359246, 1.767463, 0, 0.5803922, 1, 1,
0.2255953, 0.2910516, 1.047085, 0, 0.572549, 1, 1,
0.2260047, -0.7418596, 4.883096, 0, 0.5686275, 1, 1,
0.2284435, 1.688657, -1.309913, 0, 0.5607843, 1, 1,
0.2287962, 1.424519, -0.4240411, 0, 0.5568628, 1, 1,
0.2292254, 0.2014802, 1.25521, 0, 0.5490196, 1, 1,
0.2316051, 0.6833606, -1.196577, 0, 0.5450981, 1, 1,
0.2337376, -0.4790015, 3.90814, 0, 0.5372549, 1, 1,
0.2338916, -0.6982673, 0.3751745, 0, 0.5333334, 1, 1,
0.2338958, 0.7891014, 2.050889, 0, 0.5254902, 1, 1,
0.2345924, -0.6884637, 3.047222, 0, 0.5215687, 1, 1,
0.2364189, -2.100735, 2.165722, 0, 0.5137255, 1, 1,
0.2448791, -0.6082054, 3.935144, 0, 0.509804, 1, 1,
0.2454407, -0.9462097, 3.766226, 0, 0.5019608, 1, 1,
0.2486115, -0.4049272, 1.826908, 0, 0.4941176, 1, 1,
0.2541698, -0.3179125, 3.711881, 0, 0.4901961, 1, 1,
0.2569786, -0.3334795, 2.101037, 0, 0.4823529, 1, 1,
0.2572434, 0.5087841, -0.6296277, 0, 0.4784314, 1, 1,
0.2604596, -0.8998987, 0.9124139, 0, 0.4705882, 1, 1,
0.2610557, -1.411716, 5.99461, 0, 0.4666667, 1, 1,
0.2649232, -0.7238064, 2.302648, 0, 0.4588235, 1, 1,
0.2688023, 0.5905864, -0.09225739, 0, 0.454902, 1, 1,
0.2788471, 1.132717, 0.8728272, 0, 0.4470588, 1, 1,
0.2835033, 0.0993837, 2.496264, 0, 0.4431373, 1, 1,
0.2841778, -0.674144, 2.64863, 0, 0.4352941, 1, 1,
0.2853702, 0.3194329, 0.5341802, 0, 0.4313726, 1, 1,
0.2940042, 0.8897488, 0.03518822, 0, 0.4235294, 1, 1,
0.2970266, 0.04993144, 1.061537, 0, 0.4196078, 1, 1,
0.3069005, -0.4389965, 1.989287, 0, 0.4117647, 1, 1,
0.3191751, -0.1366022, 1.443052, 0, 0.4078431, 1, 1,
0.3266216, -0.39318, 3.088001, 0, 0.4, 1, 1,
0.3293739, 0.208873, 2.025675, 0, 0.3921569, 1, 1,
0.3301161, -0.1290915, 0.5103267, 0, 0.3882353, 1, 1,
0.3328598, -0.001512309, 1.059467, 0, 0.3803922, 1, 1,
0.3328885, 1.41514, -0.08237146, 0, 0.3764706, 1, 1,
0.3362024, 0.2698273, 1.525739, 0, 0.3686275, 1, 1,
0.337643, -1.548535, 3.313791, 0, 0.3647059, 1, 1,
0.3406002, 0.2930009, 0.6669075, 0, 0.3568628, 1, 1,
0.3457339, -0.7588572, 4.117542, 0, 0.3529412, 1, 1,
0.3495685, 0.002151988, 2.89242, 0, 0.345098, 1, 1,
0.3518319, 1.042497, 1.230781, 0, 0.3411765, 1, 1,
0.352544, 0.6166433, 1.498525, 0, 0.3333333, 1, 1,
0.3532713, -0.3272879, 0.6826994, 0, 0.3294118, 1, 1,
0.3535923, 1.965486, 1.176457, 0, 0.3215686, 1, 1,
0.3549936, -1.030491, 2.326019, 0, 0.3176471, 1, 1,
0.3604872, 0.7135992, 1.700385, 0, 0.3098039, 1, 1,
0.3618493, 0.4274699, -0.06912414, 0, 0.3058824, 1, 1,
0.3627921, -0.5665765, 3.062277, 0, 0.2980392, 1, 1,
0.3628706, 0.06192766, -0.3156481, 0, 0.2901961, 1, 1,
0.3672991, -1.633261, 2.92802, 0, 0.2862745, 1, 1,
0.3695365, 1.932823, 0.4427733, 0, 0.2784314, 1, 1,
0.3729915, 0.5228983, -1.418011, 0, 0.2745098, 1, 1,
0.3737265, 1.367082, 0.3326022, 0, 0.2666667, 1, 1,
0.3745085, -0.335128, 0.7149501, 0, 0.2627451, 1, 1,
0.379496, -0.1868097, 2.100345, 0, 0.254902, 1, 1,
0.3804024, -0.4485333, 2.646777, 0, 0.2509804, 1, 1,
0.3808405, 0.06171452, 1.010013, 0, 0.2431373, 1, 1,
0.3816873, 2.392733, -0.6375469, 0, 0.2392157, 1, 1,
0.3828121, -0.3761734, 2.276643, 0, 0.2313726, 1, 1,
0.385982, -0.08822588, 2.622589, 0, 0.227451, 1, 1,
0.3875009, 0.7522789, -0.6584875, 0, 0.2196078, 1, 1,
0.3884422, -0.9157023, 2.646173, 0, 0.2156863, 1, 1,
0.3887124, 0.7854295, -0.1379343, 0, 0.2078431, 1, 1,
0.389074, 1.809919, 0.4838435, 0, 0.2039216, 1, 1,
0.3895531, 0.188557, 0.6889222, 0, 0.1960784, 1, 1,
0.3928107, 2.374972, 1.049691, 0, 0.1882353, 1, 1,
0.3971783, -0.6784715, 3.527413, 0, 0.1843137, 1, 1,
0.3991731, 0.6874187, 1.386101, 0, 0.1764706, 1, 1,
0.4060787, 0.7079515, 1.369534, 0, 0.172549, 1, 1,
0.4071607, 0.6754166, -0.7384366, 0, 0.1647059, 1, 1,
0.407862, 0.8358662, 1.417145, 0, 0.1607843, 1, 1,
0.4079164, -1.294973, 3.027875, 0, 0.1529412, 1, 1,
0.4117475, -0.761483, 1.82415, 0, 0.1490196, 1, 1,
0.4130782, 0.6428627, 0.66976, 0, 0.1411765, 1, 1,
0.4138998, -1.619818, 2.792524, 0, 0.1372549, 1, 1,
0.4139054, 0.3941326, 0.3443279, 0, 0.1294118, 1, 1,
0.4147957, -1.559296, 2.140403, 0, 0.1254902, 1, 1,
0.4189074, 1.163895, 0.6334042, 0, 0.1176471, 1, 1,
0.4195717, 1.321963, 0.8473696, 0, 0.1137255, 1, 1,
0.4208934, -0.2829789, 2.96312, 0, 0.1058824, 1, 1,
0.4287594, -0.5373544, 3.379848, 0, 0.09803922, 1, 1,
0.4304887, 0.1036461, 0.7528738, 0, 0.09411765, 1, 1,
0.4326771, 1.540283, 0.1695205, 0, 0.08627451, 1, 1,
0.4359392, -0.3647563, 2.440965, 0, 0.08235294, 1, 1,
0.436875, -0.6204528, 3.967662, 0, 0.07450981, 1, 1,
0.4395429, 0.2753449, -0.8034664, 0, 0.07058824, 1, 1,
0.4400338, 0.3124308, 0.27972, 0, 0.0627451, 1, 1,
0.4403894, 1.643218, 0.6072177, 0, 0.05882353, 1, 1,
0.4427195, 1.136352, -0.0875987, 0, 0.05098039, 1, 1,
0.443196, 0.6821776, 1.173337, 0, 0.04705882, 1, 1,
0.4435554, -0.7731097, 2.471226, 0, 0.03921569, 1, 1,
0.4446699, -1.035178, 2.689269, 0, 0.03529412, 1, 1,
0.4471761, -2.138339, 3.214436, 0, 0.02745098, 1, 1,
0.4531237, -0.1258047, 2.107834, 0, 0.02352941, 1, 1,
0.456316, -1.360608, 2.18617, 0, 0.01568628, 1, 1,
0.4615603, 0.01218669, 1.371903, 0, 0.01176471, 1, 1,
0.4621834, 1.667008, 1.013893, 0, 0.003921569, 1, 1,
0.4622477, 0.9303816, 0.6684549, 0.003921569, 0, 1, 1,
0.4624269, 0.3920842, 1.692243, 0.007843138, 0, 1, 1,
0.4637261, -0.1519656, 2.162537, 0.01568628, 0, 1, 1,
0.4646912, 0.6962747, 0.1385913, 0.01960784, 0, 1, 1,
0.4692627, -1.065905, 1.742334, 0.02745098, 0, 1, 1,
0.4733989, -0.9563328, 2.606945, 0.03137255, 0, 1, 1,
0.4768993, 1.250425, 2.207165, 0.03921569, 0, 1, 1,
0.4810679, 0.1728734, 0.2689376, 0.04313726, 0, 1, 1,
0.4838931, -1.450887, 1.968873, 0.05098039, 0, 1, 1,
0.4880146, 0.5615386, 0.6310226, 0.05490196, 0, 1, 1,
0.491284, -0.6707869, 2.164624, 0.0627451, 0, 1, 1,
0.4959919, -2.610381, 2.869978, 0.06666667, 0, 1, 1,
0.4960893, -1.360935, 2.52846, 0.07450981, 0, 1, 1,
0.4962027, 1.718643, 0.07060391, 0.07843138, 0, 1, 1,
0.4993588, -0.4412107, 3.930519, 0.08627451, 0, 1, 1,
0.5004433, 1.044901, 0.4774732, 0.09019608, 0, 1, 1,
0.5019879, -0.4139073, 2.492635, 0.09803922, 0, 1, 1,
0.5023226, 0.7979568, 1.52514, 0.1058824, 0, 1, 1,
0.5051348, 0.5709578, 1.677729, 0.1098039, 0, 1, 1,
0.505227, -0.9394621, 0.6595632, 0.1176471, 0, 1, 1,
0.5052376, -2.660176, 2.948588, 0.1215686, 0, 1, 1,
0.5069537, 1.34755, 1.902865, 0.1294118, 0, 1, 1,
0.5090029, 0.8644214, 2.297579, 0.1333333, 0, 1, 1,
0.5112687, -0.3930316, 2.227825, 0.1411765, 0, 1, 1,
0.5143648, 1.076342, 2.681505, 0.145098, 0, 1, 1,
0.5158508, 0.7059734, 1.791508, 0.1529412, 0, 1, 1,
0.5303877, 1.308426, -1.716158, 0.1568628, 0, 1, 1,
0.5309339, 1.15697, 0.009880539, 0.1647059, 0, 1, 1,
0.5315298, -0.7991257, 2.224478, 0.1686275, 0, 1, 1,
0.5334193, -1.38851, 3.707679, 0.1764706, 0, 1, 1,
0.5376349, -0.8806425, 5.317708, 0.1803922, 0, 1, 1,
0.5380239, 1.060684, -0.5302179, 0.1882353, 0, 1, 1,
0.541683, -0.7632467, 4.085485, 0.1921569, 0, 1, 1,
0.5457162, -0.4272036, 2.237695, 0.2, 0, 1, 1,
0.5508155, 0.5298368, 1.463721, 0.2078431, 0, 1, 1,
0.5517066, 1.197327, 0.8395262, 0.2117647, 0, 1, 1,
0.5520501, 0.03171894, 2.191113, 0.2196078, 0, 1, 1,
0.5575063, 0.7819123, 1.027784, 0.2235294, 0, 1, 1,
0.5579836, 0.01349814, 1.924245, 0.2313726, 0, 1, 1,
0.5592446, -0.6496633, 2.073415, 0.2352941, 0, 1, 1,
0.56054, -1.119692, 1.973594, 0.2431373, 0, 1, 1,
0.5621905, -0.3829108, 1.735415, 0.2470588, 0, 1, 1,
0.5675107, -1.720346, 4.368455, 0.254902, 0, 1, 1,
0.5716952, -0.0213539, 2.528757, 0.2588235, 0, 1, 1,
0.5775287, -1.195567, 1.811153, 0.2666667, 0, 1, 1,
0.5783632, 0.1629381, 1.135351, 0.2705882, 0, 1, 1,
0.5807245, -1.535488, 3.587083, 0.2784314, 0, 1, 1,
0.5908514, -1.175214, 2.633494, 0.282353, 0, 1, 1,
0.5955788, 0.7515367, -0.8954386, 0.2901961, 0, 1, 1,
0.6099681, -1.067368, 2.518823, 0.2941177, 0, 1, 1,
0.6133631, -0.7874849, 3.045093, 0.3019608, 0, 1, 1,
0.6155993, -0.9910864, 3.540011, 0.3098039, 0, 1, 1,
0.6203145, -0.6985212, 2.963673, 0.3137255, 0, 1, 1,
0.6210425, -0.5977125, 3.064292, 0.3215686, 0, 1, 1,
0.6223471, 0.4788779, 1.544848, 0.3254902, 0, 1, 1,
0.6236833, 1.185904, -1.273567, 0.3333333, 0, 1, 1,
0.6237687, 2.63828, 0.2140428, 0.3372549, 0, 1, 1,
0.6325212, -0.6945533, 2.66264, 0.345098, 0, 1, 1,
0.6337274, -0.3188595, 2.379638, 0.3490196, 0, 1, 1,
0.6372843, 0.02239352, 0.9429111, 0.3568628, 0, 1, 1,
0.6415039, -0.1770489, 1.729065, 0.3607843, 0, 1, 1,
0.6445252, -0.04961726, 0.09782356, 0.3686275, 0, 1, 1,
0.646083, -0.9795752, 3.441026, 0.372549, 0, 1, 1,
0.6478098, 0.7268298, 0.4858115, 0.3803922, 0, 1, 1,
0.6479267, 1.446462, 0.9945306, 0.3843137, 0, 1, 1,
0.6500023, -1.574414, 3.835103, 0.3921569, 0, 1, 1,
0.6554291, -0.1481327, 2.870743, 0.3960784, 0, 1, 1,
0.6560066, 0.4684003, 0.7256585, 0.4039216, 0, 1, 1,
0.6594562, -0.8792524, 4.017514, 0.4117647, 0, 1, 1,
0.6604756, -1.545079, 3.060126, 0.4156863, 0, 1, 1,
0.6606255, -1.655645, 5.505109, 0.4235294, 0, 1, 1,
0.6637327, -1.011878, 3.028117, 0.427451, 0, 1, 1,
0.6650348, -2.106189, 1.987015, 0.4352941, 0, 1, 1,
0.6689687, 0.4585405, -1.558786, 0.4392157, 0, 1, 1,
0.6690561, -0.6869429, 3.008629, 0.4470588, 0, 1, 1,
0.6699151, 0.7770321, 0.603256, 0.4509804, 0, 1, 1,
0.6734866, 0.8935349, -0.7924988, 0.4588235, 0, 1, 1,
0.6738825, 1.687221, -0.9602834, 0.4627451, 0, 1, 1,
0.6820922, -0.6444831, 2.634957, 0.4705882, 0, 1, 1,
0.682222, -0.219632, 1.247246, 0.4745098, 0, 1, 1,
0.6909904, 0.1828354, 2.544773, 0.4823529, 0, 1, 1,
0.6922404, 0.06521748, 0.2307409, 0.4862745, 0, 1, 1,
0.6954375, -0.2280068, 4.417548, 0.4941176, 0, 1, 1,
0.6962581, 0.1257621, 2.79371, 0.5019608, 0, 1, 1,
0.6967103, -0.09054255, 2.84445, 0.5058824, 0, 1, 1,
0.7020479, 0.02729189, 3.362604, 0.5137255, 0, 1, 1,
0.7031882, 0.4081532, 1.368557, 0.5176471, 0, 1, 1,
0.706935, 1.430361, 0.3845319, 0.5254902, 0, 1, 1,
0.7082766, 2.413541, 0.5204091, 0.5294118, 0, 1, 1,
0.7118589, 0.4809566, -0.08588759, 0.5372549, 0, 1, 1,
0.7128751, -1.153536, 3.385196, 0.5411765, 0, 1, 1,
0.7143671, 1.01999, -1.601624, 0.5490196, 0, 1, 1,
0.7201189, 1.168352, -0.1816859, 0.5529412, 0, 1, 1,
0.7205341, 0.07040976, 1.6033, 0.5607843, 0, 1, 1,
0.7212878, 1.751931, 1.624544, 0.5647059, 0, 1, 1,
0.7237722, -0.6506512, 1.9917, 0.572549, 0, 1, 1,
0.7253945, 0.01678788, 0.8701267, 0.5764706, 0, 1, 1,
0.7301561, 0.1637495, 2.214085, 0.5843138, 0, 1, 1,
0.7376789, -1.48259, 0.621303, 0.5882353, 0, 1, 1,
0.7379534, -2.253444, 1.631215, 0.5960785, 0, 1, 1,
0.7428302, 0.9150307, 0.706689, 0.6039216, 0, 1, 1,
0.7433888, 0.9570822, 0.9620981, 0.6078432, 0, 1, 1,
0.7448583, -0.4980453, 1.181075, 0.6156863, 0, 1, 1,
0.7454658, 0.508414, 0.489091, 0.6196079, 0, 1, 1,
0.7465544, -1.373574, 3.867054, 0.627451, 0, 1, 1,
0.7510493, 0.3488283, 1.142545, 0.6313726, 0, 1, 1,
0.7524062, 0.4334679, 0.9826729, 0.6392157, 0, 1, 1,
0.7567395, -0.5243555, 2.138339, 0.6431373, 0, 1, 1,
0.7603317, -1.560177, 3.353503, 0.6509804, 0, 1, 1,
0.7641262, 0.3554091, 1.273967, 0.654902, 0, 1, 1,
0.7700958, -1.211856, 3.174948, 0.6627451, 0, 1, 1,
0.7725006, 1.089624, -0.08987597, 0.6666667, 0, 1, 1,
0.7756261, 1.318773, 0.7552587, 0.6745098, 0, 1, 1,
0.7775623, 0.8836532, 1.822141, 0.6784314, 0, 1, 1,
0.784096, -0.8911843, 1.538505, 0.6862745, 0, 1, 1,
0.7871876, 0.6507868, 1.374161, 0.6901961, 0, 1, 1,
0.7905596, 1.07593, 2.490498, 0.6980392, 0, 1, 1,
0.790827, -0.4074457, 0.453905, 0.7058824, 0, 1, 1,
0.7916159, -0.9106743, 3.397989, 0.7098039, 0, 1, 1,
0.7919056, 0.4129869, -0.5127823, 0.7176471, 0, 1, 1,
0.7941437, 0.02024144, 1.609643, 0.7215686, 0, 1, 1,
0.796138, 0.4843533, 0.99339, 0.7294118, 0, 1, 1,
0.797083, 0.9663129, -1.710699, 0.7333333, 0, 1, 1,
0.7985311, -0.7988362, 4.108728, 0.7411765, 0, 1, 1,
0.8021702, 0.2352896, 2.356251, 0.7450981, 0, 1, 1,
0.8091828, -0.4706483, 0.7210925, 0.7529412, 0, 1, 1,
0.8141874, 0.4255412, 2.584837, 0.7568628, 0, 1, 1,
0.8198015, 1.118941, 0.1060506, 0.7647059, 0, 1, 1,
0.8198353, 0.4934161, 0.6336672, 0.7686275, 0, 1, 1,
0.8198679, 0.1154982, -0.02246008, 0.7764706, 0, 1, 1,
0.8209103, -1.734938, 4.315173, 0.7803922, 0, 1, 1,
0.8244283, 1.143068, 0.5417725, 0.7882353, 0, 1, 1,
0.832687, -1.550692, 2.669471, 0.7921569, 0, 1, 1,
0.8347229, -0.4419363, 2.500001, 0.8, 0, 1, 1,
0.8369814, -0.6092401, 2.997515, 0.8078431, 0, 1, 1,
0.8413423, 0.5608096, 1.467317, 0.8117647, 0, 1, 1,
0.8556812, 0.2606046, 1.291468, 0.8196079, 0, 1, 1,
0.8566472, 0.6828982, 2.23822, 0.8235294, 0, 1, 1,
0.8594548, -0.3035903, 1.463211, 0.8313726, 0, 1, 1,
0.8600388, 0.6513152, -1.449387, 0.8352941, 0, 1, 1,
0.8628121, 0.2513736, 0.1319661, 0.8431373, 0, 1, 1,
0.8654867, -0.3910814, 3.116278, 0.8470588, 0, 1, 1,
0.8658926, -0.08618827, 0.4687944, 0.854902, 0, 1, 1,
0.8687944, 1.106539, 1.1522, 0.8588235, 0, 1, 1,
0.869453, -0.3597777, 0.6769656, 0.8666667, 0, 1, 1,
0.8723664, 1.619537, -1.303746, 0.8705882, 0, 1, 1,
0.8739839, 0.929372, 3.16018, 0.8784314, 0, 1, 1,
0.8818066, 0.5866767, 1.072233, 0.8823529, 0, 1, 1,
0.8892521, -0.9663022, 3.101459, 0.8901961, 0, 1, 1,
0.8904056, -0.3246233, 2.452016, 0.8941177, 0, 1, 1,
0.8950027, -0.7914807, 2.660255, 0.9019608, 0, 1, 1,
0.902146, -1.681431, 3.201238, 0.9098039, 0, 1, 1,
0.9041826, 0.8937572, -0.06738599, 0.9137255, 0, 1, 1,
0.9051176, -0.2215769, 1.903488, 0.9215686, 0, 1, 1,
0.905516, 0.776176, 1.598445, 0.9254902, 0, 1, 1,
0.9057891, -0.3171357, 1.746859, 0.9333333, 0, 1, 1,
0.9064198, 1.352787, 1.603086, 0.9372549, 0, 1, 1,
0.90899, -1.031006, 1.597975, 0.945098, 0, 1, 1,
0.9113027, -1.708054, 1.604598, 0.9490196, 0, 1, 1,
0.911894, 0.6870727, 1.235085, 0.9568627, 0, 1, 1,
0.9203215, 1.712605, 1.269245, 0.9607843, 0, 1, 1,
0.9258694, -1.587455, 1.590117, 0.9686275, 0, 1, 1,
0.9266455, -1.008333, 1.181433, 0.972549, 0, 1, 1,
0.928079, -0.004157588, 0.5821713, 0.9803922, 0, 1, 1,
0.9344597, -0.4948978, 1.279314, 0.9843137, 0, 1, 1,
0.9400495, 1.053066, 2.691775, 0.9921569, 0, 1, 1,
0.9404978, -0.07014368, 0.5578287, 0.9960784, 0, 1, 1,
0.9425154, 0.1579064, -0.07388218, 1, 0, 0.9960784, 1,
0.9454563, 0.3745161, 1.446792, 1, 0, 0.9882353, 1,
0.9474002, 0.1554459, 1.539561, 1, 0, 0.9843137, 1,
0.9516069, 0.4467787, 2.454788, 1, 0, 0.9764706, 1,
0.9552895, -0.975859, 1.941411, 1, 0, 0.972549, 1,
0.9564154, 0.4096082, -0.7112373, 1, 0, 0.9647059, 1,
0.9595056, 0.5360916, 2.31748, 1, 0, 0.9607843, 1,
0.9704289, 0.5176576, 0.6251661, 1, 0, 0.9529412, 1,
0.9729611, 0.2461112, 1.0546, 1, 0, 0.9490196, 1,
0.9730685, -1.460044, 1.142476, 1, 0, 0.9411765, 1,
0.974468, -3.177603, 3.682839, 1, 0, 0.9372549, 1,
0.9756157, 1.453312, 1.707509, 1, 0, 0.9294118, 1,
0.9804069, 1.051536, 1.620043, 1, 0, 0.9254902, 1,
0.9868451, 0.7769425, -0.2852649, 1, 0, 0.9176471, 1,
0.9899735, 0.1430151, 1.031621, 1, 0, 0.9137255, 1,
1.000777, 0.8641749, 0.4672675, 1, 0, 0.9058824, 1,
1.001739, -1.972459, 1.091689, 1, 0, 0.9019608, 1,
1.025552, -0.665795, 2.042156, 1, 0, 0.8941177, 1,
1.02756, 0.6238538, 2.376757, 1, 0, 0.8862745, 1,
1.032391, -0.1662523, 3.647871, 1, 0, 0.8823529, 1,
1.032836, 0.4694115, 2.55263, 1, 0, 0.8745098, 1,
1.036934, 1.077321, 0.7565181, 1, 0, 0.8705882, 1,
1.038329, -0.2647712, 2.575561, 1, 0, 0.8627451, 1,
1.038417, 1.005982, 0.6074765, 1, 0, 0.8588235, 1,
1.040798, -0.007519718, 2.836159, 1, 0, 0.8509804, 1,
1.044153, -0.6311924, 2.53044, 1, 0, 0.8470588, 1,
1.045791, -0.3536579, 0.5308397, 1, 0, 0.8392157, 1,
1.051218, 0.2856565, 1.090306, 1, 0, 0.8352941, 1,
1.053548, 2.357281, -1.594594, 1, 0, 0.827451, 1,
1.062157, -0.6456336, 2.066948, 1, 0, 0.8235294, 1,
1.078855, -0.6751981, 2.133771, 1, 0, 0.8156863, 1,
1.079054, 2.472203, 0.8031803, 1, 0, 0.8117647, 1,
1.079828, 0.833536, -0.2083419, 1, 0, 0.8039216, 1,
1.082631, 0.4587333, -0.1292981, 1, 0, 0.7960784, 1,
1.088771, 0.1216925, 0.9913889, 1, 0, 0.7921569, 1,
1.09289, 0.2319875, 1.379813, 1, 0, 0.7843137, 1,
1.093061, 0.4851594, 0.9576702, 1, 0, 0.7803922, 1,
1.094061, -0.07285956, 0.8638754, 1, 0, 0.772549, 1,
1.095935, 0.8326025, 0.6843684, 1, 0, 0.7686275, 1,
1.102245, 0.1516414, 1.887375, 1, 0, 0.7607843, 1,
1.106053, -0.4074472, 2.108575, 1, 0, 0.7568628, 1,
1.111319, 0.6323922, 0.4350672, 1, 0, 0.7490196, 1,
1.112597, -0.1117652, 2.140745, 1, 0, 0.7450981, 1,
1.113792, 0.5442728, 1.058753, 1, 0, 0.7372549, 1,
1.116176, -1.26354, 2.094213, 1, 0, 0.7333333, 1,
1.116198, 0.04997491, 3.402444, 1, 0, 0.7254902, 1,
1.117355, -1.461168, 1.645336, 1, 0, 0.7215686, 1,
1.129183, -2.18739, 4.160583, 1, 0, 0.7137255, 1,
1.133347, -0.2558539, 1.894141, 1, 0, 0.7098039, 1,
1.134482, -1.426574, 2.898281, 1, 0, 0.7019608, 1,
1.134958, -2.80958, 1.230809, 1, 0, 0.6941177, 1,
1.136292, 3.164359, 2.162129, 1, 0, 0.6901961, 1,
1.151427, 0.3272032, 0.5540599, 1, 0, 0.682353, 1,
1.157762, -2.92849, 2.138877, 1, 0, 0.6784314, 1,
1.170991, -0.4096884, 0.7462649, 1, 0, 0.6705883, 1,
1.176783, -2.233029, 2.411517, 1, 0, 0.6666667, 1,
1.177135, -0.9994286, 1.872125, 1, 0, 0.6588235, 1,
1.177758, 1.591855, 0.4880229, 1, 0, 0.654902, 1,
1.182104, 0.862277, 1.364776, 1, 0, 0.6470588, 1,
1.187481, -0.506344, 2.2366, 1, 0, 0.6431373, 1,
1.190748, -1.223962, 4.269216, 1, 0, 0.6352941, 1,
1.191273, -0.703521, 3.095752, 1, 0, 0.6313726, 1,
1.200234, 0.5617729, 2.154045, 1, 0, 0.6235294, 1,
1.200538, 0.08151083, 1.848179, 1, 0, 0.6196079, 1,
1.213387, 0.10312, 0.6560648, 1, 0, 0.6117647, 1,
1.213616, -0.3053808, 0.9388965, 1, 0, 0.6078432, 1,
1.24702, -0.4198638, 2.325707, 1, 0, 0.6, 1,
1.251764, -0.4924109, 0.2672198, 1, 0, 0.5921569, 1,
1.257288, -2.36694, 1.244529, 1, 0, 0.5882353, 1,
1.263167, 2.385148, 0.4778492, 1, 0, 0.5803922, 1,
1.276837, 1.218838, 2.069955, 1, 0, 0.5764706, 1,
1.278135, 1.787246, -1.013101, 1, 0, 0.5686275, 1,
1.284872, 0.4739857, 0.2219208, 1, 0, 0.5647059, 1,
1.291264, 0.587723, 1.214895, 1, 0, 0.5568628, 1,
1.292466, 0.6580315, 0.9489604, 1, 0, 0.5529412, 1,
1.309018, 0.3398356, -1.240101, 1, 0, 0.5450981, 1,
1.315569, 0.4021946, 1.058468, 1, 0, 0.5411765, 1,
1.33737, 0.173954, 1.121085, 1, 0, 0.5333334, 1,
1.338408, 0.264632, 3.056291, 1, 0, 0.5294118, 1,
1.342941, 1.428819, -1.41523, 1, 0, 0.5215687, 1,
1.356036, 0.6831086, 0.9754811, 1, 0, 0.5176471, 1,
1.357404, -1.162531, 2.586935, 1, 0, 0.509804, 1,
1.359269, -0.261251, 0.895248, 1, 0, 0.5058824, 1,
1.365093, 0.1069451, 0.7131038, 1, 0, 0.4980392, 1,
1.369248, 0.2886681, 2.176141, 1, 0, 0.4901961, 1,
1.369745, -0.8154265, 1.016581, 1, 0, 0.4862745, 1,
1.370944, 0.5567172, 2.358654, 1, 0, 0.4784314, 1,
1.376248, 1.311561, 0.2430407, 1, 0, 0.4745098, 1,
1.391847, -0.460697, 0.6710263, 1, 0, 0.4666667, 1,
1.395586, -1.935009, 3.408099, 1, 0, 0.4627451, 1,
1.397158, 2.230954, 1.059635, 1, 0, 0.454902, 1,
1.403655, -2.153013, 3.526541, 1, 0, 0.4509804, 1,
1.414032, -0.4770229, 0.426989, 1, 0, 0.4431373, 1,
1.419954, 0.06859192, 1.568029, 1, 0, 0.4392157, 1,
1.425619, -1.011085, 3.100988, 1, 0, 0.4313726, 1,
1.425706, 1.174648, -1.89396, 1, 0, 0.427451, 1,
1.4432, -2.195194, 1.794103, 1, 0, 0.4196078, 1,
1.443614, 1.749848, 1.1246, 1, 0, 0.4156863, 1,
1.446726, -1.674361, 3.110857, 1, 0, 0.4078431, 1,
1.474313, 1.286571, 2.019734, 1, 0, 0.4039216, 1,
1.477975, 0.3596584, 0.7728497, 1, 0, 0.3960784, 1,
1.485897, 0.8093374, 3.218625, 1, 0, 0.3882353, 1,
1.501502, -1.503283, 1.258312, 1, 0, 0.3843137, 1,
1.506057, -0.07147703, 1.575858, 1, 0, 0.3764706, 1,
1.510875, -0.316831, 3.005441, 1, 0, 0.372549, 1,
1.51091, -0.4361528, 1.52815, 1, 0, 0.3647059, 1,
1.533405, 0.5627993, 2.600653, 1, 0, 0.3607843, 1,
1.53439, -1.857244, 1.018669, 1, 0, 0.3529412, 1,
1.544366, -1.125547, 1.248565, 1, 0, 0.3490196, 1,
1.544884, -1.290735, 1.172149, 1, 0, 0.3411765, 1,
1.550649, 0.08539623, 1.293635, 1, 0, 0.3372549, 1,
1.566041, -0.2796134, 0.5670407, 1, 0, 0.3294118, 1,
1.585874, -0.2840051, 1.766196, 1, 0, 0.3254902, 1,
1.585888, -0.0488484, -0.04880337, 1, 0, 0.3176471, 1,
1.593317, -1.222726, 0.5340505, 1, 0, 0.3137255, 1,
1.638243, -0.6753624, 0.9615115, 1, 0, 0.3058824, 1,
1.639428, -0.3439331, 3.518188, 1, 0, 0.2980392, 1,
1.641256, -0.6150541, 2.517685, 1, 0, 0.2941177, 1,
1.663776, -1.416489, 1.475617, 1, 0, 0.2862745, 1,
1.685458, -0.006178403, 2.341349, 1, 0, 0.282353, 1,
1.687717, 1.076151, 0.6116691, 1, 0, 0.2745098, 1,
1.697077, 0.9049675, 1.564809, 1, 0, 0.2705882, 1,
1.698807, 0.5764124, 0.2164429, 1, 0, 0.2627451, 1,
1.703996, 0.8974903, 2.377753, 1, 0, 0.2588235, 1,
1.706442, 0.1822958, 0.9266787, 1, 0, 0.2509804, 1,
1.740344, -0.5365205, 1.607518, 1, 0, 0.2470588, 1,
1.741717, -0.7624854, 2.170321, 1, 0, 0.2392157, 1,
1.742801, -1.905661, 2.298648, 1, 0, 0.2352941, 1,
1.743711, 1.85159, 0.1303372, 1, 0, 0.227451, 1,
1.75843, -0.1322489, 1.036122, 1, 0, 0.2235294, 1,
1.76378, -0.04042369, 1.586163, 1, 0, 0.2156863, 1,
1.776383, 0.05522539, 2.707573, 1, 0, 0.2117647, 1,
1.784653, -1.79916, 1.596653, 1, 0, 0.2039216, 1,
1.80997, -1.843919, 1.591099, 1, 0, 0.1960784, 1,
1.835063, 0.6765832, 1.125511, 1, 0, 0.1921569, 1,
1.867608, -1.225969, 1.370914, 1, 0, 0.1843137, 1,
1.899444, -1.422576, 3.773674, 1, 0, 0.1803922, 1,
1.902917, -1.762301, 1.473157, 1, 0, 0.172549, 1,
1.906678, 0.2882072, 3.457993, 1, 0, 0.1686275, 1,
1.912502, -0.0974395, 2.000411, 1, 0, 0.1607843, 1,
1.919555, -0.9244184, 1.508269, 1, 0, 0.1568628, 1,
1.923835, -0.007791655, 2.327326, 1, 0, 0.1490196, 1,
1.977767, 0.730186, 3.099125, 1, 0, 0.145098, 1,
1.989189, -0.8041795, 0.9611763, 1, 0, 0.1372549, 1,
2.010364, 0.3676041, 1.223584, 1, 0, 0.1333333, 1,
2.017426, -2.044878, 1.829803, 1, 0, 0.1254902, 1,
2.062029, 1.37456, 0.9330403, 1, 0, 0.1215686, 1,
2.080553, -0.2715891, 1.25941, 1, 0, 0.1137255, 1,
2.137486, 1.808187, 1.285136, 1, 0, 0.1098039, 1,
2.154681, 0.652388, 1.249746, 1, 0, 0.1019608, 1,
2.225932, -1.140755, 1.373532, 1, 0, 0.09411765, 1,
2.237598, -0.7533394, 1.255483, 1, 0, 0.09019608, 1,
2.238744, -1.621254, 1.852118, 1, 0, 0.08235294, 1,
2.239817, 0.2321407, -1.277226, 1, 0, 0.07843138, 1,
2.243293, -0.2377934, 1.264439, 1, 0, 0.07058824, 1,
2.266472, 0.9422334, 0.6732429, 1, 0, 0.06666667, 1,
2.295069, -1.226213, 2.911925, 1, 0, 0.05882353, 1,
2.30514, -0.3476053, 0.4087971, 1, 0, 0.05490196, 1,
2.362768, 1.235591, 1.126421, 1, 0, 0.04705882, 1,
2.476472, 0.08903337, 2.21004, 1, 0, 0.04313726, 1,
2.493299, -0.04760745, 1.286954, 1, 0, 0.03529412, 1,
2.518319, -0.5347244, 2.565295, 1, 0, 0.03137255, 1,
2.544193, 1.598219, 1.314061, 1, 0, 0.02352941, 1,
2.587137, -3.291298, 3.196314, 1, 0, 0.01960784, 1,
2.759923, 0.7454913, 0.5296423, 1, 0, 0.01176471, 1,
2.879714, -1.383618, 1.772695, 1, 0, 0.007843138, 1
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
0.09777951, -4.41731, -8.078319, 0, -0.5, 0.5, 0.5,
0.09777951, -4.41731, -8.078319, 1, -0.5, 0.5, 0.5,
0.09777951, -4.41731, -8.078319, 1, 1.5, 0.5, 0.5,
0.09777951, -4.41731, -8.078319, 0, 1.5, 0.5, 0.5
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
-3.627231, 0.03027356, -8.078319, 0, -0.5, 0.5, 0.5,
-3.627231, 0.03027356, -8.078319, 1, -0.5, 0.5, 0.5,
-3.627231, 0.03027356, -8.078319, 1, 1.5, 0.5, 0.5,
-3.627231, 0.03027356, -8.078319, 0, 1.5, 0.5, 0.5
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
-3.627231, -4.41731, -0.0110147, 0, -0.5, 0.5, 0.5,
-3.627231, -4.41731, -0.0110147, 1, -0.5, 0.5, 0.5,
-3.627231, -4.41731, -0.0110147, 1, 1.5, 0.5, 0.5,
-3.627231, -4.41731, -0.0110147, 0, 1.5, 0.5, 0.5
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
-2, -3.390945, -6.216633,
2, -3.390945, -6.216633,
-2, -3.390945, -6.216633,
-2, -3.562006, -6.526914,
-1, -3.390945, -6.216633,
-1, -3.562006, -6.526914,
0, -3.390945, -6.216633,
0, -3.562006, -6.526914,
1, -3.390945, -6.216633,
1, -3.562006, -6.526914,
2, -3.390945, -6.216633,
2, -3.562006, -6.526914
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
-2, -3.904128, -7.147476, 0, -0.5, 0.5, 0.5,
-2, -3.904128, -7.147476, 1, -0.5, 0.5, 0.5,
-2, -3.904128, -7.147476, 1, 1.5, 0.5, 0.5,
-2, -3.904128, -7.147476, 0, 1.5, 0.5, 0.5,
-1, -3.904128, -7.147476, 0, -0.5, 0.5, 0.5,
-1, -3.904128, -7.147476, 1, -0.5, 0.5, 0.5,
-1, -3.904128, -7.147476, 1, 1.5, 0.5, 0.5,
-1, -3.904128, -7.147476, 0, 1.5, 0.5, 0.5,
0, -3.904128, -7.147476, 0, -0.5, 0.5, 0.5,
0, -3.904128, -7.147476, 1, -0.5, 0.5, 0.5,
0, -3.904128, -7.147476, 1, 1.5, 0.5, 0.5,
0, -3.904128, -7.147476, 0, 1.5, 0.5, 0.5,
1, -3.904128, -7.147476, 0, -0.5, 0.5, 0.5,
1, -3.904128, -7.147476, 1, -0.5, 0.5, 0.5,
1, -3.904128, -7.147476, 1, 1.5, 0.5, 0.5,
1, -3.904128, -7.147476, 0, 1.5, 0.5, 0.5,
2, -3.904128, -7.147476, 0, -0.5, 0.5, 0.5,
2, -3.904128, -7.147476, 1, -0.5, 0.5, 0.5,
2, -3.904128, -7.147476, 1, 1.5, 0.5, 0.5,
2, -3.904128, -7.147476, 0, 1.5, 0.5, 0.5
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
-2.767613, -3, -6.216633,
-2.767613, 3, -6.216633,
-2.767613, -3, -6.216633,
-2.910883, -3, -6.526914,
-2.767613, -2, -6.216633,
-2.910883, -2, -6.526914,
-2.767613, -1, -6.216633,
-2.910883, -1, -6.526914,
-2.767613, 0, -6.216633,
-2.910883, 0, -6.526914,
-2.767613, 1, -6.216633,
-2.910883, 1, -6.526914,
-2.767613, 2, -6.216633,
-2.910883, 2, -6.526914,
-2.767613, 3, -6.216633,
-2.910883, 3, -6.526914
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
-3.197422, -3, -7.147476, 0, -0.5, 0.5, 0.5,
-3.197422, -3, -7.147476, 1, -0.5, 0.5, 0.5,
-3.197422, -3, -7.147476, 1, 1.5, 0.5, 0.5,
-3.197422, -3, -7.147476, 0, 1.5, 0.5, 0.5,
-3.197422, -2, -7.147476, 0, -0.5, 0.5, 0.5,
-3.197422, -2, -7.147476, 1, -0.5, 0.5, 0.5,
-3.197422, -2, -7.147476, 1, 1.5, 0.5, 0.5,
-3.197422, -2, -7.147476, 0, 1.5, 0.5, 0.5,
-3.197422, -1, -7.147476, 0, -0.5, 0.5, 0.5,
-3.197422, -1, -7.147476, 1, -0.5, 0.5, 0.5,
-3.197422, -1, -7.147476, 1, 1.5, 0.5, 0.5,
-3.197422, -1, -7.147476, 0, 1.5, 0.5, 0.5,
-3.197422, 0, -7.147476, 0, -0.5, 0.5, 0.5,
-3.197422, 0, -7.147476, 1, -0.5, 0.5, 0.5,
-3.197422, 0, -7.147476, 1, 1.5, 0.5, 0.5,
-3.197422, 0, -7.147476, 0, 1.5, 0.5, 0.5,
-3.197422, 1, -7.147476, 0, -0.5, 0.5, 0.5,
-3.197422, 1, -7.147476, 1, -0.5, 0.5, 0.5,
-3.197422, 1, -7.147476, 1, 1.5, 0.5, 0.5,
-3.197422, 1, -7.147476, 0, 1.5, 0.5, 0.5,
-3.197422, 2, -7.147476, 0, -0.5, 0.5, 0.5,
-3.197422, 2, -7.147476, 1, -0.5, 0.5, 0.5,
-3.197422, 2, -7.147476, 1, 1.5, 0.5, 0.5,
-3.197422, 2, -7.147476, 0, 1.5, 0.5, 0.5,
-3.197422, 3, -7.147476, 0, -0.5, 0.5, 0.5,
-3.197422, 3, -7.147476, 1, -0.5, 0.5, 0.5,
-3.197422, 3, -7.147476, 1, 1.5, 0.5, 0.5,
-3.197422, 3, -7.147476, 0, 1.5, 0.5, 0.5
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
-2.767613, -3.390945, -6,
-2.767613, -3.390945, 6,
-2.767613, -3.390945, -6,
-2.910883, -3.562006, -6,
-2.767613, -3.390945, -4,
-2.910883, -3.562006, -4,
-2.767613, -3.390945, -2,
-2.910883, -3.562006, -2,
-2.767613, -3.390945, 0,
-2.910883, -3.562006, 0,
-2.767613, -3.390945, 2,
-2.910883, -3.562006, 2,
-2.767613, -3.390945, 4,
-2.910883, -3.562006, 4,
-2.767613, -3.390945, 6,
-2.910883, -3.562006, 6
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
"4",
"6"
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
-3.197422, -3.904128, -6, 0, -0.5, 0.5, 0.5,
-3.197422, -3.904128, -6, 1, -0.5, 0.5, 0.5,
-3.197422, -3.904128, -6, 1, 1.5, 0.5, 0.5,
-3.197422, -3.904128, -6, 0, 1.5, 0.5, 0.5,
-3.197422, -3.904128, -4, 0, -0.5, 0.5, 0.5,
-3.197422, -3.904128, -4, 1, -0.5, 0.5, 0.5,
-3.197422, -3.904128, -4, 1, 1.5, 0.5, 0.5,
-3.197422, -3.904128, -4, 0, 1.5, 0.5, 0.5,
-3.197422, -3.904128, -2, 0, -0.5, 0.5, 0.5,
-3.197422, -3.904128, -2, 1, -0.5, 0.5, 0.5,
-3.197422, -3.904128, -2, 1, 1.5, 0.5, 0.5,
-3.197422, -3.904128, -2, 0, 1.5, 0.5, 0.5,
-3.197422, -3.904128, 0, 0, -0.5, 0.5, 0.5,
-3.197422, -3.904128, 0, 1, -0.5, 0.5, 0.5,
-3.197422, -3.904128, 0, 1, 1.5, 0.5, 0.5,
-3.197422, -3.904128, 0, 0, 1.5, 0.5, 0.5,
-3.197422, -3.904128, 2, 0, -0.5, 0.5, 0.5,
-3.197422, -3.904128, 2, 1, -0.5, 0.5, 0.5,
-3.197422, -3.904128, 2, 1, 1.5, 0.5, 0.5,
-3.197422, -3.904128, 2, 0, 1.5, 0.5, 0.5,
-3.197422, -3.904128, 4, 0, -0.5, 0.5, 0.5,
-3.197422, -3.904128, 4, 1, -0.5, 0.5, 0.5,
-3.197422, -3.904128, 4, 1, 1.5, 0.5, 0.5,
-3.197422, -3.904128, 4, 0, 1.5, 0.5, 0.5,
-3.197422, -3.904128, 6, 0, -0.5, 0.5, 0.5,
-3.197422, -3.904128, 6, 1, -0.5, 0.5, 0.5,
-3.197422, -3.904128, 6, 1, 1.5, 0.5, 0.5,
-3.197422, -3.904128, 6, 0, 1.5, 0.5, 0.5
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
-2.767613, -3.390945, -6.216633,
-2.767613, 3.451492, -6.216633,
-2.767613, -3.390945, 6.194603,
-2.767613, 3.451492, 6.194603,
-2.767613, -3.390945, -6.216633,
-2.767613, -3.390945, 6.194603,
-2.767613, 3.451492, -6.216633,
-2.767613, 3.451492, 6.194603,
-2.767613, -3.390945, -6.216633,
2.963172, -3.390945, -6.216633,
-2.767613, -3.390945, 6.194603,
2.963172, -3.390945, 6.194603,
-2.767613, 3.451492, -6.216633,
2.963172, 3.451492, -6.216633,
-2.767613, 3.451492, 6.194603,
2.963172, 3.451492, 6.194603,
2.963172, -3.390945, -6.216633,
2.963172, 3.451492, -6.216633,
2.963172, -3.390945, 6.194603,
2.963172, 3.451492, 6.194603,
2.963172, -3.390945, -6.216633,
2.963172, -3.390945, 6.194603,
2.963172, 3.451492, -6.216633,
2.963172, 3.451492, 6.194603
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
var radius = 8.163088;
var distance = 36.3185;
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
mvMatrix.translate( -0.09777951, -0.03027356, 0.0110147 );
mvMatrix.scale( 1.540119, 1.289905, 0.7111371 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.3185);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
MPMC<-read.table("MPMC.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-MPMC$V2
```

```
## Error in eval(expr, envir, enclos): object 'MPMC' not found
```

```r
y<-MPMC$V3
```

```
## Error in eval(expr, envir, enclos): object 'MPMC' not found
```

```r
z<-MPMC$V4
```

```
## Error in eval(expr, envir, enclos): object 'MPMC' not found
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
-2.684155, -1.312954, -1.884234, 0, 0, 1, 1, 1,
-2.587862, -0.9837527, -1.770684, 1, 0, 0, 1, 1,
-2.582392, -1.265826, -2.455694, 1, 0, 0, 1, 1,
-2.529316, -0.4539035, -0.5803874, 1, 0, 0, 1, 1,
-2.498674, 0.2423985, -2.286893, 1, 0, 0, 1, 1,
-2.44181, -2.15709, -2.74207, 1, 0, 0, 1, 1,
-2.386663, -0.9633776, -3.241603, 0, 0, 0, 1, 1,
-2.378028, -0.6516476, -1.700789, 0, 0, 0, 1, 1,
-2.352785, -0.03735981, -1.063932, 0, 0, 0, 1, 1,
-2.346894, 2.137032, -0.799728, 0, 0, 0, 1, 1,
-2.344226, -0.355687, -2.739179, 0, 0, 0, 1, 1,
-2.2789, 0.9854961, -0.7160481, 0, 0, 0, 1, 1,
-2.277455, -0.1467649, -2.387763, 0, 0, 0, 1, 1,
-2.226303, -1.47644, -0.3060248, 1, 1, 1, 1, 1,
-2.17759, 3.351845, -0.6142364, 1, 1, 1, 1, 1,
-2.163096, 1.295379, -1.874624, 1, 1, 1, 1, 1,
-2.157684, 0.7037392, -1.016957, 1, 1, 1, 1, 1,
-2.140132, 0.8348539, 0.1829417, 1, 1, 1, 1, 1,
-2.117188, -1.099698, -4.95743, 1, 1, 1, 1, 1,
-2.092981, -1.10011, -2.039758, 1, 1, 1, 1, 1,
-2.05036, 0.2488565, -1.998201, 1, 1, 1, 1, 1,
-2.048568, 0.3502258, -0.9236594, 1, 1, 1, 1, 1,
-2.000062, -0.2173223, -0.2962528, 1, 1, 1, 1, 1,
-1.948224, 0.5412284, -1.225608, 1, 1, 1, 1, 1,
-1.928685, 1.155458, -0.5266477, 1, 1, 1, 1, 1,
-1.917419, 0.2582342, 0.7660484, 1, 1, 1, 1, 1,
-1.882847, -0.1777535, -2.177342, 1, 1, 1, 1, 1,
-1.878318, -0.5444644, -1.66626, 1, 1, 1, 1, 1,
-1.875384, -0.8044805, -2.552322, 0, 0, 1, 1, 1,
-1.864317, 0.1817259, -3.388141, 1, 0, 0, 1, 1,
-1.842427, 1.363141, -1.410383, 1, 0, 0, 1, 1,
-1.825959, 0.8610132, -2.502638, 1, 0, 0, 1, 1,
-1.790193, -0.1392873, 1.750633, 1, 0, 0, 1, 1,
-1.774729, 0.2157962, -1.802766, 1, 0, 0, 1, 1,
-1.761788, 0.1485446, -2.325158, 0, 0, 0, 1, 1,
-1.737375, 0.4846435, -1.974418, 0, 0, 0, 1, 1,
-1.732609, -1.420306, -1.76665, 0, 0, 0, 1, 1,
-1.730969, 0.4762867, -1.104753, 0, 0, 0, 1, 1,
-1.725816, 0.8348624, -1.656263, 0, 0, 0, 1, 1,
-1.714695, 1.553674, -0.1195019, 0, 0, 0, 1, 1,
-1.712874, -0.7023211, -2.718254, 0, 0, 0, 1, 1,
-1.704915, 0.5452937, -1.061658, 1, 1, 1, 1, 1,
-1.703483, -0.4195636, -2.145299, 1, 1, 1, 1, 1,
-1.703173, -0.1461099, -2.048649, 1, 1, 1, 1, 1,
-1.686138, 1.708216, -0.4500123, 1, 1, 1, 1, 1,
-1.668414, 0.6836333, -1.180387, 1, 1, 1, 1, 1,
-1.655323, 0.1644878, -2.507727, 1, 1, 1, 1, 1,
-1.654004, -0.4773724, -2.462672, 1, 1, 1, 1, 1,
-1.645312, -1.098107, -2.243979, 1, 1, 1, 1, 1,
-1.644066, 0.4624909, -0.6014503, 1, 1, 1, 1, 1,
-1.64153, 0.1160273, -2.255872, 1, 1, 1, 1, 1,
-1.600284, -0.7502599, -1.523973, 1, 1, 1, 1, 1,
-1.586579, -0.2022613, -1.989675, 1, 1, 1, 1, 1,
-1.57575, -0.4516719, -0.8913276, 1, 1, 1, 1, 1,
-1.560633, 1.446994, -0.3686816, 1, 1, 1, 1, 1,
-1.553354, -1.181096, -1.703124, 1, 1, 1, 1, 1,
-1.540335, -1.468667, -2.206187, 0, 0, 1, 1, 1,
-1.536382, -0.2832124, -1.40793, 1, 0, 0, 1, 1,
-1.53471, -1.536483, -2.359474, 1, 0, 0, 1, 1,
-1.529603, -0.5397793, -2.863855, 1, 0, 0, 1, 1,
-1.517861, 0.6991711, -0.0460282, 1, 0, 0, 1, 1,
-1.512709, 0.2579216, -0.9476847, 1, 0, 0, 1, 1,
-1.497208, 0.1324782, -2.116601, 0, 0, 0, 1, 1,
-1.493131, -1.455261, -2.632869, 0, 0, 0, 1, 1,
-1.488013, 0.7286683, 0.09926932, 0, 0, 0, 1, 1,
-1.486468, -0.9718493, -2.534223, 0, 0, 0, 1, 1,
-1.48628, 1.121829, -0.6471666, 0, 0, 0, 1, 1,
-1.481175, -0.7339116, -0.9741746, 0, 0, 0, 1, 1,
-1.461436, 0.3060496, 0.4807387, 0, 0, 0, 1, 1,
-1.449073, -0.5705031, -2.222486, 1, 1, 1, 1, 1,
-1.448095, -0.8061843, -0.3319185, 1, 1, 1, 1, 1,
-1.446818, -0.3981694, -0.8079714, 1, 1, 1, 1, 1,
-1.437645, -0.9861058, -4.124324, 1, 1, 1, 1, 1,
-1.435592, -1.222353, -2.628495, 1, 1, 1, 1, 1,
-1.431907, 0.09337132, -0.8974636, 1, 1, 1, 1, 1,
-1.422059, 1.595933, 0.08069465, 1, 1, 1, 1, 1,
-1.421944, 0.08805528, -1.819456, 1, 1, 1, 1, 1,
-1.387723, -0.3522997, -0.9334384, 1, 1, 1, 1, 1,
-1.381315, 0.9449463, 0.2759405, 1, 1, 1, 1, 1,
-1.379536, 0.1367109, -1.766544, 1, 1, 1, 1, 1,
-1.378032, -0.83114, -2.110693, 1, 1, 1, 1, 1,
-1.374493, 1.070913, -1.73396, 1, 1, 1, 1, 1,
-1.373167, -1.617199, -1.307968, 1, 1, 1, 1, 1,
-1.347652, -0.6356879, -2.304991, 1, 1, 1, 1, 1,
-1.338243, -0.0740864, -1.224022, 0, 0, 1, 1, 1,
-1.336126, -0.7596346, -2.619749, 1, 0, 0, 1, 1,
-1.330967, -1.219378, -2.485257, 1, 0, 0, 1, 1,
-1.326318, 0.02720411, -1.54785, 1, 0, 0, 1, 1,
-1.324381, -1.124496, -1.142853, 1, 0, 0, 1, 1,
-1.312186, 0.09512809, -0.517297, 1, 0, 0, 1, 1,
-1.310248, -1.515591, -0.260427, 0, 0, 0, 1, 1,
-1.303493, -0.4648188, -0.4770492, 0, 0, 0, 1, 1,
-1.302536, -0.4356764, -1.802975, 0, 0, 0, 1, 1,
-1.301341, 0.4881976, -0.3569648, 0, 0, 0, 1, 1,
-1.300608, 1.015985, -1.089323, 0, 0, 0, 1, 1,
-1.298414, -1.058641, -1.75761, 0, 0, 0, 1, 1,
-1.292732, 2.364994, -0.3800678, 0, 0, 0, 1, 1,
-1.282221, -0.8060602, 0.3558234, 1, 1, 1, 1, 1,
-1.271461, 0.7560674, 0.09727738, 1, 1, 1, 1, 1,
-1.266635, 0.676326, -2.236684, 1, 1, 1, 1, 1,
-1.262664, -0.2849326, -1.212199, 1, 1, 1, 1, 1,
-1.250392, 0.2561208, -1.554489, 1, 1, 1, 1, 1,
-1.239425, 0.5905434, -2.760153, 1, 1, 1, 1, 1,
-1.234772, 1.017534, -1.015852, 1, 1, 1, 1, 1,
-1.230592, 2.046479, -1.492126, 1, 1, 1, 1, 1,
-1.219547, -1.27309, -0.4280205, 1, 1, 1, 1, 1,
-1.21534, -0.4556254, -0.2103225, 1, 1, 1, 1, 1,
-1.207204, -0.4286319, -1.654514, 1, 1, 1, 1, 1,
-1.205115, -0.2062374, -0.9179752, 1, 1, 1, 1, 1,
-1.20461, 0.4364584, -2.106578, 1, 1, 1, 1, 1,
-1.201405, 0.601343, -1.071007, 1, 1, 1, 1, 1,
-1.19628, 1.012688, -0.2792508, 1, 1, 1, 1, 1,
-1.19058, 1.347639, -3.2397, 0, 0, 1, 1, 1,
-1.187443, -0.5522301, -3.051395, 1, 0, 0, 1, 1,
-1.187412, 1.009781, -1.89155, 1, 0, 0, 1, 1,
-1.174213, -0.6071411, -2.877621, 1, 0, 0, 1, 1,
-1.168078, -1.199625, -1.897912, 1, 0, 0, 1, 1,
-1.167704, -0.3067142, -1.767849, 1, 0, 0, 1, 1,
-1.162815, -0.4265419, -2.311315, 0, 0, 0, 1, 1,
-1.162673, -0.4267617, -2.22368, 0, 0, 0, 1, 1,
-1.161918, -0.1291663, -2.801761, 0, 0, 0, 1, 1,
-1.160097, -0.1401137, -0.4847722, 0, 0, 0, 1, 1,
-1.154806, -2.185974, -2.251215, 0, 0, 0, 1, 1,
-1.139223, 1.447603, 0.4497487, 0, 0, 0, 1, 1,
-1.12799, -0.12331, -2.953417, 0, 0, 0, 1, 1,
-1.127529, -0.1498546, -0.7248424, 1, 1, 1, 1, 1,
-1.125744, -1.109316, -3.368201, 1, 1, 1, 1, 1,
-1.122373, 0.4423831, -0.5405342, 1, 1, 1, 1, 1,
-1.121175, -0.8922052, -1.833988, 1, 1, 1, 1, 1,
-1.120563, -1.779189, -1.962223, 1, 1, 1, 1, 1,
-1.1203, -1.106162, -0.6795555, 1, 1, 1, 1, 1,
-1.119096, 1.431757, -1.906092, 1, 1, 1, 1, 1,
-1.086967, -0.8655599, -0.2801667, 1, 1, 1, 1, 1,
-1.085908, 0.2690069, -2.42966, 1, 1, 1, 1, 1,
-1.085183, 0.02666919, -1.110922, 1, 1, 1, 1, 1,
-1.08236, -0.2021622, -2.629192, 1, 1, 1, 1, 1,
-1.076907, 0.778731, -1.597191, 1, 1, 1, 1, 1,
-1.07193, 2.4422, -0.8740904, 1, 1, 1, 1, 1,
-1.071696, -0.6881482, -0.8685961, 1, 1, 1, 1, 1,
-1.068762, -0.3536679, -3.652933, 1, 1, 1, 1, 1,
-1.068659, -0.3191851, -2.186787, 0, 0, 1, 1, 1,
-1.066817, -0.1505843, -2.041631, 1, 0, 0, 1, 1,
-1.064909, -0.3047935, -0.7793798, 1, 0, 0, 1, 1,
-1.064225, 0.962103, 0.6056201, 1, 0, 0, 1, 1,
-1.062124, 0.09932104, -2.120786, 1, 0, 0, 1, 1,
-1.054475, -0.5548742, -0.5365877, 1, 0, 0, 1, 1,
-1.050773, -1.320883, -3.204369, 0, 0, 0, 1, 1,
-1.050005, -0.3122828, -0.4156913, 0, 0, 0, 1, 1,
-1.049609, -0.3258544, -1.998214, 0, 0, 0, 1, 1,
-1.045638, 0.791946, -0.02273321, 0, 0, 0, 1, 1,
-1.044446, 0.5394784, -0.2447782, 0, 0, 0, 1, 1,
-1.041171, 1.504592, -0.940266, 0, 0, 0, 1, 1,
-1.023141, 0.1651772, -0.556506, 0, 0, 0, 1, 1,
-1.02206, -0.1834998, -1.132208, 1, 1, 1, 1, 1,
-1.017764, -0.6682447, -2.598691, 1, 1, 1, 1, 1,
-1.013546, 0.358357, 0.8941292, 1, 1, 1, 1, 1,
-1.007995, -0.2549217, -0.6396049, 1, 1, 1, 1, 1,
-0.993149, -1.452642, -4.119488, 1, 1, 1, 1, 1,
-0.9919038, -0.06685243, -1.036863, 1, 1, 1, 1, 1,
-0.9916767, 1.97944, -0.9063472, 1, 1, 1, 1, 1,
-0.9908139, 0.3962019, 0.09203184, 1, 1, 1, 1, 1,
-0.9892658, -0.1389485, -2.664455, 1, 1, 1, 1, 1,
-0.9889596, 0.6743215, 0.3865507, 1, 1, 1, 1, 1,
-0.9884967, 0.427081, -1.652993, 1, 1, 1, 1, 1,
-0.9807228, -0.6260103, -1.523939, 1, 1, 1, 1, 1,
-0.9758623, 1.066191, -1.082811, 1, 1, 1, 1, 1,
-0.9749374, -0.6804499, -2.051768, 1, 1, 1, 1, 1,
-0.9730875, -0.4320047, -2.78082, 1, 1, 1, 1, 1,
-0.9697, 1.387841, -0.6033256, 0, 0, 1, 1, 1,
-0.9679852, -0.1513152, -1.592132, 1, 0, 0, 1, 1,
-0.9674857, -0.7805529, -2.721226, 1, 0, 0, 1, 1,
-0.9571874, 1.295174, -0.2210018, 1, 0, 0, 1, 1,
-0.9556467, 0.5689989, -1.831198, 1, 0, 0, 1, 1,
-0.9518203, -0.5441357, -1.942661, 1, 0, 0, 1, 1,
-0.9454505, -0.5922185, -3.862781, 0, 0, 0, 1, 1,
-0.9436867, -0.1031911, -0.681859, 0, 0, 0, 1, 1,
-0.9436378, 1.716867, -0.2600909, 0, 0, 0, 1, 1,
-0.9413387, -0.1161839, -2.945896, 0, 0, 0, 1, 1,
-0.9400468, 1.573934, -1.168051, 0, 0, 0, 1, 1,
-0.9367728, 1.497735, -0.007444167, 0, 0, 0, 1, 1,
-0.9365398, 1.744326, -1.585716, 0, 0, 0, 1, 1,
-0.9278448, 0.1326758, -1.867335, 1, 1, 1, 1, 1,
-0.9276152, 1.920491, 0.7012647, 1, 1, 1, 1, 1,
-0.9264287, 0.9016679, -0.5948086, 1, 1, 1, 1, 1,
-0.920253, 0.6268752, -0.7598348, 1, 1, 1, 1, 1,
-0.9188494, -1.60902, -3.668917, 1, 1, 1, 1, 1,
-0.9105717, -0.06460591, -0.6416884, 1, 1, 1, 1, 1,
-0.9100534, 0.3074999, -3.856225, 1, 1, 1, 1, 1,
-0.905808, 0.2566092, 0.5621089, 1, 1, 1, 1, 1,
-0.9045165, -0.8469769, -1.162943, 1, 1, 1, 1, 1,
-0.9038754, 1.83913, -1.342247, 1, 1, 1, 1, 1,
-0.8957661, 0.5828991, -1.47584, 1, 1, 1, 1, 1,
-0.8950705, 0.414771, -2.299423, 1, 1, 1, 1, 1,
-0.8912331, 0.2825955, -1.2667, 1, 1, 1, 1, 1,
-0.8845683, -0.4419272, -1.564716, 1, 1, 1, 1, 1,
-0.8801616, 0.1809635, -0.6313368, 1, 1, 1, 1, 1,
-0.8797689, -0.4389089, -2.744304, 0, 0, 1, 1, 1,
-0.8793532, -0.5306118, -1.297502, 1, 0, 0, 1, 1,
-0.8739167, -0.8744117, -2.295923, 1, 0, 0, 1, 1,
-0.8719117, -0.09455525, -1.947881, 1, 0, 0, 1, 1,
-0.8687082, -0.4243626, -1.620283, 1, 0, 0, 1, 1,
-0.8614994, 1.062137, 0.09324188, 1, 0, 0, 1, 1,
-0.8594481, 2.756763, 0.4970421, 0, 0, 0, 1, 1,
-0.8555788, 0.6087574, -0.979421, 0, 0, 0, 1, 1,
-0.8523303, -0.3639113, -3.626329, 0, 0, 0, 1, 1,
-0.8491257, -0.1271276, -3.016848, 0, 0, 0, 1, 1,
-0.8451048, -0.7405851, -1.536104, 0, 0, 0, 1, 1,
-0.8444851, 0.1438718, -1.792539, 0, 0, 0, 1, 1,
-0.84233, -0.197489, -1.23429, 0, 0, 0, 1, 1,
-0.8390073, 0.6913879, -2.211405, 1, 1, 1, 1, 1,
-0.8369527, -0.243146, -3.327153, 1, 1, 1, 1, 1,
-0.8337362, -0.1287599, -1.110608, 1, 1, 1, 1, 1,
-0.8298016, 1.43221, 0.5272081, 1, 1, 1, 1, 1,
-0.825216, 0.09297206, -1.898167, 1, 1, 1, 1, 1,
-0.8198376, 0.6129819, -1.042556, 1, 1, 1, 1, 1,
-0.8165086, -0.02186865, -3.215268, 1, 1, 1, 1, 1,
-0.8097574, -1.037225, -1.41149, 1, 1, 1, 1, 1,
-0.8010647, -1.454403, -3.731717, 1, 1, 1, 1, 1,
-0.7987227, -0.8629541, -2.008987, 1, 1, 1, 1, 1,
-0.797755, 2.154677, -0.2368259, 1, 1, 1, 1, 1,
-0.79469, 0.3463553, 0.01095111, 1, 1, 1, 1, 1,
-0.7920251, -0.7580492, -3.520405, 1, 1, 1, 1, 1,
-0.7905712, 0.2146349, -2.253142, 1, 1, 1, 1, 1,
-0.7827488, 0.7364168, -0.9430014, 1, 1, 1, 1, 1,
-0.7816848, -0.511348, -2.693992, 0, 0, 1, 1, 1,
-0.7803859, -0.4283025, -0.3978777, 1, 0, 0, 1, 1,
-0.779501, -0.6198055, -3.825808, 1, 0, 0, 1, 1,
-0.7787408, -1.490664, -3.537439, 1, 0, 0, 1, 1,
-0.7767229, -1.174316, -1.83027, 1, 0, 0, 1, 1,
-0.7750187, 0.5520531, -1.728605, 1, 0, 0, 1, 1,
-0.7724162, 0.9678839, -1.439105, 0, 0, 0, 1, 1,
-0.7612203, -1.17897, -2.743815, 0, 0, 0, 1, 1,
-0.7557836, 0.1529011, -0.4464421, 0, 0, 0, 1, 1,
-0.7546713, -0.3214487, -2.429373, 0, 0, 0, 1, 1,
-0.7478729, -1.854315, 0.1384925, 0, 0, 0, 1, 1,
-0.7432433, 0.3849338, -1.138701, 0, 0, 0, 1, 1,
-0.742451, -0.4589829, -3.08247, 0, 0, 0, 1, 1,
-0.7417359, -0.3308784, -1.025178, 1, 1, 1, 1, 1,
-0.7395717, -1.090548, -3.69828, 1, 1, 1, 1, 1,
-0.7360017, -1.471588, -2.673243, 1, 1, 1, 1, 1,
-0.7337726, -1.705398, -2.799339, 1, 1, 1, 1, 1,
-0.7334495, -1.683648, -1.813663, 1, 1, 1, 1, 1,
-0.7300178, -0.4633234, -2.662309, 1, 1, 1, 1, 1,
-0.7283158, -0.08839799, -2.507764, 1, 1, 1, 1, 1,
-0.7250732, 0.01187268, -2.517854, 1, 1, 1, 1, 1,
-0.7242557, 0.1204645, -2.799479, 1, 1, 1, 1, 1,
-0.7205638, -1.391381, -3.609416, 1, 1, 1, 1, 1,
-0.7150693, 0.1489032, -2.832268, 1, 1, 1, 1, 1,
-0.7133668, -1.423126, -3.345326, 1, 1, 1, 1, 1,
-0.7131667, 0.2177787, -0.4280623, 1, 1, 1, 1, 1,
-0.7124349, 1.864934, -0.4821508, 1, 1, 1, 1, 1,
-0.7062432, -0.04930185, -1.794773, 1, 1, 1, 1, 1,
-0.7004753, -1.669266, -2.907486, 0, 0, 1, 1, 1,
-0.6961724, 0.9497077, -0.5078329, 1, 0, 0, 1, 1,
-0.6904904, 0.9526656, -0.1563412, 1, 0, 0, 1, 1,
-0.6896636, 0.5483983, -0.7778143, 1, 0, 0, 1, 1,
-0.6875169, -0.6226807, -1.828264, 1, 0, 0, 1, 1,
-0.6844904, 0.5525442, -0.7563051, 1, 0, 0, 1, 1,
-0.679781, -1.01468, -2.106314, 0, 0, 0, 1, 1,
-0.6693633, -0.9717507, -2.817341, 0, 0, 0, 1, 1,
-0.665648, -1.049263, -2.774442, 0, 0, 0, 1, 1,
-0.6653323, -1.584223, -3.29308, 0, 0, 0, 1, 1,
-0.659714, -0.5922635, -1.896061, 0, 0, 0, 1, 1,
-0.6570603, -0.6675616, -1.416997, 0, 0, 0, 1, 1,
-0.6569482, 1.296043, 1.924908, 0, 0, 0, 1, 1,
-0.6559158, 0.5984538, -0.1346987, 1, 1, 1, 1, 1,
-0.648835, 0.2274177, -2.61299, 1, 1, 1, 1, 1,
-0.6474501, 3.337567, -0.4467176, 1, 1, 1, 1, 1,
-0.64461, 0.2863987, -0.6823892, 1, 1, 1, 1, 1,
-0.6410952, 0.9373542, -0.6333962, 1, 1, 1, 1, 1,
-0.6381074, 1.178901, -0.9822097, 1, 1, 1, 1, 1,
-0.6359521, 0.6497613, -1.057163, 1, 1, 1, 1, 1,
-0.6351366, -1.062358, -2.134544, 1, 1, 1, 1, 1,
-0.634663, -0.2426038, -0.3933077, 1, 1, 1, 1, 1,
-0.6239904, 0.2682321, -1.380738, 1, 1, 1, 1, 1,
-0.6226613, 0.3215517, -0.921719, 1, 1, 1, 1, 1,
-0.6211604, 1.356364, -0.5419202, 1, 1, 1, 1, 1,
-0.6158486, 0.1812556, -0.9662868, 1, 1, 1, 1, 1,
-0.6129793, 0.2168893, -1.755654, 1, 1, 1, 1, 1,
-0.6107034, 0.9950786, -0.6623973, 1, 1, 1, 1, 1,
-0.6021831, 0.4962987, 0.5852562, 0, 0, 1, 1, 1,
-0.6016874, -1.073077, -2.199162, 1, 0, 0, 1, 1,
-0.6002674, 0.8843083, -0.1363, 1, 0, 0, 1, 1,
-0.5975107, -1.216284, -2.202446, 1, 0, 0, 1, 1,
-0.5964426, -0.4787502, -0.1571142, 1, 0, 0, 1, 1,
-0.591715, 0.2813329, -0.7821382, 1, 0, 0, 1, 1,
-0.5868282, 0.8813357, -0.7342285, 0, 0, 0, 1, 1,
-0.5860398, 1.176042, -0.5437197, 0, 0, 0, 1, 1,
-0.5831892, 0.2512918, 0.4334281, 0, 0, 0, 1, 1,
-0.5791461, -2.302157, -3.028339, 0, 0, 0, 1, 1,
-0.5758389, -0.05152222, -0.8611358, 0, 0, 0, 1, 1,
-0.5735131, 0.09826403, -0.6847292, 0, 0, 0, 1, 1,
-0.5732204, 0.3122101, -2.658079, 0, 0, 0, 1, 1,
-0.5726232, 1.145774, 1.366461, 1, 1, 1, 1, 1,
-0.5722442, -0.1636532, -1.799909, 1, 1, 1, 1, 1,
-0.5641977, 0.323816, -2.101494, 1, 1, 1, 1, 1,
-0.5620379, -1.068736, -2.876215, 1, 1, 1, 1, 1,
-0.5599882, -0.313233, -3.049107, 1, 1, 1, 1, 1,
-0.5551869, 0.7091903, 0.1632188, 1, 1, 1, 1, 1,
-0.5544004, 0.1462686, -1.942052, 1, 1, 1, 1, 1,
-0.5499861, -0.714171, -2.087936, 1, 1, 1, 1, 1,
-0.5459643, 0.5615086, 0.536308, 1, 1, 1, 1, 1,
-0.5364439, 0.6258622, -0.1879841, 1, 1, 1, 1, 1,
-0.531473, -0.5057892, -1.775318, 1, 1, 1, 1, 1,
-0.5297877, -0.1966302, -3.916037, 1, 1, 1, 1, 1,
-0.5271029, 0.05679547, -0.7853116, 1, 1, 1, 1, 1,
-0.5236177, -0.4154645, -1.96218, 1, 1, 1, 1, 1,
-0.5229722, 1.019563, -1.182686, 1, 1, 1, 1, 1,
-0.5149364, -1.207848, -0.1027275, 0, 0, 1, 1, 1,
-0.5135444, 1.970333, 1.159423, 1, 0, 0, 1, 1,
-0.5100664, 0.5192706, -3.338877, 1, 0, 0, 1, 1,
-0.5071713, 2.256791, -0.3054177, 1, 0, 0, 1, 1,
-0.5054867, -0.4046935, -3.464141, 1, 0, 0, 1, 1,
-0.5042623, -0.6283697, -1.532868, 1, 0, 0, 1, 1,
-0.4987788, -1.931491, -3.061816, 0, 0, 0, 1, 1,
-0.4969346, -0.3118539, -2.254023, 0, 0, 0, 1, 1,
-0.4911328, -1.331683, -2.622956, 0, 0, 0, 1, 1,
-0.4866406, -0.2530512, -0.8351141, 0, 0, 0, 1, 1,
-0.4848278, 0.09749481, -1.247658, 0, 0, 0, 1, 1,
-0.4821824, -1.265078, -1.732688, 0, 0, 0, 1, 1,
-0.4782452, -1.100179, -2.409171, 0, 0, 0, 1, 1,
-0.4779751, -1.697222, -1.903021, 1, 1, 1, 1, 1,
-0.4759694, -1.032247, -2.082761, 1, 1, 1, 1, 1,
-0.4757628, 0.6590244, -1.485297, 1, 1, 1, 1, 1,
-0.4723186, -0.8860275, -2.535215, 1, 1, 1, 1, 1,
-0.4662507, -0.6662803, -2.487887, 1, 1, 1, 1, 1,
-0.462994, 0.7063952, -2.221378, 1, 1, 1, 1, 1,
-0.4514207, -2.902093, -1.405913, 1, 1, 1, 1, 1,
-0.4468822, -0.1222786, -2.698754, 1, 1, 1, 1, 1,
-0.4404025, -0.4263806, -2.730444, 1, 1, 1, 1, 1,
-0.4243673, 0.1076357, -0.8516569, 1, 1, 1, 1, 1,
-0.4174063, 0.1840815, -0.6681209, 1, 1, 1, 1, 1,
-0.4151769, 0.7437941, -0.3143895, 1, 1, 1, 1, 1,
-0.4150927, 1.241828, 0.5729002, 1, 1, 1, 1, 1,
-0.4140612, 1.712097, 1.101568, 1, 1, 1, 1, 1,
-0.4072201, 0.4136826, -0.5893918, 1, 1, 1, 1, 1,
-0.3975975, -0.7008015, -3.413185, 0, 0, 1, 1, 1,
-0.3941533, -0.1158948, -1.685327, 1, 0, 0, 1, 1,
-0.3935459, 0.3319122, -0.5255787, 1, 0, 0, 1, 1,
-0.3929273, -0.6015599, -4.389851, 1, 0, 0, 1, 1,
-0.387096, 0.4256022, 0.8519884, 1, 0, 0, 1, 1,
-0.3862295, 1.695237, 0.02376939, 1, 0, 0, 1, 1,
-0.3784141, 0.9678612, -1.147741, 0, 0, 0, 1, 1,
-0.3780266, 0.07225347, -0.06402373, 0, 0, 0, 1, 1,
-0.3735373, 0.8626637, -2.870942, 0, 0, 0, 1, 1,
-0.3679175, -0.5086824, -1.183223, 0, 0, 0, 1, 1,
-0.3644117, -1.630974, -2.356667, 0, 0, 0, 1, 1,
-0.3626442, -2.249432, -4.124988, 0, 0, 0, 1, 1,
-0.3591017, 0.6996315, -1.525847, 0, 0, 0, 1, 1,
-0.3478794, -1.347326, -2.035838, 1, 1, 1, 1, 1,
-0.3445481, 2.186483, 0.9321015, 1, 1, 1, 1, 1,
-0.3421052, -0.1720978, -0.969798, 1, 1, 1, 1, 1,
-0.3414336, 0.7543323, 0.3296418, 1, 1, 1, 1, 1,
-0.3401124, 0.9609577, -0.5074095, 1, 1, 1, 1, 1,
-0.335396, 0.3862366, -1.171923, 1, 1, 1, 1, 1,
-0.3324982, -1.091584, -3.767175, 1, 1, 1, 1, 1,
-0.3320448, 0.4703112, -1.417651, 1, 1, 1, 1, 1,
-0.3314888, -0.2089685, -1.393944, 1, 1, 1, 1, 1,
-0.327722, 1.56987, -0.1880663, 1, 1, 1, 1, 1,
-0.3239025, 0.488607, -0.4685521, 1, 1, 1, 1, 1,
-0.3209021, -0.05504739, -0.1985347, 1, 1, 1, 1, 1,
-0.3187038, 0.8911554, 0.1100309, 1, 1, 1, 1, 1,
-0.3099941, -0.9161575, -1.889367, 1, 1, 1, 1, 1,
-0.3065071, 0.01833573, -1.334382, 1, 1, 1, 1, 1,
-0.3064781, -0.1835822, -2.076997, 0, 0, 1, 1, 1,
-0.3041864, -1.136429, -1.970466, 1, 0, 0, 1, 1,
-0.2946105, -0.6603667, -4.074597, 1, 0, 0, 1, 1,
-0.2945766, -0.5601894, -1.591204, 1, 0, 0, 1, 1,
-0.2893679, 0.7669451, -0.9436232, 1, 0, 0, 1, 1,
-0.2893595, -1.184598, -1.635376, 1, 0, 0, 1, 1,
-0.2892366, 0.4133521, 0.8521008, 0, 0, 0, 1, 1,
-0.2880146, 0.456567, -2.384076, 0, 0, 0, 1, 1,
-0.2863546, -0.2452001, -2.384343, 0, 0, 0, 1, 1,
-0.2846592, 1.182425, 0.1774069, 0, 0, 0, 1, 1,
-0.2729634, -1.741161, -1.12414, 0, 0, 0, 1, 1,
-0.2728107, -0.1659704, -2.062055, 0, 0, 0, 1, 1,
-0.2715933, 0.775681, -0.3155951, 0, 0, 0, 1, 1,
-0.2654877, -0.4527127, -2.913208, 1, 1, 1, 1, 1,
-0.2628404, 0.8832104, -0.09675013, 1, 1, 1, 1, 1,
-0.2605694, 0.5197947, 1.775133, 1, 1, 1, 1, 1,
-0.2589214, 1.001332, -0.1594954, 1, 1, 1, 1, 1,
-0.2515053, -0.3934753, -0.5827061, 1, 1, 1, 1, 1,
-0.2498403, -0.7986418, -1.821885, 1, 1, 1, 1, 1,
-0.2492469, -0.1552719, -0.7882496, 1, 1, 1, 1, 1,
-0.2476629, -0.6968026, -2.097609, 1, 1, 1, 1, 1,
-0.2461188, 0.7168102, -1.750023, 1, 1, 1, 1, 1,
-0.2430416, 0.3336052, -0.8256956, 1, 1, 1, 1, 1,
-0.2427706, 1.356037, -0.5878956, 1, 1, 1, 1, 1,
-0.2395734, 0.5390949, -0.05045674, 1, 1, 1, 1, 1,
-0.2361675, 0.3698913, 0.106045, 1, 1, 1, 1, 1,
-0.232889, -0.2480679, -3.459323, 1, 1, 1, 1, 1,
-0.229483, -0.9773194, -1.393409, 1, 1, 1, 1, 1,
-0.215665, -0.1223563, -1.867737, 0, 0, 1, 1, 1,
-0.2156344, 1.483607, 0.734164, 1, 0, 0, 1, 1,
-0.2136063, 0.5080943, -1.062022, 1, 0, 0, 1, 1,
-0.2129473, -0.0396113, -1.048059, 1, 0, 0, 1, 1,
-0.2121891, -0.3690105, -2.151227, 1, 0, 0, 1, 1,
-0.2119576, 0.3381749, -0.4218652, 1, 0, 0, 1, 1,
-0.2086335, 1.365866, -3.663647, 0, 0, 0, 1, 1,
-0.2023887, 1.5769, -1.293946, 0, 0, 0, 1, 1,
-0.2003602, 0.2036168, -0.721026, 0, 0, 0, 1, 1,
-0.197804, -0.450016, -2.965126, 0, 0, 0, 1, 1,
-0.1962013, -1.213357, -2.728791, 0, 0, 0, 1, 1,
-0.1930666, 1.053492, 1.028001, 0, 0, 0, 1, 1,
-0.1884591, 2.258937, -0.03226752, 0, 0, 0, 1, 1,
-0.1881639, 0.1199802, -0.5028171, 1, 1, 1, 1, 1,
-0.187034, 0.4042956, 0.8190819, 1, 1, 1, 1, 1,
-0.1760749, 0.3812456, -0.1026686, 1, 1, 1, 1, 1,
-0.1727684, -0.01470818, 0.1130271, 1, 1, 1, 1, 1,
-0.1717117, -0.4646248, -2.94262, 1, 1, 1, 1, 1,
-0.1702313, 1.540781, 0.2731023, 1, 1, 1, 1, 1,
-0.1676537, -0.04674451, -0.9651739, 1, 1, 1, 1, 1,
-0.1590594, 1.141305, 0.2908794, 1, 1, 1, 1, 1,
-0.1590492, -0.2765274, -1.952524, 1, 1, 1, 1, 1,
-0.1566038, -0.6950382, -3.88262, 1, 1, 1, 1, 1,
-0.1522793, -0.5704991, -2.626158, 1, 1, 1, 1, 1,
-0.152108, 0.9051937, 0.860209, 1, 1, 1, 1, 1,
-0.1512104, -1.474914, -3.652664, 1, 1, 1, 1, 1,
-0.1483203, -1.430106, -4.106367, 1, 1, 1, 1, 1,
-0.1474894, 0.7039651, 0.3156667, 1, 1, 1, 1, 1,
-0.1452201, 0.332983, -0.9320797, 0, 0, 1, 1, 1,
-0.142789, 0.1803347, -1.282135, 1, 0, 0, 1, 1,
-0.1388074, -0.6390407, -4.586533, 1, 0, 0, 1, 1,
-0.1364752, 2.046195, 0.9970046, 1, 0, 0, 1, 1,
-0.1356716, -0.7035128, -4.25186, 1, 0, 0, 1, 1,
-0.1320275, 0.2476795, -1.838892, 1, 0, 0, 1, 1,
-0.1315496, -2.200529, -3.248802, 0, 0, 0, 1, 1,
-0.129626, 0.07423485, -1.829202, 0, 0, 0, 1, 1,
-0.124158, -2.295178, -3.474074, 0, 0, 0, 1, 1,
-0.1160533, -0.6925096, -2.106243, 0, 0, 0, 1, 1,
-0.1130431, 0.2298588, 1.295462, 0, 0, 0, 1, 1,
-0.1126103, 0.6950245, -1.399645, 0, 0, 0, 1, 1,
-0.1124983, -0.3705254, -3.023262, 0, 0, 0, 1, 1,
-0.112069, -1.355392, -2.713033, 1, 1, 1, 1, 1,
-0.1047219, 0.5498585, 2.417736, 1, 1, 1, 1, 1,
-0.1041064, 1.016443, -0.387653, 1, 1, 1, 1, 1,
-0.1027253, 0.4780922, -1.129246, 1, 1, 1, 1, 1,
-0.09424578, -0.7025596, -4.045054, 1, 1, 1, 1, 1,
-0.09312744, 1.073979, -1.032057, 1, 1, 1, 1, 1,
-0.08645988, 0.1920274, -1.494448, 1, 1, 1, 1, 1,
-0.08505693, 0.7189564, 0.3305944, 1, 1, 1, 1, 1,
-0.06533548, 0.3737842, 2.4351, 1, 1, 1, 1, 1,
-0.05441877, 0.3803322, -0.5956415, 1, 1, 1, 1, 1,
-0.04808564, -0.5466782, -3.880103, 1, 1, 1, 1, 1,
-0.04359443, -0.524879, -6.035887, 1, 1, 1, 1, 1,
-0.0367135, 1.606545, -0.6774839, 1, 1, 1, 1, 1,
-0.03344372, -1.291811, -2.76621, 1, 1, 1, 1, 1,
-0.03226929, 0.4945155, 0.3075421, 1, 1, 1, 1, 1,
-0.02710898, 1.063115, -0.2545654, 0, 0, 1, 1, 1,
-0.02680814, 0.3861242, -0.4405631, 1, 0, 0, 1, 1,
-0.02155708, -1.158707, -2.943538, 1, 0, 0, 1, 1,
-0.01872229, -1.017908, -4.779631, 1, 0, 0, 1, 1,
-0.01513277, -1.48171, -2.276704, 1, 0, 0, 1, 1,
-0.01093594, -0.8900947, -2.146897, 1, 0, 0, 1, 1,
-0.0108806, -1.449577, -2.927994, 0, 0, 0, 1, 1,
-0.009178468, -0.05527233, -1.835321, 0, 0, 0, 1, 1,
-0.006785934, -1.750736, -1.664792, 0, 0, 0, 1, 1,
-0.00562598, 0.1900666, 1.115612, 0, 0, 0, 1, 1,
-0.002311429, -2.004304, -1.952779, 0, 0, 0, 1, 1,
0.006546736, -0.7733063, 3.556293, 0, 0, 0, 1, 1,
0.01050947, 1.495642, 0.3762086, 0, 0, 0, 1, 1,
0.01114555, 0.3981326, 0.4526378, 1, 1, 1, 1, 1,
0.01507977, -0.208147, 2.725209, 1, 1, 1, 1, 1,
0.01658425, 1.237277, 0.58153, 1, 1, 1, 1, 1,
0.01722393, 2.285184, 1.305614, 1, 1, 1, 1, 1,
0.01752783, -0.5015284, 4.215527, 1, 1, 1, 1, 1,
0.01768108, -1.822778, 2.683932, 1, 1, 1, 1, 1,
0.01828773, 0.9386672, -1.175429, 1, 1, 1, 1, 1,
0.02244444, 0.4549124, -0.3497058, 1, 1, 1, 1, 1,
0.02570765, -0.2668794, 1.514856, 1, 1, 1, 1, 1,
0.0263702, 0.8465897, -0.2969077, 1, 1, 1, 1, 1,
0.03293016, 0.04316288, -0.9432223, 1, 1, 1, 1, 1,
0.0352969, 1.91717, 0.5788606, 1, 1, 1, 1, 1,
0.03775271, 0.6298329, -0.9659466, 1, 1, 1, 1, 1,
0.03984359, 1.367801, -0.5024672, 1, 1, 1, 1, 1,
0.04182038, 0.6141341, -0.5162458, 1, 1, 1, 1, 1,
0.04282997, 0.7704622, 0.3786727, 0, 0, 1, 1, 1,
0.04330897, 0.4742242, -1.221035, 1, 0, 0, 1, 1,
0.04546595, 0.6667871, 0.8561268, 1, 0, 0, 1, 1,
0.0490687, 0.5169173, 0.5559205, 1, 0, 0, 1, 1,
0.05761369, -0.5300475, 1.609849, 1, 0, 0, 1, 1,
0.06023072, -0.8570375, 1.608415, 1, 0, 0, 1, 1,
0.06045182, 1.574898, 1.311373, 0, 0, 0, 1, 1,
0.06337976, -0.9941481, 1.806934, 0, 0, 0, 1, 1,
0.06373729, -0.8075396, 0.7931832, 0, 0, 0, 1, 1,
0.06645159, 0.5203828, 1.323093, 0, 0, 0, 1, 1,
0.07333631, 1.040842, 1.663537, 0, 0, 0, 1, 1,
0.07473332, -0.6239684, 3.794476, 0, 0, 0, 1, 1,
0.08043827, 0.7192904, 1.224724, 0, 0, 0, 1, 1,
0.0806312, 2.882019, 0.6511493, 1, 1, 1, 1, 1,
0.08214997, -1.215156, 4.812606, 1, 1, 1, 1, 1,
0.08309589, 1.087448, -1.027443, 1, 1, 1, 1, 1,
0.08392808, -0.02497447, 1.096067, 1, 1, 1, 1, 1,
0.08449207, -0.1967605, 3.277975, 1, 1, 1, 1, 1,
0.08747043, -0.4300926, 5.205086, 1, 1, 1, 1, 1,
0.08758545, -1.626963, 3.31771, 1, 1, 1, 1, 1,
0.08989631, -1.96662, 3.110775, 1, 1, 1, 1, 1,
0.09094954, -0.4700291, 1.833951, 1, 1, 1, 1, 1,
0.09110072, -1.921952, 6.013857, 1, 1, 1, 1, 1,
0.09127007, -0.8654584, 2.332062, 1, 1, 1, 1, 1,
0.09213831, -1.483355, 3.944133, 1, 1, 1, 1, 1,
0.0942032, 0.999393, -1.849964, 1, 1, 1, 1, 1,
0.09492914, 0.6704708, 0.8307959, 1, 1, 1, 1, 1,
0.09615167, 1.057307, 0.04286574, 1, 1, 1, 1, 1,
0.09706668, -0.5395439, 3.026335, 0, 0, 1, 1, 1,
0.09826981, -0.5405275, 4.412282, 1, 0, 0, 1, 1,
0.09879994, -0.06189179, 1.948499, 1, 0, 0, 1, 1,
0.1032969, 0.5584151, -0.5619957, 1, 0, 0, 1, 1,
0.1048257, -0.3967294, 2.671322, 1, 0, 0, 1, 1,
0.1056944, 1.283672, 0.7878332, 1, 0, 0, 1, 1,
0.1084259, -0.8323099, 3.065706, 0, 0, 0, 1, 1,
0.1093318, 0.8419418, 1.040848, 0, 0, 0, 1, 1,
0.1101094, -0.2035035, 3.411024, 0, 0, 0, 1, 1,
0.1118684, -1.363946, 4.276314, 0, 0, 0, 1, 1,
0.1147027, 0.2274986, -0.2483504, 0, 0, 0, 1, 1,
0.1175133, 0.2541509, 0.4686106, 0, 0, 0, 1, 1,
0.1245124, -1.390208, 1.311047, 0, 0, 0, 1, 1,
0.1259908, 0.9557608, 0.9158976, 1, 1, 1, 1, 1,
0.1268544, 1.715358, 1.599366, 1, 1, 1, 1, 1,
0.1284745, -2.584753, 2.63899, 1, 1, 1, 1, 1,
0.1300557, -0.7218257, 3.945234, 1, 1, 1, 1, 1,
0.130148, -1.519676, 3.808202, 1, 1, 1, 1, 1,
0.1326532, -0.05295819, 0.7404118, 1, 1, 1, 1, 1,
0.1329844, 1.75607, -0.5456617, 1, 1, 1, 1, 1,
0.1336417, 0.02902148, 0.6649411, 1, 1, 1, 1, 1,
0.1350835, -0.2261201, 1.275357, 1, 1, 1, 1, 1,
0.1354997, 0.5115625, -0.01191775, 1, 1, 1, 1, 1,
0.1362856, 1.080199, -0.2447067, 1, 1, 1, 1, 1,
0.138073, 1.946611, -0.03006509, 1, 1, 1, 1, 1,
0.1392356, -1.507787, 3.276013, 1, 1, 1, 1, 1,
0.1404931, 0.03471694, 1.299071, 1, 1, 1, 1, 1,
0.1433127, -0.6717308, 2.145435, 1, 1, 1, 1, 1,
0.1468535, 0.2372971, -0.7510377, 0, 0, 1, 1, 1,
0.1479656, -1.102413, 2.396148, 1, 0, 0, 1, 1,
0.1489421, -0.5640787, 3.466448, 1, 0, 0, 1, 1,
0.1499875, -0.6531408, 2.886539, 1, 0, 0, 1, 1,
0.1506372, 1.731903, 0.9095041, 1, 0, 0, 1, 1,
0.1526974, -1.244957, 5.097136, 1, 0, 0, 1, 1,
0.1531925, -0.6538504, 3.653801, 0, 0, 0, 1, 1,
0.1548451, 0.2592818, 1.465115, 0, 0, 0, 1, 1,
0.1569189, 0.7442286, -0.6121251, 0, 0, 0, 1, 1,
0.157192, -1.471936, 2.69389, 0, 0, 0, 1, 1,
0.164037, -0.1439339, 2.458344, 0, 0, 0, 1, 1,
0.166229, 1.245585, -0.1240447, 0, 0, 0, 1, 1,
0.1676948, 0.2921211, 1.630604, 0, 0, 0, 1, 1,
0.1687376, 0.1101111, 0.5152275, 1, 1, 1, 1, 1,
0.1757801, 0.4706669, 1.050752, 1, 1, 1, 1, 1,
0.1835319, 0.4744673, 0.7321093, 1, 1, 1, 1, 1,
0.1837615, -0.5377584, 2.708883, 1, 1, 1, 1, 1,
0.1860783, 1.033365, -0.01267813, 1, 1, 1, 1, 1,
0.1873884, -0.1764552, 1.705018, 1, 1, 1, 1, 1,
0.1874775, -1.959904, 2.963103, 1, 1, 1, 1, 1,
0.1892154, 0.3044753, -0.9665452, 1, 1, 1, 1, 1,
0.189383, 0.2292295, -2.069713, 1, 1, 1, 1, 1,
0.1920166, 1.578781, 1.005153, 1, 1, 1, 1, 1,
0.192852, -0.1814597, 3.339914, 1, 1, 1, 1, 1,
0.1983223, 0.428496, 0.2542061, 1, 1, 1, 1, 1,
0.1997509, -0.00968926, 1.455003, 1, 1, 1, 1, 1,
0.200436, 0.2311462, 0.7710258, 1, 1, 1, 1, 1,
0.2026636, -0.2123186, 2.438852, 1, 1, 1, 1, 1,
0.2030633, 1.321188, -0.8593649, 0, 0, 1, 1, 1,
0.2033513, 0.8011577, 1.430745, 1, 0, 0, 1, 1,
0.2037688, -0.1904049, 1.362166, 1, 0, 0, 1, 1,
0.2069994, -0.4970058, 3.492083, 1, 0, 0, 1, 1,
0.2102815, 1.612134, 1.439533, 1, 0, 0, 1, 1,
0.2105051, -1.788652, 1.567173, 1, 0, 0, 1, 1,
0.2118126, -0.4501361, 5.149083, 0, 0, 0, 1, 1,
0.2130068, -0.2041887, 2.347534, 0, 0, 0, 1, 1,
0.2154014, 0.6477361, -1.163279, 0, 0, 0, 1, 1,
0.2156709, -0.4239139, 1.125673, 0, 0, 0, 1, 1,
0.2174454, -1.359246, 1.767463, 0, 0, 0, 1, 1,
0.2255953, 0.2910516, 1.047085, 0, 0, 0, 1, 1,
0.2260047, -0.7418596, 4.883096, 0, 0, 0, 1, 1,
0.2284435, 1.688657, -1.309913, 1, 1, 1, 1, 1,
0.2287962, 1.424519, -0.4240411, 1, 1, 1, 1, 1,
0.2292254, 0.2014802, 1.25521, 1, 1, 1, 1, 1,
0.2316051, 0.6833606, -1.196577, 1, 1, 1, 1, 1,
0.2337376, -0.4790015, 3.90814, 1, 1, 1, 1, 1,
0.2338916, -0.6982673, 0.3751745, 1, 1, 1, 1, 1,
0.2338958, 0.7891014, 2.050889, 1, 1, 1, 1, 1,
0.2345924, -0.6884637, 3.047222, 1, 1, 1, 1, 1,
0.2364189, -2.100735, 2.165722, 1, 1, 1, 1, 1,
0.2448791, -0.6082054, 3.935144, 1, 1, 1, 1, 1,
0.2454407, -0.9462097, 3.766226, 1, 1, 1, 1, 1,
0.2486115, -0.4049272, 1.826908, 1, 1, 1, 1, 1,
0.2541698, -0.3179125, 3.711881, 1, 1, 1, 1, 1,
0.2569786, -0.3334795, 2.101037, 1, 1, 1, 1, 1,
0.2572434, 0.5087841, -0.6296277, 1, 1, 1, 1, 1,
0.2604596, -0.8998987, 0.9124139, 0, 0, 1, 1, 1,
0.2610557, -1.411716, 5.99461, 1, 0, 0, 1, 1,
0.2649232, -0.7238064, 2.302648, 1, 0, 0, 1, 1,
0.2688023, 0.5905864, -0.09225739, 1, 0, 0, 1, 1,
0.2788471, 1.132717, 0.8728272, 1, 0, 0, 1, 1,
0.2835033, 0.0993837, 2.496264, 1, 0, 0, 1, 1,
0.2841778, -0.674144, 2.64863, 0, 0, 0, 1, 1,
0.2853702, 0.3194329, 0.5341802, 0, 0, 0, 1, 1,
0.2940042, 0.8897488, 0.03518822, 0, 0, 0, 1, 1,
0.2970266, 0.04993144, 1.061537, 0, 0, 0, 1, 1,
0.3069005, -0.4389965, 1.989287, 0, 0, 0, 1, 1,
0.3191751, -0.1366022, 1.443052, 0, 0, 0, 1, 1,
0.3266216, -0.39318, 3.088001, 0, 0, 0, 1, 1,
0.3293739, 0.208873, 2.025675, 1, 1, 1, 1, 1,
0.3301161, -0.1290915, 0.5103267, 1, 1, 1, 1, 1,
0.3328598, -0.001512309, 1.059467, 1, 1, 1, 1, 1,
0.3328885, 1.41514, -0.08237146, 1, 1, 1, 1, 1,
0.3362024, 0.2698273, 1.525739, 1, 1, 1, 1, 1,
0.337643, -1.548535, 3.313791, 1, 1, 1, 1, 1,
0.3406002, 0.2930009, 0.6669075, 1, 1, 1, 1, 1,
0.3457339, -0.7588572, 4.117542, 1, 1, 1, 1, 1,
0.3495685, 0.002151988, 2.89242, 1, 1, 1, 1, 1,
0.3518319, 1.042497, 1.230781, 1, 1, 1, 1, 1,
0.352544, 0.6166433, 1.498525, 1, 1, 1, 1, 1,
0.3532713, -0.3272879, 0.6826994, 1, 1, 1, 1, 1,
0.3535923, 1.965486, 1.176457, 1, 1, 1, 1, 1,
0.3549936, -1.030491, 2.326019, 1, 1, 1, 1, 1,
0.3604872, 0.7135992, 1.700385, 1, 1, 1, 1, 1,
0.3618493, 0.4274699, -0.06912414, 0, 0, 1, 1, 1,
0.3627921, -0.5665765, 3.062277, 1, 0, 0, 1, 1,
0.3628706, 0.06192766, -0.3156481, 1, 0, 0, 1, 1,
0.3672991, -1.633261, 2.92802, 1, 0, 0, 1, 1,
0.3695365, 1.932823, 0.4427733, 1, 0, 0, 1, 1,
0.3729915, 0.5228983, -1.418011, 1, 0, 0, 1, 1,
0.3737265, 1.367082, 0.3326022, 0, 0, 0, 1, 1,
0.3745085, -0.335128, 0.7149501, 0, 0, 0, 1, 1,
0.379496, -0.1868097, 2.100345, 0, 0, 0, 1, 1,
0.3804024, -0.4485333, 2.646777, 0, 0, 0, 1, 1,
0.3808405, 0.06171452, 1.010013, 0, 0, 0, 1, 1,
0.3816873, 2.392733, -0.6375469, 0, 0, 0, 1, 1,
0.3828121, -0.3761734, 2.276643, 0, 0, 0, 1, 1,
0.385982, -0.08822588, 2.622589, 1, 1, 1, 1, 1,
0.3875009, 0.7522789, -0.6584875, 1, 1, 1, 1, 1,
0.3884422, -0.9157023, 2.646173, 1, 1, 1, 1, 1,
0.3887124, 0.7854295, -0.1379343, 1, 1, 1, 1, 1,
0.389074, 1.809919, 0.4838435, 1, 1, 1, 1, 1,
0.3895531, 0.188557, 0.6889222, 1, 1, 1, 1, 1,
0.3928107, 2.374972, 1.049691, 1, 1, 1, 1, 1,
0.3971783, -0.6784715, 3.527413, 1, 1, 1, 1, 1,
0.3991731, 0.6874187, 1.386101, 1, 1, 1, 1, 1,
0.4060787, 0.7079515, 1.369534, 1, 1, 1, 1, 1,
0.4071607, 0.6754166, -0.7384366, 1, 1, 1, 1, 1,
0.407862, 0.8358662, 1.417145, 1, 1, 1, 1, 1,
0.4079164, -1.294973, 3.027875, 1, 1, 1, 1, 1,
0.4117475, -0.761483, 1.82415, 1, 1, 1, 1, 1,
0.4130782, 0.6428627, 0.66976, 1, 1, 1, 1, 1,
0.4138998, -1.619818, 2.792524, 0, 0, 1, 1, 1,
0.4139054, 0.3941326, 0.3443279, 1, 0, 0, 1, 1,
0.4147957, -1.559296, 2.140403, 1, 0, 0, 1, 1,
0.4189074, 1.163895, 0.6334042, 1, 0, 0, 1, 1,
0.4195717, 1.321963, 0.8473696, 1, 0, 0, 1, 1,
0.4208934, -0.2829789, 2.96312, 1, 0, 0, 1, 1,
0.4287594, -0.5373544, 3.379848, 0, 0, 0, 1, 1,
0.4304887, 0.1036461, 0.7528738, 0, 0, 0, 1, 1,
0.4326771, 1.540283, 0.1695205, 0, 0, 0, 1, 1,
0.4359392, -0.3647563, 2.440965, 0, 0, 0, 1, 1,
0.436875, -0.6204528, 3.967662, 0, 0, 0, 1, 1,
0.4395429, 0.2753449, -0.8034664, 0, 0, 0, 1, 1,
0.4400338, 0.3124308, 0.27972, 0, 0, 0, 1, 1,
0.4403894, 1.643218, 0.6072177, 1, 1, 1, 1, 1,
0.4427195, 1.136352, -0.0875987, 1, 1, 1, 1, 1,
0.443196, 0.6821776, 1.173337, 1, 1, 1, 1, 1,
0.4435554, -0.7731097, 2.471226, 1, 1, 1, 1, 1,
0.4446699, -1.035178, 2.689269, 1, 1, 1, 1, 1,
0.4471761, -2.138339, 3.214436, 1, 1, 1, 1, 1,
0.4531237, -0.1258047, 2.107834, 1, 1, 1, 1, 1,
0.456316, -1.360608, 2.18617, 1, 1, 1, 1, 1,
0.4615603, 0.01218669, 1.371903, 1, 1, 1, 1, 1,
0.4621834, 1.667008, 1.013893, 1, 1, 1, 1, 1,
0.4622477, 0.9303816, 0.6684549, 1, 1, 1, 1, 1,
0.4624269, 0.3920842, 1.692243, 1, 1, 1, 1, 1,
0.4637261, -0.1519656, 2.162537, 1, 1, 1, 1, 1,
0.4646912, 0.6962747, 0.1385913, 1, 1, 1, 1, 1,
0.4692627, -1.065905, 1.742334, 1, 1, 1, 1, 1,
0.4733989, -0.9563328, 2.606945, 0, 0, 1, 1, 1,
0.4768993, 1.250425, 2.207165, 1, 0, 0, 1, 1,
0.4810679, 0.1728734, 0.2689376, 1, 0, 0, 1, 1,
0.4838931, -1.450887, 1.968873, 1, 0, 0, 1, 1,
0.4880146, 0.5615386, 0.6310226, 1, 0, 0, 1, 1,
0.491284, -0.6707869, 2.164624, 1, 0, 0, 1, 1,
0.4959919, -2.610381, 2.869978, 0, 0, 0, 1, 1,
0.4960893, -1.360935, 2.52846, 0, 0, 0, 1, 1,
0.4962027, 1.718643, 0.07060391, 0, 0, 0, 1, 1,
0.4993588, -0.4412107, 3.930519, 0, 0, 0, 1, 1,
0.5004433, 1.044901, 0.4774732, 0, 0, 0, 1, 1,
0.5019879, -0.4139073, 2.492635, 0, 0, 0, 1, 1,
0.5023226, 0.7979568, 1.52514, 0, 0, 0, 1, 1,
0.5051348, 0.5709578, 1.677729, 1, 1, 1, 1, 1,
0.505227, -0.9394621, 0.6595632, 1, 1, 1, 1, 1,
0.5052376, -2.660176, 2.948588, 1, 1, 1, 1, 1,
0.5069537, 1.34755, 1.902865, 1, 1, 1, 1, 1,
0.5090029, 0.8644214, 2.297579, 1, 1, 1, 1, 1,
0.5112687, -0.3930316, 2.227825, 1, 1, 1, 1, 1,
0.5143648, 1.076342, 2.681505, 1, 1, 1, 1, 1,
0.5158508, 0.7059734, 1.791508, 1, 1, 1, 1, 1,
0.5303877, 1.308426, -1.716158, 1, 1, 1, 1, 1,
0.5309339, 1.15697, 0.009880539, 1, 1, 1, 1, 1,
0.5315298, -0.7991257, 2.224478, 1, 1, 1, 1, 1,
0.5334193, -1.38851, 3.707679, 1, 1, 1, 1, 1,
0.5376349, -0.8806425, 5.317708, 1, 1, 1, 1, 1,
0.5380239, 1.060684, -0.5302179, 1, 1, 1, 1, 1,
0.541683, -0.7632467, 4.085485, 1, 1, 1, 1, 1,
0.5457162, -0.4272036, 2.237695, 0, 0, 1, 1, 1,
0.5508155, 0.5298368, 1.463721, 1, 0, 0, 1, 1,
0.5517066, 1.197327, 0.8395262, 1, 0, 0, 1, 1,
0.5520501, 0.03171894, 2.191113, 1, 0, 0, 1, 1,
0.5575063, 0.7819123, 1.027784, 1, 0, 0, 1, 1,
0.5579836, 0.01349814, 1.924245, 1, 0, 0, 1, 1,
0.5592446, -0.6496633, 2.073415, 0, 0, 0, 1, 1,
0.56054, -1.119692, 1.973594, 0, 0, 0, 1, 1,
0.5621905, -0.3829108, 1.735415, 0, 0, 0, 1, 1,
0.5675107, -1.720346, 4.368455, 0, 0, 0, 1, 1,
0.5716952, -0.0213539, 2.528757, 0, 0, 0, 1, 1,
0.5775287, -1.195567, 1.811153, 0, 0, 0, 1, 1,
0.5783632, 0.1629381, 1.135351, 0, 0, 0, 1, 1,
0.5807245, -1.535488, 3.587083, 1, 1, 1, 1, 1,
0.5908514, -1.175214, 2.633494, 1, 1, 1, 1, 1,
0.5955788, 0.7515367, -0.8954386, 1, 1, 1, 1, 1,
0.6099681, -1.067368, 2.518823, 1, 1, 1, 1, 1,
0.6133631, -0.7874849, 3.045093, 1, 1, 1, 1, 1,
0.6155993, -0.9910864, 3.540011, 1, 1, 1, 1, 1,
0.6203145, -0.6985212, 2.963673, 1, 1, 1, 1, 1,
0.6210425, -0.5977125, 3.064292, 1, 1, 1, 1, 1,
0.6223471, 0.4788779, 1.544848, 1, 1, 1, 1, 1,
0.6236833, 1.185904, -1.273567, 1, 1, 1, 1, 1,
0.6237687, 2.63828, 0.2140428, 1, 1, 1, 1, 1,
0.6325212, -0.6945533, 2.66264, 1, 1, 1, 1, 1,
0.6337274, -0.3188595, 2.379638, 1, 1, 1, 1, 1,
0.6372843, 0.02239352, 0.9429111, 1, 1, 1, 1, 1,
0.6415039, -0.1770489, 1.729065, 1, 1, 1, 1, 1,
0.6445252, -0.04961726, 0.09782356, 0, 0, 1, 1, 1,
0.646083, -0.9795752, 3.441026, 1, 0, 0, 1, 1,
0.6478098, 0.7268298, 0.4858115, 1, 0, 0, 1, 1,
0.6479267, 1.446462, 0.9945306, 1, 0, 0, 1, 1,
0.6500023, -1.574414, 3.835103, 1, 0, 0, 1, 1,
0.6554291, -0.1481327, 2.870743, 1, 0, 0, 1, 1,
0.6560066, 0.4684003, 0.7256585, 0, 0, 0, 1, 1,
0.6594562, -0.8792524, 4.017514, 0, 0, 0, 1, 1,
0.6604756, -1.545079, 3.060126, 0, 0, 0, 1, 1,
0.6606255, -1.655645, 5.505109, 0, 0, 0, 1, 1,
0.6637327, -1.011878, 3.028117, 0, 0, 0, 1, 1,
0.6650348, -2.106189, 1.987015, 0, 0, 0, 1, 1,
0.6689687, 0.4585405, -1.558786, 0, 0, 0, 1, 1,
0.6690561, -0.6869429, 3.008629, 1, 1, 1, 1, 1,
0.6699151, 0.7770321, 0.603256, 1, 1, 1, 1, 1,
0.6734866, 0.8935349, -0.7924988, 1, 1, 1, 1, 1,
0.6738825, 1.687221, -0.9602834, 1, 1, 1, 1, 1,
0.6820922, -0.6444831, 2.634957, 1, 1, 1, 1, 1,
0.682222, -0.219632, 1.247246, 1, 1, 1, 1, 1,
0.6909904, 0.1828354, 2.544773, 1, 1, 1, 1, 1,
0.6922404, 0.06521748, 0.2307409, 1, 1, 1, 1, 1,
0.6954375, -0.2280068, 4.417548, 1, 1, 1, 1, 1,
0.6962581, 0.1257621, 2.79371, 1, 1, 1, 1, 1,
0.6967103, -0.09054255, 2.84445, 1, 1, 1, 1, 1,
0.7020479, 0.02729189, 3.362604, 1, 1, 1, 1, 1,
0.7031882, 0.4081532, 1.368557, 1, 1, 1, 1, 1,
0.706935, 1.430361, 0.3845319, 1, 1, 1, 1, 1,
0.7082766, 2.413541, 0.5204091, 1, 1, 1, 1, 1,
0.7118589, 0.4809566, -0.08588759, 0, 0, 1, 1, 1,
0.7128751, -1.153536, 3.385196, 1, 0, 0, 1, 1,
0.7143671, 1.01999, -1.601624, 1, 0, 0, 1, 1,
0.7201189, 1.168352, -0.1816859, 1, 0, 0, 1, 1,
0.7205341, 0.07040976, 1.6033, 1, 0, 0, 1, 1,
0.7212878, 1.751931, 1.624544, 1, 0, 0, 1, 1,
0.7237722, -0.6506512, 1.9917, 0, 0, 0, 1, 1,
0.7253945, 0.01678788, 0.8701267, 0, 0, 0, 1, 1,
0.7301561, 0.1637495, 2.214085, 0, 0, 0, 1, 1,
0.7376789, -1.48259, 0.621303, 0, 0, 0, 1, 1,
0.7379534, -2.253444, 1.631215, 0, 0, 0, 1, 1,
0.7428302, 0.9150307, 0.706689, 0, 0, 0, 1, 1,
0.7433888, 0.9570822, 0.9620981, 0, 0, 0, 1, 1,
0.7448583, -0.4980453, 1.181075, 1, 1, 1, 1, 1,
0.7454658, 0.508414, 0.489091, 1, 1, 1, 1, 1,
0.7465544, -1.373574, 3.867054, 1, 1, 1, 1, 1,
0.7510493, 0.3488283, 1.142545, 1, 1, 1, 1, 1,
0.7524062, 0.4334679, 0.9826729, 1, 1, 1, 1, 1,
0.7567395, -0.5243555, 2.138339, 1, 1, 1, 1, 1,
0.7603317, -1.560177, 3.353503, 1, 1, 1, 1, 1,
0.7641262, 0.3554091, 1.273967, 1, 1, 1, 1, 1,
0.7700958, -1.211856, 3.174948, 1, 1, 1, 1, 1,
0.7725006, 1.089624, -0.08987597, 1, 1, 1, 1, 1,
0.7756261, 1.318773, 0.7552587, 1, 1, 1, 1, 1,
0.7775623, 0.8836532, 1.822141, 1, 1, 1, 1, 1,
0.784096, -0.8911843, 1.538505, 1, 1, 1, 1, 1,
0.7871876, 0.6507868, 1.374161, 1, 1, 1, 1, 1,
0.7905596, 1.07593, 2.490498, 1, 1, 1, 1, 1,
0.790827, -0.4074457, 0.453905, 0, 0, 1, 1, 1,
0.7916159, -0.9106743, 3.397989, 1, 0, 0, 1, 1,
0.7919056, 0.4129869, -0.5127823, 1, 0, 0, 1, 1,
0.7941437, 0.02024144, 1.609643, 1, 0, 0, 1, 1,
0.796138, 0.4843533, 0.99339, 1, 0, 0, 1, 1,
0.797083, 0.9663129, -1.710699, 1, 0, 0, 1, 1,
0.7985311, -0.7988362, 4.108728, 0, 0, 0, 1, 1,
0.8021702, 0.2352896, 2.356251, 0, 0, 0, 1, 1,
0.8091828, -0.4706483, 0.7210925, 0, 0, 0, 1, 1,
0.8141874, 0.4255412, 2.584837, 0, 0, 0, 1, 1,
0.8198015, 1.118941, 0.1060506, 0, 0, 0, 1, 1,
0.8198353, 0.4934161, 0.6336672, 0, 0, 0, 1, 1,
0.8198679, 0.1154982, -0.02246008, 0, 0, 0, 1, 1,
0.8209103, -1.734938, 4.315173, 1, 1, 1, 1, 1,
0.8244283, 1.143068, 0.5417725, 1, 1, 1, 1, 1,
0.832687, -1.550692, 2.669471, 1, 1, 1, 1, 1,
0.8347229, -0.4419363, 2.500001, 1, 1, 1, 1, 1,
0.8369814, -0.6092401, 2.997515, 1, 1, 1, 1, 1,
0.8413423, 0.5608096, 1.467317, 1, 1, 1, 1, 1,
0.8556812, 0.2606046, 1.291468, 1, 1, 1, 1, 1,
0.8566472, 0.6828982, 2.23822, 1, 1, 1, 1, 1,
0.8594548, -0.3035903, 1.463211, 1, 1, 1, 1, 1,
0.8600388, 0.6513152, -1.449387, 1, 1, 1, 1, 1,
0.8628121, 0.2513736, 0.1319661, 1, 1, 1, 1, 1,
0.8654867, -0.3910814, 3.116278, 1, 1, 1, 1, 1,
0.8658926, -0.08618827, 0.4687944, 1, 1, 1, 1, 1,
0.8687944, 1.106539, 1.1522, 1, 1, 1, 1, 1,
0.869453, -0.3597777, 0.6769656, 1, 1, 1, 1, 1,
0.8723664, 1.619537, -1.303746, 0, 0, 1, 1, 1,
0.8739839, 0.929372, 3.16018, 1, 0, 0, 1, 1,
0.8818066, 0.5866767, 1.072233, 1, 0, 0, 1, 1,
0.8892521, -0.9663022, 3.101459, 1, 0, 0, 1, 1,
0.8904056, -0.3246233, 2.452016, 1, 0, 0, 1, 1,
0.8950027, -0.7914807, 2.660255, 1, 0, 0, 1, 1,
0.902146, -1.681431, 3.201238, 0, 0, 0, 1, 1,
0.9041826, 0.8937572, -0.06738599, 0, 0, 0, 1, 1,
0.9051176, -0.2215769, 1.903488, 0, 0, 0, 1, 1,
0.905516, 0.776176, 1.598445, 0, 0, 0, 1, 1,
0.9057891, -0.3171357, 1.746859, 0, 0, 0, 1, 1,
0.9064198, 1.352787, 1.603086, 0, 0, 0, 1, 1,
0.90899, -1.031006, 1.597975, 0, 0, 0, 1, 1,
0.9113027, -1.708054, 1.604598, 1, 1, 1, 1, 1,
0.911894, 0.6870727, 1.235085, 1, 1, 1, 1, 1,
0.9203215, 1.712605, 1.269245, 1, 1, 1, 1, 1,
0.9258694, -1.587455, 1.590117, 1, 1, 1, 1, 1,
0.9266455, -1.008333, 1.181433, 1, 1, 1, 1, 1,
0.928079, -0.004157588, 0.5821713, 1, 1, 1, 1, 1,
0.9344597, -0.4948978, 1.279314, 1, 1, 1, 1, 1,
0.9400495, 1.053066, 2.691775, 1, 1, 1, 1, 1,
0.9404978, -0.07014368, 0.5578287, 1, 1, 1, 1, 1,
0.9425154, 0.1579064, -0.07388218, 1, 1, 1, 1, 1,
0.9454563, 0.3745161, 1.446792, 1, 1, 1, 1, 1,
0.9474002, 0.1554459, 1.539561, 1, 1, 1, 1, 1,
0.9516069, 0.4467787, 2.454788, 1, 1, 1, 1, 1,
0.9552895, -0.975859, 1.941411, 1, 1, 1, 1, 1,
0.9564154, 0.4096082, -0.7112373, 1, 1, 1, 1, 1,
0.9595056, 0.5360916, 2.31748, 0, 0, 1, 1, 1,
0.9704289, 0.5176576, 0.6251661, 1, 0, 0, 1, 1,
0.9729611, 0.2461112, 1.0546, 1, 0, 0, 1, 1,
0.9730685, -1.460044, 1.142476, 1, 0, 0, 1, 1,
0.974468, -3.177603, 3.682839, 1, 0, 0, 1, 1,
0.9756157, 1.453312, 1.707509, 1, 0, 0, 1, 1,
0.9804069, 1.051536, 1.620043, 0, 0, 0, 1, 1,
0.9868451, 0.7769425, -0.2852649, 0, 0, 0, 1, 1,
0.9899735, 0.1430151, 1.031621, 0, 0, 0, 1, 1,
1.000777, 0.8641749, 0.4672675, 0, 0, 0, 1, 1,
1.001739, -1.972459, 1.091689, 0, 0, 0, 1, 1,
1.025552, -0.665795, 2.042156, 0, 0, 0, 1, 1,
1.02756, 0.6238538, 2.376757, 0, 0, 0, 1, 1,
1.032391, -0.1662523, 3.647871, 1, 1, 1, 1, 1,
1.032836, 0.4694115, 2.55263, 1, 1, 1, 1, 1,
1.036934, 1.077321, 0.7565181, 1, 1, 1, 1, 1,
1.038329, -0.2647712, 2.575561, 1, 1, 1, 1, 1,
1.038417, 1.005982, 0.6074765, 1, 1, 1, 1, 1,
1.040798, -0.007519718, 2.836159, 1, 1, 1, 1, 1,
1.044153, -0.6311924, 2.53044, 1, 1, 1, 1, 1,
1.045791, -0.3536579, 0.5308397, 1, 1, 1, 1, 1,
1.051218, 0.2856565, 1.090306, 1, 1, 1, 1, 1,
1.053548, 2.357281, -1.594594, 1, 1, 1, 1, 1,
1.062157, -0.6456336, 2.066948, 1, 1, 1, 1, 1,
1.078855, -0.6751981, 2.133771, 1, 1, 1, 1, 1,
1.079054, 2.472203, 0.8031803, 1, 1, 1, 1, 1,
1.079828, 0.833536, -0.2083419, 1, 1, 1, 1, 1,
1.082631, 0.4587333, -0.1292981, 1, 1, 1, 1, 1,
1.088771, 0.1216925, 0.9913889, 0, 0, 1, 1, 1,
1.09289, 0.2319875, 1.379813, 1, 0, 0, 1, 1,
1.093061, 0.4851594, 0.9576702, 1, 0, 0, 1, 1,
1.094061, -0.07285956, 0.8638754, 1, 0, 0, 1, 1,
1.095935, 0.8326025, 0.6843684, 1, 0, 0, 1, 1,
1.102245, 0.1516414, 1.887375, 1, 0, 0, 1, 1,
1.106053, -0.4074472, 2.108575, 0, 0, 0, 1, 1,
1.111319, 0.6323922, 0.4350672, 0, 0, 0, 1, 1,
1.112597, -0.1117652, 2.140745, 0, 0, 0, 1, 1,
1.113792, 0.5442728, 1.058753, 0, 0, 0, 1, 1,
1.116176, -1.26354, 2.094213, 0, 0, 0, 1, 1,
1.116198, 0.04997491, 3.402444, 0, 0, 0, 1, 1,
1.117355, -1.461168, 1.645336, 0, 0, 0, 1, 1,
1.129183, -2.18739, 4.160583, 1, 1, 1, 1, 1,
1.133347, -0.2558539, 1.894141, 1, 1, 1, 1, 1,
1.134482, -1.426574, 2.898281, 1, 1, 1, 1, 1,
1.134958, -2.80958, 1.230809, 1, 1, 1, 1, 1,
1.136292, 3.164359, 2.162129, 1, 1, 1, 1, 1,
1.151427, 0.3272032, 0.5540599, 1, 1, 1, 1, 1,
1.157762, -2.92849, 2.138877, 1, 1, 1, 1, 1,
1.170991, -0.4096884, 0.7462649, 1, 1, 1, 1, 1,
1.176783, -2.233029, 2.411517, 1, 1, 1, 1, 1,
1.177135, -0.9994286, 1.872125, 1, 1, 1, 1, 1,
1.177758, 1.591855, 0.4880229, 1, 1, 1, 1, 1,
1.182104, 0.862277, 1.364776, 1, 1, 1, 1, 1,
1.187481, -0.506344, 2.2366, 1, 1, 1, 1, 1,
1.190748, -1.223962, 4.269216, 1, 1, 1, 1, 1,
1.191273, -0.703521, 3.095752, 1, 1, 1, 1, 1,
1.200234, 0.5617729, 2.154045, 0, 0, 1, 1, 1,
1.200538, 0.08151083, 1.848179, 1, 0, 0, 1, 1,
1.213387, 0.10312, 0.6560648, 1, 0, 0, 1, 1,
1.213616, -0.3053808, 0.9388965, 1, 0, 0, 1, 1,
1.24702, -0.4198638, 2.325707, 1, 0, 0, 1, 1,
1.251764, -0.4924109, 0.2672198, 1, 0, 0, 1, 1,
1.257288, -2.36694, 1.244529, 0, 0, 0, 1, 1,
1.263167, 2.385148, 0.4778492, 0, 0, 0, 1, 1,
1.276837, 1.218838, 2.069955, 0, 0, 0, 1, 1,
1.278135, 1.787246, -1.013101, 0, 0, 0, 1, 1,
1.284872, 0.4739857, 0.2219208, 0, 0, 0, 1, 1,
1.291264, 0.587723, 1.214895, 0, 0, 0, 1, 1,
1.292466, 0.6580315, 0.9489604, 0, 0, 0, 1, 1,
1.309018, 0.3398356, -1.240101, 1, 1, 1, 1, 1,
1.315569, 0.4021946, 1.058468, 1, 1, 1, 1, 1,
1.33737, 0.173954, 1.121085, 1, 1, 1, 1, 1,
1.338408, 0.264632, 3.056291, 1, 1, 1, 1, 1,
1.342941, 1.428819, -1.41523, 1, 1, 1, 1, 1,
1.356036, 0.6831086, 0.9754811, 1, 1, 1, 1, 1,
1.357404, -1.162531, 2.586935, 1, 1, 1, 1, 1,
1.359269, -0.261251, 0.895248, 1, 1, 1, 1, 1,
1.365093, 0.1069451, 0.7131038, 1, 1, 1, 1, 1,
1.369248, 0.2886681, 2.176141, 1, 1, 1, 1, 1,
1.369745, -0.8154265, 1.016581, 1, 1, 1, 1, 1,
1.370944, 0.5567172, 2.358654, 1, 1, 1, 1, 1,
1.376248, 1.311561, 0.2430407, 1, 1, 1, 1, 1,
1.391847, -0.460697, 0.6710263, 1, 1, 1, 1, 1,
1.395586, -1.935009, 3.408099, 1, 1, 1, 1, 1,
1.397158, 2.230954, 1.059635, 0, 0, 1, 1, 1,
1.403655, -2.153013, 3.526541, 1, 0, 0, 1, 1,
1.414032, -0.4770229, 0.426989, 1, 0, 0, 1, 1,
1.419954, 0.06859192, 1.568029, 1, 0, 0, 1, 1,
1.425619, -1.011085, 3.100988, 1, 0, 0, 1, 1,
1.425706, 1.174648, -1.89396, 1, 0, 0, 1, 1,
1.4432, -2.195194, 1.794103, 0, 0, 0, 1, 1,
1.443614, 1.749848, 1.1246, 0, 0, 0, 1, 1,
1.446726, -1.674361, 3.110857, 0, 0, 0, 1, 1,
1.474313, 1.286571, 2.019734, 0, 0, 0, 1, 1,
1.477975, 0.3596584, 0.7728497, 0, 0, 0, 1, 1,
1.485897, 0.8093374, 3.218625, 0, 0, 0, 1, 1,
1.501502, -1.503283, 1.258312, 0, 0, 0, 1, 1,
1.506057, -0.07147703, 1.575858, 1, 1, 1, 1, 1,
1.510875, -0.316831, 3.005441, 1, 1, 1, 1, 1,
1.51091, -0.4361528, 1.52815, 1, 1, 1, 1, 1,
1.533405, 0.5627993, 2.600653, 1, 1, 1, 1, 1,
1.53439, -1.857244, 1.018669, 1, 1, 1, 1, 1,
1.544366, -1.125547, 1.248565, 1, 1, 1, 1, 1,
1.544884, -1.290735, 1.172149, 1, 1, 1, 1, 1,
1.550649, 0.08539623, 1.293635, 1, 1, 1, 1, 1,
1.566041, -0.2796134, 0.5670407, 1, 1, 1, 1, 1,
1.585874, -0.2840051, 1.766196, 1, 1, 1, 1, 1,
1.585888, -0.0488484, -0.04880337, 1, 1, 1, 1, 1,
1.593317, -1.222726, 0.5340505, 1, 1, 1, 1, 1,
1.638243, -0.6753624, 0.9615115, 1, 1, 1, 1, 1,
1.639428, -0.3439331, 3.518188, 1, 1, 1, 1, 1,
1.641256, -0.6150541, 2.517685, 1, 1, 1, 1, 1,
1.663776, -1.416489, 1.475617, 0, 0, 1, 1, 1,
1.685458, -0.006178403, 2.341349, 1, 0, 0, 1, 1,
1.687717, 1.076151, 0.6116691, 1, 0, 0, 1, 1,
1.697077, 0.9049675, 1.564809, 1, 0, 0, 1, 1,
1.698807, 0.5764124, 0.2164429, 1, 0, 0, 1, 1,
1.703996, 0.8974903, 2.377753, 1, 0, 0, 1, 1,
1.706442, 0.1822958, 0.9266787, 0, 0, 0, 1, 1,
1.740344, -0.5365205, 1.607518, 0, 0, 0, 1, 1,
1.741717, -0.7624854, 2.170321, 0, 0, 0, 1, 1,
1.742801, -1.905661, 2.298648, 0, 0, 0, 1, 1,
1.743711, 1.85159, 0.1303372, 0, 0, 0, 1, 1,
1.75843, -0.1322489, 1.036122, 0, 0, 0, 1, 1,
1.76378, -0.04042369, 1.586163, 0, 0, 0, 1, 1,
1.776383, 0.05522539, 2.707573, 1, 1, 1, 1, 1,
1.784653, -1.79916, 1.596653, 1, 1, 1, 1, 1,
1.80997, -1.843919, 1.591099, 1, 1, 1, 1, 1,
1.835063, 0.6765832, 1.125511, 1, 1, 1, 1, 1,
1.867608, -1.225969, 1.370914, 1, 1, 1, 1, 1,
1.899444, -1.422576, 3.773674, 1, 1, 1, 1, 1,
1.902917, -1.762301, 1.473157, 1, 1, 1, 1, 1,
1.906678, 0.2882072, 3.457993, 1, 1, 1, 1, 1,
1.912502, -0.0974395, 2.000411, 1, 1, 1, 1, 1,
1.919555, -0.9244184, 1.508269, 1, 1, 1, 1, 1,
1.923835, -0.007791655, 2.327326, 1, 1, 1, 1, 1,
1.977767, 0.730186, 3.099125, 1, 1, 1, 1, 1,
1.989189, -0.8041795, 0.9611763, 1, 1, 1, 1, 1,
2.010364, 0.3676041, 1.223584, 1, 1, 1, 1, 1,
2.017426, -2.044878, 1.829803, 1, 1, 1, 1, 1,
2.062029, 1.37456, 0.9330403, 0, 0, 1, 1, 1,
2.080553, -0.2715891, 1.25941, 1, 0, 0, 1, 1,
2.137486, 1.808187, 1.285136, 1, 0, 0, 1, 1,
2.154681, 0.652388, 1.249746, 1, 0, 0, 1, 1,
2.225932, -1.140755, 1.373532, 1, 0, 0, 1, 1,
2.237598, -0.7533394, 1.255483, 1, 0, 0, 1, 1,
2.238744, -1.621254, 1.852118, 0, 0, 0, 1, 1,
2.239817, 0.2321407, -1.277226, 0, 0, 0, 1, 1,
2.243293, -0.2377934, 1.264439, 0, 0, 0, 1, 1,
2.266472, 0.9422334, 0.6732429, 0, 0, 0, 1, 1,
2.295069, -1.226213, 2.911925, 0, 0, 0, 1, 1,
2.30514, -0.3476053, 0.4087971, 0, 0, 0, 1, 1,
2.362768, 1.235591, 1.126421, 0, 0, 0, 1, 1,
2.476472, 0.08903337, 2.21004, 1, 1, 1, 1, 1,
2.493299, -0.04760745, 1.286954, 1, 1, 1, 1, 1,
2.518319, -0.5347244, 2.565295, 1, 1, 1, 1, 1,
2.544193, 1.598219, 1.314061, 1, 1, 1, 1, 1,
2.587137, -3.291298, 3.196314, 1, 1, 1, 1, 1,
2.759923, 0.7454913, 0.5296423, 1, 1, 1, 1, 1,
2.879714, -1.383618, 1.772695, 1, 1, 1, 1, 1
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
var radius = 9.980816;
var distance = 35.05719;
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
mvMatrix.translate( -0.09777951, -0.03027344, 0.0110147 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.05719);
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
