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
-3.195183, -0.365005, -1.030677, 1, 0, 0, 1,
-3.056349, 0.309319, -1.290118, 1, 0.007843138, 0, 1,
-2.836143, -1.17408, -1.696584, 1, 0.01176471, 0, 1,
-2.594996, -0.504918, -2.310895, 1, 0.01960784, 0, 1,
-2.476344, 2.221905, -1.022417, 1, 0.02352941, 0, 1,
-2.464108, -0.1863979, -1.748949, 1, 0.03137255, 0, 1,
-2.451962, 1.162919, -0.04819044, 1, 0.03529412, 0, 1,
-2.438711, 0.5327474, -3.328366, 1, 0.04313726, 0, 1,
-2.291888, 1.443635, -0.9296684, 1, 0.04705882, 0, 1,
-2.288157, -0.02413827, -0.666612, 1, 0.05490196, 0, 1,
-2.286771, 0.8756114, 0.3733925, 1, 0.05882353, 0, 1,
-2.258967, -1.487319, -2.789124, 1, 0.06666667, 0, 1,
-2.186371, -0.02519791, -3.60631, 1, 0.07058824, 0, 1,
-2.172924, -0.938733, -2.572355, 1, 0.07843138, 0, 1,
-2.138833, -1.05564, -1.021364, 1, 0.08235294, 0, 1,
-2.116827, 0.3456878, -2.323436, 1, 0.09019608, 0, 1,
-2.085798, 0.1087184, -2.638336, 1, 0.09411765, 0, 1,
-2.066874, 0.5106027, -2.560754, 1, 0.1019608, 0, 1,
-2.06381, -1.013094, -3.297083, 1, 0.1098039, 0, 1,
-2.042109, -0.1454106, -2.671323, 1, 0.1137255, 0, 1,
-2.020079, 0.181607, -1.939028, 1, 0.1215686, 0, 1,
-2.014317, -0.6044124, -2.793549, 1, 0.1254902, 0, 1,
-1.994371, -1.473934, -2.616157, 1, 0.1333333, 0, 1,
-1.979388, -0.5449446, -1.356036, 1, 0.1372549, 0, 1,
-1.938918, -0.6437544, -1.254729, 1, 0.145098, 0, 1,
-1.934977, -1.264388, -3.188887, 1, 0.1490196, 0, 1,
-1.922048, 2.078839, 1.213812, 1, 0.1568628, 0, 1,
-1.921925, 1.183425, -2.870036, 1, 0.1607843, 0, 1,
-1.913702, 0.3016152, -0.6868097, 1, 0.1686275, 0, 1,
-1.913265, -0.9008665, -2.928861, 1, 0.172549, 0, 1,
-1.910174, -0.4242626, -0.864744, 1, 0.1803922, 0, 1,
-1.884142, 1.263583, -1.209163, 1, 0.1843137, 0, 1,
-1.854114, 2.080132, -1.598088, 1, 0.1921569, 0, 1,
-1.848062, -0.2249947, -1.956563, 1, 0.1960784, 0, 1,
-1.828977, -2.719086, -0.9768154, 1, 0.2039216, 0, 1,
-1.819429, 1.569489, 0.2511859, 1, 0.2117647, 0, 1,
-1.787906, -0.2953763, -2.043177, 1, 0.2156863, 0, 1,
-1.787476, 0.1298746, -1.184078, 1, 0.2235294, 0, 1,
-1.777537, 0.6850175, -1.080599, 1, 0.227451, 0, 1,
-1.773264, 0.5347528, -3.45962, 1, 0.2352941, 0, 1,
-1.769033, 1.27233, -0.8731139, 1, 0.2392157, 0, 1,
-1.747912, 0.7311915, -0.3190503, 1, 0.2470588, 0, 1,
-1.725635, 1.905813, -0.1677474, 1, 0.2509804, 0, 1,
-1.723361, -0.06458701, -2.718155, 1, 0.2588235, 0, 1,
-1.720109, -0.8430047, -2.820872, 1, 0.2627451, 0, 1,
-1.719715, -0.02166475, -2.158931, 1, 0.2705882, 0, 1,
-1.715234, -0.5340443, -1.738565, 1, 0.2745098, 0, 1,
-1.697587, 1.57461, -0.6067043, 1, 0.282353, 0, 1,
-1.696652, 0.3186129, -0.7192134, 1, 0.2862745, 0, 1,
-1.695163, -0.2367361, -1.910658, 1, 0.2941177, 0, 1,
-1.683841, -0.9835106, -3.122444, 1, 0.3019608, 0, 1,
-1.680794, -0.1411863, -3.368927, 1, 0.3058824, 0, 1,
-1.674218, -0.737513, -0.3812385, 1, 0.3137255, 0, 1,
-1.67304, -0.7527993, -1.001479, 1, 0.3176471, 0, 1,
-1.668792, 1.145346, 0.6335219, 1, 0.3254902, 0, 1,
-1.660267, 1.874623, -1.127335, 1, 0.3294118, 0, 1,
-1.653756, -1.100222, -1.690275, 1, 0.3372549, 0, 1,
-1.638123, 0.7454334, -1.17679, 1, 0.3411765, 0, 1,
-1.633, -0.156105, -2.061631, 1, 0.3490196, 0, 1,
-1.631278, 0.0849985, 0.5494336, 1, 0.3529412, 0, 1,
-1.618928, 0.1369338, -2.417418, 1, 0.3607843, 0, 1,
-1.615737, -0.6431199, -1.867284, 1, 0.3647059, 0, 1,
-1.61432, 1.08387, -0.2842026, 1, 0.372549, 0, 1,
-1.606207, -0.5756259, -0.4547857, 1, 0.3764706, 0, 1,
-1.599375, -2.295042, 0.001981904, 1, 0.3843137, 0, 1,
-1.5825, 0.1187015, -1.381934, 1, 0.3882353, 0, 1,
-1.579522, 0.5707433, -0.4975447, 1, 0.3960784, 0, 1,
-1.575737, 1.196239, -0.655565, 1, 0.4039216, 0, 1,
-1.573622, 2.425145, -0.159645, 1, 0.4078431, 0, 1,
-1.572603, 1.350303, -1.42518, 1, 0.4156863, 0, 1,
-1.556374, 0.1187161, -0.227034, 1, 0.4196078, 0, 1,
-1.540494, -0.04443359, -1.325332, 1, 0.427451, 0, 1,
-1.536422, -1.222068, -2.502318, 1, 0.4313726, 0, 1,
-1.531702, -3.05625, -3.408566, 1, 0.4392157, 0, 1,
-1.514672, 0.0754663, -0.7757599, 1, 0.4431373, 0, 1,
-1.508874, -0.854856, -2.126588, 1, 0.4509804, 0, 1,
-1.503914, -0.4159595, -0.9530923, 1, 0.454902, 0, 1,
-1.498648, -0.7757528, -3.178684, 1, 0.4627451, 0, 1,
-1.496725, 0.7623425, -2.138253, 1, 0.4666667, 0, 1,
-1.490195, 1.275565, -0.784611, 1, 0.4745098, 0, 1,
-1.484156, 0.2835658, 1.611832, 1, 0.4784314, 0, 1,
-1.483887, -0.8184202, -1.550529, 1, 0.4862745, 0, 1,
-1.481002, 1.007044, -1.340201, 1, 0.4901961, 0, 1,
-1.476129, -1.705518, -1.710431, 1, 0.4980392, 0, 1,
-1.470104, 2.045907, -1.420376, 1, 0.5058824, 0, 1,
-1.463882, 1.340108, -0.768748, 1, 0.509804, 0, 1,
-1.461405, 1.348547, -1.573349, 1, 0.5176471, 0, 1,
-1.460273, 0.5345807, -0.8152164, 1, 0.5215687, 0, 1,
-1.451344, -1.294653, -1.767583, 1, 0.5294118, 0, 1,
-1.44113, 1.288306, -0.972488, 1, 0.5333334, 0, 1,
-1.429464, -2.113693, -4.290278, 1, 0.5411765, 0, 1,
-1.424166, -0.2108186, 1.37545, 1, 0.5450981, 0, 1,
-1.410287, -1.875518, -1.758432, 1, 0.5529412, 0, 1,
-1.407218, 0.2645452, -0.5278235, 1, 0.5568628, 0, 1,
-1.402753, -0.495546, -0.4499271, 1, 0.5647059, 0, 1,
-1.400221, 0.4128945, -1.259756, 1, 0.5686275, 0, 1,
-1.397235, -0.1333801, -0.1247929, 1, 0.5764706, 0, 1,
-1.388518, 1.121911, -1.273279, 1, 0.5803922, 0, 1,
-1.33959, -0.05700933, -1.596649, 1, 0.5882353, 0, 1,
-1.318486, 0.5483823, -0.5303186, 1, 0.5921569, 0, 1,
-1.308509, -0.3865278, -1.78676, 1, 0.6, 0, 1,
-1.306594, -0.1587543, -3.272748, 1, 0.6078432, 0, 1,
-1.295003, -0.228238, -1.615414, 1, 0.6117647, 0, 1,
-1.286707, -0.3154288, -1.346387, 1, 0.6196079, 0, 1,
-1.28536, -0.328264, -2.965145, 1, 0.6235294, 0, 1,
-1.260542, -1.163436, -2.371637, 1, 0.6313726, 0, 1,
-1.256548, -1.022466, -2.54112, 1, 0.6352941, 0, 1,
-1.246047, 1.707899, -1.075925, 1, 0.6431373, 0, 1,
-1.243962, 0.5961477, -2.063694, 1, 0.6470588, 0, 1,
-1.231705, -0.4368965, -1.310291, 1, 0.654902, 0, 1,
-1.226534, -0.3345004, -1.075598, 1, 0.6588235, 0, 1,
-1.224829, 0.1887607, -1.080481, 1, 0.6666667, 0, 1,
-1.223446, 1.191179, -0.4085509, 1, 0.6705883, 0, 1,
-1.219077, -1.357862, -2.125196, 1, 0.6784314, 0, 1,
-1.218103, -1.016002, -2.503193, 1, 0.682353, 0, 1,
-1.211875, -1.11502, -2.023203, 1, 0.6901961, 0, 1,
-1.202444, 0.2338582, -1.626208, 1, 0.6941177, 0, 1,
-1.200817, -1.898203, -3.03512, 1, 0.7019608, 0, 1,
-1.198869, 0.634806, -1.729542, 1, 0.7098039, 0, 1,
-1.198367, -0.298493, -3.998082, 1, 0.7137255, 0, 1,
-1.198172, 0.06403095, -2.494883, 1, 0.7215686, 0, 1,
-1.197616, 0.04352026, 0.5040761, 1, 0.7254902, 0, 1,
-1.182226, 0.6768402, -2.104836, 1, 0.7333333, 0, 1,
-1.180416, 0.6513209, -2.693214, 1, 0.7372549, 0, 1,
-1.169818, -0.524211, -0.4283085, 1, 0.7450981, 0, 1,
-1.168251, -1.798143, -3.520007, 1, 0.7490196, 0, 1,
-1.166014, 0.6071871, -0.04943042, 1, 0.7568628, 0, 1,
-1.152324, -0.950056, -1.288342, 1, 0.7607843, 0, 1,
-1.145115, 0.62075, 0.1738338, 1, 0.7686275, 0, 1,
-1.14431, -0.7232184, -2.115415, 1, 0.772549, 0, 1,
-1.144255, 0.0416795, -3.645665, 1, 0.7803922, 0, 1,
-1.12506, 0.7094483, -1.243949, 1, 0.7843137, 0, 1,
-1.124001, -0.2774894, -1.274682, 1, 0.7921569, 0, 1,
-1.111971, -0.1622152, -1.917641, 1, 0.7960784, 0, 1,
-1.110665, -0.5362864, -0.5769318, 1, 0.8039216, 0, 1,
-1.108693, 1.146761, -0.4901764, 1, 0.8117647, 0, 1,
-1.098153, -0.4361379, -2.292893, 1, 0.8156863, 0, 1,
-1.097265, 1.132398, 0.006556723, 1, 0.8235294, 0, 1,
-1.096728, -0.9027748, -3.144427, 1, 0.827451, 0, 1,
-1.089113, 1.390887, -1.291365, 1, 0.8352941, 0, 1,
-1.088732, -0.1452951, -3.471529, 1, 0.8392157, 0, 1,
-1.08494, 0.6934375, -1.184028, 1, 0.8470588, 0, 1,
-1.078097, 0.06321079, -0.2205441, 1, 0.8509804, 0, 1,
-1.075897, -0.4913131, -2.911822, 1, 0.8588235, 0, 1,
-1.06678, -0.8374144, -2.564649, 1, 0.8627451, 0, 1,
-1.064332, -0.4954517, 0.2167847, 1, 0.8705882, 0, 1,
-1.058664, 0.09465414, -2.288722, 1, 0.8745098, 0, 1,
-1.053908, -0.1037116, -1.544942, 1, 0.8823529, 0, 1,
-1.04348, -1.769371, -2.970395, 1, 0.8862745, 0, 1,
-1.035325, -1.017272, -3.575292, 1, 0.8941177, 0, 1,
-1.031822, 0.1346367, -0.2839514, 1, 0.8980392, 0, 1,
-1.030405, 0.253877, -1.222958, 1, 0.9058824, 0, 1,
-1.028709, -0.897961, -1.281157, 1, 0.9137255, 0, 1,
-1.026867, 0.1785427, -0.9642439, 1, 0.9176471, 0, 1,
-1.026001, -1.235811, -2.343456, 1, 0.9254902, 0, 1,
-1.02582, -0.4390037, -1.527576, 1, 0.9294118, 0, 1,
-1.025061, -1.403895, -3.313258, 1, 0.9372549, 0, 1,
-1.02505, -0.8112144, -2.330227, 1, 0.9411765, 0, 1,
-1.024277, 0.5237905, -1.078669, 1, 0.9490196, 0, 1,
-1.019932, 0.4704851, -0.8030745, 1, 0.9529412, 0, 1,
-1.014008, 0.2178265, -1.776207, 1, 0.9607843, 0, 1,
-1.005402, 1.859495, -0.4574347, 1, 0.9647059, 0, 1,
-1.001035, 0.07587653, -1.726996, 1, 0.972549, 0, 1,
-0.9980729, -0.09081174, -1.971236, 1, 0.9764706, 0, 1,
-0.9960182, -0.2629059, -2.482424, 1, 0.9843137, 0, 1,
-0.99307, -1.77723, -2.428045, 1, 0.9882353, 0, 1,
-0.9915929, -0.3529137, -2.98417, 1, 0.9960784, 0, 1,
-0.9890277, 0.6621473, 0.1689716, 0.9960784, 1, 0, 1,
-0.9886058, -0.103925, -0.1739009, 0.9921569, 1, 0, 1,
-0.9809215, -1.39409, -2.141205, 0.9843137, 1, 0, 1,
-0.9804217, 0.1424935, -0.3313216, 0.9803922, 1, 0, 1,
-0.9779226, 0.57008, -0.3411152, 0.972549, 1, 0, 1,
-0.9759818, 0.003701918, -0.4992408, 0.9686275, 1, 0, 1,
-0.9753107, -0.6031754, -2.146324, 0.9607843, 1, 0, 1,
-0.975123, 1.015793, -0.1455761, 0.9568627, 1, 0, 1,
-0.965699, -1.441903, -3.665706, 0.9490196, 1, 0, 1,
-0.9512538, 0.7279879, -1.356207, 0.945098, 1, 0, 1,
-0.9497018, 0.5965208, -2.475729, 0.9372549, 1, 0, 1,
-0.9467524, -0.5841175, -0.5998363, 0.9333333, 1, 0, 1,
-0.9442325, -1.568753, -2.37417, 0.9254902, 1, 0, 1,
-0.9438097, -0.8665013, -2.082878, 0.9215686, 1, 0, 1,
-0.9324124, -0.7666079, -2.692728, 0.9137255, 1, 0, 1,
-0.9320184, 0.4727023, -1.638451, 0.9098039, 1, 0, 1,
-0.9261213, 0.6681695, -0.2006974, 0.9019608, 1, 0, 1,
-0.9215981, -0.112947, -1.756341, 0.8941177, 1, 0, 1,
-0.9168568, -0.2925645, -2.048252, 0.8901961, 1, 0, 1,
-0.9111096, -2.337321, -1.536744, 0.8823529, 1, 0, 1,
-0.9081313, 1.068364, -0.9471082, 0.8784314, 1, 0, 1,
-0.9016405, 0.1824441, -1.268161, 0.8705882, 1, 0, 1,
-0.8912381, 0.7323334, -0.5674291, 0.8666667, 1, 0, 1,
-0.8838225, 0.2369789, -1.041388, 0.8588235, 1, 0, 1,
-0.8833375, -1.899589, -1.091746, 0.854902, 1, 0, 1,
-0.8788372, -0.1379922, -1.271217, 0.8470588, 1, 0, 1,
-0.8785964, -0.05901148, -2.68629, 0.8431373, 1, 0, 1,
-0.8736781, 0.6482937, -2.567394, 0.8352941, 1, 0, 1,
-0.8726833, 0.3863407, -0.6134369, 0.8313726, 1, 0, 1,
-0.8716895, -0.7738033, -3.71767, 0.8235294, 1, 0, 1,
-0.8716193, -0.1591689, 0.260403, 0.8196079, 1, 0, 1,
-0.8658538, 1.33652, -2.428556, 0.8117647, 1, 0, 1,
-0.8616642, -0.853087, -3.448256, 0.8078431, 1, 0, 1,
-0.8597603, -0.7850032, -4.29289, 0.8, 1, 0, 1,
-0.8567693, 0.2691655, -0.5122455, 0.7921569, 1, 0, 1,
-0.8496682, 0.2920472, -1.401254, 0.7882353, 1, 0, 1,
-0.8440084, 0.7474305, 0.1198158, 0.7803922, 1, 0, 1,
-0.8408239, 0.1750562, -0.5681642, 0.7764706, 1, 0, 1,
-0.8370637, -0.3668911, -0.7301438, 0.7686275, 1, 0, 1,
-0.836817, 0.7601665, -1.652414, 0.7647059, 1, 0, 1,
-0.8301422, -0.5287963, -2.601361, 0.7568628, 1, 0, 1,
-0.8285843, -0.9063422, -2.715957, 0.7529412, 1, 0, 1,
-0.8279655, -0.9529632, -3.869831, 0.7450981, 1, 0, 1,
-0.8212086, -0.4591807, -4.174296, 0.7411765, 1, 0, 1,
-0.8195006, -0.6809085, -3.10544, 0.7333333, 1, 0, 1,
-0.8184527, -1.32921, -2.834434, 0.7294118, 1, 0, 1,
-0.8178314, 0.5990888, -0.008607776, 0.7215686, 1, 0, 1,
-0.8175755, -0.1380645, -2.356801, 0.7176471, 1, 0, 1,
-0.8155727, -0.8432604, -4.262405, 0.7098039, 1, 0, 1,
-0.8126897, -1.475221, -0.4288283, 0.7058824, 1, 0, 1,
-0.808441, -1.624601, -3.833532, 0.6980392, 1, 0, 1,
-0.8038535, -1.738184, -1.135907, 0.6901961, 1, 0, 1,
-0.7975876, -1.045127, -2.469908, 0.6862745, 1, 0, 1,
-0.795724, 0.7071409, 1.538756, 0.6784314, 1, 0, 1,
-0.7953302, -0.788901, -1.842074, 0.6745098, 1, 0, 1,
-0.7941259, 0.1947441, -1.740145, 0.6666667, 1, 0, 1,
-0.7903404, -2.302686, -1.698548, 0.6627451, 1, 0, 1,
-0.7797924, 1.139681, -0.6471464, 0.654902, 1, 0, 1,
-0.7767985, 0.3330114, -1.166699, 0.6509804, 1, 0, 1,
-0.773001, 0.1045801, -2.013138, 0.6431373, 1, 0, 1,
-0.7705356, 0.8555232, -0.1158002, 0.6392157, 1, 0, 1,
-0.7569382, 0.176017, -1.562592, 0.6313726, 1, 0, 1,
-0.7551135, 0.3449065, -1.317746, 0.627451, 1, 0, 1,
-0.7539361, -0.1714669, -0.6422353, 0.6196079, 1, 0, 1,
-0.7530151, -0.4816532, -1.388136, 0.6156863, 1, 0, 1,
-0.7525064, 0.682417, -0.6815604, 0.6078432, 1, 0, 1,
-0.7522425, -2.59488, -1.796438, 0.6039216, 1, 0, 1,
-0.7503847, 0.5952764, -0.6673204, 0.5960785, 1, 0, 1,
-0.7476468, -0.269453, -1.8493, 0.5882353, 1, 0, 1,
-0.7453839, -2.699058, -1.620586, 0.5843138, 1, 0, 1,
-0.7423146, 0.9273323, 0.4337324, 0.5764706, 1, 0, 1,
-0.7348153, 0.0344226, -2.248505, 0.572549, 1, 0, 1,
-0.7310554, -0.3784807, -3.83378, 0.5647059, 1, 0, 1,
-0.729625, -0.4297007, -2.876078, 0.5607843, 1, 0, 1,
-0.7287557, 0.3242988, -1.363046, 0.5529412, 1, 0, 1,
-0.7266339, 0.8259616, 0.3077126, 0.5490196, 1, 0, 1,
-0.7247844, 0.6589351, -2.092116, 0.5411765, 1, 0, 1,
-0.7244631, -2.214439, -2.483591, 0.5372549, 1, 0, 1,
-0.7194411, 0.03883832, -1.435062, 0.5294118, 1, 0, 1,
-0.7176798, -0.3582543, -0.3510635, 0.5254902, 1, 0, 1,
-0.7038599, -0.8664437, -1.001194, 0.5176471, 1, 0, 1,
-0.7024975, 1.481523, -1.244111, 0.5137255, 1, 0, 1,
-0.7019389, 0.5566136, -0.582353, 0.5058824, 1, 0, 1,
-0.7010787, 2.014029, -1.457216, 0.5019608, 1, 0, 1,
-0.700841, 0.7373413, -0.881389, 0.4941176, 1, 0, 1,
-0.7004318, -0.6422014, -1.327176, 0.4862745, 1, 0, 1,
-0.6992867, -1.384616, -3.441808, 0.4823529, 1, 0, 1,
-0.6987956, -0.8507149, -2.396261, 0.4745098, 1, 0, 1,
-0.6938189, 1.014733, -0.7342143, 0.4705882, 1, 0, 1,
-0.6925521, -1.831173, -4.27974, 0.4627451, 1, 0, 1,
-0.6895003, 1.847368, -0.7241885, 0.4588235, 1, 0, 1,
-0.6835802, 0.04961203, -2.047446, 0.4509804, 1, 0, 1,
-0.6799336, -1.299709, -1.633377, 0.4470588, 1, 0, 1,
-0.6755984, 0.886833, -0.5829559, 0.4392157, 1, 0, 1,
-0.6750739, -0.06105262, -0.9036213, 0.4352941, 1, 0, 1,
-0.6731612, -0.6758078, -2.264391, 0.427451, 1, 0, 1,
-0.6724136, 0.01383647, -0.4990247, 0.4235294, 1, 0, 1,
-0.6678326, -0.4515722, -1.011501, 0.4156863, 1, 0, 1,
-0.6678129, 0.2363116, -1.321699, 0.4117647, 1, 0, 1,
-0.6628122, 0.6359763, -1.484372, 0.4039216, 1, 0, 1,
-0.6621374, -0.6437963, -2.437863, 0.3960784, 1, 0, 1,
-0.6574413, -0.3067751, -3.723237, 0.3921569, 1, 0, 1,
-0.6565912, -0.2399901, -2.205525, 0.3843137, 1, 0, 1,
-0.6558467, -0.4239518, -0.5309724, 0.3803922, 1, 0, 1,
-0.6433256, 1.263291, -1.490669, 0.372549, 1, 0, 1,
-0.6356242, 0.9832913, 0.4404264, 0.3686275, 1, 0, 1,
-0.634999, -0.006487252, -0.3156633, 0.3607843, 1, 0, 1,
-0.631636, 0.1672467, 0.08344636, 0.3568628, 1, 0, 1,
-0.6298375, 0.359643, -0.5845468, 0.3490196, 1, 0, 1,
-0.6281776, 0.1773015, -1.235232, 0.345098, 1, 0, 1,
-0.6261312, -1.076325, -1.508163, 0.3372549, 1, 0, 1,
-0.6243396, -1.336623, -1.202124, 0.3333333, 1, 0, 1,
-0.6227427, 1.032934, -0.3648491, 0.3254902, 1, 0, 1,
-0.6216535, 0.3714086, -2.454949, 0.3215686, 1, 0, 1,
-0.6192728, -0.6720079, -1.7384, 0.3137255, 1, 0, 1,
-0.6186574, -0.8744276, -3.387422, 0.3098039, 1, 0, 1,
-0.6183797, -1.836694, -1.692951, 0.3019608, 1, 0, 1,
-0.614423, -1.437852, -2.854867, 0.2941177, 1, 0, 1,
-0.6134529, 1.603026, 0.6184283, 0.2901961, 1, 0, 1,
-0.6066863, 0.863727, -3.410071, 0.282353, 1, 0, 1,
-0.5999961, 0.01071566, -0.2227059, 0.2784314, 1, 0, 1,
-0.5978844, 0.7853133, -2.405462, 0.2705882, 1, 0, 1,
-0.5955479, -1.124652, -3.328476, 0.2666667, 1, 0, 1,
-0.5934712, -1.529502, -0.4921695, 0.2588235, 1, 0, 1,
-0.5928137, 0.1243913, -0.5357018, 0.254902, 1, 0, 1,
-0.5904132, -0.3523833, -2.453642, 0.2470588, 1, 0, 1,
-0.5901442, 0.2090115, -0.5911347, 0.2431373, 1, 0, 1,
-0.5875554, 0.7170984, -1.059001, 0.2352941, 1, 0, 1,
-0.582964, 1.334949, -0.04846926, 0.2313726, 1, 0, 1,
-0.5763105, 1.086774, -0.5878495, 0.2235294, 1, 0, 1,
-0.574349, 1.127517, 0.8394254, 0.2196078, 1, 0, 1,
-0.5714087, 0.281577, -0.9449413, 0.2117647, 1, 0, 1,
-0.5697111, -1.503366, -3.053995, 0.2078431, 1, 0, 1,
-0.5654246, -0.305151, -2.001784, 0.2, 1, 0, 1,
-0.5636135, 0.741194, -0.9634473, 0.1921569, 1, 0, 1,
-0.5588506, -0.1711675, -3.04166, 0.1882353, 1, 0, 1,
-0.5573954, -0.07834136, -0.8217781, 0.1803922, 1, 0, 1,
-0.5559704, -1.432043, -2.562582, 0.1764706, 1, 0, 1,
-0.5551278, -0.2850395, -2.846069, 0.1686275, 1, 0, 1,
-0.5502142, 0.9235656, -0.455442, 0.1647059, 1, 0, 1,
-0.5450185, 0.427082, -0.2126361, 0.1568628, 1, 0, 1,
-0.5444167, 1.143757, -0.04148357, 0.1529412, 1, 0, 1,
-0.5353186, 0.5324909, 0.4403423, 0.145098, 1, 0, 1,
-0.5267565, 0.2468131, -2.13695, 0.1411765, 1, 0, 1,
-0.5203577, 0.3484839, -1.830079, 0.1333333, 1, 0, 1,
-0.5193322, -0.6284966, -2.179042, 0.1294118, 1, 0, 1,
-0.5168756, 0.3921004, -0.4526873, 0.1215686, 1, 0, 1,
-0.5117621, -0.7178035, -3.113844, 0.1176471, 1, 0, 1,
-0.5103959, 1.241077, -1.600404, 0.1098039, 1, 0, 1,
-0.5094019, 0.8775636, 0.7522376, 0.1058824, 1, 0, 1,
-0.5089942, 1.43097, -0.5165536, 0.09803922, 1, 0, 1,
-0.5088382, 0.5324385, -1.150874, 0.09019608, 1, 0, 1,
-0.5080253, 0.4314112, -0.4094214, 0.08627451, 1, 0, 1,
-0.5000911, 0.06227558, -1.848916, 0.07843138, 1, 0, 1,
-0.4982874, -0.43808, -3.050816, 0.07450981, 1, 0, 1,
-0.4958058, 0.6954612, -0.4149812, 0.06666667, 1, 0, 1,
-0.4955422, -1.982737, -1.693797, 0.0627451, 1, 0, 1,
-0.4939331, -1.142019, -3.924333, 0.05490196, 1, 0, 1,
-0.4892976, -1.289283, -3.325024, 0.05098039, 1, 0, 1,
-0.4891978, 0.009324489, -2.267719, 0.04313726, 1, 0, 1,
-0.4813659, 0.9172139, -1.203299, 0.03921569, 1, 0, 1,
-0.4770963, -0.4838106, -3.711353, 0.03137255, 1, 0, 1,
-0.4759821, -0.3355512, -0.7235901, 0.02745098, 1, 0, 1,
-0.4743742, 0.2512715, -1.419127, 0.01960784, 1, 0, 1,
-0.4724344, 1.452535, -0.4984661, 0.01568628, 1, 0, 1,
-0.4686882, 0.3989504, -0.7745554, 0.007843138, 1, 0, 1,
-0.4652467, -0.4683849, -2.164065, 0.003921569, 1, 0, 1,
-0.4633978, 0.5788572, -2.223426, 0, 1, 0.003921569, 1,
-0.4569481, 0.1628463, -0.2813578, 0, 1, 0.01176471, 1,
-0.4545852, -0.1157736, 0.220986, 0, 1, 0.01568628, 1,
-0.4523503, 0.4506311, -0.159814, 0, 1, 0.02352941, 1,
-0.4516681, -1.407029, -4.524164, 0, 1, 0.02745098, 1,
-0.4363679, 1.179791, -0.1282659, 0, 1, 0.03529412, 1,
-0.4344974, 0.5718049, 0.7952179, 0, 1, 0.03921569, 1,
-0.4331979, -1.144712, -2.986471, 0, 1, 0.04705882, 1,
-0.4299121, 1.058799, -0.2319123, 0, 1, 0.05098039, 1,
-0.4286713, -1.861567, -3.072588, 0, 1, 0.05882353, 1,
-0.4267179, 0.3309281, -1.524778, 0, 1, 0.0627451, 1,
-0.4259079, 0.6910778, -0.4973686, 0, 1, 0.07058824, 1,
-0.4223541, -0.873941, -1.680696, 0, 1, 0.07450981, 1,
-0.4215724, 0.8427626, 0.4008802, 0, 1, 0.08235294, 1,
-0.4201027, -0.7516533, -3.069395, 0, 1, 0.08627451, 1,
-0.4170867, -0.2396142, -3.009101, 0, 1, 0.09411765, 1,
-0.4154195, 0.2654676, -1.174634, 0, 1, 0.1019608, 1,
-0.399483, -1.320611, -4.139588, 0, 1, 0.1058824, 1,
-0.3941706, 0.2359505, -1.477857, 0, 1, 0.1137255, 1,
-0.3937877, 0.337747, 0.5469036, 0, 1, 0.1176471, 1,
-0.3935635, 0.6685843, -1.063229, 0, 1, 0.1254902, 1,
-0.3926764, 0.6054786, -0.2338702, 0, 1, 0.1294118, 1,
-0.3879176, 0.2844546, 0.8846446, 0, 1, 0.1372549, 1,
-0.3835011, 0.05878887, -1.969907, 0, 1, 0.1411765, 1,
-0.3819202, 0.1600114, -3.45877, 0, 1, 0.1490196, 1,
-0.380955, -0.7464892, -3.765063, 0, 1, 0.1529412, 1,
-0.3808116, -1.117265, -2.939111, 0, 1, 0.1607843, 1,
-0.3806012, -0.5756538, -1.160903, 0, 1, 0.1647059, 1,
-0.3796674, -0.9904578, -1.965679, 0, 1, 0.172549, 1,
-0.3778537, -0.7968244, -3.56291, 0, 1, 0.1764706, 1,
-0.3777859, -0.6708047, -2.312714, 0, 1, 0.1843137, 1,
-0.3743453, 0.8958984, -1.984596, 0, 1, 0.1882353, 1,
-0.3738553, 1.504329, 0.6872303, 0, 1, 0.1960784, 1,
-0.3727983, -0.9565367, -3.818535, 0, 1, 0.2039216, 1,
-0.3706268, -1.239836, -4.094085, 0, 1, 0.2078431, 1,
-0.3695791, -0.9308615, -2.975791, 0, 1, 0.2156863, 1,
-0.3666906, 0.8709477, 0.4541194, 0, 1, 0.2196078, 1,
-0.3664827, -0.5009029, -2.853128, 0, 1, 0.227451, 1,
-0.3662902, -0.9396024, -3.537144, 0, 1, 0.2313726, 1,
-0.3633613, -1.239262, -3.638716, 0, 1, 0.2392157, 1,
-0.3617871, -0.1795402, -0.5130961, 0, 1, 0.2431373, 1,
-0.3590912, -0.816389, -5.925637, 0, 1, 0.2509804, 1,
-0.3571862, 1.316733, -0.9361817, 0, 1, 0.254902, 1,
-0.3568559, 0.814709, -1.349926, 0, 1, 0.2627451, 1,
-0.3545581, 0.5897996, -1.337399, 0, 1, 0.2666667, 1,
-0.3514626, 0.07730997, -1.651119, 0, 1, 0.2745098, 1,
-0.3500856, 0.7579454, -0.0139966, 0, 1, 0.2784314, 1,
-0.3498903, -0.9534716, -5.586896, 0, 1, 0.2862745, 1,
-0.3414313, -0.1274665, -1.046515, 0, 1, 0.2901961, 1,
-0.3396828, 0.6041539, -1.052325, 0, 1, 0.2980392, 1,
-0.3306997, -2.532057, -3.349623, 0, 1, 0.3058824, 1,
-0.3283921, 0.3082761, -0.50028, 0, 1, 0.3098039, 1,
-0.3260473, 0.2482449, 0.7805632, 0, 1, 0.3176471, 1,
-0.3256038, 0.7663786, -0.07250571, 0, 1, 0.3215686, 1,
-0.3247977, 0.1219369, -1.272796, 0, 1, 0.3294118, 1,
-0.3170211, -0.7554867, -2.46763, 0, 1, 0.3333333, 1,
-0.3150438, -2.368921, -3.991981, 0, 1, 0.3411765, 1,
-0.3125287, 0.4300467, 0.5108413, 0, 1, 0.345098, 1,
-0.3120314, -0.1540767, -2.153118, 0, 1, 0.3529412, 1,
-0.3112883, 1.27758, -0.7324627, 0, 1, 0.3568628, 1,
-0.3076858, 0.5425026, -0.3973453, 0, 1, 0.3647059, 1,
-0.3070497, 0.9139371, 0.5784478, 0, 1, 0.3686275, 1,
-0.3037959, 0.4058146, -1.19602, 0, 1, 0.3764706, 1,
-0.3008393, 0.5589241, 1.167994, 0, 1, 0.3803922, 1,
-0.2999246, -1.443329, -2.15696, 0, 1, 0.3882353, 1,
-0.2979032, 0.2730343, 0.7760864, 0, 1, 0.3921569, 1,
-0.2947322, 0.7988446, 0.3326694, 0, 1, 0.4, 1,
-0.2911503, -0.3252176, -3.481283, 0, 1, 0.4078431, 1,
-0.2903778, -1.085196, -1.958152, 0, 1, 0.4117647, 1,
-0.2863622, -0.605223, -2.956194, 0, 1, 0.4196078, 1,
-0.2850615, 0.7031386, 0.1079642, 0, 1, 0.4235294, 1,
-0.2839988, 2.263003, -0.7379315, 0, 1, 0.4313726, 1,
-0.2828339, 1.707714, -0.8850017, 0, 1, 0.4352941, 1,
-0.2826546, 2.258034, 0.5189455, 0, 1, 0.4431373, 1,
-0.2805147, -0.2119987, -1.872569, 0, 1, 0.4470588, 1,
-0.2795409, -1.247957, -2.058383, 0, 1, 0.454902, 1,
-0.2765516, 1.446068, -0.6738079, 0, 1, 0.4588235, 1,
-0.2761894, 0.5529304, 0.3774271, 0, 1, 0.4666667, 1,
-0.270345, -0.4407412, -4.825638, 0, 1, 0.4705882, 1,
-0.2697507, -1.908063, -3.448814, 0, 1, 0.4784314, 1,
-0.2676916, 0.4102209, 0.09543391, 0, 1, 0.4823529, 1,
-0.2676484, -1.252961, -2.464296, 0, 1, 0.4901961, 1,
-0.2600072, -0.2749282, -1.659854, 0, 1, 0.4941176, 1,
-0.2597303, -0.3394012, -3.927659, 0, 1, 0.5019608, 1,
-0.2567353, 0.8815643, -2.301998, 0, 1, 0.509804, 1,
-0.2561041, -0.01494406, -0.8094444, 0, 1, 0.5137255, 1,
-0.2548529, 0.3281754, 0.1023254, 0, 1, 0.5215687, 1,
-0.2510817, -0.1632667, -2.47366, 0, 1, 0.5254902, 1,
-0.2494452, 0.5637139, -0.3383199, 0, 1, 0.5333334, 1,
-0.2490845, -0.2755192, -2.215234, 0, 1, 0.5372549, 1,
-0.2486948, -0.0360113, -0.5187799, 0, 1, 0.5450981, 1,
-0.2485728, 0.6009871, -1.067763, 0, 1, 0.5490196, 1,
-0.2481344, -0.2630285, -3.133109, 0, 1, 0.5568628, 1,
-0.2464044, -0.9825405, -3.617669, 0, 1, 0.5607843, 1,
-0.2443041, -1.460449, -1.768277, 0, 1, 0.5686275, 1,
-0.2426706, 0.8811899, -0.1434588, 0, 1, 0.572549, 1,
-0.2402485, -1.349307, -2.158264, 0, 1, 0.5803922, 1,
-0.2392252, -1.0982, -4.155257, 0, 1, 0.5843138, 1,
-0.2389457, -1.353606, -3.923693, 0, 1, 0.5921569, 1,
-0.2364435, 0.9092509, 1.610405, 0, 1, 0.5960785, 1,
-0.2350571, 0.6670173, 0.3238477, 0, 1, 0.6039216, 1,
-0.2342539, 0.4522581, -0.6213096, 0, 1, 0.6117647, 1,
-0.2338209, -0.1732568, -1.958601, 0, 1, 0.6156863, 1,
-0.2303048, -0.6264961, -3.905408, 0, 1, 0.6235294, 1,
-0.2271586, 0.1723115, 0.3699522, 0, 1, 0.627451, 1,
-0.2215404, 1.12854, -0.6402261, 0, 1, 0.6352941, 1,
-0.2179475, -0.3434, -1.544699, 0, 1, 0.6392157, 1,
-0.2163074, 0.7307903, -0.628341, 0, 1, 0.6470588, 1,
-0.2156223, -0.8591717, -1.310762, 0, 1, 0.6509804, 1,
-0.2153527, 3.022831, -0.1238798, 0, 1, 0.6588235, 1,
-0.2022325, 0.3602199, -0.6268923, 0, 1, 0.6627451, 1,
-0.2020865, -1.856712, -4.104928, 0, 1, 0.6705883, 1,
-0.2018349, -0.4582786, -2.349185, 0, 1, 0.6745098, 1,
-0.1954844, 1.073575, -0.9047711, 0, 1, 0.682353, 1,
-0.1952661, 0.00778666, -1.196431, 0, 1, 0.6862745, 1,
-0.1886249, -1.956936, -2.338162, 0, 1, 0.6941177, 1,
-0.1849008, -0.866568, -2.582455, 0, 1, 0.7019608, 1,
-0.1795119, -0.8379283, -2.9766, 0, 1, 0.7058824, 1,
-0.1793124, -0.09181937, -1.064233, 0, 1, 0.7137255, 1,
-0.1706223, -1.239273, -5.331222, 0, 1, 0.7176471, 1,
-0.1697107, 0.5827341, -0.6456354, 0, 1, 0.7254902, 1,
-0.1669838, 1.819471, -0.9149912, 0, 1, 0.7294118, 1,
-0.1650551, 0.4748239, -1.339767, 0, 1, 0.7372549, 1,
-0.1636035, 0.3275766, -1.099518, 0, 1, 0.7411765, 1,
-0.1626532, 0.6657501, -0.3845453, 0, 1, 0.7490196, 1,
-0.1584488, -2.062364, -3.049899, 0, 1, 0.7529412, 1,
-0.1568183, 0.5236006, -1.124311, 0, 1, 0.7607843, 1,
-0.1528746, -1.349566, -3.604743, 0, 1, 0.7647059, 1,
-0.1496475, 0.5267224, -1.143844, 0, 1, 0.772549, 1,
-0.145605, -0.6020106, -3.935366, 0, 1, 0.7764706, 1,
-0.136347, 0.7008131, 1.478837, 0, 1, 0.7843137, 1,
-0.1357058, 0.9523289, 1.44216, 0, 1, 0.7882353, 1,
-0.1350702, -1.771451, -1.425724, 0, 1, 0.7960784, 1,
-0.1348398, 0.5867616, 0.9993073, 0, 1, 0.8039216, 1,
-0.1331923, -0.1911431, -3.462918, 0, 1, 0.8078431, 1,
-0.1317293, -0.1679154, -2.414607, 0, 1, 0.8156863, 1,
-0.130734, 0.2307117, -0.877918, 0, 1, 0.8196079, 1,
-0.1295533, -0.7650057, -2.587517, 0, 1, 0.827451, 1,
-0.1245011, 0.9309974, -0.4043757, 0, 1, 0.8313726, 1,
-0.1240079, -0.9961308, -3.877105, 0, 1, 0.8392157, 1,
-0.1086508, -1.695425, -2.766166, 0, 1, 0.8431373, 1,
-0.1085538, -0.3632151, -4.823434, 0, 1, 0.8509804, 1,
-0.1067626, -1.513256, -5.749361, 0, 1, 0.854902, 1,
-0.1065379, 0.4241329, -1.101397, 0, 1, 0.8627451, 1,
-0.1055346, -1.289107, -2.668737, 0, 1, 0.8666667, 1,
-0.1050994, -0.7462133, -2.418147, 0, 1, 0.8745098, 1,
-0.09895153, -0.2170469, -3.109895, 0, 1, 0.8784314, 1,
-0.09837525, 0.3167692, 0.1463902, 0, 1, 0.8862745, 1,
-0.09830974, 0.297934, 0.9079837, 0, 1, 0.8901961, 1,
-0.09629187, 0.7773026, 0.9150539, 0, 1, 0.8980392, 1,
-0.09555246, 0.3927128, -0.7158942, 0, 1, 0.9058824, 1,
-0.09331261, 0.3877113, -0.8521096, 0, 1, 0.9098039, 1,
-0.09093309, 1.350297, 0.5845249, 0, 1, 0.9176471, 1,
-0.08917322, 0.8025245, 1.413076, 0, 1, 0.9215686, 1,
-0.08084957, -2.160556, -2.884145, 0, 1, 0.9294118, 1,
-0.07604472, -0.5191324, -3.19912, 0, 1, 0.9333333, 1,
-0.07076947, 1.255402, 0.5673506, 0, 1, 0.9411765, 1,
-0.06956047, -0.1448269, -2.640839, 0, 1, 0.945098, 1,
-0.06936961, -0.1130983, -1.744051, 0, 1, 0.9529412, 1,
-0.06928457, -1.309639, -1.655246, 0, 1, 0.9568627, 1,
-0.06835788, 1.609311, 0.7128294, 0, 1, 0.9647059, 1,
-0.06649897, 0.3548943, -0.3834985, 0, 1, 0.9686275, 1,
-0.06345462, -0.1558841, -2.346074, 0, 1, 0.9764706, 1,
-0.06318916, 0.1407301, -0.2489408, 0, 1, 0.9803922, 1,
-0.06174368, 0.2544786, -1.17887, 0, 1, 0.9882353, 1,
-0.05967664, -0.86739, -1.796122, 0, 1, 0.9921569, 1,
-0.05936211, -0.1147274, -1.273976, 0, 1, 1, 1,
-0.0578697, -0.4298207, -2.966379, 0, 0.9921569, 1, 1,
-0.05639485, -1.068926, -4.150166, 0, 0.9882353, 1, 1,
-0.05490381, 0.1689599, -0.5807928, 0, 0.9803922, 1, 1,
-0.04752576, -0.1264685, -4.088017, 0, 0.9764706, 1, 1,
-0.04537861, 0.4785136, -0.38351, 0, 0.9686275, 1, 1,
-0.04378232, -1.864583, -4.624654, 0, 0.9647059, 1, 1,
-0.0435983, 0.1693843, -0.1812755, 0, 0.9568627, 1, 1,
-0.0413004, -0.8562078, -1.984537, 0, 0.9529412, 1, 1,
-0.03380522, 1.565504, 1.970241, 0, 0.945098, 1, 1,
-0.03117258, -0.5105227, -2.299782, 0, 0.9411765, 1, 1,
-0.03085282, -0.2655905, -2.395049, 0, 0.9333333, 1, 1,
-0.02986054, 0.5708512, -2.347946, 0, 0.9294118, 1, 1,
-0.0291479, -0.4040122, -3.395041, 0, 0.9215686, 1, 1,
-0.02906752, 1.845184, 0.7980894, 0, 0.9176471, 1, 1,
-0.02415168, 1.345021, -0.1703058, 0, 0.9098039, 1, 1,
-0.0233568, 0.05386382, -1.74423, 0, 0.9058824, 1, 1,
-0.008784191, -0.4769171, -3.626993, 0, 0.8980392, 1, 1,
-0.005468812, -0.8987815, -3.052526, 0, 0.8901961, 1, 1,
-0.003862995, 1.545318, 0.9332966, 0, 0.8862745, 1, 1,
5.601559e-05, -1.42313, 2.598311, 0, 0.8784314, 1, 1,
0.001555438, 0.8296226, 0.6893746, 0, 0.8745098, 1, 1,
0.004685646, -0.43254, 2.305887, 0, 0.8666667, 1, 1,
0.01013943, -0.9521658, 2.939824, 0, 0.8627451, 1, 1,
0.01080614, 0.7856961, 0.6108868, 0, 0.854902, 1, 1,
0.01662525, -1.430361, 3.425921, 0, 0.8509804, 1, 1,
0.01828729, 0.7576021, -0.007403229, 0, 0.8431373, 1, 1,
0.02246579, -0.9718065, 2.719996, 0, 0.8392157, 1, 1,
0.02655753, 0.4123324, -1.376515, 0, 0.8313726, 1, 1,
0.02825183, -0.8882171, 5.911941, 0, 0.827451, 1, 1,
0.02869479, -0.3152268, 1.649064, 0, 0.8196079, 1, 1,
0.03018447, 0.3285258, -0.1826875, 0, 0.8156863, 1, 1,
0.0370073, 0.1125819, -0.9541921, 0, 0.8078431, 1, 1,
0.03974323, 2.262814, 2.056762, 0, 0.8039216, 1, 1,
0.04344881, -0.5286087, 3.244979, 0, 0.7960784, 1, 1,
0.04510092, -0.2610229, 3.494221, 0, 0.7882353, 1, 1,
0.04599634, 0.7363015, 1.418452, 0, 0.7843137, 1, 1,
0.04776351, -0.5049241, 3.794075, 0, 0.7764706, 1, 1,
0.04918613, 1.608336, -0.8663968, 0, 0.772549, 1, 1,
0.05214603, -2.059427, 4.087226, 0, 0.7647059, 1, 1,
0.05352451, -0.1763624, 3.03406, 0, 0.7607843, 1, 1,
0.05534538, -0.1158141, 2.136683, 0, 0.7529412, 1, 1,
0.05940352, -0.2246603, 3.757296, 0, 0.7490196, 1, 1,
0.06101151, -1.473401, 4.289479, 0, 0.7411765, 1, 1,
0.06610666, 0.4927947, 0.3850001, 0, 0.7372549, 1, 1,
0.06626102, -1.614383, 2.878306, 0, 0.7294118, 1, 1,
0.0675002, -1.421803, 3.236022, 0, 0.7254902, 1, 1,
0.06845966, -0.8105119, 2.237271, 0, 0.7176471, 1, 1,
0.06943796, 0.181367, 2.797791, 0, 0.7137255, 1, 1,
0.07115026, 1.298738, 0.969084, 0, 0.7058824, 1, 1,
0.07177374, -0.7488955, 3.693552, 0, 0.6980392, 1, 1,
0.07287147, 0.2791996, 0.5022835, 0, 0.6941177, 1, 1,
0.0732512, -1.10394, 3.711847, 0, 0.6862745, 1, 1,
0.07545128, 1.191937, -1.018286, 0, 0.682353, 1, 1,
0.07698014, 0.2187068, 0.7825612, 0, 0.6745098, 1, 1,
0.07733192, -0.386101, 2.958215, 0, 0.6705883, 1, 1,
0.07766891, -0.6086873, 3.074622, 0, 0.6627451, 1, 1,
0.08392005, 0.4003872, -0.3518561, 0, 0.6588235, 1, 1,
0.08455354, 0.6581107, -0.03975821, 0, 0.6509804, 1, 1,
0.08638381, 0.2364466, -2.181227, 0, 0.6470588, 1, 1,
0.09053002, -1.097688, 3.461547, 0, 0.6392157, 1, 1,
0.09824999, 0.5534451, 0.8737334, 0, 0.6352941, 1, 1,
0.1055633, -1.496266, 3.208231, 0, 0.627451, 1, 1,
0.1057846, -0.703441, 3.775294, 0, 0.6235294, 1, 1,
0.1075816, -0.9913349, 4.139163, 0, 0.6156863, 1, 1,
0.1114655, 0.3628675, -1.1129, 0, 0.6117647, 1, 1,
0.1174593, 0.09669174, 0.1166776, 0, 0.6039216, 1, 1,
0.120231, 0.9469185, -0.3676755, 0, 0.5960785, 1, 1,
0.1228305, -1.116081, 4.262634, 0, 0.5921569, 1, 1,
0.1245338, 1.088899, 0.3111613, 0, 0.5843138, 1, 1,
0.125309, -0.021837, 2.99941, 0, 0.5803922, 1, 1,
0.1277034, -1.724099, 5.082697, 0, 0.572549, 1, 1,
0.1280695, 0.4853691, -1.280316, 0, 0.5686275, 1, 1,
0.128831, -0.9219797, 4.130645, 0, 0.5607843, 1, 1,
0.1320189, 0.4353128, -0.9540755, 0, 0.5568628, 1, 1,
0.1332497, -0.296779, 3.486386, 0, 0.5490196, 1, 1,
0.138029, -0.9040525, 1.845527, 0, 0.5450981, 1, 1,
0.1388951, -0.8221763, 2.569052, 0, 0.5372549, 1, 1,
0.139277, -0.3847879, 2.834962, 0, 0.5333334, 1, 1,
0.1404001, -0.2547668, 3.43796, 0, 0.5254902, 1, 1,
0.1456753, -1.087695, 3.529888, 0, 0.5215687, 1, 1,
0.1480745, -0.815217, 2.876008, 0, 0.5137255, 1, 1,
0.1546021, -0.6246114, 3.393717, 0, 0.509804, 1, 1,
0.156183, 0.09725101, 1.270792, 0, 0.5019608, 1, 1,
0.1571965, -1.461518, 3.290477, 0, 0.4941176, 1, 1,
0.1606627, 1.070856, 0.8604884, 0, 0.4901961, 1, 1,
0.1611363, -0.6687523, 3.728619, 0, 0.4823529, 1, 1,
0.1648862, 0.4277927, 1.931654, 0, 0.4784314, 1, 1,
0.165363, -0.4472038, 2.768519, 0, 0.4705882, 1, 1,
0.1730151, -0.5293756, 2.810059, 0, 0.4666667, 1, 1,
0.1737141, 1.307621, 2.859371, 0, 0.4588235, 1, 1,
0.1752457, 0.6594816, -0.04790479, 0, 0.454902, 1, 1,
0.1755754, -0.3612983, 2.901589, 0, 0.4470588, 1, 1,
0.1760635, -0.1088055, 2.493835, 0, 0.4431373, 1, 1,
0.1795988, -0.3871353, 4.206951, 0, 0.4352941, 1, 1,
0.1823003, -0.1997016, 2.980307, 0, 0.4313726, 1, 1,
0.1829081, -0.5798271, 3.934464, 0, 0.4235294, 1, 1,
0.1852463, 0.3513626, 0.770908, 0, 0.4196078, 1, 1,
0.1878095, -0.0561728, 2.453101, 0, 0.4117647, 1, 1,
0.1889737, 0.150991, 0.9884816, 0, 0.4078431, 1, 1,
0.1890574, -2.141652, 3.898047, 0, 0.4, 1, 1,
0.1900766, 0.05120308, 3.004065, 0, 0.3921569, 1, 1,
0.1916127, -0.928646, 1.90441, 0, 0.3882353, 1, 1,
0.1931882, -1.589157, 3.506203, 0, 0.3803922, 1, 1,
0.1941486, 0.1692812, 2.412512, 0, 0.3764706, 1, 1,
0.1977082, 0.5036675, -1.512197, 0, 0.3686275, 1, 1,
0.1991592, -0.4613808, 2.278427, 0, 0.3647059, 1, 1,
0.2042153, 1.248819, 0.082456, 0, 0.3568628, 1, 1,
0.2058818, -0.5651525, 2.249398, 0, 0.3529412, 1, 1,
0.2060558, 1.539008, -0.989485, 0, 0.345098, 1, 1,
0.210142, -1.55857, 3.721517, 0, 0.3411765, 1, 1,
0.2167727, 0.8582426, -1.933714, 0, 0.3333333, 1, 1,
0.2195644, 0.5850825, 0.2079623, 0, 0.3294118, 1, 1,
0.2211833, 0.9255481, -0.5866706, 0, 0.3215686, 1, 1,
0.2228614, -0.5570273, 2.103816, 0, 0.3176471, 1, 1,
0.2297782, -0.6370173, 4.349057, 0, 0.3098039, 1, 1,
0.2320804, 2.607815, 0.8717064, 0, 0.3058824, 1, 1,
0.23362, -0.4206654, 5.749025, 0, 0.2980392, 1, 1,
0.2357858, -0.9025288, 1.714479, 0, 0.2901961, 1, 1,
0.2374694, 0.7770236, 1.946467, 0, 0.2862745, 1, 1,
0.2407138, 0.1736699, 1.229332, 0, 0.2784314, 1, 1,
0.2417144, 0.1269708, 1.880383, 0, 0.2745098, 1, 1,
0.2443053, 0.1125799, 1.190194, 0, 0.2666667, 1, 1,
0.2444354, 1.416859, 0.5712935, 0, 0.2627451, 1, 1,
0.2470484, -0.8955202, 1.695562, 0, 0.254902, 1, 1,
0.2475072, -0.08125842, 1.618645, 0, 0.2509804, 1, 1,
0.2492197, -0.7935823, 2.8219, 0, 0.2431373, 1, 1,
0.2575226, 0.6635262, -0.1139014, 0, 0.2392157, 1, 1,
0.2628854, 0.4170866, 1.677047, 0, 0.2313726, 1, 1,
0.2686514, 0.9042791, -0.7716591, 0, 0.227451, 1, 1,
0.2694857, 0.5516818, 0.6827151, 0, 0.2196078, 1, 1,
0.2726443, 0.06432021, 2.096104, 0, 0.2156863, 1, 1,
0.2731434, -0.3084937, 1.102384, 0, 0.2078431, 1, 1,
0.2771786, -1.259385, 3.942183, 0, 0.2039216, 1, 1,
0.2780916, 0.8311192, 1.75934, 0, 0.1960784, 1, 1,
0.2803193, 0.612405, -0.02574633, 0, 0.1882353, 1, 1,
0.2965861, -0.4828285, 3.307091, 0, 0.1843137, 1, 1,
0.2982225, -0.6797111, 2.160836, 0, 0.1764706, 1, 1,
0.3038206, -2.139801, 1.355584, 0, 0.172549, 1, 1,
0.3038726, -0.2644841, 0.1294561, 0, 0.1647059, 1, 1,
0.3047648, 1.78114, 0.6032489, 0, 0.1607843, 1, 1,
0.3070573, -0.5502633, 3.035473, 0, 0.1529412, 1, 1,
0.3105544, 2.799252, -1.376981, 0, 0.1490196, 1, 1,
0.3138108, 0.4813739, 0.4240522, 0, 0.1411765, 1, 1,
0.3226946, 0.9591717, 0.9928001, 0, 0.1372549, 1, 1,
0.3279523, 0.06906137, 2.671167, 0, 0.1294118, 1, 1,
0.3321551, 1.177606, -1.439878, 0, 0.1254902, 1, 1,
0.332482, -0.1012582, 2.077581, 0, 0.1176471, 1, 1,
0.3358191, -0.5675564, 3.264588, 0, 0.1137255, 1, 1,
0.3382824, -0.5048048, 2.376159, 0, 0.1058824, 1, 1,
0.3402371, 0.3749631, 1.212655, 0, 0.09803922, 1, 1,
0.3408036, 0.5831921, -0.3799856, 0, 0.09411765, 1, 1,
0.340912, 0.1900279, 0.06175691, 0, 0.08627451, 1, 1,
0.341212, 0.1339162, 2.833564, 0, 0.08235294, 1, 1,
0.3442596, 0.2526449, -0.3451735, 0, 0.07450981, 1, 1,
0.3503631, -0.6698656, 4.487417, 0, 0.07058824, 1, 1,
0.3522843, 0.6016244, 1.665189, 0, 0.0627451, 1, 1,
0.3523937, 0.3827201, -0.8576872, 0, 0.05882353, 1, 1,
0.3533148, -0.5649576, 2.496099, 0, 0.05098039, 1, 1,
0.3547156, -0.1666622, 0.1876823, 0, 0.04705882, 1, 1,
0.3574518, -1.94485, 2.270299, 0, 0.03921569, 1, 1,
0.3614129, -1.383473, 3.028628, 0, 0.03529412, 1, 1,
0.3650866, 2.54246, 1.476855, 0, 0.02745098, 1, 1,
0.3657384, -0.01406392, 1.198772, 0, 0.02352941, 1, 1,
0.3701498, -1.641946, 2.588551, 0, 0.01568628, 1, 1,
0.373149, -0.4493056, 3.913611, 0, 0.01176471, 1, 1,
0.3796541, -0.3416286, 1.577642, 0, 0.003921569, 1, 1,
0.3864224, 1.209058, -0.6991653, 0.003921569, 0, 1, 1,
0.39029, 1.222789, -0.9466257, 0.007843138, 0, 1, 1,
0.3936854, 0.2740871, 1.209355, 0.01568628, 0, 1, 1,
0.3970356, 0.9846117, 0.3935646, 0.01960784, 0, 1, 1,
0.3995814, 0.6364236, -1.22483, 0.02745098, 0, 1, 1,
0.3996046, 1.548635, -1.73264, 0.03137255, 0, 1, 1,
0.4003194, 0.9541849, -0.2073366, 0.03921569, 0, 1, 1,
0.4006776, -0.5980241, 1.225408, 0.04313726, 0, 1, 1,
0.4013154, -1.660432, 3.511668, 0.05098039, 0, 1, 1,
0.4037858, -0.4735384, 4.538472, 0.05490196, 0, 1, 1,
0.4048727, 0.2348506, 1.229352, 0.0627451, 0, 1, 1,
0.4110862, 1.522058, 0.7146875, 0.06666667, 0, 1, 1,
0.4164001, -0.4120425, 1.934595, 0.07450981, 0, 1, 1,
0.4196455, -0.2577537, -0.4334701, 0.07843138, 0, 1, 1,
0.4233351, -0.9433342, 3.501497, 0.08627451, 0, 1, 1,
0.4254004, -0.6311881, 2.785393, 0.09019608, 0, 1, 1,
0.4275514, 1.941485, -2.467289, 0.09803922, 0, 1, 1,
0.4288585, 1.815502, -1.040926, 0.1058824, 0, 1, 1,
0.4303665, -1.297243, 1.999684, 0.1098039, 0, 1, 1,
0.4372493, 1.903336, -1.46937, 0.1176471, 0, 1, 1,
0.4372661, -1.013158, 0.9965886, 0.1215686, 0, 1, 1,
0.4415509, -0.3839914, 2.463326, 0.1294118, 0, 1, 1,
0.4417654, 1.464088, 0.131489, 0.1333333, 0, 1, 1,
0.4424674, 0.5107955, -1.685615, 0.1411765, 0, 1, 1,
0.4463861, 1.131027, -1.087175, 0.145098, 0, 1, 1,
0.4533471, 1.207438, 1.265049, 0.1529412, 0, 1, 1,
0.4556537, 1.196628, 0.6932967, 0.1568628, 0, 1, 1,
0.4588428, 0.5155882, 0.2132454, 0.1647059, 0, 1, 1,
0.4592145, 0.7011396, 0.6458305, 0.1686275, 0, 1, 1,
0.4600545, 0.2168152, 1.316004, 0.1764706, 0, 1, 1,
0.4633067, -2.0987, 3.851194, 0.1803922, 0, 1, 1,
0.4641582, -0.3174567, 3.030211, 0.1882353, 0, 1, 1,
0.4656987, -2.338901, 1.345506, 0.1921569, 0, 1, 1,
0.4715661, 0.3335149, 0.4980441, 0.2, 0, 1, 1,
0.4744274, 1.01443, 0.7109929, 0.2078431, 0, 1, 1,
0.4781836, -1.552508, 3.357315, 0.2117647, 0, 1, 1,
0.4787641, 0.05569912, 1.525319, 0.2196078, 0, 1, 1,
0.4818453, -0.6093321, 3.515196, 0.2235294, 0, 1, 1,
0.4880009, 1.7113, -1.092357, 0.2313726, 0, 1, 1,
0.4884151, 0.2104772, 2.005087, 0.2352941, 0, 1, 1,
0.4885496, 1.018016, 1.066138, 0.2431373, 0, 1, 1,
0.4912591, -0.9658754, 2.50212, 0.2470588, 0, 1, 1,
0.4912876, -0.3100901, 1.518135, 0.254902, 0, 1, 1,
0.491867, -0.02064235, 3.825024, 0.2588235, 0, 1, 1,
0.495855, 0.8382044, -0.1267234, 0.2666667, 0, 1, 1,
0.5002946, 0.3025475, 0.1860279, 0.2705882, 0, 1, 1,
0.505252, -0.9187166, 3.651277, 0.2784314, 0, 1, 1,
0.5173805, -1.056521, 2.953504, 0.282353, 0, 1, 1,
0.5180224, 2.485759, -0.8205164, 0.2901961, 0, 1, 1,
0.5183121, 1.448838, -0.6321295, 0.2941177, 0, 1, 1,
0.5210927, -1.554073, 4.920406, 0.3019608, 0, 1, 1,
0.5223606, -0.632151, 2.034168, 0.3098039, 0, 1, 1,
0.5231979, 1.465913, 2.164986, 0.3137255, 0, 1, 1,
0.5290745, -0.254833, 1.768717, 0.3215686, 0, 1, 1,
0.5353028, 0.5365596, 1.996117, 0.3254902, 0, 1, 1,
0.5359831, -2.698127, 1.624975, 0.3333333, 0, 1, 1,
0.5381892, 0.6869414, -0.6774418, 0.3372549, 0, 1, 1,
0.5412897, -0.2666233, 3.06407, 0.345098, 0, 1, 1,
0.5470287, -0.8255339, 3.176703, 0.3490196, 0, 1, 1,
0.5510705, -0.1827006, 2.924102, 0.3568628, 0, 1, 1,
0.5529804, -0.1548023, 3.107958, 0.3607843, 0, 1, 1,
0.5541572, 0.4128166, 1.583259, 0.3686275, 0, 1, 1,
0.5560826, -0.006707163, 0.1473439, 0.372549, 0, 1, 1,
0.5617607, -0.4202072, 2.424871, 0.3803922, 0, 1, 1,
0.5631938, -0.3090129, 1.639716, 0.3843137, 0, 1, 1,
0.5659249, 0.7166765, -0.5682991, 0.3921569, 0, 1, 1,
0.5696467, -0.7049584, 4.104099, 0.3960784, 0, 1, 1,
0.5744441, -2.705724, 4.629487, 0.4039216, 0, 1, 1,
0.5748282, -0.4522417, 2.201712, 0.4117647, 0, 1, 1,
0.5775505, 1.26153, 2.073986, 0.4156863, 0, 1, 1,
0.5829719, -0.02861211, 1.062652, 0.4235294, 0, 1, 1,
0.5873715, -1.298931, 1.589149, 0.427451, 0, 1, 1,
0.5876612, 0.7574478, 1.502864, 0.4352941, 0, 1, 1,
0.5905476, -0.5172567, 1.632693, 0.4392157, 0, 1, 1,
0.5913358, -0.6881299, 0.4825334, 0.4470588, 0, 1, 1,
0.6035497, -0.4190563, 3.450826, 0.4509804, 0, 1, 1,
0.6077597, -0.6821799, 2.539184, 0.4588235, 0, 1, 1,
0.609021, -2.045802, 2.993271, 0.4627451, 0, 1, 1,
0.6131146, 0.02373541, 3.040208, 0.4705882, 0, 1, 1,
0.61415, -0.09894089, 2.372487, 0.4745098, 0, 1, 1,
0.6143034, 1.210041, -1.374704, 0.4823529, 0, 1, 1,
0.6174962, 0.06977669, -0.07889865, 0.4862745, 0, 1, 1,
0.6186435, -0.2055919, 3.446823, 0.4941176, 0, 1, 1,
0.620342, 1.952584, -0.4465322, 0.5019608, 0, 1, 1,
0.6208373, -0.219129, 4.29803, 0.5058824, 0, 1, 1,
0.6247872, -0.5984135, 2.530479, 0.5137255, 0, 1, 1,
0.6279301, 1.134199, -0.7889749, 0.5176471, 0, 1, 1,
0.6314358, 0.2452625, 0.7816606, 0.5254902, 0, 1, 1,
0.6334283, -1.631153, 2.744271, 0.5294118, 0, 1, 1,
0.6351128, -1.346296, 2.254214, 0.5372549, 0, 1, 1,
0.6370926, -1.25359, 1.909268, 0.5411765, 0, 1, 1,
0.6376049, 1.010088, 0.6677327, 0.5490196, 0, 1, 1,
0.6420581, 0.3066176, 0.1829477, 0.5529412, 0, 1, 1,
0.6484228, 1.18533, 1.541308, 0.5607843, 0, 1, 1,
0.6498448, -0.4381771, 1.77458, 0.5647059, 0, 1, 1,
0.6517364, 0.2400734, 2.19837, 0.572549, 0, 1, 1,
0.6524598, 0.5512529, -1.750226, 0.5764706, 0, 1, 1,
0.6540514, -1.071312, 2.606173, 0.5843138, 0, 1, 1,
0.6549428, -0.748074, 3.144994, 0.5882353, 0, 1, 1,
0.656297, -0.3629747, 2.852784, 0.5960785, 0, 1, 1,
0.6611778, -1.044117, 3.894238, 0.6039216, 0, 1, 1,
0.6650103, 0.2692008, 1.410746, 0.6078432, 0, 1, 1,
0.6689851, -0.9805806, 2.807187, 0.6156863, 0, 1, 1,
0.6771854, 0.528496, -0.5188492, 0.6196079, 0, 1, 1,
0.6826009, -0.6553373, 1.247064, 0.627451, 0, 1, 1,
0.6883436, 0.1579309, 2.943574, 0.6313726, 0, 1, 1,
0.6906143, -0.756041, 3.214763, 0.6392157, 0, 1, 1,
0.6968441, -2.159389, 3.079892, 0.6431373, 0, 1, 1,
0.6972728, 0.713281, -0.7398375, 0.6509804, 0, 1, 1,
0.7061535, 0.4421293, 1.915279, 0.654902, 0, 1, 1,
0.7145913, 0.01758121, 1.182783, 0.6627451, 0, 1, 1,
0.7148857, 0.1107805, 0.4627788, 0.6666667, 0, 1, 1,
0.7150865, -1.287632, 2.621418, 0.6745098, 0, 1, 1,
0.7199525, 0.9368114, -0.249369, 0.6784314, 0, 1, 1,
0.7207884, -0.650613, 2.890129, 0.6862745, 0, 1, 1,
0.7245898, -1.207232, 1.656024, 0.6901961, 0, 1, 1,
0.725251, -0.5850155, 0.4892781, 0.6980392, 0, 1, 1,
0.7287238, -0.2046321, 2.36325, 0.7058824, 0, 1, 1,
0.7390565, -0.8692278, 1.815244, 0.7098039, 0, 1, 1,
0.7530136, -1.930611, 3.0333, 0.7176471, 0, 1, 1,
0.7561305, -0.6318926, 1.814998, 0.7215686, 0, 1, 1,
0.7745878, 0.3199786, 1.186796, 0.7294118, 0, 1, 1,
0.7796362, 0.2077744, 0.8825001, 0.7333333, 0, 1, 1,
0.781241, 0.001404954, 3.006217, 0.7411765, 0, 1, 1,
0.7824364, 0.9781286, -0.919951, 0.7450981, 0, 1, 1,
0.7835798, -0.1384672, 2.654186, 0.7529412, 0, 1, 1,
0.7885957, -0.7153886, 2.228445, 0.7568628, 0, 1, 1,
0.7897136, -0.1729701, 1.685888, 0.7647059, 0, 1, 1,
0.7970895, -0.9253657, 3.732229, 0.7686275, 0, 1, 1,
0.797292, 1.041075, 0.2038742, 0.7764706, 0, 1, 1,
0.7985976, -1.188354, 4.699064, 0.7803922, 0, 1, 1,
0.8023914, -0.02339815, 1.437652, 0.7882353, 0, 1, 1,
0.8035207, -0.9020189, 2.764115, 0.7921569, 0, 1, 1,
0.8054743, -0.5054141, 3.295821, 0.8, 0, 1, 1,
0.807438, 1.374068, 0.8282207, 0.8078431, 0, 1, 1,
0.8182946, 0.7508308, -0.01743632, 0.8117647, 0, 1, 1,
0.828213, -0.1195932, 2.692307, 0.8196079, 0, 1, 1,
0.8590913, -0.2325505, 3.814251, 0.8235294, 0, 1, 1,
0.8615198, -0.6712939, 2.059939, 0.8313726, 0, 1, 1,
0.8687856, -0.7981811, 2.67791, 0.8352941, 0, 1, 1,
0.8691015, 0.7271621, 0.7891834, 0.8431373, 0, 1, 1,
0.8697974, -0.6105921, 1.639454, 0.8470588, 0, 1, 1,
0.8725547, -2.66055, 3.237863, 0.854902, 0, 1, 1,
0.8759862, 0.0973592, 1.503971, 0.8588235, 0, 1, 1,
0.8782477, -1.692552, 3.651342, 0.8666667, 0, 1, 1,
0.8788803, -0.1616222, 2.264979, 0.8705882, 0, 1, 1,
0.8791394, 1.318042, 1.695856, 0.8784314, 0, 1, 1,
0.8840148, -0.8539065, 4.639723, 0.8823529, 0, 1, 1,
0.8869559, -0.5460559, 1.923156, 0.8901961, 0, 1, 1,
0.9011812, -1.263335, 1.120876, 0.8941177, 0, 1, 1,
0.9054073, 0.6312497, 2.044082, 0.9019608, 0, 1, 1,
0.9071318, -1.48429, 3.13804, 0.9098039, 0, 1, 1,
0.9110855, -0.5950921, 2.462443, 0.9137255, 0, 1, 1,
0.9110864, 1.705465, 1.308217, 0.9215686, 0, 1, 1,
0.9145868, -0.717042, 2.384368, 0.9254902, 0, 1, 1,
0.915661, -0.04493272, 1.221266, 0.9333333, 0, 1, 1,
0.9247217, -1.543587, 2.302465, 0.9372549, 0, 1, 1,
0.9274319, 0.354111, 0.5404769, 0.945098, 0, 1, 1,
0.9277445, 0.6845368, 2.021626, 0.9490196, 0, 1, 1,
0.9325258, 0.742512, 2.606802, 0.9568627, 0, 1, 1,
0.933194, -0.6505437, 2.937459, 0.9607843, 0, 1, 1,
0.9459577, 0.5358775, 2.487294, 0.9686275, 0, 1, 1,
0.9500679, -0.6284146, 1.42374, 0.972549, 0, 1, 1,
0.9502903, -0.3487189, 3.093077, 0.9803922, 0, 1, 1,
0.9525083, -0.6468014, 1.135816, 0.9843137, 0, 1, 1,
0.9662314, -0.1014911, -0.6441965, 0.9921569, 0, 1, 1,
0.9692593, 0.310112, 1.535712, 0.9960784, 0, 1, 1,
0.9710326, -1.080484, 1.779741, 1, 0, 0.9960784, 1,
0.9730375, -0.02603601, 2.439642, 1, 0, 0.9882353, 1,
0.9753026, 0.5517027, 1.241617, 1, 0, 0.9843137, 1,
0.9760373, 0.4344304, -0.5213458, 1, 0, 0.9764706, 1,
0.9765009, -0.6641196, 3.344358, 1, 0, 0.972549, 1,
0.9838737, -1.47081, 1.973537, 1, 0, 0.9647059, 1,
0.9865147, 0.3942258, 1.307992, 1, 0, 0.9607843, 1,
1.004075, -0.7350771, 1.655255, 1, 0, 0.9529412, 1,
1.00858, -0.3750788, 0.8855659, 1, 0, 0.9490196, 1,
1.008648, 1.02005, -0.1436013, 1, 0, 0.9411765, 1,
1.01434, -1.141225, 1.608574, 1, 0, 0.9372549, 1,
1.01655, 0.7491451, 1.791163, 1, 0, 0.9294118, 1,
1.021435, 0.3823318, 1.246733, 1, 0, 0.9254902, 1,
1.022597, -0.7840546, 2.046582, 1, 0, 0.9176471, 1,
1.025674, 0.01000286, 2.281316, 1, 0, 0.9137255, 1,
1.026203, -0.2224338, 2.34988, 1, 0, 0.9058824, 1,
1.035619, -0.008656552, 1.765062, 1, 0, 0.9019608, 1,
1.036077, 0.3598507, -0.1651626, 1, 0, 0.8941177, 1,
1.038871, -0.775588, 1.099622, 1, 0, 0.8862745, 1,
1.046633, -0.3173122, 4.001314, 1, 0, 0.8823529, 1,
1.049003, -0.1962399, 3.869354, 1, 0, 0.8745098, 1,
1.049466, -0.7054422, 1.817664, 1, 0, 0.8705882, 1,
1.051544, 0.2351527, -0.6044189, 1, 0, 0.8627451, 1,
1.070651, 1.202209, 1.40946, 1, 0, 0.8588235, 1,
1.078931, 1.114984, -0.4090996, 1, 0, 0.8509804, 1,
1.079072, -0.7678961, 2.506383, 1, 0, 0.8470588, 1,
1.081043, -0.8665307, 3.407021, 1, 0, 0.8392157, 1,
1.08249, 0.7647486, 0.8622357, 1, 0, 0.8352941, 1,
1.082934, -1.09193, 2.763952, 1, 0, 0.827451, 1,
1.083384, -1.057651, 3.841801, 1, 0, 0.8235294, 1,
1.083515, 0.1744409, 2.36247, 1, 0, 0.8156863, 1,
1.086754, 0.2901937, -0.4160367, 1, 0, 0.8117647, 1,
1.08753, -1.65537, 2.342184, 1, 0, 0.8039216, 1,
1.088222, 1.961075, -1.21555, 1, 0, 0.7960784, 1,
1.091372, 0.8733808, 1.674372, 1, 0, 0.7921569, 1,
1.096972, 0.4376988, 1.999492, 1, 0, 0.7843137, 1,
1.110371, 1.132539, 0.15888, 1, 0, 0.7803922, 1,
1.113899, -0.8675244, 2.333267, 1, 0, 0.772549, 1,
1.115508, -1.989584, -0.03822438, 1, 0, 0.7686275, 1,
1.12032, -1.17677, 2.538023, 1, 0, 0.7607843, 1,
1.124044, 0.05073306, 2.126827, 1, 0, 0.7568628, 1,
1.125982, -0.1106196, 2.819437, 1, 0, 0.7490196, 1,
1.131232, -0.06491243, 1.55626, 1, 0, 0.7450981, 1,
1.135956, -0.5826902, 1.091745, 1, 0, 0.7372549, 1,
1.150025, 0.6824309, 0.4955125, 1, 0, 0.7333333, 1,
1.150168, -0.1495606, 2.889546, 1, 0, 0.7254902, 1,
1.150348, -0.1078028, 0.1894609, 1, 0, 0.7215686, 1,
1.178895, -1.236969, 1.424429, 1, 0, 0.7137255, 1,
1.18074, -1.958193, 2.535307, 1, 0, 0.7098039, 1,
1.190985, 0.1742568, 1.911346, 1, 0, 0.7019608, 1,
1.194196, 0.129477, 1.784448, 1, 0, 0.6941177, 1,
1.198399, 0.5104962, 2.024436, 1, 0, 0.6901961, 1,
1.200235, 0.4049538, 2.32582, 1, 0, 0.682353, 1,
1.20242, -1.643856, 2.57763, 1, 0, 0.6784314, 1,
1.207038, 0.2936123, 1.454423, 1, 0, 0.6705883, 1,
1.207694, 0.06203617, 1.666009, 1, 0, 0.6666667, 1,
1.208106, -1.368524, 4.302064, 1, 0, 0.6588235, 1,
1.217006, -1.607063, 4.748392, 1, 0, 0.654902, 1,
1.217874, -0.2164227, 2.908054, 1, 0, 0.6470588, 1,
1.222039, -1.636147, 3.021363, 1, 0, 0.6431373, 1,
1.223257, -0.8829637, 3.587788, 1, 0, 0.6352941, 1,
1.228225, 0.9149454, -0.4721941, 1, 0, 0.6313726, 1,
1.228951, -0.4490286, 1.69542, 1, 0, 0.6235294, 1,
1.229155, 0.3672272, 0.2772497, 1, 0, 0.6196079, 1,
1.243072, -0.2668243, 0.7239807, 1, 0, 0.6117647, 1,
1.243704, 0.2754436, 1.87522, 1, 0, 0.6078432, 1,
1.247032, 0.6977647, -0.3035398, 1, 0, 0.6, 1,
1.248953, -0.2248381, 1.827696, 1, 0, 0.5921569, 1,
1.264648, -1.288458, 5.03243, 1, 0, 0.5882353, 1,
1.270946, 0.4819035, 1.931485, 1, 0, 0.5803922, 1,
1.274667, -1.94942, 2.116559, 1, 0, 0.5764706, 1,
1.280671, -0.6716009, 2.924643, 1, 0, 0.5686275, 1,
1.293305, 0.441223, 1.269508, 1, 0, 0.5647059, 1,
1.293681, 0.04038843, 2.594973, 1, 0, 0.5568628, 1,
1.304615, -0.06228707, 0.9739071, 1, 0, 0.5529412, 1,
1.309355, 2.132983, 0.7110132, 1, 0, 0.5450981, 1,
1.311234, -0.3357309, 2.183962, 1, 0, 0.5411765, 1,
1.313077, 0.6041378, 1.527819, 1, 0, 0.5333334, 1,
1.320343, -0.106404, 2.366624, 1, 0, 0.5294118, 1,
1.340057, -1.429922, 2.173549, 1, 0, 0.5215687, 1,
1.34104, 0.6409889, -0.2423622, 1, 0, 0.5176471, 1,
1.360897, -0.3671759, 2.542886, 1, 0, 0.509804, 1,
1.361313, 0.04629166, 0.1184124, 1, 0, 0.5058824, 1,
1.362426, -0.03246165, 2.867107, 1, 0, 0.4980392, 1,
1.371128, -1.186481, 2.076458, 1, 0, 0.4901961, 1,
1.375287, 0.2365607, 2.764655, 1, 0, 0.4862745, 1,
1.387282, 0.4224023, 1.475713, 1, 0, 0.4784314, 1,
1.388233, 0.3856379, 3.028594, 1, 0, 0.4745098, 1,
1.393779, 0.2649537, 0.5954471, 1, 0, 0.4666667, 1,
1.421804, 0.3564263, -0.476856, 1, 0, 0.4627451, 1,
1.421998, 0.3503909, 0.2566189, 1, 0, 0.454902, 1,
1.432829, -2.232126, 1.385916, 1, 0, 0.4509804, 1,
1.435597, 1.003944, 1.48253, 1, 0, 0.4431373, 1,
1.449209, 0.3608755, 1.697768, 1, 0, 0.4392157, 1,
1.45279, 0.5466344, 0.8501312, 1, 0, 0.4313726, 1,
1.455603, -0.09201521, 0.8614594, 1, 0, 0.427451, 1,
1.457945, 1.279946, 2.201064, 1, 0, 0.4196078, 1,
1.477304, -0.1588392, 1.849914, 1, 0, 0.4156863, 1,
1.487024, 0.9190523, 1.321239, 1, 0, 0.4078431, 1,
1.487064, -1.062672, 2.27175, 1, 0, 0.4039216, 1,
1.489105, -1.113687, 2.668469, 1, 0, 0.3960784, 1,
1.497577, -0.371715, 0.3008605, 1, 0, 0.3882353, 1,
1.509433, -1.584176, 3.722815, 1, 0, 0.3843137, 1,
1.521234, -0.4842296, 1.597253, 1, 0, 0.3764706, 1,
1.525346, 2.539989, 0.9427596, 1, 0, 0.372549, 1,
1.546504, 0.03246091, 2.38404, 1, 0, 0.3647059, 1,
1.551048, 0.9817093, 2.121237, 1, 0, 0.3607843, 1,
1.554114, -1.509572, 1.869926, 1, 0, 0.3529412, 1,
1.555649, -0.3299578, -0.01474652, 1, 0, 0.3490196, 1,
1.556548, -0.3426284, 1.242963, 1, 0, 0.3411765, 1,
1.561333, 0.3248668, 1.908946, 1, 0, 0.3372549, 1,
1.56612, -0.1634969, 1.164569, 1, 0, 0.3294118, 1,
1.567109, 1.276485, 0.2222239, 1, 0, 0.3254902, 1,
1.576591, 0.5484975, 1.956397, 1, 0, 0.3176471, 1,
1.584974, 1.547695, 3.124745, 1, 0, 0.3137255, 1,
1.587165, -0.2611484, 1.11651, 1, 0, 0.3058824, 1,
1.597283, 0.8425538, 0.5938372, 1, 0, 0.2980392, 1,
1.600619, -0.3366763, 1.917427, 1, 0, 0.2941177, 1,
1.603999, -0.7368819, 1.058004, 1, 0, 0.2862745, 1,
1.60759, -1.483257, 1.884245, 1, 0, 0.282353, 1,
1.616592, 1.63186, 0.5506129, 1, 0, 0.2745098, 1,
1.620721, -0.1280015, 1.312708, 1, 0, 0.2705882, 1,
1.644056, -1.994259, 2.440171, 1, 0, 0.2627451, 1,
1.674399, -0.954959, 1.752933, 1, 0, 0.2588235, 1,
1.675613, 0.519714, 0.05272295, 1, 0, 0.2509804, 1,
1.704879, -0.2439648, 2.986762, 1, 0, 0.2470588, 1,
1.727845, -0.4888739, 2.846015, 1, 0, 0.2392157, 1,
1.729652, -0.6771461, 2.220033, 1, 0, 0.2352941, 1,
1.749366, 0.03194129, -0.4987234, 1, 0, 0.227451, 1,
1.753429, -0.7830311, 3.363015, 1, 0, 0.2235294, 1,
1.787342, 0.2588949, 1.377571, 1, 0, 0.2156863, 1,
1.794485, -0.6019355, 0.0317052, 1, 0, 0.2117647, 1,
1.814333, -0.02120431, 0.752329, 1, 0, 0.2039216, 1,
1.821537, -0.6737535, 3.062626, 1, 0, 0.1960784, 1,
1.841956, -0.1768658, 3.29358, 1, 0, 0.1921569, 1,
1.847381, -0.3270732, 2.023668, 1, 0, 0.1843137, 1,
1.848536, -0.01831627, 0.9257755, 1, 0, 0.1803922, 1,
1.856462, -0.2951028, 1.379594, 1, 0, 0.172549, 1,
1.866157, 0.8767846, 0.2203185, 1, 0, 0.1686275, 1,
1.87265, -0.8549293, 2.830375, 1, 0, 0.1607843, 1,
1.880742, -0.001689838, 2.589263, 1, 0, 0.1568628, 1,
1.883035, 0.3780551, 0.9134928, 1, 0, 0.1490196, 1,
1.924225, -0.5553133, 2.371001, 1, 0, 0.145098, 1,
1.92603, 0.343156, 0.4222656, 1, 0, 0.1372549, 1,
1.933015, 1.046656, 1.087891, 1, 0, 0.1333333, 1,
1.96487, 2.63427, -0.9179547, 1, 0, 0.1254902, 1,
1.969045, 1.143581, 1.740712, 1, 0, 0.1215686, 1,
1.995171, -0.00949028, 2.154735, 1, 0, 0.1137255, 1,
2.105237, -1.068299, 2.10955, 1, 0, 0.1098039, 1,
2.125257, 1.200917, 0.8288289, 1, 0, 0.1019608, 1,
2.12883, -0.9618874, 5.407461, 1, 0, 0.09411765, 1,
2.328566, 1.895169, 3.029968, 1, 0, 0.09019608, 1,
2.331426, -0.8311499, 3.206352, 1, 0, 0.08235294, 1,
2.3692, 2.101145, 0.3922419, 1, 0, 0.07843138, 1,
2.421021, -0.3771639, 1.449002, 1, 0, 0.07058824, 1,
2.506804, 0.6575394, -0.06749776, 1, 0, 0.06666667, 1,
2.522803, 0.4553305, 2.24733, 1, 0, 0.05882353, 1,
2.552704, -0.601436, -0.9872189, 1, 0, 0.05490196, 1,
2.674816, 1.042123, 0.5279616, 1, 0, 0.04705882, 1,
2.70241, -1.017929, 2.125458, 1, 0, 0.04313726, 1,
2.702681, 3.31764, 2.278347, 1, 0, 0.03529412, 1,
2.774642, 0.7719547, 0.2205309, 1, 0, 0.03137255, 1,
2.924445, 1.757468, -0.3808774, 1, 0, 0.02352941, 1,
2.925508, 0.8948808, 0.08986258, 1, 0, 0.01960784, 1,
2.983278, 1.831889, 0.4529477, 1, 0, 0.01176471, 1,
3.091538, 1.152834, 3.07132, 1, 0, 0.007843138, 1
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
-0.0518223, -4.136624, -7.932106, 0, -0.5, 0.5, 0.5,
-0.0518223, -4.136624, -7.932106, 1, -0.5, 0.5, 0.5,
-0.0518223, -4.136624, -7.932106, 1, 1.5, 0.5, 0.5,
-0.0518223, -4.136624, -7.932106, 0, 1.5, 0.5, 0.5
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
-4.260782, 0.1306952, -7.932106, 0, -0.5, 0.5, 0.5,
-4.260782, 0.1306952, -7.932106, 1, -0.5, 0.5, 0.5,
-4.260782, 0.1306952, -7.932106, 1, 1.5, 0.5, 0.5,
-4.260782, 0.1306952, -7.932106, 0, 1.5, 0.5, 0.5
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
-4.260782, -4.136624, -0.006847858, 0, -0.5, 0.5, 0.5,
-4.260782, -4.136624, -0.006847858, 1, -0.5, 0.5, 0.5,
-4.260782, -4.136624, -0.006847858, 1, 1.5, 0.5, 0.5,
-4.260782, -4.136624, -0.006847858, 0, 1.5, 0.5, 0.5
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
-3, -3.151858, -6.1032,
3, -3.151858, -6.1032,
-3, -3.151858, -6.1032,
-3, -3.315986, -6.408018,
-2, -3.151858, -6.1032,
-2, -3.315986, -6.408018,
-1, -3.151858, -6.1032,
-1, -3.315986, -6.408018,
0, -3.151858, -6.1032,
0, -3.315986, -6.408018,
1, -3.151858, -6.1032,
1, -3.315986, -6.408018,
2, -3.151858, -6.1032,
2, -3.315986, -6.408018,
3, -3.151858, -6.1032,
3, -3.315986, -6.408018
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
-3, -3.644241, -7.017653, 0, -0.5, 0.5, 0.5,
-3, -3.644241, -7.017653, 1, -0.5, 0.5, 0.5,
-3, -3.644241, -7.017653, 1, 1.5, 0.5, 0.5,
-3, -3.644241, -7.017653, 0, 1.5, 0.5, 0.5,
-2, -3.644241, -7.017653, 0, -0.5, 0.5, 0.5,
-2, -3.644241, -7.017653, 1, -0.5, 0.5, 0.5,
-2, -3.644241, -7.017653, 1, 1.5, 0.5, 0.5,
-2, -3.644241, -7.017653, 0, 1.5, 0.5, 0.5,
-1, -3.644241, -7.017653, 0, -0.5, 0.5, 0.5,
-1, -3.644241, -7.017653, 1, -0.5, 0.5, 0.5,
-1, -3.644241, -7.017653, 1, 1.5, 0.5, 0.5,
-1, -3.644241, -7.017653, 0, 1.5, 0.5, 0.5,
0, -3.644241, -7.017653, 0, -0.5, 0.5, 0.5,
0, -3.644241, -7.017653, 1, -0.5, 0.5, 0.5,
0, -3.644241, -7.017653, 1, 1.5, 0.5, 0.5,
0, -3.644241, -7.017653, 0, 1.5, 0.5, 0.5,
1, -3.644241, -7.017653, 0, -0.5, 0.5, 0.5,
1, -3.644241, -7.017653, 1, -0.5, 0.5, 0.5,
1, -3.644241, -7.017653, 1, 1.5, 0.5, 0.5,
1, -3.644241, -7.017653, 0, 1.5, 0.5, 0.5,
2, -3.644241, -7.017653, 0, -0.5, 0.5, 0.5,
2, -3.644241, -7.017653, 1, -0.5, 0.5, 0.5,
2, -3.644241, -7.017653, 1, 1.5, 0.5, 0.5,
2, -3.644241, -7.017653, 0, 1.5, 0.5, 0.5,
3, -3.644241, -7.017653, 0, -0.5, 0.5, 0.5,
3, -3.644241, -7.017653, 1, -0.5, 0.5, 0.5,
3, -3.644241, -7.017653, 1, 1.5, 0.5, 0.5,
3, -3.644241, -7.017653, 0, 1.5, 0.5, 0.5
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
-3.289484, -3, -6.1032,
-3.289484, 3, -6.1032,
-3.289484, -3, -6.1032,
-3.451367, -3, -6.408018,
-3.289484, -2, -6.1032,
-3.451367, -2, -6.408018,
-3.289484, -1, -6.1032,
-3.451367, -1, -6.408018,
-3.289484, 0, -6.1032,
-3.451367, 0, -6.408018,
-3.289484, 1, -6.1032,
-3.451367, 1, -6.408018,
-3.289484, 2, -6.1032,
-3.451367, 2, -6.408018,
-3.289484, 3, -6.1032,
-3.451367, 3, -6.408018
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
-3.775133, -3, -7.017653, 0, -0.5, 0.5, 0.5,
-3.775133, -3, -7.017653, 1, -0.5, 0.5, 0.5,
-3.775133, -3, -7.017653, 1, 1.5, 0.5, 0.5,
-3.775133, -3, -7.017653, 0, 1.5, 0.5, 0.5,
-3.775133, -2, -7.017653, 0, -0.5, 0.5, 0.5,
-3.775133, -2, -7.017653, 1, -0.5, 0.5, 0.5,
-3.775133, -2, -7.017653, 1, 1.5, 0.5, 0.5,
-3.775133, -2, -7.017653, 0, 1.5, 0.5, 0.5,
-3.775133, -1, -7.017653, 0, -0.5, 0.5, 0.5,
-3.775133, -1, -7.017653, 1, -0.5, 0.5, 0.5,
-3.775133, -1, -7.017653, 1, 1.5, 0.5, 0.5,
-3.775133, -1, -7.017653, 0, 1.5, 0.5, 0.5,
-3.775133, 0, -7.017653, 0, -0.5, 0.5, 0.5,
-3.775133, 0, -7.017653, 1, -0.5, 0.5, 0.5,
-3.775133, 0, -7.017653, 1, 1.5, 0.5, 0.5,
-3.775133, 0, -7.017653, 0, 1.5, 0.5, 0.5,
-3.775133, 1, -7.017653, 0, -0.5, 0.5, 0.5,
-3.775133, 1, -7.017653, 1, -0.5, 0.5, 0.5,
-3.775133, 1, -7.017653, 1, 1.5, 0.5, 0.5,
-3.775133, 1, -7.017653, 0, 1.5, 0.5, 0.5,
-3.775133, 2, -7.017653, 0, -0.5, 0.5, 0.5,
-3.775133, 2, -7.017653, 1, -0.5, 0.5, 0.5,
-3.775133, 2, -7.017653, 1, 1.5, 0.5, 0.5,
-3.775133, 2, -7.017653, 0, 1.5, 0.5, 0.5,
-3.775133, 3, -7.017653, 0, -0.5, 0.5, 0.5,
-3.775133, 3, -7.017653, 1, -0.5, 0.5, 0.5,
-3.775133, 3, -7.017653, 1, 1.5, 0.5, 0.5,
-3.775133, 3, -7.017653, 0, 1.5, 0.5, 0.5
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
-3.289484, -3.151858, -4,
-3.289484, -3.151858, 4,
-3.289484, -3.151858, -4,
-3.451367, -3.315986, -4,
-3.289484, -3.151858, -2,
-3.451367, -3.315986, -2,
-3.289484, -3.151858, 0,
-3.451367, -3.315986, 0,
-3.289484, -3.151858, 2,
-3.451367, -3.315986, 2,
-3.289484, -3.151858, 4,
-3.451367, -3.315986, 4
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
-3.775133, -3.644241, -4, 0, -0.5, 0.5, 0.5,
-3.775133, -3.644241, -4, 1, -0.5, 0.5, 0.5,
-3.775133, -3.644241, -4, 1, 1.5, 0.5, 0.5,
-3.775133, -3.644241, -4, 0, 1.5, 0.5, 0.5,
-3.775133, -3.644241, -2, 0, -0.5, 0.5, 0.5,
-3.775133, -3.644241, -2, 1, -0.5, 0.5, 0.5,
-3.775133, -3.644241, -2, 1, 1.5, 0.5, 0.5,
-3.775133, -3.644241, -2, 0, 1.5, 0.5, 0.5,
-3.775133, -3.644241, 0, 0, -0.5, 0.5, 0.5,
-3.775133, -3.644241, 0, 1, -0.5, 0.5, 0.5,
-3.775133, -3.644241, 0, 1, 1.5, 0.5, 0.5,
-3.775133, -3.644241, 0, 0, 1.5, 0.5, 0.5,
-3.775133, -3.644241, 2, 0, -0.5, 0.5, 0.5,
-3.775133, -3.644241, 2, 1, -0.5, 0.5, 0.5,
-3.775133, -3.644241, 2, 1, 1.5, 0.5, 0.5,
-3.775133, -3.644241, 2, 0, 1.5, 0.5, 0.5,
-3.775133, -3.644241, 4, 0, -0.5, 0.5, 0.5,
-3.775133, -3.644241, 4, 1, -0.5, 0.5, 0.5,
-3.775133, -3.644241, 4, 1, 1.5, 0.5, 0.5,
-3.775133, -3.644241, 4, 0, 1.5, 0.5, 0.5
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
-3.289484, -3.151858, -6.1032,
-3.289484, 3.413249, -6.1032,
-3.289484, -3.151858, 6.089505,
-3.289484, 3.413249, 6.089505,
-3.289484, -3.151858, -6.1032,
-3.289484, -3.151858, 6.089505,
-3.289484, 3.413249, -6.1032,
-3.289484, 3.413249, 6.089505,
-3.289484, -3.151858, -6.1032,
3.185839, -3.151858, -6.1032,
-3.289484, -3.151858, 6.089505,
3.185839, -3.151858, 6.089505,
-3.289484, 3.413249, -6.1032,
3.185839, 3.413249, -6.1032,
-3.289484, 3.413249, 6.089505,
3.185839, 3.413249, 6.089505,
3.185839, -3.151858, -6.1032,
3.185839, 3.413249, -6.1032,
3.185839, -3.151858, 6.089505,
3.185839, 3.413249, 6.089505,
3.185839, -3.151858, -6.1032,
3.185839, -3.151858, 6.089505,
3.185839, 3.413249, -6.1032,
3.185839, 3.413249, 6.089505
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
var radius = 8.162963;
var distance = 36.31795;
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
mvMatrix.translate( 0.0518223, -0.1306952, 0.006847858 );
mvMatrix.scale( 1.363014, 1.344374, 0.7238718 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.31795);
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
Methamidophos<-read.table("Methamidophos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Methamidophos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methamidophos' not found
```

```r
y<-Methamidophos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methamidophos' not found
```

```r
z<-Methamidophos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methamidophos' not found
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
-3.195183, -0.365005, -1.030677, 0, 0, 1, 1, 1,
-3.056349, 0.309319, -1.290118, 1, 0, 0, 1, 1,
-2.836143, -1.17408, -1.696584, 1, 0, 0, 1, 1,
-2.594996, -0.504918, -2.310895, 1, 0, 0, 1, 1,
-2.476344, 2.221905, -1.022417, 1, 0, 0, 1, 1,
-2.464108, -0.1863979, -1.748949, 1, 0, 0, 1, 1,
-2.451962, 1.162919, -0.04819044, 0, 0, 0, 1, 1,
-2.438711, 0.5327474, -3.328366, 0, 0, 0, 1, 1,
-2.291888, 1.443635, -0.9296684, 0, 0, 0, 1, 1,
-2.288157, -0.02413827, -0.666612, 0, 0, 0, 1, 1,
-2.286771, 0.8756114, 0.3733925, 0, 0, 0, 1, 1,
-2.258967, -1.487319, -2.789124, 0, 0, 0, 1, 1,
-2.186371, -0.02519791, -3.60631, 0, 0, 0, 1, 1,
-2.172924, -0.938733, -2.572355, 1, 1, 1, 1, 1,
-2.138833, -1.05564, -1.021364, 1, 1, 1, 1, 1,
-2.116827, 0.3456878, -2.323436, 1, 1, 1, 1, 1,
-2.085798, 0.1087184, -2.638336, 1, 1, 1, 1, 1,
-2.066874, 0.5106027, -2.560754, 1, 1, 1, 1, 1,
-2.06381, -1.013094, -3.297083, 1, 1, 1, 1, 1,
-2.042109, -0.1454106, -2.671323, 1, 1, 1, 1, 1,
-2.020079, 0.181607, -1.939028, 1, 1, 1, 1, 1,
-2.014317, -0.6044124, -2.793549, 1, 1, 1, 1, 1,
-1.994371, -1.473934, -2.616157, 1, 1, 1, 1, 1,
-1.979388, -0.5449446, -1.356036, 1, 1, 1, 1, 1,
-1.938918, -0.6437544, -1.254729, 1, 1, 1, 1, 1,
-1.934977, -1.264388, -3.188887, 1, 1, 1, 1, 1,
-1.922048, 2.078839, 1.213812, 1, 1, 1, 1, 1,
-1.921925, 1.183425, -2.870036, 1, 1, 1, 1, 1,
-1.913702, 0.3016152, -0.6868097, 0, 0, 1, 1, 1,
-1.913265, -0.9008665, -2.928861, 1, 0, 0, 1, 1,
-1.910174, -0.4242626, -0.864744, 1, 0, 0, 1, 1,
-1.884142, 1.263583, -1.209163, 1, 0, 0, 1, 1,
-1.854114, 2.080132, -1.598088, 1, 0, 0, 1, 1,
-1.848062, -0.2249947, -1.956563, 1, 0, 0, 1, 1,
-1.828977, -2.719086, -0.9768154, 0, 0, 0, 1, 1,
-1.819429, 1.569489, 0.2511859, 0, 0, 0, 1, 1,
-1.787906, -0.2953763, -2.043177, 0, 0, 0, 1, 1,
-1.787476, 0.1298746, -1.184078, 0, 0, 0, 1, 1,
-1.777537, 0.6850175, -1.080599, 0, 0, 0, 1, 1,
-1.773264, 0.5347528, -3.45962, 0, 0, 0, 1, 1,
-1.769033, 1.27233, -0.8731139, 0, 0, 0, 1, 1,
-1.747912, 0.7311915, -0.3190503, 1, 1, 1, 1, 1,
-1.725635, 1.905813, -0.1677474, 1, 1, 1, 1, 1,
-1.723361, -0.06458701, -2.718155, 1, 1, 1, 1, 1,
-1.720109, -0.8430047, -2.820872, 1, 1, 1, 1, 1,
-1.719715, -0.02166475, -2.158931, 1, 1, 1, 1, 1,
-1.715234, -0.5340443, -1.738565, 1, 1, 1, 1, 1,
-1.697587, 1.57461, -0.6067043, 1, 1, 1, 1, 1,
-1.696652, 0.3186129, -0.7192134, 1, 1, 1, 1, 1,
-1.695163, -0.2367361, -1.910658, 1, 1, 1, 1, 1,
-1.683841, -0.9835106, -3.122444, 1, 1, 1, 1, 1,
-1.680794, -0.1411863, -3.368927, 1, 1, 1, 1, 1,
-1.674218, -0.737513, -0.3812385, 1, 1, 1, 1, 1,
-1.67304, -0.7527993, -1.001479, 1, 1, 1, 1, 1,
-1.668792, 1.145346, 0.6335219, 1, 1, 1, 1, 1,
-1.660267, 1.874623, -1.127335, 1, 1, 1, 1, 1,
-1.653756, -1.100222, -1.690275, 0, 0, 1, 1, 1,
-1.638123, 0.7454334, -1.17679, 1, 0, 0, 1, 1,
-1.633, -0.156105, -2.061631, 1, 0, 0, 1, 1,
-1.631278, 0.0849985, 0.5494336, 1, 0, 0, 1, 1,
-1.618928, 0.1369338, -2.417418, 1, 0, 0, 1, 1,
-1.615737, -0.6431199, -1.867284, 1, 0, 0, 1, 1,
-1.61432, 1.08387, -0.2842026, 0, 0, 0, 1, 1,
-1.606207, -0.5756259, -0.4547857, 0, 0, 0, 1, 1,
-1.599375, -2.295042, 0.001981904, 0, 0, 0, 1, 1,
-1.5825, 0.1187015, -1.381934, 0, 0, 0, 1, 1,
-1.579522, 0.5707433, -0.4975447, 0, 0, 0, 1, 1,
-1.575737, 1.196239, -0.655565, 0, 0, 0, 1, 1,
-1.573622, 2.425145, -0.159645, 0, 0, 0, 1, 1,
-1.572603, 1.350303, -1.42518, 1, 1, 1, 1, 1,
-1.556374, 0.1187161, -0.227034, 1, 1, 1, 1, 1,
-1.540494, -0.04443359, -1.325332, 1, 1, 1, 1, 1,
-1.536422, -1.222068, -2.502318, 1, 1, 1, 1, 1,
-1.531702, -3.05625, -3.408566, 1, 1, 1, 1, 1,
-1.514672, 0.0754663, -0.7757599, 1, 1, 1, 1, 1,
-1.508874, -0.854856, -2.126588, 1, 1, 1, 1, 1,
-1.503914, -0.4159595, -0.9530923, 1, 1, 1, 1, 1,
-1.498648, -0.7757528, -3.178684, 1, 1, 1, 1, 1,
-1.496725, 0.7623425, -2.138253, 1, 1, 1, 1, 1,
-1.490195, 1.275565, -0.784611, 1, 1, 1, 1, 1,
-1.484156, 0.2835658, 1.611832, 1, 1, 1, 1, 1,
-1.483887, -0.8184202, -1.550529, 1, 1, 1, 1, 1,
-1.481002, 1.007044, -1.340201, 1, 1, 1, 1, 1,
-1.476129, -1.705518, -1.710431, 1, 1, 1, 1, 1,
-1.470104, 2.045907, -1.420376, 0, 0, 1, 1, 1,
-1.463882, 1.340108, -0.768748, 1, 0, 0, 1, 1,
-1.461405, 1.348547, -1.573349, 1, 0, 0, 1, 1,
-1.460273, 0.5345807, -0.8152164, 1, 0, 0, 1, 1,
-1.451344, -1.294653, -1.767583, 1, 0, 0, 1, 1,
-1.44113, 1.288306, -0.972488, 1, 0, 0, 1, 1,
-1.429464, -2.113693, -4.290278, 0, 0, 0, 1, 1,
-1.424166, -0.2108186, 1.37545, 0, 0, 0, 1, 1,
-1.410287, -1.875518, -1.758432, 0, 0, 0, 1, 1,
-1.407218, 0.2645452, -0.5278235, 0, 0, 0, 1, 1,
-1.402753, -0.495546, -0.4499271, 0, 0, 0, 1, 1,
-1.400221, 0.4128945, -1.259756, 0, 0, 0, 1, 1,
-1.397235, -0.1333801, -0.1247929, 0, 0, 0, 1, 1,
-1.388518, 1.121911, -1.273279, 1, 1, 1, 1, 1,
-1.33959, -0.05700933, -1.596649, 1, 1, 1, 1, 1,
-1.318486, 0.5483823, -0.5303186, 1, 1, 1, 1, 1,
-1.308509, -0.3865278, -1.78676, 1, 1, 1, 1, 1,
-1.306594, -0.1587543, -3.272748, 1, 1, 1, 1, 1,
-1.295003, -0.228238, -1.615414, 1, 1, 1, 1, 1,
-1.286707, -0.3154288, -1.346387, 1, 1, 1, 1, 1,
-1.28536, -0.328264, -2.965145, 1, 1, 1, 1, 1,
-1.260542, -1.163436, -2.371637, 1, 1, 1, 1, 1,
-1.256548, -1.022466, -2.54112, 1, 1, 1, 1, 1,
-1.246047, 1.707899, -1.075925, 1, 1, 1, 1, 1,
-1.243962, 0.5961477, -2.063694, 1, 1, 1, 1, 1,
-1.231705, -0.4368965, -1.310291, 1, 1, 1, 1, 1,
-1.226534, -0.3345004, -1.075598, 1, 1, 1, 1, 1,
-1.224829, 0.1887607, -1.080481, 1, 1, 1, 1, 1,
-1.223446, 1.191179, -0.4085509, 0, 0, 1, 1, 1,
-1.219077, -1.357862, -2.125196, 1, 0, 0, 1, 1,
-1.218103, -1.016002, -2.503193, 1, 0, 0, 1, 1,
-1.211875, -1.11502, -2.023203, 1, 0, 0, 1, 1,
-1.202444, 0.2338582, -1.626208, 1, 0, 0, 1, 1,
-1.200817, -1.898203, -3.03512, 1, 0, 0, 1, 1,
-1.198869, 0.634806, -1.729542, 0, 0, 0, 1, 1,
-1.198367, -0.298493, -3.998082, 0, 0, 0, 1, 1,
-1.198172, 0.06403095, -2.494883, 0, 0, 0, 1, 1,
-1.197616, 0.04352026, 0.5040761, 0, 0, 0, 1, 1,
-1.182226, 0.6768402, -2.104836, 0, 0, 0, 1, 1,
-1.180416, 0.6513209, -2.693214, 0, 0, 0, 1, 1,
-1.169818, -0.524211, -0.4283085, 0, 0, 0, 1, 1,
-1.168251, -1.798143, -3.520007, 1, 1, 1, 1, 1,
-1.166014, 0.6071871, -0.04943042, 1, 1, 1, 1, 1,
-1.152324, -0.950056, -1.288342, 1, 1, 1, 1, 1,
-1.145115, 0.62075, 0.1738338, 1, 1, 1, 1, 1,
-1.14431, -0.7232184, -2.115415, 1, 1, 1, 1, 1,
-1.144255, 0.0416795, -3.645665, 1, 1, 1, 1, 1,
-1.12506, 0.7094483, -1.243949, 1, 1, 1, 1, 1,
-1.124001, -0.2774894, -1.274682, 1, 1, 1, 1, 1,
-1.111971, -0.1622152, -1.917641, 1, 1, 1, 1, 1,
-1.110665, -0.5362864, -0.5769318, 1, 1, 1, 1, 1,
-1.108693, 1.146761, -0.4901764, 1, 1, 1, 1, 1,
-1.098153, -0.4361379, -2.292893, 1, 1, 1, 1, 1,
-1.097265, 1.132398, 0.006556723, 1, 1, 1, 1, 1,
-1.096728, -0.9027748, -3.144427, 1, 1, 1, 1, 1,
-1.089113, 1.390887, -1.291365, 1, 1, 1, 1, 1,
-1.088732, -0.1452951, -3.471529, 0, 0, 1, 1, 1,
-1.08494, 0.6934375, -1.184028, 1, 0, 0, 1, 1,
-1.078097, 0.06321079, -0.2205441, 1, 0, 0, 1, 1,
-1.075897, -0.4913131, -2.911822, 1, 0, 0, 1, 1,
-1.06678, -0.8374144, -2.564649, 1, 0, 0, 1, 1,
-1.064332, -0.4954517, 0.2167847, 1, 0, 0, 1, 1,
-1.058664, 0.09465414, -2.288722, 0, 0, 0, 1, 1,
-1.053908, -0.1037116, -1.544942, 0, 0, 0, 1, 1,
-1.04348, -1.769371, -2.970395, 0, 0, 0, 1, 1,
-1.035325, -1.017272, -3.575292, 0, 0, 0, 1, 1,
-1.031822, 0.1346367, -0.2839514, 0, 0, 0, 1, 1,
-1.030405, 0.253877, -1.222958, 0, 0, 0, 1, 1,
-1.028709, -0.897961, -1.281157, 0, 0, 0, 1, 1,
-1.026867, 0.1785427, -0.9642439, 1, 1, 1, 1, 1,
-1.026001, -1.235811, -2.343456, 1, 1, 1, 1, 1,
-1.02582, -0.4390037, -1.527576, 1, 1, 1, 1, 1,
-1.025061, -1.403895, -3.313258, 1, 1, 1, 1, 1,
-1.02505, -0.8112144, -2.330227, 1, 1, 1, 1, 1,
-1.024277, 0.5237905, -1.078669, 1, 1, 1, 1, 1,
-1.019932, 0.4704851, -0.8030745, 1, 1, 1, 1, 1,
-1.014008, 0.2178265, -1.776207, 1, 1, 1, 1, 1,
-1.005402, 1.859495, -0.4574347, 1, 1, 1, 1, 1,
-1.001035, 0.07587653, -1.726996, 1, 1, 1, 1, 1,
-0.9980729, -0.09081174, -1.971236, 1, 1, 1, 1, 1,
-0.9960182, -0.2629059, -2.482424, 1, 1, 1, 1, 1,
-0.99307, -1.77723, -2.428045, 1, 1, 1, 1, 1,
-0.9915929, -0.3529137, -2.98417, 1, 1, 1, 1, 1,
-0.9890277, 0.6621473, 0.1689716, 1, 1, 1, 1, 1,
-0.9886058, -0.103925, -0.1739009, 0, 0, 1, 1, 1,
-0.9809215, -1.39409, -2.141205, 1, 0, 0, 1, 1,
-0.9804217, 0.1424935, -0.3313216, 1, 0, 0, 1, 1,
-0.9779226, 0.57008, -0.3411152, 1, 0, 0, 1, 1,
-0.9759818, 0.003701918, -0.4992408, 1, 0, 0, 1, 1,
-0.9753107, -0.6031754, -2.146324, 1, 0, 0, 1, 1,
-0.975123, 1.015793, -0.1455761, 0, 0, 0, 1, 1,
-0.965699, -1.441903, -3.665706, 0, 0, 0, 1, 1,
-0.9512538, 0.7279879, -1.356207, 0, 0, 0, 1, 1,
-0.9497018, 0.5965208, -2.475729, 0, 0, 0, 1, 1,
-0.9467524, -0.5841175, -0.5998363, 0, 0, 0, 1, 1,
-0.9442325, -1.568753, -2.37417, 0, 0, 0, 1, 1,
-0.9438097, -0.8665013, -2.082878, 0, 0, 0, 1, 1,
-0.9324124, -0.7666079, -2.692728, 1, 1, 1, 1, 1,
-0.9320184, 0.4727023, -1.638451, 1, 1, 1, 1, 1,
-0.9261213, 0.6681695, -0.2006974, 1, 1, 1, 1, 1,
-0.9215981, -0.112947, -1.756341, 1, 1, 1, 1, 1,
-0.9168568, -0.2925645, -2.048252, 1, 1, 1, 1, 1,
-0.9111096, -2.337321, -1.536744, 1, 1, 1, 1, 1,
-0.9081313, 1.068364, -0.9471082, 1, 1, 1, 1, 1,
-0.9016405, 0.1824441, -1.268161, 1, 1, 1, 1, 1,
-0.8912381, 0.7323334, -0.5674291, 1, 1, 1, 1, 1,
-0.8838225, 0.2369789, -1.041388, 1, 1, 1, 1, 1,
-0.8833375, -1.899589, -1.091746, 1, 1, 1, 1, 1,
-0.8788372, -0.1379922, -1.271217, 1, 1, 1, 1, 1,
-0.8785964, -0.05901148, -2.68629, 1, 1, 1, 1, 1,
-0.8736781, 0.6482937, -2.567394, 1, 1, 1, 1, 1,
-0.8726833, 0.3863407, -0.6134369, 1, 1, 1, 1, 1,
-0.8716895, -0.7738033, -3.71767, 0, 0, 1, 1, 1,
-0.8716193, -0.1591689, 0.260403, 1, 0, 0, 1, 1,
-0.8658538, 1.33652, -2.428556, 1, 0, 0, 1, 1,
-0.8616642, -0.853087, -3.448256, 1, 0, 0, 1, 1,
-0.8597603, -0.7850032, -4.29289, 1, 0, 0, 1, 1,
-0.8567693, 0.2691655, -0.5122455, 1, 0, 0, 1, 1,
-0.8496682, 0.2920472, -1.401254, 0, 0, 0, 1, 1,
-0.8440084, 0.7474305, 0.1198158, 0, 0, 0, 1, 1,
-0.8408239, 0.1750562, -0.5681642, 0, 0, 0, 1, 1,
-0.8370637, -0.3668911, -0.7301438, 0, 0, 0, 1, 1,
-0.836817, 0.7601665, -1.652414, 0, 0, 0, 1, 1,
-0.8301422, -0.5287963, -2.601361, 0, 0, 0, 1, 1,
-0.8285843, -0.9063422, -2.715957, 0, 0, 0, 1, 1,
-0.8279655, -0.9529632, -3.869831, 1, 1, 1, 1, 1,
-0.8212086, -0.4591807, -4.174296, 1, 1, 1, 1, 1,
-0.8195006, -0.6809085, -3.10544, 1, 1, 1, 1, 1,
-0.8184527, -1.32921, -2.834434, 1, 1, 1, 1, 1,
-0.8178314, 0.5990888, -0.008607776, 1, 1, 1, 1, 1,
-0.8175755, -0.1380645, -2.356801, 1, 1, 1, 1, 1,
-0.8155727, -0.8432604, -4.262405, 1, 1, 1, 1, 1,
-0.8126897, -1.475221, -0.4288283, 1, 1, 1, 1, 1,
-0.808441, -1.624601, -3.833532, 1, 1, 1, 1, 1,
-0.8038535, -1.738184, -1.135907, 1, 1, 1, 1, 1,
-0.7975876, -1.045127, -2.469908, 1, 1, 1, 1, 1,
-0.795724, 0.7071409, 1.538756, 1, 1, 1, 1, 1,
-0.7953302, -0.788901, -1.842074, 1, 1, 1, 1, 1,
-0.7941259, 0.1947441, -1.740145, 1, 1, 1, 1, 1,
-0.7903404, -2.302686, -1.698548, 1, 1, 1, 1, 1,
-0.7797924, 1.139681, -0.6471464, 0, 0, 1, 1, 1,
-0.7767985, 0.3330114, -1.166699, 1, 0, 0, 1, 1,
-0.773001, 0.1045801, -2.013138, 1, 0, 0, 1, 1,
-0.7705356, 0.8555232, -0.1158002, 1, 0, 0, 1, 1,
-0.7569382, 0.176017, -1.562592, 1, 0, 0, 1, 1,
-0.7551135, 0.3449065, -1.317746, 1, 0, 0, 1, 1,
-0.7539361, -0.1714669, -0.6422353, 0, 0, 0, 1, 1,
-0.7530151, -0.4816532, -1.388136, 0, 0, 0, 1, 1,
-0.7525064, 0.682417, -0.6815604, 0, 0, 0, 1, 1,
-0.7522425, -2.59488, -1.796438, 0, 0, 0, 1, 1,
-0.7503847, 0.5952764, -0.6673204, 0, 0, 0, 1, 1,
-0.7476468, -0.269453, -1.8493, 0, 0, 0, 1, 1,
-0.7453839, -2.699058, -1.620586, 0, 0, 0, 1, 1,
-0.7423146, 0.9273323, 0.4337324, 1, 1, 1, 1, 1,
-0.7348153, 0.0344226, -2.248505, 1, 1, 1, 1, 1,
-0.7310554, -0.3784807, -3.83378, 1, 1, 1, 1, 1,
-0.729625, -0.4297007, -2.876078, 1, 1, 1, 1, 1,
-0.7287557, 0.3242988, -1.363046, 1, 1, 1, 1, 1,
-0.7266339, 0.8259616, 0.3077126, 1, 1, 1, 1, 1,
-0.7247844, 0.6589351, -2.092116, 1, 1, 1, 1, 1,
-0.7244631, -2.214439, -2.483591, 1, 1, 1, 1, 1,
-0.7194411, 0.03883832, -1.435062, 1, 1, 1, 1, 1,
-0.7176798, -0.3582543, -0.3510635, 1, 1, 1, 1, 1,
-0.7038599, -0.8664437, -1.001194, 1, 1, 1, 1, 1,
-0.7024975, 1.481523, -1.244111, 1, 1, 1, 1, 1,
-0.7019389, 0.5566136, -0.582353, 1, 1, 1, 1, 1,
-0.7010787, 2.014029, -1.457216, 1, 1, 1, 1, 1,
-0.700841, 0.7373413, -0.881389, 1, 1, 1, 1, 1,
-0.7004318, -0.6422014, -1.327176, 0, 0, 1, 1, 1,
-0.6992867, -1.384616, -3.441808, 1, 0, 0, 1, 1,
-0.6987956, -0.8507149, -2.396261, 1, 0, 0, 1, 1,
-0.6938189, 1.014733, -0.7342143, 1, 0, 0, 1, 1,
-0.6925521, -1.831173, -4.27974, 1, 0, 0, 1, 1,
-0.6895003, 1.847368, -0.7241885, 1, 0, 0, 1, 1,
-0.6835802, 0.04961203, -2.047446, 0, 0, 0, 1, 1,
-0.6799336, -1.299709, -1.633377, 0, 0, 0, 1, 1,
-0.6755984, 0.886833, -0.5829559, 0, 0, 0, 1, 1,
-0.6750739, -0.06105262, -0.9036213, 0, 0, 0, 1, 1,
-0.6731612, -0.6758078, -2.264391, 0, 0, 0, 1, 1,
-0.6724136, 0.01383647, -0.4990247, 0, 0, 0, 1, 1,
-0.6678326, -0.4515722, -1.011501, 0, 0, 0, 1, 1,
-0.6678129, 0.2363116, -1.321699, 1, 1, 1, 1, 1,
-0.6628122, 0.6359763, -1.484372, 1, 1, 1, 1, 1,
-0.6621374, -0.6437963, -2.437863, 1, 1, 1, 1, 1,
-0.6574413, -0.3067751, -3.723237, 1, 1, 1, 1, 1,
-0.6565912, -0.2399901, -2.205525, 1, 1, 1, 1, 1,
-0.6558467, -0.4239518, -0.5309724, 1, 1, 1, 1, 1,
-0.6433256, 1.263291, -1.490669, 1, 1, 1, 1, 1,
-0.6356242, 0.9832913, 0.4404264, 1, 1, 1, 1, 1,
-0.634999, -0.006487252, -0.3156633, 1, 1, 1, 1, 1,
-0.631636, 0.1672467, 0.08344636, 1, 1, 1, 1, 1,
-0.6298375, 0.359643, -0.5845468, 1, 1, 1, 1, 1,
-0.6281776, 0.1773015, -1.235232, 1, 1, 1, 1, 1,
-0.6261312, -1.076325, -1.508163, 1, 1, 1, 1, 1,
-0.6243396, -1.336623, -1.202124, 1, 1, 1, 1, 1,
-0.6227427, 1.032934, -0.3648491, 1, 1, 1, 1, 1,
-0.6216535, 0.3714086, -2.454949, 0, 0, 1, 1, 1,
-0.6192728, -0.6720079, -1.7384, 1, 0, 0, 1, 1,
-0.6186574, -0.8744276, -3.387422, 1, 0, 0, 1, 1,
-0.6183797, -1.836694, -1.692951, 1, 0, 0, 1, 1,
-0.614423, -1.437852, -2.854867, 1, 0, 0, 1, 1,
-0.6134529, 1.603026, 0.6184283, 1, 0, 0, 1, 1,
-0.6066863, 0.863727, -3.410071, 0, 0, 0, 1, 1,
-0.5999961, 0.01071566, -0.2227059, 0, 0, 0, 1, 1,
-0.5978844, 0.7853133, -2.405462, 0, 0, 0, 1, 1,
-0.5955479, -1.124652, -3.328476, 0, 0, 0, 1, 1,
-0.5934712, -1.529502, -0.4921695, 0, 0, 0, 1, 1,
-0.5928137, 0.1243913, -0.5357018, 0, 0, 0, 1, 1,
-0.5904132, -0.3523833, -2.453642, 0, 0, 0, 1, 1,
-0.5901442, 0.2090115, -0.5911347, 1, 1, 1, 1, 1,
-0.5875554, 0.7170984, -1.059001, 1, 1, 1, 1, 1,
-0.582964, 1.334949, -0.04846926, 1, 1, 1, 1, 1,
-0.5763105, 1.086774, -0.5878495, 1, 1, 1, 1, 1,
-0.574349, 1.127517, 0.8394254, 1, 1, 1, 1, 1,
-0.5714087, 0.281577, -0.9449413, 1, 1, 1, 1, 1,
-0.5697111, -1.503366, -3.053995, 1, 1, 1, 1, 1,
-0.5654246, -0.305151, -2.001784, 1, 1, 1, 1, 1,
-0.5636135, 0.741194, -0.9634473, 1, 1, 1, 1, 1,
-0.5588506, -0.1711675, -3.04166, 1, 1, 1, 1, 1,
-0.5573954, -0.07834136, -0.8217781, 1, 1, 1, 1, 1,
-0.5559704, -1.432043, -2.562582, 1, 1, 1, 1, 1,
-0.5551278, -0.2850395, -2.846069, 1, 1, 1, 1, 1,
-0.5502142, 0.9235656, -0.455442, 1, 1, 1, 1, 1,
-0.5450185, 0.427082, -0.2126361, 1, 1, 1, 1, 1,
-0.5444167, 1.143757, -0.04148357, 0, 0, 1, 1, 1,
-0.5353186, 0.5324909, 0.4403423, 1, 0, 0, 1, 1,
-0.5267565, 0.2468131, -2.13695, 1, 0, 0, 1, 1,
-0.5203577, 0.3484839, -1.830079, 1, 0, 0, 1, 1,
-0.5193322, -0.6284966, -2.179042, 1, 0, 0, 1, 1,
-0.5168756, 0.3921004, -0.4526873, 1, 0, 0, 1, 1,
-0.5117621, -0.7178035, -3.113844, 0, 0, 0, 1, 1,
-0.5103959, 1.241077, -1.600404, 0, 0, 0, 1, 1,
-0.5094019, 0.8775636, 0.7522376, 0, 0, 0, 1, 1,
-0.5089942, 1.43097, -0.5165536, 0, 0, 0, 1, 1,
-0.5088382, 0.5324385, -1.150874, 0, 0, 0, 1, 1,
-0.5080253, 0.4314112, -0.4094214, 0, 0, 0, 1, 1,
-0.5000911, 0.06227558, -1.848916, 0, 0, 0, 1, 1,
-0.4982874, -0.43808, -3.050816, 1, 1, 1, 1, 1,
-0.4958058, 0.6954612, -0.4149812, 1, 1, 1, 1, 1,
-0.4955422, -1.982737, -1.693797, 1, 1, 1, 1, 1,
-0.4939331, -1.142019, -3.924333, 1, 1, 1, 1, 1,
-0.4892976, -1.289283, -3.325024, 1, 1, 1, 1, 1,
-0.4891978, 0.009324489, -2.267719, 1, 1, 1, 1, 1,
-0.4813659, 0.9172139, -1.203299, 1, 1, 1, 1, 1,
-0.4770963, -0.4838106, -3.711353, 1, 1, 1, 1, 1,
-0.4759821, -0.3355512, -0.7235901, 1, 1, 1, 1, 1,
-0.4743742, 0.2512715, -1.419127, 1, 1, 1, 1, 1,
-0.4724344, 1.452535, -0.4984661, 1, 1, 1, 1, 1,
-0.4686882, 0.3989504, -0.7745554, 1, 1, 1, 1, 1,
-0.4652467, -0.4683849, -2.164065, 1, 1, 1, 1, 1,
-0.4633978, 0.5788572, -2.223426, 1, 1, 1, 1, 1,
-0.4569481, 0.1628463, -0.2813578, 1, 1, 1, 1, 1,
-0.4545852, -0.1157736, 0.220986, 0, 0, 1, 1, 1,
-0.4523503, 0.4506311, -0.159814, 1, 0, 0, 1, 1,
-0.4516681, -1.407029, -4.524164, 1, 0, 0, 1, 1,
-0.4363679, 1.179791, -0.1282659, 1, 0, 0, 1, 1,
-0.4344974, 0.5718049, 0.7952179, 1, 0, 0, 1, 1,
-0.4331979, -1.144712, -2.986471, 1, 0, 0, 1, 1,
-0.4299121, 1.058799, -0.2319123, 0, 0, 0, 1, 1,
-0.4286713, -1.861567, -3.072588, 0, 0, 0, 1, 1,
-0.4267179, 0.3309281, -1.524778, 0, 0, 0, 1, 1,
-0.4259079, 0.6910778, -0.4973686, 0, 0, 0, 1, 1,
-0.4223541, -0.873941, -1.680696, 0, 0, 0, 1, 1,
-0.4215724, 0.8427626, 0.4008802, 0, 0, 0, 1, 1,
-0.4201027, -0.7516533, -3.069395, 0, 0, 0, 1, 1,
-0.4170867, -0.2396142, -3.009101, 1, 1, 1, 1, 1,
-0.4154195, 0.2654676, -1.174634, 1, 1, 1, 1, 1,
-0.399483, -1.320611, -4.139588, 1, 1, 1, 1, 1,
-0.3941706, 0.2359505, -1.477857, 1, 1, 1, 1, 1,
-0.3937877, 0.337747, 0.5469036, 1, 1, 1, 1, 1,
-0.3935635, 0.6685843, -1.063229, 1, 1, 1, 1, 1,
-0.3926764, 0.6054786, -0.2338702, 1, 1, 1, 1, 1,
-0.3879176, 0.2844546, 0.8846446, 1, 1, 1, 1, 1,
-0.3835011, 0.05878887, -1.969907, 1, 1, 1, 1, 1,
-0.3819202, 0.1600114, -3.45877, 1, 1, 1, 1, 1,
-0.380955, -0.7464892, -3.765063, 1, 1, 1, 1, 1,
-0.3808116, -1.117265, -2.939111, 1, 1, 1, 1, 1,
-0.3806012, -0.5756538, -1.160903, 1, 1, 1, 1, 1,
-0.3796674, -0.9904578, -1.965679, 1, 1, 1, 1, 1,
-0.3778537, -0.7968244, -3.56291, 1, 1, 1, 1, 1,
-0.3777859, -0.6708047, -2.312714, 0, 0, 1, 1, 1,
-0.3743453, 0.8958984, -1.984596, 1, 0, 0, 1, 1,
-0.3738553, 1.504329, 0.6872303, 1, 0, 0, 1, 1,
-0.3727983, -0.9565367, -3.818535, 1, 0, 0, 1, 1,
-0.3706268, -1.239836, -4.094085, 1, 0, 0, 1, 1,
-0.3695791, -0.9308615, -2.975791, 1, 0, 0, 1, 1,
-0.3666906, 0.8709477, 0.4541194, 0, 0, 0, 1, 1,
-0.3664827, -0.5009029, -2.853128, 0, 0, 0, 1, 1,
-0.3662902, -0.9396024, -3.537144, 0, 0, 0, 1, 1,
-0.3633613, -1.239262, -3.638716, 0, 0, 0, 1, 1,
-0.3617871, -0.1795402, -0.5130961, 0, 0, 0, 1, 1,
-0.3590912, -0.816389, -5.925637, 0, 0, 0, 1, 1,
-0.3571862, 1.316733, -0.9361817, 0, 0, 0, 1, 1,
-0.3568559, 0.814709, -1.349926, 1, 1, 1, 1, 1,
-0.3545581, 0.5897996, -1.337399, 1, 1, 1, 1, 1,
-0.3514626, 0.07730997, -1.651119, 1, 1, 1, 1, 1,
-0.3500856, 0.7579454, -0.0139966, 1, 1, 1, 1, 1,
-0.3498903, -0.9534716, -5.586896, 1, 1, 1, 1, 1,
-0.3414313, -0.1274665, -1.046515, 1, 1, 1, 1, 1,
-0.3396828, 0.6041539, -1.052325, 1, 1, 1, 1, 1,
-0.3306997, -2.532057, -3.349623, 1, 1, 1, 1, 1,
-0.3283921, 0.3082761, -0.50028, 1, 1, 1, 1, 1,
-0.3260473, 0.2482449, 0.7805632, 1, 1, 1, 1, 1,
-0.3256038, 0.7663786, -0.07250571, 1, 1, 1, 1, 1,
-0.3247977, 0.1219369, -1.272796, 1, 1, 1, 1, 1,
-0.3170211, -0.7554867, -2.46763, 1, 1, 1, 1, 1,
-0.3150438, -2.368921, -3.991981, 1, 1, 1, 1, 1,
-0.3125287, 0.4300467, 0.5108413, 1, 1, 1, 1, 1,
-0.3120314, -0.1540767, -2.153118, 0, 0, 1, 1, 1,
-0.3112883, 1.27758, -0.7324627, 1, 0, 0, 1, 1,
-0.3076858, 0.5425026, -0.3973453, 1, 0, 0, 1, 1,
-0.3070497, 0.9139371, 0.5784478, 1, 0, 0, 1, 1,
-0.3037959, 0.4058146, -1.19602, 1, 0, 0, 1, 1,
-0.3008393, 0.5589241, 1.167994, 1, 0, 0, 1, 1,
-0.2999246, -1.443329, -2.15696, 0, 0, 0, 1, 1,
-0.2979032, 0.2730343, 0.7760864, 0, 0, 0, 1, 1,
-0.2947322, 0.7988446, 0.3326694, 0, 0, 0, 1, 1,
-0.2911503, -0.3252176, -3.481283, 0, 0, 0, 1, 1,
-0.2903778, -1.085196, -1.958152, 0, 0, 0, 1, 1,
-0.2863622, -0.605223, -2.956194, 0, 0, 0, 1, 1,
-0.2850615, 0.7031386, 0.1079642, 0, 0, 0, 1, 1,
-0.2839988, 2.263003, -0.7379315, 1, 1, 1, 1, 1,
-0.2828339, 1.707714, -0.8850017, 1, 1, 1, 1, 1,
-0.2826546, 2.258034, 0.5189455, 1, 1, 1, 1, 1,
-0.2805147, -0.2119987, -1.872569, 1, 1, 1, 1, 1,
-0.2795409, -1.247957, -2.058383, 1, 1, 1, 1, 1,
-0.2765516, 1.446068, -0.6738079, 1, 1, 1, 1, 1,
-0.2761894, 0.5529304, 0.3774271, 1, 1, 1, 1, 1,
-0.270345, -0.4407412, -4.825638, 1, 1, 1, 1, 1,
-0.2697507, -1.908063, -3.448814, 1, 1, 1, 1, 1,
-0.2676916, 0.4102209, 0.09543391, 1, 1, 1, 1, 1,
-0.2676484, -1.252961, -2.464296, 1, 1, 1, 1, 1,
-0.2600072, -0.2749282, -1.659854, 1, 1, 1, 1, 1,
-0.2597303, -0.3394012, -3.927659, 1, 1, 1, 1, 1,
-0.2567353, 0.8815643, -2.301998, 1, 1, 1, 1, 1,
-0.2561041, -0.01494406, -0.8094444, 1, 1, 1, 1, 1,
-0.2548529, 0.3281754, 0.1023254, 0, 0, 1, 1, 1,
-0.2510817, -0.1632667, -2.47366, 1, 0, 0, 1, 1,
-0.2494452, 0.5637139, -0.3383199, 1, 0, 0, 1, 1,
-0.2490845, -0.2755192, -2.215234, 1, 0, 0, 1, 1,
-0.2486948, -0.0360113, -0.5187799, 1, 0, 0, 1, 1,
-0.2485728, 0.6009871, -1.067763, 1, 0, 0, 1, 1,
-0.2481344, -0.2630285, -3.133109, 0, 0, 0, 1, 1,
-0.2464044, -0.9825405, -3.617669, 0, 0, 0, 1, 1,
-0.2443041, -1.460449, -1.768277, 0, 0, 0, 1, 1,
-0.2426706, 0.8811899, -0.1434588, 0, 0, 0, 1, 1,
-0.2402485, -1.349307, -2.158264, 0, 0, 0, 1, 1,
-0.2392252, -1.0982, -4.155257, 0, 0, 0, 1, 1,
-0.2389457, -1.353606, -3.923693, 0, 0, 0, 1, 1,
-0.2364435, 0.9092509, 1.610405, 1, 1, 1, 1, 1,
-0.2350571, 0.6670173, 0.3238477, 1, 1, 1, 1, 1,
-0.2342539, 0.4522581, -0.6213096, 1, 1, 1, 1, 1,
-0.2338209, -0.1732568, -1.958601, 1, 1, 1, 1, 1,
-0.2303048, -0.6264961, -3.905408, 1, 1, 1, 1, 1,
-0.2271586, 0.1723115, 0.3699522, 1, 1, 1, 1, 1,
-0.2215404, 1.12854, -0.6402261, 1, 1, 1, 1, 1,
-0.2179475, -0.3434, -1.544699, 1, 1, 1, 1, 1,
-0.2163074, 0.7307903, -0.628341, 1, 1, 1, 1, 1,
-0.2156223, -0.8591717, -1.310762, 1, 1, 1, 1, 1,
-0.2153527, 3.022831, -0.1238798, 1, 1, 1, 1, 1,
-0.2022325, 0.3602199, -0.6268923, 1, 1, 1, 1, 1,
-0.2020865, -1.856712, -4.104928, 1, 1, 1, 1, 1,
-0.2018349, -0.4582786, -2.349185, 1, 1, 1, 1, 1,
-0.1954844, 1.073575, -0.9047711, 1, 1, 1, 1, 1,
-0.1952661, 0.00778666, -1.196431, 0, 0, 1, 1, 1,
-0.1886249, -1.956936, -2.338162, 1, 0, 0, 1, 1,
-0.1849008, -0.866568, -2.582455, 1, 0, 0, 1, 1,
-0.1795119, -0.8379283, -2.9766, 1, 0, 0, 1, 1,
-0.1793124, -0.09181937, -1.064233, 1, 0, 0, 1, 1,
-0.1706223, -1.239273, -5.331222, 1, 0, 0, 1, 1,
-0.1697107, 0.5827341, -0.6456354, 0, 0, 0, 1, 1,
-0.1669838, 1.819471, -0.9149912, 0, 0, 0, 1, 1,
-0.1650551, 0.4748239, -1.339767, 0, 0, 0, 1, 1,
-0.1636035, 0.3275766, -1.099518, 0, 0, 0, 1, 1,
-0.1626532, 0.6657501, -0.3845453, 0, 0, 0, 1, 1,
-0.1584488, -2.062364, -3.049899, 0, 0, 0, 1, 1,
-0.1568183, 0.5236006, -1.124311, 0, 0, 0, 1, 1,
-0.1528746, -1.349566, -3.604743, 1, 1, 1, 1, 1,
-0.1496475, 0.5267224, -1.143844, 1, 1, 1, 1, 1,
-0.145605, -0.6020106, -3.935366, 1, 1, 1, 1, 1,
-0.136347, 0.7008131, 1.478837, 1, 1, 1, 1, 1,
-0.1357058, 0.9523289, 1.44216, 1, 1, 1, 1, 1,
-0.1350702, -1.771451, -1.425724, 1, 1, 1, 1, 1,
-0.1348398, 0.5867616, 0.9993073, 1, 1, 1, 1, 1,
-0.1331923, -0.1911431, -3.462918, 1, 1, 1, 1, 1,
-0.1317293, -0.1679154, -2.414607, 1, 1, 1, 1, 1,
-0.130734, 0.2307117, -0.877918, 1, 1, 1, 1, 1,
-0.1295533, -0.7650057, -2.587517, 1, 1, 1, 1, 1,
-0.1245011, 0.9309974, -0.4043757, 1, 1, 1, 1, 1,
-0.1240079, -0.9961308, -3.877105, 1, 1, 1, 1, 1,
-0.1086508, -1.695425, -2.766166, 1, 1, 1, 1, 1,
-0.1085538, -0.3632151, -4.823434, 1, 1, 1, 1, 1,
-0.1067626, -1.513256, -5.749361, 0, 0, 1, 1, 1,
-0.1065379, 0.4241329, -1.101397, 1, 0, 0, 1, 1,
-0.1055346, -1.289107, -2.668737, 1, 0, 0, 1, 1,
-0.1050994, -0.7462133, -2.418147, 1, 0, 0, 1, 1,
-0.09895153, -0.2170469, -3.109895, 1, 0, 0, 1, 1,
-0.09837525, 0.3167692, 0.1463902, 1, 0, 0, 1, 1,
-0.09830974, 0.297934, 0.9079837, 0, 0, 0, 1, 1,
-0.09629187, 0.7773026, 0.9150539, 0, 0, 0, 1, 1,
-0.09555246, 0.3927128, -0.7158942, 0, 0, 0, 1, 1,
-0.09331261, 0.3877113, -0.8521096, 0, 0, 0, 1, 1,
-0.09093309, 1.350297, 0.5845249, 0, 0, 0, 1, 1,
-0.08917322, 0.8025245, 1.413076, 0, 0, 0, 1, 1,
-0.08084957, -2.160556, -2.884145, 0, 0, 0, 1, 1,
-0.07604472, -0.5191324, -3.19912, 1, 1, 1, 1, 1,
-0.07076947, 1.255402, 0.5673506, 1, 1, 1, 1, 1,
-0.06956047, -0.1448269, -2.640839, 1, 1, 1, 1, 1,
-0.06936961, -0.1130983, -1.744051, 1, 1, 1, 1, 1,
-0.06928457, -1.309639, -1.655246, 1, 1, 1, 1, 1,
-0.06835788, 1.609311, 0.7128294, 1, 1, 1, 1, 1,
-0.06649897, 0.3548943, -0.3834985, 1, 1, 1, 1, 1,
-0.06345462, -0.1558841, -2.346074, 1, 1, 1, 1, 1,
-0.06318916, 0.1407301, -0.2489408, 1, 1, 1, 1, 1,
-0.06174368, 0.2544786, -1.17887, 1, 1, 1, 1, 1,
-0.05967664, -0.86739, -1.796122, 1, 1, 1, 1, 1,
-0.05936211, -0.1147274, -1.273976, 1, 1, 1, 1, 1,
-0.0578697, -0.4298207, -2.966379, 1, 1, 1, 1, 1,
-0.05639485, -1.068926, -4.150166, 1, 1, 1, 1, 1,
-0.05490381, 0.1689599, -0.5807928, 1, 1, 1, 1, 1,
-0.04752576, -0.1264685, -4.088017, 0, 0, 1, 1, 1,
-0.04537861, 0.4785136, -0.38351, 1, 0, 0, 1, 1,
-0.04378232, -1.864583, -4.624654, 1, 0, 0, 1, 1,
-0.0435983, 0.1693843, -0.1812755, 1, 0, 0, 1, 1,
-0.0413004, -0.8562078, -1.984537, 1, 0, 0, 1, 1,
-0.03380522, 1.565504, 1.970241, 1, 0, 0, 1, 1,
-0.03117258, -0.5105227, -2.299782, 0, 0, 0, 1, 1,
-0.03085282, -0.2655905, -2.395049, 0, 0, 0, 1, 1,
-0.02986054, 0.5708512, -2.347946, 0, 0, 0, 1, 1,
-0.0291479, -0.4040122, -3.395041, 0, 0, 0, 1, 1,
-0.02906752, 1.845184, 0.7980894, 0, 0, 0, 1, 1,
-0.02415168, 1.345021, -0.1703058, 0, 0, 0, 1, 1,
-0.0233568, 0.05386382, -1.74423, 0, 0, 0, 1, 1,
-0.008784191, -0.4769171, -3.626993, 1, 1, 1, 1, 1,
-0.005468812, -0.8987815, -3.052526, 1, 1, 1, 1, 1,
-0.003862995, 1.545318, 0.9332966, 1, 1, 1, 1, 1,
5.601559e-05, -1.42313, 2.598311, 1, 1, 1, 1, 1,
0.001555438, 0.8296226, 0.6893746, 1, 1, 1, 1, 1,
0.004685646, -0.43254, 2.305887, 1, 1, 1, 1, 1,
0.01013943, -0.9521658, 2.939824, 1, 1, 1, 1, 1,
0.01080614, 0.7856961, 0.6108868, 1, 1, 1, 1, 1,
0.01662525, -1.430361, 3.425921, 1, 1, 1, 1, 1,
0.01828729, 0.7576021, -0.007403229, 1, 1, 1, 1, 1,
0.02246579, -0.9718065, 2.719996, 1, 1, 1, 1, 1,
0.02655753, 0.4123324, -1.376515, 1, 1, 1, 1, 1,
0.02825183, -0.8882171, 5.911941, 1, 1, 1, 1, 1,
0.02869479, -0.3152268, 1.649064, 1, 1, 1, 1, 1,
0.03018447, 0.3285258, -0.1826875, 1, 1, 1, 1, 1,
0.0370073, 0.1125819, -0.9541921, 0, 0, 1, 1, 1,
0.03974323, 2.262814, 2.056762, 1, 0, 0, 1, 1,
0.04344881, -0.5286087, 3.244979, 1, 0, 0, 1, 1,
0.04510092, -0.2610229, 3.494221, 1, 0, 0, 1, 1,
0.04599634, 0.7363015, 1.418452, 1, 0, 0, 1, 1,
0.04776351, -0.5049241, 3.794075, 1, 0, 0, 1, 1,
0.04918613, 1.608336, -0.8663968, 0, 0, 0, 1, 1,
0.05214603, -2.059427, 4.087226, 0, 0, 0, 1, 1,
0.05352451, -0.1763624, 3.03406, 0, 0, 0, 1, 1,
0.05534538, -0.1158141, 2.136683, 0, 0, 0, 1, 1,
0.05940352, -0.2246603, 3.757296, 0, 0, 0, 1, 1,
0.06101151, -1.473401, 4.289479, 0, 0, 0, 1, 1,
0.06610666, 0.4927947, 0.3850001, 0, 0, 0, 1, 1,
0.06626102, -1.614383, 2.878306, 1, 1, 1, 1, 1,
0.0675002, -1.421803, 3.236022, 1, 1, 1, 1, 1,
0.06845966, -0.8105119, 2.237271, 1, 1, 1, 1, 1,
0.06943796, 0.181367, 2.797791, 1, 1, 1, 1, 1,
0.07115026, 1.298738, 0.969084, 1, 1, 1, 1, 1,
0.07177374, -0.7488955, 3.693552, 1, 1, 1, 1, 1,
0.07287147, 0.2791996, 0.5022835, 1, 1, 1, 1, 1,
0.0732512, -1.10394, 3.711847, 1, 1, 1, 1, 1,
0.07545128, 1.191937, -1.018286, 1, 1, 1, 1, 1,
0.07698014, 0.2187068, 0.7825612, 1, 1, 1, 1, 1,
0.07733192, -0.386101, 2.958215, 1, 1, 1, 1, 1,
0.07766891, -0.6086873, 3.074622, 1, 1, 1, 1, 1,
0.08392005, 0.4003872, -0.3518561, 1, 1, 1, 1, 1,
0.08455354, 0.6581107, -0.03975821, 1, 1, 1, 1, 1,
0.08638381, 0.2364466, -2.181227, 1, 1, 1, 1, 1,
0.09053002, -1.097688, 3.461547, 0, 0, 1, 1, 1,
0.09824999, 0.5534451, 0.8737334, 1, 0, 0, 1, 1,
0.1055633, -1.496266, 3.208231, 1, 0, 0, 1, 1,
0.1057846, -0.703441, 3.775294, 1, 0, 0, 1, 1,
0.1075816, -0.9913349, 4.139163, 1, 0, 0, 1, 1,
0.1114655, 0.3628675, -1.1129, 1, 0, 0, 1, 1,
0.1174593, 0.09669174, 0.1166776, 0, 0, 0, 1, 1,
0.120231, 0.9469185, -0.3676755, 0, 0, 0, 1, 1,
0.1228305, -1.116081, 4.262634, 0, 0, 0, 1, 1,
0.1245338, 1.088899, 0.3111613, 0, 0, 0, 1, 1,
0.125309, -0.021837, 2.99941, 0, 0, 0, 1, 1,
0.1277034, -1.724099, 5.082697, 0, 0, 0, 1, 1,
0.1280695, 0.4853691, -1.280316, 0, 0, 0, 1, 1,
0.128831, -0.9219797, 4.130645, 1, 1, 1, 1, 1,
0.1320189, 0.4353128, -0.9540755, 1, 1, 1, 1, 1,
0.1332497, -0.296779, 3.486386, 1, 1, 1, 1, 1,
0.138029, -0.9040525, 1.845527, 1, 1, 1, 1, 1,
0.1388951, -0.8221763, 2.569052, 1, 1, 1, 1, 1,
0.139277, -0.3847879, 2.834962, 1, 1, 1, 1, 1,
0.1404001, -0.2547668, 3.43796, 1, 1, 1, 1, 1,
0.1456753, -1.087695, 3.529888, 1, 1, 1, 1, 1,
0.1480745, -0.815217, 2.876008, 1, 1, 1, 1, 1,
0.1546021, -0.6246114, 3.393717, 1, 1, 1, 1, 1,
0.156183, 0.09725101, 1.270792, 1, 1, 1, 1, 1,
0.1571965, -1.461518, 3.290477, 1, 1, 1, 1, 1,
0.1606627, 1.070856, 0.8604884, 1, 1, 1, 1, 1,
0.1611363, -0.6687523, 3.728619, 1, 1, 1, 1, 1,
0.1648862, 0.4277927, 1.931654, 1, 1, 1, 1, 1,
0.165363, -0.4472038, 2.768519, 0, 0, 1, 1, 1,
0.1730151, -0.5293756, 2.810059, 1, 0, 0, 1, 1,
0.1737141, 1.307621, 2.859371, 1, 0, 0, 1, 1,
0.1752457, 0.6594816, -0.04790479, 1, 0, 0, 1, 1,
0.1755754, -0.3612983, 2.901589, 1, 0, 0, 1, 1,
0.1760635, -0.1088055, 2.493835, 1, 0, 0, 1, 1,
0.1795988, -0.3871353, 4.206951, 0, 0, 0, 1, 1,
0.1823003, -0.1997016, 2.980307, 0, 0, 0, 1, 1,
0.1829081, -0.5798271, 3.934464, 0, 0, 0, 1, 1,
0.1852463, 0.3513626, 0.770908, 0, 0, 0, 1, 1,
0.1878095, -0.0561728, 2.453101, 0, 0, 0, 1, 1,
0.1889737, 0.150991, 0.9884816, 0, 0, 0, 1, 1,
0.1890574, -2.141652, 3.898047, 0, 0, 0, 1, 1,
0.1900766, 0.05120308, 3.004065, 1, 1, 1, 1, 1,
0.1916127, -0.928646, 1.90441, 1, 1, 1, 1, 1,
0.1931882, -1.589157, 3.506203, 1, 1, 1, 1, 1,
0.1941486, 0.1692812, 2.412512, 1, 1, 1, 1, 1,
0.1977082, 0.5036675, -1.512197, 1, 1, 1, 1, 1,
0.1991592, -0.4613808, 2.278427, 1, 1, 1, 1, 1,
0.2042153, 1.248819, 0.082456, 1, 1, 1, 1, 1,
0.2058818, -0.5651525, 2.249398, 1, 1, 1, 1, 1,
0.2060558, 1.539008, -0.989485, 1, 1, 1, 1, 1,
0.210142, -1.55857, 3.721517, 1, 1, 1, 1, 1,
0.2167727, 0.8582426, -1.933714, 1, 1, 1, 1, 1,
0.2195644, 0.5850825, 0.2079623, 1, 1, 1, 1, 1,
0.2211833, 0.9255481, -0.5866706, 1, 1, 1, 1, 1,
0.2228614, -0.5570273, 2.103816, 1, 1, 1, 1, 1,
0.2297782, -0.6370173, 4.349057, 1, 1, 1, 1, 1,
0.2320804, 2.607815, 0.8717064, 0, 0, 1, 1, 1,
0.23362, -0.4206654, 5.749025, 1, 0, 0, 1, 1,
0.2357858, -0.9025288, 1.714479, 1, 0, 0, 1, 1,
0.2374694, 0.7770236, 1.946467, 1, 0, 0, 1, 1,
0.2407138, 0.1736699, 1.229332, 1, 0, 0, 1, 1,
0.2417144, 0.1269708, 1.880383, 1, 0, 0, 1, 1,
0.2443053, 0.1125799, 1.190194, 0, 0, 0, 1, 1,
0.2444354, 1.416859, 0.5712935, 0, 0, 0, 1, 1,
0.2470484, -0.8955202, 1.695562, 0, 0, 0, 1, 1,
0.2475072, -0.08125842, 1.618645, 0, 0, 0, 1, 1,
0.2492197, -0.7935823, 2.8219, 0, 0, 0, 1, 1,
0.2575226, 0.6635262, -0.1139014, 0, 0, 0, 1, 1,
0.2628854, 0.4170866, 1.677047, 0, 0, 0, 1, 1,
0.2686514, 0.9042791, -0.7716591, 1, 1, 1, 1, 1,
0.2694857, 0.5516818, 0.6827151, 1, 1, 1, 1, 1,
0.2726443, 0.06432021, 2.096104, 1, 1, 1, 1, 1,
0.2731434, -0.3084937, 1.102384, 1, 1, 1, 1, 1,
0.2771786, -1.259385, 3.942183, 1, 1, 1, 1, 1,
0.2780916, 0.8311192, 1.75934, 1, 1, 1, 1, 1,
0.2803193, 0.612405, -0.02574633, 1, 1, 1, 1, 1,
0.2965861, -0.4828285, 3.307091, 1, 1, 1, 1, 1,
0.2982225, -0.6797111, 2.160836, 1, 1, 1, 1, 1,
0.3038206, -2.139801, 1.355584, 1, 1, 1, 1, 1,
0.3038726, -0.2644841, 0.1294561, 1, 1, 1, 1, 1,
0.3047648, 1.78114, 0.6032489, 1, 1, 1, 1, 1,
0.3070573, -0.5502633, 3.035473, 1, 1, 1, 1, 1,
0.3105544, 2.799252, -1.376981, 1, 1, 1, 1, 1,
0.3138108, 0.4813739, 0.4240522, 1, 1, 1, 1, 1,
0.3226946, 0.9591717, 0.9928001, 0, 0, 1, 1, 1,
0.3279523, 0.06906137, 2.671167, 1, 0, 0, 1, 1,
0.3321551, 1.177606, -1.439878, 1, 0, 0, 1, 1,
0.332482, -0.1012582, 2.077581, 1, 0, 0, 1, 1,
0.3358191, -0.5675564, 3.264588, 1, 0, 0, 1, 1,
0.3382824, -0.5048048, 2.376159, 1, 0, 0, 1, 1,
0.3402371, 0.3749631, 1.212655, 0, 0, 0, 1, 1,
0.3408036, 0.5831921, -0.3799856, 0, 0, 0, 1, 1,
0.340912, 0.1900279, 0.06175691, 0, 0, 0, 1, 1,
0.341212, 0.1339162, 2.833564, 0, 0, 0, 1, 1,
0.3442596, 0.2526449, -0.3451735, 0, 0, 0, 1, 1,
0.3503631, -0.6698656, 4.487417, 0, 0, 0, 1, 1,
0.3522843, 0.6016244, 1.665189, 0, 0, 0, 1, 1,
0.3523937, 0.3827201, -0.8576872, 1, 1, 1, 1, 1,
0.3533148, -0.5649576, 2.496099, 1, 1, 1, 1, 1,
0.3547156, -0.1666622, 0.1876823, 1, 1, 1, 1, 1,
0.3574518, -1.94485, 2.270299, 1, 1, 1, 1, 1,
0.3614129, -1.383473, 3.028628, 1, 1, 1, 1, 1,
0.3650866, 2.54246, 1.476855, 1, 1, 1, 1, 1,
0.3657384, -0.01406392, 1.198772, 1, 1, 1, 1, 1,
0.3701498, -1.641946, 2.588551, 1, 1, 1, 1, 1,
0.373149, -0.4493056, 3.913611, 1, 1, 1, 1, 1,
0.3796541, -0.3416286, 1.577642, 1, 1, 1, 1, 1,
0.3864224, 1.209058, -0.6991653, 1, 1, 1, 1, 1,
0.39029, 1.222789, -0.9466257, 1, 1, 1, 1, 1,
0.3936854, 0.2740871, 1.209355, 1, 1, 1, 1, 1,
0.3970356, 0.9846117, 0.3935646, 1, 1, 1, 1, 1,
0.3995814, 0.6364236, -1.22483, 1, 1, 1, 1, 1,
0.3996046, 1.548635, -1.73264, 0, 0, 1, 1, 1,
0.4003194, 0.9541849, -0.2073366, 1, 0, 0, 1, 1,
0.4006776, -0.5980241, 1.225408, 1, 0, 0, 1, 1,
0.4013154, -1.660432, 3.511668, 1, 0, 0, 1, 1,
0.4037858, -0.4735384, 4.538472, 1, 0, 0, 1, 1,
0.4048727, 0.2348506, 1.229352, 1, 0, 0, 1, 1,
0.4110862, 1.522058, 0.7146875, 0, 0, 0, 1, 1,
0.4164001, -0.4120425, 1.934595, 0, 0, 0, 1, 1,
0.4196455, -0.2577537, -0.4334701, 0, 0, 0, 1, 1,
0.4233351, -0.9433342, 3.501497, 0, 0, 0, 1, 1,
0.4254004, -0.6311881, 2.785393, 0, 0, 0, 1, 1,
0.4275514, 1.941485, -2.467289, 0, 0, 0, 1, 1,
0.4288585, 1.815502, -1.040926, 0, 0, 0, 1, 1,
0.4303665, -1.297243, 1.999684, 1, 1, 1, 1, 1,
0.4372493, 1.903336, -1.46937, 1, 1, 1, 1, 1,
0.4372661, -1.013158, 0.9965886, 1, 1, 1, 1, 1,
0.4415509, -0.3839914, 2.463326, 1, 1, 1, 1, 1,
0.4417654, 1.464088, 0.131489, 1, 1, 1, 1, 1,
0.4424674, 0.5107955, -1.685615, 1, 1, 1, 1, 1,
0.4463861, 1.131027, -1.087175, 1, 1, 1, 1, 1,
0.4533471, 1.207438, 1.265049, 1, 1, 1, 1, 1,
0.4556537, 1.196628, 0.6932967, 1, 1, 1, 1, 1,
0.4588428, 0.5155882, 0.2132454, 1, 1, 1, 1, 1,
0.4592145, 0.7011396, 0.6458305, 1, 1, 1, 1, 1,
0.4600545, 0.2168152, 1.316004, 1, 1, 1, 1, 1,
0.4633067, -2.0987, 3.851194, 1, 1, 1, 1, 1,
0.4641582, -0.3174567, 3.030211, 1, 1, 1, 1, 1,
0.4656987, -2.338901, 1.345506, 1, 1, 1, 1, 1,
0.4715661, 0.3335149, 0.4980441, 0, 0, 1, 1, 1,
0.4744274, 1.01443, 0.7109929, 1, 0, 0, 1, 1,
0.4781836, -1.552508, 3.357315, 1, 0, 0, 1, 1,
0.4787641, 0.05569912, 1.525319, 1, 0, 0, 1, 1,
0.4818453, -0.6093321, 3.515196, 1, 0, 0, 1, 1,
0.4880009, 1.7113, -1.092357, 1, 0, 0, 1, 1,
0.4884151, 0.2104772, 2.005087, 0, 0, 0, 1, 1,
0.4885496, 1.018016, 1.066138, 0, 0, 0, 1, 1,
0.4912591, -0.9658754, 2.50212, 0, 0, 0, 1, 1,
0.4912876, -0.3100901, 1.518135, 0, 0, 0, 1, 1,
0.491867, -0.02064235, 3.825024, 0, 0, 0, 1, 1,
0.495855, 0.8382044, -0.1267234, 0, 0, 0, 1, 1,
0.5002946, 0.3025475, 0.1860279, 0, 0, 0, 1, 1,
0.505252, -0.9187166, 3.651277, 1, 1, 1, 1, 1,
0.5173805, -1.056521, 2.953504, 1, 1, 1, 1, 1,
0.5180224, 2.485759, -0.8205164, 1, 1, 1, 1, 1,
0.5183121, 1.448838, -0.6321295, 1, 1, 1, 1, 1,
0.5210927, -1.554073, 4.920406, 1, 1, 1, 1, 1,
0.5223606, -0.632151, 2.034168, 1, 1, 1, 1, 1,
0.5231979, 1.465913, 2.164986, 1, 1, 1, 1, 1,
0.5290745, -0.254833, 1.768717, 1, 1, 1, 1, 1,
0.5353028, 0.5365596, 1.996117, 1, 1, 1, 1, 1,
0.5359831, -2.698127, 1.624975, 1, 1, 1, 1, 1,
0.5381892, 0.6869414, -0.6774418, 1, 1, 1, 1, 1,
0.5412897, -0.2666233, 3.06407, 1, 1, 1, 1, 1,
0.5470287, -0.8255339, 3.176703, 1, 1, 1, 1, 1,
0.5510705, -0.1827006, 2.924102, 1, 1, 1, 1, 1,
0.5529804, -0.1548023, 3.107958, 1, 1, 1, 1, 1,
0.5541572, 0.4128166, 1.583259, 0, 0, 1, 1, 1,
0.5560826, -0.006707163, 0.1473439, 1, 0, 0, 1, 1,
0.5617607, -0.4202072, 2.424871, 1, 0, 0, 1, 1,
0.5631938, -0.3090129, 1.639716, 1, 0, 0, 1, 1,
0.5659249, 0.7166765, -0.5682991, 1, 0, 0, 1, 1,
0.5696467, -0.7049584, 4.104099, 1, 0, 0, 1, 1,
0.5744441, -2.705724, 4.629487, 0, 0, 0, 1, 1,
0.5748282, -0.4522417, 2.201712, 0, 0, 0, 1, 1,
0.5775505, 1.26153, 2.073986, 0, 0, 0, 1, 1,
0.5829719, -0.02861211, 1.062652, 0, 0, 0, 1, 1,
0.5873715, -1.298931, 1.589149, 0, 0, 0, 1, 1,
0.5876612, 0.7574478, 1.502864, 0, 0, 0, 1, 1,
0.5905476, -0.5172567, 1.632693, 0, 0, 0, 1, 1,
0.5913358, -0.6881299, 0.4825334, 1, 1, 1, 1, 1,
0.6035497, -0.4190563, 3.450826, 1, 1, 1, 1, 1,
0.6077597, -0.6821799, 2.539184, 1, 1, 1, 1, 1,
0.609021, -2.045802, 2.993271, 1, 1, 1, 1, 1,
0.6131146, 0.02373541, 3.040208, 1, 1, 1, 1, 1,
0.61415, -0.09894089, 2.372487, 1, 1, 1, 1, 1,
0.6143034, 1.210041, -1.374704, 1, 1, 1, 1, 1,
0.6174962, 0.06977669, -0.07889865, 1, 1, 1, 1, 1,
0.6186435, -0.2055919, 3.446823, 1, 1, 1, 1, 1,
0.620342, 1.952584, -0.4465322, 1, 1, 1, 1, 1,
0.6208373, -0.219129, 4.29803, 1, 1, 1, 1, 1,
0.6247872, -0.5984135, 2.530479, 1, 1, 1, 1, 1,
0.6279301, 1.134199, -0.7889749, 1, 1, 1, 1, 1,
0.6314358, 0.2452625, 0.7816606, 1, 1, 1, 1, 1,
0.6334283, -1.631153, 2.744271, 1, 1, 1, 1, 1,
0.6351128, -1.346296, 2.254214, 0, 0, 1, 1, 1,
0.6370926, -1.25359, 1.909268, 1, 0, 0, 1, 1,
0.6376049, 1.010088, 0.6677327, 1, 0, 0, 1, 1,
0.6420581, 0.3066176, 0.1829477, 1, 0, 0, 1, 1,
0.6484228, 1.18533, 1.541308, 1, 0, 0, 1, 1,
0.6498448, -0.4381771, 1.77458, 1, 0, 0, 1, 1,
0.6517364, 0.2400734, 2.19837, 0, 0, 0, 1, 1,
0.6524598, 0.5512529, -1.750226, 0, 0, 0, 1, 1,
0.6540514, -1.071312, 2.606173, 0, 0, 0, 1, 1,
0.6549428, -0.748074, 3.144994, 0, 0, 0, 1, 1,
0.656297, -0.3629747, 2.852784, 0, 0, 0, 1, 1,
0.6611778, -1.044117, 3.894238, 0, 0, 0, 1, 1,
0.6650103, 0.2692008, 1.410746, 0, 0, 0, 1, 1,
0.6689851, -0.9805806, 2.807187, 1, 1, 1, 1, 1,
0.6771854, 0.528496, -0.5188492, 1, 1, 1, 1, 1,
0.6826009, -0.6553373, 1.247064, 1, 1, 1, 1, 1,
0.6883436, 0.1579309, 2.943574, 1, 1, 1, 1, 1,
0.6906143, -0.756041, 3.214763, 1, 1, 1, 1, 1,
0.6968441, -2.159389, 3.079892, 1, 1, 1, 1, 1,
0.6972728, 0.713281, -0.7398375, 1, 1, 1, 1, 1,
0.7061535, 0.4421293, 1.915279, 1, 1, 1, 1, 1,
0.7145913, 0.01758121, 1.182783, 1, 1, 1, 1, 1,
0.7148857, 0.1107805, 0.4627788, 1, 1, 1, 1, 1,
0.7150865, -1.287632, 2.621418, 1, 1, 1, 1, 1,
0.7199525, 0.9368114, -0.249369, 1, 1, 1, 1, 1,
0.7207884, -0.650613, 2.890129, 1, 1, 1, 1, 1,
0.7245898, -1.207232, 1.656024, 1, 1, 1, 1, 1,
0.725251, -0.5850155, 0.4892781, 1, 1, 1, 1, 1,
0.7287238, -0.2046321, 2.36325, 0, 0, 1, 1, 1,
0.7390565, -0.8692278, 1.815244, 1, 0, 0, 1, 1,
0.7530136, -1.930611, 3.0333, 1, 0, 0, 1, 1,
0.7561305, -0.6318926, 1.814998, 1, 0, 0, 1, 1,
0.7745878, 0.3199786, 1.186796, 1, 0, 0, 1, 1,
0.7796362, 0.2077744, 0.8825001, 1, 0, 0, 1, 1,
0.781241, 0.001404954, 3.006217, 0, 0, 0, 1, 1,
0.7824364, 0.9781286, -0.919951, 0, 0, 0, 1, 1,
0.7835798, -0.1384672, 2.654186, 0, 0, 0, 1, 1,
0.7885957, -0.7153886, 2.228445, 0, 0, 0, 1, 1,
0.7897136, -0.1729701, 1.685888, 0, 0, 0, 1, 1,
0.7970895, -0.9253657, 3.732229, 0, 0, 0, 1, 1,
0.797292, 1.041075, 0.2038742, 0, 0, 0, 1, 1,
0.7985976, -1.188354, 4.699064, 1, 1, 1, 1, 1,
0.8023914, -0.02339815, 1.437652, 1, 1, 1, 1, 1,
0.8035207, -0.9020189, 2.764115, 1, 1, 1, 1, 1,
0.8054743, -0.5054141, 3.295821, 1, 1, 1, 1, 1,
0.807438, 1.374068, 0.8282207, 1, 1, 1, 1, 1,
0.8182946, 0.7508308, -0.01743632, 1, 1, 1, 1, 1,
0.828213, -0.1195932, 2.692307, 1, 1, 1, 1, 1,
0.8590913, -0.2325505, 3.814251, 1, 1, 1, 1, 1,
0.8615198, -0.6712939, 2.059939, 1, 1, 1, 1, 1,
0.8687856, -0.7981811, 2.67791, 1, 1, 1, 1, 1,
0.8691015, 0.7271621, 0.7891834, 1, 1, 1, 1, 1,
0.8697974, -0.6105921, 1.639454, 1, 1, 1, 1, 1,
0.8725547, -2.66055, 3.237863, 1, 1, 1, 1, 1,
0.8759862, 0.0973592, 1.503971, 1, 1, 1, 1, 1,
0.8782477, -1.692552, 3.651342, 1, 1, 1, 1, 1,
0.8788803, -0.1616222, 2.264979, 0, 0, 1, 1, 1,
0.8791394, 1.318042, 1.695856, 1, 0, 0, 1, 1,
0.8840148, -0.8539065, 4.639723, 1, 0, 0, 1, 1,
0.8869559, -0.5460559, 1.923156, 1, 0, 0, 1, 1,
0.9011812, -1.263335, 1.120876, 1, 0, 0, 1, 1,
0.9054073, 0.6312497, 2.044082, 1, 0, 0, 1, 1,
0.9071318, -1.48429, 3.13804, 0, 0, 0, 1, 1,
0.9110855, -0.5950921, 2.462443, 0, 0, 0, 1, 1,
0.9110864, 1.705465, 1.308217, 0, 0, 0, 1, 1,
0.9145868, -0.717042, 2.384368, 0, 0, 0, 1, 1,
0.915661, -0.04493272, 1.221266, 0, 0, 0, 1, 1,
0.9247217, -1.543587, 2.302465, 0, 0, 0, 1, 1,
0.9274319, 0.354111, 0.5404769, 0, 0, 0, 1, 1,
0.9277445, 0.6845368, 2.021626, 1, 1, 1, 1, 1,
0.9325258, 0.742512, 2.606802, 1, 1, 1, 1, 1,
0.933194, -0.6505437, 2.937459, 1, 1, 1, 1, 1,
0.9459577, 0.5358775, 2.487294, 1, 1, 1, 1, 1,
0.9500679, -0.6284146, 1.42374, 1, 1, 1, 1, 1,
0.9502903, -0.3487189, 3.093077, 1, 1, 1, 1, 1,
0.9525083, -0.6468014, 1.135816, 1, 1, 1, 1, 1,
0.9662314, -0.1014911, -0.6441965, 1, 1, 1, 1, 1,
0.9692593, 0.310112, 1.535712, 1, 1, 1, 1, 1,
0.9710326, -1.080484, 1.779741, 1, 1, 1, 1, 1,
0.9730375, -0.02603601, 2.439642, 1, 1, 1, 1, 1,
0.9753026, 0.5517027, 1.241617, 1, 1, 1, 1, 1,
0.9760373, 0.4344304, -0.5213458, 1, 1, 1, 1, 1,
0.9765009, -0.6641196, 3.344358, 1, 1, 1, 1, 1,
0.9838737, -1.47081, 1.973537, 1, 1, 1, 1, 1,
0.9865147, 0.3942258, 1.307992, 0, 0, 1, 1, 1,
1.004075, -0.7350771, 1.655255, 1, 0, 0, 1, 1,
1.00858, -0.3750788, 0.8855659, 1, 0, 0, 1, 1,
1.008648, 1.02005, -0.1436013, 1, 0, 0, 1, 1,
1.01434, -1.141225, 1.608574, 1, 0, 0, 1, 1,
1.01655, 0.7491451, 1.791163, 1, 0, 0, 1, 1,
1.021435, 0.3823318, 1.246733, 0, 0, 0, 1, 1,
1.022597, -0.7840546, 2.046582, 0, 0, 0, 1, 1,
1.025674, 0.01000286, 2.281316, 0, 0, 0, 1, 1,
1.026203, -0.2224338, 2.34988, 0, 0, 0, 1, 1,
1.035619, -0.008656552, 1.765062, 0, 0, 0, 1, 1,
1.036077, 0.3598507, -0.1651626, 0, 0, 0, 1, 1,
1.038871, -0.775588, 1.099622, 0, 0, 0, 1, 1,
1.046633, -0.3173122, 4.001314, 1, 1, 1, 1, 1,
1.049003, -0.1962399, 3.869354, 1, 1, 1, 1, 1,
1.049466, -0.7054422, 1.817664, 1, 1, 1, 1, 1,
1.051544, 0.2351527, -0.6044189, 1, 1, 1, 1, 1,
1.070651, 1.202209, 1.40946, 1, 1, 1, 1, 1,
1.078931, 1.114984, -0.4090996, 1, 1, 1, 1, 1,
1.079072, -0.7678961, 2.506383, 1, 1, 1, 1, 1,
1.081043, -0.8665307, 3.407021, 1, 1, 1, 1, 1,
1.08249, 0.7647486, 0.8622357, 1, 1, 1, 1, 1,
1.082934, -1.09193, 2.763952, 1, 1, 1, 1, 1,
1.083384, -1.057651, 3.841801, 1, 1, 1, 1, 1,
1.083515, 0.1744409, 2.36247, 1, 1, 1, 1, 1,
1.086754, 0.2901937, -0.4160367, 1, 1, 1, 1, 1,
1.08753, -1.65537, 2.342184, 1, 1, 1, 1, 1,
1.088222, 1.961075, -1.21555, 1, 1, 1, 1, 1,
1.091372, 0.8733808, 1.674372, 0, 0, 1, 1, 1,
1.096972, 0.4376988, 1.999492, 1, 0, 0, 1, 1,
1.110371, 1.132539, 0.15888, 1, 0, 0, 1, 1,
1.113899, -0.8675244, 2.333267, 1, 0, 0, 1, 1,
1.115508, -1.989584, -0.03822438, 1, 0, 0, 1, 1,
1.12032, -1.17677, 2.538023, 1, 0, 0, 1, 1,
1.124044, 0.05073306, 2.126827, 0, 0, 0, 1, 1,
1.125982, -0.1106196, 2.819437, 0, 0, 0, 1, 1,
1.131232, -0.06491243, 1.55626, 0, 0, 0, 1, 1,
1.135956, -0.5826902, 1.091745, 0, 0, 0, 1, 1,
1.150025, 0.6824309, 0.4955125, 0, 0, 0, 1, 1,
1.150168, -0.1495606, 2.889546, 0, 0, 0, 1, 1,
1.150348, -0.1078028, 0.1894609, 0, 0, 0, 1, 1,
1.178895, -1.236969, 1.424429, 1, 1, 1, 1, 1,
1.18074, -1.958193, 2.535307, 1, 1, 1, 1, 1,
1.190985, 0.1742568, 1.911346, 1, 1, 1, 1, 1,
1.194196, 0.129477, 1.784448, 1, 1, 1, 1, 1,
1.198399, 0.5104962, 2.024436, 1, 1, 1, 1, 1,
1.200235, 0.4049538, 2.32582, 1, 1, 1, 1, 1,
1.20242, -1.643856, 2.57763, 1, 1, 1, 1, 1,
1.207038, 0.2936123, 1.454423, 1, 1, 1, 1, 1,
1.207694, 0.06203617, 1.666009, 1, 1, 1, 1, 1,
1.208106, -1.368524, 4.302064, 1, 1, 1, 1, 1,
1.217006, -1.607063, 4.748392, 1, 1, 1, 1, 1,
1.217874, -0.2164227, 2.908054, 1, 1, 1, 1, 1,
1.222039, -1.636147, 3.021363, 1, 1, 1, 1, 1,
1.223257, -0.8829637, 3.587788, 1, 1, 1, 1, 1,
1.228225, 0.9149454, -0.4721941, 1, 1, 1, 1, 1,
1.228951, -0.4490286, 1.69542, 0, 0, 1, 1, 1,
1.229155, 0.3672272, 0.2772497, 1, 0, 0, 1, 1,
1.243072, -0.2668243, 0.7239807, 1, 0, 0, 1, 1,
1.243704, 0.2754436, 1.87522, 1, 0, 0, 1, 1,
1.247032, 0.6977647, -0.3035398, 1, 0, 0, 1, 1,
1.248953, -0.2248381, 1.827696, 1, 0, 0, 1, 1,
1.264648, -1.288458, 5.03243, 0, 0, 0, 1, 1,
1.270946, 0.4819035, 1.931485, 0, 0, 0, 1, 1,
1.274667, -1.94942, 2.116559, 0, 0, 0, 1, 1,
1.280671, -0.6716009, 2.924643, 0, 0, 0, 1, 1,
1.293305, 0.441223, 1.269508, 0, 0, 0, 1, 1,
1.293681, 0.04038843, 2.594973, 0, 0, 0, 1, 1,
1.304615, -0.06228707, 0.9739071, 0, 0, 0, 1, 1,
1.309355, 2.132983, 0.7110132, 1, 1, 1, 1, 1,
1.311234, -0.3357309, 2.183962, 1, 1, 1, 1, 1,
1.313077, 0.6041378, 1.527819, 1, 1, 1, 1, 1,
1.320343, -0.106404, 2.366624, 1, 1, 1, 1, 1,
1.340057, -1.429922, 2.173549, 1, 1, 1, 1, 1,
1.34104, 0.6409889, -0.2423622, 1, 1, 1, 1, 1,
1.360897, -0.3671759, 2.542886, 1, 1, 1, 1, 1,
1.361313, 0.04629166, 0.1184124, 1, 1, 1, 1, 1,
1.362426, -0.03246165, 2.867107, 1, 1, 1, 1, 1,
1.371128, -1.186481, 2.076458, 1, 1, 1, 1, 1,
1.375287, 0.2365607, 2.764655, 1, 1, 1, 1, 1,
1.387282, 0.4224023, 1.475713, 1, 1, 1, 1, 1,
1.388233, 0.3856379, 3.028594, 1, 1, 1, 1, 1,
1.393779, 0.2649537, 0.5954471, 1, 1, 1, 1, 1,
1.421804, 0.3564263, -0.476856, 1, 1, 1, 1, 1,
1.421998, 0.3503909, 0.2566189, 0, 0, 1, 1, 1,
1.432829, -2.232126, 1.385916, 1, 0, 0, 1, 1,
1.435597, 1.003944, 1.48253, 1, 0, 0, 1, 1,
1.449209, 0.3608755, 1.697768, 1, 0, 0, 1, 1,
1.45279, 0.5466344, 0.8501312, 1, 0, 0, 1, 1,
1.455603, -0.09201521, 0.8614594, 1, 0, 0, 1, 1,
1.457945, 1.279946, 2.201064, 0, 0, 0, 1, 1,
1.477304, -0.1588392, 1.849914, 0, 0, 0, 1, 1,
1.487024, 0.9190523, 1.321239, 0, 0, 0, 1, 1,
1.487064, -1.062672, 2.27175, 0, 0, 0, 1, 1,
1.489105, -1.113687, 2.668469, 0, 0, 0, 1, 1,
1.497577, -0.371715, 0.3008605, 0, 0, 0, 1, 1,
1.509433, -1.584176, 3.722815, 0, 0, 0, 1, 1,
1.521234, -0.4842296, 1.597253, 1, 1, 1, 1, 1,
1.525346, 2.539989, 0.9427596, 1, 1, 1, 1, 1,
1.546504, 0.03246091, 2.38404, 1, 1, 1, 1, 1,
1.551048, 0.9817093, 2.121237, 1, 1, 1, 1, 1,
1.554114, -1.509572, 1.869926, 1, 1, 1, 1, 1,
1.555649, -0.3299578, -0.01474652, 1, 1, 1, 1, 1,
1.556548, -0.3426284, 1.242963, 1, 1, 1, 1, 1,
1.561333, 0.3248668, 1.908946, 1, 1, 1, 1, 1,
1.56612, -0.1634969, 1.164569, 1, 1, 1, 1, 1,
1.567109, 1.276485, 0.2222239, 1, 1, 1, 1, 1,
1.576591, 0.5484975, 1.956397, 1, 1, 1, 1, 1,
1.584974, 1.547695, 3.124745, 1, 1, 1, 1, 1,
1.587165, -0.2611484, 1.11651, 1, 1, 1, 1, 1,
1.597283, 0.8425538, 0.5938372, 1, 1, 1, 1, 1,
1.600619, -0.3366763, 1.917427, 1, 1, 1, 1, 1,
1.603999, -0.7368819, 1.058004, 0, 0, 1, 1, 1,
1.60759, -1.483257, 1.884245, 1, 0, 0, 1, 1,
1.616592, 1.63186, 0.5506129, 1, 0, 0, 1, 1,
1.620721, -0.1280015, 1.312708, 1, 0, 0, 1, 1,
1.644056, -1.994259, 2.440171, 1, 0, 0, 1, 1,
1.674399, -0.954959, 1.752933, 1, 0, 0, 1, 1,
1.675613, 0.519714, 0.05272295, 0, 0, 0, 1, 1,
1.704879, -0.2439648, 2.986762, 0, 0, 0, 1, 1,
1.727845, -0.4888739, 2.846015, 0, 0, 0, 1, 1,
1.729652, -0.6771461, 2.220033, 0, 0, 0, 1, 1,
1.749366, 0.03194129, -0.4987234, 0, 0, 0, 1, 1,
1.753429, -0.7830311, 3.363015, 0, 0, 0, 1, 1,
1.787342, 0.2588949, 1.377571, 0, 0, 0, 1, 1,
1.794485, -0.6019355, 0.0317052, 1, 1, 1, 1, 1,
1.814333, -0.02120431, 0.752329, 1, 1, 1, 1, 1,
1.821537, -0.6737535, 3.062626, 1, 1, 1, 1, 1,
1.841956, -0.1768658, 3.29358, 1, 1, 1, 1, 1,
1.847381, -0.3270732, 2.023668, 1, 1, 1, 1, 1,
1.848536, -0.01831627, 0.9257755, 1, 1, 1, 1, 1,
1.856462, -0.2951028, 1.379594, 1, 1, 1, 1, 1,
1.866157, 0.8767846, 0.2203185, 1, 1, 1, 1, 1,
1.87265, -0.8549293, 2.830375, 1, 1, 1, 1, 1,
1.880742, -0.001689838, 2.589263, 1, 1, 1, 1, 1,
1.883035, 0.3780551, 0.9134928, 1, 1, 1, 1, 1,
1.924225, -0.5553133, 2.371001, 1, 1, 1, 1, 1,
1.92603, 0.343156, 0.4222656, 1, 1, 1, 1, 1,
1.933015, 1.046656, 1.087891, 1, 1, 1, 1, 1,
1.96487, 2.63427, -0.9179547, 1, 1, 1, 1, 1,
1.969045, 1.143581, 1.740712, 0, 0, 1, 1, 1,
1.995171, -0.00949028, 2.154735, 1, 0, 0, 1, 1,
2.105237, -1.068299, 2.10955, 1, 0, 0, 1, 1,
2.125257, 1.200917, 0.8288289, 1, 0, 0, 1, 1,
2.12883, -0.9618874, 5.407461, 1, 0, 0, 1, 1,
2.328566, 1.895169, 3.029968, 1, 0, 0, 1, 1,
2.331426, -0.8311499, 3.206352, 0, 0, 0, 1, 1,
2.3692, 2.101145, 0.3922419, 0, 0, 0, 1, 1,
2.421021, -0.3771639, 1.449002, 0, 0, 0, 1, 1,
2.506804, 0.6575394, -0.06749776, 0, 0, 0, 1, 1,
2.522803, 0.4553305, 2.24733, 0, 0, 0, 1, 1,
2.552704, -0.601436, -0.9872189, 0, 0, 0, 1, 1,
2.674816, 1.042123, 0.5279616, 0, 0, 0, 1, 1,
2.70241, -1.017929, 2.125458, 1, 1, 1, 1, 1,
2.702681, 3.31764, 2.278347, 1, 1, 1, 1, 1,
2.774642, 0.7719547, 0.2205309, 1, 1, 1, 1, 1,
2.924445, 1.757468, -0.3808774, 1, 1, 1, 1, 1,
2.925508, 0.8948808, 0.08986258, 1, 1, 1, 1, 1,
2.983278, 1.831889, 0.4529477, 1, 1, 1, 1, 1,
3.091538, 1.152834, 3.07132, 1, 1, 1, 1, 1
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
var radius = 9.995338;
var distance = 35.1082;
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
mvMatrix.translate( 0.05182219, -0.1306953, 0.006847858 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.1082);
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
