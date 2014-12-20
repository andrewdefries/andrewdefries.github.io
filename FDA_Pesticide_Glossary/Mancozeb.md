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
-2.842928, -0.6551754, -2.513369, 1, 0, 0, 1,
-2.482859, 1.147711, 0.3617719, 1, 0.007843138, 0, 1,
-2.479729, 0.6702563, -1.062192, 1, 0.01176471, 0, 1,
-2.363424, -1.556926, -2.822756, 1, 0.01960784, 0, 1,
-2.359818, 1.48822, -2.315826, 1, 0.02352941, 0, 1,
-2.359414, 0.2446501, -0.7584819, 1, 0.03137255, 0, 1,
-2.265624, -0.5237716, -2.867729, 1, 0.03529412, 0, 1,
-2.247638, 0.08493479, -1.839713, 1, 0.04313726, 0, 1,
-2.194481, 0.09710178, -1.370528, 1, 0.04705882, 0, 1,
-2.174941, 0.7253796, -1.194342, 1, 0.05490196, 0, 1,
-2.110403, 0.07680195, 0.05156359, 1, 0.05882353, 0, 1,
-2.094977, -3.290159, -2.296645, 1, 0.06666667, 0, 1,
-2.089756, -0.911419, -3.401345, 1, 0.07058824, 0, 1,
-2.064505, -0.8237463, -3.649927, 1, 0.07843138, 0, 1,
-2.052549, 0.8257984, -0.8530931, 1, 0.08235294, 0, 1,
-2.042343, -0.2214457, -1.927217, 1, 0.09019608, 0, 1,
-2.040653, -0.266159, -1.256871, 1, 0.09411765, 0, 1,
-2.039487, 1.946097, -1.19348, 1, 0.1019608, 0, 1,
-1.987345, -0.003816844, -2.407714, 1, 0.1098039, 0, 1,
-1.966499, 1.281072, -1.825453, 1, 0.1137255, 0, 1,
-1.930033, -0.2294413, -1.317348, 1, 0.1215686, 0, 1,
-1.908454, 0.208712, -2.861849, 1, 0.1254902, 0, 1,
-1.887378, 1.403092, -1.31859, 1, 0.1333333, 0, 1,
-1.873729, -0.9044586, -1.444586, 1, 0.1372549, 0, 1,
-1.809297, 2.458151, -0.5310404, 1, 0.145098, 0, 1,
-1.792002, -0.06674527, -2.383025, 1, 0.1490196, 0, 1,
-1.786274, -0.07352346, -1.89309, 1, 0.1568628, 0, 1,
-1.763116, 0.8368509, -1.427638, 1, 0.1607843, 0, 1,
-1.757299, -1.720805, -2.596071, 1, 0.1686275, 0, 1,
-1.754314, 0.5059792, 0.02052017, 1, 0.172549, 0, 1,
-1.753132, -0.3493222, -2.657545, 1, 0.1803922, 0, 1,
-1.751838, 1.024619, 0.5713658, 1, 0.1843137, 0, 1,
-1.731708, -1.556232, -3.146797, 1, 0.1921569, 0, 1,
-1.731048, 0.6480197, -1.350256, 1, 0.1960784, 0, 1,
-1.716788, -0.375026, -1.466283, 1, 0.2039216, 0, 1,
-1.691915, -0.2726557, -1.639005, 1, 0.2117647, 0, 1,
-1.685828, 1.102243, -0.183804, 1, 0.2156863, 0, 1,
-1.684965, 0.3404033, 0.0266189, 1, 0.2235294, 0, 1,
-1.666991, -1.627187, -2.72475, 1, 0.227451, 0, 1,
-1.662409, -0.00163214, -1.234626, 1, 0.2352941, 0, 1,
-1.656635, 0.4730569, -2.965719, 1, 0.2392157, 0, 1,
-1.638785, -1.228104, -2.122971, 1, 0.2470588, 0, 1,
-1.634295, 0.4886246, -0.607673, 1, 0.2509804, 0, 1,
-1.625437, 0.2246421, -0.9449441, 1, 0.2588235, 0, 1,
-1.625244, -0.3740732, -2.116349, 1, 0.2627451, 0, 1,
-1.624443, -0.1119707, -3.589375, 1, 0.2705882, 0, 1,
-1.619738, 0.8651657, -1.412142, 1, 0.2745098, 0, 1,
-1.612772, -2.68123, -2.86253, 1, 0.282353, 0, 1,
-1.612204, 0.6076521, -0.2553562, 1, 0.2862745, 0, 1,
-1.610105, 0.05352721, -2.115173, 1, 0.2941177, 0, 1,
-1.609547, -0.8680114, 0.2040958, 1, 0.3019608, 0, 1,
-1.607384, -2.408012, -1.435283, 1, 0.3058824, 0, 1,
-1.598375, -1.864098, 0.5914755, 1, 0.3137255, 0, 1,
-1.595044, -0.8506553, -2.147204, 1, 0.3176471, 0, 1,
-1.591851, -0.04563576, 0.2027725, 1, 0.3254902, 0, 1,
-1.579119, 1.893688, -1.289081, 1, 0.3294118, 0, 1,
-1.575915, -1.279798, -1.539973, 1, 0.3372549, 0, 1,
-1.557866, 0.3605831, 0.1763246, 1, 0.3411765, 0, 1,
-1.547461, 0.8484122, -1.07563, 1, 0.3490196, 0, 1,
-1.537805, -0.438878, -1.726635, 1, 0.3529412, 0, 1,
-1.533977, 0.6024992, -0.519891, 1, 0.3607843, 0, 1,
-1.527334, -0.3268193, -1.204956, 1, 0.3647059, 0, 1,
-1.502106, 0.3374704, -1.619929, 1, 0.372549, 0, 1,
-1.487487, -0.1201857, -2.309513, 1, 0.3764706, 0, 1,
-1.479513, 0.5602065, -1.63633, 1, 0.3843137, 0, 1,
-1.478869, 0.1209303, 1.473586, 1, 0.3882353, 0, 1,
-1.469339, -1.198948, -2.152744, 1, 0.3960784, 0, 1,
-1.454749, -0.7562697, -3.09853, 1, 0.4039216, 0, 1,
-1.446135, -2.075562, -4.369813, 1, 0.4078431, 0, 1,
-1.443859, 0.3496546, -0.377214, 1, 0.4156863, 0, 1,
-1.441744, 0.1453406, -1.193439, 1, 0.4196078, 0, 1,
-1.437918, -0.429609, -0.7006331, 1, 0.427451, 0, 1,
-1.432684, -0.3522524, -0.07956306, 1, 0.4313726, 0, 1,
-1.419632, 1.961413, -0.4433177, 1, 0.4392157, 0, 1,
-1.413061, 1.669067, -1.767277, 1, 0.4431373, 0, 1,
-1.410413, -1.065274, -2.298181, 1, 0.4509804, 0, 1,
-1.404638, -0.3307842, -1.394062, 1, 0.454902, 0, 1,
-1.399113, -0.7868084, -2.623552, 1, 0.4627451, 0, 1,
-1.392871, 0.5836219, -0.2373318, 1, 0.4666667, 0, 1,
-1.3846, -0.1906646, -1.712849, 1, 0.4745098, 0, 1,
-1.36557, -0.3471529, -1.428614, 1, 0.4784314, 0, 1,
-1.355192, 0.1660554, -1.546914, 1, 0.4862745, 0, 1,
-1.354565, 1.264489, -2.733829, 1, 0.4901961, 0, 1,
-1.349527, 0.4024673, -3.019485, 1, 0.4980392, 0, 1,
-1.318057, -0.6376913, -2.857987, 1, 0.5058824, 0, 1,
-1.316218, 0.08237784, -1.216451, 1, 0.509804, 0, 1,
-1.311456, -0.9610038, -3.053294, 1, 0.5176471, 0, 1,
-1.309724, 0.6887308, -1.045858, 1, 0.5215687, 0, 1,
-1.301319, 0.5488862, -3.127848, 1, 0.5294118, 0, 1,
-1.299226, 0.1646701, -2.326236, 1, 0.5333334, 0, 1,
-1.290967, 0.6363577, -1.841101, 1, 0.5411765, 0, 1,
-1.277855, 0.3854258, -3.023524, 1, 0.5450981, 0, 1,
-1.264706, 0.1974241, -0.9075617, 1, 0.5529412, 0, 1,
-1.234955, -1.267576, -1.737574, 1, 0.5568628, 0, 1,
-1.23143, -0.8769529, 1.069481, 1, 0.5647059, 0, 1,
-1.228949, -0.4107312, -1.736272, 1, 0.5686275, 0, 1,
-1.218716, -0.0902705, -1.06475, 1, 0.5764706, 0, 1,
-1.211294, -0.8799144, -0.7105668, 1, 0.5803922, 0, 1,
-1.20148, -0.2190947, -1.236015, 1, 0.5882353, 0, 1,
-1.193661, -1.055378, -4.605491, 1, 0.5921569, 0, 1,
-1.193468, 2.004174, -1.292101, 1, 0.6, 0, 1,
-1.190427, 0.2301757, -3.020023, 1, 0.6078432, 0, 1,
-1.188858, -0.4424031, -0.7884668, 1, 0.6117647, 0, 1,
-1.180127, 0.3917851, -0.2597555, 1, 0.6196079, 0, 1,
-1.176789, -1.234377, -0.1659478, 1, 0.6235294, 0, 1,
-1.175166, 1.796823, -1.878021, 1, 0.6313726, 0, 1,
-1.172724, 0.1017177, -0.3741115, 1, 0.6352941, 0, 1,
-1.171717, -0.1645713, -1.224166, 1, 0.6431373, 0, 1,
-1.162971, -0.8317531, -1.882264, 1, 0.6470588, 0, 1,
-1.162351, -0.07961746, -3.28803, 1, 0.654902, 0, 1,
-1.161391, -1.351133, -2.320695, 1, 0.6588235, 0, 1,
-1.134075, 0.5950788, 0.09259246, 1, 0.6666667, 0, 1,
-1.12988, 0.4172393, -0.4863021, 1, 0.6705883, 0, 1,
-1.125051, -0.8709913, -3.118986, 1, 0.6784314, 0, 1,
-1.124215, 0.3822781, -1.160476, 1, 0.682353, 0, 1,
-1.114987, 0.07311929, -3.4495, 1, 0.6901961, 0, 1,
-1.111494, -0.5763182, -4.272481, 1, 0.6941177, 0, 1,
-1.105125, -0.5548803, -3.489307, 1, 0.7019608, 0, 1,
-1.103807, 0.8469438, -2.001271, 1, 0.7098039, 0, 1,
-1.083552, 0.6464135, -1.451122, 1, 0.7137255, 0, 1,
-1.079163, 0.875205, -3.008719, 1, 0.7215686, 0, 1,
-1.068144, 1.454288, -2.272466, 1, 0.7254902, 0, 1,
-1.068088, 0.03712964, -2.907913, 1, 0.7333333, 0, 1,
-1.065348, 1.482141, -1.397747, 1, 0.7372549, 0, 1,
-1.064663, 1.579701, 0.8940606, 1, 0.7450981, 0, 1,
-1.057157, -0.1359002, -1.819692, 1, 0.7490196, 0, 1,
-1.051353, 0.05578621, 0.7745339, 1, 0.7568628, 0, 1,
-1.051242, 1.001271, -2.070237, 1, 0.7607843, 0, 1,
-1.04416, 0.1841315, -1.230482, 1, 0.7686275, 0, 1,
-1.037282, -0.1917433, -1.303253, 1, 0.772549, 0, 1,
-1.03574, 1.45878, -2.654274, 1, 0.7803922, 0, 1,
-1.031621, 0.1451914, -2.501803, 1, 0.7843137, 0, 1,
-1.02991, 1.030317, -0.5254666, 1, 0.7921569, 0, 1,
-1.024851, -0.9124011, -2.110675, 1, 0.7960784, 0, 1,
-1.019575, 0.2253485, -0.6665057, 1, 0.8039216, 0, 1,
-1.016937, -1.151931, -2.38558, 1, 0.8117647, 0, 1,
-1.015498, -0.7617705, -4.837955, 1, 0.8156863, 0, 1,
-1.014429, 0.5804614, -0.409133, 1, 0.8235294, 0, 1,
-1.00325, 0.4192933, -0.9440167, 1, 0.827451, 0, 1,
-1.000273, -0.5270644, -2.935286, 1, 0.8352941, 0, 1,
-0.9971672, 0.7387573, -1.409265, 1, 0.8392157, 0, 1,
-0.9965351, -0.4074085, -1.562385, 1, 0.8470588, 0, 1,
-0.9834112, 0.1473992, -1.831882, 1, 0.8509804, 0, 1,
-0.9821213, -0.972536, -2.163871, 1, 0.8588235, 0, 1,
-0.9772696, 1.273832, -0.33411, 1, 0.8627451, 0, 1,
-0.9745114, -0.9747365, -1.702197, 1, 0.8705882, 0, 1,
-0.9614726, -0.9579778, -4.544501, 1, 0.8745098, 0, 1,
-0.9534528, 0.2907911, -1.350324, 1, 0.8823529, 0, 1,
-0.9519374, -0.3381557, -2.850748, 1, 0.8862745, 0, 1,
-0.9515812, 0.3105299, -3.162949, 1, 0.8941177, 0, 1,
-0.9472452, 0.9174361, -1.25636, 1, 0.8980392, 0, 1,
-0.9468539, 1.505616, -0.4162293, 1, 0.9058824, 0, 1,
-0.9426956, 0.1855831, 0.5322507, 1, 0.9137255, 0, 1,
-0.9354605, 1.313262, 0.001441826, 1, 0.9176471, 0, 1,
-0.9316611, -0.5773996, -2.24628, 1, 0.9254902, 0, 1,
-0.9302764, -0.5308005, -1.739759, 1, 0.9294118, 0, 1,
-0.9298945, 0.9861441, -1.299791, 1, 0.9372549, 0, 1,
-0.9263635, 1.617592, 1.739966, 1, 0.9411765, 0, 1,
-0.9194983, 0.2906858, -2.072183, 1, 0.9490196, 0, 1,
-0.9189347, 0.7571267, 0.2671986, 1, 0.9529412, 0, 1,
-0.9161367, 1.139288, -1.188894, 1, 0.9607843, 0, 1,
-0.9158026, -0.9795801, -2.898173, 1, 0.9647059, 0, 1,
-0.9074907, -1.006127, -2.13739, 1, 0.972549, 0, 1,
-0.9058517, 1.342199, 1.134605, 1, 0.9764706, 0, 1,
-0.9044939, -1.479149, -3.900162, 1, 0.9843137, 0, 1,
-0.8985837, -0.1263312, -0.9767892, 1, 0.9882353, 0, 1,
-0.8959663, -0.185534, -3.327955, 1, 0.9960784, 0, 1,
-0.8828647, -1.707337, -3.901062, 0.9960784, 1, 0, 1,
-0.8788562, 1.563865, 0.5511981, 0.9921569, 1, 0, 1,
-0.8757775, -0.7065785, -2.976214, 0.9843137, 1, 0, 1,
-0.8752679, -1.082814, -2.860892, 0.9803922, 1, 0, 1,
-0.8733661, 0.4726944, -2.164455, 0.972549, 1, 0, 1,
-0.8717054, 1.117593, -0.8783019, 0.9686275, 1, 0, 1,
-0.8621033, -0.5917336, -2.509327, 0.9607843, 1, 0, 1,
-0.8603276, 2.371836, -1.759934, 0.9568627, 1, 0, 1,
-0.8585429, 0.4066343, -1.744327, 0.9490196, 1, 0, 1,
-0.8540406, -1.648421, -2.134514, 0.945098, 1, 0, 1,
-0.8470765, -0.6946489, -2.357849, 0.9372549, 1, 0, 1,
-0.8396558, 0.1397714, -1.199768, 0.9333333, 1, 0, 1,
-0.833393, 0.7215258, -0.2788917, 0.9254902, 1, 0, 1,
-0.8323395, -1.550197, -3.157549, 0.9215686, 1, 0, 1,
-0.8296622, 1.240728, -1.340645, 0.9137255, 1, 0, 1,
-0.8257783, 0.4892993, -1.078565, 0.9098039, 1, 0, 1,
-0.8246306, 0.03609091, -0.6945205, 0.9019608, 1, 0, 1,
-0.8244143, -2.689162, -3.18904, 0.8941177, 1, 0, 1,
-0.8233889, -0.6430475, -4.029297, 0.8901961, 1, 0, 1,
-0.8193608, 0.8004674, -0.095499, 0.8823529, 1, 0, 1,
-0.8193102, -1.257751, -3.300858, 0.8784314, 1, 0, 1,
-0.8100112, 1.232695, -1.38664, 0.8705882, 1, 0, 1,
-0.8091683, -1.580391, -3.285087, 0.8666667, 1, 0, 1,
-0.8066611, -0.4154024, -1.934865, 0.8588235, 1, 0, 1,
-0.8065004, -1.445619, -3.431175, 0.854902, 1, 0, 1,
-0.8018091, -0.3264132, -0.2807319, 0.8470588, 1, 0, 1,
-0.8014105, 1.119355, 1.34404, 0.8431373, 1, 0, 1,
-0.8011004, 2.454734, -0.2468687, 0.8352941, 1, 0, 1,
-0.7955526, -0.6558939, -3.165063, 0.8313726, 1, 0, 1,
-0.7944747, -1.412922, -2.227841, 0.8235294, 1, 0, 1,
-0.7916066, -0.7437012, -3.380879, 0.8196079, 1, 0, 1,
-0.7878076, 1.939336, 0.879589, 0.8117647, 1, 0, 1,
-0.7792355, -2.308131, -2.101296, 0.8078431, 1, 0, 1,
-0.7761917, 0.7265876, -0.822162, 0.8, 1, 0, 1,
-0.7743637, 1.616162, -0.02564337, 0.7921569, 1, 0, 1,
-0.7677478, -2.016293, -3.360656, 0.7882353, 1, 0, 1,
-0.7669488, -0.1780764, -2.794229, 0.7803922, 1, 0, 1,
-0.764387, 0.06863243, -0.3077144, 0.7764706, 1, 0, 1,
-0.7639632, -0.6749377, -3.503304, 0.7686275, 1, 0, 1,
-0.7616346, 0.8678674, -0.9914932, 0.7647059, 1, 0, 1,
-0.760595, -0.3295664, -1.31875, 0.7568628, 1, 0, 1,
-0.7592071, 0.2000537, -1.733871, 0.7529412, 1, 0, 1,
-0.7536412, -2.064087, -3.196127, 0.7450981, 1, 0, 1,
-0.751171, 0.5793487, -2.061025, 0.7411765, 1, 0, 1,
-0.7406542, 1.810466, 0.9922218, 0.7333333, 1, 0, 1,
-0.7365628, -0.6642215, -3.922752, 0.7294118, 1, 0, 1,
-0.7359956, -0.9815452, -1.720883, 0.7215686, 1, 0, 1,
-0.7256982, -1.000867, -2.735694, 0.7176471, 1, 0, 1,
-0.7254247, -0.4025204, -2.724314, 0.7098039, 1, 0, 1,
-0.7248594, 0.8266738, -0.1682179, 0.7058824, 1, 0, 1,
-0.7238984, -1.012435, -1.44613, 0.6980392, 1, 0, 1,
-0.7234364, -0.2953365, -3.325802, 0.6901961, 1, 0, 1,
-0.7204913, -0.1993803, -2.12021, 0.6862745, 1, 0, 1,
-0.7182176, 0.3775835, -1.750401, 0.6784314, 1, 0, 1,
-0.7121908, -1.636436, -2.626367, 0.6745098, 1, 0, 1,
-0.7070889, 0.6371725, -0.4687451, 0.6666667, 1, 0, 1,
-0.7031804, 0.3604739, -0.954491, 0.6627451, 1, 0, 1,
-0.7028127, 0.003455248, -3.325282, 0.654902, 1, 0, 1,
-0.6992013, 0.06200564, -1.653835, 0.6509804, 1, 0, 1,
-0.6980835, -0.2525102, -1.404978, 0.6431373, 1, 0, 1,
-0.6968553, 1.130106, 0.2965852, 0.6392157, 1, 0, 1,
-0.6944708, 0.7616057, -2.008468, 0.6313726, 1, 0, 1,
-0.692982, -0.167895, -3.200935, 0.627451, 1, 0, 1,
-0.6900524, -1.213683, -2.330198, 0.6196079, 1, 0, 1,
-0.6894733, -0.2576867, -0.351532, 0.6156863, 1, 0, 1,
-0.6829951, 0.3004175, -1.962762, 0.6078432, 1, 0, 1,
-0.6829922, -0.4450958, -1.17598, 0.6039216, 1, 0, 1,
-0.667143, 1.218213, 2.601809, 0.5960785, 1, 0, 1,
-0.6663607, -1.709931, -2.782672, 0.5882353, 1, 0, 1,
-0.6590219, 1.300017, -0.4877236, 0.5843138, 1, 0, 1,
-0.6582719, 2.062379, 1.220499, 0.5764706, 1, 0, 1,
-0.6534337, -1.318051, -2.14959, 0.572549, 1, 0, 1,
-0.6511321, 0.07650413, -2.346086, 0.5647059, 1, 0, 1,
-0.6510918, 0.3292486, -2.273377, 0.5607843, 1, 0, 1,
-0.6455696, 2.269685, -0.7460369, 0.5529412, 1, 0, 1,
-0.6440887, -1.408337, -2.16226, 0.5490196, 1, 0, 1,
-0.6415483, -1.636441, -3.124423, 0.5411765, 1, 0, 1,
-0.6382157, 1.296415, 0.6287016, 0.5372549, 1, 0, 1,
-0.6365495, 1.52913, -0.07570516, 0.5294118, 1, 0, 1,
-0.6361046, 0.5722094, 0.1139798, 0.5254902, 1, 0, 1,
-0.628354, -0.517521, -2.457751, 0.5176471, 1, 0, 1,
-0.6259599, 0.2476398, -0.9067315, 0.5137255, 1, 0, 1,
-0.623359, -0.4629163, -2.893687, 0.5058824, 1, 0, 1,
-0.6215343, 0.282388, -1.487369, 0.5019608, 1, 0, 1,
-0.6211162, -0.1613869, -1.653775, 0.4941176, 1, 0, 1,
-0.6161138, -2.559103, -3.365392, 0.4862745, 1, 0, 1,
-0.614286, -0.05525836, -1.481774, 0.4823529, 1, 0, 1,
-0.6123122, 0.2792541, -1.413299, 0.4745098, 1, 0, 1,
-0.6113862, 0.4425958, -2.308249, 0.4705882, 1, 0, 1,
-0.6113188, -2.185003, 0.2786536, 0.4627451, 1, 0, 1,
-0.6109239, -0.8710507, -1.151884, 0.4588235, 1, 0, 1,
-0.6088797, -0.6318262, -2.596761, 0.4509804, 1, 0, 1,
-0.6086445, 0.5197178, -1.507944, 0.4470588, 1, 0, 1,
-0.601384, -0.00809001, -2.596579, 0.4392157, 1, 0, 1,
-0.5991716, -0.8198012, -2.577251, 0.4352941, 1, 0, 1,
-0.5971621, 0.03990924, 0.987013, 0.427451, 1, 0, 1,
-0.5948335, -0.4006639, -1.007217, 0.4235294, 1, 0, 1,
-0.5947305, 1.388751, -1.460887, 0.4156863, 1, 0, 1,
-0.5939204, -0.5535461, -1.93868, 0.4117647, 1, 0, 1,
-0.5931391, 2.381634, -0.2787083, 0.4039216, 1, 0, 1,
-0.5873113, 0.3981469, -0.573766, 0.3960784, 1, 0, 1,
-0.5868846, 0.07533624, -0.4168064, 0.3921569, 1, 0, 1,
-0.5868369, 0.8213776, -0.9031704, 0.3843137, 1, 0, 1,
-0.5860308, -0.07511124, -2.492012, 0.3803922, 1, 0, 1,
-0.5846705, 0.09222858, 0.1227102, 0.372549, 1, 0, 1,
-0.5837938, 0.6882212, -1.19644, 0.3686275, 1, 0, 1,
-0.5812892, 0.4211271, 0.215511, 0.3607843, 1, 0, 1,
-0.5806318, 0.05960922, -1.981972, 0.3568628, 1, 0, 1,
-0.5758315, -0.5355365, -2.358752, 0.3490196, 1, 0, 1,
-0.5749844, 0.5297177, -0.8042542, 0.345098, 1, 0, 1,
-0.5723062, 0.7097639, -1.995075, 0.3372549, 1, 0, 1,
-0.5687135, -0.589449, -4.897166, 0.3333333, 1, 0, 1,
-0.5655711, -0.1955022, -0.9981302, 0.3254902, 1, 0, 1,
-0.5655222, 0.685958, -0.6961354, 0.3215686, 1, 0, 1,
-0.5597875, -0.2107637, -4.369429, 0.3137255, 1, 0, 1,
-0.5595946, 1.984048, 0.2712856, 0.3098039, 1, 0, 1,
-0.5539232, -2.134911, -2.906313, 0.3019608, 1, 0, 1,
-0.5536894, -0.8029372, -1.393166, 0.2941177, 1, 0, 1,
-0.5503488, -0.1824763, -3.444751, 0.2901961, 1, 0, 1,
-0.5496193, 0.07987472, -2.913071, 0.282353, 1, 0, 1,
-0.5483683, 0.2905911, -0.8383995, 0.2784314, 1, 0, 1,
-0.5478835, 0.3632433, -1.171889, 0.2705882, 1, 0, 1,
-0.5471346, 0.3574787, -2.356003, 0.2666667, 1, 0, 1,
-0.5468065, -1.464326, -2.189318, 0.2588235, 1, 0, 1,
-0.5439099, 0.426599, -0.8420737, 0.254902, 1, 0, 1,
-0.5435695, 0.2081078, -1.926297, 0.2470588, 1, 0, 1,
-0.5305698, -1.374142, -3.710577, 0.2431373, 1, 0, 1,
-0.5271996, 0.3516012, -1.304887, 0.2352941, 1, 0, 1,
-0.5265458, 0.2827874, -1.66972, 0.2313726, 1, 0, 1,
-0.5234463, -0.8746926, -1.41392, 0.2235294, 1, 0, 1,
-0.5227224, -0.8061221, -2.225477, 0.2196078, 1, 0, 1,
-0.5211678, -0.594864, -1.412466, 0.2117647, 1, 0, 1,
-0.5207219, 1.263048, 0.5039461, 0.2078431, 1, 0, 1,
-0.5199825, 0.7676238, -2.330697, 0.2, 1, 0, 1,
-0.51666, 0.7541014, -1.348453, 0.1921569, 1, 0, 1,
-0.512795, -0.05919807, -2.094367, 0.1882353, 1, 0, 1,
-0.510203, 0.3743941, -1.080888, 0.1803922, 1, 0, 1,
-0.5080142, 1.944952, -2.681858, 0.1764706, 1, 0, 1,
-0.507997, -1.769049, -3.365903, 0.1686275, 1, 0, 1,
-0.5072688, 0.8210614, -1.524712, 0.1647059, 1, 0, 1,
-0.5059023, -1.083311, -1.951494, 0.1568628, 1, 0, 1,
-0.498924, 0.09277609, -3.217283, 0.1529412, 1, 0, 1,
-0.498877, 0.5096432, -1.231075, 0.145098, 1, 0, 1,
-0.4962063, 1.108583, -0.08279615, 0.1411765, 1, 0, 1,
-0.4820339, 0.1878636, -0.8064039, 0.1333333, 1, 0, 1,
-0.48079, -0.8697792, -3.638764, 0.1294118, 1, 0, 1,
-0.4798745, -0.4405496, -1.894796, 0.1215686, 1, 0, 1,
-0.4661468, -0.3844427, -2.978523, 0.1176471, 1, 0, 1,
-0.4653325, 0.4964249, -0.1151033, 0.1098039, 1, 0, 1,
-0.4646572, 1.181448, -0.0009259612, 0.1058824, 1, 0, 1,
-0.4619686, -1.556672, -0.9761755, 0.09803922, 1, 0, 1,
-0.4605529, 1.167183, -1.75027, 0.09019608, 1, 0, 1,
-0.4590127, -1.224462, -3.43286, 0.08627451, 1, 0, 1,
-0.4584433, 0.891921, 1.746423, 0.07843138, 1, 0, 1,
-0.4569937, -0.6991419, -3.816696, 0.07450981, 1, 0, 1,
-0.4512123, -0.3952586, -1.991792, 0.06666667, 1, 0, 1,
-0.4507031, -1.065007, -2.301243, 0.0627451, 1, 0, 1,
-0.4491771, 1.213544, 1.805585, 0.05490196, 1, 0, 1,
-0.4491488, 0.9939766, -0.09879524, 0.05098039, 1, 0, 1,
-0.4469296, -0.06657785, -2.740571, 0.04313726, 1, 0, 1,
-0.4435535, 0.1950003, -0.8528748, 0.03921569, 1, 0, 1,
-0.4411301, 1.616361, -1.104607, 0.03137255, 1, 0, 1,
-0.4391403, -0.3374247, -1.415222, 0.02745098, 1, 0, 1,
-0.4355046, 0.3379121, -0.8996652, 0.01960784, 1, 0, 1,
-0.4352451, -0.1136879, -2.977599, 0.01568628, 1, 0, 1,
-0.4343011, -1.141926, -1.197093, 0.007843138, 1, 0, 1,
-0.4270855, -0.4261037, -3.463997, 0.003921569, 1, 0, 1,
-0.4235095, 0.4349523, -0.4879619, 0, 1, 0.003921569, 1,
-0.4173482, -2.08898, -2.256322, 0, 1, 0.01176471, 1,
-0.4142516, -0.6642752, -2.399006, 0, 1, 0.01568628, 1,
-0.4110697, 1.440345, 0.01647967, 0, 1, 0.02352941, 1,
-0.4104186, 1.379184, -1.076604, 0, 1, 0.02745098, 1,
-0.4101167, -0.3207759, -2.571998, 0, 1, 0.03529412, 1,
-0.4097155, -1.87334, -3.539558, 0, 1, 0.03921569, 1,
-0.4067134, 1.548336, -0.7903368, 0, 1, 0.04705882, 1,
-0.4061108, -0.7695857, -1.780757, 0, 1, 0.05098039, 1,
-0.40468, 1.258321, -1.245134, 0, 1, 0.05882353, 1,
-0.4043093, -1.84442, -4.648094, 0, 1, 0.0627451, 1,
-0.4029559, -1.222448, -3.157403, 0, 1, 0.07058824, 1,
-0.4011229, -0.3584595, -2.032789, 0, 1, 0.07450981, 1,
-0.3963981, 0.5679474, -0.708789, 0, 1, 0.08235294, 1,
-0.396137, 0.2203106, 0.04107621, 0, 1, 0.08627451, 1,
-0.394244, -0.5550379, -3.776199, 0, 1, 0.09411765, 1,
-0.3939488, 1.760342, 0.1454722, 0, 1, 0.1019608, 1,
-0.393779, -0.4330038, -1.855238, 0, 1, 0.1058824, 1,
-0.3925293, 1.154623, -0.2653311, 0, 1, 0.1137255, 1,
-0.3899556, -0.5662398, -2.187756, 0, 1, 0.1176471, 1,
-0.3891428, 1.074558, 0.7154686, 0, 1, 0.1254902, 1,
-0.3819588, -1.101548, -1.549203, 0, 1, 0.1294118, 1,
-0.3797099, -0.5856392, -3.745793, 0, 1, 0.1372549, 1,
-0.3784743, -0.2413187, -0.7618369, 0, 1, 0.1411765, 1,
-0.3713223, 1.227006, 0.1142477, 0, 1, 0.1490196, 1,
-0.3673546, -1.614214, -1.417353, 0, 1, 0.1529412, 1,
-0.3643271, 1.176453, -0.4822449, 0, 1, 0.1607843, 1,
-0.3618847, -0.8250518, -1.189566, 0, 1, 0.1647059, 1,
-0.3611864, -0.1098966, -2.870058, 0, 1, 0.172549, 1,
-0.3518377, 0.1618479, -0.4497052, 0, 1, 0.1764706, 1,
-0.3466658, -0.1014767, -2.057254, 0, 1, 0.1843137, 1,
-0.3438893, -1.233909, -3.008369, 0, 1, 0.1882353, 1,
-0.3425899, 1.902936, 1.273773, 0, 1, 0.1960784, 1,
-0.3424884, -0.7368481, -1.653337, 0, 1, 0.2039216, 1,
-0.337737, 0.8454172, -0.4166928, 0, 1, 0.2078431, 1,
-0.336327, -0.05334388, -2.004089, 0, 1, 0.2156863, 1,
-0.3319584, 2.040198, -0.7061765, 0, 1, 0.2196078, 1,
-0.3318915, -0.1223912, -3.080072, 0, 1, 0.227451, 1,
-0.329032, 2.16118, -0.7994606, 0, 1, 0.2313726, 1,
-0.322293, -0.352381, -1.66679, 0, 1, 0.2392157, 1,
-0.3167877, 0.01026951, -2.823067, 0, 1, 0.2431373, 1,
-0.3163515, 1.528211, -0.6408446, 0, 1, 0.2509804, 1,
-0.3141946, 0.4551399, -0.2699916, 0, 1, 0.254902, 1,
-0.3131391, 0.5784772, 0.9935587, 0, 1, 0.2627451, 1,
-0.3073725, 0.8236378, -1.604413, 0, 1, 0.2666667, 1,
-0.3070453, 0.6003661, 0.1721812, 0, 1, 0.2745098, 1,
-0.3062961, -0.0413513, -1.958557, 0, 1, 0.2784314, 1,
-0.3058408, 0.01220559, 0.069093, 0, 1, 0.2862745, 1,
-0.3003546, 1.507846, 1.147832, 0, 1, 0.2901961, 1,
-0.2991796, -0.2230294, -2.27369, 0, 1, 0.2980392, 1,
-0.2978919, 1.418684, 1.110415, 0, 1, 0.3058824, 1,
-0.2973625, 0.1563974, -0.9840598, 0, 1, 0.3098039, 1,
-0.2969874, -0.4683037, -3.540053, 0, 1, 0.3176471, 1,
-0.2945935, 1.143011, -0.4527156, 0, 1, 0.3215686, 1,
-0.2937325, 2.008384, 1.493518, 0, 1, 0.3294118, 1,
-0.2927105, -0.3276816, -1.961019, 0, 1, 0.3333333, 1,
-0.2861957, -0.9513404, -2.21204, 0, 1, 0.3411765, 1,
-0.2810697, 1.027861, -0.11946, 0, 1, 0.345098, 1,
-0.2741298, -0.6732897, -1.67632, 0, 1, 0.3529412, 1,
-0.2715265, -0.8707238, -3.246119, 0, 1, 0.3568628, 1,
-0.2692127, -2.256862, -1.328003, 0, 1, 0.3647059, 1,
-0.2684748, -0.4560873, -3.955794, 0, 1, 0.3686275, 1,
-0.2628478, -1.590568, -3.643484, 0, 1, 0.3764706, 1,
-0.2498747, -0.9676035, -3.301302, 0, 1, 0.3803922, 1,
-0.2423707, 1.377575, -1.413563, 0, 1, 0.3882353, 1,
-0.2422075, 0.01917104, -1.420715, 0, 1, 0.3921569, 1,
-0.2401918, 0.1587656, 0.04240277, 0, 1, 0.4, 1,
-0.2352, 0.3004128, -0.7232261, 0, 1, 0.4078431, 1,
-0.2301974, 2.337548, 1.718811, 0, 1, 0.4117647, 1,
-0.2234036, 0.2456532, -2.238896, 0, 1, 0.4196078, 1,
-0.2223248, 0.2253856, -0.915486, 0, 1, 0.4235294, 1,
-0.2218976, 0.9003937, -0.3392379, 0, 1, 0.4313726, 1,
-0.2208008, 0.6571442, -1.502813, 0, 1, 0.4352941, 1,
-0.2176403, -0.12938, -0.05947897, 0, 1, 0.4431373, 1,
-0.2174918, 0.8380751, -1.052807, 0, 1, 0.4470588, 1,
-0.2139512, -0.3371746, -2.788929, 0, 1, 0.454902, 1,
-0.2137633, -0.09632706, -1.972402, 0, 1, 0.4588235, 1,
-0.2083887, -0.3951883, -1.160197, 0, 1, 0.4666667, 1,
-0.2057138, 0.2441518, -0.9188268, 0, 1, 0.4705882, 1,
-0.2051096, -0.5588053, -2.68862, 0, 1, 0.4784314, 1,
-0.2049528, -0.8507554, -1.713894, 0, 1, 0.4823529, 1,
-0.2047249, 0.1521711, -1.506032, 0, 1, 0.4901961, 1,
-0.2028448, -0.8244238, -2.21724, 0, 1, 0.4941176, 1,
-0.1996919, -0.2860246, -0.5112084, 0, 1, 0.5019608, 1,
-0.1984227, -1.638077, -3.78297, 0, 1, 0.509804, 1,
-0.1970895, -2.456925, -3.340628, 0, 1, 0.5137255, 1,
-0.1950291, -0.9940549, -1.758215, 0, 1, 0.5215687, 1,
-0.1894547, 0.05978301, -0.1766437, 0, 1, 0.5254902, 1,
-0.18506, 1.210562, -0.2420357, 0, 1, 0.5333334, 1,
-0.1842654, 0.3176506, -0.2993591, 0, 1, 0.5372549, 1,
-0.1841002, -0.3121432, -2.705554, 0, 1, 0.5450981, 1,
-0.1818999, -0.2844467, -0.7496672, 0, 1, 0.5490196, 1,
-0.1808187, 1.963388, -1.539566, 0, 1, 0.5568628, 1,
-0.180012, -1.010906, -2.561048, 0, 1, 0.5607843, 1,
-0.1788669, 0.6524886, -0.7563984, 0, 1, 0.5686275, 1,
-0.1716512, -0.02386884, -4.062578, 0, 1, 0.572549, 1,
-0.1715143, -0.7707502, -3.025466, 0, 1, 0.5803922, 1,
-0.1687635, -0.7502726, -3.391528, 0, 1, 0.5843138, 1,
-0.1656928, 0.8239489, 1.391364, 0, 1, 0.5921569, 1,
-0.1593488, -0.9609028, -1.659243, 0, 1, 0.5960785, 1,
-0.1578511, -0.04325604, -0.07204527, 0, 1, 0.6039216, 1,
-0.1570306, 0.2560759, -2.744855, 0, 1, 0.6117647, 1,
-0.153262, 1.133701, 0.8922033, 0, 1, 0.6156863, 1,
-0.1470354, 1.548448, 0.525875, 0, 1, 0.6235294, 1,
-0.1375737, -1.80275, -4.429793, 0, 1, 0.627451, 1,
-0.1327435, -1.553547, -3.409289, 0, 1, 0.6352941, 1,
-0.1263855, 0.4239963, -1.109107, 0, 1, 0.6392157, 1,
-0.1225076, 0.8198073, 0.3039543, 0, 1, 0.6470588, 1,
-0.1172273, -1.137008, -2.334411, 0, 1, 0.6509804, 1,
-0.1154163, -1.887408, -2.263871, 0, 1, 0.6588235, 1,
-0.1016876, -0.5233223, -3.818063, 0, 1, 0.6627451, 1,
-0.09942636, -0.8784471, -2.222677, 0, 1, 0.6705883, 1,
-0.09774516, -2.099483, -2.651299, 0, 1, 0.6745098, 1,
-0.097701, 0.173639, -0.2508549, 0, 1, 0.682353, 1,
-0.09471926, 1.956634, 0.05760221, 0, 1, 0.6862745, 1,
-0.09453943, 1.176413, -0.1823159, 0, 1, 0.6941177, 1,
-0.08925901, 0.3108046, -1.6525, 0, 1, 0.7019608, 1,
-0.0862378, 2.467651, 0.1919128, 0, 1, 0.7058824, 1,
-0.08463937, 0.7035224, 2.549929, 0, 1, 0.7137255, 1,
-0.08411754, -2.93002, -2.814252, 0, 1, 0.7176471, 1,
-0.08387703, -1.869662, -2.429441, 0, 1, 0.7254902, 1,
-0.08140243, 0.201649, -3.316482, 0, 1, 0.7294118, 1,
-0.08013151, -1.505274, -4.706827, 0, 1, 0.7372549, 1,
-0.07836115, 0.1851461, 1.708356, 0, 1, 0.7411765, 1,
-0.07707752, 0.9899231, -1.80302, 0, 1, 0.7490196, 1,
-0.07575792, 0.3803766, -0.8856735, 0, 1, 0.7529412, 1,
-0.07413399, -0.3795459, -3.127541, 0, 1, 0.7607843, 1,
-0.07116507, 0.4938987, 0.3794735, 0, 1, 0.7647059, 1,
-0.06676292, 0.7443659, 0.2590276, 0, 1, 0.772549, 1,
-0.06605818, -1.484882, -5.052155, 0, 1, 0.7764706, 1,
-0.06593498, -0.07295161, -1.544134, 0, 1, 0.7843137, 1,
-0.06242187, 0.8789576, 0.216133, 0, 1, 0.7882353, 1,
-0.06113698, -1.370509, -2.898891, 0, 1, 0.7960784, 1,
-0.06105873, 0.2977014, -0.5308067, 0, 1, 0.8039216, 1,
-0.05958974, -0.7838122, -3.009497, 0, 1, 0.8078431, 1,
-0.05937188, -0.3880067, -3.789732, 0, 1, 0.8156863, 1,
-0.05816228, -0.8614579, -2.30749, 0, 1, 0.8196079, 1,
-0.05777082, -0.09936202, -3.428322, 0, 1, 0.827451, 1,
-0.05508666, -0.6563125, -1.892613, 0, 1, 0.8313726, 1,
-0.05399943, -1.3477, -3.100191, 0, 1, 0.8392157, 1,
-0.05374115, 1.638556, 0.01556503, 0, 1, 0.8431373, 1,
-0.04815488, 0.3266952, -1.144977, 0, 1, 0.8509804, 1,
-0.04619137, 0.4928104, 0.3339227, 0, 1, 0.854902, 1,
-0.03853895, -1.741529, -2.888297, 0, 1, 0.8627451, 1,
-0.03830806, 1.34662, -0.1677224, 0, 1, 0.8666667, 1,
-0.03808215, -0.7374167, -3.450191, 0, 1, 0.8745098, 1,
-0.03774758, -0.7521198, -2.666115, 0, 1, 0.8784314, 1,
-0.03221751, 1.870853, -0.05507748, 0, 1, 0.8862745, 1,
-0.03062549, 0.5807027, -1.204038, 0, 1, 0.8901961, 1,
-0.02502687, -0.5507089, -1.558888, 0, 1, 0.8980392, 1,
-0.02334403, 1.379742, 0.7563041, 0, 1, 0.9058824, 1,
-0.01870957, 2.960607, -2.006023, 0, 1, 0.9098039, 1,
-0.01356775, 1.966644, -0.1659692, 0, 1, 0.9176471, 1,
-0.009233157, 0.5260978, 0.2705435, 0, 1, 0.9215686, 1,
-0.0006523299, -1.26541, -1.266238, 0, 1, 0.9294118, 1,
-0.0004937465, 0.8976405, 0.4748722, 0, 1, 0.9333333, 1,
0.0004398432, -0.03109279, 4.702219, 0, 1, 0.9411765, 1,
0.006254042, 0.529146, 0.1080212, 0, 1, 0.945098, 1,
0.009428237, -0.3981932, 3.799631, 0, 1, 0.9529412, 1,
0.01063079, -0.2158103, 4.060143, 0, 1, 0.9568627, 1,
0.01506905, -0.7968606, 1.901892, 0, 1, 0.9647059, 1,
0.01643474, 0.186345, -1.162509, 0, 1, 0.9686275, 1,
0.0224751, 0.03422983, 1.597895, 0, 1, 0.9764706, 1,
0.03689999, -0.2994204, 1.480281, 0, 1, 0.9803922, 1,
0.04040753, -0.1462878, 3.478633, 0, 1, 0.9882353, 1,
0.04098621, 2.518854, -0.7399982, 0, 1, 0.9921569, 1,
0.0417654, 1.448028, 0.1895826, 0, 1, 1, 1,
0.04408209, 0.4285085, -1.555873, 0, 0.9921569, 1, 1,
0.04538155, 0.7746344, -0.5278105, 0, 0.9882353, 1, 1,
0.0476636, 0.2512062, -1.04084, 0, 0.9803922, 1, 1,
0.04843031, 0.3851191, 2.070901, 0, 0.9764706, 1, 1,
0.04898619, 2.872921, -0.937192, 0, 0.9686275, 1, 1,
0.04997944, 1.013585, -0.8688752, 0, 0.9647059, 1, 1,
0.05241966, -0.00317487, 3.859408, 0, 0.9568627, 1, 1,
0.05440477, 1.069489, -0.06047782, 0, 0.9529412, 1, 1,
0.05508672, -0.1678611, 1.355673, 0, 0.945098, 1, 1,
0.05508873, 1.542463, 1.308723, 0, 0.9411765, 1, 1,
0.05875206, 1.639223, -2.355953, 0, 0.9333333, 1, 1,
0.06101542, 1.06665, 1.311854, 0, 0.9294118, 1, 1,
0.06168131, 1.071409, 1.361425, 0, 0.9215686, 1, 1,
0.06277302, 0.4522392, 1.291379, 0, 0.9176471, 1, 1,
0.0642069, -0.3914563, 3.332466, 0, 0.9098039, 1, 1,
0.06536416, -2.848542, 2.9948, 0, 0.9058824, 1, 1,
0.06706334, -0.1394826, 3.526657, 0, 0.8980392, 1, 1,
0.06921926, 0.3161362, 1.871251, 0, 0.8901961, 1, 1,
0.07547422, 0.3846059, -0.5023033, 0, 0.8862745, 1, 1,
0.07735927, 1.097145, -0.311372, 0, 0.8784314, 1, 1,
0.08142024, -0.03524899, 1.693819, 0, 0.8745098, 1, 1,
0.08204384, 1.234963, 0.1285984, 0, 0.8666667, 1, 1,
0.08463297, -0.2731609, 2.374703, 0, 0.8627451, 1, 1,
0.08466534, -0.6802372, 2.906942, 0, 0.854902, 1, 1,
0.08570676, 1.471043, 1.591264, 0, 0.8509804, 1, 1,
0.09287192, -1.054365, 2.327453, 0, 0.8431373, 1, 1,
0.09783603, -2.291947, 2.872884, 0, 0.8392157, 1, 1,
0.1016968, 0.7222082, -1.14629, 0, 0.8313726, 1, 1,
0.1037091, -1.589809, 3.521052, 0, 0.827451, 1, 1,
0.1111968, -1.119213, 3.794368, 0, 0.8196079, 1, 1,
0.1113793, -0.2869486, 3.231193, 0, 0.8156863, 1, 1,
0.1114247, 0.2508891, 1.050213, 0, 0.8078431, 1, 1,
0.1148275, -0.1625616, -1.020242, 0, 0.8039216, 1, 1,
0.1150894, 0.9474952, 0.3539138, 0, 0.7960784, 1, 1,
0.1180625, -0.3865791, 3.301096, 0, 0.7882353, 1, 1,
0.1202118, -0.7036688, 3.838577, 0, 0.7843137, 1, 1,
0.1205812, -0.6908246, 3.151623, 0, 0.7764706, 1, 1,
0.1217639, 0.2159488, 0.001002345, 0, 0.772549, 1, 1,
0.1273908, -0.04857343, 2.592411, 0, 0.7647059, 1, 1,
0.1363571, -2.25717, 4.480721, 0, 0.7607843, 1, 1,
0.1392413, -3.139863, 3.409388, 0, 0.7529412, 1, 1,
0.1450754, 0.2731899, 1.158724, 0, 0.7490196, 1, 1,
0.1460334, 1.10013, -0.365094, 0, 0.7411765, 1, 1,
0.1465696, 0.9056361, 1.388036, 0, 0.7372549, 1, 1,
0.1494684, 0.9410775, 1.065031, 0, 0.7294118, 1, 1,
0.1519154, -1.875185, 2.275776, 0, 0.7254902, 1, 1,
0.1522813, 0.1637352, -1.28337, 0, 0.7176471, 1, 1,
0.1541242, 0.2438648, 1.646547, 0, 0.7137255, 1, 1,
0.1549689, 1.524946, -0.1455751, 0, 0.7058824, 1, 1,
0.1561246, -1.031965, 2.325087, 0, 0.6980392, 1, 1,
0.1581023, 0.1732941, -0.3478046, 0, 0.6941177, 1, 1,
0.1596894, 0.5832596, 2.166118, 0, 0.6862745, 1, 1,
0.1622464, -0.8834004, 3.507896, 0, 0.682353, 1, 1,
0.1629686, -2.885483, 3.219725, 0, 0.6745098, 1, 1,
0.1658347, 0.1046335, 1.498249, 0, 0.6705883, 1, 1,
0.1751058, -0.1313849, 0.3565669, 0, 0.6627451, 1, 1,
0.1759908, 0.2232157, 1.713231, 0, 0.6588235, 1, 1,
0.1769333, -1.262503, 2.88373, 0, 0.6509804, 1, 1,
0.1776551, -0.76775, 3.208343, 0, 0.6470588, 1, 1,
0.1784924, -0.3647137, 1.093491, 0, 0.6392157, 1, 1,
0.1800186, 0.4452704, 1.347874, 0, 0.6352941, 1, 1,
0.1831043, 0.2225967, -0.4485355, 0, 0.627451, 1, 1,
0.1860253, 1.715711, -0.8591759, 0, 0.6235294, 1, 1,
0.1890293, -0.4978534, 3.258756, 0, 0.6156863, 1, 1,
0.1899761, -1.30622, 3.175922, 0, 0.6117647, 1, 1,
0.1907345, 0.2425312, -1.440425, 0, 0.6039216, 1, 1,
0.1930711, -0.3606027, 3.683761, 0, 0.5960785, 1, 1,
0.1941636, 1.841532, 0.4048489, 0, 0.5921569, 1, 1,
0.1949978, -0.04105947, 2.374552, 0, 0.5843138, 1, 1,
0.1960031, -0.2364908, 1.227071, 0, 0.5803922, 1, 1,
0.1975566, 0.2184677, 2.712662, 0, 0.572549, 1, 1,
0.1988586, 0.05407727, 1.267991, 0, 0.5686275, 1, 1,
0.1990567, 0.2925141, 1.027834, 0, 0.5607843, 1, 1,
0.1999006, -0.1328392, 2.800265, 0, 0.5568628, 1, 1,
0.2004469, -0.7467084, 2.798428, 0, 0.5490196, 1, 1,
0.2018727, 0.2162384, 1.566664, 0, 0.5450981, 1, 1,
0.2087268, 1.692364, 1.083063, 0, 0.5372549, 1, 1,
0.2087797, -1.738602, 3.70676, 0, 0.5333334, 1, 1,
0.2095885, 0.4511884, 0.9527862, 0, 0.5254902, 1, 1,
0.2114674, 0.06364559, 0.9370112, 0, 0.5215687, 1, 1,
0.211739, 0.3172661, -0.6984963, 0, 0.5137255, 1, 1,
0.213458, 0.3200823, 0.3394951, 0, 0.509804, 1, 1,
0.2154416, 0.1260145, 0.5301446, 0, 0.5019608, 1, 1,
0.2156625, 0.9131147, -1.798334, 0, 0.4941176, 1, 1,
0.2180069, -0.2601685, 2.70223, 0, 0.4901961, 1, 1,
0.2201972, -0.8861853, 2.36324, 0, 0.4823529, 1, 1,
0.2218113, -1.618581, 2.858883, 0, 0.4784314, 1, 1,
0.2256651, -0.7622504, 2.467023, 0, 0.4705882, 1, 1,
0.2279029, 0.5120453, 0.3873921, 0, 0.4666667, 1, 1,
0.2282753, 3.040472, 0.2183638, 0, 0.4588235, 1, 1,
0.2286382, -0.6673284, 3.259752, 0, 0.454902, 1, 1,
0.2290606, 1.869274, -1.125787, 0, 0.4470588, 1, 1,
0.2323855, -0.6058607, 2.563434, 0, 0.4431373, 1, 1,
0.2324338, 0.2825544, 1.033831, 0, 0.4352941, 1, 1,
0.2353885, -0.4406583, 1.039534, 0, 0.4313726, 1, 1,
0.235702, -1.994476, 4.198351, 0, 0.4235294, 1, 1,
0.2366248, 1.265015, -2.442102, 0, 0.4196078, 1, 1,
0.2439671, 0.01614182, 2.050157, 0, 0.4117647, 1, 1,
0.2499645, -0.8850461, 3.671938, 0, 0.4078431, 1, 1,
0.2500901, -0.09272533, 2.67439, 0, 0.4, 1, 1,
0.2514189, 0.1510042, 1.333608, 0, 0.3921569, 1, 1,
0.251531, 0.3946566, 0.7348822, 0, 0.3882353, 1, 1,
0.2551207, 2.608538, -1.358519, 0, 0.3803922, 1, 1,
0.2601169, 1.400007, 0.5843643, 0, 0.3764706, 1, 1,
0.2613709, 1.110239, 1.736639, 0, 0.3686275, 1, 1,
0.262509, 0.4014942, 2.524432, 0, 0.3647059, 1, 1,
0.2694044, 1.345325, -0.2432495, 0, 0.3568628, 1, 1,
0.2718494, -0.5746412, 1.432758, 0, 0.3529412, 1, 1,
0.2726393, -1.635696, 3.008216, 0, 0.345098, 1, 1,
0.2746855, 1.705528, -1.506205, 0, 0.3411765, 1, 1,
0.2747235, 0.6321275, 0.08289769, 0, 0.3333333, 1, 1,
0.2793423, 0.7518587, -0.1989329, 0, 0.3294118, 1, 1,
0.2815946, -0.7071851, 1.015718, 0, 0.3215686, 1, 1,
0.2831127, -0.956533, 3.137584, 0, 0.3176471, 1, 1,
0.286988, 0.9094599, 1.246312, 0, 0.3098039, 1, 1,
0.2883195, -0.457209, 3.795395, 0, 0.3058824, 1, 1,
0.2888169, -0.4966758, 1.887545, 0, 0.2980392, 1, 1,
0.2905228, -0.7848219, 1.651784, 0, 0.2901961, 1, 1,
0.2909729, -1.08138, 1.554538, 0, 0.2862745, 1, 1,
0.2931537, -1.441545, 2.835842, 0, 0.2784314, 1, 1,
0.2936988, 1.667815, -0.6066357, 0, 0.2745098, 1, 1,
0.2965109, 0.06627398, 0.8076877, 0, 0.2666667, 1, 1,
0.2998247, 0.6191095, 0.1279679, 0, 0.2627451, 1, 1,
0.3017142, -1.65618, 5.432989, 0, 0.254902, 1, 1,
0.3017561, -1.181652, 2.700862, 0, 0.2509804, 1, 1,
0.3021563, -0.03506751, -0.3565427, 0, 0.2431373, 1, 1,
0.3037027, 0.9255376, -0.3516081, 0, 0.2392157, 1, 1,
0.3084411, 1.276825, 1.034577, 0, 0.2313726, 1, 1,
0.3096449, -0.07197705, 2.476401, 0, 0.227451, 1, 1,
0.3178227, 0.03706902, 2.524625, 0, 0.2196078, 1, 1,
0.3182208, 0.2427263, 0.6633087, 0, 0.2156863, 1, 1,
0.318379, -0.3229625, 1.790884, 0, 0.2078431, 1, 1,
0.3184814, -0.9883398, 4.58599, 0, 0.2039216, 1, 1,
0.3201531, -0.2986067, 0.80983, 0, 0.1960784, 1, 1,
0.3242615, 0.1124844, 2.259876, 0, 0.1882353, 1, 1,
0.3260839, -0.6207349, 4.964462, 0, 0.1843137, 1, 1,
0.3312377, -0.3473623, 0.8859229, 0, 0.1764706, 1, 1,
0.3313774, -0.5620821, 3.711908, 0, 0.172549, 1, 1,
0.3326724, -0.6491654, 1.004107, 0, 0.1647059, 1, 1,
0.3358252, -0.1771992, 2.191071, 0, 0.1607843, 1, 1,
0.3361327, 0.9850914, 1.564958, 0, 0.1529412, 1, 1,
0.3389825, -2.235553, 1.388302, 0, 0.1490196, 1, 1,
0.3409147, 0.7539276, 0.06411226, 0, 0.1411765, 1, 1,
0.3419415, 0.6872157, -0.4109975, 0, 0.1372549, 1, 1,
0.3454015, 2.133902, -0.01593667, 0, 0.1294118, 1, 1,
0.3495601, 1.488873, -1.03445, 0, 0.1254902, 1, 1,
0.3517873, 1.198122, -1.718426, 0, 0.1176471, 1, 1,
0.355444, -1.313454, 4.146267, 0, 0.1137255, 1, 1,
0.3638457, 0.9399373, 0.9618996, 0, 0.1058824, 1, 1,
0.3665021, -0.9090413, 2.235388, 0, 0.09803922, 1, 1,
0.3673863, -0.590262, 4.017962, 0, 0.09411765, 1, 1,
0.3701426, -0.8196267, 1.143804, 0, 0.08627451, 1, 1,
0.3712807, -0.7032562, 4.880597, 0, 0.08235294, 1, 1,
0.376202, 1.497261, -0.1185536, 0, 0.07450981, 1, 1,
0.3772469, 0.576471, 0.3265117, 0, 0.07058824, 1, 1,
0.3796476, -0.05370934, 2.166231, 0, 0.0627451, 1, 1,
0.3799703, -1.175734, 2.778073, 0, 0.05882353, 1, 1,
0.3810591, 0.4415217, 1.781836, 0, 0.05098039, 1, 1,
0.3837965, -0.8066146, 1.673882, 0, 0.04705882, 1, 1,
0.3838078, 1.415784, 0.6083854, 0, 0.03921569, 1, 1,
0.3855634, -0.8614588, 1.24646, 0, 0.03529412, 1, 1,
0.4013502, -0.07700847, 1.567977, 0, 0.02745098, 1, 1,
0.4048612, 0.04373778, 0.2615544, 0, 0.02352941, 1, 1,
0.4061694, -0.1550374, 1.981573, 0, 0.01568628, 1, 1,
0.407364, -1.075171, 4.175855, 0, 0.01176471, 1, 1,
0.4159842, 0.1400862, 2.585521, 0, 0.003921569, 1, 1,
0.4190286, -0.9750808, 2.689, 0.003921569, 0, 1, 1,
0.4200264, -0.2041246, 1.037968, 0.007843138, 0, 1, 1,
0.4278996, -0.2933859, 2.479984, 0.01568628, 0, 1, 1,
0.4283422, -1.286044, 1.958039, 0.01960784, 0, 1, 1,
0.4286602, 0.9688294, -0.6384936, 0.02745098, 0, 1, 1,
0.4321646, 0.01045401, 1.604191, 0.03137255, 0, 1, 1,
0.4345623, -0.3216765, 2.351517, 0.03921569, 0, 1, 1,
0.4351453, 0.4613162, 0.2652219, 0.04313726, 0, 1, 1,
0.4362238, -1.073502, 2.363394, 0.05098039, 0, 1, 1,
0.439281, 0.5158424, -0.2458988, 0.05490196, 0, 1, 1,
0.4416504, 1.604684, -0.05664432, 0.0627451, 0, 1, 1,
0.4469483, 0.3959079, -0.1392901, 0.06666667, 0, 1, 1,
0.4479351, 0.7657275, 0.4705207, 0.07450981, 0, 1, 1,
0.4488854, 0.4306314, -0.3572243, 0.07843138, 0, 1, 1,
0.4509131, 0.731549, 1.021896, 0.08627451, 0, 1, 1,
0.4563073, 0.7723456, 0.9351668, 0.09019608, 0, 1, 1,
0.4572598, -0.8205225, 1.868677, 0.09803922, 0, 1, 1,
0.4657701, 0.2447046, 0.9193618, 0.1058824, 0, 1, 1,
0.4706871, -1.673979, 4.229895, 0.1098039, 0, 1, 1,
0.471386, 0.1254575, 1.638844, 0.1176471, 0, 1, 1,
0.4748684, 1.933735, -0.2159053, 0.1215686, 0, 1, 1,
0.4819638, -0.2411965, 2.105436, 0.1294118, 0, 1, 1,
0.4882056, 1.184497, 1.494556, 0.1333333, 0, 1, 1,
0.4882978, 0.2249596, 1.278975, 0.1411765, 0, 1, 1,
0.4888053, -0.2488785, 0.772019, 0.145098, 0, 1, 1,
0.4943909, -1.000749, 1.798798, 0.1529412, 0, 1, 1,
0.4965944, -1.324103, 4.286661, 0.1568628, 0, 1, 1,
0.5001025, -0.9886611, 3.922813, 0.1647059, 0, 1, 1,
0.5037305, -0.5673801, 2.311736, 0.1686275, 0, 1, 1,
0.5042184, -1.553713, 3.424786, 0.1764706, 0, 1, 1,
0.5102997, 1.268932, 0.4417569, 0.1803922, 0, 1, 1,
0.514479, -1.54742, 2.235724, 0.1882353, 0, 1, 1,
0.5157526, -0.09958454, 2.283427, 0.1921569, 0, 1, 1,
0.5212923, -0.08363624, 2.289457, 0.2, 0, 1, 1,
0.5287836, 0.2356349, 1.358686, 0.2078431, 0, 1, 1,
0.5306615, -0.1504764, 2.611286, 0.2117647, 0, 1, 1,
0.534697, 0.02675447, 2.310847, 0.2196078, 0, 1, 1,
0.5350664, 0.7312861, 0.7606439, 0.2235294, 0, 1, 1,
0.5364529, 0.2616042, 2.720443, 0.2313726, 0, 1, 1,
0.5484662, 0.2552959, 0.6590301, 0.2352941, 0, 1, 1,
0.5504842, -1.260196, 1.264832, 0.2431373, 0, 1, 1,
0.5509884, -1.367069, 3.109286, 0.2470588, 0, 1, 1,
0.5522869, 0.06997132, 0.4095683, 0.254902, 0, 1, 1,
0.5583851, -0.8984931, 3.902648, 0.2588235, 0, 1, 1,
0.5592862, 0.04180184, 0.9835397, 0.2666667, 0, 1, 1,
0.5603778, -0.2580385, 2.272312, 0.2705882, 0, 1, 1,
0.5676223, 0.1008949, 0.7394909, 0.2784314, 0, 1, 1,
0.5688879, -0.4262547, 1.786209, 0.282353, 0, 1, 1,
0.568936, 0.01868895, 1.321025, 0.2901961, 0, 1, 1,
0.5781372, -1.429103, 3.122593, 0.2941177, 0, 1, 1,
0.5792643, 1.492176, 1.105132, 0.3019608, 0, 1, 1,
0.5792979, -0.9758366, 3.38589, 0.3098039, 0, 1, 1,
0.5825861, -0.004929177, 2.505969, 0.3137255, 0, 1, 1,
0.5837344, 0.5753144, -0.3969182, 0.3215686, 0, 1, 1,
0.5850893, -1.546361, 1.219557, 0.3254902, 0, 1, 1,
0.586122, -0.1917409, 3.325226, 0.3333333, 0, 1, 1,
0.5890388, -1.616094, 4.364132, 0.3372549, 0, 1, 1,
0.591795, -0.5145309, 0.3086846, 0.345098, 0, 1, 1,
0.5964188, 0.4712433, 0.9697072, 0.3490196, 0, 1, 1,
0.5978214, 1.047715, -1.665346, 0.3568628, 0, 1, 1,
0.6014586, 1.235469, 0.5432294, 0.3607843, 0, 1, 1,
0.6025047, 0.3928925, -1.419406, 0.3686275, 0, 1, 1,
0.6055204, -0.6837299, 2.184108, 0.372549, 0, 1, 1,
0.606925, 0.464875, 0.9938398, 0.3803922, 0, 1, 1,
0.6094354, -2.319785, 2.535301, 0.3843137, 0, 1, 1,
0.6123301, -0.4874771, 4.319668, 0.3921569, 0, 1, 1,
0.6162932, -2.117477, 2.665586, 0.3960784, 0, 1, 1,
0.6168788, 0.006349089, 1.933314, 0.4039216, 0, 1, 1,
0.6195855, 1.533322, -0.2251105, 0.4117647, 0, 1, 1,
0.6242135, 0.5334492, 0.8075584, 0.4156863, 0, 1, 1,
0.6384016, -0.2541624, 1.815213, 0.4235294, 0, 1, 1,
0.6396604, -1.079225, 3.86966, 0.427451, 0, 1, 1,
0.6439552, 2.008045, 0.4349312, 0.4352941, 0, 1, 1,
0.6464887, -0.2892443, 2.080778, 0.4392157, 0, 1, 1,
0.6553753, 1.198963, 0.3057585, 0.4470588, 0, 1, 1,
0.6575036, -0.06882492, 1.319282, 0.4509804, 0, 1, 1,
0.6608072, -1.611163, 0.2978161, 0.4588235, 0, 1, 1,
0.6619037, 0.2517034, 0.9632081, 0.4627451, 0, 1, 1,
0.6624824, -0.5582771, 3.368897, 0.4705882, 0, 1, 1,
0.6628031, -1.952495, 4.013949, 0.4745098, 0, 1, 1,
0.6668105, -0.4851091, 1.839309, 0.4823529, 0, 1, 1,
0.6712605, -1.440968, 1.679479, 0.4862745, 0, 1, 1,
0.6761832, -2.303851, 2.537027, 0.4941176, 0, 1, 1,
0.6782461, 1.300174, 1.112702, 0.5019608, 0, 1, 1,
0.6838593, -0.9505126, 3.1006, 0.5058824, 0, 1, 1,
0.6964591, -0.2187364, 2.058243, 0.5137255, 0, 1, 1,
0.699126, -0.07765304, 1.153639, 0.5176471, 0, 1, 1,
0.6996324, -0.3290285, 2.527918, 0.5254902, 0, 1, 1,
0.7001575, -1.159377, 3.00066, 0.5294118, 0, 1, 1,
0.700178, 0.4291063, 1.045629, 0.5372549, 0, 1, 1,
0.7004499, 0.603718, 0.3110965, 0.5411765, 0, 1, 1,
0.7025859, 0.8749774, 1.061838, 0.5490196, 0, 1, 1,
0.7083434, 0.555576, 0.7477138, 0.5529412, 0, 1, 1,
0.7161996, -0.7762978, 2.773203, 0.5607843, 0, 1, 1,
0.7205055, 0.3557481, 0.8967539, 0.5647059, 0, 1, 1,
0.7221563, 0.1902395, 0.2042186, 0.572549, 0, 1, 1,
0.7227212, 0.8821577, 1.133199, 0.5764706, 0, 1, 1,
0.7290553, -0.8414545, 2.145165, 0.5843138, 0, 1, 1,
0.7320683, -0.4083573, 2.185051, 0.5882353, 0, 1, 1,
0.735618, -0.007353024, 2.159144, 0.5960785, 0, 1, 1,
0.7374573, 0.2873816, -1.493998, 0.6039216, 0, 1, 1,
0.7391548, -0.2610142, 0.9887212, 0.6078432, 0, 1, 1,
0.7398461, -0.7805884, 1.542974, 0.6156863, 0, 1, 1,
0.7401953, -1.820249, 1.702225, 0.6196079, 0, 1, 1,
0.7428113, -1.231002, 1.976436, 0.627451, 0, 1, 1,
0.7436929, 0.279893, 0.8610682, 0.6313726, 0, 1, 1,
0.7475758, 1.911003, -1.46042, 0.6392157, 0, 1, 1,
0.7489227, -0.9497533, 1.338236, 0.6431373, 0, 1, 1,
0.7497687, 1.531727, 0.4580133, 0.6509804, 0, 1, 1,
0.7518507, -1.228902, 3.120075, 0.654902, 0, 1, 1,
0.7526927, 0.5907223, 1.349714, 0.6627451, 0, 1, 1,
0.7562649, 0.3982261, 2.379529, 0.6666667, 0, 1, 1,
0.7566664, -0.8736587, 3.950811, 0.6745098, 0, 1, 1,
0.7572158, -1.277827, 1.621424, 0.6784314, 0, 1, 1,
0.7584653, -1.420615, 3.218109, 0.6862745, 0, 1, 1,
0.7608884, -0.3416005, 0.2909807, 0.6901961, 0, 1, 1,
0.7727035, 1.274666, 1.299033, 0.6980392, 0, 1, 1,
0.780993, 0.4830212, 1.566691, 0.7058824, 0, 1, 1,
0.783316, -0.4713321, 2.756406, 0.7098039, 0, 1, 1,
0.787295, 0.7230802, 1.512533, 0.7176471, 0, 1, 1,
0.789426, -1.489047, 3.111154, 0.7215686, 0, 1, 1,
0.7927356, 2.386899, -0.7145362, 0.7294118, 0, 1, 1,
0.7931233, -1.055977, 3.437975, 0.7333333, 0, 1, 1,
0.7942868, -0.585068, 0.09370603, 0.7411765, 0, 1, 1,
0.794933, 0.2878014, 1.515048, 0.7450981, 0, 1, 1,
0.7953665, -1.95843, 3.382422, 0.7529412, 0, 1, 1,
0.797491, 1.177955, -0.603128, 0.7568628, 0, 1, 1,
0.8010508, -0.6233565, 1.662319, 0.7647059, 0, 1, 1,
0.805468, 1.730784, 0.3814413, 0.7686275, 0, 1, 1,
0.8121604, -0.9164824, 2.225415, 0.7764706, 0, 1, 1,
0.8140854, 1.376065, 1.24624, 0.7803922, 0, 1, 1,
0.8151163, -1.009996, 2.756501, 0.7882353, 0, 1, 1,
0.8180483, -1.002522, 3.349648, 0.7921569, 0, 1, 1,
0.8214073, -1.208426, 1.228301, 0.8, 0, 1, 1,
0.8235953, 0.3467202, 1.17845, 0.8078431, 0, 1, 1,
0.8256698, 0.1060644, 2.378551, 0.8117647, 0, 1, 1,
0.8282338, -0.02981294, 2.927755, 0.8196079, 0, 1, 1,
0.8320195, -1.603361, 4.504273, 0.8235294, 0, 1, 1,
0.8346982, 0.4570292, 1.28453, 0.8313726, 0, 1, 1,
0.8367144, 0.316894, 1.814392, 0.8352941, 0, 1, 1,
0.8369758, 2.318666, 1.039334, 0.8431373, 0, 1, 1,
0.8376396, -1.975304, 3.361895, 0.8470588, 0, 1, 1,
0.8392462, 1.590079, 0.546298, 0.854902, 0, 1, 1,
0.8437601, 0.5468557, 1.967653, 0.8588235, 0, 1, 1,
0.8447466, 0.005905253, 0.4175088, 0.8666667, 0, 1, 1,
0.8514351, -0.68957, 2.961957, 0.8705882, 0, 1, 1,
0.8545078, 0.3258457, 0.1774413, 0.8784314, 0, 1, 1,
0.8625896, -1.014318, 3.56091, 0.8823529, 0, 1, 1,
0.8633506, 1.648889, 0.5334536, 0.8901961, 0, 1, 1,
0.8733864, -0.2486507, 2.248073, 0.8941177, 0, 1, 1,
0.8783674, 0.06234916, 1.353081, 0.9019608, 0, 1, 1,
0.8938347, -0.2018218, 0.09616712, 0.9098039, 0, 1, 1,
0.9040318, 0.2872964, 0.9460422, 0.9137255, 0, 1, 1,
0.9067597, -0.7699322, 1.342641, 0.9215686, 0, 1, 1,
0.9078916, 0.7404558, 1.451846, 0.9254902, 0, 1, 1,
0.9096317, -0.286601, 1.278286, 0.9333333, 0, 1, 1,
0.9103543, -0.6388423, 3.45639, 0.9372549, 0, 1, 1,
0.9236312, 1.759434, -0.06903547, 0.945098, 0, 1, 1,
0.9243731, -0.6697584, 2.324971, 0.9490196, 0, 1, 1,
0.9247033, -0.7691941, 1.86981, 0.9568627, 0, 1, 1,
0.9298637, -0.667825, 1.663784, 0.9607843, 0, 1, 1,
0.937545, 0.9349598, 1.541496, 0.9686275, 0, 1, 1,
0.9439313, 0.5142487, 0.6088215, 0.972549, 0, 1, 1,
0.9460683, 2.491531, 2.540886, 0.9803922, 0, 1, 1,
0.9499977, -1.117396, 2.818938, 0.9843137, 0, 1, 1,
0.9700836, -0.2699198, 1.716246, 0.9921569, 0, 1, 1,
0.9771594, 1.12282, 0.298291, 0.9960784, 0, 1, 1,
0.9795135, 0.2458689, 1.101784, 1, 0, 0.9960784, 1,
0.9803126, 1.916516, 1.641268, 1, 0, 0.9882353, 1,
0.987151, 0.2075708, 2.276117, 1, 0, 0.9843137, 1,
0.9876069, -0.4648604, 2.786174, 1, 0, 0.9764706, 1,
0.9942255, -0.1181114, 1.245983, 1, 0, 0.972549, 1,
0.9952778, -1.151503, 2.927888, 1, 0, 0.9647059, 1,
0.9964964, 1.234719, 1.71979, 1, 0, 0.9607843, 1,
0.998147, 0.4811535, 0.2216248, 1, 0, 0.9529412, 1,
0.9998548, -1.201104, 1.047293, 1, 0, 0.9490196, 1,
1.001402, -0.3977488, 2.612669, 1, 0, 0.9411765, 1,
1.005558, 1.065185, 0.08340111, 1, 0, 0.9372549, 1,
1.006175, 0.6272957, -0.7137275, 1, 0, 0.9294118, 1,
1.006561, -1.216301, 2.856746, 1, 0, 0.9254902, 1,
1.025773, 1.030499, -0.3747556, 1, 0, 0.9176471, 1,
1.034513, 1.829906, 0.662353, 1, 0, 0.9137255, 1,
1.034609, 0.05235723, 2.830579, 1, 0, 0.9058824, 1,
1.038133, -1.063059, 1.588807, 1, 0, 0.9019608, 1,
1.041867, -0.004453383, 1.486508, 1, 0, 0.8941177, 1,
1.051963, -1.413868, 1.674624, 1, 0, 0.8862745, 1,
1.053574, -0.6417249, 1.89025, 1, 0, 0.8823529, 1,
1.053703, 0.4597472, 1.317973, 1, 0, 0.8745098, 1,
1.065249, -0.1089984, 2.223101, 1, 0, 0.8705882, 1,
1.068407, -1.082495, 2.322741, 1, 0, 0.8627451, 1,
1.072301, -1.096185, 1.823973, 1, 0, 0.8588235, 1,
1.074646, -2.064973, 1.463652, 1, 0, 0.8509804, 1,
1.080174, 0.6157928, 1.041755, 1, 0, 0.8470588, 1,
1.080551, -0.3288933, 1.673435, 1, 0, 0.8392157, 1,
1.084321, -1.344961, 2.28167, 1, 0, 0.8352941, 1,
1.08832, 0.0975987, 4.411369, 1, 0, 0.827451, 1,
1.089151, 0.07148015, 0.8711062, 1, 0, 0.8235294, 1,
1.090056, -1.280309, 3.196645, 1, 0, 0.8156863, 1,
1.105723, -0.6765192, -0.1223703, 1, 0, 0.8117647, 1,
1.105774, -0.7922322, 2.553506, 1, 0, 0.8039216, 1,
1.110106, 1.115952, -0.1048624, 1, 0, 0.7960784, 1,
1.118154, -1.887706, 3.808242, 1, 0, 0.7921569, 1,
1.120209, -0.3829547, 0.6589931, 1, 0, 0.7843137, 1,
1.126886, 1.350403, -0.7712582, 1, 0, 0.7803922, 1,
1.134043, 1.512974, 0.9565491, 1, 0, 0.772549, 1,
1.144674, -0.1071328, 2.30712, 1, 0, 0.7686275, 1,
1.157643, 0.8378208, 1.045753, 1, 0, 0.7607843, 1,
1.162189, 0.4582886, 3.656302, 1, 0, 0.7568628, 1,
1.16256, -0.02718616, 0.4152434, 1, 0, 0.7490196, 1,
1.165277, -0.1994794, 1.347991, 1, 0, 0.7450981, 1,
1.167041, 0.7436143, 0.9192309, 1, 0, 0.7372549, 1,
1.172647, -0.9830869, 1.527896, 1, 0, 0.7333333, 1,
1.175853, -0.1589163, 2.313379, 1, 0, 0.7254902, 1,
1.179336, 0.2048277, -0.03236071, 1, 0, 0.7215686, 1,
1.181278, 0.4281792, 1.054096, 1, 0, 0.7137255, 1,
1.19396, 0.1206147, -0.2292652, 1, 0, 0.7098039, 1,
1.194086, 0.5126808, 1.570894, 1, 0, 0.7019608, 1,
1.199747, -1.186704, 3.350817, 1, 0, 0.6941177, 1,
1.208603, -1.333094, 2.386537, 1, 0, 0.6901961, 1,
1.208873, 0.1731732, 0.07974663, 1, 0, 0.682353, 1,
1.215288, 0.9983665, 0.2161619, 1, 0, 0.6784314, 1,
1.215596, -2.021136, 2.530001, 1, 0, 0.6705883, 1,
1.22726, 1.662724, 0.7663907, 1, 0, 0.6666667, 1,
1.239968, -1.419814, 3.056968, 1, 0, 0.6588235, 1,
1.246957, 0.4278966, -0.08758974, 1, 0, 0.654902, 1,
1.253872, 0.7439805, 1.682657, 1, 0, 0.6470588, 1,
1.257231, -0.7316099, 1.266434, 1, 0, 0.6431373, 1,
1.275134, -0.6292398, 0.8726772, 1, 0, 0.6352941, 1,
1.281003, -0.507619, 3.061452, 1, 0, 0.6313726, 1,
1.283912, -0.3255177, 2.577296, 1, 0, 0.6235294, 1,
1.287344, 2.661197, 0.9781966, 1, 0, 0.6196079, 1,
1.28775, 1.051096, 2.292169, 1, 0, 0.6117647, 1,
1.288406, -0.06042333, 1.652163, 1, 0, 0.6078432, 1,
1.298432, 1.192278, -0.3426208, 1, 0, 0.6, 1,
1.307442, -0.8754368, 2.985029, 1, 0, 0.5921569, 1,
1.3084, 0.6314976, 1.67201, 1, 0, 0.5882353, 1,
1.311685, 1.110224, 1.793503, 1, 0, 0.5803922, 1,
1.31373, 0.08775274, 2.686702, 1, 0, 0.5764706, 1,
1.31493, 0.5007646, 1.614066, 1, 0, 0.5686275, 1,
1.33181, -1.161982, 2.915353, 1, 0, 0.5647059, 1,
1.336519, -0.1386192, 2.454804, 1, 0, 0.5568628, 1,
1.347911, -0.2765911, 1.27609, 1, 0, 0.5529412, 1,
1.355828, 0.08754089, 1.411143, 1, 0, 0.5450981, 1,
1.356933, -0.09365891, 0.5592282, 1, 0, 0.5411765, 1,
1.356935, -0.662277, 1.735059, 1, 0, 0.5333334, 1,
1.357315, -2.350964, 3.504736, 1, 0, 0.5294118, 1,
1.358522, 0.7414936, 0.6040774, 1, 0, 0.5215687, 1,
1.369049, -0.2729652, 2.322722, 1, 0, 0.5176471, 1,
1.391105, 0.3571858, 1.764095, 1, 0, 0.509804, 1,
1.418398, -0.3539054, 2.266445, 1, 0, 0.5058824, 1,
1.426064, 0.9348993, 0.5553961, 1, 0, 0.4980392, 1,
1.42627, 0.5177751, 1.404177, 1, 0, 0.4901961, 1,
1.429809, -0.3086092, 0.853142, 1, 0, 0.4862745, 1,
1.437993, 0.4553724, -0.2089548, 1, 0, 0.4784314, 1,
1.440604, 0.4337515, 0.8023553, 1, 0, 0.4745098, 1,
1.442485, 0.8058047, 0.1335077, 1, 0, 0.4666667, 1,
1.442733, 1.749048, -0.3751682, 1, 0, 0.4627451, 1,
1.443447, 0.3705339, 2.976315, 1, 0, 0.454902, 1,
1.443587, -0.8838682, 1.741078, 1, 0, 0.4509804, 1,
1.460204, -0.109931, 2.008862, 1, 0, 0.4431373, 1,
1.460416, -0.8528555, 1.132972, 1, 0, 0.4392157, 1,
1.461449, 1.089616, 1.400622, 1, 0, 0.4313726, 1,
1.473163, 0.3327105, -0.3709817, 1, 0, 0.427451, 1,
1.473836, 0.2929878, 1.627437, 1, 0, 0.4196078, 1,
1.483224, -0.8914647, 2.970628, 1, 0, 0.4156863, 1,
1.489901, -0.6843556, 0.4061313, 1, 0, 0.4078431, 1,
1.500296, -0.0007002765, 1.25768, 1, 0, 0.4039216, 1,
1.50634, 1.230272, 0.08198703, 1, 0, 0.3960784, 1,
1.511464, 0.8578922, -0.669189, 1, 0, 0.3882353, 1,
1.520314, 0.1736774, 1.069304, 1, 0, 0.3843137, 1,
1.525506, -0.1710385, -0.1537631, 1, 0, 0.3764706, 1,
1.540597, 0.859155, 2.14621, 1, 0, 0.372549, 1,
1.542593, 1.007082, 0.9745857, 1, 0, 0.3647059, 1,
1.551344, -1.018555, 1.383078, 1, 0, 0.3607843, 1,
1.560701, -0.1634722, 3.048745, 1, 0, 0.3529412, 1,
1.564325, -1.326239, 2.898844, 1, 0, 0.3490196, 1,
1.576574, 0.01176529, 1.994005, 1, 0, 0.3411765, 1,
1.591754, 0.6316459, 1.341321, 1, 0, 0.3372549, 1,
1.611967, -0.1645457, 0.3788946, 1, 0, 0.3294118, 1,
1.62901, 0.3653283, 2.873592, 1, 0, 0.3254902, 1,
1.637963, -1.385614, 0.1628674, 1, 0, 0.3176471, 1,
1.64092, -0.08767414, 0.5149574, 1, 0, 0.3137255, 1,
1.660227, 0.01494356, 2.608958, 1, 0, 0.3058824, 1,
1.666337, 2.24956, -1.395815, 1, 0, 0.2980392, 1,
1.69292, 0.8931533, 2.717849, 1, 0, 0.2941177, 1,
1.70595, 0.2415828, 3.416771, 1, 0, 0.2862745, 1,
1.708014, -0.05763111, 1.415486, 1, 0, 0.282353, 1,
1.710436, 0.8445808, 1.159141, 1, 0, 0.2745098, 1,
1.714267, -1.281989, 1.946075, 1, 0, 0.2705882, 1,
1.717677, 0.9458658, 1.150853, 1, 0, 0.2627451, 1,
1.736701, -0.3428813, 3.976461, 1, 0, 0.2588235, 1,
1.739232, -1.005351, 2.326839, 1, 0, 0.2509804, 1,
1.750554, -1.801709, 1.862945, 1, 0, 0.2470588, 1,
1.760985, -0.4825104, 1.924625, 1, 0, 0.2392157, 1,
1.783834, 1.826145, 0.5776813, 1, 0, 0.2352941, 1,
1.784048, -1.063742, 1.605803, 1, 0, 0.227451, 1,
1.840688, 0.9133523, 0.5132078, 1, 0, 0.2235294, 1,
1.848598, -0.3746352, 3.299937, 1, 0, 0.2156863, 1,
1.865528, -0.4671024, 2.2693, 1, 0, 0.2117647, 1,
1.88787, -0.2062829, 1.158007, 1, 0, 0.2039216, 1,
1.891274, 0.2127824, 0.2559136, 1, 0, 0.1960784, 1,
1.894807, -1.473786, 2.855703, 1, 0, 0.1921569, 1,
1.9136, 1.158576, 1.717282, 1, 0, 0.1843137, 1,
1.920897, 1.2587, 1.201389, 1, 0, 0.1803922, 1,
1.92532, 0.3870783, 1.722584, 1, 0, 0.172549, 1,
1.940528, 0.3862287, 0.4762714, 1, 0, 0.1686275, 1,
1.968135, -0.2871921, 3.176042, 1, 0, 0.1607843, 1,
1.979228, -0.03371521, 0.1548583, 1, 0, 0.1568628, 1,
2.000607, 0.170585, 1.100432, 1, 0, 0.1490196, 1,
2.047596, -0.698727, 1.119118, 1, 0, 0.145098, 1,
2.063912, 0.9870001, -0.1265037, 1, 0, 0.1372549, 1,
2.092106, -0.9611039, 1.877945, 1, 0, 0.1333333, 1,
2.101225, -0.3813367, 3.002982, 1, 0, 0.1254902, 1,
2.119767, 0.349494, 3.123691, 1, 0, 0.1215686, 1,
2.175918, 1.080482, 1.765558, 1, 0, 0.1137255, 1,
2.182409, 0.4466238, -1.313019, 1, 0, 0.1098039, 1,
2.21143, 1.798924, 0.1056798, 1, 0, 0.1019608, 1,
2.21389, -0.6734817, 2.19283, 1, 0, 0.09411765, 1,
2.244916, -1.577052, 2.39231, 1, 0, 0.09019608, 1,
2.254979, -0.2794478, 2.935929, 1, 0, 0.08235294, 1,
2.273122, -1.164915, 2.384195, 1, 0, 0.07843138, 1,
2.315636, 1.001128, 1.943756, 1, 0, 0.07058824, 1,
2.320086, -1.116011, 3.182587, 1, 0, 0.06666667, 1,
2.341215, 0.543838, 1.020385, 1, 0, 0.05882353, 1,
2.389404, -0.1019538, -0.4844798, 1, 0, 0.05490196, 1,
2.498458, -0.168199, 1.931437, 1, 0, 0.04705882, 1,
2.505555, -0.9369779, 1.72719, 1, 0, 0.04313726, 1,
2.519101, -0.9913676, 0.4686676, 1, 0, 0.03529412, 1,
2.54042, -0.2370431, 1.165512, 1, 0, 0.03137255, 1,
2.904022, 1.455131, 0.9392887, 1, 0, 0.02352941, 1,
2.942541, -0.1342504, 0.8641869, 1, 0, 0.01960784, 1,
3.006803, 1.216151, 0.247473, 1, 0, 0.01176471, 1,
3.043845, 0.9503052, 1.247432, 1, 0, 0.007843138, 1
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
0.1004583, -4.363201, -6.829387, 0, -0.5, 0.5, 0.5,
0.1004583, -4.363201, -6.829387, 1, -0.5, 0.5, 0.5,
0.1004583, -4.363201, -6.829387, 1, 1.5, 0.5, 0.5,
0.1004583, -4.363201, -6.829387, 0, 1.5, 0.5, 0.5
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
-3.840736, -0.1248436, -6.829387, 0, -0.5, 0.5, 0.5,
-3.840736, -0.1248436, -6.829387, 1, -0.5, 0.5, 0.5,
-3.840736, -0.1248436, -6.829387, 1, 1.5, 0.5, 0.5,
-3.840736, -0.1248436, -6.829387, 0, 1.5, 0.5, 0.5
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
-3.840736, -4.363201, 0.1904166, 0, -0.5, 0.5, 0.5,
-3.840736, -4.363201, 0.1904166, 1, -0.5, 0.5, 0.5,
-3.840736, -4.363201, 0.1904166, 1, 1.5, 0.5, 0.5,
-3.840736, -4.363201, 0.1904166, 0, 1.5, 0.5, 0.5
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
-2, -3.385119, -5.209433,
3, -3.385119, -5.209433,
-2, -3.385119, -5.209433,
-2, -3.548132, -5.479425,
-1, -3.385119, -5.209433,
-1, -3.548132, -5.479425,
0, -3.385119, -5.209433,
0, -3.548132, -5.479425,
1, -3.385119, -5.209433,
1, -3.548132, -5.479425,
2, -3.385119, -5.209433,
2, -3.548132, -5.479425,
3, -3.385119, -5.209433,
3, -3.548132, -5.479425
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
-2, -3.87416, -6.01941, 0, -0.5, 0.5, 0.5,
-2, -3.87416, -6.01941, 1, -0.5, 0.5, 0.5,
-2, -3.87416, -6.01941, 1, 1.5, 0.5, 0.5,
-2, -3.87416, -6.01941, 0, 1.5, 0.5, 0.5,
-1, -3.87416, -6.01941, 0, -0.5, 0.5, 0.5,
-1, -3.87416, -6.01941, 1, -0.5, 0.5, 0.5,
-1, -3.87416, -6.01941, 1, 1.5, 0.5, 0.5,
-1, -3.87416, -6.01941, 0, 1.5, 0.5, 0.5,
0, -3.87416, -6.01941, 0, -0.5, 0.5, 0.5,
0, -3.87416, -6.01941, 1, -0.5, 0.5, 0.5,
0, -3.87416, -6.01941, 1, 1.5, 0.5, 0.5,
0, -3.87416, -6.01941, 0, 1.5, 0.5, 0.5,
1, -3.87416, -6.01941, 0, -0.5, 0.5, 0.5,
1, -3.87416, -6.01941, 1, -0.5, 0.5, 0.5,
1, -3.87416, -6.01941, 1, 1.5, 0.5, 0.5,
1, -3.87416, -6.01941, 0, 1.5, 0.5, 0.5,
2, -3.87416, -6.01941, 0, -0.5, 0.5, 0.5,
2, -3.87416, -6.01941, 1, -0.5, 0.5, 0.5,
2, -3.87416, -6.01941, 1, 1.5, 0.5, 0.5,
2, -3.87416, -6.01941, 0, 1.5, 0.5, 0.5,
3, -3.87416, -6.01941, 0, -0.5, 0.5, 0.5,
3, -3.87416, -6.01941, 1, -0.5, 0.5, 0.5,
3, -3.87416, -6.01941, 1, 1.5, 0.5, 0.5,
3, -3.87416, -6.01941, 0, 1.5, 0.5, 0.5
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
-2.93123, -3, -5.209433,
-2.93123, 3, -5.209433,
-2.93123, -3, -5.209433,
-3.082814, -3, -5.479425,
-2.93123, -2, -5.209433,
-3.082814, -2, -5.479425,
-2.93123, -1, -5.209433,
-3.082814, -1, -5.479425,
-2.93123, 0, -5.209433,
-3.082814, 0, -5.479425,
-2.93123, 1, -5.209433,
-3.082814, 1, -5.479425,
-2.93123, 2, -5.209433,
-3.082814, 2, -5.479425,
-2.93123, 3, -5.209433,
-3.082814, 3, -5.479425
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
-3.385983, -3, -6.01941, 0, -0.5, 0.5, 0.5,
-3.385983, -3, -6.01941, 1, -0.5, 0.5, 0.5,
-3.385983, -3, -6.01941, 1, 1.5, 0.5, 0.5,
-3.385983, -3, -6.01941, 0, 1.5, 0.5, 0.5,
-3.385983, -2, -6.01941, 0, -0.5, 0.5, 0.5,
-3.385983, -2, -6.01941, 1, -0.5, 0.5, 0.5,
-3.385983, -2, -6.01941, 1, 1.5, 0.5, 0.5,
-3.385983, -2, -6.01941, 0, 1.5, 0.5, 0.5,
-3.385983, -1, -6.01941, 0, -0.5, 0.5, 0.5,
-3.385983, -1, -6.01941, 1, -0.5, 0.5, 0.5,
-3.385983, -1, -6.01941, 1, 1.5, 0.5, 0.5,
-3.385983, -1, -6.01941, 0, 1.5, 0.5, 0.5,
-3.385983, 0, -6.01941, 0, -0.5, 0.5, 0.5,
-3.385983, 0, -6.01941, 1, -0.5, 0.5, 0.5,
-3.385983, 0, -6.01941, 1, 1.5, 0.5, 0.5,
-3.385983, 0, -6.01941, 0, 1.5, 0.5, 0.5,
-3.385983, 1, -6.01941, 0, -0.5, 0.5, 0.5,
-3.385983, 1, -6.01941, 1, -0.5, 0.5, 0.5,
-3.385983, 1, -6.01941, 1, 1.5, 0.5, 0.5,
-3.385983, 1, -6.01941, 0, 1.5, 0.5, 0.5,
-3.385983, 2, -6.01941, 0, -0.5, 0.5, 0.5,
-3.385983, 2, -6.01941, 1, -0.5, 0.5, 0.5,
-3.385983, 2, -6.01941, 1, 1.5, 0.5, 0.5,
-3.385983, 2, -6.01941, 0, 1.5, 0.5, 0.5,
-3.385983, 3, -6.01941, 0, -0.5, 0.5, 0.5,
-3.385983, 3, -6.01941, 1, -0.5, 0.5, 0.5,
-3.385983, 3, -6.01941, 1, 1.5, 0.5, 0.5,
-3.385983, 3, -6.01941, 0, 1.5, 0.5, 0.5
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
-2.93123, -3.385119, -4,
-2.93123, -3.385119, 4,
-2.93123, -3.385119, -4,
-3.082814, -3.548132, -4,
-2.93123, -3.385119, -2,
-3.082814, -3.548132, -2,
-2.93123, -3.385119, 0,
-3.082814, -3.548132, 0,
-2.93123, -3.385119, 2,
-3.082814, -3.548132, 2,
-2.93123, -3.385119, 4,
-3.082814, -3.548132, 4
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
-3.385983, -3.87416, -4, 0, -0.5, 0.5, 0.5,
-3.385983, -3.87416, -4, 1, -0.5, 0.5, 0.5,
-3.385983, -3.87416, -4, 1, 1.5, 0.5, 0.5,
-3.385983, -3.87416, -4, 0, 1.5, 0.5, 0.5,
-3.385983, -3.87416, -2, 0, -0.5, 0.5, 0.5,
-3.385983, -3.87416, -2, 1, -0.5, 0.5, 0.5,
-3.385983, -3.87416, -2, 1, 1.5, 0.5, 0.5,
-3.385983, -3.87416, -2, 0, 1.5, 0.5, 0.5,
-3.385983, -3.87416, 0, 0, -0.5, 0.5, 0.5,
-3.385983, -3.87416, 0, 1, -0.5, 0.5, 0.5,
-3.385983, -3.87416, 0, 1, 1.5, 0.5, 0.5,
-3.385983, -3.87416, 0, 0, 1.5, 0.5, 0.5,
-3.385983, -3.87416, 2, 0, -0.5, 0.5, 0.5,
-3.385983, -3.87416, 2, 1, -0.5, 0.5, 0.5,
-3.385983, -3.87416, 2, 1, 1.5, 0.5, 0.5,
-3.385983, -3.87416, 2, 0, 1.5, 0.5, 0.5,
-3.385983, -3.87416, 4, 0, -0.5, 0.5, 0.5,
-3.385983, -3.87416, 4, 1, -0.5, 0.5, 0.5,
-3.385983, -3.87416, 4, 1, 1.5, 0.5, 0.5,
-3.385983, -3.87416, 4, 0, 1.5, 0.5, 0.5
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
-2.93123, -3.385119, -5.209433,
-2.93123, 3.135432, -5.209433,
-2.93123, -3.385119, 5.590266,
-2.93123, 3.135432, 5.590266,
-2.93123, -3.385119, -5.209433,
-2.93123, -3.385119, 5.590266,
-2.93123, 3.135432, -5.209433,
-2.93123, 3.135432, 5.590266,
-2.93123, -3.385119, -5.209433,
3.132147, -3.385119, -5.209433,
-2.93123, -3.385119, 5.590266,
3.132147, -3.385119, 5.590266,
-2.93123, 3.135432, -5.209433,
3.132147, 3.135432, -5.209433,
-2.93123, 3.135432, 5.590266,
3.132147, 3.135432, 5.590266,
3.132147, -3.385119, -5.209433,
3.132147, 3.135432, -5.209433,
3.132147, -3.385119, 5.590266,
3.132147, 3.135432, 5.590266,
3.132147, -3.385119, -5.209433,
3.132147, -3.385119, 5.590266,
3.132147, 3.135432, -5.209433,
3.132147, 3.135432, 5.590266
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
var radius = 7.474118;
var distance = 33.2532;
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
mvMatrix.translate( -0.1004583, 0.1248436, -0.1904166 );
mvMatrix.scale( 1.332783, 1.239338, 0.7482768 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.2532);
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
Mancozeb<-read.table("Mancozeb.xyz")
```

```
## Error in read.table("Mancozeb.xyz"): no lines available in input
```

```r
x<-Mancozeb$V2
```

```
## Error in eval(expr, envir, enclos): object 'Mancozeb' not found
```

```r
y<-Mancozeb$V3
```

```
## Error in eval(expr, envir, enclos): object 'Mancozeb' not found
```

```r
z<-Mancozeb$V4
```

```
## Error in eval(expr, envir, enclos): object 'Mancozeb' not found
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
-2.842928, -0.6551754, -2.513369, 0, 0, 1, 1, 1,
-2.482859, 1.147711, 0.3617719, 1, 0, 0, 1, 1,
-2.479729, 0.6702563, -1.062192, 1, 0, 0, 1, 1,
-2.363424, -1.556926, -2.822756, 1, 0, 0, 1, 1,
-2.359818, 1.48822, -2.315826, 1, 0, 0, 1, 1,
-2.359414, 0.2446501, -0.7584819, 1, 0, 0, 1, 1,
-2.265624, -0.5237716, -2.867729, 0, 0, 0, 1, 1,
-2.247638, 0.08493479, -1.839713, 0, 0, 0, 1, 1,
-2.194481, 0.09710178, -1.370528, 0, 0, 0, 1, 1,
-2.174941, 0.7253796, -1.194342, 0, 0, 0, 1, 1,
-2.110403, 0.07680195, 0.05156359, 0, 0, 0, 1, 1,
-2.094977, -3.290159, -2.296645, 0, 0, 0, 1, 1,
-2.089756, -0.911419, -3.401345, 0, 0, 0, 1, 1,
-2.064505, -0.8237463, -3.649927, 1, 1, 1, 1, 1,
-2.052549, 0.8257984, -0.8530931, 1, 1, 1, 1, 1,
-2.042343, -0.2214457, -1.927217, 1, 1, 1, 1, 1,
-2.040653, -0.266159, -1.256871, 1, 1, 1, 1, 1,
-2.039487, 1.946097, -1.19348, 1, 1, 1, 1, 1,
-1.987345, -0.003816844, -2.407714, 1, 1, 1, 1, 1,
-1.966499, 1.281072, -1.825453, 1, 1, 1, 1, 1,
-1.930033, -0.2294413, -1.317348, 1, 1, 1, 1, 1,
-1.908454, 0.208712, -2.861849, 1, 1, 1, 1, 1,
-1.887378, 1.403092, -1.31859, 1, 1, 1, 1, 1,
-1.873729, -0.9044586, -1.444586, 1, 1, 1, 1, 1,
-1.809297, 2.458151, -0.5310404, 1, 1, 1, 1, 1,
-1.792002, -0.06674527, -2.383025, 1, 1, 1, 1, 1,
-1.786274, -0.07352346, -1.89309, 1, 1, 1, 1, 1,
-1.763116, 0.8368509, -1.427638, 1, 1, 1, 1, 1,
-1.757299, -1.720805, -2.596071, 0, 0, 1, 1, 1,
-1.754314, 0.5059792, 0.02052017, 1, 0, 0, 1, 1,
-1.753132, -0.3493222, -2.657545, 1, 0, 0, 1, 1,
-1.751838, 1.024619, 0.5713658, 1, 0, 0, 1, 1,
-1.731708, -1.556232, -3.146797, 1, 0, 0, 1, 1,
-1.731048, 0.6480197, -1.350256, 1, 0, 0, 1, 1,
-1.716788, -0.375026, -1.466283, 0, 0, 0, 1, 1,
-1.691915, -0.2726557, -1.639005, 0, 0, 0, 1, 1,
-1.685828, 1.102243, -0.183804, 0, 0, 0, 1, 1,
-1.684965, 0.3404033, 0.0266189, 0, 0, 0, 1, 1,
-1.666991, -1.627187, -2.72475, 0, 0, 0, 1, 1,
-1.662409, -0.00163214, -1.234626, 0, 0, 0, 1, 1,
-1.656635, 0.4730569, -2.965719, 0, 0, 0, 1, 1,
-1.638785, -1.228104, -2.122971, 1, 1, 1, 1, 1,
-1.634295, 0.4886246, -0.607673, 1, 1, 1, 1, 1,
-1.625437, 0.2246421, -0.9449441, 1, 1, 1, 1, 1,
-1.625244, -0.3740732, -2.116349, 1, 1, 1, 1, 1,
-1.624443, -0.1119707, -3.589375, 1, 1, 1, 1, 1,
-1.619738, 0.8651657, -1.412142, 1, 1, 1, 1, 1,
-1.612772, -2.68123, -2.86253, 1, 1, 1, 1, 1,
-1.612204, 0.6076521, -0.2553562, 1, 1, 1, 1, 1,
-1.610105, 0.05352721, -2.115173, 1, 1, 1, 1, 1,
-1.609547, -0.8680114, 0.2040958, 1, 1, 1, 1, 1,
-1.607384, -2.408012, -1.435283, 1, 1, 1, 1, 1,
-1.598375, -1.864098, 0.5914755, 1, 1, 1, 1, 1,
-1.595044, -0.8506553, -2.147204, 1, 1, 1, 1, 1,
-1.591851, -0.04563576, 0.2027725, 1, 1, 1, 1, 1,
-1.579119, 1.893688, -1.289081, 1, 1, 1, 1, 1,
-1.575915, -1.279798, -1.539973, 0, 0, 1, 1, 1,
-1.557866, 0.3605831, 0.1763246, 1, 0, 0, 1, 1,
-1.547461, 0.8484122, -1.07563, 1, 0, 0, 1, 1,
-1.537805, -0.438878, -1.726635, 1, 0, 0, 1, 1,
-1.533977, 0.6024992, -0.519891, 1, 0, 0, 1, 1,
-1.527334, -0.3268193, -1.204956, 1, 0, 0, 1, 1,
-1.502106, 0.3374704, -1.619929, 0, 0, 0, 1, 1,
-1.487487, -0.1201857, -2.309513, 0, 0, 0, 1, 1,
-1.479513, 0.5602065, -1.63633, 0, 0, 0, 1, 1,
-1.478869, 0.1209303, 1.473586, 0, 0, 0, 1, 1,
-1.469339, -1.198948, -2.152744, 0, 0, 0, 1, 1,
-1.454749, -0.7562697, -3.09853, 0, 0, 0, 1, 1,
-1.446135, -2.075562, -4.369813, 0, 0, 0, 1, 1,
-1.443859, 0.3496546, -0.377214, 1, 1, 1, 1, 1,
-1.441744, 0.1453406, -1.193439, 1, 1, 1, 1, 1,
-1.437918, -0.429609, -0.7006331, 1, 1, 1, 1, 1,
-1.432684, -0.3522524, -0.07956306, 1, 1, 1, 1, 1,
-1.419632, 1.961413, -0.4433177, 1, 1, 1, 1, 1,
-1.413061, 1.669067, -1.767277, 1, 1, 1, 1, 1,
-1.410413, -1.065274, -2.298181, 1, 1, 1, 1, 1,
-1.404638, -0.3307842, -1.394062, 1, 1, 1, 1, 1,
-1.399113, -0.7868084, -2.623552, 1, 1, 1, 1, 1,
-1.392871, 0.5836219, -0.2373318, 1, 1, 1, 1, 1,
-1.3846, -0.1906646, -1.712849, 1, 1, 1, 1, 1,
-1.36557, -0.3471529, -1.428614, 1, 1, 1, 1, 1,
-1.355192, 0.1660554, -1.546914, 1, 1, 1, 1, 1,
-1.354565, 1.264489, -2.733829, 1, 1, 1, 1, 1,
-1.349527, 0.4024673, -3.019485, 1, 1, 1, 1, 1,
-1.318057, -0.6376913, -2.857987, 0, 0, 1, 1, 1,
-1.316218, 0.08237784, -1.216451, 1, 0, 0, 1, 1,
-1.311456, -0.9610038, -3.053294, 1, 0, 0, 1, 1,
-1.309724, 0.6887308, -1.045858, 1, 0, 0, 1, 1,
-1.301319, 0.5488862, -3.127848, 1, 0, 0, 1, 1,
-1.299226, 0.1646701, -2.326236, 1, 0, 0, 1, 1,
-1.290967, 0.6363577, -1.841101, 0, 0, 0, 1, 1,
-1.277855, 0.3854258, -3.023524, 0, 0, 0, 1, 1,
-1.264706, 0.1974241, -0.9075617, 0, 0, 0, 1, 1,
-1.234955, -1.267576, -1.737574, 0, 0, 0, 1, 1,
-1.23143, -0.8769529, 1.069481, 0, 0, 0, 1, 1,
-1.228949, -0.4107312, -1.736272, 0, 0, 0, 1, 1,
-1.218716, -0.0902705, -1.06475, 0, 0, 0, 1, 1,
-1.211294, -0.8799144, -0.7105668, 1, 1, 1, 1, 1,
-1.20148, -0.2190947, -1.236015, 1, 1, 1, 1, 1,
-1.193661, -1.055378, -4.605491, 1, 1, 1, 1, 1,
-1.193468, 2.004174, -1.292101, 1, 1, 1, 1, 1,
-1.190427, 0.2301757, -3.020023, 1, 1, 1, 1, 1,
-1.188858, -0.4424031, -0.7884668, 1, 1, 1, 1, 1,
-1.180127, 0.3917851, -0.2597555, 1, 1, 1, 1, 1,
-1.176789, -1.234377, -0.1659478, 1, 1, 1, 1, 1,
-1.175166, 1.796823, -1.878021, 1, 1, 1, 1, 1,
-1.172724, 0.1017177, -0.3741115, 1, 1, 1, 1, 1,
-1.171717, -0.1645713, -1.224166, 1, 1, 1, 1, 1,
-1.162971, -0.8317531, -1.882264, 1, 1, 1, 1, 1,
-1.162351, -0.07961746, -3.28803, 1, 1, 1, 1, 1,
-1.161391, -1.351133, -2.320695, 1, 1, 1, 1, 1,
-1.134075, 0.5950788, 0.09259246, 1, 1, 1, 1, 1,
-1.12988, 0.4172393, -0.4863021, 0, 0, 1, 1, 1,
-1.125051, -0.8709913, -3.118986, 1, 0, 0, 1, 1,
-1.124215, 0.3822781, -1.160476, 1, 0, 0, 1, 1,
-1.114987, 0.07311929, -3.4495, 1, 0, 0, 1, 1,
-1.111494, -0.5763182, -4.272481, 1, 0, 0, 1, 1,
-1.105125, -0.5548803, -3.489307, 1, 0, 0, 1, 1,
-1.103807, 0.8469438, -2.001271, 0, 0, 0, 1, 1,
-1.083552, 0.6464135, -1.451122, 0, 0, 0, 1, 1,
-1.079163, 0.875205, -3.008719, 0, 0, 0, 1, 1,
-1.068144, 1.454288, -2.272466, 0, 0, 0, 1, 1,
-1.068088, 0.03712964, -2.907913, 0, 0, 0, 1, 1,
-1.065348, 1.482141, -1.397747, 0, 0, 0, 1, 1,
-1.064663, 1.579701, 0.8940606, 0, 0, 0, 1, 1,
-1.057157, -0.1359002, -1.819692, 1, 1, 1, 1, 1,
-1.051353, 0.05578621, 0.7745339, 1, 1, 1, 1, 1,
-1.051242, 1.001271, -2.070237, 1, 1, 1, 1, 1,
-1.04416, 0.1841315, -1.230482, 1, 1, 1, 1, 1,
-1.037282, -0.1917433, -1.303253, 1, 1, 1, 1, 1,
-1.03574, 1.45878, -2.654274, 1, 1, 1, 1, 1,
-1.031621, 0.1451914, -2.501803, 1, 1, 1, 1, 1,
-1.02991, 1.030317, -0.5254666, 1, 1, 1, 1, 1,
-1.024851, -0.9124011, -2.110675, 1, 1, 1, 1, 1,
-1.019575, 0.2253485, -0.6665057, 1, 1, 1, 1, 1,
-1.016937, -1.151931, -2.38558, 1, 1, 1, 1, 1,
-1.015498, -0.7617705, -4.837955, 1, 1, 1, 1, 1,
-1.014429, 0.5804614, -0.409133, 1, 1, 1, 1, 1,
-1.00325, 0.4192933, -0.9440167, 1, 1, 1, 1, 1,
-1.000273, -0.5270644, -2.935286, 1, 1, 1, 1, 1,
-0.9971672, 0.7387573, -1.409265, 0, 0, 1, 1, 1,
-0.9965351, -0.4074085, -1.562385, 1, 0, 0, 1, 1,
-0.9834112, 0.1473992, -1.831882, 1, 0, 0, 1, 1,
-0.9821213, -0.972536, -2.163871, 1, 0, 0, 1, 1,
-0.9772696, 1.273832, -0.33411, 1, 0, 0, 1, 1,
-0.9745114, -0.9747365, -1.702197, 1, 0, 0, 1, 1,
-0.9614726, -0.9579778, -4.544501, 0, 0, 0, 1, 1,
-0.9534528, 0.2907911, -1.350324, 0, 0, 0, 1, 1,
-0.9519374, -0.3381557, -2.850748, 0, 0, 0, 1, 1,
-0.9515812, 0.3105299, -3.162949, 0, 0, 0, 1, 1,
-0.9472452, 0.9174361, -1.25636, 0, 0, 0, 1, 1,
-0.9468539, 1.505616, -0.4162293, 0, 0, 0, 1, 1,
-0.9426956, 0.1855831, 0.5322507, 0, 0, 0, 1, 1,
-0.9354605, 1.313262, 0.001441826, 1, 1, 1, 1, 1,
-0.9316611, -0.5773996, -2.24628, 1, 1, 1, 1, 1,
-0.9302764, -0.5308005, -1.739759, 1, 1, 1, 1, 1,
-0.9298945, 0.9861441, -1.299791, 1, 1, 1, 1, 1,
-0.9263635, 1.617592, 1.739966, 1, 1, 1, 1, 1,
-0.9194983, 0.2906858, -2.072183, 1, 1, 1, 1, 1,
-0.9189347, 0.7571267, 0.2671986, 1, 1, 1, 1, 1,
-0.9161367, 1.139288, -1.188894, 1, 1, 1, 1, 1,
-0.9158026, -0.9795801, -2.898173, 1, 1, 1, 1, 1,
-0.9074907, -1.006127, -2.13739, 1, 1, 1, 1, 1,
-0.9058517, 1.342199, 1.134605, 1, 1, 1, 1, 1,
-0.9044939, -1.479149, -3.900162, 1, 1, 1, 1, 1,
-0.8985837, -0.1263312, -0.9767892, 1, 1, 1, 1, 1,
-0.8959663, -0.185534, -3.327955, 1, 1, 1, 1, 1,
-0.8828647, -1.707337, -3.901062, 1, 1, 1, 1, 1,
-0.8788562, 1.563865, 0.5511981, 0, 0, 1, 1, 1,
-0.8757775, -0.7065785, -2.976214, 1, 0, 0, 1, 1,
-0.8752679, -1.082814, -2.860892, 1, 0, 0, 1, 1,
-0.8733661, 0.4726944, -2.164455, 1, 0, 0, 1, 1,
-0.8717054, 1.117593, -0.8783019, 1, 0, 0, 1, 1,
-0.8621033, -0.5917336, -2.509327, 1, 0, 0, 1, 1,
-0.8603276, 2.371836, -1.759934, 0, 0, 0, 1, 1,
-0.8585429, 0.4066343, -1.744327, 0, 0, 0, 1, 1,
-0.8540406, -1.648421, -2.134514, 0, 0, 0, 1, 1,
-0.8470765, -0.6946489, -2.357849, 0, 0, 0, 1, 1,
-0.8396558, 0.1397714, -1.199768, 0, 0, 0, 1, 1,
-0.833393, 0.7215258, -0.2788917, 0, 0, 0, 1, 1,
-0.8323395, -1.550197, -3.157549, 0, 0, 0, 1, 1,
-0.8296622, 1.240728, -1.340645, 1, 1, 1, 1, 1,
-0.8257783, 0.4892993, -1.078565, 1, 1, 1, 1, 1,
-0.8246306, 0.03609091, -0.6945205, 1, 1, 1, 1, 1,
-0.8244143, -2.689162, -3.18904, 1, 1, 1, 1, 1,
-0.8233889, -0.6430475, -4.029297, 1, 1, 1, 1, 1,
-0.8193608, 0.8004674, -0.095499, 1, 1, 1, 1, 1,
-0.8193102, -1.257751, -3.300858, 1, 1, 1, 1, 1,
-0.8100112, 1.232695, -1.38664, 1, 1, 1, 1, 1,
-0.8091683, -1.580391, -3.285087, 1, 1, 1, 1, 1,
-0.8066611, -0.4154024, -1.934865, 1, 1, 1, 1, 1,
-0.8065004, -1.445619, -3.431175, 1, 1, 1, 1, 1,
-0.8018091, -0.3264132, -0.2807319, 1, 1, 1, 1, 1,
-0.8014105, 1.119355, 1.34404, 1, 1, 1, 1, 1,
-0.8011004, 2.454734, -0.2468687, 1, 1, 1, 1, 1,
-0.7955526, -0.6558939, -3.165063, 1, 1, 1, 1, 1,
-0.7944747, -1.412922, -2.227841, 0, 0, 1, 1, 1,
-0.7916066, -0.7437012, -3.380879, 1, 0, 0, 1, 1,
-0.7878076, 1.939336, 0.879589, 1, 0, 0, 1, 1,
-0.7792355, -2.308131, -2.101296, 1, 0, 0, 1, 1,
-0.7761917, 0.7265876, -0.822162, 1, 0, 0, 1, 1,
-0.7743637, 1.616162, -0.02564337, 1, 0, 0, 1, 1,
-0.7677478, -2.016293, -3.360656, 0, 0, 0, 1, 1,
-0.7669488, -0.1780764, -2.794229, 0, 0, 0, 1, 1,
-0.764387, 0.06863243, -0.3077144, 0, 0, 0, 1, 1,
-0.7639632, -0.6749377, -3.503304, 0, 0, 0, 1, 1,
-0.7616346, 0.8678674, -0.9914932, 0, 0, 0, 1, 1,
-0.760595, -0.3295664, -1.31875, 0, 0, 0, 1, 1,
-0.7592071, 0.2000537, -1.733871, 0, 0, 0, 1, 1,
-0.7536412, -2.064087, -3.196127, 1, 1, 1, 1, 1,
-0.751171, 0.5793487, -2.061025, 1, 1, 1, 1, 1,
-0.7406542, 1.810466, 0.9922218, 1, 1, 1, 1, 1,
-0.7365628, -0.6642215, -3.922752, 1, 1, 1, 1, 1,
-0.7359956, -0.9815452, -1.720883, 1, 1, 1, 1, 1,
-0.7256982, -1.000867, -2.735694, 1, 1, 1, 1, 1,
-0.7254247, -0.4025204, -2.724314, 1, 1, 1, 1, 1,
-0.7248594, 0.8266738, -0.1682179, 1, 1, 1, 1, 1,
-0.7238984, -1.012435, -1.44613, 1, 1, 1, 1, 1,
-0.7234364, -0.2953365, -3.325802, 1, 1, 1, 1, 1,
-0.7204913, -0.1993803, -2.12021, 1, 1, 1, 1, 1,
-0.7182176, 0.3775835, -1.750401, 1, 1, 1, 1, 1,
-0.7121908, -1.636436, -2.626367, 1, 1, 1, 1, 1,
-0.7070889, 0.6371725, -0.4687451, 1, 1, 1, 1, 1,
-0.7031804, 0.3604739, -0.954491, 1, 1, 1, 1, 1,
-0.7028127, 0.003455248, -3.325282, 0, 0, 1, 1, 1,
-0.6992013, 0.06200564, -1.653835, 1, 0, 0, 1, 1,
-0.6980835, -0.2525102, -1.404978, 1, 0, 0, 1, 1,
-0.6968553, 1.130106, 0.2965852, 1, 0, 0, 1, 1,
-0.6944708, 0.7616057, -2.008468, 1, 0, 0, 1, 1,
-0.692982, -0.167895, -3.200935, 1, 0, 0, 1, 1,
-0.6900524, -1.213683, -2.330198, 0, 0, 0, 1, 1,
-0.6894733, -0.2576867, -0.351532, 0, 0, 0, 1, 1,
-0.6829951, 0.3004175, -1.962762, 0, 0, 0, 1, 1,
-0.6829922, -0.4450958, -1.17598, 0, 0, 0, 1, 1,
-0.667143, 1.218213, 2.601809, 0, 0, 0, 1, 1,
-0.6663607, -1.709931, -2.782672, 0, 0, 0, 1, 1,
-0.6590219, 1.300017, -0.4877236, 0, 0, 0, 1, 1,
-0.6582719, 2.062379, 1.220499, 1, 1, 1, 1, 1,
-0.6534337, -1.318051, -2.14959, 1, 1, 1, 1, 1,
-0.6511321, 0.07650413, -2.346086, 1, 1, 1, 1, 1,
-0.6510918, 0.3292486, -2.273377, 1, 1, 1, 1, 1,
-0.6455696, 2.269685, -0.7460369, 1, 1, 1, 1, 1,
-0.6440887, -1.408337, -2.16226, 1, 1, 1, 1, 1,
-0.6415483, -1.636441, -3.124423, 1, 1, 1, 1, 1,
-0.6382157, 1.296415, 0.6287016, 1, 1, 1, 1, 1,
-0.6365495, 1.52913, -0.07570516, 1, 1, 1, 1, 1,
-0.6361046, 0.5722094, 0.1139798, 1, 1, 1, 1, 1,
-0.628354, -0.517521, -2.457751, 1, 1, 1, 1, 1,
-0.6259599, 0.2476398, -0.9067315, 1, 1, 1, 1, 1,
-0.623359, -0.4629163, -2.893687, 1, 1, 1, 1, 1,
-0.6215343, 0.282388, -1.487369, 1, 1, 1, 1, 1,
-0.6211162, -0.1613869, -1.653775, 1, 1, 1, 1, 1,
-0.6161138, -2.559103, -3.365392, 0, 0, 1, 1, 1,
-0.614286, -0.05525836, -1.481774, 1, 0, 0, 1, 1,
-0.6123122, 0.2792541, -1.413299, 1, 0, 0, 1, 1,
-0.6113862, 0.4425958, -2.308249, 1, 0, 0, 1, 1,
-0.6113188, -2.185003, 0.2786536, 1, 0, 0, 1, 1,
-0.6109239, -0.8710507, -1.151884, 1, 0, 0, 1, 1,
-0.6088797, -0.6318262, -2.596761, 0, 0, 0, 1, 1,
-0.6086445, 0.5197178, -1.507944, 0, 0, 0, 1, 1,
-0.601384, -0.00809001, -2.596579, 0, 0, 0, 1, 1,
-0.5991716, -0.8198012, -2.577251, 0, 0, 0, 1, 1,
-0.5971621, 0.03990924, 0.987013, 0, 0, 0, 1, 1,
-0.5948335, -0.4006639, -1.007217, 0, 0, 0, 1, 1,
-0.5947305, 1.388751, -1.460887, 0, 0, 0, 1, 1,
-0.5939204, -0.5535461, -1.93868, 1, 1, 1, 1, 1,
-0.5931391, 2.381634, -0.2787083, 1, 1, 1, 1, 1,
-0.5873113, 0.3981469, -0.573766, 1, 1, 1, 1, 1,
-0.5868846, 0.07533624, -0.4168064, 1, 1, 1, 1, 1,
-0.5868369, 0.8213776, -0.9031704, 1, 1, 1, 1, 1,
-0.5860308, -0.07511124, -2.492012, 1, 1, 1, 1, 1,
-0.5846705, 0.09222858, 0.1227102, 1, 1, 1, 1, 1,
-0.5837938, 0.6882212, -1.19644, 1, 1, 1, 1, 1,
-0.5812892, 0.4211271, 0.215511, 1, 1, 1, 1, 1,
-0.5806318, 0.05960922, -1.981972, 1, 1, 1, 1, 1,
-0.5758315, -0.5355365, -2.358752, 1, 1, 1, 1, 1,
-0.5749844, 0.5297177, -0.8042542, 1, 1, 1, 1, 1,
-0.5723062, 0.7097639, -1.995075, 1, 1, 1, 1, 1,
-0.5687135, -0.589449, -4.897166, 1, 1, 1, 1, 1,
-0.5655711, -0.1955022, -0.9981302, 1, 1, 1, 1, 1,
-0.5655222, 0.685958, -0.6961354, 0, 0, 1, 1, 1,
-0.5597875, -0.2107637, -4.369429, 1, 0, 0, 1, 1,
-0.5595946, 1.984048, 0.2712856, 1, 0, 0, 1, 1,
-0.5539232, -2.134911, -2.906313, 1, 0, 0, 1, 1,
-0.5536894, -0.8029372, -1.393166, 1, 0, 0, 1, 1,
-0.5503488, -0.1824763, -3.444751, 1, 0, 0, 1, 1,
-0.5496193, 0.07987472, -2.913071, 0, 0, 0, 1, 1,
-0.5483683, 0.2905911, -0.8383995, 0, 0, 0, 1, 1,
-0.5478835, 0.3632433, -1.171889, 0, 0, 0, 1, 1,
-0.5471346, 0.3574787, -2.356003, 0, 0, 0, 1, 1,
-0.5468065, -1.464326, -2.189318, 0, 0, 0, 1, 1,
-0.5439099, 0.426599, -0.8420737, 0, 0, 0, 1, 1,
-0.5435695, 0.2081078, -1.926297, 0, 0, 0, 1, 1,
-0.5305698, -1.374142, -3.710577, 1, 1, 1, 1, 1,
-0.5271996, 0.3516012, -1.304887, 1, 1, 1, 1, 1,
-0.5265458, 0.2827874, -1.66972, 1, 1, 1, 1, 1,
-0.5234463, -0.8746926, -1.41392, 1, 1, 1, 1, 1,
-0.5227224, -0.8061221, -2.225477, 1, 1, 1, 1, 1,
-0.5211678, -0.594864, -1.412466, 1, 1, 1, 1, 1,
-0.5207219, 1.263048, 0.5039461, 1, 1, 1, 1, 1,
-0.5199825, 0.7676238, -2.330697, 1, 1, 1, 1, 1,
-0.51666, 0.7541014, -1.348453, 1, 1, 1, 1, 1,
-0.512795, -0.05919807, -2.094367, 1, 1, 1, 1, 1,
-0.510203, 0.3743941, -1.080888, 1, 1, 1, 1, 1,
-0.5080142, 1.944952, -2.681858, 1, 1, 1, 1, 1,
-0.507997, -1.769049, -3.365903, 1, 1, 1, 1, 1,
-0.5072688, 0.8210614, -1.524712, 1, 1, 1, 1, 1,
-0.5059023, -1.083311, -1.951494, 1, 1, 1, 1, 1,
-0.498924, 0.09277609, -3.217283, 0, 0, 1, 1, 1,
-0.498877, 0.5096432, -1.231075, 1, 0, 0, 1, 1,
-0.4962063, 1.108583, -0.08279615, 1, 0, 0, 1, 1,
-0.4820339, 0.1878636, -0.8064039, 1, 0, 0, 1, 1,
-0.48079, -0.8697792, -3.638764, 1, 0, 0, 1, 1,
-0.4798745, -0.4405496, -1.894796, 1, 0, 0, 1, 1,
-0.4661468, -0.3844427, -2.978523, 0, 0, 0, 1, 1,
-0.4653325, 0.4964249, -0.1151033, 0, 0, 0, 1, 1,
-0.4646572, 1.181448, -0.0009259612, 0, 0, 0, 1, 1,
-0.4619686, -1.556672, -0.9761755, 0, 0, 0, 1, 1,
-0.4605529, 1.167183, -1.75027, 0, 0, 0, 1, 1,
-0.4590127, -1.224462, -3.43286, 0, 0, 0, 1, 1,
-0.4584433, 0.891921, 1.746423, 0, 0, 0, 1, 1,
-0.4569937, -0.6991419, -3.816696, 1, 1, 1, 1, 1,
-0.4512123, -0.3952586, -1.991792, 1, 1, 1, 1, 1,
-0.4507031, -1.065007, -2.301243, 1, 1, 1, 1, 1,
-0.4491771, 1.213544, 1.805585, 1, 1, 1, 1, 1,
-0.4491488, 0.9939766, -0.09879524, 1, 1, 1, 1, 1,
-0.4469296, -0.06657785, -2.740571, 1, 1, 1, 1, 1,
-0.4435535, 0.1950003, -0.8528748, 1, 1, 1, 1, 1,
-0.4411301, 1.616361, -1.104607, 1, 1, 1, 1, 1,
-0.4391403, -0.3374247, -1.415222, 1, 1, 1, 1, 1,
-0.4355046, 0.3379121, -0.8996652, 1, 1, 1, 1, 1,
-0.4352451, -0.1136879, -2.977599, 1, 1, 1, 1, 1,
-0.4343011, -1.141926, -1.197093, 1, 1, 1, 1, 1,
-0.4270855, -0.4261037, -3.463997, 1, 1, 1, 1, 1,
-0.4235095, 0.4349523, -0.4879619, 1, 1, 1, 1, 1,
-0.4173482, -2.08898, -2.256322, 1, 1, 1, 1, 1,
-0.4142516, -0.6642752, -2.399006, 0, 0, 1, 1, 1,
-0.4110697, 1.440345, 0.01647967, 1, 0, 0, 1, 1,
-0.4104186, 1.379184, -1.076604, 1, 0, 0, 1, 1,
-0.4101167, -0.3207759, -2.571998, 1, 0, 0, 1, 1,
-0.4097155, -1.87334, -3.539558, 1, 0, 0, 1, 1,
-0.4067134, 1.548336, -0.7903368, 1, 0, 0, 1, 1,
-0.4061108, -0.7695857, -1.780757, 0, 0, 0, 1, 1,
-0.40468, 1.258321, -1.245134, 0, 0, 0, 1, 1,
-0.4043093, -1.84442, -4.648094, 0, 0, 0, 1, 1,
-0.4029559, -1.222448, -3.157403, 0, 0, 0, 1, 1,
-0.4011229, -0.3584595, -2.032789, 0, 0, 0, 1, 1,
-0.3963981, 0.5679474, -0.708789, 0, 0, 0, 1, 1,
-0.396137, 0.2203106, 0.04107621, 0, 0, 0, 1, 1,
-0.394244, -0.5550379, -3.776199, 1, 1, 1, 1, 1,
-0.3939488, 1.760342, 0.1454722, 1, 1, 1, 1, 1,
-0.393779, -0.4330038, -1.855238, 1, 1, 1, 1, 1,
-0.3925293, 1.154623, -0.2653311, 1, 1, 1, 1, 1,
-0.3899556, -0.5662398, -2.187756, 1, 1, 1, 1, 1,
-0.3891428, 1.074558, 0.7154686, 1, 1, 1, 1, 1,
-0.3819588, -1.101548, -1.549203, 1, 1, 1, 1, 1,
-0.3797099, -0.5856392, -3.745793, 1, 1, 1, 1, 1,
-0.3784743, -0.2413187, -0.7618369, 1, 1, 1, 1, 1,
-0.3713223, 1.227006, 0.1142477, 1, 1, 1, 1, 1,
-0.3673546, -1.614214, -1.417353, 1, 1, 1, 1, 1,
-0.3643271, 1.176453, -0.4822449, 1, 1, 1, 1, 1,
-0.3618847, -0.8250518, -1.189566, 1, 1, 1, 1, 1,
-0.3611864, -0.1098966, -2.870058, 1, 1, 1, 1, 1,
-0.3518377, 0.1618479, -0.4497052, 1, 1, 1, 1, 1,
-0.3466658, -0.1014767, -2.057254, 0, 0, 1, 1, 1,
-0.3438893, -1.233909, -3.008369, 1, 0, 0, 1, 1,
-0.3425899, 1.902936, 1.273773, 1, 0, 0, 1, 1,
-0.3424884, -0.7368481, -1.653337, 1, 0, 0, 1, 1,
-0.337737, 0.8454172, -0.4166928, 1, 0, 0, 1, 1,
-0.336327, -0.05334388, -2.004089, 1, 0, 0, 1, 1,
-0.3319584, 2.040198, -0.7061765, 0, 0, 0, 1, 1,
-0.3318915, -0.1223912, -3.080072, 0, 0, 0, 1, 1,
-0.329032, 2.16118, -0.7994606, 0, 0, 0, 1, 1,
-0.322293, -0.352381, -1.66679, 0, 0, 0, 1, 1,
-0.3167877, 0.01026951, -2.823067, 0, 0, 0, 1, 1,
-0.3163515, 1.528211, -0.6408446, 0, 0, 0, 1, 1,
-0.3141946, 0.4551399, -0.2699916, 0, 0, 0, 1, 1,
-0.3131391, 0.5784772, 0.9935587, 1, 1, 1, 1, 1,
-0.3073725, 0.8236378, -1.604413, 1, 1, 1, 1, 1,
-0.3070453, 0.6003661, 0.1721812, 1, 1, 1, 1, 1,
-0.3062961, -0.0413513, -1.958557, 1, 1, 1, 1, 1,
-0.3058408, 0.01220559, 0.069093, 1, 1, 1, 1, 1,
-0.3003546, 1.507846, 1.147832, 1, 1, 1, 1, 1,
-0.2991796, -0.2230294, -2.27369, 1, 1, 1, 1, 1,
-0.2978919, 1.418684, 1.110415, 1, 1, 1, 1, 1,
-0.2973625, 0.1563974, -0.9840598, 1, 1, 1, 1, 1,
-0.2969874, -0.4683037, -3.540053, 1, 1, 1, 1, 1,
-0.2945935, 1.143011, -0.4527156, 1, 1, 1, 1, 1,
-0.2937325, 2.008384, 1.493518, 1, 1, 1, 1, 1,
-0.2927105, -0.3276816, -1.961019, 1, 1, 1, 1, 1,
-0.2861957, -0.9513404, -2.21204, 1, 1, 1, 1, 1,
-0.2810697, 1.027861, -0.11946, 1, 1, 1, 1, 1,
-0.2741298, -0.6732897, -1.67632, 0, 0, 1, 1, 1,
-0.2715265, -0.8707238, -3.246119, 1, 0, 0, 1, 1,
-0.2692127, -2.256862, -1.328003, 1, 0, 0, 1, 1,
-0.2684748, -0.4560873, -3.955794, 1, 0, 0, 1, 1,
-0.2628478, -1.590568, -3.643484, 1, 0, 0, 1, 1,
-0.2498747, -0.9676035, -3.301302, 1, 0, 0, 1, 1,
-0.2423707, 1.377575, -1.413563, 0, 0, 0, 1, 1,
-0.2422075, 0.01917104, -1.420715, 0, 0, 0, 1, 1,
-0.2401918, 0.1587656, 0.04240277, 0, 0, 0, 1, 1,
-0.2352, 0.3004128, -0.7232261, 0, 0, 0, 1, 1,
-0.2301974, 2.337548, 1.718811, 0, 0, 0, 1, 1,
-0.2234036, 0.2456532, -2.238896, 0, 0, 0, 1, 1,
-0.2223248, 0.2253856, -0.915486, 0, 0, 0, 1, 1,
-0.2218976, 0.9003937, -0.3392379, 1, 1, 1, 1, 1,
-0.2208008, 0.6571442, -1.502813, 1, 1, 1, 1, 1,
-0.2176403, -0.12938, -0.05947897, 1, 1, 1, 1, 1,
-0.2174918, 0.8380751, -1.052807, 1, 1, 1, 1, 1,
-0.2139512, -0.3371746, -2.788929, 1, 1, 1, 1, 1,
-0.2137633, -0.09632706, -1.972402, 1, 1, 1, 1, 1,
-0.2083887, -0.3951883, -1.160197, 1, 1, 1, 1, 1,
-0.2057138, 0.2441518, -0.9188268, 1, 1, 1, 1, 1,
-0.2051096, -0.5588053, -2.68862, 1, 1, 1, 1, 1,
-0.2049528, -0.8507554, -1.713894, 1, 1, 1, 1, 1,
-0.2047249, 0.1521711, -1.506032, 1, 1, 1, 1, 1,
-0.2028448, -0.8244238, -2.21724, 1, 1, 1, 1, 1,
-0.1996919, -0.2860246, -0.5112084, 1, 1, 1, 1, 1,
-0.1984227, -1.638077, -3.78297, 1, 1, 1, 1, 1,
-0.1970895, -2.456925, -3.340628, 1, 1, 1, 1, 1,
-0.1950291, -0.9940549, -1.758215, 0, 0, 1, 1, 1,
-0.1894547, 0.05978301, -0.1766437, 1, 0, 0, 1, 1,
-0.18506, 1.210562, -0.2420357, 1, 0, 0, 1, 1,
-0.1842654, 0.3176506, -0.2993591, 1, 0, 0, 1, 1,
-0.1841002, -0.3121432, -2.705554, 1, 0, 0, 1, 1,
-0.1818999, -0.2844467, -0.7496672, 1, 0, 0, 1, 1,
-0.1808187, 1.963388, -1.539566, 0, 0, 0, 1, 1,
-0.180012, -1.010906, -2.561048, 0, 0, 0, 1, 1,
-0.1788669, 0.6524886, -0.7563984, 0, 0, 0, 1, 1,
-0.1716512, -0.02386884, -4.062578, 0, 0, 0, 1, 1,
-0.1715143, -0.7707502, -3.025466, 0, 0, 0, 1, 1,
-0.1687635, -0.7502726, -3.391528, 0, 0, 0, 1, 1,
-0.1656928, 0.8239489, 1.391364, 0, 0, 0, 1, 1,
-0.1593488, -0.9609028, -1.659243, 1, 1, 1, 1, 1,
-0.1578511, -0.04325604, -0.07204527, 1, 1, 1, 1, 1,
-0.1570306, 0.2560759, -2.744855, 1, 1, 1, 1, 1,
-0.153262, 1.133701, 0.8922033, 1, 1, 1, 1, 1,
-0.1470354, 1.548448, 0.525875, 1, 1, 1, 1, 1,
-0.1375737, -1.80275, -4.429793, 1, 1, 1, 1, 1,
-0.1327435, -1.553547, -3.409289, 1, 1, 1, 1, 1,
-0.1263855, 0.4239963, -1.109107, 1, 1, 1, 1, 1,
-0.1225076, 0.8198073, 0.3039543, 1, 1, 1, 1, 1,
-0.1172273, -1.137008, -2.334411, 1, 1, 1, 1, 1,
-0.1154163, -1.887408, -2.263871, 1, 1, 1, 1, 1,
-0.1016876, -0.5233223, -3.818063, 1, 1, 1, 1, 1,
-0.09942636, -0.8784471, -2.222677, 1, 1, 1, 1, 1,
-0.09774516, -2.099483, -2.651299, 1, 1, 1, 1, 1,
-0.097701, 0.173639, -0.2508549, 1, 1, 1, 1, 1,
-0.09471926, 1.956634, 0.05760221, 0, 0, 1, 1, 1,
-0.09453943, 1.176413, -0.1823159, 1, 0, 0, 1, 1,
-0.08925901, 0.3108046, -1.6525, 1, 0, 0, 1, 1,
-0.0862378, 2.467651, 0.1919128, 1, 0, 0, 1, 1,
-0.08463937, 0.7035224, 2.549929, 1, 0, 0, 1, 1,
-0.08411754, -2.93002, -2.814252, 1, 0, 0, 1, 1,
-0.08387703, -1.869662, -2.429441, 0, 0, 0, 1, 1,
-0.08140243, 0.201649, -3.316482, 0, 0, 0, 1, 1,
-0.08013151, -1.505274, -4.706827, 0, 0, 0, 1, 1,
-0.07836115, 0.1851461, 1.708356, 0, 0, 0, 1, 1,
-0.07707752, 0.9899231, -1.80302, 0, 0, 0, 1, 1,
-0.07575792, 0.3803766, -0.8856735, 0, 0, 0, 1, 1,
-0.07413399, -0.3795459, -3.127541, 0, 0, 0, 1, 1,
-0.07116507, 0.4938987, 0.3794735, 1, 1, 1, 1, 1,
-0.06676292, 0.7443659, 0.2590276, 1, 1, 1, 1, 1,
-0.06605818, -1.484882, -5.052155, 1, 1, 1, 1, 1,
-0.06593498, -0.07295161, -1.544134, 1, 1, 1, 1, 1,
-0.06242187, 0.8789576, 0.216133, 1, 1, 1, 1, 1,
-0.06113698, -1.370509, -2.898891, 1, 1, 1, 1, 1,
-0.06105873, 0.2977014, -0.5308067, 1, 1, 1, 1, 1,
-0.05958974, -0.7838122, -3.009497, 1, 1, 1, 1, 1,
-0.05937188, -0.3880067, -3.789732, 1, 1, 1, 1, 1,
-0.05816228, -0.8614579, -2.30749, 1, 1, 1, 1, 1,
-0.05777082, -0.09936202, -3.428322, 1, 1, 1, 1, 1,
-0.05508666, -0.6563125, -1.892613, 1, 1, 1, 1, 1,
-0.05399943, -1.3477, -3.100191, 1, 1, 1, 1, 1,
-0.05374115, 1.638556, 0.01556503, 1, 1, 1, 1, 1,
-0.04815488, 0.3266952, -1.144977, 1, 1, 1, 1, 1,
-0.04619137, 0.4928104, 0.3339227, 0, 0, 1, 1, 1,
-0.03853895, -1.741529, -2.888297, 1, 0, 0, 1, 1,
-0.03830806, 1.34662, -0.1677224, 1, 0, 0, 1, 1,
-0.03808215, -0.7374167, -3.450191, 1, 0, 0, 1, 1,
-0.03774758, -0.7521198, -2.666115, 1, 0, 0, 1, 1,
-0.03221751, 1.870853, -0.05507748, 1, 0, 0, 1, 1,
-0.03062549, 0.5807027, -1.204038, 0, 0, 0, 1, 1,
-0.02502687, -0.5507089, -1.558888, 0, 0, 0, 1, 1,
-0.02334403, 1.379742, 0.7563041, 0, 0, 0, 1, 1,
-0.01870957, 2.960607, -2.006023, 0, 0, 0, 1, 1,
-0.01356775, 1.966644, -0.1659692, 0, 0, 0, 1, 1,
-0.009233157, 0.5260978, 0.2705435, 0, 0, 0, 1, 1,
-0.0006523299, -1.26541, -1.266238, 0, 0, 0, 1, 1,
-0.0004937465, 0.8976405, 0.4748722, 1, 1, 1, 1, 1,
0.0004398432, -0.03109279, 4.702219, 1, 1, 1, 1, 1,
0.006254042, 0.529146, 0.1080212, 1, 1, 1, 1, 1,
0.009428237, -0.3981932, 3.799631, 1, 1, 1, 1, 1,
0.01063079, -0.2158103, 4.060143, 1, 1, 1, 1, 1,
0.01506905, -0.7968606, 1.901892, 1, 1, 1, 1, 1,
0.01643474, 0.186345, -1.162509, 1, 1, 1, 1, 1,
0.0224751, 0.03422983, 1.597895, 1, 1, 1, 1, 1,
0.03689999, -0.2994204, 1.480281, 1, 1, 1, 1, 1,
0.04040753, -0.1462878, 3.478633, 1, 1, 1, 1, 1,
0.04098621, 2.518854, -0.7399982, 1, 1, 1, 1, 1,
0.0417654, 1.448028, 0.1895826, 1, 1, 1, 1, 1,
0.04408209, 0.4285085, -1.555873, 1, 1, 1, 1, 1,
0.04538155, 0.7746344, -0.5278105, 1, 1, 1, 1, 1,
0.0476636, 0.2512062, -1.04084, 1, 1, 1, 1, 1,
0.04843031, 0.3851191, 2.070901, 0, 0, 1, 1, 1,
0.04898619, 2.872921, -0.937192, 1, 0, 0, 1, 1,
0.04997944, 1.013585, -0.8688752, 1, 0, 0, 1, 1,
0.05241966, -0.00317487, 3.859408, 1, 0, 0, 1, 1,
0.05440477, 1.069489, -0.06047782, 1, 0, 0, 1, 1,
0.05508672, -0.1678611, 1.355673, 1, 0, 0, 1, 1,
0.05508873, 1.542463, 1.308723, 0, 0, 0, 1, 1,
0.05875206, 1.639223, -2.355953, 0, 0, 0, 1, 1,
0.06101542, 1.06665, 1.311854, 0, 0, 0, 1, 1,
0.06168131, 1.071409, 1.361425, 0, 0, 0, 1, 1,
0.06277302, 0.4522392, 1.291379, 0, 0, 0, 1, 1,
0.0642069, -0.3914563, 3.332466, 0, 0, 0, 1, 1,
0.06536416, -2.848542, 2.9948, 0, 0, 0, 1, 1,
0.06706334, -0.1394826, 3.526657, 1, 1, 1, 1, 1,
0.06921926, 0.3161362, 1.871251, 1, 1, 1, 1, 1,
0.07547422, 0.3846059, -0.5023033, 1, 1, 1, 1, 1,
0.07735927, 1.097145, -0.311372, 1, 1, 1, 1, 1,
0.08142024, -0.03524899, 1.693819, 1, 1, 1, 1, 1,
0.08204384, 1.234963, 0.1285984, 1, 1, 1, 1, 1,
0.08463297, -0.2731609, 2.374703, 1, 1, 1, 1, 1,
0.08466534, -0.6802372, 2.906942, 1, 1, 1, 1, 1,
0.08570676, 1.471043, 1.591264, 1, 1, 1, 1, 1,
0.09287192, -1.054365, 2.327453, 1, 1, 1, 1, 1,
0.09783603, -2.291947, 2.872884, 1, 1, 1, 1, 1,
0.1016968, 0.7222082, -1.14629, 1, 1, 1, 1, 1,
0.1037091, -1.589809, 3.521052, 1, 1, 1, 1, 1,
0.1111968, -1.119213, 3.794368, 1, 1, 1, 1, 1,
0.1113793, -0.2869486, 3.231193, 1, 1, 1, 1, 1,
0.1114247, 0.2508891, 1.050213, 0, 0, 1, 1, 1,
0.1148275, -0.1625616, -1.020242, 1, 0, 0, 1, 1,
0.1150894, 0.9474952, 0.3539138, 1, 0, 0, 1, 1,
0.1180625, -0.3865791, 3.301096, 1, 0, 0, 1, 1,
0.1202118, -0.7036688, 3.838577, 1, 0, 0, 1, 1,
0.1205812, -0.6908246, 3.151623, 1, 0, 0, 1, 1,
0.1217639, 0.2159488, 0.001002345, 0, 0, 0, 1, 1,
0.1273908, -0.04857343, 2.592411, 0, 0, 0, 1, 1,
0.1363571, -2.25717, 4.480721, 0, 0, 0, 1, 1,
0.1392413, -3.139863, 3.409388, 0, 0, 0, 1, 1,
0.1450754, 0.2731899, 1.158724, 0, 0, 0, 1, 1,
0.1460334, 1.10013, -0.365094, 0, 0, 0, 1, 1,
0.1465696, 0.9056361, 1.388036, 0, 0, 0, 1, 1,
0.1494684, 0.9410775, 1.065031, 1, 1, 1, 1, 1,
0.1519154, -1.875185, 2.275776, 1, 1, 1, 1, 1,
0.1522813, 0.1637352, -1.28337, 1, 1, 1, 1, 1,
0.1541242, 0.2438648, 1.646547, 1, 1, 1, 1, 1,
0.1549689, 1.524946, -0.1455751, 1, 1, 1, 1, 1,
0.1561246, -1.031965, 2.325087, 1, 1, 1, 1, 1,
0.1581023, 0.1732941, -0.3478046, 1, 1, 1, 1, 1,
0.1596894, 0.5832596, 2.166118, 1, 1, 1, 1, 1,
0.1622464, -0.8834004, 3.507896, 1, 1, 1, 1, 1,
0.1629686, -2.885483, 3.219725, 1, 1, 1, 1, 1,
0.1658347, 0.1046335, 1.498249, 1, 1, 1, 1, 1,
0.1751058, -0.1313849, 0.3565669, 1, 1, 1, 1, 1,
0.1759908, 0.2232157, 1.713231, 1, 1, 1, 1, 1,
0.1769333, -1.262503, 2.88373, 1, 1, 1, 1, 1,
0.1776551, -0.76775, 3.208343, 1, 1, 1, 1, 1,
0.1784924, -0.3647137, 1.093491, 0, 0, 1, 1, 1,
0.1800186, 0.4452704, 1.347874, 1, 0, 0, 1, 1,
0.1831043, 0.2225967, -0.4485355, 1, 0, 0, 1, 1,
0.1860253, 1.715711, -0.8591759, 1, 0, 0, 1, 1,
0.1890293, -0.4978534, 3.258756, 1, 0, 0, 1, 1,
0.1899761, -1.30622, 3.175922, 1, 0, 0, 1, 1,
0.1907345, 0.2425312, -1.440425, 0, 0, 0, 1, 1,
0.1930711, -0.3606027, 3.683761, 0, 0, 0, 1, 1,
0.1941636, 1.841532, 0.4048489, 0, 0, 0, 1, 1,
0.1949978, -0.04105947, 2.374552, 0, 0, 0, 1, 1,
0.1960031, -0.2364908, 1.227071, 0, 0, 0, 1, 1,
0.1975566, 0.2184677, 2.712662, 0, 0, 0, 1, 1,
0.1988586, 0.05407727, 1.267991, 0, 0, 0, 1, 1,
0.1990567, 0.2925141, 1.027834, 1, 1, 1, 1, 1,
0.1999006, -0.1328392, 2.800265, 1, 1, 1, 1, 1,
0.2004469, -0.7467084, 2.798428, 1, 1, 1, 1, 1,
0.2018727, 0.2162384, 1.566664, 1, 1, 1, 1, 1,
0.2087268, 1.692364, 1.083063, 1, 1, 1, 1, 1,
0.2087797, -1.738602, 3.70676, 1, 1, 1, 1, 1,
0.2095885, 0.4511884, 0.9527862, 1, 1, 1, 1, 1,
0.2114674, 0.06364559, 0.9370112, 1, 1, 1, 1, 1,
0.211739, 0.3172661, -0.6984963, 1, 1, 1, 1, 1,
0.213458, 0.3200823, 0.3394951, 1, 1, 1, 1, 1,
0.2154416, 0.1260145, 0.5301446, 1, 1, 1, 1, 1,
0.2156625, 0.9131147, -1.798334, 1, 1, 1, 1, 1,
0.2180069, -0.2601685, 2.70223, 1, 1, 1, 1, 1,
0.2201972, -0.8861853, 2.36324, 1, 1, 1, 1, 1,
0.2218113, -1.618581, 2.858883, 1, 1, 1, 1, 1,
0.2256651, -0.7622504, 2.467023, 0, 0, 1, 1, 1,
0.2279029, 0.5120453, 0.3873921, 1, 0, 0, 1, 1,
0.2282753, 3.040472, 0.2183638, 1, 0, 0, 1, 1,
0.2286382, -0.6673284, 3.259752, 1, 0, 0, 1, 1,
0.2290606, 1.869274, -1.125787, 1, 0, 0, 1, 1,
0.2323855, -0.6058607, 2.563434, 1, 0, 0, 1, 1,
0.2324338, 0.2825544, 1.033831, 0, 0, 0, 1, 1,
0.2353885, -0.4406583, 1.039534, 0, 0, 0, 1, 1,
0.235702, -1.994476, 4.198351, 0, 0, 0, 1, 1,
0.2366248, 1.265015, -2.442102, 0, 0, 0, 1, 1,
0.2439671, 0.01614182, 2.050157, 0, 0, 0, 1, 1,
0.2499645, -0.8850461, 3.671938, 0, 0, 0, 1, 1,
0.2500901, -0.09272533, 2.67439, 0, 0, 0, 1, 1,
0.2514189, 0.1510042, 1.333608, 1, 1, 1, 1, 1,
0.251531, 0.3946566, 0.7348822, 1, 1, 1, 1, 1,
0.2551207, 2.608538, -1.358519, 1, 1, 1, 1, 1,
0.2601169, 1.400007, 0.5843643, 1, 1, 1, 1, 1,
0.2613709, 1.110239, 1.736639, 1, 1, 1, 1, 1,
0.262509, 0.4014942, 2.524432, 1, 1, 1, 1, 1,
0.2694044, 1.345325, -0.2432495, 1, 1, 1, 1, 1,
0.2718494, -0.5746412, 1.432758, 1, 1, 1, 1, 1,
0.2726393, -1.635696, 3.008216, 1, 1, 1, 1, 1,
0.2746855, 1.705528, -1.506205, 1, 1, 1, 1, 1,
0.2747235, 0.6321275, 0.08289769, 1, 1, 1, 1, 1,
0.2793423, 0.7518587, -0.1989329, 1, 1, 1, 1, 1,
0.2815946, -0.7071851, 1.015718, 1, 1, 1, 1, 1,
0.2831127, -0.956533, 3.137584, 1, 1, 1, 1, 1,
0.286988, 0.9094599, 1.246312, 1, 1, 1, 1, 1,
0.2883195, -0.457209, 3.795395, 0, 0, 1, 1, 1,
0.2888169, -0.4966758, 1.887545, 1, 0, 0, 1, 1,
0.2905228, -0.7848219, 1.651784, 1, 0, 0, 1, 1,
0.2909729, -1.08138, 1.554538, 1, 0, 0, 1, 1,
0.2931537, -1.441545, 2.835842, 1, 0, 0, 1, 1,
0.2936988, 1.667815, -0.6066357, 1, 0, 0, 1, 1,
0.2965109, 0.06627398, 0.8076877, 0, 0, 0, 1, 1,
0.2998247, 0.6191095, 0.1279679, 0, 0, 0, 1, 1,
0.3017142, -1.65618, 5.432989, 0, 0, 0, 1, 1,
0.3017561, -1.181652, 2.700862, 0, 0, 0, 1, 1,
0.3021563, -0.03506751, -0.3565427, 0, 0, 0, 1, 1,
0.3037027, 0.9255376, -0.3516081, 0, 0, 0, 1, 1,
0.3084411, 1.276825, 1.034577, 0, 0, 0, 1, 1,
0.3096449, -0.07197705, 2.476401, 1, 1, 1, 1, 1,
0.3178227, 0.03706902, 2.524625, 1, 1, 1, 1, 1,
0.3182208, 0.2427263, 0.6633087, 1, 1, 1, 1, 1,
0.318379, -0.3229625, 1.790884, 1, 1, 1, 1, 1,
0.3184814, -0.9883398, 4.58599, 1, 1, 1, 1, 1,
0.3201531, -0.2986067, 0.80983, 1, 1, 1, 1, 1,
0.3242615, 0.1124844, 2.259876, 1, 1, 1, 1, 1,
0.3260839, -0.6207349, 4.964462, 1, 1, 1, 1, 1,
0.3312377, -0.3473623, 0.8859229, 1, 1, 1, 1, 1,
0.3313774, -0.5620821, 3.711908, 1, 1, 1, 1, 1,
0.3326724, -0.6491654, 1.004107, 1, 1, 1, 1, 1,
0.3358252, -0.1771992, 2.191071, 1, 1, 1, 1, 1,
0.3361327, 0.9850914, 1.564958, 1, 1, 1, 1, 1,
0.3389825, -2.235553, 1.388302, 1, 1, 1, 1, 1,
0.3409147, 0.7539276, 0.06411226, 1, 1, 1, 1, 1,
0.3419415, 0.6872157, -0.4109975, 0, 0, 1, 1, 1,
0.3454015, 2.133902, -0.01593667, 1, 0, 0, 1, 1,
0.3495601, 1.488873, -1.03445, 1, 0, 0, 1, 1,
0.3517873, 1.198122, -1.718426, 1, 0, 0, 1, 1,
0.355444, -1.313454, 4.146267, 1, 0, 0, 1, 1,
0.3638457, 0.9399373, 0.9618996, 1, 0, 0, 1, 1,
0.3665021, -0.9090413, 2.235388, 0, 0, 0, 1, 1,
0.3673863, -0.590262, 4.017962, 0, 0, 0, 1, 1,
0.3701426, -0.8196267, 1.143804, 0, 0, 0, 1, 1,
0.3712807, -0.7032562, 4.880597, 0, 0, 0, 1, 1,
0.376202, 1.497261, -0.1185536, 0, 0, 0, 1, 1,
0.3772469, 0.576471, 0.3265117, 0, 0, 0, 1, 1,
0.3796476, -0.05370934, 2.166231, 0, 0, 0, 1, 1,
0.3799703, -1.175734, 2.778073, 1, 1, 1, 1, 1,
0.3810591, 0.4415217, 1.781836, 1, 1, 1, 1, 1,
0.3837965, -0.8066146, 1.673882, 1, 1, 1, 1, 1,
0.3838078, 1.415784, 0.6083854, 1, 1, 1, 1, 1,
0.3855634, -0.8614588, 1.24646, 1, 1, 1, 1, 1,
0.4013502, -0.07700847, 1.567977, 1, 1, 1, 1, 1,
0.4048612, 0.04373778, 0.2615544, 1, 1, 1, 1, 1,
0.4061694, -0.1550374, 1.981573, 1, 1, 1, 1, 1,
0.407364, -1.075171, 4.175855, 1, 1, 1, 1, 1,
0.4159842, 0.1400862, 2.585521, 1, 1, 1, 1, 1,
0.4190286, -0.9750808, 2.689, 1, 1, 1, 1, 1,
0.4200264, -0.2041246, 1.037968, 1, 1, 1, 1, 1,
0.4278996, -0.2933859, 2.479984, 1, 1, 1, 1, 1,
0.4283422, -1.286044, 1.958039, 1, 1, 1, 1, 1,
0.4286602, 0.9688294, -0.6384936, 1, 1, 1, 1, 1,
0.4321646, 0.01045401, 1.604191, 0, 0, 1, 1, 1,
0.4345623, -0.3216765, 2.351517, 1, 0, 0, 1, 1,
0.4351453, 0.4613162, 0.2652219, 1, 0, 0, 1, 1,
0.4362238, -1.073502, 2.363394, 1, 0, 0, 1, 1,
0.439281, 0.5158424, -0.2458988, 1, 0, 0, 1, 1,
0.4416504, 1.604684, -0.05664432, 1, 0, 0, 1, 1,
0.4469483, 0.3959079, -0.1392901, 0, 0, 0, 1, 1,
0.4479351, 0.7657275, 0.4705207, 0, 0, 0, 1, 1,
0.4488854, 0.4306314, -0.3572243, 0, 0, 0, 1, 1,
0.4509131, 0.731549, 1.021896, 0, 0, 0, 1, 1,
0.4563073, 0.7723456, 0.9351668, 0, 0, 0, 1, 1,
0.4572598, -0.8205225, 1.868677, 0, 0, 0, 1, 1,
0.4657701, 0.2447046, 0.9193618, 0, 0, 0, 1, 1,
0.4706871, -1.673979, 4.229895, 1, 1, 1, 1, 1,
0.471386, 0.1254575, 1.638844, 1, 1, 1, 1, 1,
0.4748684, 1.933735, -0.2159053, 1, 1, 1, 1, 1,
0.4819638, -0.2411965, 2.105436, 1, 1, 1, 1, 1,
0.4882056, 1.184497, 1.494556, 1, 1, 1, 1, 1,
0.4882978, 0.2249596, 1.278975, 1, 1, 1, 1, 1,
0.4888053, -0.2488785, 0.772019, 1, 1, 1, 1, 1,
0.4943909, -1.000749, 1.798798, 1, 1, 1, 1, 1,
0.4965944, -1.324103, 4.286661, 1, 1, 1, 1, 1,
0.5001025, -0.9886611, 3.922813, 1, 1, 1, 1, 1,
0.5037305, -0.5673801, 2.311736, 1, 1, 1, 1, 1,
0.5042184, -1.553713, 3.424786, 1, 1, 1, 1, 1,
0.5102997, 1.268932, 0.4417569, 1, 1, 1, 1, 1,
0.514479, -1.54742, 2.235724, 1, 1, 1, 1, 1,
0.5157526, -0.09958454, 2.283427, 1, 1, 1, 1, 1,
0.5212923, -0.08363624, 2.289457, 0, 0, 1, 1, 1,
0.5287836, 0.2356349, 1.358686, 1, 0, 0, 1, 1,
0.5306615, -0.1504764, 2.611286, 1, 0, 0, 1, 1,
0.534697, 0.02675447, 2.310847, 1, 0, 0, 1, 1,
0.5350664, 0.7312861, 0.7606439, 1, 0, 0, 1, 1,
0.5364529, 0.2616042, 2.720443, 1, 0, 0, 1, 1,
0.5484662, 0.2552959, 0.6590301, 0, 0, 0, 1, 1,
0.5504842, -1.260196, 1.264832, 0, 0, 0, 1, 1,
0.5509884, -1.367069, 3.109286, 0, 0, 0, 1, 1,
0.5522869, 0.06997132, 0.4095683, 0, 0, 0, 1, 1,
0.5583851, -0.8984931, 3.902648, 0, 0, 0, 1, 1,
0.5592862, 0.04180184, 0.9835397, 0, 0, 0, 1, 1,
0.5603778, -0.2580385, 2.272312, 0, 0, 0, 1, 1,
0.5676223, 0.1008949, 0.7394909, 1, 1, 1, 1, 1,
0.5688879, -0.4262547, 1.786209, 1, 1, 1, 1, 1,
0.568936, 0.01868895, 1.321025, 1, 1, 1, 1, 1,
0.5781372, -1.429103, 3.122593, 1, 1, 1, 1, 1,
0.5792643, 1.492176, 1.105132, 1, 1, 1, 1, 1,
0.5792979, -0.9758366, 3.38589, 1, 1, 1, 1, 1,
0.5825861, -0.004929177, 2.505969, 1, 1, 1, 1, 1,
0.5837344, 0.5753144, -0.3969182, 1, 1, 1, 1, 1,
0.5850893, -1.546361, 1.219557, 1, 1, 1, 1, 1,
0.586122, -0.1917409, 3.325226, 1, 1, 1, 1, 1,
0.5890388, -1.616094, 4.364132, 1, 1, 1, 1, 1,
0.591795, -0.5145309, 0.3086846, 1, 1, 1, 1, 1,
0.5964188, 0.4712433, 0.9697072, 1, 1, 1, 1, 1,
0.5978214, 1.047715, -1.665346, 1, 1, 1, 1, 1,
0.6014586, 1.235469, 0.5432294, 1, 1, 1, 1, 1,
0.6025047, 0.3928925, -1.419406, 0, 0, 1, 1, 1,
0.6055204, -0.6837299, 2.184108, 1, 0, 0, 1, 1,
0.606925, 0.464875, 0.9938398, 1, 0, 0, 1, 1,
0.6094354, -2.319785, 2.535301, 1, 0, 0, 1, 1,
0.6123301, -0.4874771, 4.319668, 1, 0, 0, 1, 1,
0.6162932, -2.117477, 2.665586, 1, 0, 0, 1, 1,
0.6168788, 0.006349089, 1.933314, 0, 0, 0, 1, 1,
0.6195855, 1.533322, -0.2251105, 0, 0, 0, 1, 1,
0.6242135, 0.5334492, 0.8075584, 0, 0, 0, 1, 1,
0.6384016, -0.2541624, 1.815213, 0, 0, 0, 1, 1,
0.6396604, -1.079225, 3.86966, 0, 0, 0, 1, 1,
0.6439552, 2.008045, 0.4349312, 0, 0, 0, 1, 1,
0.6464887, -0.2892443, 2.080778, 0, 0, 0, 1, 1,
0.6553753, 1.198963, 0.3057585, 1, 1, 1, 1, 1,
0.6575036, -0.06882492, 1.319282, 1, 1, 1, 1, 1,
0.6608072, -1.611163, 0.2978161, 1, 1, 1, 1, 1,
0.6619037, 0.2517034, 0.9632081, 1, 1, 1, 1, 1,
0.6624824, -0.5582771, 3.368897, 1, 1, 1, 1, 1,
0.6628031, -1.952495, 4.013949, 1, 1, 1, 1, 1,
0.6668105, -0.4851091, 1.839309, 1, 1, 1, 1, 1,
0.6712605, -1.440968, 1.679479, 1, 1, 1, 1, 1,
0.6761832, -2.303851, 2.537027, 1, 1, 1, 1, 1,
0.6782461, 1.300174, 1.112702, 1, 1, 1, 1, 1,
0.6838593, -0.9505126, 3.1006, 1, 1, 1, 1, 1,
0.6964591, -0.2187364, 2.058243, 1, 1, 1, 1, 1,
0.699126, -0.07765304, 1.153639, 1, 1, 1, 1, 1,
0.6996324, -0.3290285, 2.527918, 1, 1, 1, 1, 1,
0.7001575, -1.159377, 3.00066, 1, 1, 1, 1, 1,
0.700178, 0.4291063, 1.045629, 0, 0, 1, 1, 1,
0.7004499, 0.603718, 0.3110965, 1, 0, 0, 1, 1,
0.7025859, 0.8749774, 1.061838, 1, 0, 0, 1, 1,
0.7083434, 0.555576, 0.7477138, 1, 0, 0, 1, 1,
0.7161996, -0.7762978, 2.773203, 1, 0, 0, 1, 1,
0.7205055, 0.3557481, 0.8967539, 1, 0, 0, 1, 1,
0.7221563, 0.1902395, 0.2042186, 0, 0, 0, 1, 1,
0.7227212, 0.8821577, 1.133199, 0, 0, 0, 1, 1,
0.7290553, -0.8414545, 2.145165, 0, 0, 0, 1, 1,
0.7320683, -0.4083573, 2.185051, 0, 0, 0, 1, 1,
0.735618, -0.007353024, 2.159144, 0, 0, 0, 1, 1,
0.7374573, 0.2873816, -1.493998, 0, 0, 0, 1, 1,
0.7391548, -0.2610142, 0.9887212, 0, 0, 0, 1, 1,
0.7398461, -0.7805884, 1.542974, 1, 1, 1, 1, 1,
0.7401953, -1.820249, 1.702225, 1, 1, 1, 1, 1,
0.7428113, -1.231002, 1.976436, 1, 1, 1, 1, 1,
0.7436929, 0.279893, 0.8610682, 1, 1, 1, 1, 1,
0.7475758, 1.911003, -1.46042, 1, 1, 1, 1, 1,
0.7489227, -0.9497533, 1.338236, 1, 1, 1, 1, 1,
0.7497687, 1.531727, 0.4580133, 1, 1, 1, 1, 1,
0.7518507, -1.228902, 3.120075, 1, 1, 1, 1, 1,
0.7526927, 0.5907223, 1.349714, 1, 1, 1, 1, 1,
0.7562649, 0.3982261, 2.379529, 1, 1, 1, 1, 1,
0.7566664, -0.8736587, 3.950811, 1, 1, 1, 1, 1,
0.7572158, -1.277827, 1.621424, 1, 1, 1, 1, 1,
0.7584653, -1.420615, 3.218109, 1, 1, 1, 1, 1,
0.7608884, -0.3416005, 0.2909807, 1, 1, 1, 1, 1,
0.7727035, 1.274666, 1.299033, 1, 1, 1, 1, 1,
0.780993, 0.4830212, 1.566691, 0, 0, 1, 1, 1,
0.783316, -0.4713321, 2.756406, 1, 0, 0, 1, 1,
0.787295, 0.7230802, 1.512533, 1, 0, 0, 1, 1,
0.789426, -1.489047, 3.111154, 1, 0, 0, 1, 1,
0.7927356, 2.386899, -0.7145362, 1, 0, 0, 1, 1,
0.7931233, -1.055977, 3.437975, 1, 0, 0, 1, 1,
0.7942868, -0.585068, 0.09370603, 0, 0, 0, 1, 1,
0.794933, 0.2878014, 1.515048, 0, 0, 0, 1, 1,
0.7953665, -1.95843, 3.382422, 0, 0, 0, 1, 1,
0.797491, 1.177955, -0.603128, 0, 0, 0, 1, 1,
0.8010508, -0.6233565, 1.662319, 0, 0, 0, 1, 1,
0.805468, 1.730784, 0.3814413, 0, 0, 0, 1, 1,
0.8121604, -0.9164824, 2.225415, 0, 0, 0, 1, 1,
0.8140854, 1.376065, 1.24624, 1, 1, 1, 1, 1,
0.8151163, -1.009996, 2.756501, 1, 1, 1, 1, 1,
0.8180483, -1.002522, 3.349648, 1, 1, 1, 1, 1,
0.8214073, -1.208426, 1.228301, 1, 1, 1, 1, 1,
0.8235953, 0.3467202, 1.17845, 1, 1, 1, 1, 1,
0.8256698, 0.1060644, 2.378551, 1, 1, 1, 1, 1,
0.8282338, -0.02981294, 2.927755, 1, 1, 1, 1, 1,
0.8320195, -1.603361, 4.504273, 1, 1, 1, 1, 1,
0.8346982, 0.4570292, 1.28453, 1, 1, 1, 1, 1,
0.8367144, 0.316894, 1.814392, 1, 1, 1, 1, 1,
0.8369758, 2.318666, 1.039334, 1, 1, 1, 1, 1,
0.8376396, -1.975304, 3.361895, 1, 1, 1, 1, 1,
0.8392462, 1.590079, 0.546298, 1, 1, 1, 1, 1,
0.8437601, 0.5468557, 1.967653, 1, 1, 1, 1, 1,
0.8447466, 0.005905253, 0.4175088, 1, 1, 1, 1, 1,
0.8514351, -0.68957, 2.961957, 0, 0, 1, 1, 1,
0.8545078, 0.3258457, 0.1774413, 1, 0, 0, 1, 1,
0.8625896, -1.014318, 3.56091, 1, 0, 0, 1, 1,
0.8633506, 1.648889, 0.5334536, 1, 0, 0, 1, 1,
0.8733864, -0.2486507, 2.248073, 1, 0, 0, 1, 1,
0.8783674, 0.06234916, 1.353081, 1, 0, 0, 1, 1,
0.8938347, -0.2018218, 0.09616712, 0, 0, 0, 1, 1,
0.9040318, 0.2872964, 0.9460422, 0, 0, 0, 1, 1,
0.9067597, -0.7699322, 1.342641, 0, 0, 0, 1, 1,
0.9078916, 0.7404558, 1.451846, 0, 0, 0, 1, 1,
0.9096317, -0.286601, 1.278286, 0, 0, 0, 1, 1,
0.9103543, -0.6388423, 3.45639, 0, 0, 0, 1, 1,
0.9236312, 1.759434, -0.06903547, 0, 0, 0, 1, 1,
0.9243731, -0.6697584, 2.324971, 1, 1, 1, 1, 1,
0.9247033, -0.7691941, 1.86981, 1, 1, 1, 1, 1,
0.9298637, -0.667825, 1.663784, 1, 1, 1, 1, 1,
0.937545, 0.9349598, 1.541496, 1, 1, 1, 1, 1,
0.9439313, 0.5142487, 0.6088215, 1, 1, 1, 1, 1,
0.9460683, 2.491531, 2.540886, 1, 1, 1, 1, 1,
0.9499977, -1.117396, 2.818938, 1, 1, 1, 1, 1,
0.9700836, -0.2699198, 1.716246, 1, 1, 1, 1, 1,
0.9771594, 1.12282, 0.298291, 1, 1, 1, 1, 1,
0.9795135, 0.2458689, 1.101784, 1, 1, 1, 1, 1,
0.9803126, 1.916516, 1.641268, 1, 1, 1, 1, 1,
0.987151, 0.2075708, 2.276117, 1, 1, 1, 1, 1,
0.9876069, -0.4648604, 2.786174, 1, 1, 1, 1, 1,
0.9942255, -0.1181114, 1.245983, 1, 1, 1, 1, 1,
0.9952778, -1.151503, 2.927888, 1, 1, 1, 1, 1,
0.9964964, 1.234719, 1.71979, 0, 0, 1, 1, 1,
0.998147, 0.4811535, 0.2216248, 1, 0, 0, 1, 1,
0.9998548, -1.201104, 1.047293, 1, 0, 0, 1, 1,
1.001402, -0.3977488, 2.612669, 1, 0, 0, 1, 1,
1.005558, 1.065185, 0.08340111, 1, 0, 0, 1, 1,
1.006175, 0.6272957, -0.7137275, 1, 0, 0, 1, 1,
1.006561, -1.216301, 2.856746, 0, 0, 0, 1, 1,
1.025773, 1.030499, -0.3747556, 0, 0, 0, 1, 1,
1.034513, 1.829906, 0.662353, 0, 0, 0, 1, 1,
1.034609, 0.05235723, 2.830579, 0, 0, 0, 1, 1,
1.038133, -1.063059, 1.588807, 0, 0, 0, 1, 1,
1.041867, -0.004453383, 1.486508, 0, 0, 0, 1, 1,
1.051963, -1.413868, 1.674624, 0, 0, 0, 1, 1,
1.053574, -0.6417249, 1.89025, 1, 1, 1, 1, 1,
1.053703, 0.4597472, 1.317973, 1, 1, 1, 1, 1,
1.065249, -0.1089984, 2.223101, 1, 1, 1, 1, 1,
1.068407, -1.082495, 2.322741, 1, 1, 1, 1, 1,
1.072301, -1.096185, 1.823973, 1, 1, 1, 1, 1,
1.074646, -2.064973, 1.463652, 1, 1, 1, 1, 1,
1.080174, 0.6157928, 1.041755, 1, 1, 1, 1, 1,
1.080551, -0.3288933, 1.673435, 1, 1, 1, 1, 1,
1.084321, -1.344961, 2.28167, 1, 1, 1, 1, 1,
1.08832, 0.0975987, 4.411369, 1, 1, 1, 1, 1,
1.089151, 0.07148015, 0.8711062, 1, 1, 1, 1, 1,
1.090056, -1.280309, 3.196645, 1, 1, 1, 1, 1,
1.105723, -0.6765192, -0.1223703, 1, 1, 1, 1, 1,
1.105774, -0.7922322, 2.553506, 1, 1, 1, 1, 1,
1.110106, 1.115952, -0.1048624, 1, 1, 1, 1, 1,
1.118154, -1.887706, 3.808242, 0, 0, 1, 1, 1,
1.120209, -0.3829547, 0.6589931, 1, 0, 0, 1, 1,
1.126886, 1.350403, -0.7712582, 1, 0, 0, 1, 1,
1.134043, 1.512974, 0.9565491, 1, 0, 0, 1, 1,
1.144674, -0.1071328, 2.30712, 1, 0, 0, 1, 1,
1.157643, 0.8378208, 1.045753, 1, 0, 0, 1, 1,
1.162189, 0.4582886, 3.656302, 0, 0, 0, 1, 1,
1.16256, -0.02718616, 0.4152434, 0, 0, 0, 1, 1,
1.165277, -0.1994794, 1.347991, 0, 0, 0, 1, 1,
1.167041, 0.7436143, 0.9192309, 0, 0, 0, 1, 1,
1.172647, -0.9830869, 1.527896, 0, 0, 0, 1, 1,
1.175853, -0.1589163, 2.313379, 0, 0, 0, 1, 1,
1.179336, 0.2048277, -0.03236071, 0, 0, 0, 1, 1,
1.181278, 0.4281792, 1.054096, 1, 1, 1, 1, 1,
1.19396, 0.1206147, -0.2292652, 1, 1, 1, 1, 1,
1.194086, 0.5126808, 1.570894, 1, 1, 1, 1, 1,
1.199747, -1.186704, 3.350817, 1, 1, 1, 1, 1,
1.208603, -1.333094, 2.386537, 1, 1, 1, 1, 1,
1.208873, 0.1731732, 0.07974663, 1, 1, 1, 1, 1,
1.215288, 0.9983665, 0.2161619, 1, 1, 1, 1, 1,
1.215596, -2.021136, 2.530001, 1, 1, 1, 1, 1,
1.22726, 1.662724, 0.7663907, 1, 1, 1, 1, 1,
1.239968, -1.419814, 3.056968, 1, 1, 1, 1, 1,
1.246957, 0.4278966, -0.08758974, 1, 1, 1, 1, 1,
1.253872, 0.7439805, 1.682657, 1, 1, 1, 1, 1,
1.257231, -0.7316099, 1.266434, 1, 1, 1, 1, 1,
1.275134, -0.6292398, 0.8726772, 1, 1, 1, 1, 1,
1.281003, -0.507619, 3.061452, 1, 1, 1, 1, 1,
1.283912, -0.3255177, 2.577296, 0, 0, 1, 1, 1,
1.287344, 2.661197, 0.9781966, 1, 0, 0, 1, 1,
1.28775, 1.051096, 2.292169, 1, 0, 0, 1, 1,
1.288406, -0.06042333, 1.652163, 1, 0, 0, 1, 1,
1.298432, 1.192278, -0.3426208, 1, 0, 0, 1, 1,
1.307442, -0.8754368, 2.985029, 1, 0, 0, 1, 1,
1.3084, 0.6314976, 1.67201, 0, 0, 0, 1, 1,
1.311685, 1.110224, 1.793503, 0, 0, 0, 1, 1,
1.31373, 0.08775274, 2.686702, 0, 0, 0, 1, 1,
1.31493, 0.5007646, 1.614066, 0, 0, 0, 1, 1,
1.33181, -1.161982, 2.915353, 0, 0, 0, 1, 1,
1.336519, -0.1386192, 2.454804, 0, 0, 0, 1, 1,
1.347911, -0.2765911, 1.27609, 0, 0, 0, 1, 1,
1.355828, 0.08754089, 1.411143, 1, 1, 1, 1, 1,
1.356933, -0.09365891, 0.5592282, 1, 1, 1, 1, 1,
1.356935, -0.662277, 1.735059, 1, 1, 1, 1, 1,
1.357315, -2.350964, 3.504736, 1, 1, 1, 1, 1,
1.358522, 0.7414936, 0.6040774, 1, 1, 1, 1, 1,
1.369049, -0.2729652, 2.322722, 1, 1, 1, 1, 1,
1.391105, 0.3571858, 1.764095, 1, 1, 1, 1, 1,
1.418398, -0.3539054, 2.266445, 1, 1, 1, 1, 1,
1.426064, 0.9348993, 0.5553961, 1, 1, 1, 1, 1,
1.42627, 0.5177751, 1.404177, 1, 1, 1, 1, 1,
1.429809, -0.3086092, 0.853142, 1, 1, 1, 1, 1,
1.437993, 0.4553724, -0.2089548, 1, 1, 1, 1, 1,
1.440604, 0.4337515, 0.8023553, 1, 1, 1, 1, 1,
1.442485, 0.8058047, 0.1335077, 1, 1, 1, 1, 1,
1.442733, 1.749048, -0.3751682, 1, 1, 1, 1, 1,
1.443447, 0.3705339, 2.976315, 0, 0, 1, 1, 1,
1.443587, -0.8838682, 1.741078, 1, 0, 0, 1, 1,
1.460204, -0.109931, 2.008862, 1, 0, 0, 1, 1,
1.460416, -0.8528555, 1.132972, 1, 0, 0, 1, 1,
1.461449, 1.089616, 1.400622, 1, 0, 0, 1, 1,
1.473163, 0.3327105, -0.3709817, 1, 0, 0, 1, 1,
1.473836, 0.2929878, 1.627437, 0, 0, 0, 1, 1,
1.483224, -0.8914647, 2.970628, 0, 0, 0, 1, 1,
1.489901, -0.6843556, 0.4061313, 0, 0, 0, 1, 1,
1.500296, -0.0007002765, 1.25768, 0, 0, 0, 1, 1,
1.50634, 1.230272, 0.08198703, 0, 0, 0, 1, 1,
1.511464, 0.8578922, -0.669189, 0, 0, 0, 1, 1,
1.520314, 0.1736774, 1.069304, 0, 0, 0, 1, 1,
1.525506, -0.1710385, -0.1537631, 1, 1, 1, 1, 1,
1.540597, 0.859155, 2.14621, 1, 1, 1, 1, 1,
1.542593, 1.007082, 0.9745857, 1, 1, 1, 1, 1,
1.551344, -1.018555, 1.383078, 1, 1, 1, 1, 1,
1.560701, -0.1634722, 3.048745, 1, 1, 1, 1, 1,
1.564325, -1.326239, 2.898844, 1, 1, 1, 1, 1,
1.576574, 0.01176529, 1.994005, 1, 1, 1, 1, 1,
1.591754, 0.6316459, 1.341321, 1, 1, 1, 1, 1,
1.611967, -0.1645457, 0.3788946, 1, 1, 1, 1, 1,
1.62901, 0.3653283, 2.873592, 1, 1, 1, 1, 1,
1.637963, -1.385614, 0.1628674, 1, 1, 1, 1, 1,
1.64092, -0.08767414, 0.5149574, 1, 1, 1, 1, 1,
1.660227, 0.01494356, 2.608958, 1, 1, 1, 1, 1,
1.666337, 2.24956, -1.395815, 1, 1, 1, 1, 1,
1.69292, 0.8931533, 2.717849, 1, 1, 1, 1, 1,
1.70595, 0.2415828, 3.416771, 0, 0, 1, 1, 1,
1.708014, -0.05763111, 1.415486, 1, 0, 0, 1, 1,
1.710436, 0.8445808, 1.159141, 1, 0, 0, 1, 1,
1.714267, -1.281989, 1.946075, 1, 0, 0, 1, 1,
1.717677, 0.9458658, 1.150853, 1, 0, 0, 1, 1,
1.736701, -0.3428813, 3.976461, 1, 0, 0, 1, 1,
1.739232, -1.005351, 2.326839, 0, 0, 0, 1, 1,
1.750554, -1.801709, 1.862945, 0, 0, 0, 1, 1,
1.760985, -0.4825104, 1.924625, 0, 0, 0, 1, 1,
1.783834, 1.826145, 0.5776813, 0, 0, 0, 1, 1,
1.784048, -1.063742, 1.605803, 0, 0, 0, 1, 1,
1.840688, 0.9133523, 0.5132078, 0, 0, 0, 1, 1,
1.848598, -0.3746352, 3.299937, 0, 0, 0, 1, 1,
1.865528, -0.4671024, 2.2693, 1, 1, 1, 1, 1,
1.88787, -0.2062829, 1.158007, 1, 1, 1, 1, 1,
1.891274, 0.2127824, 0.2559136, 1, 1, 1, 1, 1,
1.894807, -1.473786, 2.855703, 1, 1, 1, 1, 1,
1.9136, 1.158576, 1.717282, 1, 1, 1, 1, 1,
1.920897, 1.2587, 1.201389, 1, 1, 1, 1, 1,
1.92532, 0.3870783, 1.722584, 1, 1, 1, 1, 1,
1.940528, 0.3862287, 0.4762714, 1, 1, 1, 1, 1,
1.968135, -0.2871921, 3.176042, 1, 1, 1, 1, 1,
1.979228, -0.03371521, 0.1548583, 1, 1, 1, 1, 1,
2.000607, 0.170585, 1.100432, 1, 1, 1, 1, 1,
2.047596, -0.698727, 1.119118, 1, 1, 1, 1, 1,
2.063912, 0.9870001, -0.1265037, 1, 1, 1, 1, 1,
2.092106, -0.9611039, 1.877945, 1, 1, 1, 1, 1,
2.101225, -0.3813367, 3.002982, 1, 1, 1, 1, 1,
2.119767, 0.349494, 3.123691, 0, 0, 1, 1, 1,
2.175918, 1.080482, 1.765558, 1, 0, 0, 1, 1,
2.182409, 0.4466238, -1.313019, 1, 0, 0, 1, 1,
2.21143, 1.798924, 0.1056798, 1, 0, 0, 1, 1,
2.21389, -0.6734817, 2.19283, 1, 0, 0, 1, 1,
2.244916, -1.577052, 2.39231, 1, 0, 0, 1, 1,
2.254979, -0.2794478, 2.935929, 0, 0, 0, 1, 1,
2.273122, -1.164915, 2.384195, 0, 0, 0, 1, 1,
2.315636, 1.001128, 1.943756, 0, 0, 0, 1, 1,
2.320086, -1.116011, 3.182587, 0, 0, 0, 1, 1,
2.341215, 0.543838, 1.020385, 0, 0, 0, 1, 1,
2.389404, -0.1019538, -0.4844798, 0, 0, 0, 1, 1,
2.498458, -0.168199, 1.931437, 0, 0, 0, 1, 1,
2.505555, -0.9369779, 1.72719, 1, 1, 1, 1, 1,
2.519101, -0.9913676, 0.4686676, 1, 1, 1, 1, 1,
2.54042, -0.2370431, 1.165512, 1, 1, 1, 1, 1,
2.904022, 1.455131, 0.9392887, 1, 1, 1, 1, 1,
2.942541, -0.1342504, 0.8641869, 1, 1, 1, 1, 1,
3.006803, 1.216151, 0.247473, 1, 1, 1, 1, 1,
3.043845, 0.9503052, 1.247432, 1, 1, 1, 1, 1
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
var radius = 9.32537;
var distance = 32.75497;
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
mvMatrix.translate( -0.1004584, 0.1248436, -0.1904166 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.75497);
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
