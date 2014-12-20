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
-3.476221, 0.1734553, -1.889328, 1, 0, 0, 1,
-2.740114, 0.7615505, -0.5213364, 1, 0.007843138, 0, 1,
-2.700869, -0.4917762, -3.393823, 1, 0.01176471, 0, 1,
-2.662179, -2.352106, -1.862576, 1, 0.01960784, 0, 1,
-2.501867, -0.2165623, -3.344948, 1, 0.02352941, 0, 1,
-2.466364, -1.210598, -1.601897, 1, 0.03137255, 0, 1,
-2.427471, 0.8120021, -2.969906, 1, 0.03529412, 0, 1,
-2.421278, -1.286139, -2.081116, 1, 0.04313726, 0, 1,
-2.399147, 1.089435, -1.7285, 1, 0.04705882, 0, 1,
-2.386355, -0.9161387, -2.876858, 1, 0.05490196, 0, 1,
-2.36553, 0.8193595, -1.119941, 1, 0.05882353, 0, 1,
-2.333308, 0.1061172, -0.7761216, 1, 0.06666667, 0, 1,
-2.3235, 1.475475, -3.045683, 1, 0.07058824, 0, 1,
-2.316772, 1.441003, -0.8975583, 1, 0.07843138, 0, 1,
-2.297364, 1.107777, -1.124194, 1, 0.08235294, 0, 1,
-2.282499, 0.2019131, -2.575823, 1, 0.09019608, 0, 1,
-2.221183, -1.2219, -3.609002, 1, 0.09411765, 0, 1,
-2.206808, 2.604535, -0.0993862, 1, 0.1019608, 0, 1,
-2.201047, -1.814204, -4.438923, 1, 0.1098039, 0, 1,
-2.17211, -0.3010336, -1.58935, 1, 0.1137255, 0, 1,
-2.159611, 0.3634651, -0.623809, 1, 0.1215686, 0, 1,
-2.158289, 0.8021688, -2.553125, 1, 0.1254902, 0, 1,
-2.144774, -0.5753691, -2.654928, 1, 0.1333333, 0, 1,
-2.133661, 1.096243, -2.218249, 1, 0.1372549, 0, 1,
-2.114204, 0.03793288, -0.1053085, 1, 0.145098, 0, 1,
-2.110316, 0.871003, -2.708686, 1, 0.1490196, 0, 1,
-2.059731, -1.260394, -3.035513, 1, 0.1568628, 0, 1,
-2.045739, 0.3412637, -1.773758, 1, 0.1607843, 0, 1,
-1.986348, 0.2746215, -2.547218, 1, 0.1686275, 0, 1,
-1.981818, -0.5366694, -2.479324, 1, 0.172549, 0, 1,
-1.970865, -0.9966858, -2.69639, 1, 0.1803922, 0, 1,
-1.956913, 1.237486, -1.646361, 1, 0.1843137, 0, 1,
-1.953745, 0.6176037, -0.3567799, 1, 0.1921569, 0, 1,
-1.945766, -0.2906781, -0.1985419, 1, 0.1960784, 0, 1,
-1.943651, 1.051581, 0.6950435, 1, 0.2039216, 0, 1,
-1.89117, -0.2606338, -0.1197082, 1, 0.2117647, 0, 1,
-1.810283, 0.7330711, -2.078037, 1, 0.2156863, 0, 1,
-1.805793, -0.8805104, -1.115938, 1, 0.2235294, 0, 1,
-1.797433, 0.534533, 0.05611608, 1, 0.227451, 0, 1,
-1.779274, -1.10812, -1.484599, 1, 0.2352941, 0, 1,
-1.777528, -1.070096, -2.664738, 1, 0.2392157, 0, 1,
-1.754107, -0.08521505, -1.163565, 1, 0.2470588, 0, 1,
-1.749503, 0.918366, -2.374427, 1, 0.2509804, 0, 1,
-1.747883, -1.75861, -1.949708, 1, 0.2588235, 0, 1,
-1.744291, -0.1595485, -2.276405, 1, 0.2627451, 0, 1,
-1.737548, 1.694008, -1.655295, 1, 0.2705882, 0, 1,
-1.736524, 0.6606564, 0.3878982, 1, 0.2745098, 0, 1,
-1.732039, -0.4877238, -2.687843, 1, 0.282353, 0, 1,
-1.725048, 0.2993061, -2.3102, 1, 0.2862745, 0, 1,
-1.723556, -1.058901, -2.619593, 1, 0.2941177, 0, 1,
-1.718755, -1.53663, -2.352055, 1, 0.3019608, 0, 1,
-1.711412, 0.1232988, -1.080117, 1, 0.3058824, 0, 1,
-1.709917, -0.9665771, -2.312623, 1, 0.3137255, 0, 1,
-1.701685, 2.01196, -1.027344, 1, 0.3176471, 0, 1,
-1.700211, -0.4665779, -2.557257, 1, 0.3254902, 0, 1,
-1.674566, 1.275129, -0.9265846, 1, 0.3294118, 0, 1,
-1.671245, -0.9755895, -2.391182, 1, 0.3372549, 0, 1,
-1.667558, -0.8487548, -2.435892, 1, 0.3411765, 0, 1,
-1.644678, -0.2169161, -2.248242, 1, 0.3490196, 0, 1,
-1.642201, 0.6293196, -1.292084, 1, 0.3529412, 0, 1,
-1.626038, -1.923416, -3.176076, 1, 0.3607843, 0, 1,
-1.612451, 1.481841, -2.604393, 1, 0.3647059, 0, 1,
-1.591635, -0.1646594, -2.007666, 1, 0.372549, 0, 1,
-1.587694, -1.838004, -3.91671, 1, 0.3764706, 0, 1,
-1.575027, -2.521755, -2.650868, 1, 0.3843137, 0, 1,
-1.572712, -0.5604298, -2.689549, 1, 0.3882353, 0, 1,
-1.564841, 0.8903031, -2.485653, 1, 0.3960784, 0, 1,
-1.561097, 0.3366962, -1.312617, 1, 0.4039216, 0, 1,
-1.560392, 0.08231386, -2.207125, 1, 0.4078431, 0, 1,
-1.542894, -0.9704962, -1.867296, 1, 0.4156863, 0, 1,
-1.533654, -1.6471, -2.374757, 1, 0.4196078, 0, 1,
-1.528187, -0.8539122, -1.157938, 1, 0.427451, 0, 1,
-1.527543, -0.9563212, -1.745455, 1, 0.4313726, 0, 1,
-1.517651, 1.159937, -1.564456, 1, 0.4392157, 0, 1,
-1.510007, -1.199269, -2.341451, 1, 0.4431373, 0, 1,
-1.485929, 0.3225867, -2.640677, 1, 0.4509804, 0, 1,
-1.45869, -1.549908, -3.201337, 1, 0.454902, 0, 1,
-1.458107, 0.8683267, -1.16959, 1, 0.4627451, 0, 1,
-1.457387, -0.7706292, -0.6758829, 1, 0.4666667, 0, 1,
-1.438825, 1.006235, -0.9152849, 1, 0.4745098, 0, 1,
-1.43121, -1.191035, -2.634195, 1, 0.4784314, 0, 1,
-1.430683, -1.382813, -2.646033, 1, 0.4862745, 0, 1,
-1.428733, 1.011929, -1.253558, 1, 0.4901961, 0, 1,
-1.418845, -1.201942, -3.260417, 1, 0.4980392, 0, 1,
-1.408749, 0.7649898, -2.341636, 1, 0.5058824, 0, 1,
-1.408331, -0.3281033, 0.8506007, 1, 0.509804, 0, 1,
-1.406732, -0.3235395, -1.620477, 1, 0.5176471, 0, 1,
-1.404388, 0.599108, -2.043056, 1, 0.5215687, 0, 1,
-1.401742, 0.4123546, -0.5453328, 1, 0.5294118, 0, 1,
-1.400685, 1.312354, -2.907653, 1, 0.5333334, 0, 1,
-1.379547, 1.200378, -1.236444, 1, 0.5411765, 0, 1,
-1.355031, 1.269652, -1.240865, 1, 0.5450981, 0, 1,
-1.333706, -0.9593545, -0.9962811, 1, 0.5529412, 0, 1,
-1.332111, 0.7644503, -0.2151746, 1, 0.5568628, 0, 1,
-1.331871, 2.097482, -1.916091, 1, 0.5647059, 0, 1,
-1.329077, -0.139142, -1.230843, 1, 0.5686275, 0, 1,
-1.326808, 0.06619143, -0.9819468, 1, 0.5764706, 0, 1,
-1.323751, 0.7993604, -0.6125609, 1, 0.5803922, 0, 1,
-1.318174, 0.3181194, -1.577094, 1, 0.5882353, 0, 1,
-1.31481, 0.694439, -1.035531, 1, 0.5921569, 0, 1,
-1.306566, 0.8711594, -1.394335, 1, 0.6, 0, 1,
-1.306526, 1.142818, -1.287756, 1, 0.6078432, 0, 1,
-1.305144, -0.2967215, -0.8284456, 1, 0.6117647, 0, 1,
-1.305143, -1.730897, -2.515417, 1, 0.6196079, 0, 1,
-1.305024, -0.4783829, -1.524043, 1, 0.6235294, 0, 1,
-1.303904, 1.445374, -2.847251, 1, 0.6313726, 0, 1,
-1.299085, 0.8018634, -1.974192, 1, 0.6352941, 0, 1,
-1.295103, -1.084918, -2.817747, 1, 0.6431373, 0, 1,
-1.29308, -1.381539, -2.425128, 1, 0.6470588, 0, 1,
-1.285469, -0.7262068, -1.291951, 1, 0.654902, 0, 1,
-1.270508, 0.6986928, -0.9375754, 1, 0.6588235, 0, 1,
-1.270133, 0.3348221, 0.2636878, 1, 0.6666667, 0, 1,
-1.269846, -0.6346157, -1.190446, 1, 0.6705883, 0, 1,
-1.250783, 0.9828188, -0.6338536, 1, 0.6784314, 0, 1,
-1.249864, 2.06454, -0.001142213, 1, 0.682353, 0, 1,
-1.246955, 0.7413245, -0.03845163, 1, 0.6901961, 0, 1,
-1.240246, -1.065585, -3.345987, 1, 0.6941177, 0, 1,
-1.23542, -0.02614192, -0.4965984, 1, 0.7019608, 0, 1,
-1.231256, -0.3758497, -2.094384, 1, 0.7098039, 0, 1,
-1.228426, 0.4268375, -2.198463, 1, 0.7137255, 0, 1,
-1.228369, -0.7287235, -2.987785, 1, 0.7215686, 0, 1,
-1.210447, 0.2483322, -1.370907, 1, 0.7254902, 0, 1,
-1.210313, 0.01033452, -1.651865, 1, 0.7333333, 0, 1,
-1.203237, 0.11278, -0.6356068, 1, 0.7372549, 0, 1,
-1.199608, 0.3398792, -1.235527, 1, 0.7450981, 0, 1,
-1.197149, -0.2201717, -1.071801, 1, 0.7490196, 0, 1,
-1.188564, 0.8931637, -1.639258, 1, 0.7568628, 0, 1,
-1.177022, -0.3263733, -1.458904, 1, 0.7607843, 0, 1,
-1.175189, -0.6298162, -0.8872958, 1, 0.7686275, 0, 1,
-1.173752, 1.297249, -0.6186712, 1, 0.772549, 0, 1,
-1.164804, 0.939281, -0.233501, 1, 0.7803922, 0, 1,
-1.162031, -0.0980858, -0.4035342, 1, 0.7843137, 0, 1,
-1.161111, -0.1133807, -2.758318, 1, 0.7921569, 0, 1,
-1.156085, -2.170597, -4.181489, 1, 0.7960784, 0, 1,
-1.137572, -1.05739, -1.459596, 1, 0.8039216, 0, 1,
-1.135234, 1.41573, 0.1639334, 1, 0.8117647, 0, 1,
-1.134579, -1.381412, -2.988998, 1, 0.8156863, 0, 1,
-1.132892, -0.120688, -1.606276, 1, 0.8235294, 0, 1,
-1.131475, 0.01131292, -2.571386, 1, 0.827451, 0, 1,
-1.124879, 0.8303706, -0.3843712, 1, 0.8352941, 0, 1,
-1.120743, -1.013875, -0.2685924, 1, 0.8392157, 0, 1,
-1.118215, -2.42692, -1.738108, 1, 0.8470588, 0, 1,
-1.117064, -0.1311447, -2.384019, 1, 0.8509804, 0, 1,
-1.112647, 0.67182, -0.8665025, 1, 0.8588235, 0, 1,
-1.109798, -1.36566, -1.8244, 1, 0.8627451, 0, 1,
-1.090672, -1.162825, -0.9812797, 1, 0.8705882, 0, 1,
-1.09047, 0.3115046, -3.0454, 1, 0.8745098, 0, 1,
-1.087031, 0.1262856, -0.4186749, 1, 0.8823529, 0, 1,
-1.060835, 0.2308831, -1.740341, 1, 0.8862745, 0, 1,
-1.054889, 0.5691013, -2.008883, 1, 0.8941177, 0, 1,
-1.053305, -0.01787112, -0.9882427, 1, 0.8980392, 0, 1,
-1.051853, -2.076662, -3.240119, 1, 0.9058824, 0, 1,
-1.044762, -0.2634943, -1.953301, 1, 0.9137255, 0, 1,
-1.036493, 0.9531738, -1.210305, 1, 0.9176471, 0, 1,
-1.035908, 0.5935805, -1.475138, 1, 0.9254902, 0, 1,
-1.03448, 0.6722748, -2.077702, 1, 0.9294118, 0, 1,
-1.033329, 1.336635, 0.4609352, 1, 0.9372549, 0, 1,
-1.02884, -0.5992749, -0.5744085, 1, 0.9411765, 0, 1,
-1.028542, 1.73671, -0.2348876, 1, 0.9490196, 0, 1,
-1.028344, -0.9308862, -2.948043, 1, 0.9529412, 0, 1,
-1.025157, -0.9998014, -0.3004151, 1, 0.9607843, 0, 1,
-1.024607, -0.2576325, -2.309698, 1, 0.9647059, 0, 1,
-1.023212, -0.1010493, -3.269259, 1, 0.972549, 0, 1,
-1.019778, 0.04423416, -1.480211, 1, 0.9764706, 0, 1,
-1.014625, -0.0542457, -3.390786, 1, 0.9843137, 0, 1,
-1.008722, 1.099514, -2.829236, 1, 0.9882353, 0, 1,
-1.008211, -0.6735025, -1.506509, 1, 0.9960784, 0, 1,
-1.005978, -0.5300112, -1.681515, 0.9960784, 1, 0, 1,
-1.002693, 0.05981711, -0.8125571, 0.9921569, 1, 0, 1,
-0.9981616, 0.5346229, -0.9246413, 0.9843137, 1, 0, 1,
-0.9903699, 0.5242596, -1.10495, 0.9803922, 1, 0, 1,
-0.9888954, -0.3816653, -3.365294, 0.972549, 1, 0, 1,
-0.9884776, 0.2309288, -1.966715, 0.9686275, 1, 0, 1,
-0.9873734, -1.408894, -2.747843, 0.9607843, 1, 0, 1,
-0.9864837, -0.8806902, -2.611193, 0.9568627, 1, 0, 1,
-0.9844662, -1.079355, -1.166464, 0.9490196, 1, 0, 1,
-0.9816327, 0.03069125, -0.2263217, 0.945098, 1, 0, 1,
-0.9808322, 0.8207883, -2.544187, 0.9372549, 1, 0, 1,
-0.9791679, 0.2154348, 0.1836794, 0.9333333, 1, 0, 1,
-0.9777625, 0.6999552, -2.464138, 0.9254902, 1, 0, 1,
-0.9763048, 0.6145771, -0.1569348, 0.9215686, 1, 0, 1,
-0.9723966, 0.2529122, -3.352524, 0.9137255, 1, 0, 1,
-0.9695234, -0.1878548, -1.758692, 0.9098039, 1, 0, 1,
-0.9652391, -0.7814538, -2.540795, 0.9019608, 1, 0, 1,
-0.958392, -0.3963268, -1.25022, 0.8941177, 1, 0, 1,
-0.957561, 0.1354685, -2.000933, 0.8901961, 1, 0, 1,
-0.9568338, -0.4437445, -1.9085, 0.8823529, 1, 0, 1,
-0.9555901, -1.510872, -2.87102, 0.8784314, 1, 0, 1,
-0.9548022, 0.6665268, 0.322052, 0.8705882, 1, 0, 1,
-0.9463125, 1.811737, -2.016237, 0.8666667, 1, 0, 1,
-0.9372962, 0.3451067, -0.754528, 0.8588235, 1, 0, 1,
-0.9349506, 0.7273679, 0.2106233, 0.854902, 1, 0, 1,
-0.9333857, 1.713091, -2.103838, 0.8470588, 1, 0, 1,
-0.9332051, 1.567161, -0.07097891, 0.8431373, 1, 0, 1,
-0.9287105, 0.1644623, -2.408264, 0.8352941, 1, 0, 1,
-0.915943, 1.024495, -2.611324, 0.8313726, 1, 0, 1,
-0.9145317, -2.592133, -1.571947, 0.8235294, 1, 0, 1,
-0.912798, -0.123881, -2.032926, 0.8196079, 1, 0, 1,
-0.9048543, 0.8082913, -1.444847, 0.8117647, 1, 0, 1,
-0.9004409, 0.1832929, -1.47546, 0.8078431, 1, 0, 1,
-0.8994721, -0.0224617, -3.480067, 0.8, 1, 0, 1,
-0.8991094, -0.4722098, -2.71373, 0.7921569, 1, 0, 1,
-0.8952047, 0.44296, -3.03244, 0.7882353, 1, 0, 1,
-0.8885054, -0.3143831, -1.639684, 0.7803922, 1, 0, 1,
-0.8878058, 0.3706888, -0.8588249, 0.7764706, 1, 0, 1,
-0.8805373, 1.063197, -0.731843, 0.7686275, 1, 0, 1,
-0.8798312, -0.2945484, 0.8036004, 0.7647059, 1, 0, 1,
-0.8782406, -1.834656, -3.204857, 0.7568628, 1, 0, 1,
-0.8742532, -0.8857335, -1.291919, 0.7529412, 1, 0, 1,
-0.872049, 2.076972, 0.07747212, 0.7450981, 1, 0, 1,
-0.8588657, -1.121457, -1.040849, 0.7411765, 1, 0, 1,
-0.8540899, 0.7625314, -0.5144489, 0.7333333, 1, 0, 1,
-0.8527499, -0.9515564, -2.945831, 0.7294118, 1, 0, 1,
-0.8506509, -0.8318916, -2.737732, 0.7215686, 1, 0, 1,
-0.8492254, -1.413822, -2.546709, 0.7176471, 1, 0, 1,
-0.8414686, 2.615756, -0.2083222, 0.7098039, 1, 0, 1,
-0.8352707, -1.045198, -4.257156, 0.7058824, 1, 0, 1,
-0.83025, 0.8554864, -2.650357, 0.6980392, 1, 0, 1,
-0.8259937, 1.996451, 0.5808864, 0.6901961, 1, 0, 1,
-0.823577, -1.708915, -2.467747, 0.6862745, 1, 0, 1,
-0.8204241, -0.2592455, -2.860717, 0.6784314, 1, 0, 1,
-0.8176373, -1.695393, -3.116181, 0.6745098, 1, 0, 1,
-0.8149868, -0.4285377, -2.477828, 0.6666667, 1, 0, 1,
-0.8066608, -0.3281914, -1.832055, 0.6627451, 1, 0, 1,
-0.8040761, -1.318566, -1.376633, 0.654902, 1, 0, 1,
-0.7990465, -0.5906165, -1.46502, 0.6509804, 1, 0, 1,
-0.7985051, -0.9928553, -2.786426, 0.6431373, 1, 0, 1,
-0.7981119, 0.1560327, -1.030233, 0.6392157, 1, 0, 1,
-0.7928618, 1.666815, -1.765564, 0.6313726, 1, 0, 1,
-0.7925401, -1.376799, -1.849827, 0.627451, 1, 0, 1,
-0.7890207, -0.5436183, -2.77463, 0.6196079, 1, 0, 1,
-0.7863411, -0.3415546, -2.32792, 0.6156863, 1, 0, 1,
-0.7843212, 0.1350056, -4.029321, 0.6078432, 1, 0, 1,
-0.7803618, 0.149372, -0.4478048, 0.6039216, 1, 0, 1,
-0.7775158, -0.4261349, -2.125844, 0.5960785, 1, 0, 1,
-0.7768632, 0.3450926, -1.128291, 0.5882353, 1, 0, 1,
-0.7758288, -1.30494, -2.350637, 0.5843138, 1, 0, 1,
-0.7679685, -0.8183067, -2.109419, 0.5764706, 1, 0, 1,
-0.7664978, 1.932949, 0.1613751, 0.572549, 1, 0, 1,
-0.7594816, 0.2575397, -0.414961, 0.5647059, 1, 0, 1,
-0.7575697, -2.106323, -3.941944, 0.5607843, 1, 0, 1,
-0.7557214, -3.209869, -3.196076, 0.5529412, 1, 0, 1,
-0.7504978, -1.891674, -2.315252, 0.5490196, 1, 0, 1,
-0.7466191, -0.7806067, -2.679882, 0.5411765, 1, 0, 1,
-0.7397701, 0.7363319, -0.9943817, 0.5372549, 1, 0, 1,
-0.7388485, -0.8179162, -1.883848, 0.5294118, 1, 0, 1,
-0.737874, -0.2488095, -1.24708, 0.5254902, 1, 0, 1,
-0.7368523, 0.1447503, -0.2261727, 0.5176471, 1, 0, 1,
-0.7365942, -0.359073, -3.171253, 0.5137255, 1, 0, 1,
-0.7330953, -0.5620491, -2.586987, 0.5058824, 1, 0, 1,
-0.7294338, -0.1601474, -2.332668, 0.5019608, 1, 0, 1,
-0.7276094, -0.346442, -1.105208, 0.4941176, 1, 0, 1,
-0.7272155, 0.08499599, -2.749462, 0.4862745, 1, 0, 1,
-0.7204348, -1.098305, -3.079397, 0.4823529, 1, 0, 1,
-0.7163225, 0.4067077, -0.7525627, 0.4745098, 1, 0, 1,
-0.7160276, 0.2801986, -0.1493618, 0.4705882, 1, 0, 1,
-0.709828, -0.1390189, -2.911493, 0.4627451, 1, 0, 1,
-0.6948357, 1.028792, -0.2232469, 0.4588235, 1, 0, 1,
-0.6937682, 0.6091659, 0.2179469, 0.4509804, 1, 0, 1,
-0.6896487, 0.1632701, -1.37119, 0.4470588, 1, 0, 1,
-0.6882439, -0.6531244, -3.089276, 0.4392157, 1, 0, 1,
-0.6851248, 0.7953992, -0.976644, 0.4352941, 1, 0, 1,
-0.6823657, 2.308186, -0.5615545, 0.427451, 1, 0, 1,
-0.6786385, -0.3224308, -1.048256, 0.4235294, 1, 0, 1,
-0.6735162, 1.015343, 0.1126102, 0.4156863, 1, 0, 1,
-0.6687738, -0.2175549, -0.7911352, 0.4117647, 1, 0, 1,
-0.6660183, 1.943353, 0.4160617, 0.4039216, 1, 0, 1,
-0.6657096, -1.362737, -2.303533, 0.3960784, 1, 0, 1,
-0.6588868, -1.383188, -1.58581, 0.3921569, 1, 0, 1,
-0.6586668, -0.6814497, -2.308411, 0.3843137, 1, 0, 1,
-0.6561561, -0.1192588, -1.236958, 0.3803922, 1, 0, 1,
-0.6507617, 1.835586, -1.928774, 0.372549, 1, 0, 1,
-0.64114, -1.076887, -2.614823, 0.3686275, 1, 0, 1,
-0.6399696, 0.9890712, -0.03225349, 0.3607843, 1, 0, 1,
-0.6372558, 2.221912, -0.6774886, 0.3568628, 1, 0, 1,
-0.6360613, 0.7780427, -1.481643, 0.3490196, 1, 0, 1,
-0.6346945, 0.3283665, -2.159371, 0.345098, 1, 0, 1,
-0.6320066, 0.4244604, -2.354367, 0.3372549, 1, 0, 1,
-0.6277921, 0.5803995, -0.295714, 0.3333333, 1, 0, 1,
-0.6215922, 0.1971667, -1.55337, 0.3254902, 1, 0, 1,
-0.618916, -0.3334087, -1.010238, 0.3215686, 1, 0, 1,
-0.6119344, 0.5568242, -2.9737, 0.3137255, 1, 0, 1,
-0.6090833, 1.06445, -1.615691, 0.3098039, 1, 0, 1,
-0.6036959, 0.3764562, -1.575877, 0.3019608, 1, 0, 1,
-0.6032395, -1.177034, -4.072137, 0.2941177, 1, 0, 1,
-0.5995138, -1.261837, -1.938652, 0.2901961, 1, 0, 1,
-0.5986276, -1.745415, -2.774153, 0.282353, 1, 0, 1,
-0.5970302, -1.218221, -4.174807, 0.2784314, 1, 0, 1,
-0.5920566, -0.868602, -1.929252, 0.2705882, 1, 0, 1,
-0.5873841, 0.2001547, -2.617344, 0.2666667, 1, 0, 1,
-0.5854833, -1.163202, -2.540293, 0.2588235, 1, 0, 1,
-0.5854437, 1.964499, 0.495788, 0.254902, 1, 0, 1,
-0.5823894, 0.004161404, -0.5817632, 0.2470588, 1, 0, 1,
-0.5819595, -0.1902171, -1.950025, 0.2431373, 1, 0, 1,
-0.5781637, 0.296754, 0.3131796, 0.2352941, 1, 0, 1,
-0.5745897, -0.8232267, -2.580054, 0.2313726, 1, 0, 1,
-0.5723794, 1.034771, -0.8947777, 0.2235294, 1, 0, 1,
-0.5620815, -1.586538, -3.677041, 0.2196078, 1, 0, 1,
-0.551578, -0.1097559, 0.2413944, 0.2117647, 1, 0, 1,
-0.5498574, -0.958538, -3.385843, 0.2078431, 1, 0, 1,
-0.5495726, -0.07032876, -1.441833, 0.2, 1, 0, 1,
-0.5465665, 1.687309, 1.16928, 0.1921569, 1, 0, 1,
-0.5458541, -0.4399848, -4.050528, 0.1882353, 1, 0, 1,
-0.5411288, -0.415019, -2.507973, 0.1803922, 1, 0, 1,
-0.5398349, 0.4680713, -0.4253179, 0.1764706, 1, 0, 1,
-0.5347153, -1.718717, -2.523856, 0.1686275, 1, 0, 1,
-0.531509, -0.3964478, -2.198489, 0.1647059, 1, 0, 1,
-0.5243114, 0.7350199, 0.4412931, 0.1568628, 1, 0, 1,
-0.5198499, 1.398612, -0.5756518, 0.1529412, 1, 0, 1,
-0.5198004, -1.200225, -3.129432, 0.145098, 1, 0, 1,
-0.510641, -0.4117843, -0.8092377, 0.1411765, 1, 0, 1,
-0.510164, 0.9650912, -0.2580965, 0.1333333, 1, 0, 1,
-0.5094451, -1.073264, -2.37937, 0.1294118, 1, 0, 1,
-0.5019781, -0.4517451, -2.419287, 0.1215686, 1, 0, 1,
-0.4995226, 0.190219, -1.710057, 0.1176471, 1, 0, 1,
-0.4993457, -2.04092, -2.666403, 0.1098039, 1, 0, 1,
-0.4991147, 0.1177583, -0.793959, 0.1058824, 1, 0, 1,
-0.4953288, 0.2943582, -2.291259, 0.09803922, 1, 0, 1,
-0.4929754, -0.007944659, -0.9098156, 0.09019608, 1, 0, 1,
-0.4915038, -0.4695219, -2.745624, 0.08627451, 1, 0, 1,
-0.4864394, -0.978544, -4.642476, 0.07843138, 1, 0, 1,
-0.4836449, 0.5709497, -1.138138, 0.07450981, 1, 0, 1,
-0.4758515, -0.02865197, -2.944521, 0.06666667, 1, 0, 1,
-0.4723155, 0.293657, -2.40842, 0.0627451, 1, 0, 1,
-0.4710485, -2.524367, -1.74915, 0.05490196, 1, 0, 1,
-0.4683774, 1.538916, -2.168119, 0.05098039, 1, 0, 1,
-0.4674849, 0.1429505, -0.6759906, 0.04313726, 1, 0, 1,
-0.4655254, 1.389405, 0.8976671, 0.03921569, 1, 0, 1,
-0.4632357, -0.3890713, -1.517395, 0.03137255, 1, 0, 1,
-0.4620248, 0.2451099, -0.3484375, 0.02745098, 1, 0, 1,
-0.4612662, 0.2054571, -0.5251819, 0.01960784, 1, 0, 1,
-0.4545217, 0.07342607, -1.695388, 0.01568628, 1, 0, 1,
-0.4541966, -0.7361125, -2.403347, 0.007843138, 1, 0, 1,
-0.4538283, -0.2029622, -1.862616, 0.003921569, 1, 0, 1,
-0.4533735, 1.502075, 0.04206931, 0, 1, 0.003921569, 1,
-0.4511973, -0.7504824, -1.933161, 0, 1, 0.01176471, 1,
-0.4508894, 1.1566, -0.9675668, 0, 1, 0.01568628, 1,
-0.4498504, -1.918444, -3.511983, 0, 1, 0.02352941, 1,
-0.4444654, -1.033191, -2.537259, 0, 1, 0.02745098, 1,
-0.4431372, -1.286925, -3.077576, 0, 1, 0.03529412, 1,
-0.4421273, -1.62492, -2.212224, 0, 1, 0.03921569, 1,
-0.4392446, -1.023135, -3.896827, 0, 1, 0.04705882, 1,
-0.435932, 0.2867054, -1.078137, 0, 1, 0.05098039, 1,
-0.4287032, 0.5411208, -1.122663, 0, 1, 0.05882353, 1,
-0.4241185, 0.4264458, -1.170959, 0, 1, 0.0627451, 1,
-0.4194286, 0.6800107, -0.3106695, 0, 1, 0.07058824, 1,
-0.4185853, -0.4615619, -1.586216, 0, 1, 0.07450981, 1,
-0.4169337, -0.8319008, -0.3030949, 0, 1, 0.08235294, 1,
-0.4160201, -0.03084216, -2.268557, 0, 1, 0.08627451, 1,
-0.4143705, 0.4984269, -1.509207, 0, 1, 0.09411765, 1,
-0.4138201, 0.5618199, -1.471944, 0, 1, 0.1019608, 1,
-0.4122154, 0.1541095, 0.06246863, 0, 1, 0.1058824, 1,
-0.4056064, -1.170898, -4.342582, 0, 1, 0.1137255, 1,
-0.4040876, 0.7034603, -1.32541, 0, 1, 0.1176471, 1,
-0.4000846, 1.051452, -0.5479962, 0, 1, 0.1254902, 1,
-0.3974852, 1.629253, -0.8345842, 0, 1, 0.1294118, 1,
-0.3904051, 0.5717708, 0.7743309, 0, 1, 0.1372549, 1,
-0.3889439, -2.702547, -3.923303, 0, 1, 0.1411765, 1,
-0.3843757, -0.5707239, -3.145034, 0, 1, 0.1490196, 1,
-0.3796559, -0.3441016, -3.18546, 0, 1, 0.1529412, 1,
-0.3791754, -0.8309371, -2.842504, 0, 1, 0.1607843, 1,
-0.3780692, -1.073472, -3.117601, 0, 1, 0.1647059, 1,
-0.3766752, -1.487981, -2.742882, 0, 1, 0.172549, 1,
-0.3760072, 0.02189325, -0.7445173, 0, 1, 0.1764706, 1,
-0.3738482, -0.2751572, -3.158059, 0, 1, 0.1843137, 1,
-0.3730067, -1.057694, -2.56664, 0, 1, 0.1882353, 1,
-0.3727177, -0.1175087, -2.986771, 0, 1, 0.1960784, 1,
-0.3721119, 0.7964807, -1.128937, 0, 1, 0.2039216, 1,
-0.3682809, -1.310551, -2.024211, 0, 1, 0.2078431, 1,
-0.3670899, -0.8961927, -2.948163, 0, 1, 0.2156863, 1,
-0.3655487, 0.1185897, -1.35665, 0, 1, 0.2196078, 1,
-0.3605659, 0.791445, -0.02895365, 0, 1, 0.227451, 1,
-0.3598773, 1.73029, 0.5643611, 0, 1, 0.2313726, 1,
-0.3547848, 0.08299648, -3.030688, 0, 1, 0.2392157, 1,
-0.3546015, -0.700562, -1.733446, 0, 1, 0.2431373, 1,
-0.3541676, 0.5062897, 0.4994897, 0, 1, 0.2509804, 1,
-0.3522245, 1.392801, -1.087989, 0, 1, 0.254902, 1,
-0.3506552, -0.01578042, -2.32417, 0, 1, 0.2627451, 1,
-0.3499291, -0.8327441, -1.915561, 0, 1, 0.2666667, 1,
-0.3496475, 0.2282913, -0.2934758, 0, 1, 0.2745098, 1,
-0.3441416, -0.5307654, -1.813241, 0, 1, 0.2784314, 1,
-0.3428436, -2.926085, -1.536028, 0, 1, 0.2862745, 1,
-0.3427001, -1.093817, -4.990754, 0, 1, 0.2901961, 1,
-0.3355168, 0.5968093, -0.5520708, 0, 1, 0.2980392, 1,
-0.3325433, 0.5402523, -0.1517045, 0, 1, 0.3058824, 1,
-0.3287952, 0.1246749, -1.39873, 0, 1, 0.3098039, 1,
-0.3283451, 0.1218553, -0.96367, 0, 1, 0.3176471, 1,
-0.3272369, 0.5143301, -0.3556375, 0, 1, 0.3215686, 1,
-0.3268267, -0.9039611, -2.267872, 0, 1, 0.3294118, 1,
-0.3267136, -1.098552, -3.696078, 0, 1, 0.3333333, 1,
-0.324695, -0.9849916, -3.393557, 0, 1, 0.3411765, 1,
-0.3205651, -0.3803372, -2.610362, 0, 1, 0.345098, 1,
-0.3169384, -0.3671004, -3.359571, 0, 1, 0.3529412, 1,
-0.3130924, 0.3475154, 0.4009929, 0, 1, 0.3568628, 1,
-0.3118079, -0.806523, -3.948231, 0, 1, 0.3647059, 1,
-0.3109896, 1.078418, -2.193261, 0, 1, 0.3686275, 1,
-0.3090614, 0.3936909, 0.2992456, 0, 1, 0.3764706, 1,
-0.3089781, -0.885116, -3.437652, 0, 1, 0.3803922, 1,
-0.3084699, 0.2629255, -2.161694, 0, 1, 0.3882353, 1,
-0.30797, 0.08330133, -0.8593597, 0, 1, 0.3921569, 1,
-0.3070548, 0.5151758, -0.3214453, 0, 1, 0.4, 1,
-0.3047662, -0.6050658, -2.919668, 0, 1, 0.4078431, 1,
-0.3009113, 0.2363743, -1.585876, 0, 1, 0.4117647, 1,
-0.3008336, -0.4477154, -2.345833, 0, 1, 0.4196078, 1,
-0.2980449, -0.3585858, -2.337503, 0, 1, 0.4235294, 1,
-0.296917, -1.276843, -4.452883, 0, 1, 0.4313726, 1,
-0.2962539, 0.2253616, -0.9001223, 0, 1, 0.4352941, 1,
-0.2948553, -0.3066237, -2.069073, 0, 1, 0.4431373, 1,
-0.2920499, 1.728557, 1.909072, 0, 1, 0.4470588, 1,
-0.2855303, -0.04638529, -1.920359, 0, 1, 0.454902, 1,
-0.2810448, -1.177961, -2.798181, 0, 1, 0.4588235, 1,
-0.2797736, -0.4769789, -3.660907, 0, 1, 0.4666667, 1,
-0.2778693, -0.7972501, -3.909247, 0, 1, 0.4705882, 1,
-0.2775932, -0.02484968, -2.314714, 0, 1, 0.4784314, 1,
-0.2766958, -0.4860765, -1.665167, 0, 1, 0.4823529, 1,
-0.2736807, 1.401701, -0.3942668, 0, 1, 0.4901961, 1,
-0.2732694, 0.04004614, -2.949499, 0, 1, 0.4941176, 1,
-0.271053, 0.7479706, -2.29675, 0, 1, 0.5019608, 1,
-0.2704641, -0.6362889, -0.2690032, 0, 1, 0.509804, 1,
-0.2700102, 0.5062438, -1.79148, 0, 1, 0.5137255, 1,
-0.2689182, 0.4423214, 0.01812505, 0, 1, 0.5215687, 1,
-0.2654145, 0.6851651, 0.2504333, 0, 1, 0.5254902, 1,
-0.2627552, 0.8768916, -1.221178, 0, 1, 0.5333334, 1,
-0.2569604, -0.2513022, -3.855395, 0, 1, 0.5372549, 1,
-0.2560742, 0.8659772, -1.581787, 0, 1, 0.5450981, 1,
-0.2555221, 1.338855, -1.455984, 0, 1, 0.5490196, 1,
-0.2533404, -0.3026028, -2.32397, 0, 1, 0.5568628, 1,
-0.2514367, 0.6440665, -1.665094, 0, 1, 0.5607843, 1,
-0.2513838, 0.7013158, -0.9849496, 0, 1, 0.5686275, 1,
-0.2484563, -0.05148752, -1.632626, 0, 1, 0.572549, 1,
-0.2380127, -0.451567, -3.316335, 0, 1, 0.5803922, 1,
-0.2353718, -0.3254034, -2.208613, 0, 1, 0.5843138, 1,
-0.2344881, 1.391091, -0.8536373, 0, 1, 0.5921569, 1,
-0.2319956, -0.06262148, -1.195908, 0, 1, 0.5960785, 1,
-0.2303483, -2.84539, -5.282297, 0, 1, 0.6039216, 1,
-0.2288111, -0.7234474, -4.719553, 0, 1, 0.6117647, 1,
-0.2195403, -0.3558678, -3.357386, 0, 1, 0.6156863, 1,
-0.2164817, 0.7595468, -0.8131245, 0, 1, 0.6235294, 1,
-0.2160594, 1.359741, -0.2385607, 0, 1, 0.627451, 1,
-0.2135326, -0.9892044, -4.537116, 0, 1, 0.6352941, 1,
-0.2130988, 0.3541904, -0.07195312, 0, 1, 0.6392157, 1,
-0.2107644, -0.8781097, -2.732181, 0, 1, 0.6470588, 1,
-0.2101744, 0.5054528, -0.3558498, 0, 1, 0.6509804, 1,
-0.2099933, -0.01887928, -1.954829, 0, 1, 0.6588235, 1,
-0.2067636, 0.3004212, -1.371863, 0, 1, 0.6627451, 1,
-0.2066661, -0.6075391, -4.102777, 0, 1, 0.6705883, 1,
-0.20429, 0.4167058, -0.6209748, 0, 1, 0.6745098, 1,
-0.203794, -0.5473697, -2.277598, 0, 1, 0.682353, 1,
-0.2034486, -0.3464115, -2.768648, 0, 1, 0.6862745, 1,
-0.2022719, 0.402785, 1.841097, 0, 1, 0.6941177, 1,
-0.2007339, -0.6363341, -3.146324, 0, 1, 0.7019608, 1,
-0.1995441, -0.3173242, -2.714521, 0, 1, 0.7058824, 1,
-0.1990923, -0.9586833, -2.403069, 0, 1, 0.7137255, 1,
-0.1983763, 2.06945, -0.328354, 0, 1, 0.7176471, 1,
-0.1922074, 1.941978, 1.130653, 0, 1, 0.7254902, 1,
-0.1908486, -0.8893856, -3.844904, 0, 1, 0.7294118, 1,
-0.1861189, 0.993991, -0.3098333, 0, 1, 0.7372549, 1,
-0.18246, 0.9083047, 0.9307629, 0, 1, 0.7411765, 1,
-0.1764244, 0.5994667, 0.1124972, 0, 1, 0.7490196, 1,
-0.1762399, -0.4847141, -3.958706, 0, 1, 0.7529412, 1,
-0.1734382, -0.5445551, -2.243421, 0, 1, 0.7607843, 1,
-0.1681966, 0.8149306, 1.081157, 0, 1, 0.7647059, 1,
-0.1649761, -0.3899275, -1.787122, 0, 1, 0.772549, 1,
-0.1622776, 0.8488548, 0.4566604, 0, 1, 0.7764706, 1,
-0.1567872, -1.680142, -2.527057, 0, 1, 0.7843137, 1,
-0.1557416, 1.926637, 0.4555047, 0, 1, 0.7882353, 1,
-0.1499423, 1.018381, -1.522035, 0, 1, 0.7960784, 1,
-0.1491531, 0.769635, 0.9162172, 0, 1, 0.8039216, 1,
-0.1482466, 0.7619354, 0.5609119, 0, 1, 0.8078431, 1,
-0.1439586, -0.6008704, -2.743182, 0, 1, 0.8156863, 1,
-0.1398556, -0.2169458, -2.752623, 0, 1, 0.8196079, 1,
-0.1357182, -0.7710947, -3.476088, 0, 1, 0.827451, 1,
-0.1315182, 0.4245417, -0.5375455, 0, 1, 0.8313726, 1,
-0.1286567, -0.5981515, -2.77337, 0, 1, 0.8392157, 1,
-0.1260877, -0.4992486, -2.742455, 0, 1, 0.8431373, 1,
-0.1220772, -0.7766034, -3.965229, 0, 1, 0.8509804, 1,
-0.1219376, -0.496192, -2.336541, 0, 1, 0.854902, 1,
-0.1205016, 0.3518842, -0.8285233, 0, 1, 0.8627451, 1,
-0.120375, -0.5627834, -2.420517, 0, 1, 0.8666667, 1,
-0.1186975, -0.4871244, -4.083939, 0, 1, 0.8745098, 1,
-0.1168709, 0.6963056, -0.08604041, 0, 1, 0.8784314, 1,
-0.1141707, -0.4379888, -2.853513, 0, 1, 0.8862745, 1,
-0.1070853, -0.2923328, -3.243022, 0, 1, 0.8901961, 1,
-0.1045183, 0.4116224, -1.264546, 0, 1, 0.8980392, 1,
-0.1026874, 1.301559, 1.004425, 0, 1, 0.9058824, 1,
-0.1019482, 0.6896021, -1.898142, 0, 1, 0.9098039, 1,
-0.09896872, -1.193835, -2.294379, 0, 1, 0.9176471, 1,
-0.09782148, -1.310198, -3.806925, 0, 1, 0.9215686, 1,
-0.09364868, -0.5566016, -3.403779, 0, 1, 0.9294118, 1,
-0.09092534, -2.280565, -1.714689, 0, 1, 0.9333333, 1,
-0.09047649, 1.140855, -1.8074, 0, 1, 0.9411765, 1,
-0.08963357, 0.8394415, 0.1722087, 0, 1, 0.945098, 1,
-0.08762594, 1.837868, -0.8494626, 0, 1, 0.9529412, 1,
-0.08523289, 0.5026689, -3.766364, 0, 1, 0.9568627, 1,
-0.08257634, 2.298818, -1.128044, 0, 1, 0.9647059, 1,
-0.08252399, 0.9167774, 1.881749, 0, 1, 0.9686275, 1,
-0.07940716, 0.2441647, -0.9644523, 0, 1, 0.9764706, 1,
-0.07649448, 0.01412533, -0.8483803, 0, 1, 0.9803922, 1,
-0.0760829, -1.425195, -2.430995, 0, 1, 0.9882353, 1,
-0.06634633, -0.2611414, -2.653488, 0, 1, 0.9921569, 1,
-0.06251312, 0.08128522, -2.785859, 0, 1, 1, 1,
-0.0605489, 0.3696055, -0.6820876, 0, 0.9921569, 1, 1,
-0.06039902, -0.4310984, -2.541087, 0, 0.9882353, 1, 1,
-0.05800282, 0.8252175, -0.9126814, 0, 0.9803922, 1, 1,
-0.0552691, -0.552784, -1.802322, 0, 0.9764706, 1, 1,
-0.05489027, -0.3615014, -3.618811, 0, 0.9686275, 1, 1,
-0.05459194, -1.563524, -3.571949, 0, 0.9647059, 1, 1,
-0.05220681, 0.1194217, 0.6707752, 0, 0.9568627, 1, 1,
-0.04926213, -1.00504, -3.371709, 0, 0.9529412, 1, 1,
-0.0474261, 0.3683928, -0.1285539, 0, 0.945098, 1, 1,
-0.04421307, -1.479612, -2.54025, 0, 0.9411765, 1, 1,
-0.04351053, -0.7833946, -2.94338, 0, 0.9333333, 1, 1,
-0.04146013, 0.1072232, 0.3515907, 0, 0.9294118, 1, 1,
-0.03987436, 1.706138, -0.5622437, 0, 0.9215686, 1, 1,
-0.03868162, 1.273821, -0.8801443, 0, 0.9176471, 1, 1,
-0.03732674, -0.4374256, -3.736228, 0, 0.9098039, 1, 1,
-0.03702879, 1.231426, -1.349971, 0, 0.9058824, 1, 1,
-0.0333417, -2.107289, -4.163926, 0, 0.8980392, 1, 1,
-0.03128496, -0.9108101, -4.428252, 0, 0.8901961, 1, 1,
-0.02610347, 0.8040393, 0.5772119, 0, 0.8862745, 1, 1,
-0.02327523, 0.1819416, 0.1746988, 0, 0.8784314, 1, 1,
-0.02137598, -1.118494, -3.601562, 0, 0.8745098, 1, 1,
-0.02000193, -0.6366127, -3.243089, 0, 0.8666667, 1, 1,
-0.01977331, -0.7039543, -2.598071, 0, 0.8627451, 1, 1,
-0.01436953, 1.533631, 1.619921, 0, 0.854902, 1, 1,
-0.01433043, -0.1760647, -3.609287, 0, 0.8509804, 1, 1,
-0.01259737, 0.3675744, -1.437892, 0, 0.8431373, 1, 1,
-0.005240249, 0.4500506, 0.8551819, 0, 0.8392157, 1, 1,
-0.004294834, -0.2769351, -3.096893, 0, 0.8313726, 1, 1,
-0.002946374, 1.245075, 0.3901154, 0, 0.827451, 1, 1,
-0.001555293, 0.7473392, 0.4258626, 0, 0.8196079, 1, 1,
-0.0007690624, -0.3490212, -2.593244, 0, 0.8156863, 1, 1,
0.00422504, -1.693389, 2.785614, 0, 0.8078431, 1, 1,
0.007404938, -1.038633, 3.045786, 0, 0.8039216, 1, 1,
0.01127603, 1.354753, -0.0461872, 0, 0.7960784, 1, 1,
0.0116036, 1.981696, 1.015054, 0, 0.7882353, 1, 1,
0.01499891, 0.1587745, 1.683643, 0, 0.7843137, 1, 1,
0.01848791, 0.7837431, 0.4528489, 0, 0.7764706, 1, 1,
0.01971001, -0.07092095, 3.858086, 0, 0.772549, 1, 1,
0.02089513, -0.5749043, 4.339122, 0, 0.7647059, 1, 1,
0.0265258, -1.267766, 1.195783, 0, 0.7607843, 1, 1,
0.02673725, -0.2630111, 3.297959, 0, 0.7529412, 1, 1,
0.02780572, -1.251372, 3.630002, 0, 0.7490196, 1, 1,
0.02889588, 0.4753238, 0.7628441, 0, 0.7411765, 1, 1,
0.03193785, 1.271399, -0.112201, 0, 0.7372549, 1, 1,
0.03381402, 1.414291, -0.3178778, 0, 0.7294118, 1, 1,
0.03640054, -0.2708088, 4.753299, 0, 0.7254902, 1, 1,
0.03655853, 0.4750175, -1.323824, 0, 0.7176471, 1, 1,
0.04093704, 0.4877311, 1.004718, 0, 0.7137255, 1, 1,
0.04251403, 1.209243, 1.05687, 0, 0.7058824, 1, 1,
0.04415707, -0.3626975, 2.96238, 0, 0.6980392, 1, 1,
0.04600559, 1.065218, -1.990281, 0, 0.6941177, 1, 1,
0.04621201, -0.2690605, 3.344343, 0, 0.6862745, 1, 1,
0.04821493, -0.4880781, 4.071108, 0, 0.682353, 1, 1,
0.04835592, -0.4513319, 2.883955, 0, 0.6745098, 1, 1,
0.05155117, -1.398936, 3.118833, 0, 0.6705883, 1, 1,
0.05175307, -0.755681, 4.374652, 0, 0.6627451, 1, 1,
0.05620036, -1.108526, 3.570356, 0, 0.6588235, 1, 1,
0.06049653, 0.08162279, -0.02355657, 0, 0.6509804, 1, 1,
0.06077517, 0.5334997, 1.042824, 0, 0.6470588, 1, 1,
0.06650087, -0.6643802, 3.514585, 0, 0.6392157, 1, 1,
0.06678491, 0.3860631, -0.2703651, 0, 0.6352941, 1, 1,
0.06743563, 0.9232254, 2.380926, 0, 0.627451, 1, 1,
0.07066882, -0.5089666, 3.757738, 0, 0.6235294, 1, 1,
0.07247072, -0.1159379, 2.788589, 0, 0.6156863, 1, 1,
0.07285805, -2.342555, 3.344357, 0, 0.6117647, 1, 1,
0.07641511, -0.09446677, 2.796758, 0, 0.6039216, 1, 1,
0.08255316, -0.6179749, 4.764733, 0, 0.5960785, 1, 1,
0.08388284, -1.104853, 3.290222, 0, 0.5921569, 1, 1,
0.08389013, -1.632213, 4.143248, 0, 0.5843138, 1, 1,
0.0930327, 0.8748049, -0.1478052, 0, 0.5803922, 1, 1,
0.09404031, 0.1905439, -0.04993705, 0, 0.572549, 1, 1,
0.09768641, -1.843179, 3.946434, 0, 0.5686275, 1, 1,
0.1006365, 0.07369255, -1.211467, 0, 0.5607843, 1, 1,
0.1038054, 0.1654961, 0.1093391, 0, 0.5568628, 1, 1,
0.1107675, 0.4510204, -0.03414208, 0, 0.5490196, 1, 1,
0.1108132, -0.08202016, 3.376094, 0, 0.5450981, 1, 1,
0.1126812, 0.1277894, 0.05217614, 0, 0.5372549, 1, 1,
0.1128184, 0.5467532, -0.01885571, 0, 0.5333334, 1, 1,
0.1130744, -2.842583, 0.5463616, 0, 0.5254902, 1, 1,
0.1150778, 1.629204, 0.6950535, 0, 0.5215687, 1, 1,
0.1188886, 1.093835, -1.118058, 0, 0.5137255, 1, 1,
0.1197607, 0.1520567, 1.70915, 0, 0.509804, 1, 1,
0.1212631, 0.272957, -0.04498041, 0, 0.5019608, 1, 1,
0.133424, -0.2596768, 3.474436, 0, 0.4941176, 1, 1,
0.1346435, 0.5193959, -1.283869, 0, 0.4901961, 1, 1,
0.1409708, -0.3523008, 3.011251, 0, 0.4823529, 1, 1,
0.1470943, 0.1184555, 0.988858, 0, 0.4784314, 1, 1,
0.1503273, -1.004555, 3.015378, 0, 0.4705882, 1, 1,
0.1525987, -0.1339369, 1.418273, 0, 0.4666667, 1, 1,
0.153914, -0.07593982, 1.212521, 0, 0.4588235, 1, 1,
0.155044, -1.183594, 3.442485, 0, 0.454902, 1, 1,
0.1568249, 0.7155505, -1.574694, 0, 0.4470588, 1, 1,
0.1607844, 0.4751197, -0.05064581, 0, 0.4431373, 1, 1,
0.1637871, -0.346456, 2.836391, 0, 0.4352941, 1, 1,
0.1654372, -1.509967, 2.105697, 0, 0.4313726, 1, 1,
0.1655915, -0.9210982, 2.242871, 0, 0.4235294, 1, 1,
0.167568, -0.2278192, 1.850349, 0, 0.4196078, 1, 1,
0.1675815, -0.2877846, 2.71352, 0, 0.4117647, 1, 1,
0.1746571, -1.195436, 1.323099, 0, 0.4078431, 1, 1,
0.1784326, 0.1968036, 1.463382, 0, 0.4, 1, 1,
0.1820245, -1.313671, 3.381072, 0, 0.3921569, 1, 1,
0.1831359, 0.2816612, 1.538134, 0, 0.3882353, 1, 1,
0.185053, -0.2537991, 2.59214, 0, 0.3803922, 1, 1,
0.1874085, 0.9355217, 0.07292886, 0, 0.3764706, 1, 1,
0.1911162, -0.6098005, 2.369939, 0, 0.3686275, 1, 1,
0.1911331, -0.8728375, 0.8424588, 0, 0.3647059, 1, 1,
0.1956635, -0.300242, 0.9491445, 0, 0.3568628, 1, 1,
0.210244, -1.272421, 5.576748, 0, 0.3529412, 1, 1,
0.2131844, 0.05022521, 3.039521, 0, 0.345098, 1, 1,
0.2171909, 0.4593039, -1.190565, 0, 0.3411765, 1, 1,
0.2258867, -0.06819274, 1.785607, 0, 0.3333333, 1, 1,
0.2262414, 0.7661458, 0.3697726, 0, 0.3294118, 1, 1,
0.2276679, 0.2797801, -0.1165337, 0, 0.3215686, 1, 1,
0.230888, 0.9853285, 1.221753, 0, 0.3176471, 1, 1,
0.2328559, -0.04247781, 1.65735, 0, 0.3098039, 1, 1,
0.2397844, 0.3200241, 1.100865, 0, 0.3058824, 1, 1,
0.246251, 0.5250369, 1.101272, 0, 0.2980392, 1, 1,
0.2463567, -0.18988, 2.912753, 0, 0.2901961, 1, 1,
0.2531889, -0.1561977, 3.026908, 0, 0.2862745, 1, 1,
0.2667539, 0.9172784, 1.533029, 0, 0.2784314, 1, 1,
0.2710325, 1.259821, -0.184627, 0, 0.2745098, 1, 1,
0.274417, 0.4476215, 1.687916, 0, 0.2666667, 1, 1,
0.2757384, -0.6701415, 2.894676, 0, 0.2627451, 1, 1,
0.2786514, -0.3104956, 3.170963, 0, 0.254902, 1, 1,
0.2802157, -0.6629898, 2.225793, 0, 0.2509804, 1, 1,
0.2842698, 1.032548, 0.7341413, 0, 0.2431373, 1, 1,
0.2873395, -0.1525814, 1.761374, 0, 0.2392157, 1, 1,
0.2897436, 0.3145889, 1.854029, 0, 0.2313726, 1, 1,
0.2923741, -0.3069718, 2.095405, 0, 0.227451, 1, 1,
0.2984677, -0.3997017, 2.53226, 0, 0.2196078, 1, 1,
0.3017829, -2.036366, 2.570488, 0, 0.2156863, 1, 1,
0.3042169, 0.8691106, 1.248841, 0, 0.2078431, 1, 1,
0.3054872, 1.473887, 1.177795, 0, 0.2039216, 1, 1,
0.3059418, 0.9682875, 0.3712604, 0, 0.1960784, 1, 1,
0.3068993, -1.308454, 3.861274, 0, 0.1882353, 1, 1,
0.3085124, -0.8584053, 2.241483, 0, 0.1843137, 1, 1,
0.3127884, 1.788032, 1.946569, 0, 0.1764706, 1, 1,
0.3140442, 0.5230733, 2.020918, 0, 0.172549, 1, 1,
0.3325826, -1.084502, 3.403312, 0, 0.1647059, 1, 1,
0.3327332, 0.1190734, -0.05560005, 0, 0.1607843, 1, 1,
0.3353228, -0.2230637, 2.671852, 0, 0.1529412, 1, 1,
0.3408356, -1.440339, 3.422206, 0, 0.1490196, 1, 1,
0.3471909, 0.9612213, 0.6464646, 0, 0.1411765, 1, 1,
0.3493842, -0.3136172, 1.858086, 0, 0.1372549, 1, 1,
0.353884, 1.189208, 0.39053, 0, 0.1294118, 1, 1,
0.3543743, -0.3050615, 0.8495785, 0, 0.1254902, 1, 1,
0.356378, 0.2393862, 1.021014, 0, 0.1176471, 1, 1,
0.3603691, 2.131311, 0.3312307, 0, 0.1137255, 1, 1,
0.3623703, 1.382115, -0.9490767, 0, 0.1058824, 1, 1,
0.3648055, 1.770191, 0.9265194, 0, 0.09803922, 1, 1,
0.3654431, -1.0762, 3.610019, 0, 0.09411765, 1, 1,
0.3771562, 0.02673979, 1.985876, 0, 0.08627451, 1, 1,
0.3797033, -0.8801944, 1.12613, 0, 0.08235294, 1, 1,
0.3803267, 0.2675332, 0.4507796, 0, 0.07450981, 1, 1,
0.3926842, -1.241999, 2.972474, 0, 0.07058824, 1, 1,
0.3937082, 2.672969, 1.387365, 0, 0.0627451, 1, 1,
0.3940656, 0.5086107, 0.5086133, 0, 0.05882353, 1, 1,
0.3955485, 0.0366968, 2.339187, 0, 0.05098039, 1, 1,
0.3964846, 0.4340887, 1.261131, 0, 0.04705882, 1, 1,
0.3966954, -0.5444323, 2.930314, 0, 0.03921569, 1, 1,
0.4040399, -0.723033, 2.870408, 0, 0.03529412, 1, 1,
0.406188, -0.7881668, 1.728222, 0, 0.02745098, 1, 1,
0.4080427, -1.072337, 1.691928, 0, 0.02352941, 1, 1,
0.4152565, -0.1678049, 1.567459, 0, 0.01568628, 1, 1,
0.4157202, 1.331705, 1.332025, 0, 0.01176471, 1, 1,
0.4163572, 1.645359, 0.7146389, 0, 0.003921569, 1, 1,
0.4185468, 0.9122193, 0.08456364, 0.003921569, 0, 1, 1,
0.4303989, -0.9445233, 1.039101, 0.007843138, 0, 1, 1,
0.4435601, -0.1992827, 3.238594, 0.01568628, 0, 1, 1,
0.45008, -1.554394, 4.072145, 0.01960784, 0, 1, 1,
0.4502177, 0.2277192, 1.55665, 0.02745098, 0, 1, 1,
0.4517787, 0.8065458, 1.227016, 0.03137255, 0, 1, 1,
0.4572689, 0.1357276, 1.041083, 0.03921569, 0, 1, 1,
0.459569, 0.3288596, 0.3958317, 0.04313726, 0, 1, 1,
0.4659713, -0.06727856, 2.099598, 0.05098039, 0, 1, 1,
0.4694394, 0.4540298, 0.02053174, 0.05490196, 0, 1, 1,
0.4802039, 0.8477789, -0.02785703, 0.0627451, 0, 1, 1,
0.4816709, -1.560623, 4.448607, 0.06666667, 0, 1, 1,
0.4823051, -1.727976, 3.234379, 0.07450981, 0, 1, 1,
0.4836977, -0.015374, 1.46555, 0.07843138, 0, 1, 1,
0.4883566, 0.8679506, 1.253865, 0.08627451, 0, 1, 1,
0.4903304, 1.357741, 0.5564334, 0.09019608, 0, 1, 1,
0.4927109, -1.615664, 2.45179, 0.09803922, 0, 1, 1,
0.4938218, -0.272307, 1.138933, 0.1058824, 0, 1, 1,
0.4960731, 0.1058724, 1.351898, 0.1098039, 0, 1, 1,
0.4983492, 2.397011, -1.328684, 0.1176471, 0, 1, 1,
0.5014117, -0.6489345, 2.451366, 0.1215686, 0, 1, 1,
0.504867, -0.09144392, 1.897887, 0.1294118, 0, 1, 1,
0.5083269, 1.071439, -0.329677, 0.1333333, 0, 1, 1,
0.5140412, 0.6216863, -1.388637, 0.1411765, 0, 1, 1,
0.5167828, 0.2881546, -0.09308567, 0.145098, 0, 1, 1,
0.5167863, -0.5273957, 3.147949, 0.1529412, 0, 1, 1,
0.5183266, 0.584936, 0.8909695, 0.1568628, 0, 1, 1,
0.5237689, 0.05756159, 0.1288408, 0.1647059, 0, 1, 1,
0.5275646, -1.016456, 3.631403, 0.1686275, 0, 1, 1,
0.5380461, -0.195322, 4.316265, 0.1764706, 0, 1, 1,
0.5397862, -0.3705178, 1.005443, 0.1803922, 0, 1, 1,
0.5398592, -1.393909, 3.649981, 0.1882353, 0, 1, 1,
0.5413164, 2.073028, 0.2097494, 0.1921569, 0, 1, 1,
0.5452572, 0.6472308, 1.594523, 0.2, 0, 1, 1,
0.5477511, 0.6890171, -0.1150872, 0.2078431, 0, 1, 1,
0.5509092, 1.914423, -0.3082899, 0.2117647, 0, 1, 1,
0.557942, 1.108312, 0.9758349, 0.2196078, 0, 1, 1,
0.5615767, 0.9829787, -0.9772764, 0.2235294, 0, 1, 1,
0.5672225, 0.1194977, 3.187021, 0.2313726, 0, 1, 1,
0.5711325, 2.805972, -0.3731843, 0.2352941, 0, 1, 1,
0.5751837, 0.5636539, 0.8320717, 0.2431373, 0, 1, 1,
0.5759044, 0.3382471, -0.9599114, 0.2470588, 0, 1, 1,
0.5759158, 1.570862, -1.089016, 0.254902, 0, 1, 1,
0.5781074, -0.8184096, 3.002189, 0.2588235, 0, 1, 1,
0.5808471, 1.20112, 1.325999, 0.2666667, 0, 1, 1,
0.5863338, 0.3563041, -0.0115983, 0.2705882, 0, 1, 1,
0.5867286, 0.002475521, -0.4704279, 0.2784314, 0, 1, 1,
0.594122, -0.07430253, 3.225434, 0.282353, 0, 1, 1,
0.595136, 0.5416718, 1.771034, 0.2901961, 0, 1, 1,
0.5995792, -0.1983598, 1.253756, 0.2941177, 0, 1, 1,
0.6022577, 0.09094691, 1.837249, 0.3019608, 0, 1, 1,
0.6023706, 1.476333, 2.583889, 0.3098039, 0, 1, 1,
0.6108907, 0.2837854, 1.351036, 0.3137255, 0, 1, 1,
0.6109717, -0.2336267, 3.582226, 0.3215686, 0, 1, 1,
0.6117203, -0.3169862, 3.602898, 0.3254902, 0, 1, 1,
0.6133085, 0.7378157, 1.345447, 0.3333333, 0, 1, 1,
0.6142617, 0.9229456, 1.927528, 0.3372549, 0, 1, 1,
0.6174439, 0.7430857, -0.1872481, 0.345098, 0, 1, 1,
0.6192599, -0.7428933, 2.576261, 0.3490196, 0, 1, 1,
0.6284043, 0.7843008, 0.2814891, 0.3568628, 0, 1, 1,
0.6332337, 2.445637, 0.2889228, 0.3607843, 0, 1, 1,
0.6358463, 0.8736193, 0.8216773, 0.3686275, 0, 1, 1,
0.6374962, 0.2697921, 2.410487, 0.372549, 0, 1, 1,
0.6428332, -1.395788, 3.838551, 0.3803922, 0, 1, 1,
0.6448004, 0.8049524, 0.3419792, 0.3843137, 0, 1, 1,
0.6449279, -0.6803471, 2.329099, 0.3921569, 0, 1, 1,
0.6500396, 0.8599988, 0.6332343, 0.3960784, 0, 1, 1,
0.651737, 0.9822646, -1.36457, 0.4039216, 0, 1, 1,
0.6525202, -0.3794451, 1.549092, 0.4117647, 0, 1, 1,
0.6527203, -1.028318, 1.911071, 0.4156863, 0, 1, 1,
0.6540022, -0.9580882, 2.61614, 0.4235294, 0, 1, 1,
0.6545107, -0.584969, 2.283057, 0.427451, 0, 1, 1,
0.6564434, -0.2785284, 1.759703, 0.4352941, 0, 1, 1,
0.6594791, 0.3627648, 1.991793, 0.4392157, 0, 1, 1,
0.6603836, -0.2848317, 2.182671, 0.4470588, 0, 1, 1,
0.6617967, -1.487627, 2.300701, 0.4509804, 0, 1, 1,
0.6657875, -1.703964, 2.928563, 0.4588235, 0, 1, 1,
0.6674284, -0.8305241, 2.881804, 0.4627451, 0, 1, 1,
0.6679062, 0.3150518, 1.897038, 0.4705882, 0, 1, 1,
0.6679868, -0.8576761, 3.222824, 0.4745098, 0, 1, 1,
0.6745002, -0.0977106, 2.120532, 0.4823529, 0, 1, 1,
0.6770453, 1.140868, 0.3690408, 0.4862745, 0, 1, 1,
0.6780115, -0.7933517, 1.06874, 0.4941176, 0, 1, 1,
0.6792135, -1.005077, 3.240246, 0.5019608, 0, 1, 1,
0.6821449, -0.6543877, 4.379561, 0.5058824, 0, 1, 1,
0.6823642, -0.5440918, 2.256918, 0.5137255, 0, 1, 1,
0.6841654, 0.5796711, 0.7959418, 0.5176471, 0, 1, 1,
0.684806, 0.009719404, 3.038074, 0.5254902, 0, 1, 1,
0.6859763, -0.1712622, 1.65186, 0.5294118, 0, 1, 1,
0.6916772, 0.03371869, 2.187587, 0.5372549, 0, 1, 1,
0.6958308, -0.03157129, 2.853854, 0.5411765, 0, 1, 1,
0.7068951, -0.734008, 2.635453, 0.5490196, 0, 1, 1,
0.7130315, 0.9172783, 0.8337739, 0.5529412, 0, 1, 1,
0.7194083, -0.821923, 2.278351, 0.5607843, 0, 1, 1,
0.7200785, 0.446613, 2.55447, 0.5647059, 0, 1, 1,
0.721769, 0.1195427, 1.868931, 0.572549, 0, 1, 1,
0.7254944, 0.5798135, -1.191473, 0.5764706, 0, 1, 1,
0.7319451, 0.7083386, 1.560028, 0.5843138, 0, 1, 1,
0.7341564, 2.483738, -0.09545957, 0.5882353, 0, 1, 1,
0.744458, 2.59218, 1.095417, 0.5960785, 0, 1, 1,
0.7461526, 0.9188204, -0.9996017, 0.6039216, 0, 1, 1,
0.7615241, 0.9478021, -0.1106424, 0.6078432, 0, 1, 1,
0.7648491, 1.343705, 0.1340618, 0.6156863, 0, 1, 1,
0.7732949, -1.731051, 2.354081, 0.6196079, 0, 1, 1,
0.7735656, 2.134204, -1.191617, 0.627451, 0, 1, 1,
0.7737287, -0.07789403, 0.2409671, 0.6313726, 0, 1, 1,
0.7748669, 0.9347712, 1.580379, 0.6392157, 0, 1, 1,
0.7845691, 0.1134679, 0.8905167, 0.6431373, 0, 1, 1,
0.7911422, -1.648653, 1.91057, 0.6509804, 0, 1, 1,
0.7921383, 0.9027761, -0.1536209, 0.654902, 0, 1, 1,
0.7944359, 1.061957, 0.4338887, 0.6627451, 0, 1, 1,
0.7945566, 0.9533009, 1.457295, 0.6666667, 0, 1, 1,
0.7961118, -1.371087, 2.186219, 0.6745098, 0, 1, 1,
0.7980358, -0.8804978, 2.311929, 0.6784314, 0, 1, 1,
0.798483, 1.049673, 1.097947, 0.6862745, 0, 1, 1,
0.7992939, -0.7313612, 0.1583482, 0.6901961, 0, 1, 1,
0.8017278, -0.4836872, 1.899087, 0.6980392, 0, 1, 1,
0.8028781, -0.9894243, 4.777101, 0.7058824, 0, 1, 1,
0.8069088, 0.06463859, 2.55592, 0.7098039, 0, 1, 1,
0.8162277, 2.202022, 0.9175525, 0.7176471, 0, 1, 1,
0.8186166, 0.2682574, 1.309203, 0.7215686, 0, 1, 1,
0.8234225, -0.4755086, 3.105246, 0.7294118, 0, 1, 1,
0.8252426, 0.2731643, 0.2231264, 0.7333333, 0, 1, 1,
0.831227, -0.3755428, 2.723948, 0.7411765, 0, 1, 1,
0.84355, -1.02965, 0.7441594, 0.7450981, 0, 1, 1,
0.8441123, 0.3594406, 2.018905, 0.7529412, 0, 1, 1,
0.8505607, 0.4061419, 0.1526164, 0.7568628, 0, 1, 1,
0.8584358, 0.3881679, -0.5833595, 0.7647059, 0, 1, 1,
0.8702095, -1.360399, 2.07176, 0.7686275, 0, 1, 1,
0.8792738, -0.2489889, 2.313965, 0.7764706, 0, 1, 1,
0.8805611, 1.14457, 1.025294, 0.7803922, 0, 1, 1,
0.8822591, -0.9986887, 0.7872595, 0.7882353, 0, 1, 1,
0.8839198, -0.4096618, 0.4038874, 0.7921569, 0, 1, 1,
0.8855145, 0.7454723, 1.735829, 0.8, 0, 1, 1,
0.8901316, 0.2357762, 3.087321, 0.8078431, 0, 1, 1,
0.8910896, -0.1667065, 2.557215, 0.8117647, 0, 1, 1,
0.8956045, 0.1084745, 2.104667, 0.8196079, 0, 1, 1,
0.8976282, -0.9125542, 0.3666977, 0.8235294, 0, 1, 1,
0.9021528, -0.04738288, 2.169568, 0.8313726, 0, 1, 1,
0.9045669, 3.039872, -1.812017, 0.8352941, 0, 1, 1,
0.9048037, 0.5019212, 1.358284, 0.8431373, 0, 1, 1,
0.9111991, -0.9442507, 2.705189, 0.8470588, 0, 1, 1,
0.9131575, 0.2951164, 2.597392, 0.854902, 0, 1, 1,
0.9135767, 0.6104571, -0.30879, 0.8588235, 0, 1, 1,
0.9153967, 0.662367, 1.20595, 0.8666667, 0, 1, 1,
0.9154215, -0.7983385, 0.3737514, 0.8705882, 0, 1, 1,
0.9174466, -0.4558283, 2.004807, 0.8784314, 0, 1, 1,
0.9175898, -1.259344, 1.781582, 0.8823529, 0, 1, 1,
0.9194784, 0.7244265, 0.9258955, 0.8901961, 0, 1, 1,
0.9221446, -0.7812982, 2.006207, 0.8941177, 0, 1, 1,
0.9312786, 0.9138759, -0.2358171, 0.9019608, 0, 1, 1,
0.9338581, -0.3546446, 1.498672, 0.9098039, 0, 1, 1,
0.9439939, -0.3947355, 2.507696, 0.9137255, 0, 1, 1,
0.9449427, -1.241024, 1.807403, 0.9215686, 0, 1, 1,
0.9465424, -0.5969567, 1.780251, 0.9254902, 0, 1, 1,
0.9508064, -0.3187928, 0.0212721, 0.9333333, 0, 1, 1,
0.9546064, -1.722291, 1.483159, 0.9372549, 0, 1, 1,
0.9548854, 0.4926626, 2.05305, 0.945098, 0, 1, 1,
0.9574348, -1.871707, 1.709794, 0.9490196, 0, 1, 1,
0.9584645, 0.589108, 0.5452968, 0.9568627, 0, 1, 1,
0.9610383, 0.8026661, 1.367155, 0.9607843, 0, 1, 1,
0.9628412, 0.3418038, 0.5229396, 0.9686275, 0, 1, 1,
0.9667593, 0.1062204, 2.790655, 0.972549, 0, 1, 1,
0.9701051, -1.148552, 3.340203, 0.9803922, 0, 1, 1,
0.9743367, 0.384701, -0.1825651, 0.9843137, 0, 1, 1,
0.9825411, -0.4344639, 2.299906, 0.9921569, 0, 1, 1,
0.9827586, -0.2454001, 1.02523, 0.9960784, 0, 1, 1,
0.9854302, -1.639465, 2.45526, 1, 0, 0.9960784, 1,
0.9881105, -0.4677364, 2.806818, 1, 0, 0.9882353, 1,
0.9890624, 1.277344, 0.7648524, 1, 0, 0.9843137, 1,
0.9914381, -0.2410127, 3.708885, 1, 0, 0.9764706, 1,
0.9925213, 0.3434174, 2.645545, 1, 0, 0.972549, 1,
0.9942979, -0.4243044, 1.733047, 1, 0, 0.9647059, 1,
0.9957095, -0.6062216, 0.871069, 1, 0, 0.9607843, 1,
0.9987853, 0.3515729, 1.057034, 1, 0, 0.9529412, 1,
1.00064, -0.5529601, 3.34883, 1, 0, 0.9490196, 1,
1.002338, 0.03550097, 0.5860437, 1, 0, 0.9411765, 1,
1.003664, -1.509044, 1.869725, 1, 0, 0.9372549, 1,
1.007335, 1.059173, 1.282965, 1, 0, 0.9294118, 1,
1.009222, -0.6830564, 1.450909, 1, 0, 0.9254902, 1,
1.014349, -0.5407915, 2.79994, 1, 0, 0.9176471, 1,
1.014771, -0.06250379, 2.258593, 1, 0, 0.9137255, 1,
1.016526, -0.3284253, 1.797882, 1, 0, 0.9058824, 1,
1.018657, -0.6491091, 1.089749, 1, 0, 0.9019608, 1,
1.023986, 0.7241628, 1.753325, 1, 0, 0.8941177, 1,
1.026993, -0.9614114, 1.109199, 1, 0, 0.8862745, 1,
1.029193, 0.2072609, 3.256842, 1, 0, 0.8823529, 1,
1.029391, -0.1204558, 1.817165, 1, 0, 0.8745098, 1,
1.035992, 1.256436, -0.6833579, 1, 0, 0.8705882, 1,
1.040809, -2.753662, 3.965328, 1, 0, 0.8627451, 1,
1.044054, -0.9807808, 4.456008, 1, 0, 0.8588235, 1,
1.044102, -2.960314, 2.525992, 1, 0, 0.8509804, 1,
1.08682, 1.331317, 0.5643811, 1, 0, 0.8470588, 1,
1.086861, -1.517305, 3.82049, 1, 0, 0.8392157, 1,
1.09014, -1.45339, 3.353043, 1, 0, 0.8352941, 1,
1.096592, 0.8591856, 1.570446, 1, 0, 0.827451, 1,
1.099956, 1.103734, 1.758758, 1, 0, 0.8235294, 1,
1.100925, -0.6137133, 2.388216, 1, 0, 0.8156863, 1,
1.103649, 0.388972, 1.153027, 1, 0, 0.8117647, 1,
1.106754, 0.6024421, 0.8258929, 1, 0, 0.8039216, 1,
1.117915, 0.6623643, 2.220966, 1, 0, 0.7960784, 1,
1.118618, 0.06794592, 2.437118, 1, 0, 0.7921569, 1,
1.125724, -0.7483858, 3.877846, 1, 0, 0.7843137, 1,
1.128516, -0.7928433, 1.738649, 1, 0, 0.7803922, 1,
1.129859, -1.129671, 3.441414, 1, 0, 0.772549, 1,
1.134038, 0.9862131, 0.6323365, 1, 0, 0.7686275, 1,
1.134262, 0.432554, 0.4841597, 1, 0, 0.7607843, 1,
1.137727, 0.191462, -1.085342, 1, 0, 0.7568628, 1,
1.13826, -2.014795, 1.899498, 1, 0, 0.7490196, 1,
1.14844, -0.5254491, 1.040565, 1, 0, 0.7450981, 1,
1.151106, 1.375773, 0.9537022, 1, 0, 0.7372549, 1,
1.161487, -0.02529401, 0.8085665, 1, 0, 0.7333333, 1,
1.169272, -2.308918, 4.229353, 1, 0, 0.7254902, 1,
1.179939, 0.7967332, 0.1941416, 1, 0, 0.7215686, 1,
1.180195, 0.5748157, -1.26774, 1, 0, 0.7137255, 1,
1.184481, 1.020996, 2.416134, 1, 0, 0.7098039, 1,
1.194165, -0.720788, 0.9353164, 1, 0, 0.7019608, 1,
1.194832, 0.8700516, 0.9425287, 1, 0, 0.6941177, 1,
1.197828, -0.9170505, 0.8916356, 1, 0, 0.6901961, 1,
1.206435, 0.3577555, 2.815405, 1, 0, 0.682353, 1,
1.210287, -2.210768, 2.962942, 1, 0, 0.6784314, 1,
1.216087, 0.4822463, 1.26729, 1, 0, 0.6705883, 1,
1.222807, 0.9341215, 2.390645, 1, 0, 0.6666667, 1,
1.227826, 0.5223258, 2.510976, 1, 0, 0.6588235, 1,
1.23506, 0.1883928, 1.393053, 1, 0, 0.654902, 1,
1.238437, -1.181374, 2.862513, 1, 0, 0.6470588, 1,
1.246353, 0.755552, -1.451261, 1, 0, 0.6431373, 1,
1.252446, 0.8300906, 0.1249359, 1, 0, 0.6352941, 1,
1.259767, 0.8999859, -1.485917, 1, 0, 0.6313726, 1,
1.261066, 0.0585997, 1.088885, 1, 0, 0.6235294, 1,
1.270269, 0.4021233, 2.161288, 1, 0, 0.6196079, 1,
1.271214, -1.533705, 3.124798, 1, 0, 0.6117647, 1,
1.279197, 1.234088, 1.568856, 1, 0, 0.6078432, 1,
1.284143, 0.9385062, 1.835203, 1, 0, 0.6, 1,
1.285397, -1.424388, 1.294091, 1, 0, 0.5921569, 1,
1.285607, 1.064976, -0.2319542, 1, 0, 0.5882353, 1,
1.287328, 1.110529, 1.951967, 1, 0, 0.5803922, 1,
1.288688, 1.280323, 1.817611, 1, 0, 0.5764706, 1,
1.292307, 0.8959593, 0.8562891, 1, 0, 0.5686275, 1,
1.298773, -1.433155, 1.354843, 1, 0, 0.5647059, 1,
1.308589, -3.420306, 2.004038, 1, 0, 0.5568628, 1,
1.308917, 2.132619, 0.5699457, 1, 0, 0.5529412, 1,
1.310472, -1.166388, 2.900345, 1, 0, 0.5450981, 1,
1.313176, 0.816138, -0.2247034, 1, 0, 0.5411765, 1,
1.321351, -0.5053108, 2.321916, 1, 0, 0.5333334, 1,
1.341038, -0.8377377, 2.315451, 1, 0, 0.5294118, 1,
1.363636, 1.244596, 2.504028, 1, 0, 0.5215687, 1,
1.372466, -0.2150742, 2.39423, 1, 0, 0.5176471, 1,
1.374936, 0.06045011, 0.686892, 1, 0, 0.509804, 1,
1.382506, 1.662979, 0.8320995, 1, 0, 0.5058824, 1,
1.383058, 0.07079986, 2.410037, 1, 0, 0.4980392, 1,
1.39228, 0.3291909, 0.407899, 1, 0, 0.4901961, 1,
1.395967, 1.613352, 2.043864, 1, 0, 0.4862745, 1,
1.399915, -0.1134015, 3.039255, 1, 0, 0.4784314, 1,
1.411972, -3.174672, 2.666928, 1, 0, 0.4745098, 1,
1.417787, -2.038921, 2.972473, 1, 0, 0.4666667, 1,
1.422686, -1.762891, 2.140645, 1, 0, 0.4627451, 1,
1.428223, 0.5032129, 0.2495031, 1, 0, 0.454902, 1,
1.440119, 1.14455, 0.8198937, 1, 0, 0.4509804, 1,
1.455269, 0.03220949, 3.337679, 1, 0, 0.4431373, 1,
1.480358, 1.016086, -0.1832005, 1, 0, 0.4392157, 1,
1.491627, -1.632887, 2.235603, 1, 0, 0.4313726, 1,
1.493578, 0.0908493, 1.369837, 1, 0, 0.427451, 1,
1.501849, 0.103647, 1.991383, 1, 0, 0.4196078, 1,
1.505239, 2.582501, -0.1156447, 1, 0, 0.4156863, 1,
1.512421, -1.66875, 1.543895, 1, 0, 0.4078431, 1,
1.515617, 0.1947959, 2.717309, 1, 0, 0.4039216, 1,
1.519931, -1.677311, 4.693431, 1, 0, 0.3960784, 1,
1.523421, -1.022922, 2.590908, 1, 0, 0.3882353, 1,
1.534601, -0.3559766, 1.730511, 1, 0, 0.3843137, 1,
1.535206, -0.1534821, -0.1001703, 1, 0, 0.3764706, 1,
1.547463, -1.631602, 1.499133, 1, 0, 0.372549, 1,
1.547937, 0.1251031, 1.328296, 1, 0, 0.3647059, 1,
1.553596, -0.1344533, 1.510656, 1, 0, 0.3607843, 1,
1.553821, -0.2611338, 2.060709, 1, 0, 0.3529412, 1,
1.554747, -0.2057395, 1.926935, 1, 0, 0.3490196, 1,
1.560094, 0.167067, 0.8473324, 1, 0, 0.3411765, 1,
1.578873, -0.4703777, 2.070286, 1, 0, 0.3372549, 1,
1.591619, -0.7340367, 2.715822, 1, 0, 0.3294118, 1,
1.623677, -2.029319, 2.159909, 1, 0, 0.3254902, 1,
1.627694, 0.5337288, 0.399022, 1, 0, 0.3176471, 1,
1.630007, 0.2605298, 2.096838, 1, 0, 0.3137255, 1,
1.637144, -0.4365239, 2.606805, 1, 0, 0.3058824, 1,
1.643201, 2.601442, 0.9325285, 1, 0, 0.2980392, 1,
1.670594, 0.656876, 0.1989295, 1, 0, 0.2941177, 1,
1.675166, -1.014038, 2.145099, 1, 0, 0.2862745, 1,
1.683158, 0.3343115, 2.173949, 1, 0, 0.282353, 1,
1.685035, 1.48988, 0.2338036, 1, 0, 0.2745098, 1,
1.685843, 1.013792, -0.6785849, 1, 0, 0.2705882, 1,
1.693369, 0.5854628, 0.6041895, 1, 0, 0.2627451, 1,
1.695005, -0.104042, 2.609602, 1, 0, 0.2588235, 1,
1.702983, 1.060098, -0.09533215, 1, 0, 0.2509804, 1,
1.723909, 0.9726186, 1.161433, 1, 0, 0.2470588, 1,
1.727042, -0.3804109, 0.8781364, 1, 0, 0.2392157, 1,
1.740069, -0.34707, 1.214384, 1, 0, 0.2352941, 1,
1.757776, -0.1365887, 3.089597, 1, 0, 0.227451, 1,
1.760973, -0.4873829, 3.229849, 1, 0, 0.2235294, 1,
1.761162, 0.1039085, 2.075275, 1, 0, 0.2156863, 1,
1.768566, -3.154571, 3.207059, 1, 0, 0.2117647, 1,
1.768934, 1.796698, 1.74991, 1, 0, 0.2039216, 1,
1.800264, 1.828087, -0.5710922, 1, 0, 0.1960784, 1,
1.805915, -0.5871937, 2.218363, 1, 0, 0.1921569, 1,
1.850943, 0.143627, 1.346944, 1, 0, 0.1843137, 1,
1.858728, 1.828297, 2.10327, 1, 0, 0.1803922, 1,
1.862347, 1.480412, 0.484495, 1, 0, 0.172549, 1,
1.877759, -0.2163046, 1.490241, 1, 0, 0.1686275, 1,
1.880098, 0.3109523, -0.0493292, 1, 0, 0.1607843, 1,
1.88028, 1.950583, 0.9853447, 1, 0, 0.1568628, 1,
1.898425, -0.4220681, 1.282763, 1, 0, 0.1490196, 1,
1.906248, 1.393086, 0.2206068, 1, 0, 0.145098, 1,
1.917849, 1.484994, 0.3197739, 1, 0, 0.1372549, 1,
1.926348, -1.30236, 2.663713, 1, 0, 0.1333333, 1,
1.942252, 0.5959229, 0.7211583, 1, 0, 0.1254902, 1,
1.947841, 0.01940737, -0.400171, 1, 0, 0.1215686, 1,
1.958811, -0.3062426, 0.744073, 1, 0, 0.1137255, 1,
1.976544, 0.2353095, -0.24362, 1, 0, 0.1098039, 1,
2.00632, -0.0005725782, 1.789458, 1, 0, 0.1019608, 1,
2.04661, 1.755932, 1.870235, 1, 0, 0.09411765, 1,
2.081398, 0.6864758, 1.550657, 1, 0, 0.09019608, 1,
2.160745, 1.701797, 0.5529047, 1, 0, 0.08235294, 1,
2.308447, -0.5749021, 3.825454, 1, 0, 0.07843138, 1,
2.313602, -1.083441, 3.716716, 1, 0, 0.07058824, 1,
2.327085, -1.516936, 5.464621, 1, 0, 0.06666667, 1,
2.421388, -0.5600903, 1.734084, 1, 0, 0.05882353, 1,
2.444159, -1.10667, 1.478362, 1, 0, 0.05490196, 1,
2.448856, 0.02055703, 1.020877, 1, 0, 0.04705882, 1,
2.456262, 1.908831, 2.1895, 1, 0, 0.04313726, 1,
2.512235, 1.083806, 0.8840662, 1, 0, 0.03529412, 1,
2.67256, 1.483571, 0.2986089, 1, 0, 0.03137255, 1,
2.680108, -0.7395414, 2.088811, 1, 0, 0.02352941, 1,
2.768808, 0.2111208, 1.838992, 1, 0, 0.01960784, 1,
2.775872, -0.9941538, 2.171758, 1, 0, 0.01176471, 1,
2.817929, 0.129626, 1.638995, 1, 0, 0.007843138, 1
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
-0.3291463, -4.515306, -7.122905, 0, -0.5, 0.5, 0.5,
-0.3291463, -4.515306, -7.122905, 1, -0.5, 0.5, 0.5,
-0.3291463, -4.515306, -7.122905, 1, 1.5, 0.5, 0.5,
-0.3291463, -4.515306, -7.122905, 0, 1.5, 0.5, 0.5
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
-4.543079, -0.190217, -7.122905, 0, -0.5, 0.5, 0.5,
-4.543079, -0.190217, -7.122905, 1, -0.5, 0.5, 0.5,
-4.543079, -0.190217, -7.122905, 1, 1.5, 0.5, 0.5,
-4.543079, -0.190217, -7.122905, 0, 1.5, 0.5, 0.5
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
-4.543079, -4.515306, 0.1472259, 0, -0.5, 0.5, 0.5,
-4.543079, -4.515306, 0.1472259, 1, -0.5, 0.5, 0.5,
-4.543079, -4.515306, 0.1472259, 1, 1.5, 0.5, 0.5,
-4.543079, -4.515306, 0.1472259, 0, 1.5, 0.5, 0.5
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
-3, -3.517208, -5.445182,
2, -3.517208, -5.445182,
-3, -3.517208, -5.445182,
-3, -3.683558, -5.724803,
-2, -3.517208, -5.445182,
-2, -3.683558, -5.724803,
-1, -3.517208, -5.445182,
-1, -3.683558, -5.724803,
0, -3.517208, -5.445182,
0, -3.683558, -5.724803,
1, -3.517208, -5.445182,
1, -3.683558, -5.724803,
2, -3.517208, -5.445182,
2, -3.683558, -5.724803
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
-3, -4.016257, -6.284044, 0, -0.5, 0.5, 0.5,
-3, -4.016257, -6.284044, 1, -0.5, 0.5, 0.5,
-3, -4.016257, -6.284044, 1, 1.5, 0.5, 0.5,
-3, -4.016257, -6.284044, 0, 1.5, 0.5, 0.5,
-2, -4.016257, -6.284044, 0, -0.5, 0.5, 0.5,
-2, -4.016257, -6.284044, 1, -0.5, 0.5, 0.5,
-2, -4.016257, -6.284044, 1, 1.5, 0.5, 0.5,
-2, -4.016257, -6.284044, 0, 1.5, 0.5, 0.5,
-1, -4.016257, -6.284044, 0, -0.5, 0.5, 0.5,
-1, -4.016257, -6.284044, 1, -0.5, 0.5, 0.5,
-1, -4.016257, -6.284044, 1, 1.5, 0.5, 0.5,
-1, -4.016257, -6.284044, 0, 1.5, 0.5, 0.5,
0, -4.016257, -6.284044, 0, -0.5, 0.5, 0.5,
0, -4.016257, -6.284044, 1, -0.5, 0.5, 0.5,
0, -4.016257, -6.284044, 1, 1.5, 0.5, 0.5,
0, -4.016257, -6.284044, 0, 1.5, 0.5, 0.5,
1, -4.016257, -6.284044, 0, -0.5, 0.5, 0.5,
1, -4.016257, -6.284044, 1, -0.5, 0.5, 0.5,
1, -4.016257, -6.284044, 1, 1.5, 0.5, 0.5,
1, -4.016257, -6.284044, 0, 1.5, 0.5, 0.5,
2, -4.016257, -6.284044, 0, -0.5, 0.5, 0.5,
2, -4.016257, -6.284044, 1, -0.5, 0.5, 0.5,
2, -4.016257, -6.284044, 1, 1.5, 0.5, 0.5,
2, -4.016257, -6.284044, 0, 1.5, 0.5, 0.5
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
-3.570633, -3, -5.445182,
-3.570633, 3, -5.445182,
-3.570633, -3, -5.445182,
-3.732708, -3, -5.724803,
-3.570633, -2, -5.445182,
-3.732708, -2, -5.724803,
-3.570633, -1, -5.445182,
-3.732708, -1, -5.724803,
-3.570633, 0, -5.445182,
-3.732708, 0, -5.724803,
-3.570633, 1, -5.445182,
-3.732708, 1, -5.724803,
-3.570633, 2, -5.445182,
-3.732708, 2, -5.724803,
-3.570633, 3, -5.445182,
-3.732708, 3, -5.724803
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
-4.056856, -3, -6.284044, 0, -0.5, 0.5, 0.5,
-4.056856, -3, -6.284044, 1, -0.5, 0.5, 0.5,
-4.056856, -3, -6.284044, 1, 1.5, 0.5, 0.5,
-4.056856, -3, -6.284044, 0, 1.5, 0.5, 0.5,
-4.056856, -2, -6.284044, 0, -0.5, 0.5, 0.5,
-4.056856, -2, -6.284044, 1, -0.5, 0.5, 0.5,
-4.056856, -2, -6.284044, 1, 1.5, 0.5, 0.5,
-4.056856, -2, -6.284044, 0, 1.5, 0.5, 0.5,
-4.056856, -1, -6.284044, 0, -0.5, 0.5, 0.5,
-4.056856, -1, -6.284044, 1, -0.5, 0.5, 0.5,
-4.056856, -1, -6.284044, 1, 1.5, 0.5, 0.5,
-4.056856, -1, -6.284044, 0, 1.5, 0.5, 0.5,
-4.056856, 0, -6.284044, 0, -0.5, 0.5, 0.5,
-4.056856, 0, -6.284044, 1, -0.5, 0.5, 0.5,
-4.056856, 0, -6.284044, 1, 1.5, 0.5, 0.5,
-4.056856, 0, -6.284044, 0, 1.5, 0.5, 0.5,
-4.056856, 1, -6.284044, 0, -0.5, 0.5, 0.5,
-4.056856, 1, -6.284044, 1, -0.5, 0.5, 0.5,
-4.056856, 1, -6.284044, 1, 1.5, 0.5, 0.5,
-4.056856, 1, -6.284044, 0, 1.5, 0.5, 0.5,
-4.056856, 2, -6.284044, 0, -0.5, 0.5, 0.5,
-4.056856, 2, -6.284044, 1, -0.5, 0.5, 0.5,
-4.056856, 2, -6.284044, 1, 1.5, 0.5, 0.5,
-4.056856, 2, -6.284044, 0, 1.5, 0.5, 0.5,
-4.056856, 3, -6.284044, 0, -0.5, 0.5, 0.5,
-4.056856, 3, -6.284044, 1, -0.5, 0.5, 0.5,
-4.056856, 3, -6.284044, 1, 1.5, 0.5, 0.5,
-4.056856, 3, -6.284044, 0, 1.5, 0.5, 0.5
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
-3.570633, -3.517208, -4,
-3.570633, -3.517208, 4,
-3.570633, -3.517208, -4,
-3.732708, -3.683558, -4,
-3.570633, -3.517208, -2,
-3.732708, -3.683558, -2,
-3.570633, -3.517208, 0,
-3.732708, -3.683558, 0,
-3.570633, -3.517208, 2,
-3.732708, -3.683558, 2,
-3.570633, -3.517208, 4,
-3.732708, -3.683558, 4
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
-4.056856, -4.016257, -4, 0, -0.5, 0.5, 0.5,
-4.056856, -4.016257, -4, 1, -0.5, 0.5, 0.5,
-4.056856, -4.016257, -4, 1, 1.5, 0.5, 0.5,
-4.056856, -4.016257, -4, 0, 1.5, 0.5, 0.5,
-4.056856, -4.016257, -2, 0, -0.5, 0.5, 0.5,
-4.056856, -4.016257, -2, 1, -0.5, 0.5, 0.5,
-4.056856, -4.016257, -2, 1, 1.5, 0.5, 0.5,
-4.056856, -4.016257, -2, 0, 1.5, 0.5, 0.5,
-4.056856, -4.016257, 0, 0, -0.5, 0.5, 0.5,
-4.056856, -4.016257, 0, 1, -0.5, 0.5, 0.5,
-4.056856, -4.016257, 0, 1, 1.5, 0.5, 0.5,
-4.056856, -4.016257, 0, 0, 1.5, 0.5, 0.5,
-4.056856, -4.016257, 2, 0, -0.5, 0.5, 0.5,
-4.056856, -4.016257, 2, 1, -0.5, 0.5, 0.5,
-4.056856, -4.016257, 2, 1, 1.5, 0.5, 0.5,
-4.056856, -4.016257, 2, 0, 1.5, 0.5, 0.5,
-4.056856, -4.016257, 4, 0, -0.5, 0.5, 0.5,
-4.056856, -4.016257, 4, 1, -0.5, 0.5, 0.5,
-4.056856, -4.016257, 4, 1, 1.5, 0.5, 0.5,
-4.056856, -4.016257, 4, 0, 1.5, 0.5, 0.5
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
-3.570633, -3.517208, -5.445182,
-3.570633, 3.136774, -5.445182,
-3.570633, -3.517208, 5.739634,
-3.570633, 3.136774, 5.739634,
-3.570633, -3.517208, -5.445182,
-3.570633, -3.517208, 5.739634,
-3.570633, 3.136774, -5.445182,
-3.570633, 3.136774, 5.739634,
-3.570633, -3.517208, -5.445182,
2.912341, -3.517208, -5.445182,
-3.570633, -3.517208, 5.739634,
2.912341, -3.517208, 5.739634,
-3.570633, 3.136774, -5.445182,
2.912341, 3.136774, -5.445182,
-3.570633, 3.136774, 5.739634,
2.912341, 3.136774, 5.739634,
2.912341, -3.517208, -5.445182,
2.912341, 3.136774, -5.445182,
2.912341, -3.517208, 5.739634,
2.912341, 3.136774, 5.739634,
2.912341, -3.517208, -5.445182,
2.912341, -3.517208, 5.739634,
2.912341, 3.136774, -5.445182,
2.912341, 3.136774, 5.739634
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
var radius = 7.763948;
var distance = 34.54268;
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
mvMatrix.translate( 0.3291463, 0.190217, -0.1472259 );
mvMatrix.scale( 1.294858, 1.26158, 0.7505293 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.54268);
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
Mesotrione<-read.table("Mesotrione.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Mesotrione$V2
```

```
## Error in eval(expr, envir, enclos): object 'Mesotrione' not found
```

```r
y<-Mesotrione$V3
```

```
## Error in eval(expr, envir, enclos): object 'Mesotrione' not found
```

```r
z<-Mesotrione$V4
```

```
## Error in eval(expr, envir, enclos): object 'Mesotrione' not found
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
-3.476221, 0.1734553, -1.889328, 0, 0, 1, 1, 1,
-2.740114, 0.7615505, -0.5213364, 1, 0, 0, 1, 1,
-2.700869, -0.4917762, -3.393823, 1, 0, 0, 1, 1,
-2.662179, -2.352106, -1.862576, 1, 0, 0, 1, 1,
-2.501867, -0.2165623, -3.344948, 1, 0, 0, 1, 1,
-2.466364, -1.210598, -1.601897, 1, 0, 0, 1, 1,
-2.427471, 0.8120021, -2.969906, 0, 0, 0, 1, 1,
-2.421278, -1.286139, -2.081116, 0, 0, 0, 1, 1,
-2.399147, 1.089435, -1.7285, 0, 0, 0, 1, 1,
-2.386355, -0.9161387, -2.876858, 0, 0, 0, 1, 1,
-2.36553, 0.8193595, -1.119941, 0, 0, 0, 1, 1,
-2.333308, 0.1061172, -0.7761216, 0, 0, 0, 1, 1,
-2.3235, 1.475475, -3.045683, 0, 0, 0, 1, 1,
-2.316772, 1.441003, -0.8975583, 1, 1, 1, 1, 1,
-2.297364, 1.107777, -1.124194, 1, 1, 1, 1, 1,
-2.282499, 0.2019131, -2.575823, 1, 1, 1, 1, 1,
-2.221183, -1.2219, -3.609002, 1, 1, 1, 1, 1,
-2.206808, 2.604535, -0.0993862, 1, 1, 1, 1, 1,
-2.201047, -1.814204, -4.438923, 1, 1, 1, 1, 1,
-2.17211, -0.3010336, -1.58935, 1, 1, 1, 1, 1,
-2.159611, 0.3634651, -0.623809, 1, 1, 1, 1, 1,
-2.158289, 0.8021688, -2.553125, 1, 1, 1, 1, 1,
-2.144774, -0.5753691, -2.654928, 1, 1, 1, 1, 1,
-2.133661, 1.096243, -2.218249, 1, 1, 1, 1, 1,
-2.114204, 0.03793288, -0.1053085, 1, 1, 1, 1, 1,
-2.110316, 0.871003, -2.708686, 1, 1, 1, 1, 1,
-2.059731, -1.260394, -3.035513, 1, 1, 1, 1, 1,
-2.045739, 0.3412637, -1.773758, 1, 1, 1, 1, 1,
-1.986348, 0.2746215, -2.547218, 0, 0, 1, 1, 1,
-1.981818, -0.5366694, -2.479324, 1, 0, 0, 1, 1,
-1.970865, -0.9966858, -2.69639, 1, 0, 0, 1, 1,
-1.956913, 1.237486, -1.646361, 1, 0, 0, 1, 1,
-1.953745, 0.6176037, -0.3567799, 1, 0, 0, 1, 1,
-1.945766, -0.2906781, -0.1985419, 1, 0, 0, 1, 1,
-1.943651, 1.051581, 0.6950435, 0, 0, 0, 1, 1,
-1.89117, -0.2606338, -0.1197082, 0, 0, 0, 1, 1,
-1.810283, 0.7330711, -2.078037, 0, 0, 0, 1, 1,
-1.805793, -0.8805104, -1.115938, 0, 0, 0, 1, 1,
-1.797433, 0.534533, 0.05611608, 0, 0, 0, 1, 1,
-1.779274, -1.10812, -1.484599, 0, 0, 0, 1, 1,
-1.777528, -1.070096, -2.664738, 0, 0, 0, 1, 1,
-1.754107, -0.08521505, -1.163565, 1, 1, 1, 1, 1,
-1.749503, 0.918366, -2.374427, 1, 1, 1, 1, 1,
-1.747883, -1.75861, -1.949708, 1, 1, 1, 1, 1,
-1.744291, -0.1595485, -2.276405, 1, 1, 1, 1, 1,
-1.737548, 1.694008, -1.655295, 1, 1, 1, 1, 1,
-1.736524, 0.6606564, 0.3878982, 1, 1, 1, 1, 1,
-1.732039, -0.4877238, -2.687843, 1, 1, 1, 1, 1,
-1.725048, 0.2993061, -2.3102, 1, 1, 1, 1, 1,
-1.723556, -1.058901, -2.619593, 1, 1, 1, 1, 1,
-1.718755, -1.53663, -2.352055, 1, 1, 1, 1, 1,
-1.711412, 0.1232988, -1.080117, 1, 1, 1, 1, 1,
-1.709917, -0.9665771, -2.312623, 1, 1, 1, 1, 1,
-1.701685, 2.01196, -1.027344, 1, 1, 1, 1, 1,
-1.700211, -0.4665779, -2.557257, 1, 1, 1, 1, 1,
-1.674566, 1.275129, -0.9265846, 1, 1, 1, 1, 1,
-1.671245, -0.9755895, -2.391182, 0, 0, 1, 1, 1,
-1.667558, -0.8487548, -2.435892, 1, 0, 0, 1, 1,
-1.644678, -0.2169161, -2.248242, 1, 0, 0, 1, 1,
-1.642201, 0.6293196, -1.292084, 1, 0, 0, 1, 1,
-1.626038, -1.923416, -3.176076, 1, 0, 0, 1, 1,
-1.612451, 1.481841, -2.604393, 1, 0, 0, 1, 1,
-1.591635, -0.1646594, -2.007666, 0, 0, 0, 1, 1,
-1.587694, -1.838004, -3.91671, 0, 0, 0, 1, 1,
-1.575027, -2.521755, -2.650868, 0, 0, 0, 1, 1,
-1.572712, -0.5604298, -2.689549, 0, 0, 0, 1, 1,
-1.564841, 0.8903031, -2.485653, 0, 0, 0, 1, 1,
-1.561097, 0.3366962, -1.312617, 0, 0, 0, 1, 1,
-1.560392, 0.08231386, -2.207125, 0, 0, 0, 1, 1,
-1.542894, -0.9704962, -1.867296, 1, 1, 1, 1, 1,
-1.533654, -1.6471, -2.374757, 1, 1, 1, 1, 1,
-1.528187, -0.8539122, -1.157938, 1, 1, 1, 1, 1,
-1.527543, -0.9563212, -1.745455, 1, 1, 1, 1, 1,
-1.517651, 1.159937, -1.564456, 1, 1, 1, 1, 1,
-1.510007, -1.199269, -2.341451, 1, 1, 1, 1, 1,
-1.485929, 0.3225867, -2.640677, 1, 1, 1, 1, 1,
-1.45869, -1.549908, -3.201337, 1, 1, 1, 1, 1,
-1.458107, 0.8683267, -1.16959, 1, 1, 1, 1, 1,
-1.457387, -0.7706292, -0.6758829, 1, 1, 1, 1, 1,
-1.438825, 1.006235, -0.9152849, 1, 1, 1, 1, 1,
-1.43121, -1.191035, -2.634195, 1, 1, 1, 1, 1,
-1.430683, -1.382813, -2.646033, 1, 1, 1, 1, 1,
-1.428733, 1.011929, -1.253558, 1, 1, 1, 1, 1,
-1.418845, -1.201942, -3.260417, 1, 1, 1, 1, 1,
-1.408749, 0.7649898, -2.341636, 0, 0, 1, 1, 1,
-1.408331, -0.3281033, 0.8506007, 1, 0, 0, 1, 1,
-1.406732, -0.3235395, -1.620477, 1, 0, 0, 1, 1,
-1.404388, 0.599108, -2.043056, 1, 0, 0, 1, 1,
-1.401742, 0.4123546, -0.5453328, 1, 0, 0, 1, 1,
-1.400685, 1.312354, -2.907653, 1, 0, 0, 1, 1,
-1.379547, 1.200378, -1.236444, 0, 0, 0, 1, 1,
-1.355031, 1.269652, -1.240865, 0, 0, 0, 1, 1,
-1.333706, -0.9593545, -0.9962811, 0, 0, 0, 1, 1,
-1.332111, 0.7644503, -0.2151746, 0, 0, 0, 1, 1,
-1.331871, 2.097482, -1.916091, 0, 0, 0, 1, 1,
-1.329077, -0.139142, -1.230843, 0, 0, 0, 1, 1,
-1.326808, 0.06619143, -0.9819468, 0, 0, 0, 1, 1,
-1.323751, 0.7993604, -0.6125609, 1, 1, 1, 1, 1,
-1.318174, 0.3181194, -1.577094, 1, 1, 1, 1, 1,
-1.31481, 0.694439, -1.035531, 1, 1, 1, 1, 1,
-1.306566, 0.8711594, -1.394335, 1, 1, 1, 1, 1,
-1.306526, 1.142818, -1.287756, 1, 1, 1, 1, 1,
-1.305144, -0.2967215, -0.8284456, 1, 1, 1, 1, 1,
-1.305143, -1.730897, -2.515417, 1, 1, 1, 1, 1,
-1.305024, -0.4783829, -1.524043, 1, 1, 1, 1, 1,
-1.303904, 1.445374, -2.847251, 1, 1, 1, 1, 1,
-1.299085, 0.8018634, -1.974192, 1, 1, 1, 1, 1,
-1.295103, -1.084918, -2.817747, 1, 1, 1, 1, 1,
-1.29308, -1.381539, -2.425128, 1, 1, 1, 1, 1,
-1.285469, -0.7262068, -1.291951, 1, 1, 1, 1, 1,
-1.270508, 0.6986928, -0.9375754, 1, 1, 1, 1, 1,
-1.270133, 0.3348221, 0.2636878, 1, 1, 1, 1, 1,
-1.269846, -0.6346157, -1.190446, 0, 0, 1, 1, 1,
-1.250783, 0.9828188, -0.6338536, 1, 0, 0, 1, 1,
-1.249864, 2.06454, -0.001142213, 1, 0, 0, 1, 1,
-1.246955, 0.7413245, -0.03845163, 1, 0, 0, 1, 1,
-1.240246, -1.065585, -3.345987, 1, 0, 0, 1, 1,
-1.23542, -0.02614192, -0.4965984, 1, 0, 0, 1, 1,
-1.231256, -0.3758497, -2.094384, 0, 0, 0, 1, 1,
-1.228426, 0.4268375, -2.198463, 0, 0, 0, 1, 1,
-1.228369, -0.7287235, -2.987785, 0, 0, 0, 1, 1,
-1.210447, 0.2483322, -1.370907, 0, 0, 0, 1, 1,
-1.210313, 0.01033452, -1.651865, 0, 0, 0, 1, 1,
-1.203237, 0.11278, -0.6356068, 0, 0, 0, 1, 1,
-1.199608, 0.3398792, -1.235527, 0, 0, 0, 1, 1,
-1.197149, -0.2201717, -1.071801, 1, 1, 1, 1, 1,
-1.188564, 0.8931637, -1.639258, 1, 1, 1, 1, 1,
-1.177022, -0.3263733, -1.458904, 1, 1, 1, 1, 1,
-1.175189, -0.6298162, -0.8872958, 1, 1, 1, 1, 1,
-1.173752, 1.297249, -0.6186712, 1, 1, 1, 1, 1,
-1.164804, 0.939281, -0.233501, 1, 1, 1, 1, 1,
-1.162031, -0.0980858, -0.4035342, 1, 1, 1, 1, 1,
-1.161111, -0.1133807, -2.758318, 1, 1, 1, 1, 1,
-1.156085, -2.170597, -4.181489, 1, 1, 1, 1, 1,
-1.137572, -1.05739, -1.459596, 1, 1, 1, 1, 1,
-1.135234, 1.41573, 0.1639334, 1, 1, 1, 1, 1,
-1.134579, -1.381412, -2.988998, 1, 1, 1, 1, 1,
-1.132892, -0.120688, -1.606276, 1, 1, 1, 1, 1,
-1.131475, 0.01131292, -2.571386, 1, 1, 1, 1, 1,
-1.124879, 0.8303706, -0.3843712, 1, 1, 1, 1, 1,
-1.120743, -1.013875, -0.2685924, 0, 0, 1, 1, 1,
-1.118215, -2.42692, -1.738108, 1, 0, 0, 1, 1,
-1.117064, -0.1311447, -2.384019, 1, 0, 0, 1, 1,
-1.112647, 0.67182, -0.8665025, 1, 0, 0, 1, 1,
-1.109798, -1.36566, -1.8244, 1, 0, 0, 1, 1,
-1.090672, -1.162825, -0.9812797, 1, 0, 0, 1, 1,
-1.09047, 0.3115046, -3.0454, 0, 0, 0, 1, 1,
-1.087031, 0.1262856, -0.4186749, 0, 0, 0, 1, 1,
-1.060835, 0.2308831, -1.740341, 0, 0, 0, 1, 1,
-1.054889, 0.5691013, -2.008883, 0, 0, 0, 1, 1,
-1.053305, -0.01787112, -0.9882427, 0, 0, 0, 1, 1,
-1.051853, -2.076662, -3.240119, 0, 0, 0, 1, 1,
-1.044762, -0.2634943, -1.953301, 0, 0, 0, 1, 1,
-1.036493, 0.9531738, -1.210305, 1, 1, 1, 1, 1,
-1.035908, 0.5935805, -1.475138, 1, 1, 1, 1, 1,
-1.03448, 0.6722748, -2.077702, 1, 1, 1, 1, 1,
-1.033329, 1.336635, 0.4609352, 1, 1, 1, 1, 1,
-1.02884, -0.5992749, -0.5744085, 1, 1, 1, 1, 1,
-1.028542, 1.73671, -0.2348876, 1, 1, 1, 1, 1,
-1.028344, -0.9308862, -2.948043, 1, 1, 1, 1, 1,
-1.025157, -0.9998014, -0.3004151, 1, 1, 1, 1, 1,
-1.024607, -0.2576325, -2.309698, 1, 1, 1, 1, 1,
-1.023212, -0.1010493, -3.269259, 1, 1, 1, 1, 1,
-1.019778, 0.04423416, -1.480211, 1, 1, 1, 1, 1,
-1.014625, -0.0542457, -3.390786, 1, 1, 1, 1, 1,
-1.008722, 1.099514, -2.829236, 1, 1, 1, 1, 1,
-1.008211, -0.6735025, -1.506509, 1, 1, 1, 1, 1,
-1.005978, -0.5300112, -1.681515, 1, 1, 1, 1, 1,
-1.002693, 0.05981711, -0.8125571, 0, 0, 1, 1, 1,
-0.9981616, 0.5346229, -0.9246413, 1, 0, 0, 1, 1,
-0.9903699, 0.5242596, -1.10495, 1, 0, 0, 1, 1,
-0.9888954, -0.3816653, -3.365294, 1, 0, 0, 1, 1,
-0.9884776, 0.2309288, -1.966715, 1, 0, 0, 1, 1,
-0.9873734, -1.408894, -2.747843, 1, 0, 0, 1, 1,
-0.9864837, -0.8806902, -2.611193, 0, 0, 0, 1, 1,
-0.9844662, -1.079355, -1.166464, 0, 0, 0, 1, 1,
-0.9816327, 0.03069125, -0.2263217, 0, 0, 0, 1, 1,
-0.9808322, 0.8207883, -2.544187, 0, 0, 0, 1, 1,
-0.9791679, 0.2154348, 0.1836794, 0, 0, 0, 1, 1,
-0.9777625, 0.6999552, -2.464138, 0, 0, 0, 1, 1,
-0.9763048, 0.6145771, -0.1569348, 0, 0, 0, 1, 1,
-0.9723966, 0.2529122, -3.352524, 1, 1, 1, 1, 1,
-0.9695234, -0.1878548, -1.758692, 1, 1, 1, 1, 1,
-0.9652391, -0.7814538, -2.540795, 1, 1, 1, 1, 1,
-0.958392, -0.3963268, -1.25022, 1, 1, 1, 1, 1,
-0.957561, 0.1354685, -2.000933, 1, 1, 1, 1, 1,
-0.9568338, -0.4437445, -1.9085, 1, 1, 1, 1, 1,
-0.9555901, -1.510872, -2.87102, 1, 1, 1, 1, 1,
-0.9548022, 0.6665268, 0.322052, 1, 1, 1, 1, 1,
-0.9463125, 1.811737, -2.016237, 1, 1, 1, 1, 1,
-0.9372962, 0.3451067, -0.754528, 1, 1, 1, 1, 1,
-0.9349506, 0.7273679, 0.2106233, 1, 1, 1, 1, 1,
-0.9333857, 1.713091, -2.103838, 1, 1, 1, 1, 1,
-0.9332051, 1.567161, -0.07097891, 1, 1, 1, 1, 1,
-0.9287105, 0.1644623, -2.408264, 1, 1, 1, 1, 1,
-0.915943, 1.024495, -2.611324, 1, 1, 1, 1, 1,
-0.9145317, -2.592133, -1.571947, 0, 0, 1, 1, 1,
-0.912798, -0.123881, -2.032926, 1, 0, 0, 1, 1,
-0.9048543, 0.8082913, -1.444847, 1, 0, 0, 1, 1,
-0.9004409, 0.1832929, -1.47546, 1, 0, 0, 1, 1,
-0.8994721, -0.0224617, -3.480067, 1, 0, 0, 1, 1,
-0.8991094, -0.4722098, -2.71373, 1, 0, 0, 1, 1,
-0.8952047, 0.44296, -3.03244, 0, 0, 0, 1, 1,
-0.8885054, -0.3143831, -1.639684, 0, 0, 0, 1, 1,
-0.8878058, 0.3706888, -0.8588249, 0, 0, 0, 1, 1,
-0.8805373, 1.063197, -0.731843, 0, 0, 0, 1, 1,
-0.8798312, -0.2945484, 0.8036004, 0, 0, 0, 1, 1,
-0.8782406, -1.834656, -3.204857, 0, 0, 0, 1, 1,
-0.8742532, -0.8857335, -1.291919, 0, 0, 0, 1, 1,
-0.872049, 2.076972, 0.07747212, 1, 1, 1, 1, 1,
-0.8588657, -1.121457, -1.040849, 1, 1, 1, 1, 1,
-0.8540899, 0.7625314, -0.5144489, 1, 1, 1, 1, 1,
-0.8527499, -0.9515564, -2.945831, 1, 1, 1, 1, 1,
-0.8506509, -0.8318916, -2.737732, 1, 1, 1, 1, 1,
-0.8492254, -1.413822, -2.546709, 1, 1, 1, 1, 1,
-0.8414686, 2.615756, -0.2083222, 1, 1, 1, 1, 1,
-0.8352707, -1.045198, -4.257156, 1, 1, 1, 1, 1,
-0.83025, 0.8554864, -2.650357, 1, 1, 1, 1, 1,
-0.8259937, 1.996451, 0.5808864, 1, 1, 1, 1, 1,
-0.823577, -1.708915, -2.467747, 1, 1, 1, 1, 1,
-0.8204241, -0.2592455, -2.860717, 1, 1, 1, 1, 1,
-0.8176373, -1.695393, -3.116181, 1, 1, 1, 1, 1,
-0.8149868, -0.4285377, -2.477828, 1, 1, 1, 1, 1,
-0.8066608, -0.3281914, -1.832055, 1, 1, 1, 1, 1,
-0.8040761, -1.318566, -1.376633, 0, 0, 1, 1, 1,
-0.7990465, -0.5906165, -1.46502, 1, 0, 0, 1, 1,
-0.7985051, -0.9928553, -2.786426, 1, 0, 0, 1, 1,
-0.7981119, 0.1560327, -1.030233, 1, 0, 0, 1, 1,
-0.7928618, 1.666815, -1.765564, 1, 0, 0, 1, 1,
-0.7925401, -1.376799, -1.849827, 1, 0, 0, 1, 1,
-0.7890207, -0.5436183, -2.77463, 0, 0, 0, 1, 1,
-0.7863411, -0.3415546, -2.32792, 0, 0, 0, 1, 1,
-0.7843212, 0.1350056, -4.029321, 0, 0, 0, 1, 1,
-0.7803618, 0.149372, -0.4478048, 0, 0, 0, 1, 1,
-0.7775158, -0.4261349, -2.125844, 0, 0, 0, 1, 1,
-0.7768632, 0.3450926, -1.128291, 0, 0, 0, 1, 1,
-0.7758288, -1.30494, -2.350637, 0, 0, 0, 1, 1,
-0.7679685, -0.8183067, -2.109419, 1, 1, 1, 1, 1,
-0.7664978, 1.932949, 0.1613751, 1, 1, 1, 1, 1,
-0.7594816, 0.2575397, -0.414961, 1, 1, 1, 1, 1,
-0.7575697, -2.106323, -3.941944, 1, 1, 1, 1, 1,
-0.7557214, -3.209869, -3.196076, 1, 1, 1, 1, 1,
-0.7504978, -1.891674, -2.315252, 1, 1, 1, 1, 1,
-0.7466191, -0.7806067, -2.679882, 1, 1, 1, 1, 1,
-0.7397701, 0.7363319, -0.9943817, 1, 1, 1, 1, 1,
-0.7388485, -0.8179162, -1.883848, 1, 1, 1, 1, 1,
-0.737874, -0.2488095, -1.24708, 1, 1, 1, 1, 1,
-0.7368523, 0.1447503, -0.2261727, 1, 1, 1, 1, 1,
-0.7365942, -0.359073, -3.171253, 1, 1, 1, 1, 1,
-0.7330953, -0.5620491, -2.586987, 1, 1, 1, 1, 1,
-0.7294338, -0.1601474, -2.332668, 1, 1, 1, 1, 1,
-0.7276094, -0.346442, -1.105208, 1, 1, 1, 1, 1,
-0.7272155, 0.08499599, -2.749462, 0, 0, 1, 1, 1,
-0.7204348, -1.098305, -3.079397, 1, 0, 0, 1, 1,
-0.7163225, 0.4067077, -0.7525627, 1, 0, 0, 1, 1,
-0.7160276, 0.2801986, -0.1493618, 1, 0, 0, 1, 1,
-0.709828, -0.1390189, -2.911493, 1, 0, 0, 1, 1,
-0.6948357, 1.028792, -0.2232469, 1, 0, 0, 1, 1,
-0.6937682, 0.6091659, 0.2179469, 0, 0, 0, 1, 1,
-0.6896487, 0.1632701, -1.37119, 0, 0, 0, 1, 1,
-0.6882439, -0.6531244, -3.089276, 0, 0, 0, 1, 1,
-0.6851248, 0.7953992, -0.976644, 0, 0, 0, 1, 1,
-0.6823657, 2.308186, -0.5615545, 0, 0, 0, 1, 1,
-0.6786385, -0.3224308, -1.048256, 0, 0, 0, 1, 1,
-0.6735162, 1.015343, 0.1126102, 0, 0, 0, 1, 1,
-0.6687738, -0.2175549, -0.7911352, 1, 1, 1, 1, 1,
-0.6660183, 1.943353, 0.4160617, 1, 1, 1, 1, 1,
-0.6657096, -1.362737, -2.303533, 1, 1, 1, 1, 1,
-0.6588868, -1.383188, -1.58581, 1, 1, 1, 1, 1,
-0.6586668, -0.6814497, -2.308411, 1, 1, 1, 1, 1,
-0.6561561, -0.1192588, -1.236958, 1, 1, 1, 1, 1,
-0.6507617, 1.835586, -1.928774, 1, 1, 1, 1, 1,
-0.64114, -1.076887, -2.614823, 1, 1, 1, 1, 1,
-0.6399696, 0.9890712, -0.03225349, 1, 1, 1, 1, 1,
-0.6372558, 2.221912, -0.6774886, 1, 1, 1, 1, 1,
-0.6360613, 0.7780427, -1.481643, 1, 1, 1, 1, 1,
-0.6346945, 0.3283665, -2.159371, 1, 1, 1, 1, 1,
-0.6320066, 0.4244604, -2.354367, 1, 1, 1, 1, 1,
-0.6277921, 0.5803995, -0.295714, 1, 1, 1, 1, 1,
-0.6215922, 0.1971667, -1.55337, 1, 1, 1, 1, 1,
-0.618916, -0.3334087, -1.010238, 0, 0, 1, 1, 1,
-0.6119344, 0.5568242, -2.9737, 1, 0, 0, 1, 1,
-0.6090833, 1.06445, -1.615691, 1, 0, 0, 1, 1,
-0.6036959, 0.3764562, -1.575877, 1, 0, 0, 1, 1,
-0.6032395, -1.177034, -4.072137, 1, 0, 0, 1, 1,
-0.5995138, -1.261837, -1.938652, 1, 0, 0, 1, 1,
-0.5986276, -1.745415, -2.774153, 0, 0, 0, 1, 1,
-0.5970302, -1.218221, -4.174807, 0, 0, 0, 1, 1,
-0.5920566, -0.868602, -1.929252, 0, 0, 0, 1, 1,
-0.5873841, 0.2001547, -2.617344, 0, 0, 0, 1, 1,
-0.5854833, -1.163202, -2.540293, 0, 0, 0, 1, 1,
-0.5854437, 1.964499, 0.495788, 0, 0, 0, 1, 1,
-0.5823894, 0.004161404, -0.5817632, 0, 0, 0, 1, 1,
-0.5819595, -0.1902171, -1.950025, 1, 1, 1, 1, 1,
-0.5781637, 0.296754, 0.3131796, 1, 1, 1, 1, 1,
-0.5745897, -0.8232267, -2.580054, 1, 1, 1, 1, 1,
-0.5723794, 1.034771, -0.8947777, 1, 1, 1, 1, 1,
-0.5620815, -1.586538, -3.677041, 1, 1, 1, 1, 1,
-0.551578, -0.1097559, 0.2413944, 1, 1, 1, 1, 1,
-0.5498574, -0.958538, -3.385843, 1, 1, 1, 1, 1,
-0.5495726, -0.07032876, -1.441833, 1, 1, 1, 1, 1,
-0.5465665, 1.687309, 1.16928, 1, 1, 1, 1, 1,
-0.5458541, -0.4399848, -4.050528, 1, 1, 1, 1, 1,
-0.5411288, -0.415019, -2.507973, 1, 1, 1, 1, 1,
-0.5398349, 0.4680713, -0.4253179, 1, 1, 1, 1, 1,
-0.5347153, -1.718717, -2.523856, 1, 1, 1, 1, 1,
-0.531509, -0.3964478, -2.198489, 1, 1, 1, 1, 1,
-0.5243114, 0.7350199, 0.4412931, 1, 1, 1, 1, 1,
-0.5198499, 1.398612, -0.5756518, 0, 0, 1, 1, 1,
-0.5198004, -1.200225, -3.129432, 1, 0, 0, 1, 1,
-0.510641, -0.4117843, -0.8092377, 1, 0, 0, 1, 1,
-0.510164, 0.9650912, -0.2580965, 1, 0, 0, 1, 1,
-0.5094451, -1.073264, -2.37937, 1, 0, 0, 1, 1,
-0.5019781, -0.4517451, -2.419287, 1, 0, 0, 1, 1,
-0.4995226, 0.190219, -1.710057, 0, 0, 0, 1, 1,
-0.4993457, -2.04092, -2.666403, 0, 0, 0, 1, 1,
-0.4991147, 0.1177583, -0.793959, 0, 0, 0, 1, 1,
-0.4953288, 0.2943582, -2.291259, 0, 0, 0, 1, 1,
-0.4929754, -0.007944659, -0.9098156, 0, 0, 0, 1, 1,
-0.4915038, -0.4695219, -2.745624, 0, 0, 0, 1, 1,
-0.4864394, -0.978544, -4.642476, 0, 0, 0, 1, 1,
-0.4836449, 0.5709497, -1.138138, 1, 1, 1, 1, 1,
-0.4758515, -0.02865197, -2.944521, 1, 1, 1, 1, 1,
-0.4723155, 0.293657, -2.40842, 1, 1, 1, 1, 1,
-0.4710485, -2.524367, -1.74915, 1, 1, 1, 1, 1,
-0.4683774, 1.538916, -2.168119, 1, 1, 1, 1, 1,
-0.4674849, 0.1429505, -0.6759906, 1, 1, 1, 1, 1,
-0.4655254, 1.389405, 0.8976671, 1, 1, 1, 1, 1,
-0.4632357, -0.3890713, -1.517395, 1, 1, 1, 1, 1,
-0.4620248, 0.2451099, -0.3484375, 1, 1, 1, 1, 1,
-0.4612662, 0.2054571, -0.5251819, 1, 1, 1, 1, 1,
-0.4545217, 0.07342607, -1.695388, 1, 1, 1, 1, 1,
-0.4541966, -0.7361125, -2.403347, 1, 1, 1, 1, 1,
-0.4538283, -0.2029622, -1.862616, 1, 1, 1, 1, 1,
-0.4533735, 1.502075, 0.04206931, 1, 1, 1, 1, 1,
-0.4511973, -0.7504824, -1.933161, 1, 1, 1, 1, 1,
-0.4508894, 1.1566, -0.9675668, 0, 0, 1, 1, 1,
-0.4498504, -1.918444, -3.511983, 1, 0, 0, 1, 1,
-0.4444654, -1.033191, -2.537259, 1, 0, 0, 1, 1,
-0.4431372, -1.286925, -3.077576, 1, 0, 0, 1, 1,
-0.4421273, -1.62492, -2.212224, 1, 0, 0, 1, 1,
-0.4392446, -1.023135, -3.896827, 1, 0, 0, 1, 1,
-0.435932, 0.2867054, -1.078137, 0, 0, 0, 1, 1,
-0.4287032, 0.5411208, -1.122663, 0, 0, 0, 1, 1,
-0.4241185, 0.4264458, -1.170959, 0, 0, 0, 1, 1,
-0.4194286, 0.6800107, -0.3106695, 0, 0, 0, 1, 1,
-0.4185853, -0.4615619, -1.586216, 0, 0, 0, 1, 1,
-0.4169337, -0.8319008, -0.3030949, 0, 0, 0, 1, 1,
-0.4160201, -0.03084216, -2.268557, 0, 0, 0, 1, 1,
-0.4143705, 0.4984269, -1.509207, 1, 1, 1, 1, 1,
-0.4138201, 0.5618199, -1.471944, 1, 1, 1, 1, 1,
-0.4122154, 0.1541095, 0.06246863, 1, 1, 1, 1, 1,
-0.4056064, -1.170898, -4.342582, 1, 1, 1, 1, 1,
-0.4040876, 0.7034603, -1.32541, 1, 1, 1, 1, 1,
-0.4000846, 1.051452, -0.5479962, 1, 1, 1, 1, 1,
-0.3974852, 1.629253, -0.8345842, 1, 1, 1, 1, 1,
-0.3904051, 0.5717708, 0.7743309, 1, 1, 1, 1, 1,
-0.3889439, -2.702547, -3.923303, 1, 1, 1, 1, 1,
-0.3843757, -0.5707239, -3.145034, 1, 1, 1, 1, 1,
-0.3796559, -0.3441016, -3.18546, 1, 1, 1, 1, 1,
-0.3791754, -0.8309371, -2.842504, 1, 1, 1, 1, 1,
-0.3780692, -1.073472, -3.117601, 1, 1, 1, 1, 1,
-0.3766752, -1.487981, -2.742882, 1, 1, 1, 1, 1,
-0.3760072, 0.02189325, -0.7445173, 1, 1, 1, 1, 1,
-0.3738482, -0.2751572, -3.158059, 0, 0, 1, 1, 1,
-0.3730067, -1.057694, -2.56664, 1, 0, 0, 1, 1,
-0.3727177, -0.1175087, -2.986771, 1, 0, 0, 1, 1,
-0.3721119, 0.7964807, -1.128937, 1, 0, 0, 1, 1,
-0.3682809, -1.310551, -2.024211, 1, 0, 0, 1, 1,
-0.3670899, -0.8961927, -2.948163, 1, 0, 0, 1, 1,
-0.3655487, 0.1185897, -1.35665, 0, 0, 0, 1, 1,
-0.3605659, 0.791445, -0.02895365, 0, 0, 0, 1, 1,
-0.3598773, 1.73029, 0.5643611, 0, 0, 0, 1, 1,
-0.3547848, 0.08299648, -3.030688, 0, 0, 0, 1, 1,
-0.3546015, -0.700562, -1.733446, 0, 0, 0, 1, 1,
-0.3541676, 0.5062897, 0.4994897, 0, 0, 0, 1, 1,
-0.3522245, 1.392801, -1.087989, 0, 0, 0, 1, 1,
-0.3506552, -0.01578042, -2.32417, 1, 1, 1, 1, 1,
-0.3499291, -0.8327441, -1.915561, 1, 1, 1, 1, 1,
-0.3496475, 0.2282913, -0.2934758, 1, 1, 1, 1, 1,
-0.3441416, -0.5307654, -1.813241, 1, 1, 1, 1, 1,
-0.3428436, -2.926085, -1.536028, 1, 1, 1, 1, 1,
-0.3427001, -1.093817, -4.990754, 1, 1, 1, 1, 1,
-0.3355168, 0.5968093, -0.5520708, 1, 1, 1, 1, 1,
-0.3325433, 0.5402523, -0.1517045, 1, 1, 1, 1, 1,
-0.3287952, 0.1246749, -1.39873, 1, 1, 1, 1, 1,
-0.3283451, 0.1218553, -0.96367, 1, 1, 1, 1, 1,
-0.3272369, 0.5143301, -0.3556375, 1, 1, 1, 1, 1,
-0.3268267, -0.9039611, -2.267872, 1, 1, 1, 1, 1,
-0.3267136, -1.098552, -3.696078, 1, 1, 1, 1, 1,
-0.324695, -0.9849916, -3.393557, 1, 1, 1, 1, 1,
-0.3205651, -0.3803372, -2.610362, 1, 1, 1, 1, 1,
-0.3169384, -0.3671004, -3.359571, 0, 0, 1, 1, 1,
-0.3130924, 0.3475154, 0.4009929, 1, 0, 0, 1, 1,
-0.3118079, -0.806523, -3.948231, 1, 0, 0, 1, 1,
-0.3109896, 1.078418, -2.193261, 1, 0, 0, 1, 1,
-0.3090614, 0.3936909, 0.2992456, 1, 0, 0, 1, 1,
-0.3089781, -0.885116, -3.437652, 1, 0, 0, 1, 1,
-0.3084699, 0.2629255, -2.161694, 0, 0, 0, 1, 1,
-0.30797, 0.08330133, -0.8593597, 0, 0, 0, 1, 1,
-0.3070548, 0.5151758, -0.3214453, 0, 0, 0, 1, 1,
-0.3047662, -0.6050658, -2.919668, 0, 0, 0, 1, 1,
-0.3009113, 0.2363743, -1.585876, 0, 0, 0, 1, 1,
-0.3008336, -0.4477154, -2.345833, 0, 0, 0, 1, 1,
-0.2980449, -0.3585858, -2.337503, 0, 0, 0, 1, 1,
-0.296917, -1.276843, -4.452883, 1, 1, 1, 1, 1,
-0.2962539, 0.2253616, -0.9001223, 1, 1, 1, 1, 1,
-0.2948553, -0.3066237, -2.069073, 1, 1, 1, 1, 1,
-0.2920499, 1.728557, 1.909072, 1, 1, 1, 1, 1,
-0.2855303, -0.04638529, -1.920359, 1, 1, 1, 1, 1,
-0.2810448, -1.177961, -2.798181, 1, 1, 1, 1, 1,
-0.2797736, -0.4769789, -3.660907, 1, 1, 1, 1, 1,
-0.2778693, -0.7972501, -3.909247, 1, 1, 1, 1, 1,
-0.2775932, -0.02484968, -2.314714, 1, 1, 1, 1, 1,
-0.2766958, -0.4860765, -1.665167, 1, 1, 1, 1, 1,
-0.2736807, 1.401701, -0.3942668, 1, 1, 1, 1, 1,
-0.2732694, 0.04004614, -2.949499, 1, 1, 1, 1, 1,
-0.271053, 0.7479706, -2.29675, 1, 1, 1, 1, 1,
-0.2704641, -0.6362889, -0.2690032, 1, 1, 1, 1, 1,
-0.2700102, 0.5062438, -1.79148, 1, 1, 1, 1, 1,
-0.2689182, 0.4423214, 0.01812505, 0, 0, 1, 1, 1,
-0.2654145, 0.6851651, 0.2504333, 1, 0, 0, 1, 1,
-0.2627552, 0.8768916, -1.221178, 1, 0, 0, 1, 1,
-0.2569604, -0.2513022, -3.855395, 1, 0, 0, 1, 1,
-0.2560742, 0.8659772, -1.581787, 1, 0, 0, 1, 1,
-0.2555221, 1.338855, -1.455984, 1, 0, 0, 1, 1,
-0.2533404, -0.3026028, -2.32397, 0, 0, 0, 1, 1,
-0.2514367, 0.6440665, -1.665094, 0, 0, 0, 1, 1,
-0.2513838, 0.7013158, -0.9849496, 0, 0, 0, 1, 1,
-0.2484563, -0.05148752, -1.632626, 0, 0, 0, 1, 1,
-0.2380127, -0.451567, -3.316335, 0, 0, 0, 1, 1,
-0.2353718, -0.3254034, -2.208613, 0, 0, 0, 1, 1,
-0.2344881, 1.391091, -0.8536373, 0, 0, 0, 1, 1,
-0.2319956, -0.06262148, -1.195908, 1, 1, 1, 1, 1,
-0.2303483, -2.84539, -5.282297, 1, 1, 1, 1, 1,
-0.2288111, -0.7234474, -4.719553, 1, 1, 1, 1, 1,
-0.2195403, -0.3558678, -3.357386, 1, 1, 1, 1, 1,
-0.2164817, 0.7595468, -0.8131245, 1, 1, 1, 1, 1,
-0.2160594, 1.359741, -0.2385607, 1, 1, 1, 1, 1,
-0.2135326, -0.9892044, -4.537116, 1, 1, 1, 1, 1,
-0.2130988, 0.3541904, -0.07195312, 1, 1, 1, 1, 1,
-0.2107644, -0.8781097, -2.732181, 1, 1, 1, 1, 1,
-0.2101744, 0.5054528, -0.3558498, 1, 1, 1, 1, 1,
-0.2099933, -0.01887928, -1.954829, 1, 1, 1, 1, 1,
-0.2067636, 0.3004212, -1.371863, 1, 1, 1, 1, 1,
-0.2066661, -0.6075391, -4.102777, 1, 1, 1, 1, 1,
-0.20429, 0.4167058, -0.6209748, 1, 1, 1, 1, 1,
-0.203794, -0.5473697, -2.277598, 1, 1, 1, 1, 1,
-0.2034486, -0.3464115, -2.768648, 0, 0, 1, 1, 1,
-0.2022719, 0.402785, 1.841097, 1, 0, 0, 1, 1,
-0.2007339, -0.6363341, -3.146324, 1, 0, 0, 1, 1,
-0.1995441, -0.3173242, -2.714521, 1, 0, 0, 1, 1,
-0.1990923, -0.9586833, -2.403069, 1, 0, 0, 1, 1,
-0.1983763, 2.06945, -0.328354, 1, 0, 0, 1, 1,
-0.1922074, 1.941978, 1.130653, 0, 0, 0, 1, 1,
-0.1908486, -0.8893856, -3.844904, 0, 0, 0, 1, 1,
-0.1861189, 0.993991, -0.3098333, 0, 0, 0, 1, 1,
-0.18246, 0.9083047, 0.9307629, 0, 0, 0, 1, 1,
-0.1764244, 0.5994667, 0.1124972, 0, 0, 0, 1, 1,
-0.1762399, -0.4847141, -3.958706, 0, 0, 0, 1, 1,
-0.1734382, -0.5445551, -2.243421, 0, 0, 0, 1, 1,
-0.1681966, 0.8149306, 1.081157, 1, 1, 1, 1, 1,
-0.1649761, -0.3899275, -1.787122, 1, 1, 1, 1, 1,
-0.1622776, 0.8488548, 0.4566604, 1, 1, 1, 1, 1,
-0.1567872, -1.680142, -2.527057, 1, 1, 1, 1, 1,
-0.1557416, 1.926637, 0.4555047, 1, 1, 1, 1, 1,
-0.1499423, 1.018381, -1.522035, 1, 1, 1, 1, 1,
-0.1491531, 0.769635, 0.9162172, 1, 1, 1, 1, 1,
-0.1482466, 0.7619354, 0.5609119, 1, 1, 1, 1, 1,
-0.1439586, -0.6008704, -2.743182, 1, 1, 1, 1, 1,
-0.1398556, -0.2169458, -2.752623, 1, 1, 1, 1, 1,
-0.1357182, -0.7710947, -3.476088, 1, 1, 1, 1, 1,
-0.1315182, 0.4245417, -0.5375455, 1, 1, 1, 1, 1,
-0.1286567, -0.5981515, -2.77337, 1, 1, 1, 1, 1,
-0.1260877, -0.4992486, -2.742455, 1, 1, 1, 1, 1,
-0.1220772, -0.7766034, -3.965229, 1, 1, 1, 1, 1,
-0.1219376, -0.496192, -2.336541, 0, 0, 1, 1, 1,
-0.1205016, 0.3518842, -0.8285233, 1, 0, 0, 1, 1,
-0.120375, -0.5627834, -2.420517, 1, 0, 0, 1, 1,
-0.1186975, -0.4871244, -4.083939, 1, 0, 0, 1, 1,
-0.1168709, 0.6963056, -0.08604041, 1, 0, 0, 1, 1,
-0.1141707, -0.4379888, -2.853513, 1, 0, 0, 1, 1,
-0.1070853, -0.2923328, -3.243022, 0, 0, 0, 1, 1,
-0.1045183, 0.4116224, -1.264546, 0, 0, 0, 1, 1,
-0.1026874, 1.301559, 1.004425, 0, 0, 0, 1, 1,
-0.1019482, 0.6896021, -1.898142, 0, 0, 0, 1, 1,
-0.09896872, -1.193835, -2.294379, 0, 0, 0, 1, 1,
-0.09782148, -1.310198, -3.806925, 0, 0, 0, 1, 1,
-0.09364868, -0.5566016, -3.403779, 0, 0, 0, 1, 1,
-0.09092534, -2.280565, -1.714689, 1, 1, 1, 1, 1,
-0.09047649, 1.140855, -1.8074, 1, 1, 1, 1, 1,
-0.08963357, 0.8394415, 0.1722087, 1, 1, 1, 1, 1,
-0.08762594, 1.837868, -0.8494626, 1, 1, 1, 1, 1,
-0.08523289, 0.5026689, -3.766364, 1, 1, 1, 1, 1,
-0.08257634, 2.298818, -1.128044, 1, 1, 1, 1, 1,
-0.08252399, 0.9167774, 1.881749, 1, 1, 1, 1, 1,
-0.07940716, 0.2441647, -0.9644523, 1, 1, 1, 1, 1,
-0.07649448, 0.01412533, -0.8483803, 1, 1, 1, 1, 1,
-0.0760829, -1.425195, -2.430995, 1, 1, 1, 1, 1,
-0.06634633, -0.2611414, -2.653488, 1, 1, 1, 1, 1,
-0.06251312, 0.08128522, -2.785859, 1, 1, 1, 1, 1,
-0.0605489, 0.3696055, -0.6820876, 1, 1, 1, 1, 1,
-0.06039902, -0.4310984, -2.541087, 1, 1, 1, 1, 1,
-0.05800282, 0.8252175, -0.9126814, 1, 1, 1, 1, 1,
-0.0552691, -0.552784, -1.802322, 0, 0, 1, 1, 1,
-0.05489027, -0.3615014, -3.618811, 1, 0, 0, 1, 1,
-0.05459194, -1.563524, -3.571949, 1, 0, 0, 1, 1,
-0.05220681, 0.1194217, 0.6707752, 1, 0, 0, 1, 1,
-0.04926213, -1.00504, -3.371709, 1, 0, 0, 1, 1,
-0.0474261, 0.3683928, -0.1285539, 1, 0, 0, 1, 1,
-0.04421307, -1.479612, -2.54025, 0, 0, 0, 1, 1,
-0.04351053, -0.7833946, -2.94338, 0, 0, 0, 1, 1,
-0.04146013, 0.1072232, 0.3515907, 0, 0, 0, 1, 1,
-0.03987436, 1.706138, -0.5622437, 0, 0, 0, 1, 1,
-0.03868162, 1.273821, -0.8801443, 0, 0, 0, 1, 1,
-0.03732674, -0.4374256, -3.736228, 0, 0, 0, 1, 1,
-0.03702879, 1.231426, -1.349971, 0, 0, 0, 1, 1,
-0.0333417, -2.107289, -4.163926, 1, 1, 1, 1, 1,
-0.03128496, -0.9108101, -4.428252, 1, 1, 1, 1, 1,
-0.02610347, 0.8040393, 0.5772119, 1, 1, 1, 1, 1,
-0.02327523, 0.1819416, 0.1746988, 1, 1, 1, 1, 1,
-0.02137598, -1.118494, -3.601562, 1, 1, 1, 1, 1,
-0.02000193, -0.6366127, -3.243089, 1, 1, 1, 1, 1,
-0.01977331, -0.7039543, -2.598071, 1, 1, 1, 1, 1,
-0.01436953, 1.533631, 1.619921, 1, 1, 1, 1, 1,
-0.01433043, -0.1760647, -3.609287, 1, 1, 1, 1, 1,
-0.01259737, 0.3675744, -1.437892, 1, 1, 1, 1, 1,
-0.005240249, 0.4500506, 0.8551819, 1, 1, 1, 1, 1,
-0.004294834, -0.2769351, -3.096893, 1, 1, 1, 1, 1,
-0.002946374, 1.245075, 0.3901154, 1, 1, 1, 1, 1,
-0.001555293, 0.7473392, 0.4258626, 1, 1, 1, 1, 1,
-0.0007690624, -0.3490212, -2.593244, 1, 1, 1, 1, 1,
0.00422504, -1.693389, 2.785614, 0, 0, 1, 1, 1,
0.007404938, -1.038633, 3.045786, 1, 0, 0, 1, 1,
0.01127603, 1.354753, -0.0461872, 1, 0, 0, 1, 1,
0.0116036, 1.981696, 1.015054, 1, 0, 0, 1, 1,
0.01499891, 0.1587745, 1.683643, 1, 0, 0, 1, 1,
0.01848791, 0.7837431, 0.4528489, 1, 0, 0, 1, 1,
0.01971001, -0.07092095, 3.858086, 0, 0, 0, 1, 1,
0.02089513, -0.5749043, 4.339122, 0, 0, 0, 1, 1,
0.0265258, -1.267766, 1.195783, 0, 0, 0, 1, 1,
0.02673725, -0.2630111, 3.297959, 0, 0, 0, 1, 1,
0.02780572, -1.251372, 3.630002, 0, 0, 0, 1, 1,
0.02889588, 0.4753238, 0.7628441, 0, 0, 0, 1, 1,
0.03193785, 1.271399, -0.112201, 0, 0, 0, 1, 1,
0.03381402, 1.414291, -0.3178778, 1, 1, 1, 1, 1,
0.03640054, -0.2708088, 4.753299, 1, 1, 1, 1, 1,
0.03655853, 0.4750175, -1.323824, 1, 1, 1, 1, 1,
0.04093704, 0.4877311, 1.004718, 1, 1, 1, 1, 1,
0.04251403, 1.209243, 1.05687, 1, 1, 1, 1, 1,
0.04415707, -0.3626975, 2.96238, 1, 1, 1, 1, 1,
0.04600559, 1.065218, -1.990281, 1, 1, 1, 1, 1,
0.04621201, -0.2690605, 3.344343, 1, 1, 1, 1, 1,
0.04821493, -0.4880781, 4.071108, 1, 1, 1, 1, 1,
0.04835592, -0.4513319, 2.883955, 1, 1, 1, 1, 1,
0.05155117, -1.398936, 3.118833, 1, 1, 1, 1, 1,
0.05175307, -0.755681, 4.374652, 1, 1, 1, 1, 1,
0.05620036, -1.108526, 3.570356, 1, 1, 1, 1, 1,
0.06049653, 0.08162279, -0.02355657, 1, 1, 1, 1, 1,
0.06077517, 0.5334997, 1.042824, 1, 1, 1, 1, 1,
0.06650087, -0.6643802, 3.514585, 0, 0, 1, 1, 1,
0.06678491, 0.3860631, -0.2703651, 1, 0, 0, 1, 1,
0.06743563, 0.9232254, 2.380926, 1, 0, 0, 1, 1,
0.07066882, -0.5089666, 3.757738, 1, 0, 0, 1, 1,
0.07247072, -0.1159379, 2.788589, 1, 0, 0, 1, 1,
0.07285805, -2.342555, 3.344357, 1, 0, 0, 1, 1,
0.07641511, -0.09446677, 2.796758, 0, 0, 0, 1, 1,
0.08255316, -0.6179749, 4.764733, 0, 0, 0, 1, 1,
0.08388284, -1.104853, 3.290222, 0, 0, 0, 1, 1,
0.08389013, -1.632213, 4.143248, 0, 0, 0, 1, 1,
0.0930327, 0.8748049, -0.1478052, 0, 0, 0, 1, 1,
0.09404031, 0.1905439, -0.04993705, 0, 0, 0, 1, 1,
0.09768641, -1.843179, 3.946434, 0, 0, 0, 1, 1,
0.1006365, 0.07369255, -1.211467, 1, 1, 1, 1, 1,
0.1038054, 0.1654961, 0.1093391, 1, 1, 1, 1, 1,
0.1107675, 0.4510204, -0.03414208, 1, 1, 1, 1, 1,
0.1108132, -0.08202016, 3.376094, 1, 1, 1, 1, 1,
0.1126812, 0.1277894, 0.05217614, 1, 1, 1, 1, 1,
0.1128184, 0.5467532, -0.01885571, 1, 1, 1, 1, 1,
0.1130744, -2.842583, 0.5463616, 1, 1, 1, 1, 1,
0.1150778, 1.629204, 0.6950535, 1, 1, 1, 1, 1,
0.1188886, 1.093835, -1.118058, 1, 1, 1, 1, 1,
0.1197607, 0.1520567, 1.70915, 1, 1, 1, 1, 1,
0.1212631, 0.272957, -0.04498041, 1, 1, 1, 1, 1,
0.133424, -0.2596768, 3.474436, 1, 1, 1, 1, 1,
0.1346435, 0.5193959, -1.283869, 1, 1, 1, 1, 1,
0.1409708, -0.3523008, 3.011251, 1, 1, 1, 1, 1,
0.1470943, 0.1184555, 0.988858, 1, 1, 1, 1, 1,
0.1503273, -1.004555, 3.015378, 0, 0, 1, 1, 1,
0.1525987, -0.1339369, 1.418273, 1, 0, 0, 1, 1,
0.153914, -0.07593982, 1.212521, 1, 0, 0, 1, 1,
0.155044, -1.183594, 3.442485, 1, 0, 0, 1, 1,
0.1568249, 0.7155505, -1.574694, 1, 0, 0, 1, 1,
0.1607844, 0.4751197, -0.05064581, 1, 0, 0, 1, 1,
0.1637871, -0.346456, 2.836391, 0, 0, 0, 1, 1,
0.1654372, -1.509967, 2.105697, 0, 0, 0, 1, 1,
0.1655915, -0.9210982, 2.242871, 0, 0, 0, 1, 1,
0.167568, -0.2278192, 1.850349, 0, 0, 0, 1, 1,
0.1675815, -0.2877846, 2.71352, 0, 0, 0, 1, 1,
0.1746571, -1.195436, 1.323099, 0, 0, 0, 1, 1,
0.1784326, 0.1968036, 1.463382, 0, 0, 0, 1, 1,
0.1820245, -1.313671, 3.381072, 1, 1, 1, 1, 1,
0.1831359, 0.2816612, 1.538134, 1, 1, 1, 1, 1,
0.185053, -0.2537991, 2.59214, 1, 1, 1, 1, 1,
0.1874085, 0.9355217, 0.07292886, 1, 1, 1, 1, 1,
0.1911162, -0.6098005, 2.369939, 1, 1, 1, 1, 1,
0.1911331, -0.8728375, 0.8424588, 1, 1, 1, 1, 1,
0.1956635, -0.300242, 0.9491445, 1, 1, 1, 1, 1,
0.210244, -1.272421, 5.576748, 1, 1, 1, 1, 1,
0.2131844, 0.05022521, 3.039521, 1, 1, 1, 1, 1,
0.2171909, 0.4593039, -1.190565, 1, 1, 1, 1, 1,
0.2258867, -0.06819274, 1.785607, 1, 1, 1, 1, 1,
0.2262414, 0.7661458, 0.3697726, 1, 1, 1, 1, 1,
0.2276679, 0.2797801, -0.1165337, 1, 1, 1, 1, 1,
0.230888, 0.9853285, 1.221753, 1, 1, 1, 1, 1,
0.2328559, -0.04247781, 1.65735, 1, 1, 1, 1, 1,
0.2397844, 0.3200241, 1.100865, 0, 0, 1, 1, 1,
0.246251, 0.5250369, 1.101272, 1, 0, 0, 1, 1,
0.2463567, -0.18988, 2.912753, 1, 0, 0, 1, 1,
0.2531889, -0.1561977, 3.026908, 1, 0, 0, 1, 1,
0.2667539, 0.9172784, 1.533029, 1, 0, 0, 1, 1,
0.2710325, 1.259821, -0.184627, 1, 0, 0, 1, 1,
0.274417, 0.4476215, 1.687916, 0, 0, 0, 1, 1,
0.2757384, -0.6701415, 2.894676, 0, 0, 0, 1, 1,
0.2786514, -0.3104956, 3.170963, 0, 0, 0, 1, 1,
0.2802157, -0.6629898, 2.225793, 0, 0, 0, 1, 1,
0.2842698, 1.032548, 0.7341413, 0, 0, 0, 1, 1,
0.2873395, -0.1525814, 1.761374, 0, 0, 0, 1, 1,
0.2897436, 0.3145889, 1.854029, 0, 0, 0, 1, 1,
0.2923741, -0.3069718, 2.095405, 1, 1, 1, 1, 1,
0.2984677, -0.3997017, 2.53226, 1, 1, 1, 1, 1,
0.3017829, -2.036366, 2.570488, 1, 1, 1, 1, 1,
0.3042169, 0.8691106, 1.248841, 1, 1, 1, 1, 1,
0.3054872, 1.473887, 1.177795, 1, 1, 1, 1, 1,
0.3059418, 0.9682875, 0.3712604, 1, 1, 1, 1, 1,
0.3068993, -1.308454, 3.861274, 1, 1, 1, 1, 1,
0.3085124, -0.8584053, 2.241483, 1, 1, 1, 1, 1,
0.3127884, 1.788032, 1.946569, 1, 1, 1, 1, 1,
0.3140442, 0.5230733, 2.020918, 1, 1, 1, 1, 1,
0.3325826, -1.084502, 3.403312, 1, 1, 1, 1, 1,
0.3327332, 0.1190734, -0.05560005, 1, 1, 1, 1, 1,
0.3353228, -0.2230637, 2.671852, 1, 1, 1, 1, 1,
0.3408356, -1.440339, 3.422206, 1, 1, 1, 1, 1,
0.3471909, 0.9612213, 0.6464646, 1, 1, 1, 1, 1,
0.3493842, -0.3136172, 1.858086, 0, 0, 1, 1, 1,
0.353884, 1.189208, 0.39053, 1, 0, 0, 1, 1,
0.3543743, -0.3050615, 0.8495785, 1, 0, 0, 1, 1,
0.356378, 0.2393862, 1.021014, 1, 0, 0, 1, 1,
0.3603691, 2.131311, 0.3312307, 1, 0, 0, 1, 1,
0.3623703, 1.382115, -0.9490767, 1, 0, 0, 1, 1,
0.3648055, 1.770191, 0.9265194, 0, 0, 0, 1, 1,
0.3654431, -1.0762, 3.610019, 0, 0, 0, 1, 1,
0.3771562, 0.02673979, 1.985876, 0, 0, 0, 1, 1,
0.3797033, -0.8801944, 1.12613, 0, 0, 0, 1, 1,
0.3803267, 0.2675332, 0.4507796, 0, 0, 0, 1, 1,
0.3926842, -1.241999, 2.972474, 0, 0, 0, 1, 1,
0.3937082, 2.672969, 1.387365, 0, 0, 0, 1, 1,
0.3940656, 0.5086107, 0.5086133, 1, 1, 1, 1, 1,
0.3955485, 0.0366968, 2.339187, 1, 1, 1, 1, 1,
0.3964846, 0.4340887, 1.261131, 1, 1, 1, 1, 1,
0.3966954, -0.5444323, 2.930314, 1, 1, 1, 1, 1,
0.4040399, -0.723033, 2.870408, 1, 1, 1, 1, 1,
0.406188, -0.7881668, 1.728222, 1, 1, 1, 1, 1,
0.4080427, -1.072337, 1.691928, 1, 1, 1, 1, 1,
0.4152565, -0.1678049, 1.567459, 1, 1, 1, 1, 1,
0.4157202, 1.331705, 1.332025, 1, 1, 1, 1, 1,
0.4163572, 1.645359, 0.7146389, 1, 1, 1, 1, 1,
0.4185468, 0.9122193, 0.08456364, 1, 1, 1, 1, 1,
0.4303989, -0.9445233, 1.039101, 1, 1, 1, 1, 1,
0.4435601, -0.1992827, 3.238594, 1, 1, 1, 1, 1,
0.45008, -1.554394, 4.072145, 1, 1, 1, 1, 1,
0.4502177, 0.2277192, 1.55665, 1, 1, 1, 1, 1,
0.4517787, 0.8065458, 1.227016, 0, 0, 1, 1, 1,
0.4572689, 0.1357276, 1.041083, 1, 0, 0, 1, 1,
0.459569, 0.3288596, 0.3958317, 1, 0, 0, 1, 1,
0.4659713, -0.06727856, 2.099598, 1, 0, 0, 1, 1,
0.4694394, 0.4540298, 0.02053174, 1, 0, 0, 1, 1,
0.4802039, 0.8477789, -0.02785703, 1, 0, 0, 1, 1,
0.4816709, -1.560623, 4.448607, 0, 0, 0, 1, 1,
0.4823051, -1.727976, 3.234379, 0, 0, 0, 1, 1,
0.4836977, -0.015374, 1.46555, 0, 0, 0, 1, 1,
0.4883566, 0.8679506, 1.253865, 0, 0, 0, 1, 1,
0.4903304, 1.357741, 0.5564334, 0, 0, 0, 1, 1,
0.4927109, -1.615664, 2.45179, 0, 0, 0, 1, 1,
0.4938218, -0.272307, 1.138933, 0, 0, 0, 1, 1,
0.4960731, 0.1058724, 1.351898, 1, 1, 1, 1, 1,
0.4983492, 2.397011, -1.328684, 1, 1, 1, 1, 1,
0.5014117, -0.6489345, 2.451366, 1, 1, 1, 1, 1,
0.504867, -0.09144392, 1.897887, 1, 1, 1, 1, 1,
0.5083269, 1.071439, -0.329677, 1, 1, 1, 1, 1,
0.5140412, 0.6216863, -1.388637, 1, 1, 1, 1, 1,
0.5167828, 0.2881546, -0.09308567, 1, 1, 1, 1, 1,
0.5167863, -0.5273957, 3.147949, 1, 1, 1, 1, 1,
0.5183266, 0.584936, 0.8909695, 1, 1, 1, 1, 1,
0.5237689, 0.05756159, 0.1288408, 1, 1, 1, 1, 1,
0.5275646, -1.016456, 3.631403, 1, 1, 1, 1, 1,
0.5380461, -0.195322, 4.316265, 1, 1, 1, 1, 1,
0.5397862, -0.3705178, 1.005443, 1, 1, 1, 1, 1,
0.5398592, -1.393909, 3.649981, 1, 1, 1, 1, 1,
0.5413164, 2.073028, 0.2097494, 1, 1, 1, 1, 1,
0.5452572, 0.6472308, 1.594523, 0, 0, 1, 1, 1,
0.5477511, 0.6890171, -0.1150872, 1, 0, 0, 1, 1,
0.5509092, 1.914423, -0.3082899, 1, 0, 0, 1, 1,
0.557942, 1.108312, 0.9758349, 1, 0, 0, 1, 1,
0.5615767, 0.9829787, -0.9772764, 1, 0, 0, 1, 1,
0.5672225, 0.1194977, 3.187021, 1, 0, 0, 1, 1,
0.5711325, 2.805972, -0.3731843, 0, 0, 0, 1, 1,
0.5751837, 0.5636539, 0.8320717, 0, 0, 0, 1, 1,
0.5759044, 0.3382471, -0.9599114, 0, 0, 0, 1, 1,
0.5759158, 1.570862, -1.089016, 0, 0, 0, 1, 1,
0.5781074, -0.8184096, 3.002189, 0, 0, 0, 1, 1,
0.5808471, 1.20112, 1.325999, 0, 0, 0, 1, 1,
0.5863338, 0.3563041, -0.0115983, 0, 0, 0, 1, 1,
0.5867286, 0.002475521, -0.4704279, 1, 1, 1, 1, 1,
0.594122, -0.07430253, 3.225434, 1, 1, 1, 1, 1,
0.595136, 0.5416718, 1.771034, 1, 1, 1, 1, 1,
0.5995792, -0.1983598, 1.253756, 1, 1, 1, 1, 1,
0.6022577, 0.09094691, 1.837249, 1, 1, 1, 1, 1,
0.6023706, 1.476333, 2.583889, 1, 1, 1, 1, 1,
0.6108907, 0.2837854, 1.351036, 1, 1, 1, 1, 1,
0.6109717, -0.2336267, 3.582226, 1, 1, 1, 1, 1,
0.6117203, -0.3169862, 3.602898, 1, 1, 1, 1, 1,
0.6133085, 0.7378157, 1.345447, 1, 1, 1, 1, 1,
0.6142617, 0.9229456, 1.927528, 1, 1, 1, 1, 1,
0.6174439, 0.7430857, -0.1872481, 1, 1, 1, 1, 1,
0.6192599, -0.7428933, 2.576261, 1, 1, 1, 1, 1,
0.6284043, 0.7843008, 0.2814891, 1, 1, 1, 1, 1,
0.6332337, 2.445637, 0.2889228, 1, 1, 1, 1, 1,
0.6358463, 0.8736193, 0.8216773, 0, 0, 1, 1, 1,
0.6374962, 0.2697921, 2.410487, 1, 0, 0, 1, 1,
0.6428332, -1.395788, 3.838551, 1, 0, 0, 1, 1,
0.6448004, 0.8049524, 0.3419792, 1, 0, 0, 1, 1,
0.6449279, -0.6803471, 2.329099, 1, 0, 0, 1, 1,
0.6500396, 0.8599988, 0.6332343, 1, 0, 0, 1, 1,
0.651737, 0.9822646, -1.36457, 0, 0, 0, 1, 1,
0.6525202, -0.3794451, 1.549092, 0, 0, 0, 1, 1,
0.6527203, -1.028318, 1.911071, 0, 0, 0, 1, 1,
0.6540022, -0.9580882, 2.61614, 0, 0, 0, 1, 1,
0.6545107, -0.584969, 2.283057, 0, 0, 0, 1, 1,
0.6564434, -0.2785284, 1.759703, 0, 0, 0, 1, 1,
0.6594791, 0.3627648, 1.991793, 0, 0, 0, 1, 1,
0.6603836, -0.2848317, 2.182671, 1, 1, 1, 1, 1,
0.6617967, -1.487627, 2.300701, 1, 1, 1, 1, 1,
0.6657875, -1.703964, 2.928563, 1, 1, 1, 1, 1,
0.6674284, -0.8305241, 2.881804, 1, 1, 1, 1, 1,
0.6679062, 0.3150518, 1.897038, 1, 1, 1, 1, 1,
0.6679868, -0.8576761, 3.222824, 1, 1, 1, 1, 1,
0.6745002, -0.0977106, 2.120532, 1, 1, 1, 1, 1,
0.6770453, 1.140868, 0.3690408, 1, 1, 1, 1, 1,
0.6780115, -0.7933517, 1.06874, 1, 1, 1, 1, 1,
0.6792135, -1.005077, 3.240246, 1, 1, 1, 1, 1,
0.6821449, -0.6543877, 4.379561, 1, 1, 1, 1, 1,
0.6823642, -0.5440918, 2.256918, 1, 1, 1, 1, 1,
0.6841654, 0.5796711, 0.7959418, 1, 1, 1, 1, 1,
0.684806, 0.009719404, 3.038074, 1, 1, 1, 1, 1,
0.6859763, -0.1712622, 1.65186, 1, 1, 1, 1, 1,
0.6916772, 0.03371869, 2.187587, 0, 0, 1, 1, 1,
0.6958308, -0.03157129, 2.853854, 1, 0, 0, 1, 1,
0.7068951, -0.734008, 2.635453, 1, 0, 0, 1, 1,
0.7130315, 0.9172783, 0.8337739, 1, 0, 0, 1, 1,
0.7194083, -0.821923, 2.278351, 1, 0, 0, 1, 1,
0.7200785, 0.446613, 2.55447, 1, 0, 0, 1, 1,
0.721769, 0.1195427, 1.868931, 0, 0, 0, 1, 1,
0.7254944, 0.5798135, -1.191473, 0, 0, 0, 1, 1,
0.7319451, 0.7083386, 1.560028, 0, 0, 0, 1, 1,
0.7341564, 2.483738, -0.09545957, 0, 0, 0, 1, 1,
0.744458, 2.59218, 1.095417, 0, 0, 0, 1, 1,
0.7461526, 0.9188204, -0.9996017, 0, 0, 0, 1, 1,
0.7615241, 0.9478021, -0.1106424, 0, 0, 0, 1, 1,
0.7648491, 1.343705, 0.1340618, 1, 1, 1, 1, 1,
0.7732949, -1.731051, 2.354081, 1, 1, 1, 1, 1,
0.7735656, 2.134204, -1.191617, 1, 1, 1, 1, 1,
0.7737287, -0.07789403, 0.2409671, 1, 1, 1, 1, 1,
0.7748669, 0.9347712, 1.580379, 1, 1, 1, 1, 1,
0.7845691, 0.1134679, 0.8905167, 1, 1, 1, 1, 1,
0.7911422, -1.648653, 1.91057, 1, 1, 1, 1, 1,
0.7921383, 0.9027761, -0.1536209, 1, 1, 1, 1, 1,
0.7944359, 1.061957, 0.4338887, 1, 1, 1, 1, 1,
0.7945566, 0.9533009, 1.457295, 1, 1, 1, 1, 1,
0.7961118, -1.371087, 2.186219, 1, 1, 1, 1, 1,
0.7980358, -0.8804978, 2.311929, 1, 1, 1, 1, 1,
0.798483, 1.049673, 1.097947, 1, 1, 1, 1, 1,
0.7992939, -0.7313612, 0.1583482, 1, 1, 1, 1, 1,
0.8017278, -0.4836872, 1.899087, 1, 1, 1, 1, 1,
0.8028781, -0.9894243, 4.777101, 0, 0, 1, 1, 1,
0.8069088, 0.06463859, 2.55592, 1, 0, 0, 1, 1,
0.8162277, 2.202022, 0.9175525, 1, 0, 0, 1, 1,
0.8186166, 0.2682574, 1.309203, 1, 0, 0, 1, 1,
0.8234225, -0.4755086, 3.105246, 1, 0, 0, 1, 1,
0.8252426, 0.2731643, 0.2231264, 1, 0, 0, 1, 1,
0.831227, -0.3755428, 2.723948, 0, 0, 0, 1, 1,
0.84355, -1.02965, 0.7441594, 0, 0, 0, 1, 1,
0.8441123, 0.3594406, 2.018905, 0, 0, 0, 1, 1,
0.8505607, 0.4061419, 0.1526164, 0, 0, 0, 1, 1,
0.8584358, 0.3881679, -0.5833595, 0, 0, 0, 1, 1,
0.8702095, -1.360399, 2.07176, 0, 0, 0, 1, 1,
0.8792738, -0.2489889, 2.313965, 0, 0, 0, 1, 1,
0.8805611, 1.14457, 1.025294, 1, 1, 1, 1, 1,
0.8822591, -0.9986887, 0.7872595, 1, 1, 1, 1, 1,
0.8839198, -0.4096618, 0.4038874, 1, 1, 1, 1, 1,
0.8855145, 0.7454723, 1.735829, 1, 1, 1, 1, 1,
0.8901316, 0.2357762, 3.087321, 1, 1, 1, 1, 1,
0.8910896, -0.1667065, 2.557215, 1, 1, 1, 1, 1,
0.8956045, 0.1084745, 2.104667, 1, 1, 1, 1, 1,
0.8976282, -0.9125542, 0.3666977, 1, 1, 1, 1, 1,
0.9021528, -0.04738288, 2.169568, 1, 1, 1, 1, 1,
0.9045669, 3.039872, -1.812017, 1, 1, 1, 1, 1,
0.9048037, 0.5019212, 1.358284, 1, 1, 1, 1, 1,
0.9111991, -0.9442507, 2.705189, 1, 1, 1, 1, 1,
0.9131575, 0.2951164, 2.597392, 1, 1, 1, 1, 1,
0.9135767, 0.6104571, -0.30879, 1, 1, 1, 1, 1,
0.9153967, 0.662367, 1.20595, 1, 1, 1, 1, 1,
0.9154215, -0.7983385, 0.3737514, 0, 0, 1, 1, 1,
0.9174466, -0.4558283, 2.004807, 1, 0, 0, 1, 1,
0.9175898, -1.259344, 1.781582, 1, 0, 0, 1, 1,
0.9194784, 0.7244265, 0.9258955, 1, 0, 0, 1, 1,
0.9221446, -0.7812982, 2.006207, 1, 0, 0, 1, 1,
0.9312786, 0.9138759, -0.2358171, 1, 0, 0, 1, 1,
0.9338581, -0.3546446, 1.498672, 0, 0, 0, 1, 1,
0.9439939, -0.3947355, 2.507696, 0, 0, 0, 1, 1,
0.9449427, -1.241024, 1.807403, 0, 0, 0, 1, 1,
0.9465424, -0.5969567, 1.780251, 0, 0, 0, 1, 1,
0.9508064, -0.3187928, 0.0212721, 0, 0, 0, 1, 1,
0.9546064, -1.722291, 1.483159, 0, 0, 0, 1, 1,
0.9548854, 0.4926626, 2.05305, 0, 0, 0, 1, 1,
0.9574348, -1.871707, 1.709794, 1, 1, 1, 1, 1,
0.9584645, 0.589108, 0.5452968, 1, 1, 1, 1, 1,
0.9610383, 0.8026661, 1.367155, 1, 1, 1, 1, 1,
0.9628412, 0.3418038, 0.5229396, 1, 1, 1, 1, 1,
0.9667593, 0.1062204, 2.790655, 1, 1, 1, 1, 1,
0.9701051, -1.148552, 3.340203, 1, 1, 1, 1, 1,
0.9743367, 0.384701, -0.1825651, 1, 1, 1, 1, 1,
0.9825411, -0.4344639, 2.299906, 1, 1, 1, 1, 1,
0.9827586, -0.2454001, 1.02523, 1, 1, 1, 1, 1,
0.9854302, -1.639465, 2.45526, 1, 1, 1, 1, 1,
0.9881105, -0.4677364, 2.806818, 1, 1, 1, 1, 1,
0.9890624, 1.277344, 0.7648524, 1, 1, 1, 1, 1,
0.9914381, -0.2410127, 3.708885, 1, 1, 1, 1, 1,
0.9925213, 0.3434174, 2.645545, 1, 1, 1, 1, 1,
0.9942979, -0.4243044, 1.733047, 1, 1, 1, 1, 1,
0.9957095, -0.6062216, 0.871069, 0, 0, 1, 1, 1,
0.9987853, 0.3515729, 1.057034, 1, 0, 0, 1, 1,
1.00064, -0.5529601, 3.34883, 1, 0, 0, 1, 1,
1.002338, 0.03550097, 0.5860437, 1, 0, 0, 1, 1,
1.003664, -1.509044, 1.869725, 1, 0, 0, 1, 1,
1.007335, 1.059173, 1.282965, 1, 0, 0, 1, 1,
1.009222, -0.6830564, 1.450909, 0, 0, 0, 1, 1,
1.014349, -0.5407915, 2.79994, 0, 0, 0, 1, 1,
1.014771, -0.06250379, 2.258593, 0, 0, 0, 1, 1,
1.016526, -0.3284253, 1.797882, 0, 0, 0, 1, 1,
1.018657, -0.6491091, 1.089749, 0, 0, 0, 1, 1,
1.023986, 0.7241628, 1.753325, 0, 0, 0, 1, 1,
1.026993, -0.9614114, 1.109199, 0, 0, 0, 1, 1,
1.029193, 0.2072609, 3.256842, 1, 1, 1, 1, 1,
1.029391, -0.1204558, 1.817165, 1, 1, 1, 1, 1,
1.035992, 1.256436, -0.6833579, 1, 1, 1, 1, 1,
1.040809, -2.753662, 3.965328, 1, 1, 1, 1, 1,
1.044054, -0.9807808, 4.456008, 1, 1, 1, 1, 1,
1.044102, -2.960314, 2.525992, 1, 1, 1, 1, 1,
1.08682, 1.331317, 0.5643811, 1, 1, 1, 1, 1,
1.086861, -1.517305, 3.82049, 1, 1, 1, 1, 1,
1.09014, -1.45339, 3.353043, 1, 1, 1, 1, 1,
1.096592, 0.8591856, 1.570446, 1, 1, 1, 1, 1,
1.099956, 1.103734, 1.758758, 1, 1, 1, 1, 1,
1.100925, -0.6137133, 2.388216, 1, 1, 1, 1, 1,
1.103649, 0.388972, 1.153027, 1, 1, 1, 1, 1,
1.106754, 0.6024421, 0.8258929, 1, 1, 1, 1, 1,
1.117915, 0.6623643, 2.220966, 1, 1, 1, 1, 1,
1.118618, 0.06794592, 2.437118, 0, 0, 1, 1, 1,
1.125724, -0.7483858, 3.877846, 1, 0, 0, 1, 1,
1.128516, -0.7928433, 1.738649, 1, 0, 0, 1, 1,
1.129859, -1.129671, 3.441414, 1, 0, 0, 1, 1,
1.134038, 0.9862131, 0.6323365, 1, 0, 0, 1, 1,
1.134262, 0.432554, 0.4841597, 1, 0, 0, 1, 1,
1.137727, 0.191462, -1.085342, 0, 0, 0, 1, 1,
1.13826, -2.014795, 1.899498, 0, 0, 0, 1, 1,
1.14844, -0.5254491, 1.040565, 0, 0, 0, 1, 1,
1.151106, 1.375773, 0.9537022, 0, 0, 0, 1, 1,
1.161487, -0.02529401, 0.8085665, 0, 0, 0, 1, 1,
1.169272, -2.308918, 4.229353, 0, 0, 0, 1, 1,
1.179939, 0.7967332, 0.1941416, 0, 0, 0, 1, 1,
1.180195, 0.5748157, -1.26774, 1, 1, 1, 1, 1,
1.184481, 1.020996, 2.416134, 1, 1, 1, 1, 1,
1.194165, -0.720788, 0.9353164, 1, 1, 1, 1, 1,
1.194832, 0.8700516, 0.9425287, 1, 1, 1, 1, 1,
1.197828, -0.9170505, 0.8916356, 1, 1, 1, 1, 1,
1.206435, 0.3577555, 2.815405, 1, 1, 1, 1, 1,
1.210287, -2.210768, 2.962942, 1, 1, 1, 1, 1,
1.216087, 0.4822463, 1.26729, 1, 1, 1, 1, 1,
1.222807, 0.9341215, 2.390645, 1, 1, 1, 1, 1,
1.227826, 0.5223258, 2.510976, 1, 1, 1, 1, 1,
1.23506, 0.1883928, 1.393053, 1, 1, 1, 1, 1,
1.238437, -1.181374, 2.862513, 1, 1, 1, 1, 1,
1.246353, 0.755552, -1.451261, 1, 1, 1, 1, 1,
1.252446, 0.8300906, 0.1249359, 1, 1, 1, 1, 1,
1.259767, 0.8999859, -1.485917, 1, 1, 1, 1, 1,
1.261066, 0.0585997, 1.088885, 0, 0, 1, 1, 1,
1.270269, 0.4021233, 2.161288, 1, 0, 0, 1, 1,
1.271214, -1.533705, 3.124798, 1, 0, 0, 1, 1,
1.279197, 1.234088, 1.568856, 1, 0, 0, 1, 1,
1.284143, 0.9385062, 1.835203, 1, 0, 0, 1, 1,
1.285397, -1.424388, 1.294091, 1, 0, 0, 1, 1,
1.285607, 1.064976, -0.2319542, 0, 0, 0, 1, 1,
1.287328, 1.110529, 1.951967, 0, 0, 0, 1, 1,
1.288688, 1.280323, 1.817611, 0, 0, 0, 1, 1,
1.292307, 0.8959593, 0.8562891, 0, 0, 0, 1, 1,
1.298773, -1.433155, 1.354843, 0, 0, 0, 1, 1,
1.308589, -3.420306, 2.004038, 0, 0, 0, 1, 1,
1.308917, 2.132619, 0.5699457, 0, 0, 0, 1, 1,
1.310472, -1.166388, 2.900345, 1, 1, 1, 1, 1,
1.313176, 0.816138, -0.2247034, 1, 1, 1, 1, 1,
1.321351, -0.5053108, 2.321916, 1, 1, 1, 1, 1,
1.341038, -0.8377377, 2.315451, 1, 1, 1, 1, 1,
1.363636, 1.244596, 2.504028, 1, 1, 1, 1, 1,
1.372466, -0.2150742, 2.39423, 1, 1, 1, 1, 1,
1.374936, 0.06045011, 0.686892, 1, 1, 1, 1, 1,
1.382506, 1.662979, 0.8320995, 1, 1, 1, 1, 1,
1.383058, 0.07079986, 2.410037, 1, 1, 1, 1, 1,
1.39228, 0.3291909, 0.407899, 1, 1, 1, 1, 1,
1.395967, 1.613352, 2.043864, 1, 1, 1, 1, 1,
1.399915, -0.1134015, 3.039255, 1, 1, 1, 1, 1,
1.411972, -3.174672, 2.666928, 1, 1, 1, 1, 1,
1.417787, -2.038921, 2.972473, 1, 1, 1, 1, 1,
1.422686, -1.762891, 2.140645, 1, 1, 1, 1, 1,
1.428223, 0.5032129, 0.2495031, 0, 0, 1, 1, 1,
1.440119, 1.14455, 0.8198937, 1, 0, 0, 1, 1,
1.455269, 0.03220949, 3.337679, 1, 0, 0, 1, 1,
1.480358, 1.016086, -0.1832005, 1, 0, 0, 1, 1,
1.491627, -1.632887, 2.235603, 1, 0, 0, 1, 1,
1.493578, 0.0908493, 1.369837, 1, 0, 0, 1, 1,
1.501849, 0.103647, 1.991383, 0, 0, 0, 1, 1,
1.505239, 2.582501, -0.1156447, 0, 0, 0, 1, 1,
1.512421, -1.66875, 1.543895, 0, 0, 0, 1, 1,
1.515617, 0.1947959, 2.717309, 0, 0, 0, 1, 1,
1.519931, -1.677311, 4.693431, 0, 0, 0, 1, 1,
1.523421, -1.022922, 2.590908, 0, 0, 0, 1, 1,
1.534601, -0.3559766, 1.730511, 0, 0, 0, 1, 1,
1.535206, -0.1534821, -0.1001703, 1, 1, 1, 1, 1,
1.547463, -1.631602, 1.499133, 1, 1, 1, 1, 1,
1.547937, 0.1251031, 1.328296, 1, 1, 1, 1, 1,
1.553596, -0.1344533, 1.510656, 1, 1, 1, 1, 1,
1.553821, -0.2611338, 2.060709, 1, 1, 1, 1, 1,
1.554747, -0.2057395, 1.926935, 1, 1, 1, 1, 1,
1.560094, 0.167067, 0.8473324, 1, 1, 1, 1, 1,
1.578873, -0.4703777, 2.070286, 1, 1, 1, 1, 1,
1.591619, -0.7340367, 2.715822, 1, 1, 1, 1, 1,
1.623677, -2.029319, 2.159909, 1, 1, 1, 1, 1,
1.627694, 0.5337288, 0.399022, 1, 1, 1, 1, 1,
1.630007, 0.2605298, 2.096838, 1, 1, 1, 1, 1,
1.637144, -0.4365239, 2.606805, 1, 1, 1, 1, 1,
1.643201, 2.601442, 0.9325285, 1, 1, 1, 1, 1,
1.670594, 0.656876, 0.1989295, 1, 1, 1, 1, 1,
1.675166, -1.014038, 2.145099, 0, 0, 1, 1, 1,
1.683158, 0.3343115, 2.173949, 1, 0, 0, 1, 1,
1.685035, 1.48988, 0.2338036, 1, 0, 0, 1, 1,
1.685843, 1.013792, -0.6785849, 1, 0, 0, 1, 1,
1.693369, 0.5854628, 0.6041895, 1, 0, 0, 1, 1,
1.695005, -0.104042, 2.609602, 1, 0, 0, 1, 1,
1.702983, 1.060098, -0.09533215, 0, 0, 0, 1, 1,
1.723909, 0.9726186, 1.161433, 0, 0, 0, 1, 1,
1.727042, -0.3804109, 0.8781364, 0, 0, 0, 1, 1,
1.740069, -0.34707, 1.214384, 0, 0, 0, 1, 1,
1.757776, -0.1365887, 3.089597, 0, 0, 0, 1, 1,
1.760973, -0.4873829, 3.229849, 0, 0, 0, 1, 1,
1.761162, 0.1039085, 2.075275, 0, 0, 0, 1, 1,
1.768566, -3.154571, 3.207059, 1, 1, 1, 1, 1,
1.768934, 1.796698, 1.74991, 1, 1, 1, 1, 1,
1.800264, 1.828087, -0.5710922, 1, 1, 1, 1, 1,
1.805915, -0.5871937, 2.218363, 1, 1, 1, 1, 1,
1.850943, 0.143627, 1.346944, 1, 1, 1, 1, 1,
1.858728, 1.828297, 2.10327, 1, 1, 1, 1, 1,
1.862347, 1.480412, 0.484495, 1, 1, 1, 1, 1,
1.877759, -0.2163046, 1.490241, 1, 1, 1, 1, 1,
1.880098, 0.3109523, -0.0493292, 1, 1, 1, 1, 1,
1.88028, 1.950583, 0.9853447, 1, 1, 1, 1, 1,
1.898425, -0.4220681, 1.282763, 1, 1, 1, 1, 1,
1.906248, 1.393086, 0.2206068, 1, 1, 1, 1, 1,
1.917849, 1.484994, 0.3197739, 1, 1, 1, 1, 1,
1.926348, -1.30236, 2.663713, 1, 1, 1, 1, 1,
1.942252, 0.5959229, 0.7211583, 1, 1, 1, 1, 1,
1.947841, 0.01940737, -0.400171, 0, 0, 1, 1, 1,
1.958811, -0.3062426, 0.744073, 1, 0, 0, 1, 1,
1.976544, 0.2353095, -0.24362, 1, 0, 0, 1, 1,
2.00632, -0.0005725782, 1.789458, 1, 0, 0, 1, 1,
2.04661, 1.755932, 1.870235, 1, 0, 0, 1, 1,
2.081398, 0.6864758, 1.550657, 1, 0, 0, 1, 1,
2.160745, 1.701797, 0.5529047, 0, 0, 0, 1, 1,
2.308447, -0.5749021, 3.825454, 0, 0, 0, 1, 1,
2.313602, -1.083441, 3.716716, 0, 0, 0, 1, 1,
2.327085, -1.516936, 5.464621, 0, 0, 0, 1, 1,
2.421388, -0.5600903, 1.734084, 0, 0, 0, 1, 1,
2.444159, -1.10667, 1.478362, 0, 0, 0, 1, 1,
2.448856, 0.02055703, 1.020877, 0, 0, 0, 1, 1,
2.456262, 1.908831, 2.1895, 1, 1, 1, 1, 1,
2.512235, 1.083806, 0.8840662, 1, 1, 1, 1, 1,
2.67256, 1.483571, 0.2986089, 1, 1, 1, 1, 1,
2.680108, -0.7395414, 2.088811, 1, 1, 1, 1, 1,
2.768808, 0.2111208, 1.838992, 1, 1, 1, 1, 1,
2.775872, -0.9941538, 2.171758, 1, 1, 1, 1, 1,
2.817929, 0.129626, 1.638995, 1, 1, 1, 1, 1
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
var radius = 9.616708;
var distance = 33.77828;
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
mvMatrix.translate( 0.3291463, 0.190217, -0.1472259 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.77828);
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
