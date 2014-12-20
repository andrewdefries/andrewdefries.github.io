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
-3.137091, 0.06699406, -0.7683156, 1, 0, 0, 1,
-2.841977, 1.572122, -1.068544, 1, 0.007843138, 0, 1,
-2.729439, 0.3864929, -0.6733369, 1, 0.01176471, 0, 1,
-2.59561, 1.112532, 0.03576147, 1, 0.01960784, 0, 1,
-2.505127, -0.5789381, -1.186403, 1, 0.02352941, 0, 1,
-2.460396, 0.4227276, -2.088075, 1, 0.03137255, 0, 1,
-2.396608, 1.634609, -2.005845, 1, 0.03529412, 0, 1,
-2.374949, -1.193782, -1.268488, 1, 0.04313726, 0, 1,
-2.324276, -0.1477057, -1.473906, 1, 0.04705882, 0, 1,
-2.273793, 0.5437748, -2.073127, 1, 0.05490196, 0, 1,
-2.243856, 0.452349, -1.130506, 1, 0.05882353, 0, 1,
-2.180877, 0.1432843, -1.858071, 1, 0.06666667, 0, 1,
-2.131896, -0.4106632, -1.927397, 1, 0.07058824, 0, 1,
-2.106893, 0.8917444, -0.04168904, 1, 0.07843138, 0, 1,
-2.072788, 0.2769159, -1.190682, 1, 0.08235294, 0, 1,
-2.037448, -1.610202, -2.283686, 1, 0.09019608, 0, 1,
-2.01383, 0.3531148, -0.9530874, 1, 0.09411765, 0, 1,
-2.012639, 0.5637914, -2.930588, 1, 0.1019608, 0, 1,
-2.009926, 1.371027, -0.9312887, 1, 0.1098039, 0, 1,
-2.004616, 0.8773727, -2.133261, 1, 0.1137255, 0, 1,
-1.990853, 0.6679046, -1.092265, 1, 0.1215686, 0, 1,
-1.976146, 1.917095, -1.324062, 1, 0.1254902, 0, 1,
-1.957948, 0.456261, -1.629344, 1, 0.1333333, 0, 1,
-1.950344, -0.8046162, -2.120408, 1, 0.1372549, 0, 1,
-1.949403, 1.066997, -1.162704, 1, 0.145098, 0, 1,
-1.906069, 0.1713304, -1.257041, 1, 0.1490196, 0, 1,
-1.895545, -0.3304871, 0.4656169, 1, 0.1568628, 0, 1,
-1.867425, 2.1453, -1.542448, 1, 0.1607843, 0, 1,
-1.866797, -1.595399, -2.369607, 1, 0.1686275, 0, 1,
-1.858549, -0.05475466, -3.068488, 1, 0.172549, 0, 1,
-1.852366, -0.9400307, -4.033759, 1, 0.1803922, 0, 1,
-1.844126, 0.02969472, -2.661444, 1, 0.1843137, 0, 1,
-1.840883, 0.1375052, -0.5059146, 1, 0.1921569, 0, 1,
-1.833741, -0.2872476, -2.910146, 1, 0.1960784, 0, 1,
-1.833578, -0.3459692, -0.8079414, 1, 0.2039216, 0, 1,
-1.820779, -1.678697, -3.70176, 1, 0.2117647, 0, 1,
-1.780319, 0.9281909, -0.8972051, 1, 0.2156863, 0, 1,
-1.745668, -1.79398, -2.476784, 1, 0.2235294, 0, 1,
-1.744693, -0.262426, -1.710639, 1, 0.227451, 0, 1,
-1.734819, -0.6848832, -2.480843, 1, 0.2352941, 0, 1,
-1.732953, -0.6159344, -3.116791, 1, 0.2392157, 0, 1,
-1.714037, 0.8284251, -1.91244, 1, 0.2470588, 0, 1,
-1.693572, -0.3253801, -1.814704, 1, 0.2509804, 0, 1,
-1.681166, -0.02288033, -1.623905, 1, 0.2588235, 0, 1,
-1.675051, -1.255206, -0.9930567, 1, 0.2627451, 0, 1,
-1.672619, 0.732515, -2.203605, 1, 0.2705882, 0, 1,
-1.670288, -0.395038, -2.272765, 1, 0.2745098, 0, 1,
-1.664385, 0.2695136, 0.3351579, 1, 0.282353, 0, 1,
-1.663731, -0.3476722, -1.732646, 1, 0.2862745, 0, 1,
-1.663116, -1.150337, -2.68724, 1, 0.2941177, 0, 1,
-1.614271, 0.7928375, -2.067096, 1, 0.3019608, 0, 1,
-1.613787, -0.4498223, -0.3402879, 1, 0.3058824, 0, 1,
-1.608002, -1.414317, -3.24427, 1, 0.3137255, 0, 1,
-1.607266, 0.3311715, -3.043858, 1, 0.3176471, 0, 1,
-1.604938, -0.5506622, -1.533011, 1, 0.3254902, 0, 1,
-1.598445, 1.131868, -2.788199, 1, 0.3294118, 0, 1,
-1.589645, -0.6479313, -1.53744, 1, 0.3372549, 0, 1,
-1.588689, 1.114588, -0.2794302, 1, 0.3411765, 0, 1,
-1.572338, 1.092837, -0.6955745, 1, 0.3490196, 0, 1,
-1.546297, -1.200527, -2.906071, 1, 0.3529412, 0, 1,
-1.544526, 0.5160796, -1.10939, 1, 0.3607843, 0, 1,
-1.53755, -0.2074307, -0.003951825, 1, 0.3647059, 0, 1,
-1.53222, 1.722781, -2.149575, 1, 0.372549, 0, 1,
-1.53004, -0.7432407, 0.1541325, 1, 0.3764706, 0, 1,
-1.52837, -0.1256057, -0.303036, 1, 0.3843137, 0, 1,
-1.526864, 0.7455444, -1.859259, 1, 0.3882353, 0, 1,
-1.498034, -0.1732091, -2.869355, 1, 0.3960784, 0, 1,
-1.492856, -0.3279849, -0.617536, 1, 0.4039216, 0, 1,
-1.47643, -1.856827, -3.600375, 1, 0.4078431, 0, 1,
-1.456901, 0.2541106, -3.017527, 1, 0.4156863, 0, 1,
-1.427672, -0.8497445, -3.525073, 1, 0.4196078, 0, 1,
-1.42068, -0.3451472, 0.4099451, 1, 0.427451, 0, 1,
-1.405354, -1.195484, -1.960325, 1, 0.4313726, 0, 1,
-1.404953, 1.953498, -1.031763, 1, 0.4392157, 0, 1,
-1.395617, 2.466006, -0.5071999, 1, 0.4431373, 0, 1,
-1.394161, 0.3521014, -0.9068735, 1, 0.4509804, 0, 1,
-1.372307, 1.962749, -0.03261188, 1, 0.454902, 0, 1,
-1.357523, -0.07101598, -0.05337601, 1, 0.4627451, 0, 1,
-1.356158, -1.184624, -3.054662, 1, 0.4666667, 0, 1,
-1.330573, -1.506169, -0.6817809, 1, 0.4745098, 0, 1,
-1.328506, 0.8334706, -0.6918544, 1, 0.4784314, 0, 1,
-1.315992, -1.651415, -2.39724, 1, 0.4862745, 0, 1,
-1.297635, -0.7725033, -1.461131, 1, 0.4901961, 0, 1,
-1.295076, -0.402785, -1.753162, 1, 0.4980392, 0, 1,
-1.294791, -0.3781476, -1.547361, 1, 0.5058824, 0, 1,
-1.284983, -0.1870758, -2.348921, 1, 0.509804, 0, 1,
-1.283351, -0.602236, -1.545526, 1, 0.5176471, 0, 1,
-1.261463, 0.8493811, -0.593899, 1, 0.5215687, 0, 1,
-1.254652, 1.1686, -1.323813, 1, 0.5294118, 0, 1,
-1.246246, 0.5213225, -2.749613, 1, 0.5333334, 0, 1,
-1.234074, 0.3170092, -0.4657511, 1, 0.5411765, 0, 1,
-1.233194, 1.044098, -0.9124276, 1, 0.5450981, 0, 1,
-1.233088, 0.2965271, -1.281638, 1, 0.5529412, 0, 1,
-1.229564, 0.9590124, -1.211464, 1, 0.5568628, 0, 1,
-1.228732, 1.062008, -1.236804, 1, 0.5647059, 0, 1,
-1.220809, -1.888609, -3.821874, 1, 0.5686275, 0, 1,
-1.20813, -0.8436669, -2.835873, 1, 0.5764706, 0, 1,
-1.199412, 0.1761432, 0.07443641, 1, 0.5803922, 0, 1,
-1.196748, -0.7450364, -1.727673, 1, 0.5882353, 0, 1,
-1.191787, 0.1399404, -2.152165, 1, 0.5921569, 0, 1,
-1.188008, 1.100421, 2.052643, 1, 0.6, 0, 1,
-1.180764, -1.091012, -4.921521, 1, 0.6078432, 0, 1,
-1.172431, -1.477662, -2.647218, 1, 0.6117647, 0, 1,
-1.167911, 0.4078049, -2.960793, 1, 0.6196079, 0, 1,
-1.15154, 0.4700647, -0.2481718, 1, 0.6235294, 0, 1,
-1.14898, 0.6081312, -1.467464, 1, 0.6313726, 0, 1,
-1.147594, 1.300484, 0.004501317, 1, 0.6352941, 0, 1,
-1.142333, -1.368977, -3.975891, 1, 0.6431373, 0, 1,
-1.135767, -0.2413076, -1.146964, 1, 0.6470588, 0, 1,
-1.121722, -0.3723477, -2.594895, 1, 0.654902, 0, 1,
-1.115771, 0.465461, 0.2127485, 1, 0.6588235, 0, 1,
-1.114482, 0.283, -2.067185, 1, 0.6666667, 0, 1,
-1.111478, 0.817865, -1.494218, 1, 0.6705883, 0, 1,
-1.107629, -1.90615, -2.156077, 1, 0.6784314, 0, 1,
-1.100168, -0.04759515, -2.351455, 1, 0.682353, 0, 1,
-1.092168, -1.654764, -3.105031, 1, 0.6901961, 0, 1,
-1.088854, -1.907856, -2.473939, 1, 0.6941177, 0, 1,
-1.085311, 1.470338, 0.00404824, 1, 0.7019608, 0, 1,
-1.076673, -0.2855984, -0.9881298, 1, 0.7098039, 0, 1,
-1.070775, 1.872972, -0.4127397, 1, 0.7137255, 0, 1,
-1.062083, -0.015404, -3.01096, 1, 0.7215686, 0, 1,
-1.057571, -0.6818606, -1.083024, 1, 0.7254902, 0, 1,
-1.053163, 1.247721, 0.05744143, 1, 0.7333333, 0, 1,
-1.052903, -0.4863079, 0.08811729, 1, 0.7372549, 0, 1,
-1.052594, -1.24266, -3.615097, 1, 0.7450981, 0, 1,
-1.047328, 1.34992, 0.4533981, 1, 0.7490196, 0, 1,
-1.035699, 0.5302365, -0.8868688, 1, 0.7568628, 0, 1,
-1.033219, -1.685704, -5.081181, 1, 0.7607843, 0, 1,
-1.030843, -0.6701775, -2.771344, 1, 0.7686275, 0, 1,
-1.028157, 0.4104041, -2.344657, 1, 0.772549, 0, 1,
-1.027594, -0.2354172, -2.440541, 1, 0.7803922, 0, 1,
-1.025971, 0.7139208, -0.7908918, 1, 0.7843137, 0, 1,
-1.022062, -0.05416676, -2.209465, 1, 0.7921569, 0, 1,
-1.020807, -0.8409126, -2.786546, 1, 0.7960784, 0, 1,
-1.017994, 0.5110277, -0.5076168, 1, 0.8039216, 0, 1,
-1.017498, 1.121808, -0.1050164, 1, 0.8117647, 0, 1,
-1.009562, 0.2440233, -0.9074103, 1, 0.8156863, 0, 1,
-1.009536, 0.3480371, 0.7946109, 1, 0.8235294, 0, 1,
-1.00615, -1.3594, -3.560001, 1, 0.827451, 0, 1,
-1.004216, -0.7764066, -3.470127, 1, 0.8352941, 0, 1,
-1.001834, -1.164506, -3.267839, 1, 0.8392157, 0, 1,
-0.9998603, 0.6198712, -0.4707097, 1, 0.8470588, 0, 1,
-0.9990681, -1.516029, -3.486462, 1, 0.8509804, 0, 1,
-0.9962828, -0.6165575, -2.237886, 1, 0.8588235, 0, 1,
-0.9927295, 0.2502552, -1.871783, 1, 0.8627451, 0, 1,
-0.9913551, 0.1455121, -1.038388, 1, 0.8705882, 0, 1,
-0.9902487, -1.002666, -2.047895, 1, 0.8745098, 0, 1,
-0.9873221, 0.2694949, -0.5950164, 1, 0.8823529, 0, 1,
-0.9872979, -0.3067231, -1.133051, 1, 0.8862745, 0, 1,
-0.9839908, -1.370014, -2.585044, 1, 0.8941177, 0, 1,
-0.9812003, -0.710789, -0.3885782, 1, 0.8980392, 0, 1,
-0.9781477, 0.74676, 0.04348779, 1, 0.9058824, 0, 1,
-0.9733493, 0.27636, -1.081405, 1, 0.9137255, 0, 1,
-0.9719903, 0.05533823, -0.8522571, 1, 0.9176471, 0, 1,
-0.9713464, 0.3841668, -2.249719, 1, 0.9254902, 0, 1,
-0.968283, -0.4929283, -1.595297, 1, 0.9294118, 0, 1,
-0.9655439, 0.2273801, -2.099928, 1, 0.9372549, 0, 1,
-0.9532436, -1.398163, -2.739214, 1, 0.9411765, 0, 1,
-0.9524266, -0.6252701, -3.062248, 1, 0.9490196, 0, 1,
-0.9520681, -1.514526, -1.997081, 1, 0.9529412, 0, 1,
-0.9513146, -0.05381886, 0.5502918, 1, 0.9607843, 0, 1,
-0.9511141, 0.6165687, 0.2881809, 1, 0.9647059, 0, 1,
-0.950247, 1.071863, -1.833247, 1, 0.972549, 0, 1,
-0.9496152, -0.7296687, -1.884804, 1, 0.9764706, 0, 1,
-0.9489632, 0.9308662, -0.6537623, 1, 0.9843137, 0, 1,
-0.9449136, -0.2405793, -3.694071, 1, 0.9882353, 0, 1,
-0.9445598, -0.7527146, -1.237114, 1, 0.9960784, 0, 1,
-0.9421916, 1.01222, -1.259463, 0.9960784, 1, 0, 1,
-0.9404841, -1.385965, -1.527154, 0.9921569, 1, 0, 1,
-0.9375581, 0.07710674, -3.952467, 0.9843137, 1, 0, 1,
-0.9335156, 0.8100545, -0.09137181, 0.9803922, 1, 0, 1,
-0.9329319, 1.35649, -0.2422043, 0.972549, 1, 0, 1,
-0.9322008, -0.905153, -2.588063, 0.9686275, 1, 0, 1,
-0.9317021, 0.84496, 0.6875971, 0.9607843, 1, 0, 1,
-0.9297759, 0.2257399, 0.1904793, 0.9568627, 1, 0, 1,
-0.9189437, 0.8977485, -0.5934175, 0.9490196, 1, 0, 1,
-0.9145207, -0.04586028, -1.514663, 0.945098, 1, 0, 1,
-0.9126626, -0.8294812, -1.775775, 0.9372549, 1, 0, 1,
-0.9109412, -0.6349142, 0.03711144, 0.9333333, 1, 0, 1,
-0.8956892, 1.194574, -0.4121442, 0.9254902, 1, 0, 1,
-0.89525, -0.5412856, -2.11734, 0.9215686, 1, 0, 1,
-0.8939916, -0.6022708, -0.7069094, 0.9137255, 1, 0, 1,
-0.8791363, 0.7945334, -2.292986, 0.9098039, 1, 0, 1,
-0.8739626, 0.5093509, -3.293072, 0.9019608, 1, 0, 1,
-0.8666748, 1.235563, -0.4372416, 0.8941177, 1, 0, 1,
-0.8620325, -1.39018, -1.958036, 0.8901961, 1, 0, 1,
-0.8610542, -1.501858, -2.719108, 0.8823529, 1, 0, 1,
-0.8570328, 0.4197035, -1.503541, 0.8784314, 1, 0, 1,
-0.846263, -2.054772, -2.969851, 0.8705882, 1, 0, 1,
-0.8454923, -1.443266, -1.258144, 0.8666667, 1, 0, 1,
-0.8451765, -0.3992206, -1.84581, 0.8588235, 1, 0, 1,
-0.8345343, 1.326509, 0.2649986, 0.854902, 1, 0, 1,
-0.8327956, 0.1202919, -0.103616, 0.8470588, 1, 0, 1,
-0.8311326, -0.4237313, -2.373459, 0.8431373, 1, 0, 1,
-0.8277022, -1.628414, -4.522588, 0.8352941, 1, 0, 1,
-0.8251864, -1.01626, -2.35959, 0.8313726, 1, 0, 1,
-0.8201786, 1.634361, 0.1438286, 0.8235294, 1, 0, 1,
-0.8155268, 0.2387987, -0.5745544, 0.8196079, 1, 0, 1,
-0.8069989, 0.6425499, -0.4393398, 0.8117647, 1, 0, 1,
-0.8058539, -1.287758, -1.696775, 0.8078431, 1, 0, 1,
-0.7966084, 0.9009267, -2.093626, 0.8, 1, 0, 1,
-0.795162, 1.008473, -0.8121845, 0.7921569, 1, 0, 1,
-0.7929248, -1.548004, -3.898692, 0.7882353, 1, 0, 1,
-0.7910084, 0.7160973, 0.01333604, 0.7803922, 1, 0, 1,
-0.782934, -0.7989152, -4.390772, 0.7764706, 1, 0, 1,
-0.7823448, -1.391341, -4.550056, 0.7686275, 1, 0, 1,
-0.7738526, -1.090597, -3.564405, 0.7647059, 1, 0, 1,
-0.761025, -0.7353398, -2.2959, 0.7568628, 1, 0, 1,
-0.7601321, 0.1074554, -0.6404386, 0.7529412, 1, 0, 1,
-0.7600056, 0.9783025, -2.258406, 0.7450981, 1, 0, 1,
-0.7590509, 0.4810578, -1.397008, 0.7411765, 1, 0, 1,
-0.7574008, 1.361203, -1.055771, 0.7333333, 1, 0, 1,
-0.7475168, -0.3294165, 0.02421867, 0.7294118, 1, 0, 1,
-0.7402557, 0.4089358, -2.462877, 0.7215686, 1, 0, 1,
-0.7371721, 1.793003, 0.896401, 0.7176471, 1, 0, 1,
-0.7369353, -0.8531235, -2.816216, 0.7098039, 1, 0, 1,
-0.736307, -0.8905956, -2.104561, 0.7058824, 1, 0, 1,
-0.7350903, -0.0543398, -0.8070638, 0.6980392, 1, 0, 1,
-0.7326123, 1.324503, -0.7348638, 0.6901961, 1, 0, 1,
-0.7313885, 0.2325993, -1.689672, 0.6862745, 1, 0, 1,
-0.7299293, 1.790903, 0.8316591, 0.6784314, 1, 0, 1,
-0.7285473, -0.7025515, -3.525213, 0.6745098, 1, 0, 1,
-0.7242384, 0.3410545, -1.718172, 0.6666667, 1, 0, 1,
-0.7208954, -0.1630971, -0.8468182, 0.6627451, 1, 0, 1,
-0.7147214, -0.5364299, -1.484432, 0.654902, 1, 0, 1,
-0.7126502, -1.299208, -3.640297, 0.6509804, 1, 0, 1,
-0.7114486, 1.490503, 0.7416747, 0.6431373, 1, 0, 1,
-0.7087188, 1.20743, -1.322831, 0.6392157, 1, 0, 1,
-0.7052631, -0.5012823, -2.714746, 0.6313726, 1, 0, 1,
-0.7037725, -0.4068568, 0.3218506, 0.627451, 1, 0, 1,
-0.7018448, 1.511896, 1.299708, 0.6196079, 1, 0, 1,
-0.6994208, -1.783268, -2.657044, 0.6156863, 1, 0, 1,
-0.6932249, -0.03471186, -2.609093, 0.6078432, 1, 0, 1,
-0.6908289, 0.8588558, -1.810004, 0.6039216, 1, 0, 1,
-0.6902359, 1.243219, -1.597058, 0.5960785, 1, 0, 1,
-0.6817387, -0.9259824, -1.920144, 0.5882353, 1, 0, 1,
-0.6812257, -1.153926, -3.206901, 0.5843138, 1, 0, 1,
-0.6785012, -0.1491276, 0.01118446, 0.5764706, 1, 0, 1,
-0.6736141, 1.696821, 1.14555, 0.572549, 1, 0, 1,
-0.6725425, 0.1277201, -0.03992205, 0.5647059, 1, 0, 1,
-0.6720992, -0.3660856, -2.472756, 0.5607843, 1, 0, 1,
-0.6705336, 1.108619, -1.247868, 0.5529412, 1, 0, 1,
-0.6603293, 0.7243096, -1.214215, 0.5490196, 1, 0, 1,
-0.6523318, -0.8648136, -3.137298, 0.5411765, 1, 0, 1,
-0.6515716, 1.51906, -0.3950786, 0.5372549, 1, 0, 1,
-0.6484308, -0.6511046, -2.465718, 0.5294118, 1, 0, 1,
-0.6472026, 0.1547257, -1.889112, 0.5254902, 1, 0, 1,
-0.6468477, -1.100104, -2.528428, 0.5176471, 1, 0, 1,
-0.6448856, -2.979865, -3.601213, 0.5137255, 1, 0, 1,
-0.6364269, 1.022653, -0.9743165, 0.5058824, 1, 0, 1,
-0.6360292, -0.2911235, -0.3604144, 0.5019608, 1, 0, 1,
-0.635293, -0.9915953, -2.902827, 0.4941176, 1, 0, 1,
-0.6346385, 0.09327864, -0.9030579, 0.4862745, 1, 0, 1,
-0.6309763, -2.098493, -3.807762, 0.4823529, 1, 0, 1,
-0.6254748, -0.2345851, -2.572964, 0.4745098, 1, 0, 1,
-0.6223507, 0.9589038, -0.4962238, 0.4705882, 1, 0, 1,
-0.6201429, -1.060163, -3.496233, 0.4627451, 1, 0, 1,
-0.6166068, -0.5917628, -2.093216, 0.4588235, 1, 0, 1,
-0.614822, -1.756481, -2.5242, 0.4509804, 1, 0, 1,
-0.6071514, -0.6920772, -2.136605, 0.4470588, 1, 0, 1,
-0.6052979, 0.6382583, -1.180651, 0.4392157, 1, 0, 1,
-0.6037856, 0.1587079, -0.4864312, 0.4352941, 1, 0, 1,
-0.5990496, 0.2429658, 0.70067, 0.427451, 1, 0, 1,
-0.5945911, 0.3006091, -1.907861, 0.4235294, 1, 0, 1,
-0.5942862, -0.3306631, -2.19325, 0.4156863, 1, 0, 1,
-0.5930424, -0.2261593, -3.943346, 0.4117647, 1, 0, 1,
-0.5914251, -1.279043, -3.295484, 0.4039216, 1, 0, 1,
-0.5876752, -0.1466447, 0.5956959, 0.3960784, 1, 0, 1,
-0.5805715, 0.5471337, -1.138645, 0.3921569, 1, 0, 1,
-0.5747124, -0.7172371, -3.574957, 0.3843137, 1, 0, 1,
-0.5736109, 0.82067, -3.24177, 0.3803922, 1, 0, 1,
-0.5676667, 0.2798951, -0.9007673, 0.372549, 1, 0, 1,
-0.5673673, -0.2090132, -1.389756, 0.3686275, 1, 0, 1,
-0.5633544, -0.8564958, -2.011492, 0.3607843, 1, 0, 1,
-0.5598551, -0.4388941, -0.9723148, 0.3568628, 1, 0, 1,
-0.5523465, 0.04397631, -1.226417, 0.3490196, 1, 0, 1,
-0.5513559, 2.117304, -0.71728, 0.345098, 1, 0, 1,
-0.545978, -0.5711077, -3.823538, 0.3372549, 1, 0, 1,
-0.5453309, -0.4639052, -3.21681, 0.3333333, 1, 0, 1,
-0.5446675, 0.664129, -0.5997204, 0.3254902, 1, 0, 1,
-0.5338696, -1.186781, -0.8375459, 0.3215686, 1, 0, 1,
-0.5334681, -1.745126, -3.16112, 0.3137255, 1, 0, 1,
-0.5331501, -1.053057, -2.980303, 0.3098039, 1, 0, 1,
-0.5296165, 0.1203337, -1.787003, 0.3019608, 1, 0, 1,
-0.529367, 0.1050814, -1.6064, 0.2941177, 1, 0, 1,
-0.5255349, -0.9921932, -4.341179, 0.2901961, 1, 0, 1,
-0.5240747, -0.2414217, -3.048786, 0.282353, 1, 0, 1,
-0.5240714, 0.6295039, -4.553841, 0.2784314, 1, 0, 1,
-0.5234839, -0.1247816, -2.339692, 0.2705882, 1, 0, 1,
-0.5221124, -0.3218754, -1.174569, 0.2666667, 1, 0, 1,
-0.5176334, -0.8227187, -4.824899, 0.2588235, 1, 0, 1,
-0.5172893, -0.58961, -1.08051, 0.254902, 1, 0, 1,
-0.5159917, -0.1519746, -2.341657, 0.2470588, 1, 0, 1,
-0.511964, 0.3801971, -2.170783, 0.2431373, 1, 0, 1,
-0.5117671, 0.8648625, 0.01950315, 0.2352941, 1, 0, 1,
-0.5116872, -1.065374, -2.697197, 0.2313726, 1, 0, 1,
-0.5094578, 0.9384556, 0.22752, 0.2235294, 1, 0, 1,
-0.5061476, 1.902304, -0.6435631, 0.2196078, 1, 0, 1,
-0.5019897, -0.1429427, -3.425789, 0.2117647, 1, 0, 1,
-0.5000612, 1.360383, -1.646698, 0.2078431, 1, 0, 1,
-0.4977383, 0.4711623, -1.68636, 0.2, 1, 0, 1,
-0.4960388, -1.73878, -3.222731, 0.1921569, 1, 0, 1,
-0.4953807, 0.4989831, -1.259763, 0.1882353, 1, 0, 1,
-0.4926206, 1.480752, -0.8475301, 0.1803922, 1, 0, 1,
-0.4916854, -1.972137, -0.5189277, 0.1764706, 1, 0, 1,
-0.4910257, -0.9519607, -2.74158, 0.1686275, 1, 0, 1,
-0.4885871, -1.022333, -3.804764, 0.1647059, 1, 0, 1,
-0.4857244, -1.684415, -0.7902599, 0.1568628, 1, 0, 1,
-0.4856113, -1.168728, -4.438702, 0.1529412, 1, 0, 1,
-0.4769613, 0.7133834, 0.4936961, 0.145098, 1, 0, 1,
-0.4756538, -0.3250303, -3.859361, 0.1411765, 1, 0, 1,
-0.4677362, -2.475877, -4.192432, 0.1333333, 1, 0, 1,
-0.4599098, -0.2875771, -3.658307, 0.1294118, 1, 0, 1,
-0.4568027, -1.188983, -3.314321, 0.1215686, 1, 0, 1,
-0.4514634, -1.031897, -4.311508, 0.1176471, 1, 0, 1,
-0.4496234, 2.025369, -1.677158, 0.1098039, 1, 0, 1,
-0.4450403, -0.5116598, -1.05568, 0.1058824, 1, 0, 1,
-0.4430812, -1.157938, -2.695542, 0.09803922, 1, 0, 1,
-0.4425948, 0.1839322, -2.860812, 0.09019608, 1, 0, 1,
-0.441389, -1.1445, -3.343089, 0.08627451, 1, 0, 1,
-0.4380369, 1.139596, 1.126231, 0.07843138, 1, 0, 1,
-0.4349149, 0.9932978, 0.9850906, 0.07450981, 1, 0, 1,
-0.4313318, 1.050058, -0.1116287, 0.06666667, 1, 0, 1,
-0.4297358, -1.06175, -3.349025, 0.0627451, 1, 0, 1,
-0.4213347, -0.1048462, -1.016285, 0.05490196, 1, 0, 1,
-0.4208556, -0.9871108, -2.811188, 0.05098039, 1, 0, 1,
-0.4202398, -0.7913949, -2.293152, 0.04313726, 1, 0, 1,
-0.4171276, 0.3338145, -0.8387361, 0.03921569, 1, 0, 1,
-0.4112435, -0.04181276, -2.127238, 0.03137255, 1, 0, 1,
-0.410212, -0.876612, -1.943352, 0.02745098, 1, 0, 1,
-0.4101567, -0.1886537, -1.901312, 0.01960784, 1, 0, 1,
-0.4073685, 1.078332, 0.4916901, 0.01568628, 1, 0, 1,
-0.4038294, -0.6846358, -3.07289, 0.007843138, 1, 0, 1,
-0.4000036, 0.2528405, -1.538211, 0.003921569, 1, 0, 1,
-0.3965616, 1.448936, -1.576316, 0, 1, 0.003921569, 1,
-0.3920678, 0.1616403, -2.039011, 0, 1, 0.01176471, 1,
-0.382398, 1.172515, 0.4064633, 0, 1, 0.01568628, 1,
-0.3810924, 0.7996361, -0.323061, 0, 1, 0.02352941, 1,
-0.3787988, -0.09812293, -2.586185, 0, 1, 0.02745098, 1,
-0.3770448, -0.9815863, -2.200868, 0, 1, 0.03529412, 1,
-0.3765095, -1.158939, -2.121922, 0, 1, 0.03921569, 1,
-0.3744532, 1.044645, -1.064861, 0, 1, 0.04705882, 1,
-0.3716192, 0.4138202, -0.7192339, 0, 1, 0.05098039, 1,
-0.368665, -1.956472, -1.779455, 0, 1, 0.05882353, 1,
-0.3670801, 1.14388, -0.7673438, 0, 1, 0.0627451, 1,
-0.3664616, 1.416037, -0.64656, 0, 1, 0.07058824, 1,
-0.3640091, -1.157159, -3.8362, 0, 1, 0.07450981, 1,
-0.3615206, -0.2869309, -1.672706, 0, 1, 0.08235294, 1,
-0.3595529, 1.233408, 0.2521008, 0, 1, 0.08627451, 1,
-0.3548028, 0.5553105, -0.6457326, 0, 1, 0.09411765, 1,
-0.3544361, -0.8907146, -2.20158, 0, 1, 0.1019608, 1,
-0.3536884, 0.2814664, -1.755249, 0, 1, 0.1058824, 1,
-0.3533688, -0.4902789, -3.217602, 0, 1, 0.1137255, 1,
-0.3514598, 2.375422, 0.6896958, 0, 1, 0.1176471, 1,
-0.3467957, 1.092897, 0.4243754, 0, 1, 0.1254902, 1,
-0.3462094, -0.07508381, -1.853514, 0, 1, 0.1294118, 1,
-0.3422523, 1.385455, -1.748072, 0, 1, 0.1372549, 1,
-0.3413493, 1.122748, -1.953697, 0, 1, 0.1411765, 1,
-0.3411903, -1.497379, -3.497661, 0, 1, 0.1490196, 1,
-0.3397273, 0.4382025, -1.743005, 0, 1, 0.1529412, 1,
-0.3327527, 0.355015, -2.587231, 0, 1, 0.1607843, 1,
-0.3324289, -0.2200946, -2.9758, 0, 1, 0.1647059, 1,
-0.3306698, -0.373644, -3.275307, 0, 1, 0.172549, 1,
-0.322835, -1.954591, -1.37548, 0, 1, 0.1764706, 1,
-0.321197, 1.521012, -0.2181894, 0, 1, 0.1843137, 1,
-0.3194982, 0.8709919, -1.506406, 0, 1, 0.1882353, 1,
-0.3170339, -0.2811931, -3.012019, 0, 1, 0.1960784, 1,
-0.3168778, -0.5118334, -2.421588, 0, 1, 0.2039216, 1,
-0.3147539, -1.364399, -1.87583, 0, 1, 0.2078431, 1,
-0.3070891, 0.1724903, 1.079926, 0, 1, 0.2156863, 1,
-0.3064592, 1.886759, -0.3987184, 0, 1, 0.2196078, 1,
-0.3050791, 0.8498296, 1.051335, 0, 1, 0.227451, 1,
-0.2992609, -1.245906, -2.240443, 0, 1, 0.2313726, 1,
-0.2897655, 0.5127469, 2.03943, 0, 1, 0.2392157, 1,
-0.2893822, -1.087593, -2.968836, 0, 1, 0.2431373, 1,
-0.2870449, 0.214208, 0.1058777, 0, 1, 0.2509804, 1,
-0.2867575, 1.234509, 0.03750768, 0, 1, 0.254902, 1,
-0.2803837, -0.03405515, -2.326616, 0, 1, 0.2627451, 1,
-0.2803612, 1.45576, 0.282867, 0, 1, 0.2666667, 1,
-0.2786394, -1.379126, -4.610868, 0, 1, 0.2745098, 1,
-0.2758394, -1.836453, -3.104442, 0, 1, 0.2784314, 1,
-0.2747751, -2.25047, -2.827961, 0, 1, 0.2862745, 1,
-0.2730868, 0.5194108, 0.3652228, 0, 1, 0.2901961, 1,
-0.2719845, 0.2081411, -1.312285, 0, 1, 0.2980392, 1,
-0.2715228, 0.8471611, 1.089554, 0, 1, 0.3058824, 1,
-0.2693624, 0.9938529, 0.4749598, 0, 1, 0.3098039, 1,
-0.2681512, -1.788465, -2.325445, 0, 1, 0.3176471, 1,
-0.2631833, 0.8682894, 0.4302205, 0, 1, 0.3215686, 1,
-0.2617811, 0.5802755, -1.480909, 0, 1, 0.3294118, 1,
-0.2475414, -2.725144, -2.695541, 0, 1, 0.3333333, 1,
-0.2474427, 1.354509, 1.245145, 0, 1, 0.3411765, 1,
-0.2465452, 1.524105, 0.3044462, 0, 1, 0.345098, 1,
-0.2436212, 0.4865458, -0.4735116, 0, 1, 0.3529412, 1,
-0.2435466, -3.076172, -3.324835, 0, 1, 0.3568628, 1,
-0.2427827, 1.552098, 2.152034, 0, 1, 0.3647059, 1,
-0.2401265, 1.413057, -1.229215, 0, 1, 0.3686275, 1,
-0.2394523, 0.6075263, 0.1371087, 0, 1, 0.3764706, 1,
-0.2363041, -1.881283, -4.614178, 0, 1, 0.3803922, 1,
-0.2360204, 1.33058, -0.5266806, 0, 1, 0.3882353, 1,
-0.2298423, -1.756507, -3.949855, 0, 1, 0.3921569, 1,
-0.228541, 1.330564, 0.1222319, 0, 1, 0.4, 1,
-0.2271087, 0.256663, 0.1644994, 0, 1, 0.4078431, 1,
-0.2261476, 1.122094, 0.2337015, 0, 1, 0.4117647, 1,
-0.2256671, 0.5041454, -1.56449, 0, 1, 0.4196078, 1,
-0.2254999, 0.4813666, -1.389405, 0, 1, 0.4235294, 1,
-0.2203761, -2.3215, -2.461709, 0, 1, 0.4313726, 1,
-0.2148601, -0.257947, -1.747177, 0, 1, 0.4352941, 1,
-0.214741, -0.7785766, -2.483115, 0, 1, 0.4431373, 1,
-0.2061305, -0.2392425, -0.8779055, 0, 1, 0.4470588, 1,
-0.2050635, 0.7261326, -0.4453328, 0, 1, 0.454902, 1,
-0.2019934, 0.8819678, -0.3951754, 0, 1, 0.4588235, 1,
-0.2010006, 1.687333, 1.997248, 0, 1, 0.4666667, 1,
-0.1957444, -0.9031471, -3.102673, 0, 1, 0.4705882, 1,
-0.1942781, -0.4643794, -4.823882, 0, 1, 0.4784314, 1,
-0.1899086, -2.173225, -2.808625, 0, 1, 0.4823529, 1,
-0.1886563, 0.2067037, -1.14662, 0, 1, 0.4901961, 1,
-0.1877538, -0.1370828, -2.265239, 0, 1, 0.4941176, 1,
-0.1871409, 0.1829332, 1.044524, 0, 1, 0.5019608, 1,
-0.1866657, 1.230126, 0.170272, 0, 1, 0.509804, 1,
-0.1865988, -0.04316732, -2.475836, 0, 1, 0.5137255, 1,
-0.1834445, 2.073922, -1.428955, 0, 1, 0.5215687, 1,
-0.1802226, -2.558782, -5.454659, 0, 1, 0.5254902, 1,
-0.1795134, -0.2073759, -3.187463, 0, 1, 0.5333334, 1,
-0.1773339, -0.8049573, -4.132401, 0, 1, 0.5372549, 1,
-0.1764985, 2.068759, -0.911657, 0, 1, 0.5450981, 1,
-0.1726931, -0.5129043, -1.563798, 0, 1, 0.5490196, 1,
-0.1722734, 0.2845871, 1.121491, 0, 1, 0.5568628, 1,
-0.169711, 0.220041, -0.1954827, 0, 1, 0.5607843, 1,
-0.1616417, 0.1608835, -0.7917145, 0, 1, 0.5686275, 1,
-0.1597538, -0.6456889, -1.179451, 0, 1, 0.572549, 1,
-0.159569, -0.8973127, -3.734363, 0, 1, 0.5803922, 1,
-0.155644, 1.428984, -1.176027, 0, 1, 0.5843138, 1,
-0.1519546, 0.1261371, -1.312555, 0, 1, 0.5921569, 1,
-0.1515207, 0.0008944135, -0.739767, 0, 1, 0.5960785, 1,
-0.1490989, 0.3472124, 1.408557, 0, 1, 0.6039216, 1,
-0.1490484, 0.6639029, 0.9779285, 0, 1, 0.6117647, 1,
-0.1487629, 0.8260778, 0.7908769, 0, 1, 0.6156863, 1,
-0.1444159, 0.8430029, 0.9580415, 0, 1, 0.6235294, 1,
-0.1438874, -0.2689858, -1.840853, 0, 1, 0.627451, 1,
-0.1432223, 0.4144728, -1.341688, 0, 1, 0.6352941, 1,
-0.1395078, -1.852747, -0.9406314, 0, 1, 0.6392157, 1,
-0.1394126, -0.1232187, -3.048524, 0, 1, 0.6470588, 1,
-0.1384869, -0.612062, -2.448644, 0, 1, 0.6509804, 1,
-0.1303705, 1.1788, 0.6108932, 0, 1, 0.6588235, 1,
-0.1292166, 1.133178, 0.9900498, 0, 1, 0.6627451, 1,
-0.1232879, 0.1399098, -1.727634, 0, 1, 0.6705883, 1,
-0.1216615, -0.9356272, -2.576028, 0, 1, 0.6745098, 1,
-0.118092, -0.839914, -3.352019, 0, 1, 0.682353, 1,
-0.1174448, 0.6935778, -2.830578, 0, 1, 0.6862745, 1,
-0.11332, -1.78415, -2.518251, 0, 1, 0.6941177, 1,
-0.1082403, 0.6389343, 1.394508, 0, 1, 0.7019608, 1,
-0.1081473, 1.357544, -0.8784626, 0, 1, 0.7058824, 1,
-0.1062887, 0.2379346, -0.8642204, 0, 1, 0.7137255, 1,
-0.1047306, -0.600157, -2.978765, 0, 1, 0.7176471, 1,
-0.1039649, -0.04176404, -1.107646, 0, 1, 0.7254902, 1,
-0.102321, 0.1567082, -1.033104, 0, 1, 0.7294118, 1,
-0.09800807, -0.4357045, -3.21379, 0, 1, 0.7372549, 1,
-0.09768445, 1.581729, 0.08399668, 0, 1, 0.7411765, 1,
-0.09631302, -0.04393859, -0.7657331, 0, 1, 0.7490196, 1,
-0.09550491, 3.134553, -1.019458, 0, 1, 0.7529412, 1,
-0.09379748, 0.05005335, -1.951262, 0, 1, 0.7607843, 1,
-0.09227651, -1.776331, -3.190438, 0, 1, 0.7647059, 1,
-0.09177813, 0.1938476, 0.1414571, 0, 1, 0.772549, 1,
-0.08529001, -2.046399, -3.511472, 0, 1, 0.7764706, 1,
-0.08412898, -0.8327857, -3.687705, 0, 1, 0.7843137, 1,
-0.07162918, 0.2399856, 1.439539, 0, 1, 0.7882353, 1,
-0.071026, -0.7009693, -2.54245, 0, 1, 0.7960784, 1,
-0.06936987, -0.002733289, -2.030357, 0, 1, 0.8039216, 1,
-0.06201262, -0.7837757, -3.721944, 0, 1, 0.8078431, 1,
-0.05682241, -0.5039229, -1.691574, 0, 1, 0.8156863, 1,
-0.05502109, 0.4991632, -0.7810566, 0, 1, 0.8196079, 1,
-0.05245643, -0.710048, -5.145302, 0, 1, 0.827451, 1,
-0.04936538, -0.04905941, -1.983042, 0, 1, 0.8313726, 1,
-0.04146911, 0.4920675, 1.223294, 0, 1, 0.8392157, 1,
-0.03987871, 1.491294, 0.9126559, 0, 1, 0.8431373, 1,
-0.03939211, 0.3098732, -0.5845617, 0, 1, 0.8509804, 1,
-0.03688307, -0.9020059, -4.189163, 0, 1, 0.854902, 1,
-0.03665989, -0.4016, -3.486957, 0, 1, 0.8627451, 1,
-0.03457264, 1.204891, 0.8467326, 0, 1, 0.8666667, 1,
-0.02818101, -0.6840247, -2.839291, 0, 1, 0.8745098, 1,
-0.02662189, -0.9684747, -2.682384, 0, 1, 0.8784314, 1,
-0.02580744, 0.9323833, 0.08483864, 0, 1, 0.8862745, 1,
-0.02414326, 0.5652601, 0.341637, 0, 1, 0.8901961, 1,
-0.01996308, 0.6356913, -0.2146118, 0, 1, 0.8980392, 1,
-0.01881176, -1.261679, -3.099758, 0, 1, 0.9058824, 1,
-0.01333697, 0.8154264, 0.3882519, 0, 1, 0.9098039, 1,
-0.01014359, -0.990174, -2.608628, 0, 1, 0.9176471, 1,
-0.007471998, -0.674467, -3.079655, 0, 1, 0.9215686, 1,
-0.00740542, -0.3271953, 0.15507, 0, 1, 0.9294118, 1,
-0.006237614, 1.285288, 0.7953169, 0, 1, 0.9333333, 1,
-0.00466151, 1.390007, 0.9866912, 0, 1, 0.9411765, 1,
-0.003671288, -0.02919217, -3.351319, 0, 1, 0.945098, 1,
-0.001745099, 0.2594567, 0.1966086, 0, 1, 0.9529412, 1,
0.006118861, 1.381517, -0.2207563, 0, 1, 0.9568627, 1,
0.007667674, -0.004340841, 2.933873, 0, 1, 0.9647059, 1,
0.00854961, 0.06967406, -2.044772, 0, 1, 0.9686275, 1,
0.01081948, -0.5825117, 3.541632, 0, 1, 0.9764706, 1,
0.0124456, -0.8674724, 2.78085, 0, 1, 0.9803922, 1,
0.01331143, -1.351847, 1.915803, 0, 1, 0.9882353, 1,
0.01549236, -0.4897934, 2.651699, 0, 1, 0.9921569, 1,
0.01645507, 0.628231, -0.09401838, 0, 1, 1, 1,
0.02094828, -1.183153, 2.772959, 0, 0.9921569, 1, 1,
0.02189368, -0.1236655, 3.503762, 0, 0.9882353, 1, 1,
0.02705681, 0.6189096, -0.2680646, 0, 0.9803922, 1, 1,
0.02980991, 0.8606564, -1.009401, 0, 0.9764706, 1, 1,
0.03326067, -0.1777606, 4.108534, 0, 0.9686275, 1, 1,
0.03473507, -0.1297811, 0.9144003, 0, 0.9647059, 1, 1,
0.03574185, -0.8149579, 1.025599, 0, 0.9568627, 1, 1,
0.03600389, -0.2208079, 4.040271, 0, 0.9529412, 1, 1,
0.0373391, 0.1002208, -1.529194, 0, 0.945098, 1, 1,
0.0421262, 0.1099896, -0.2790897, 0, 0.9411765, 1, 1,
0.04244415, -0.03734636, 1.725121, 0, 0.9333333, 1, 1,
0.04778555, 0.3525474, 0.7436839, 0, 0.9294118, 1, 1,
0.05002918, 2.047012, -0.5688369, 0, 0.9215686, 1, 1,
0.05131762, -0.1448452, 2.298163, 0, 0.9176471, 1, 1,
0.0541672, 0.3662374, 0.436101, 0, 0.9098039, 1, 1,
0.05454452, -1.287653, 3.703703, 0, 0.9058824, 1, 1,
0.05579336, 0.4191694, -1.133151, 0, 0.8980392, 1, 1,
0.0565365, -1.390977, 6.081766, 0, 0.8901961, 1, 1,
0.05867075, 0.4800274, -0.5882722, 0, 0.8862745, 1, 1,
0.05886227, -0.1162934, 2.53584, 0, 0.8784314, 1, 1,
0.05922675, -0.3143891, 2.858994, 0, 0.8745098, 1, 1,
0.05959525, -0.5024428, 4.516171, 0, 0.8666667, 1, 1,
0.06075602, 1.213647, -0.1628491, 0, 0.8627451, 1, 1,
0.0607597, -1.407467, 3.072258, 0, 0.854902, 1, 1,
0.06287987, -0.7618214, 3.540059, 0, 0.8509804, 1, 1,
0.06670327, -1.633406, 2.244907, 0, 0.8431373, 1, 1,
0.06740601, -1.57873, 3.103022, 0, 0.8392157, 1, 1,
0.0688183, -0.6575533, 2.246301, 0, 0.8313726, 1, 1,
0.06971632, -0.6000425, 2.34307, 0, 0.827451, 1, 1,
0.07147288, 0.1927872, 1.122785, 0, 0.8196079, 1, 1,
0.07475146, -0.7428161, 2.471412, 0, 0.8156863, 1, 1,
0.09282953, -0.1775731, 3.11808, 0, 0.8078431, 1, 1,
0.09406906, -0.3410665, 3.277189, 0, 0.8039216, 1, 1,
0.09465452, 0.9858896, 1.178444, 0, 0.7960784, 1, 1,
0.1129134, -0.5653003, 1.903819, 0, 0.7882353, 1, 1,
0.1136128, -0.6795921, 3.507202, 0, 0.7843137, 1, 1,
0.1176625, 0.09275059, 0.7073946, 0, 0.7764706, 1, 1,
0.1189587, -1.478783, 3.792322, 0, 0.772549, 1, 1,
0.1212032, -0.4019457, 1.846079, 0, 0.7647059, 1, 1,
0.1225515, 0.1459795, 2.205894, 0, 0.7607843, 1, 1,
0.1251183, 1.772795, 0.465395, 0, 0.7529412, 1, 1,
0.1320238, -1.110867, 2.001982, 0, 0.7490196, 1, 1,
0.1351317, 0.07008046, 2.403499, 0, 0.7411765, 1, 1,
0.1384708, 0.05504026, 0.2786878, 0, 0.7372549, 1, 1,
0.151205, 1.678043, -0.8604416, 0, 0.7294118, 1, 1,
0.1532934, -0.6290767, 4.212306, 0, 0.7254902, 1, 1,
0.1562477, -1.253063, 2.633562, 0, 0.7176471, 1, 1,
0.1573384, 0.7134473, -0.09992239, 0, 0.7137255, 1, 1,
0.1576827, 0.8330069, 0.390152, 0, 0.7058824, 1, 1,
0.1585348, 0.7279837, 1.565793, 0, 0.6980392, 1, 1,
0.1632452, 0.8055906, 1.221332, 0, 0.6941177, 1, 1,
0.1642763, 1.26865, 0.8340617, 0, 0.6862745, 1, 1,
0.1676778, -2.901778, 3.292431, 0, 0.682353, 1, 1,
0.1686216, 0.5481777, -0.6434688, 0, 0.6745098, 1, 1,
0.1703266, -1.109586, 0.9805434, 0, 0.6705883, 1, 1,
0.1734251, 1.0922, 0.5004432, 0, 0.6627451, 1, 1,
0.1734399, -0.9375741, 2.656799, 0, 0.6588235, 1, 1,
0.1742098, -0.09027858, 0.4819149, 0, 0.6509804, 1, 1,
0.1742406, -1.227786, 3.025318, 0, 0.6470588, 1, 1,
0.1770683, -0.7907581, 2.371722, 0, 0.6392157, 1, 1,
0.1827732, -1.088069, 1.575226, 0, 0.6352941, 1, 1,
0.1832016, -0.5222574, 3.19154, 0, 0.627451, 1, 1,
0.1843711, -1.600561, 2.922839, 0, 0.6235294, 1, 1,
0.1899747, -0.02322074, 0.840045, 0, 0.6156863, 1, 1,
0.1920602, -0.7091351, 3.264445, 0, 0.6117647, 1, 1,
0.1959878, -1.39589, 3.019547, 0, 0.6039216, 1, 1,
0.1984778, 0.042821, 2.006213, 0, 0.5960785, 1, 1,
0.1996513, -0.9502878, 3.215955, 0, 0.5921569, 1, 1,
0.200899, 0.6952106, 0.3108601, 0, 0.5843138, 1, 1,
0.204642, -0.8892078, 2.596118, 0, 0.5803922, 1, 1,
0.2066866, -0.5158665, 2.8519, 0, 0.572549, 1, 1,
0.2068272, 0.8184941, -0.19879, 0, 0.5686275, 1, 1,
0.2089219, 0.6012753, -0.4573912, 0, 0.5607843, 1, 1,
0.2122316, 0.4083464, 2.46023, 0, 0.5568628, 1, 1,
0.2130125, -0.04458683, 1.144117, 0, 0.5490196, 1, 1,
0.2192981, 1.303313, 0.2535556, 0, 0.5450981, 1, 1,
0.2202544, 0.2391529, 0.8214939, 0, 0.5372549, 1, 1,
0.2206219, 0.282672, 0.8620524, 0, 0.5333334, 1, 1,
0.224384, 1.20033, 1.255126, 0, 0.5254902, 1, 1,
0.228187, 0.02973208, 1.388694, 0, 0.5215687, 1, 1,
0.2285025, 0.731272, -0.2403841, 0, 0.5137255, 1, 1,
0.2288569, -0.7143781, 1.972023, 0, 0.509804, 1, 1,
0.2292617, 0.6271534, -0.6147873, 0, 0.5019608, 1, 1,
0.231697, -0.7517933, 2.127217, 0, 0.4941176, 1, 1,
0.2320156, 0.7499238, -0.7569047, 0, 0.4901961, 1, 1,
0.2331721, 0.8403856, 0.1665853, 0, 0.4823529, 1, 1,
0.2354423, -1.185764, 3.278575, 0, 0.4784314, 1, 1,
0.2368633, 0.4507682, 0.5044618, 0, 0.4705882, 1, 1,
0.2385252, -0.4211228, 4.075907, 0, 0.4666667, 1, 1,
0.2423272, -1.577725, 4.292641, 0, 0.4588235, 1, 1,
0.242573, -0.1427163, 1.128624, 0, 0.454902, 1, 1,
0.2470304, 1.317074, -1.248011, 0, 0.4470588, 1, 1,
0.2535443, -0.442442, 3.123616, 0, 0.4431373, 1, 1,
0.2556629, -0.1854361, 2.37218, 0, 0.4352941, 1, 1,
0.2583783, 0.9419264, 0.08528906, 0, 0.4313726, 1, 1,
0.2587462, -0.33976, 2.19691, 0, 0.4235294, 1, 1,
0.2590306, -0.8513615, 3.64098, 0, 0.4196078, 1, 1,
0.2639669, 0.1703559, 2.20479, 0, 0.4117647, 1, 1,
0.2640875, 0.5299847, 0.5205929, 0, 0.4078431, 1, 1,
0.267563, -1.126634, 4.00197, 0, 0.4, 1, 1,
0.2678488, -1.187991, 2.637339, 0, 0.3921569, 1, 1,
0.2679659, 0.2216512, -0.2589321, 0, 0.3882353, 1, 1,
0.268175, -0.9962229, 2.055243, 0, 0.3803922, 1, 1,
0.2687696, -0.1785347, 3.30252, 0, 0.3764706, 1, 1,
0.2734596, 0.5279359, -0.5282992, 0, 0.3686275, 1, 1,
0.2754073, -1.548007, 2.216589, 0, 0.3647059, 1, 1,
0.2796151, 0.3250302, 0.7008342, 0, 0.3568628, 1, 1,
0.2813589, 0.07110686, 2.263893, 0, 0.3529412, 1, 1,
0.2827508, -0.459178, 1.870583, 0, 0.345098, 1, 1,
0.2836631, 0.1150783, 1.52662, 0, 0.3411765, 1, 1,
0.2862427, -0.9535606, 4.670768, 0, 0.3333333, 1, 1,
0.2868488, 2.237477, 1.406598, 0, 0.3294118, 1, 1,
0.2883813, 1.072951, 0.003848345, 0, 0.3215686, 1, 1,
0.293447, -1.075547, 3.810968, 0, 0.3176471, 1, 1,
0.2937642, 0.5544599, 0.5106219, 0, 0.3098039, 1, 1,
0.2949837, 0.4396624, 1.503432, 0, 0.3058824, 1, 1,
0.2974308, -1.269893, 3.491932, 0, 0.2980392, 1, 1,
0.2990091, 0.04174406, 1.830737, 0, 0.2901961, 1, 1,
0.3011981, 0.3108118, -0.9011122, 0, 0.2862745, 1, 1,
0.3038366, 0.3924013, -0.5793976, 0, 0.2784314, 1, 1,
0.3074884, 0.1411538, 3.506455, 0, 0.2745098, 1, 1,
0.3078042, -0.4720796, 1.658236, 0, 0.2666667, 1, 1,
0.3105888, -1.470425, 5.413472, 0, 0.2627451, 1, 1,
0.3119455, 2.8387, -0.4083267, 0, 0.254902, 1, 1,
0.3132527, -0.2035495, 0.7237532, 0, 0.2509804, 1, 1,
0.3199566, -1.601417, 3.124063, 0, 0.2431373, 1, 1,
0.3202588, 0.6518924, 0.8484343, 0, 0.2392157, 1, 1,
0.3267384, -0.9533553, 2.88504, 0, 0.2313726, 1, 1,
0.3282484, 0.9601038, -0.1475631, 0, 0.227451, 1, 1,
0.3300039, -1.430719, 3.952513, 0, 0.2196078, 1, 1,
0.3323998, -0.1069742, 0.5505673, 0, 0.2156863, 1, 1,
0.3331396, 0.03685344, 0.2190064, 0, 0.2078431, 1, 1,
0.3388163, 0.3829569, -0.2175456, 0, 0.2039216, 1, 1,
0.3412137, -0.1904722, 2.161742, 0, 0.1960784, 1, 1,
0.3440429, -0.367152, 2.517186, 0, 0.1882353, 1, 1,
0.3445339, -1.580158, 2.313215, 0, 0.1843137, 1, 1,
0.3503759, -0.2053973, -0.1787703, 0, 0.1764706, 1, 1,
0.3503781, -0.01236576, 1.73632, 0, 0.172549, 1, 1,
0.3527698, -0.4502916, 2.157007, 0, 0.1647059, 1, 1,
0.3549444, -0.6378032, 2.017388, 0, 0.1607843, 1, 1,
0.3587565, -0.2253647, 2.923966, 0, 0.1529412, 1, 1,
0.3597694, -1.644553, 2.382236, 0, 0.1490196, 1, 1,
0.3600628, 0.6309315, 0.07895799, 0, 0.1411765, 1, 1,
0.3607929, -0.4218758, 2.054733, 0, 0.1372549, 1, 1,
0.3608876, -1.169421, 2.26026, 0, 0.1294118, 1, 1,
0.361603, 0.5234368, 0.8421726, 0, 0.1254902, 1, 1,
0.3633149, -0.816763, 1.558786, 0, 0.1176471, 1, 1,
0.3650892, -1.5186, 3.762973, 0, 0.1137255, 1, 1,
0.3723843, -0.2240043, 2.738148, 0, 0.1058824, 1, 1,
0.3723857, 1.047071, 0.1950462, 0, 0.09803922, 1, 1,
0.3761534, -0.1297033, 2.448885, 0, 0.09411765, 1, 1,
0.3801925, 0.1867338, 3.235685, 0, 0.08627451, 1, 1,
0.3804589, -0.477337, 3.093764, 0, 0.08235294, 1, 1,
0.3823059, -2.387503, 3.14898, 0, 0.07450981, 1, 1,
0.3843029, 0.06598009, 0.07460213, 0, 0.07058824, 1, 1,
0.3886373, 0.972059, 1.420963, 0, 0.0627451, 1, 1,
0.3896671, -1.621414, 3.971343, 0, 0.05882353, 1, 1,
0.3903837, 1.296459, 0.7449171, 0, 0.05098039, 1, 1,
0.3910416, -1.824469, 2.807183, 0, 0.04705882, 1, 1,
0.4013037, -0.4701613, 2.118454, 0, 0.03921569, 1, 1,
0.4089189, -1.138979, 1.938315, 0, 0.03529412, 1, 1,
0.4183621, -0.2686874, 2.813199, 0, 0.02745098, 1, 1,
0.4185441, -0.01956785, 1.576599, 0, 0.02352941, 1, 1,
0.4198593, -0.7241028, 2.613609, 0, 0.01568628, 1, 1,
0.4217911, -0.7563433, 2.768108, 0, 0.01176471, 1, 1,
0.4226736, 0.06647703, 2.145808, 0, 0.003921569, 1, 1,
0.4247604, -1.234472, 2.369897, 0.003921569, 0, 1, 1,
0.4255523, 0.02201258, 3.384907, 0.007843138, 0, 1, 1,
0.4256278, -1.220086, 1.588764, 0.01568628, 0, 1, 1,
0.4271747, -0.8941181, 2.51864, 0.01960784, 0, 1, 1,
0.4289085, -0.6791638, 3.16015, 0.02745098, 0, 1, 1,
0.4314041, -0.01318126, 0.7020731, 0.03137255, 0, 1, 1,
0.4321832, 0.2301154, 0.3148122, 0.03921569, 0, 1, 1,
0.438892, 0.4182643, 0.8152903, 0.04313726, 0, 1, 1,
0.4418549, 0.4583944, 0.2684272, 0.05098039, 0, 1, 1,
0.4421468, 0.9864568, 0.1981393, 0.05490196, 0, 1, 1,
0.4457913, -1.059466, 2.278195, 0.0627451, 0, 1, 1,
0.4460854, -0.4565261, 2.477898, 0.06666667, 0, 1, 1,
0.4534121, 0.4541135, 0.391346, 0.07450981, 0, 1, 1,
0.4535612, 0.8730087, 0.8120683, 0.07843138, 0, 1, 1,
0.4548101, -0.3946462, 0.1660879, 0.08627451, 0, 1, 1,
0.4564786, -0.7879599, 2.549832, 0.09019608, 0, 1, 1,
0.4569147, 0.4816287, 1.489868, 0.09803922, 0, 1, 1,
0.4573867, 0.05643332, -0.5582914, 0.1058824, 0, 1, 1,
0.4575661, -0.7542453, 1.334462, 0.1098039, 0, 1, 1,
0.4583503, -0.3838181, 3.124445, 0.1176471, 0, 1, 1,
0.4592825, -0.5832707, 4.040765, 0.1215686, 0, 1, 1,
0.4621776, -1.226001, 3.980704, 0.1294118, 0, 1, 1,
0.4658149, -1.743586, 3.009466, 0.1333333, 0, 1, 1,
0.4659424, 0.9407572, -0.2688584, 0.1411765, 0, 1, 1,
0.4661948, -0.2714282, 0.7029817, 0.145098, 0, 1, 1,
0.4675557, -1.227223, 1.968221, 0.1529412, 0, 1, 1,
0.4677663, -0.5164199, 2.924904, 0.1568628, 0, 1, 1,
0.4691532, 1.284584, -0.4233539, 0.1647059, 0, 1, 1,
0.4704335, 0.3968318, 0.6312698, 0.1686275, 0, 1, 1,
0.4733385, 1.10818, 1.637034, 0.1764706, 0, 1, 1,
0.4762656, 1.589984, -0.1669928, 0.1803922, 0, 1, 1,
0.477076, -1.483248, 1.793761, 0.1882353, 0, 1, 1,
0.4785334, 0.6203464, 1.908518, 0.1921569, 0, 1, 1,
0.4793352, -1.646377, 1.103103, 0.2, 0, 1, 1,
0.4804415, -0.3602602, 0.8435089, 0.2078431, 0, 1, 1,
0.4804428, -0.6716024, 3.051023, 0.2117647, 0, 1, 1,
0.4862287, 0.1787352, 1.99375, 0.2196078, 0, 1, 1,
0.4886052, -0.9519124, 1.814535, 0.2235294, 0, 1, 1,
0.4887437, 0.5117015, 0.3116234, 0.2313726, 0, 1, 1,
0.4926118, -1.609922, 1.470224, 0.2352941, 0, 1, 1,
0.4926324, 0.7042925, 1.008574, 0.2431373, 0, 1, 1,
0.4955859, 0.4411151, 0.9981315, 0.2470588, 0, 1, 1,
0.4975771, -1.615187, 1.457522, 0.254902, 0, 1, 1,
0.4983711, 0.3873429, 0.2755969, 0.2588235, 0, 1, 1,
0.5025525, 0.5005013, -0.6382501, 0.2666667, 0, 1, 1,
0.5042755, 0.4315866, -0.8094496, 0.2705882, 0, 1, 1,
0.5074965, -0.2760343, 2.898727, 0.2784314, 0, 1, 1,
0.5079868, 0.7755705, -0.1759916, 0.282353, 0, 1, 1,
0.5084765, 1.261021, 1.028134, 0.2901961, 0, 1, 1,
0.516824, -1.834441, 3.547878, 0.2941177, 0, 1, 1,
0.5225762, 0.323837, 1.633983, 0.3019608, 0, 1, 1,
0.5252411, -0.7001663, 3.343203, 0.3098039, 0, 1, 1,
0.5285174, 1.060688, 1.70763, 0.3137255, 0, 1, 1,
0.5309922, -0.4640298, 1.027781, 0.3215686, 0, 1, 1,
0.5337408, -0.1599033, 0.9220152, 0.3254902, 0, 1, 1,
0.5340943, 1.095429, 0.3422821, 0.3333333, 0, 1, 1,
0.5387333, 0.4173997, 1.847069, 0.3372549, 0, 1, 1,
0.5485919, 0.1749574, 1.255657, 0.345098, 0, 1, 1,
0.5493762, 0.275778, 2.097469, 0.3490196, 0, 1, 1,
0.5524462, 0.4905318, 0.7210336, 0.3568628, 0, 1, 1,
0.5529853, -0.2149991, 1.26055, 0.3607843, 0, 1, 1,
0.5556256, -0.1262317, 2.687794, 0.3686275, 0, 1, 1,
0.5574934, 1.076195, 0.05837475, 0.372549, 0, 1, 1,
0.5576268, 0.3621234, 1.611424, 0.3803922, 0, 1, 1,
0.5592535, 0.7393414, -0.7031161, 0.3843137, 0, 1, 1,
0.5680891, -1.199576, 2.828927, 0.3921569, 0, 1, 1,
0.5699706, 0.2220527, 0.7394435, 0.3960784, 0, 1, 1,
0.5728906, 1.403342, 0.5767289, 0.4039216, 0, 1, 1,
0.5792309, -0.2592143, 1.122042, 0.4117647, 0, 1, 1,
0.5811787, -0.5963198, 2.414893, 0.4156863, 0, 1, 1,
0.5817581, -0.1955286, 2.490252, 0.4235294, 0, 1, 1,
0.5876521, 0.002379022, 1.14421, 0.427451, 0, 1, 1,
0.5877321, 1.064028, 0.08361365, 0.4352941, 0, 1, 1,
0.5900112, -0.5255475, 0.586613, 0.4392157, 0, 1, 1,
0.593163, -1.766712, 2.532513, 0.4470588, 0, 1, 1,
0.5953317, 0.392121, 0.5253475, 0.4509804, 0, 1, 1,
0.5984524, 0.2639371, 2.458178, 0.4588235, 0, 1, 1,
0.6035907, 1.711773, -1.838781, 0.4627451, 0, 1, 1,
0.6118009, -0.7832532, 0.9584565, 0.4705882, 0, 1, 1,
0.612016, -0.241831, -0.1803384, 0.4745098, 0, 1, 1,
0.6124433, -0.5463139, 2.117681, 0.4823529, 0, 1, 1,
0.613491, 1.924196, -0.3565117, 0.4862745, 0, 1, 1,
0.614057, -0.8007403, 3.248966, 0.4941176, 0, 1, 1,
0.6145477, -0.1621508, 0.8593726, 0.5019608, 0, 1, 1,
0.6198443, 0.3920735, 1.719385, 0.5058824, 0, 1, 1,
0.6204759, -0.786557, 2.794811, 0.5137255, 0, 1, 1,
0.6211503, 0.2017251, 2.147898, 0.5176471, 0, 1, 1,
0.6212706, -0.3033698, 0.508283, 0.5254902, 0, 1, 1,
0.6251692, 0.8325159, 1.562727, 0.5294118, 0, 1, 1,
0.6262448, 0.1697227, 2.641789, 0.5372549, 0, 1, 1,
0.6266056, -0.1001336, 2.648084, 0.5411765, 0, 1, 1,
0.6275465, 0.2113633, -0.150979, 0.5490196, 0, 1, 1,
0.6302578, 0.0028762, 2.011792, 0.5529412, 0, 1, 1,
0.6406516, -1.248055, 2.552985, 0.5607843, 0, 1, 1,
0.6411464, 1.122234, 0.3231033, 0.5647059, 0, 1, 1,
0.6417297, -0.2283865, 0.6166179, 0.572549, 0, 1, 1,
0.6446736, -0.2824313, 0.01155803, 0.5764706, 0, 1, 1,
0.6534854, 0.05124846, 1.658844, 0.5843138, 0, 1, 1,
0.6587562, 0.2628102, -0.2179068, 0.5882353, 0, 1, 1,
0.6638528, -1.481194, 1.302236, 0.5960785, 0, 1, 1,
0.6736332, 1.538758, 1.43579, 0.6039216, 0, 1, 1,
0.6837896, -1.11348, 3.105732, 0.6078432, 0, 1, 1,
0.6849063, 1.659952, 1.015469, 0.6156863, 0, 1, 1,
0.6880691, -0.5352834, 1.262738, 0.6196079, 0, 1, 1,
0.6989591, -0.94685, 2.105334, 0.627451, 0, 1, 1,
0.6993689, -0.6168255, 2.838648, 0.6313726, 0, 1, 1,
0.7011058, 1.092969, 3.048818, 0.6392157, 0, 1, 1,
0.7018378, 1.474578, 0.8673071, 0.6431373, 0, 1, 1,
0.703994, -0.3488549, 0.06212111, 0.6509804, 0, 1, 1,
0.7202323, -0.4798194, 1.989975, 0.654902, 0, 1, 1,
0.7209437, 0.6703144, -1.091327, 0.6627451, 0, 1, 1,
0.7221607, -1.500751, 2.614164, 0.6666667, 0, 1, 1,
0.7234805, 0.764702, 1.362752, 0.6745098, 0, 1, 1,
0.7251924, 1.6858, -0.4025552, 0.6784314, 0, 1, 1,
0.7292013, -0.05442175, 1.33764, 0.6862745, 0, 1, 1,
0.7302867, -0.2807168, 2.513066, 0.6901961, 0, 1, 1,
0.7331823, 0.2527708, 1.551702, 0.6980392, 0, 1, 1,
0.7341995, 0.02155342, 1.72057, 0.7058824, 0, 1, 1,
0.7410248, 0.2364838, 0.8367742, 0.7098039, 0, 1, 1,
0.7434191, 0.5108543, 0.7455455, 0.7176471, 0, 1, 1,
0.7459167, -0.4048712, 1.439634, 0.7215686, 0, 1, 1,
0.7462587, -0.2106795, 1.252813, 0.7294118, 0, 1, 1,
0.7509109, 0.3634661, 2.070213, 0.7333333, 0, 1, 1,
0.756003, -3.119227, 2.040055, 0.7411765, 0, 1, 1,
0.7569064, 0.1083557, 0.8590736, 0.7450981, 0, 1, 1,
0.7585114, 1.165261, 0.0196981, 0.7529412, 0, 1, 1,
0.7655802, 0.1728852, 0.1935429, 0.7568628, 0, 1, 1,
0.7686424, -0.1320403, 2.303684, 0.7647059, 0, 1, 1,
0.7770923, -0.1761321, 3.020658, 0.7686275, 0, 1, 1,
0.7834848, -2.029182, 2.941128, 0.7764706, 0, 1, 1,
0.7835902, -0.8026461, 3.509264, 0.7803922, 0, 1, 1,
0.7848663, -0.9563804, 2.124058, 0.7882353, 0, 1, 1,
0.7901911, 0.5222802, 2.463491, 0.7921569, 0, 1, 1,
0.8048178, 1.177053, 1.011207, 0.8, 0, 1, 1,
0.8099899, -1.02611, 1.447213, 0.8078431, 0, 1, 1,
0.811817, 1.145816, 0.2465061, 0.8117647, 0, 1, 1,
0.8134131, 1.115889, -1.844981, 0.8196079, 0, 1, 1,
0.8143923, 1.019832, 1.330233, 0.8235294, 0, 1, 1,
0.8193061, -0.650921, 1.90165, 0.8313726, 0, 1, 1,
0.8195899, -1.157428, 2.038615, 0.8352941, 0, 1, 1,
0.8223176, 1.497302, 0.9570355, 0.8431373, 0, 1, 1,
0.8234893, 0.7278275, 0.4684656, 0.8470588, 0, 1, 1,
0.8245255, -0.9930053, 2.200715, 0.854902, 0, 1, 1,
0.8313965, 1.569173, 0.9813148, 0.8588235, 0, 1, 1,
0.8342746, -0.8462058, 2.635258, 0.8666667, 0, 1, 1,
0.8447009, 0.8308813, -1.40679, 0.8705882, 0, 1, 1,
0.8478262, -0.5114259, 2.562152, 0.8784314, 0, 1, 1,
0.8490413, 0.8108388, 1.019382, 0.8823529, 0, 1, 1,
0.8495862, -1.297588, 2.190859, 0.8901961, 0, 1, 1,
0.8498309, 0.5671905, 1.760438, 0.8941177, 0, 1, 1,
0.8599783, -1.721519, 1.980644, 0.9019608, 0, 1, 1,
0.8632303, 0.6375532, -2.02817, 0.9098039, 0, 1, 1,
0.8650017, -0.9527602, 1.832926, 0.9137255, 0, 1, 1,
0.8819872, 0.3757121, -0.5371493, 0.9215686, 0, 1, 1,
0.8861481, 0.3511862, 1.803313, 0.9254902, 0, 1, 1,
0.8921595, 0.7279644, 1.160032, 0.9333333, 0, 1, 1,
0.8979291, -0.4771919, 1.155012, 0.9372549, 0, 1, 1,
0.8985702, 0.6729069, 0.7698435, 0.945098, 0, 1, 1,
0.8996931, -0.2612043, 2.465894, 0.9490196, 0, 1, 1,
0.9079505, 2.078558, 0.950262, 0.9568627, 0, 1, 1,
0.9095067, -0.4928328, 2.371065, 0.9607843, 0, 1, 1,
0.9107469, -1.118015, 2.997531, 0.9686275, 0, 1, 1,
0.9117785, -0.8966295, 3.697919, 0.972549, 0, 1, 1,
0.9140161, -0.6445298, 1.4077, 0.9803922, 0, 1, 1,
0.9143509, -0.6331659, 1.968856, 0.9843137, 0, 1, 1,
0.916025, -0.4274635, 4.156356, 0.9921569, 0, 1, 1,
0.9183833, -0.1044081, 2.184131, 0.9960784, 0, 1, 1,
0.9233291, -0.4366129, -0.002991987, 1, 0, 0.9960784, 1,
0.9235381, 0.5419928, 0.5964569, 1, 0, 0.9882353, 1,
0.9256623, 0.4233808, 0.9487723, 1, 0, 0.9843137, 1,
0.926476, 0.3568838, 2.179003, 1, 0, 0.9764706, 1,
0.9272454, 0.4539868, 0.362336, 1, 0, 0.972549, 1,
0.9365242, 0.6978296, -0.03518353, 1, 0, 0.9647059, 1,
0.9526761, 2.593836, -0.8802777, 1, 0, 0.9607843, 1,
0.9600004, -0.3838855, -0.9382567, 1, 0, 0.9529412, 1,
0.963524, 2.130581, -1.487891, 1, 0, 0.9490196, 1,
0.9641987, -0.5193332, 2.52185, 1, 0, 0.9411765, 1,
0.9669569, 0.5353301, 1.575042, 1, 0, 0.9372549, 1,
0.9678887, -2.170951, 2.12753, 1, 0, 0.9294118, 1,
0.97356, -0.5133142, 0.5152153, 1, 0, 0.9254902, 1,
0.9842514, -0.3387619, 0.8802643, 1, 0, 0.9176471, 1,
0.9853566, 0.6198013, 0.3391536, 1, 0, 0.9137255, 1,
0.985725, -0.7610107, 2.400379, 1, 0, 0.9058824, 1,
0.993524, -0.2903496, 0.7839242, 1, 0, 0.9019608, 1,
0.9984536, 0.1256756, 0.2320293, 1, 0, 0.8941177, 1,
1.000396, -0.3229815, 0.7764181, 1, 0, 0.8862745, 1,
1.000548, -1.963747, 4.130448, 1, 0, 0.8823529, 1,
1.000577, -3.10614, 2.404259, 1, 0, 0.8745098, 1,
1.010852, 0.5061045, 0.4744745, 1, 0, 0.8705882, 1,
1.011812, 0.3222121, 2.37544, 1, 0, 0.8627451, 1,
1.012369, 0.2881602, 1.90768, 1, 0, 0.8588235, 1,
1.025702, 1.137671, -0.6081445, 1, 0, 0.8509804, 1,
1.028299, -0.6738615, 2.27799, 1, 0, 0.8470588, 1,
1.030668, 0.1488407, 1.886117, 1, 0, 0.8392157, 1,
1.030929, 0.7421741, 1.01607, 1, 0, 0.8352941, 1,
1.033117, 1.606908, 0.9245239, 1, 0, 0.827451, 1,
1.03326, -1.410331, 1.317222, 1, 0, 0.8235294, 1,
1.03665, -0.7579939, 2.65156, 1, 0, 0.8156863, 1,
1.038951, 1.406775, 0.5006216, 1, 0, 0.8117647, 1,
1.041853, 0.8038416, 1.055922, 1, 0, 0.8039216, 1,
1.046852, -0.1227537, 2.038098, 1, 0, 0.7960784, 1,
1.055057, -0.7762171, 0.4512888, 1, 0, 0.7921569, 1,
1.056812, -2.362674, 2.933472, 1, 0, 0.7843137, 1,
1.059291, 0.4152862, 1.455293, 1, 0, 0.7803922, 1,
1.061872, -0.8981736, 2.117968, 1, 0, 0.772549, 1,
1.062517, -0.3898817, 1.761339, 1, 0, 0.7686275, 1,
1.066515, -0.4139016, 2.476092, 1, 0, 0.7607843, 1,
1.067248, -0.8445606, 4.089222, 1, 0, 0.7568628, 1,
1.073523, 0.9484103, 1.408145, 1, 0, 0.7490196, 1,
1.078314, -0.6523806, 3.898231, 1, 0, 0.7450981, 1,
1.08456, -0.989086, -0.1847988, 1, 0, 0.7372549, 1,
1.089786, 0.3115658, 0.2147672, 1, 0, 0.7333333, 1,
1.09295, -1.008255, 1.855014, 1, 0, 0.7254902, 1,
1.093014, -1.564241, 1.573513, 1, 0, 0.7215686, 1,
1.096267, 0.4393213, 1.008746, 1, 0, 0.7137255, 1,
1.099669, 2.003088, 0.8955858, 1, 0, 0.7098039, 1,
1.099946, -0.3454491, 1.746579, 1, 0, 0.7019608, 1,
1.106476, -0.4724068, 3.306007, 1, 0, 0.6941177, 1,
1.130863, -2.341394, 2.515628, 1, 0, 0.6901961, 1,
1.13731, 0.7363585, 3.112631, 1, 0, 0.682353, 1,
1.139899, -1.173336, 0.590782, 1, 0, 0.6784314, 1,
1.14635, -1.616397, 1.930794, 1, 0, 0.6705883, 1,
1.150555, -1.149769, 2.087779, 1, 0, 0.6666667, 1,
1.152448, -0.7442052, 2.710209, 1, 0, 0.6588235, 1,
1.152699, 0.2532513, 2.294265, 1, 0, 0.654902, 1,
1.15795, 2.103857, 0.3094906, 1, 0, 0.6470588, 1,
1.16112, 0.1821976, 0.5552821, 1, 0, 0.6431373, 1,
1.164918, -0.5162674, 2.859017, 1, 0, 0.6352941, 1,
1.174676, 2.215541, 1.674555, 1, 0, 0.6313726, 1,
1.189415, -0.1523633, 1.665255, 1, 0, 0.6235294, 1,
1.192982, -1.294806, 2.054037, 1, 0, 0.6196079, 1,
1.197461, -1.340932, 2.174657, 1, 0, 0.6117647, 1,
1.198206, 0.05167882, 2.398714, 1, 0, 0.6078432, 1,
1.198271, -0.7409015, 2.756404, 1, 0, 0.6, 1,
1.207545, 1.587454, 0.5326269, 1, 0, 0.5921569, 1,
1.212428, -0.3559259, 2.571718, 1, 0, 0.5882353, 1,
1.215891, -0.05757992, 1.790326, 1, 0, 0.5803922, 1,
1.225052, -0.9979069, 1.32879, 1, 0, 0.5764706, 1,
1.228453, 0.7990474, 2.664527, 1, 0, 0.5686275, 1,
1.228551, -0.9057468, 1.894042, 1, 0, 0.5647059, 1,
1.229149, -0.6145942, 1.189202, 1, 0, 0.5568628, 1,
1.229449, -0.401918, 1.252856, 1, 0, 0.5529412, 1,
1.229967, -2.19927, 2.781965, 1, 0, 0.5450981, 1,
1.244405, -0.9344836, 2.800243, 1, 0, 0.5411765, 1,
1.253861, -0.3101077, 2.491955, 1, 0, 0.5333334, 1,
1.260169, 0.4706999, 2.321966, 1, 0, 0.5294118, 1,
1.262331, 0.9481321, 2.225861, 1, 0, 0.5215687, 1,
1.278521, -1.340613, 1.039508, 1, 0, 0.5176471, 1,
1.28468, -0.1914858, 4.362495, 1, 0, 0.509804, 1,
1.287029, 0.2361803, 1.642166, 1, 0, 0.5058824, 1,
1.290721, 1.765315, 1.313819, 1, 0, 0.4980392, 1,
1.299051, 0.5186384, 1.693702, 1, 0, 0.4901961, 1,
1.30597, 0.09094586, 2.15837, 1, 0, 0.4862745, 1,
1.316275, 0.7600092, 0.7054365, 1, 0, 0.4784314, 1,
1.317484, -0.03667616, 1.489947, 1, 0, 0.4745098, 1,
1.344972, 1.130856, 1.376597, 1, 0, 0.4666667, 1,
1.345928, -1.706319, 4.387988, 1, 0, 0.4627451, 1,
1.365399, -1.02793, 1.323361, 1, 0, 0.454902, 1,
1.366311, 0.9050445, 2.043586, 1, 0, 0.4509804, 1,
1.368418, 0.8303261, 2.232221, 1, 0, 0.4431373, 1,
1.37718, -0.8883077, 2.198021, 1, 0, 0.4392157, 1,
1.386301, -1.120133, 2.767602, 1, 0, 0.4313726, 1,
1.419127, -0.8091473, 0.9442177, 1, 0, 0.427451, 1,
1.428381, -0.5323186, 2.535985, 1, 0, 0.4196078, 1,
1.431629, -0.1642387, 1.25232, 1, 0, 0.4156863, 1,
1.443519, -1.827216, 2.346176, 1, 0, 0.4078431, 1,
1.444249, -0.1875921, 1.358927, 1, 0, 0.4039216, 1,
1.454129, -0.1838979, 2.40017, 1, 0, 0.3960784, 1,
1.459845, 1.017366, 0.8239524, 1, 0, 0.3882353, 1,
1.466935, -0.2784125, 2.679824, 1, 0, 0.3843137, 1,
1.480785, -0.5449151, -0.04444762, 1, 0, 0.3764706, 1,
1.49452, -0.7081873, 1.231293, 1, 0, 0.372549, 1,
1.494897, 0.8421203, 2.264093, 1, 0, 0.3647059, 1,
1.514359, -0.5735934, 1.559097, 1, 0, 0.3607843, 1,
1.517394, -0.7924564, 4.113327, 1, 0, 0.3529412, 1,
1.531273, -0.1346235, 2.67592, 1, 0, 0.3490196, 1,
1.551027, -0.6307938, 2.241499, 1, 0, 0.3411765, 1,
1.561544, -0.418987, 0.1768393, 1, 0, 0.3372549, 1,
1.569421, -0.8979892, 0.2684585, 1, 0, 0.3294118, 1,
1.573284, -0.4395574, 1.325978, 1, 0, 0.3254902, 1,
1.61849, -0.1966261, 0.7197049, 1, 0, 0.3176471, 1,
1.633025, 0.1540652, 2.594581, 1, 0, 0.3137255, 1,
1.653299, 0.9603001, 1.896349, 1, 0, 0.3058824, 1,
1.677141, 0.6857924, 1.364979, 1, 0, 0.2980392, 1,
1.678165, 0.05969658, 1.016709, 1, 0, 0.2941177, 1,
1.698797, 3.56564, 1.130579, 1, 0, 0.2862745, 1,
1.713759, 0.4849465, 1.241065, 1, 0, 0.282353, 1,
1.72108, -0.8514068, 1.85522, 1, 0, 0.2745098, 1,
1.724, -0.7783941, 4.704541, 1, 0, 0.2705882, 1,
1.738857, 0.3662413, 2.82648, 1, 0, 0.2627451, 1,
1.766599, -0.1494839, 2.430379, 1, 0, 0.2588235, 1,
1.770855, 0.3510495, 1.168273, 1, 0, 0.2509804, 1,
1.77509, -0.3560907, -0.2814606, 1, 0, 0.2470588, 1,
1.802305, 1.357673, -0.4992367, 1, 0, 0.2392157, 1,
1.820933, -0.4413933, 0.2662669, 1, 0, 0.2352941, 1,
1.828574, 0.4421334, 1.17486, 1, 0, 0.227451, 1,
1.84189, 1.044719, 1.233436, 1, 0, 0.2235294, 1,
1.842911, 0.5019768, 0.2365686, 1, 0, 0.2156863, 1,
1.890063, -0.6765174, 4.510236, 1, 0, 0.2117647, 1,
1.894645, 1.873301, 0.5048063, 1, 0, 0.2039216, 1,
1.89868, -0.6936832, 1.171272, 1, 0, 0.1960784, 1,
1.910014, -1.279269, 3.621993, 1, 0, 0.1921569, 1,
1.911922, -0.6822566, 1.692494, 1, 0, 0.1843137, 1,
1.957454, -0.8814849, 1.319139, 1, 0, 0.1803922, 1,
1.985374, -0.2247289, 0.6611692, 1, 0, 0.172549, 1,
1.988861, 1.41349, 2.147141, 1, 0, 0.1686275, 1,
1.991571, -0.6342769, 3.634943, 1, 0, 0.1607843, 1,
2.006636, -1.108645, 2.166857, 1, 0, 0.1568628, 1,
2.010107, -1.080246, 2.576992, 1, 0, 0.1490196, 1,
2.024736, 1.07839, 0.8334949, 1, 0, 0.145098, 1,
2.084332, 0.8184876, 0.7687081, 1, 0, 0.1372549, 1,
2.085881, 1.613625, 0.5418195, 1, 0, 0.1333333, 1,
2.08936, 0.3170642, 3.248001, 1, 0, 0.1254902, 1,
2.095611, -1.288646, 2.826401, 1, 0, 0.1215686, 1,
2.186564, -2.5044, 2.88633, 1, 0, 0.1137255, 1,
2.202052, -0.6271451, 1.103049, 1, 0, 0.1098039, 1,
2.207772, -0.2742082, 2.548479, 1, 0, 0.1019608, 1,
2.249344, -0.3967756, 1.430288, 1, 0, 0.09411765, 1,
2.253569, -0.8703277, 2.012486, 1, 0, 0.09019608, 1,
2.268277, 1.60612, 0.361343, 1, 0, 0.08235294, 1,
2.28095, -0.6451287, 0.982969, 1, 0, 0.07843138, 1,
2.351952, -0.04826849, 1.822468, 1, 0, 0.07058824, 1,
2.404866, 0.004984902, 1.704228, 1, 0, 0.06666667, 1,
2.414056, -0.4975949, 3.003136, 1, 0, 0.05882353, 1,
2.463782, 0.1882233, 0.1737957, 1, 0, 0.05490196, 1,
2.523573, 0.1344172, -0.07477825, 1, 0, 0.04705882, 1,
2.543172, 0.6165541, 0.2728124, 1, 0, 0.04313726, 1,
2.661925, -0.123427, 1.250407, 1, 0, 0.03529412, 1,
2.684462, 0.1832536, 1.28524, 1, 0, 0.03137255, 1,
2.751935, -0.3255099, 2.320615, 1, 0, 0.02352941, 1,
2.757938, -2.097723, 2.282479, 1, 0, 0.01960784, 1,
2.82083, 1.498832, -0.6180542, 1, 0, 0.01176471, 1,
3.494804, 0.6322523, -0.6606422, 1, 0, 0.007843138, 1
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
0.1788563, -4.252312, -7.410084, 0, -0.5, 0.5, 0.5,
0.1788563, -4.252312, -7.410084, 1, -0.5, 0.5, 0.5,
0.1788563, -4.252312, -7.410084, 1, 1.5, 0.5, 0.5,
0.1788563, -4.252312, -7.410084, 0, 1.5, 0.5, 0.5
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
-4.261198, 0.2232065, -7.410084, 0, -0.5, 0.5, 0.5,
-4.261198, 0.2232065, -7.410084, 1, -0.5, 0.5, 0.5,
-4.261198, 0.2232065, -7.410084, 1, 1.5, 0.5, 0.5,
-4.261198, 0.2232065, -7.410084, 0, 1.5, 0.5, 0.5
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
-4.261198, -4.252312, 0.3135533, 0, -0.5, 0.5, 0.5,
-4.261198, -4.252312, 0.3135533, 1, -0.5, 0.5, 0.5,
-4.261198, -4.252312, 0.3135533, 1, 1.5, 0.5, 0.5,
-4.261198, -4.252312, 0.3135533, 0, 1.5, 0.5, 0.5
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
-3, -3.2195, -5.627706,
3, -3.2195, -5.627706,
-3, -3.2195, -5.627706,
-3, -3.391635, -5.924769,
-2, -3.2195, -5.627706,
-2, -3.391635, -5.924769,
-1, -3.2195, -5.627706,
-1, -3.391635, -5.924769,
0, -3.2195, -5.627706,
0, -3.391635, -5.924769,
1, -3.2195, -5.627706,
1, -3.391635, -5.924769,
2, -3.2195, -5.627706,
2, -3.391635, -5.924769,
3, -3.2195, -5.627706,
3, -3.391635, -5.924769
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
-3, -3.735906, -6.518895, 0, -0.5, 0.5, 0.5,
-3, -3.735906, -6.518895, 1, -0.5, 0.5, 0.5,
-3, -3.735906, -6.518895, 1, 1.5, 0.5, 0.5,
-3, -3.735906, -6.518895, 0, 1.5, 0.5, 0.5,
-2, -3.735906, -6.518895, 0, -0.5, 0.5, 0.5,
-2, -3.735906, -6.518895, 1, -0.5, 0.5, 0.5,
-2, -3.735906, -6.518895, 1, 1.5, 0.5, 0.5,
-2, -3.735906, -6.518895, 0, 1.5, 0.5, 0.5,
-1, -3.735906, -6.518895, 0, -0.5, 0.5, 0.5,
-1, -3.735906, -6.518895, 1, -0.5, 0.5, 0.5,
-1, -3.735906, -6.518895, 1, 1.5, 0.5, 0.5,
-1, -3.735906, -6.518895, 0, 1.5, 0.5, 0.5,
0, -3.735906, -6.518895, 0, -0.5, 0.5, 0.5,
0, -3.735906, -6.518895, 1, -0.5, 0.5, 0.5,
0, -3.735906, -6.518895, 1, 1.5, 0.5, 0.5,
0, -3.735906, -6.518895, 0, 1.5, 0.5, 0.5,
1, -3.735906, -6.518895, 0, -0.5, 0.5, 0.5,
1, -3.735906, -6.518895, 1, -0.5, 0.5, 0.5,
1, -3.735906, -6.518895, 1, 1.5, 0.5, 0.5,
1, -3.735906, -6.518895, 0, 1.5, 0.5, 0.5,
2, -3.735906, -6.518895, 0, -0.5, 0.5, 0.5,
2, -3.735906, -6.518895, 1, -0.5, 0.5, 0.5,
2, -3.735906, -6.518895, 1, 1.5, 0.5, 0.5,
2, -3.735906, -6.518895, 0, 1.5, 0.5, 0.5,
3, -3.735906, -6.518895, 0, -0.5, 0.5, 0.5,
3, -3.735906, -6.518895, 1, -0.5, 0.5, 0.5,
3, -3.735906, -6.518895, 1, 1.5, 0.5, 0.5,
3, -3.735906, -6.518895, 0, 1.5, 0.5, 0.5
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
-3.23657, -3, -5.627706,
-3.23657, 3, -5.627706,
-3.23657, -3, -5.627706,
-3.407341, -3, -5.924769,
-3.23657, -2, -5.627706,
-3.407341, -2, -5.924769,
-3.23657, -1, -5.627706,
-3.407341, -1, -5.924769,
-3.23657, 0, -5.627706,
-3.407341, 0, -5.924769,
-3.23657, 1, -5.627706,
-3.407341, 1, -5.924769,
-3.23657, 2, -5.627706,
-3.407341, 2, -5.924769,
-3.23657, 3, -5.627706,
-3.407341, 3, -5.924769
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
-3.748884, -3, -6.518895, 0, -0.5, 0.5, 0.5,
-3.748884, -3, -6.518895, 1, -0.5, 0.5, 0.5,
-3.748884, -3, -6.518895, 1, 1.5, 0.5, 0.5,
-3.748884, -3, -6.518895, 0, 1.5, 0.5, 0.5,
-3.748884, -2, -6.518895, 0, -0.5, 0.5, 0.5,
-3.748884, -2, -6.518895, 1, -0.5, 0.5, 0.5,
-3.748884, -2, -6.518895, 1, 1.5, 0.5, 0.5,
-3.748884, -2, -6.518895, 0, 1.5, 0.5, 0.5,
-3.748884, -1, -6.518895, 0, -0.5, 0.5, 0.5,
-3.748884, -1, -6.518895, 1, -0.5, 0.5, 0.5,
-3.748884, -1, -6.518895, 1, 1.5, 0.5, 0.5,
-3.748884, -1, -6.518895, 0, 1.5, 0.5, 0.5,
-3.748884, 0, -6.518895, 0, -0.5, 0.5, 0.5,
-3.748884, 0, -6.518895, 1, -0.5, 0.5, 0.5,
-3.748884, 0, -6.518895, 1, 1.5, 0.5, 0.5,
-3.748884, 0, -6.518895, 0, 1.5, 0.5, 0.5,
-3.748884, 1, -6.518895, 0, -0.5, 0.5, 0.5,
-3.748884, 1, -6.518895, 1, -0.5, 0.5, 0.5,
-3.748884, 1, -6.518895, 1, 1.5, 0.5, 0.5,
-3.748884, 1, -6.518895, 0, 1.5, 0.5, 0.5,
-3.748884, 2, -6.518895, 0, -0.5, 0.5, 0.5,
-3.748884, 2, -6.518895, 1, -0.5, 0.5, 0.5,
-3.748884, 2, -6.518895, 1, 1.5, 0.5, 0.5,
-3.748884, 2, -6.518895, 0, 1.5, 0.5, 0.5,
-3.748884, 3, -6.518895, 0, -0.5, 0.5, 0.5,
-3.748884, 3, -6.518895, 1, -0.5, 0.5, 0.5,
-3.748884, 3, -6.518895, 1, 1.5, 0.5, 0.5,
-3.748884, 3, -6.518895, 0, 1.5, 0.5, 0.5
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
-3.23657, -3.2195, -4,
-3.23657, -3.2195, 6,
-3.23657, -3.2195, -4,
-3.407341, -3.391635, -4,
-3.23657, -3.2195, -2,
-3.407341, -3.391635, -2,
-3.23657, -3.2195, 0,
-3.407341, -3.391635, 0,
-3.23657, -3.2195, 2,
-3.407341, -3.391635, 2,
-3.23657, -3.2195, 4,
-3.407341, -3.391635, 4,
-3.23657, -3.2195, 6,
-3.407341, -3.391635, 6
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
-3.748884, -3.735906, -4, 0, -0.5, 0.5, 0.5,
-3.748884, -3.735906, -4, 1, -0.5, 0.5, 0.5,
-3.748884, -3.735906, -4, 1, 1.5, 0.5, 0.5,
-3.748884, -3.735906, -4, 0, 1.5, 0.5, 0.5,
-3.748884, -3.735906, -2, 0, -0.5, 0.5, 0.5,
-3.748884, -3.735906, -2, 1, -0.5, 0.5, 0.5,
-3.748884, -3.735906, -2, 1, 1.5, 0.5, 0.5,
-3.748884, -3.735906, -2, 0, 1.5, 0.5, 0.5,
-3.748884, -3.735906, 0, 0, -0.5, 0.5, 0.5,
-3.748884, -3.735906, 0, 1, -0.5, 0.5, 0.5,
-3.748884, -3.735906, 0, 1, 1.5, 0.5, 0.5,
-3.748884, -3.735906, 0, 0, 1.5, 0.5, 0.5,
-3.748884, -3.735906, 2, 0, -0.5, 0.5, 0.5,
-3.748884, -3.735906, 2, 1, -0.5, 0.5, 0.5,
-3.748884, -3.735906, 2, 1, 1.5, 0.5, 0.5,
-3.748884, -3.735906, 2, 0, 1.5, 0.5, 0.5,
-3.748884, -3.735906, 4, 0, -0.5, 0.5, 0.5,
-3.748884, -3.735906, 4, 1, -0.5, 0.5, 0.5,
-3.748884, -3.735906, 4, 1, 1.5, 0.5, 0.5,
-3.748884, -3.735906, 4, 0, 1.5, 0.5, 0.5,
-3.748884, -3.735906, 6, 0, -0.5, 0.5, 0.5,
-3.748884, -3.735906, 6, 1, -0.5, 0.5, 0.5,
-3.748884, -3.735906, 6, 1, 1.5, 0.5, 0.5,
-3.748884, -3.735906, 6, 0, 1.5, 0.5, 0.5
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
-3.23657, -3.2195, -5.627706,
-3.23657, 3.665913, -5.627706,
-3.23657, -3.2195, 6.254813,
-3.23657, 3.665913, 6.254813,
-3.23657, -3.2195, -5.627706,
-3.23657, -3.2195, 6.254813,
-3.23657, 3.665913, -5.627706,
-3.23657, 3.665913, 6.254813,
-3.23657, -3.2195, -5.627706,
3.594282, -3.2195, -5.627706,
-3.23657, -3.2195, 6.254813,
3.594282, -3.2195, 6.254813,
-3.23657, 3.665913, -5.627706,
3.594282, 3.665913, -5.627706,
-3.23657, 3.665913, 6.254813,
3.594282, 3.665913, 6.254813,
3.594282, -3.2195, -5.627706,
3.594282, 3.665913, -5.627706,
3.594282, -3.2195, 6.254813,
3.594282, 3.665913, 6.254813,
3.594282, -3.2195, -5.627706,
3.594282, -3.2195, 6.254813,
3.594282, 3.665913, -5.627706,
3.594282, 3.665913, 6.254813
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
var radius = 8.190359;
var distance = 36.43983;
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
mvMatrix.translate( -0.1788563, -0.2232065, -0.3135533 );
mvMatrix.scale( 1.296409, 1.286136, 0.7452609 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.43983);
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
Methomyl<-read.table("Methomyl.xyz")
```

```
## Error in read.table("Methomyl.xyz"): no lines available in input
```

```r
x<-Methomyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methomyl' not found
```

```r
y<-Methomyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methomyl' not found
```

```r
z<-Methomyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methomyl' not found
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
-3.137091, 0.06699406, -0.7683156, 0, 0, 1, 1, 1,
-2.841977, 1.572122, -1.068544, 1, 0, 0, 1, 1,
-2.729439, 0.3864929, -0.6733369, 1, 0, 0, 1, 1,
-2.59561, 1.112532, 0.03576147, 1, 0, 0, 1, 1,
-2.505127, -0.5789381, -1.186403, 1, 0, 0, 1, 1,
-2.460396, 0.4227276, -2.088075, 1, 0, 0, 1, 1,
-2.396608, 1.634609, -2.005845, 0, 0, 0, 1, 1,
-2.374949, -1.193782, -1.268488, 0, 0, 0, 1, 1,
-2.324276, -0.1477057, -1.473906, 0, 0, 0, 1, 1,
-2.273793, 0.5437748, -2.073127, 0, 0, 0, 1, 1,
-2.243856, 0.452349, -1.130506, 0, 0, 0, 1, 1,
-2.180877, 0.1432843, -1.858071, 0, 0, 0, 1, 1,
-2.131896, -0.4106632, -1.927397, 0, 0, 0, 1, 1,
-2.106893, 0.8917444, -0.04168904, 1, 1, 1, 1, 1,
-2.072788, 0.2769159, -1.190682, 1, 1, 1, 1, 1,
-2.037448, -1.610202, -2.283686, 1, 1, 1, 1, 1,
-2.01383, 0.3531148, -0.9530874, 1, 1, 1, 1, 1,
-2.012639, 0.5637914, -2.930588, 1, 1, 1, 1, 1,
-2.009926, 1.371027, -0.9312887, 1, 1, 1, 1, 1,
-2.004616, 0.8773727, -2.133261, 1, 1, 1, 1, 1,
-1.990853, 0.6679046, -1.092265, 1, 1, 1, 1, 1,
-1.976146, 1.917095, -1.324062, 1, 1, 1, 1, 1,
-1.957948, 0.456261, -1.629344, 1, 1, 1, 1, 1,
-1.950344, -0.8046162, -2.120408, 1, 1, 1, 1, 1,
-1.949403, 1.066997, -1.162704, 1, 1, 1, 1, 1,
-1.906069, 0.1713304, -1.257041, 1, 1, 1, 1, 1,
-1.895545, -0.3304871, 0.4656169, 1, 1, 1, 1, 1,
-1.867425, 2.1453, -1.542448, 1, 1, 1, 1, 1,
-1.866797, -1.595399, -2.369607, 0, 0, 1, 1, 1,
-1.858549, -0.05475466, -3.068488, 1, 0, 0, 1, 1,
-1.852366, -0.9400307, -4.033759, 1, 0, 0, 1, 1,
-1.844126, 0.02969472, -2.661444, 1, 0, 0, 1, 1,
-1.840883, 0.1375052, -0.5059146, 1, 0, 0, 1, 1,
-1.833741, -0.2872476, -2.910146, 1, 0, 0, 1, 1,
-1.833578, -0.3459692, -0.8079414, 0, 0, 0, 1, 1,
-1.820779, -1.678697, -3.70176, 0, 0, 0, 1, 1,
-1.780319, 0.9281909, -0.8972051, 0, 0, 0, 1, 1,
-1.745668, -1.79398, -2.476784, 0, 0, 0, 1, 1,
-1.744693, -0.262426, -1.710639, 0, 0, 0, 1, 1,
-1.734819, -0.6848832, -2.480843, 0, 0, 0, 1, 1,
-1.732953, -0.6159344, -3.116791, 0, 0, 0, 1, 1,
-1.714037, 0.8284251, -1.91244, 1, 1, 1, 1, 1,
-1.693572, -0.3253801, -1.814704, 1, 1, 1, 1, 1,
-1.681166, -0.02288033, -1.623905, 1, 1, 1, 1, 1,
-1.675051, -1.255206, -0.9930567, 1, 1, 1, 1, 1,
-1.672619, 0.732515, -2.203605, 1, 1, 1, 1, 1,
-1.670288, -0.395038, -2.272765, 1, 1, 1, 1, 1,
-1.664385, 0.2695136, 0.3351579, 1, 1, 1, 1, 1,
-1.663731, -0.3476722, -1.732646, 1, 1, 1, 1, 1,
-1.663116, -1.150337, -2.68724, 1, 1, 1, 1, 1,
-1.614271, 0.7928375, -2.067096, 1, 1, 1, 1, 1,
-1.613787, -0.4498223, -0.3402879, 1, 1, 1, 1, 1,
-1.608002, -1.414317, -3.24427, 1, 1, 1, 1, 1,
-1.607266, 0.3311715, -3.043858, 1, 1, 1, 1, 1,
-1.604938, -0.5506622, -1.533011, 1, 1, 1, 1, 1,
-1.598445, 1.131868, -2.788199, 1, 1, 1, 1, 1,
-1.589645, -0.6479313, -1.53744, 0, 0, 1, 1, 1,
-1.588689, 1.114588, -0.2794302, 1, 0, 0, 1, 1,
-1.572338, 1.092837, -0.6955745, 1, 0, 0, 1, 1,
-1.546297, -1.200527, -2.906071, 1, 0, 0, 1, 1,
-1.544526, 0.5160796, -1.10939, 1, 0, 0, 1, 1,
-1.53755, -0.2074307, -0.003951825, 1, 0, 0, 1, 1,
-1.53222, 1.722781, -2.149575, 0, 0, 0, 1, 1,
-1.53004, -0.7432407, 0.1541325, 0, 0, 0, 1, 1,
-1.52837, -0.1256057, -0.303036, 0, 0, 0, 1, 1,
-1.526864, 0.7455444, -1.859259, 0, 0, 0, 1, 1,
-1.498034, -0.1732091, -2.869355, 0, 0, 0, 1, 1,
-1.492856, -0.3279849, -0.617536, 0, 0, 0, 1, 1,
-1.47643, -1.856827, -3.600375, 0, 0, 0, 1, 1,
-1.456901, 0.2541106, -3.017527, 1, 1, 1, 1, 1,
-1.427672, -0.8497445, -3.525073, 1, 1, 1, 1, 1,
-1.42068, -0.3451472, 0.4099451, 1, 1, 1, 1, 1,
-1.405354, -1.195484, -1.960325, 1, 1, 1, 1, 1,
-1.404953, 1.953498, -1.031763, 1, 1, 1, 1, 1,
-1.395617, 2.466006, -0.5071999, 1, 1, 1, 1, 1,
-1.394161, 0.3521014, -0.9068735, 1, 1, 1, 1, 1,
-1.372307, 1.962749, -0.03261188, 1, 1, 1, 1, 1,
-1.357523, -0.07101598, -0.05337601, 1, 1, 1, 1, 1,
-1.356158, -1.184624, -3.054662, 1, 1, 1, 1, 1,
-1.330573, -1.506169, -0.6817809, 1, 1, 1, 1, 1,
-1.328506, 0.8334706, -0.6918544, 1, 1, 1, 1, 1,
-1.315992, -1.651415, -2.39724, 1, 1, 1, 1, 1,
-1.297635, -0.7725033, -1.461131, 1, 1, 1, 1, 1,
-1.295076, -0.402785, -1.753162, 1, 1, 1, 1, 1,
-1.294791, -0.3781476, -1.547361, 0, 0, 1, 1, 1,
-1.284983, -0.1870758, -2.348921, 1, 0, 0, 1, 1,
-1.283351, -0.602236, -1.545526, 1, 0, 0, 1, 1,
-1.261463, 0.8493811, -0.593899, 1, 0, 0, 1, 1,
-1.254652, 1.1686, -1.323813, 1, 0, 0, 1, 1,
-1.246246, 0.5213225, -2.749613, 1, 0, 0, 1, 1,
-1.234074, 0.3170092, -0.4657511, 0, 0, 0, 1, 1,
-1.233194, 1.044098, -0.9124276, 0, 0, 0, 1, 1,
-1.233088, 0.2965271, -1.281638, 0, 0, 0, 1, 1,
-1.229564, 0.9590124, -1.211464, 0, 0, 0, 1, 1,
-1.228732, 1.062008, -1.236804, 0, 0, 0, 1, 1,
-1.220809, -1.888609, -3.821874, 0, 0, 0, 1, 1,
-1.20813, -0.8436669, -2.835873, 0, 0, 0, 1, 1,
-1.199412, 0.1761432, 0.07443641, 1, 1, 1, 1, 1,
-1.196748, -0.7450364, -1.727673, 1, 1, 1, 1, 1,
-1.191787, 0.1399404, -2.152165, 1, 1, 1, 1, 1,
-1.188008, 1.100421, 2.052643, 1, 1, 1, 1, 1,
-1.180764, -1.091012, -4.921521, 1, 1, 1, 1, 1,
-1.172431, -1.477662, -2.647218, 1, 1, 1, 1, 1,
-1.167911, 0.4078049, -2.960793, 1, 1, 1, 1, 1,
-1.15154, 0.4700647, -0.2481718, 1, 1, 1, 1, 1,
-1.14898, 0.6081312, -1.467464, 1, 1, 1, 1, 1,
-1.147594, 1.300484, 0.004501317, 1, 1, 1, 1, 1,
-1.142333, -1.368977, -3.975891, 1, 1, 1, 1, 1,
-1.135767, -0.2413076, -1.146964, 1, 1, 1, 1, 1,
-1.121722, -0.3723477, -2.594895, 1, 1, 1, 1, 1,
-1.115771, 0.465461, 0.2127485, 1, 1, 1, 1, 1,
-1.114482, 0.283, -2.067185, 1, 1, 1, 1, 1,
-1.111478, 0.817865, -1.494218, 0, 0, 1, 1, 1,
-1.107629, -1.90615, -2.156077, 1, 0, 0, 1, 1,
-1.100168, -0.04759515, -2.351455, 1, 0, 0, 1, 1,
-1.092168, -1.654764, -3.105031, 1, 0, 0, 1, 1,
-1.088854, -1.907856, -2.473939, 1, 0, 0, 1, 1,
-1.085311, 1.470338, 0.00404824, 1, 0, 0, 1, 1,
-1.076673, -0.2855984, -0.9881298, 0, 0, 0, 1, 1,
-1.070775, 1.872972, -0.4127397, 0, 0, 0, 1, 1,
-1.062083, -0.015404, -3.01096, 0, 0, 0, 1, 1,
-1.057571, -0.6818606, -1.083024, 0, 0, 0, 1, 1,
-1.053163, 1.247721, 0.05744143, 0, 0, 0, 1, 1,
-1.052903, -0.4863079, 0.08811729, 0, 0, 0, 1, 1,
-1.052594, -1.24266, -3.615097, 0, 0, 0, 1, 1,
-1.047328, 1.34992, 0.4533981, 1, 1, 1, 1, 1,
-1.035699, 0.5302365, -0.8868688, 1, 1, 1, 1, 1,
-1.033219, -1.685704, -5.081181, 1, 1, 1, 1, 1,
-1.030843, -0.6701775, -2.771344, 1, 1, 1, 1, 1,
-1.028157, 0.4104041, -2.344657, 1, 1, 1, 1, 1,
-1.027594, -0.2354172, -2.440541, 1, 1, 1, 1, 1,
-1.025971, 0.7139208, -0.7908918, 1, 1, 1, 1, 1,
-1.022062, -0.05416676, -2.209465, 1, 1, 1, 1, 1,
-1.020807, -0.8409126, -2.786546, 1, 1, 1, 1, 1,
-1.017994, 0.5110277, -0.5076168, 1, 1, 1, 1, 1,
-1.017498, 1.121808, -0.1050164, 1, 1, 1, 1, 1,
-1.009562, 0.2440233, -0.9074103, 1, 1, 1, 1, 1,
-1.009536, 0.3480371, 0.7946109, 1, 1, 1, 1, 1,
-1.00615, -1.3594, -3.560001, 1, 1, 1, 1, 1,
-1.004216, -0.7764066, -3.470127, 1, 1, 1, 1, 1,
-1.001834, -1.164506, -3.267839, 0, 0, 1, 1, 1,
-0.9998603, 0.6198712, -0.4707097, 1, 0, 0, 1, 1,
-0.9990681, -1.516029, -3.486462, 1, 0, 0, 1, 1,
-0.9962828, -0.6165575, -2.237886, 1, 0, 0, 1, 1,
-0.9927295, 0.2502552, -1.871783, 1, 0, 0, 1, 1,
-0.9913551, 0.1455121, -1.038388, 1, 0, 0, 1, 1,
-0.9902487, -1.002666, -2.047895, 0, 0, 0, 1, 1,
-0.9873221, 0.2694949, -0.5950164, 0, 0, 0, 1, 1,
-0.9872979, -0.3067231, -1.133051, 0, 0, 0, 1, 1,
-0.9839908, -1.370014, -2.585044, 0, 0, 0, 1, 1,
-0.9812003, -0.710789, -0.3885782, 0, 0, 0, 1, 1,
-0.9781477, 0.74676, 0.04348779, 0, 0, 0, 1, 1,
-0.9733493, 0.27636, -1.081405, 0, 0, 0, 1, 1,
-0.9719903, 0.05533823, -0.8522571, 1, 1, 1, 1, 1,
-0.9713464, 0.3841668, -2.249719, 1, 1, 1, 1, 1,
-0.968283, -0.4929283, -1.595297, 1, 1, 1, 1, 1,
-0.9655439, 0.2273801, -2.099928, 1, 1, 1, 1, 1,
-0.9532436, -1.398163, -2.739214, 1, 1, 1, 1, 1,
-0.9524266, -0.6252701, -3.062248, 1, 1, 1, 1, 1,
-0.9520681, -1.514526, -1.997081, 1, 1, 1, 1, 1,
-0.9513146, -0.05381886, 0.5502918, 1, 1, 1, 1, 1,
-0.9511141, 0.6165687, 0.2881809, 1, 1, 1, 1, 1,
-0.950247, 1.071863, -1.833247, 1, 1, 1, 1, 1,
-0.9496152, -0.7296687, -1.884804, 1, 1, 1, 1, 1,
-0.9489632, 0.9308662, -0.6537623, 1, 1, 1, 1, 1,
-0.9449136, -0.2405793, -3.694071, 1, 1, 1, 1, 1,
-0.9445598, -0.7527146, -1.237114, 1, 1, 1, 1, 1,
-0.9421916, 1.01222, -1.259463, 1, 1, 1, 1, 1,
-0.9404841, -1.385965, -1.527154, 0, 0, 1, 1, 1,
-0.9375581, 0.07710674, -3.952467, 1, 0, 0, 1, 1,
-0.9335156, 0.8100545, -0.09137181, 1, 0, 0, 1, 1,
-0.9329319, 1.35649, -0.2422043, 1, 0, 0, 1, 1,
-0.9322008, -0.905153, -2.588063, 1, 0, 0, 1, 1,
-0.9317021, 0.84496, 0.6875971, 1, 0, 0, 1, 1,
-0.9297759, 0.2257399, 0.1904793, 0, 0, 0, 1, 1,
-0.9189437, 0.8977485, -0.5934175, 0, 0, 0, 1, 1,
-0.9145207, -0.04586028, -1.514663, 0, 0, 0, 1, 1,
-0.9126626, -0.8294812, -1.775775, 0, 0, 0, 1, 1,
-0.9109412, -0.6349142, 0.03711144, 0, 0, 0, 1, 1,
-0.8956892, 1.194574, -0.4121442, 0, 0, 0, 1, 1,
-0.89525, -0.5412856, -2.11734, 0, 0, 0, 1, 1,
-0.8939916, -0.6022708, -0.7069094, 1, 1, 1, 1, 1,
-0.8791363, 0.7945334, -2.292986, 1, 1, 1, 1, 1,
-0.8739626, 0.5093509, -3.293072, 1, 1, 1, 1, 1,
-0.8666748, 1.235563, -0.4372416, 1, 1, 1, 1, 1,
-0.8620325, -1.39018, -1.958036, 1, 1, 1, 1, 1,
-0.8610542, -1.501858, -2.719108, 1, 1, 1, 1, 1,
-0.8570328, 0.4197035, -1.503541, 1, 1, 1, 1, 1,
-0.846263, -2.054772, -2.969851, 1, 1, 1, 1, 1,
-0.8454923, -1.443266, -1.258144, 1, 1, 1, 1, 1,
-0.8451765, -0.3992206, -1.84581, 1, 1, 1, 1, 1,
-0.8345343, 1.326509, 0.2649986, 1, 1, 1, 1, 1,
-0.8327956, 0.1202919, -0.103616, 1, 1, 1, 1, 1,
-0.8311326, -0.4237313, -2.373459, 1, 1, 1, 1, 1,
-0.8277022, -1.628414, -4.522588, 1, 1, 1, 1, 1,
-0.8251864, -1.01626, -2.35959, 1, 1, 1, 1, 1,
-0.8201786, 1.634361, 0.1438286, 0, 0, 1, 1, 1,
-0.8155268, 0.2387987, -0.5745544, 1, 0, 0, 1, 1,
-0.8069989, 0.6425499, -0.4393398, 1, 0, 0, 1, 1,
-0.8058539, -1.287758, -1.696775, 1, 0, 0, 1, 1,
-0.7966084, 0.9009267, -2.093626, 1, 0, 0, 1, 1,
-0.795162, 1.008473, -0.8121845, 1, 0, 0, 1, 1,
-0.7929248, -1.548004, -3.898692, 0, 0, 0, 1, 1,
-0.7910084, 0.7160973, 0.01333604, 0, 0, 0, 1, 1,
-0.782934, -0.7989152, -4.390772, 0, 0, 0, 1, 1,
-0.7823448, -1.391341, -4.550056, 0, 0, 0, 1, 1,
-0.7738526, -1.090597, -3.564405, 0, 0, 0, 1, 1,
-0.761025, -0.7353398, -2.2959, 0, 0, 0, 1, 1,
-0.7601321, 0.1074554, -0.6404386, 0, 0, 0, 1, 1,
-0.7600056, 0.9783025, -2.258406, 1, 1, 1, 1, 1,
-0.7590509, 0.4810578, -1.397008, 1, 1, 1, 1, 1,
-0.7574008, 1.361203, -1.055771, 1, 1, 1, 1, 1,
-0.7475168, -0.3294165, 0.02421867, 1, 1, 1, 1, 1,
-0.7402557, 0.4089358, -2.462877, 1, 1, 1, 1, 1,
-0.7371721, 1.793003, 0.896401, 1, 1, 1, 1, 1,
-0.7369353, -0.8531235, -2.816216, 1, 1, 1, 1, 1,
-0.736307, -0.8905956, -2.104561, 1, 1, 1, 1, 1,
-0.7350903, -0.0543398, -0.8070638, 1, 1, 1, 1, 1,
-0.7326123, 1.324503, -0.7348638, 1, 1, 1, 1, 1,
-0.7313885, 0.2325993, -1.689672, 1, 1, 1, 1, 1,
-0.7299293, 1.790903, 0.8316591, 1, 1, 1, 1, 1,
-0.7285473, -0.7025515, -3.525213, 1, 1, 1, 1, 1,
-0.7242384, 0.3410545, -1.718172, 1, 1, 1, 1, 1,
-0.7208954, -0.1630971, -0.8468182, 1, 1, 1, 1, 1,
-0.7147214, -0.5364299, -1.484432, 0, 0, 1, 1, 1,
-0.7126502, -1.299208, -3.640297, 1, 0, 0, 1, 1,
-0.7114486, 1.490503, 0.7416747, 1, 0, 0, 1, 1,
-0.7087188, 1.20743, -1.322831, 1, 0, 0, 1, 1,
-0.7052631, -0.5012823, -2.714746, 1, 0, 0, 1, 1,
-0.7037725, -0.4068568, 0.3218506, 1, 0, 0, 1, 1,
-0.7018448, 1.511896, 1.299708, 0, 0, 0, 1, 1,
-0.6994208, -1.783268, -2.657044, 0, 0, 0, 1, 1,
-0.6932249, -0.03471186, -2.609093, 0, 0, 0, 1, 1,
-0.6908289, 0.8588558, -1.810004, 0, 0, 0, 1, 1,
-0.6902359, 1.243219, -1.597058, 0, 0, 0, 1, 1,
-0.6817387, -0.9259824, -1.920144, 0, 0, 0, 1, 1,
-0.6812257, -1.153926, -3.206901, 0, 0, 0, 1, 1,
-0.6785012, -0.1491276, 0.01118446, 1, 1, 1, 1, 1,
-0.6736141, 1.696821, 1.14555, 1, 1, 1, 1, 1,
-0.6725425, 0.1277201, -0.03992205, 1, 1, 1, 1, 1,
-0.6720992, -0.3660856, -2.472756, 1, 1, 1, 1, 1,
-0.6705336, 1.108619, -1.247868, 1, 1, 1, 1, 1,
-0.6603293, 0.7243096, -1.214215, 1, 1, 1, 1, 1,
-0.6523318, -0.8648136, -3.137298, 1, 1, 1, 1, 1,
-0.6515716, 1.51906, -0.3950786, 1, 1, 1, 1, 1,
-0.6484308, -0.6511046, -2.465718, 1, 1, 1, 1, 1,
-0.6472026, 0.1547257, -1.889112, 1, 1, 1, 1, 1,
-0.6468477, -1.100104, -2.528428, 1, 1, 1, 1, 1,
-0.6448856, -2.979865, -3.601213, 1, 1, 1, 1, 1,
-0.6364269, 1.022653, -0.9743165, 1, 1, 1, 1, 1,
-0.6360292, -0.2911235, -0.3604144, 1, 1, 1, 1, 1,
-0.635293, -0.9915953, -2.902827, 1, 1, 1, 1, 1,
-0.6346385, 0.09327864, -0.9030579, 0, 0, 1, 1, 1,
-0.6309763, -2.098493, -3.807762, 1, 0, 0, 1, 1,
-0.6254748, -0.2345851, -2.572964, 1, 0, 0, 1, 1,
-0.6223507, 0.9589038, -0.4962238, 1, 0, 0, 1, 1,
-0.6201429, -1.060163, -3.496233, 1, 0, 0, 1, 1,
-0.6166068, -0.5917628, -2.093216, 1, 0, 0, 1, 1,
-0.614822, -1.756481, -2.5242, 0, 0, 0, 1, 1,
-0.6071514, -0.6920772, -2.136605, 0, 0, 0, 1, 1,
-0.6052979, 0.6382583, -1.180651, 0, 0, 0, 1, 1,
-0.6037856, 0.1587079, -0.4864312, 0, 0, 0, 1, 1,
-0.5990496, 0.2429658, 0.70067, 0, 0, 0, 1, 1,
-0.5945911, 0.3006091, -1.907861, 0, 0, 0, 1, 1,
-0.5942862, -0.3306631, -2.19325, 0, 0, 0, 1, 1,
-0.5930424, -0.2261593, -3.943346, 1, 1, 1, 1, 1,
-0.5914251, -1.279043, -3.295484, 1, 1, 1, 1, 1,
-0.5876752, -0.1466447, 0.5956959, 1, 1, 1, 1, 1,
-0.5805715, 0.5471337, -1.138645, 1, 1, 1, 1, 1,
-0.5747124, -0.7172371, -3.574957, 1, 1, 1, 1, 1,
-0.5736109, 0.82067, -3.24177, 1, 1, 1, 1, 1,
-0.5676667, 0.2798951, -0.9007673, 1, 1, 1, 1, 1,
-0.5673673, -0.2090132, -1.389756, 1, 1, 1, 1, 1,
-0.5633544, -0.8564958, -2.011492, 1, 1, 1, 1, 1,
-0.5598551, -0.4388941, -0.9723148, 1, 1, 1, 1, 1,
-0.5523465, 0.04397631, -1.226417, 1, 1, 1, 1, 1,
-0.5513559, 2.117304, -0.71728, 1, 1, 1, 1, 1,
-0.545978, -0.5711077, -3.823538, 1, 1, 1, 1, 1,
-0.5453309, -0.4639052, -3.21681, 1, 1, 1, 1, 1,
-0.5446675, 0.664129, -0.5997204, 1, 1, 1, 1, 1,
-0.5338696, -1.186781, -0.8375459, 0, 0, 1, 1, 1,
-0.5334681, -1.745126, -3.16112, 1, 0, 0, 1, 1,
-0.5331501, -1.053057, -2.980303, 1, 0, 0, 1, 1,
-0.5296165, 0.1203337, -1.787003, 1, 0, 0, 1, 1,
-0.529367, 0.1050814, -1.6064, 1, 0, 0, 1, 1,
-0.5255349, -0.9921932, -4.341179, 1, 0, 0, 1, 1,
-0.5240747, -0.2414217, -3.048786, 0, 0, 0, 1, 1,
-0.5240714, 0.6295039, -4.553841, 0, 0, 0, 1, 1,
-0.5234839, -0.1247816, -2.339692, 0, 0, 0, 1, 1,
-0.5221124, -0.3218754, -1.174569, 0, 0, 0, 1, 1,
-0.5176334, -0.8227187, -4.824899, 0, 0, 0, 1, 1,
-0.5172893, -0.58961, -1.08051, 0, 0, 0, 1, 1,
-0.5159917, -0.1519746, -2.341657, 0, 0, 0, 1, 1,
-0.511964, 0.3801971, -2.170783, 1, 1, 1, 1, 1,
-0.5117671, 0.8648625, 0.01950315, 1, 1, 1, 1, 1,
-0.5116872, -1.065374, -2.697197, 1, 1, 1, 1, 1,
-0.5094578, 0.9384556, 0.22752, 1, 1, 1, 1, 1,
-0.5061476, 1.902304, -0.6435631, 1, 1, 1, 1, 1,
-0.5019897, -0.1429427, -3.425789, 1, 1, 1, 1, 1,
-0.5000612, 1.360383, -1.646698, 1, 1, 1, 1, 1,
-0.4977383, 0.4711623, -1.68636, 1, 1, 1, 1, 1,
-0.4960388, -1.73878, -3.222731, 1, 1, 1, 1, 1,
-0.4953807, 0.4989831, -1.259763, 1, 1, 1, 1, 1,
-0.4926206, 1.480752, -0.8475301, 1, 1, 1, 1, 1,
-0.4916854, -1.972137, -0.5189277, 1, 1, 1, 1, 1,
-0.4910257, -0.9519607, -2.74158, 1, 1, 1, 1, 1,
-0.4885871, -1.022333, -3.804764, 1, 1, 1, 1, 1,
-0.4857244, -1.684415, -0.7902599, 1, 1, 1, 1, 1,
-0.4856113, -1.168728, -4.438702, 0, 0, 1, 1, 1,
-0.4769613, 0.7133834, 0.4936961, 1, 0, 0, 1, 1,
-0.4756538, -0.3250303, -3.859361, 1, 0, 0, 1, 1,
-0.4677362, -2.475877, -4.192432, 1, 0, 0, 1, 1,
-0.4599098, -0.2875771, -3.658307, 1, 0, 0, 1, 1,
-0.4568027, -1.188983, -3.314321, 1, 0, 0, 1, 1,
-0.4514634, -1.031897, -4.311508, 0, 0, 0, 1, 1,
-0.4496234, 2.025369, -1.677158, 0, 0, 0, 1, 1,
-0.4450403, -0.5116598, -1.05568, 0, 0, 0, 1, 1,
-0.4430812, -1.157938, -2.695542, 0, 0, 0, 1, 1,
-0.4425948, 0.1839322, -2.860812, 0, 0, 0, 1, 1,
-0.441389, -1.1445, -3.343089, 0, 0, 0, 1, 1,
-0.4380369, 1.139596, 1.126231, 0, 0, 0, 1, 1,
-0.4349149, 0.9932978, 0.9850906, 1, 1, 1, 1, 1,
-0.4313318, 1.050058, -0.1116287, 1, 1, 1, 1, 1,
-0.4297358, -1.06175, -3.349025, 1, 1, 1, 1, 1,
-0.4213347, -0.1048462, -1.016285, 1, 1, 1, 1, 1,
-0.4208556, -0.9871108, -2.811188, 1, 1, 1, 1, 1,
-0.4202398, -0.7913949, -2.293152, 1, 1, 1, 1, 1,
-0.4171276, 0.3338145, -0.8387361, 1, 1, 1, 1, 1,
-0.4112435, -0.04181276, -2.127238, 1, 1, 1, 1, 1,
-0.410212, -0.876612, -1.943352, 1, 1, 1, 1, 1,
-0.4101567, -0.1886537, -1.901312, 1, 1, 1, 1, 1,
-0.4073685, 1.078332, 0.4916901, 1, 1, 1, 1, 1,
-0.4038294, -0.6846358, -3.07289, 1, 1, 1, 1, 1,
-0.4000036, 0.2528405, -1.538211, 1, 1, 1, 1, 1,
-0.3965616, 1.448936, -1.576316, 1, 1, 1, 1, 1,
-0.3920678, 0.1616403, -2.039011, 1, 1, 1, 1, 1,
-0.382398, 1.172515, 0.4064633, 0, 0, 1, 1, 1,
-0.3810924, 0.7996361, -0.323061, 1, 0, 0, 1, 1,
-0.3787988, -0.09812293, -2.586185, 1, 0, 0, 1, 1,
-0.3770448, -0.9815863, -2.200868, 1, 0, 0, 1, 1,
-0.3765095, -1.158939, -2.121922, 1, 0, 0, 1, 1,
-0.3744532, 1.044645, -1.064861, 1, 0, 0, 1, 1,
-0.3716192, 0.4138202, -0.7192339, 0, 0, 0, 1, 1,
-0.368665, -1.956472, -1.779455, 0, 0, 0, 1, 1,
-0.3670801, 1.14388, -0.7673438, 0, 0, 0, 1, 1,
-0.3664616, 1.416037, -0.64656, 0, 0, 0, 1, 1,
-0.3640091, -1.157159, -3.8362, 0, 0, 0, 1, 1,
-0.3615206, -0.2869309, -1.672706, 0, 0, 0, 1, 1,
-0.3595529, 1.233408, 0.2521008, 0, 0, 0, 1, 1,
-0.3548028, 0.5553105, -0.6457326, 1, 1, 1, 1, 1,
-0.3544361, -0.8907146, -2.20158, 1, 1, 1, 1, 1,
-0.3536884, 0.2814664, -1.755249, 1, 1, 1, 1, 1,
-0.3533688, -0.4902789, -3.217602, 1, 1, 1, 1, 1,
-0.3514598, 2.375422, 0.6896958, 1, 1, 1, 1, 1,
-0.3467957, 1.092897, 0.4243754, 1, 1, 1, 1, 1,
-0.3462094, -0.07508381, -1.853514, 1, 1, 1, 1, 1,
-0.3422523, 1.385455, -1.748072, 1, 1, 1, 1, 1,
-0.3413493, 1.122748, -1.953697, 1, 1, 1, 1, 1,
-0.3411903, -1.497379, -3.497661, 1, 1, 1, 1, 1,
-0.3397273, 0.4382025, -1.743005, 1, 1, 1, 1, 1,
-0.3327527, 0.355015, -2.587231, 1, 1, 1, 1, 1,
-0.3324289, -0.2200946, -2.9758, 1, 1, 1, 1, 1,
-0.3306698, -0.373644, -3.275307, 1, 1, 1, 1, 1,
-0.322835, -1.954591, -1.37548, 1, 1, 1, 1, 1,
-0.321197, 1.521012, -0.2181894, 0, 0, 1, 1, 1,
-0.3194982, 0.8709919, -1.506406, 1, 0, 0, 1, 1,
-0.3170339, -0.2811931, -3.012019, 1, 0, 0, 1, 1,
-0.3168778, -0.5118334, -2.421588, 1, 0, 0, 1, 1,
-0.3147539, -1.364399, -1.87583, 1, 0, 0, 1, 1,
-0.3070891, 0.1724903, 1.079926, 1, 0, 0, 1, 1,
-0.3064592, 1.886759, -0.3987184, 0, 0, 0, 1, 1,
-0.3050791, 0.8498296, 1.051335, 0, 0, 0, 1, 1,
-0.2992609, -1.245906, -2.240443, 0, 0, 0, 1, 1,
-0.2897655, 0.5127469, 2.03943, 0, 0, 0, 1, 1,
-0.2893822, -1.087593, -2.968836, 0, 0, 0, 1, 1,
-0.2870449, 0.214208, 0.1058777, 0, 0, 0, 1, 1,
-0.2867575, 1.234509, 0.03750768, 0, 0, 0, 1, 1,
-0.2803837, -0.03405515, -2.326616, 1, 1, 1, 1, 1,
-0.2803612, 1.45576, 0.282867, 1, 1, 1, 1, 1,
-0.2786394, -1.379126, -4.610868, 1, 1, 1, 1, 1,
-0.2758394, -1.836453, -3.104442, 1, 1, 1, 1, 1,
-0.2747751, -2.25047, -2.827961, 1, 1, 1, 1, 1,
-0.2730868, 0.5194108, 0.3652228, 1, 1, 1, 1, 1,
-0.2719845, 0.2081411, -1.312285, 1, 1, 1, 1, 1,
-0.2715228, 0.8471611, 1.089554, 1, 1, 1, 1, 1,
-0.2693624, 0.9938529, 0.4749598, 1, 1, 1, 1, 1,
-0.2681512, -1.788465, -2.325445, 1, 1, 1, 1, 1,
-0.2631833, 0.8682894, 0.4302205, 1, 1, 1, 1, 1,
-0.2617811, 0.5802755, -1.480909, 1, 1, 1, 1, 1,
-0.2475414, -2.725144, -2.695541, 1, 1, 1, 1, 1,
-0.2474427, 1.354509, 1.245145, 1, 1, 1, 1, 1,
-0.2465452, 1.524105, 0.3044462, 1, 1, 1, 1, 1,
-0.2436212, 0.4865458, -0.4735116, 0, 0, 1, 1, 1,
-0.2435466, -3.076172, -3.324835, 1, 0, 0, 1, 1,
-0.2427827, 1.552098, 2.152034, 1, 0, 0, 1, 1,
-0.2401265, 1.413057, -1.229215, 1, 0, 0, 1, 1,
-0.2394523, 0.6075263, 0.1371087, 1, 0, 0, 1, 1,
-0.2363041, -1.881283, -4.614178, 1, 0, 0, 1, 1,
-0.2360204, 1.33058, -0.5266806, 0, 0, 0, 1, 1,
-0.2298423, -1.756507, -3.949855, 0, 0, 0, 1, 1,
-0.228541, 1.330564, 0.1222319, 0, 0, 0, 1, 1,
-0.2271087, 0.256663, 0.1644994, 0, 0, 0, 1, 1,
-0.2261476, 1.122094, 0.2337015, 0, 0, 0, 1, 1,
-0.2256671, 0.5041454, -1.56449, 0, 0, 0, 1, 1,
-0.2254999, 0.4813666, -1.389405, 0, 0, 0, 1, 1,
-0.2203761, -2.3215, -2.461709, 1, 1, 1, 1, 1,
-0.2148601, -0.257947, -1.747177, 1, 1, 1, 1, 1,
-0.214741, -0.7785766, -2.483115, 1, 1, 1, 1, 1,
-0.2061305, -0.2392425, -0.8779055, 1, 1, 1, 1, 1,
-0.2050635, 0.7261326, -0.4453328, 1, 1, 1, 1, 1,
-0.2019934, 0.8819678, -0.3951754, 1, 1, 1, 1, 1,
-0.2010006, 1.687333, 1.997248, 1, 1, 1, 1, 1,
-0.1957444, -0.9031471, -3.102673, 1, 1, 1, 1, 1,
-0.1942781, -0.4643794, -4.823882, 1, 1, 1, 1, 1,
-0.1899086, -2.173225, -2.808625, 1, 1, 1, 1, 1,
-0.1886563, 0.2067037, -1.14662, 1, 1, 1, 1, 1,
-0.1877538, -0.1370828, -2.265239, 1, 1, 1, 1, 1,
-0.1871409, 0.1829332, 1.044524, 1, 1, 1, 1, 1,
-0.1866657, 1.230126, 0.170272, 1, 1, 1, 1, 1,
-0.1865988, -0.04316732, -2.475836, 1, 1, 1, 1, 1,
-0.1834445, 2.073922, -1.428955, 0, 0, 1, 1, 1,
-0.1802226, -2.558782, -5.454659, 1, 0, 0, 1, 1,
-0.1795134, -0.2073759, -3.187463, 1, 0, 0, 1, 1,
-0.1773339, -0.8049573, -4.132401, 1, 0, 0, 1, 1,
-0.1764985, 2.068759, -0.911657, 1, 0, 0, 1, 1,
-0.1726931, -0.5129043, -1.563798, 1, 0, 0, 1, 1,
-0.1722734, 0.2845871, 1.121491, 0, 0, 0, 1, 1,
-0.169711, 0.220041, -0.1954827, 0, 0, 0, 1, 1,
-0.1616417, 0.1608835, -0.7917145, 0, 0, 0, 1, 1,
-0.1597538, -0.6456889, -1.179451, 0, 0, 0, 1, 1,
-0.159569, -0.8973127, -3.734363, 0, 0, 0, 1, 1,
-0.155644, 1.428984, -1.176027, 0, 0, 0, 1, 1,
-0.1519546, 0.1261371, -1.312555, 0, 0, 0, 1, 1,
-0.1515207, 0.0008944135, -0.739767, 1, 1, 1, 1, 1,
-0.1490989, 0.3472124, 1.408557, 1, 1, 1, 1, 1,
-0.1490484, 0.6639029, 0.9779285, 1, 1, 1, 1, 1,
-0.1487629, 0.8260778, 0.7908769, 1, 1, 1, 1, 1,
-0.1444159, 0.8430029, 0.9580415, 1, 1, 1, 1, 1,
-0.1438874, -0.2689858, -1.840853, 1, 1, 1, 1, 1,
-0.1432223, 0.4144728, -1.341688, 1, 1, 1, 1, 1,
-0.1395078, -1.852747, -0.9406314, 1, 1, 1, 1, 1,
-0.1394126, -0.1232187, -3.048524, 1, 1, 1, 1, 1,
-0.1384869, -0.612062, -2.448644, 1, 1, 1, 1, 1,
-0.1303705, 1.1788, 0.6108932, 1, 1, 1, 1, 1,
-0.1292166, 1.133178, 0.9900498, 1, 1, 1, 1, 1,
-0.1232879, 0.1399098, -1.727634, 1, 1, 1, 1, 1,
-0.1216615, -0.9356272, -2.576028, 1, 1, 1, 1, 1,
-0.118092, -0.839914, -3.352019, 1, 1, 1, 1, 1,
-0.1174448, 0.6935778, -2.830578, 0, 0, 1, 1, 1,
-0.11332, -1.78415, -2.518251, 1, 0, 0, 1, 1,
-0.1082403, 0.6389343, 1.394508, 1, 0, 0, 1, 1,
-0.1081473, 1.357544, -0.8784626, 1, 0, 0, 1, 1,
-0.1062887, 0.2379346, -0.8642204, 1, 0, 0, 1, 1,
-0.1047306, -0.600157, -2.978765, 1, 0, 0, 1, 1,
-0.1039649, -0.04176404, -1.107646, 0, 0, 0, 1, 1,
-0.102321, 0.1567082, -1.033104, 0, 0, 0, 1, 1,
-0.09800807, -0.4357045, -3.21379, 0, 0, 0, 1, 1,
-0.09768445, 1.581729, 0.08399668, 0, 0, 0, 1, 1,
-0.09631302, -0.04393859, -0.7657331, 0, 0, 0, 1, 1,
-0.09550491, 3.134553, -1.019458, 0, 0, 0, 1, 1,
-0.09379748, 0.05005335, -1.951262, 0, 0, 0, 1, 1,
-0.09227651, -1.776331, -3.190438, 1, 1, 1, 1, 1,
-0.09177813, 0.1938476, 0.1414571, 1, 1, 1, 1, 1,
-0.08529001, -2.046399, -3.511472, 1, 1, 1, 1, 1,
-0.08412898, -0.8327857, -3.687705, 1, 1, 1, 1, 1,
-0.07162918, 0.2399856, 1.439539, 1, 1, 1, 1, 1,
-0.071026, -0.7009693, -2.54245, 1, 1, 1, 1, 1,
-0.06936987, -0.002733289, -2.030357, 1, 1, 1, 1, 1,
-0.06201262, -0.7837757, -3.721944, 1, 1, 1, 1, 1,
-0.05682241, -0.5039229, -1.691574, 1, 1, 1, 1, 1,
-0.05502109, 0.4991632, -0.7810566, 1, 1, 1, 1, 1,
-0.05245643, -0.710048, -5.145302, 1, 1, 1, 1, 1,
-0.04936538, -0.04905941, -1.983042, 1, 1, 1, 1, 1,
-0.04146911, 0.4920675, 1.223294, 1, 1, 1, 1, 1,
-0.03987871, 1.491294, 0.9126559, 1, 1, 1, 1, 1,
-0.03939211, 0.3098732, -0.5845617, 1, 1, 1, 1, 1,
-0.03688307, -0.9020059, -4.189163, 0, 0, 1, 1, 1,
-0.03665989, -0.4016, -3.486957, 1, 0, 0, 1, 1,
-0.03457264, 1.204891, 0.8467326, 1, 0, 0, 1, 1,
-0.02818101, -0.6840247, -2.839291, 1, 0, 0, 1, 1,
-0.02662189, -0.9684747, -2.682384, 1, 0, 0, 1, 1,
-0.02580744, 0.9323833, 0.08483864, 1, 0, 0, 1, 1,
-0.02414326, 0.5652601, 0.341637, 0, 0, 0, 1, 1,
-0.01996308, 0.6356913, -0.2146118, 0, 0, 0, 1, 1,
-0.01881176, -1.261679, -3.099758, 0, 0, 0, 1, 1,
-0.01333697, 0.8154264, 0.3882519, 0, 0, 0, 1, 1,
-0.01014359, -0.990174, -2.608628, 0, 0, 0, 1, 1,
-0.007471998, -0.674467, -3.079655, 0, 0, 0, 1, 1,
-0.00740542, -0.3271953, 0.15507, 0, 0, 0, 1, 1,
-0.006237614, 1.285288, 0.7953169, 1, 1, 1, 1, 1,
-0.00466151, 1.390007, 0.9866912, 1, 1, 1, 1, 1,
-0.003671288, -0.02919217, -3.351319, 1, 1, 1, 1, 1,
-0.001745099, 0.2594567, 0.1966086, 1, 1, 1, 1, 1,
0.006118861, 1.381517, -0.2207563, 1, 1, 1, 1, 1,
0.007667674, -0.004340841, 2.933873, 1, 1, 1, 1, 1,
0.00854961, 0.06967406, -2.044772, 1, 1, 1, 1, 1,
0.01081948, -0.5825117, 3.541632, 1, 1, 1, 1, 1,
0.0124456, -0.8674724, 2.78085, 1, 1, 1, 1, 1,
0.01331143, -1.351847, 1.915803, 1, 1, 1, 1, 1,
0.01549236, -0.4897934, 2.651699, 1, 1, 1, 1, 1,
0.01645507, 0.628231, -0.09401838, 1, 1, 1, 1, 1,
0.02094828, -1.183153, 2.772959, 1, 1, 1, 1, 1,
0.02189368, -0.1236655, 3.503762, 1, 1, 1, 1, 1,
0.02705681, 0.6189096, -0.2680646, 1, 1, 1, 1, 1,
0.02980991, 0.8606564, -1.009401, 0, 0, 1, 1, 1,
0.03326067, -0.1777606, 4.108534, 1, 0, 0, 1, 1,
0.03473507, -0.1297811, 0.9144003, 1, 0, 0, 1, 1,
0.03574185, -0.8149579, 1.025599, 1, 0, 0, 1, 1,
0.03600389, -0.2208079, 4.040271, 1, 0, 0, 1, 1,
0.0373391, 0.1002208, -1.529194, 1, 0, 0, 1, 1,
0.0421262, 0.1099896, -0.2790897, 0, 0, 0, 1, 1,
0.04244415, -0.03734636, 1.725121, 0, 0, 0, 1, 1,
0.04778555, 0.3525474, 0.7436839, 0, 0, 0, 1, 1,
0.05002918, 2.047012, -0.5688369, 0, 0, 0, 1, 1,
0.05131762, -0.1448452, 2.298163, 0, 0, 0, 1, 1,
0.0541672, 0.3662374, 0.436101, 0, 0, 0, 1, 1,
0.05454452, -1.287653, 3.703703, 0, 0, 0, 1, 1,
0.05579336, 0.4191694, -1.133151, 1, 1, 1, 1, 1,
0.0565365, -1.390977, 6.081766, 1, 1, 1, 1, 1,
0.05867075, 0.4800274, -0.5882722, 1, 1, 1, 1, 1,
0.05886227, -0.1162934, 2.53584, 1, 1, 1, 1, 1,
0.05922675, -0.3143891, 2.858994, 1, 1, 1, 1, 1,
0.05959525, -0.5024428, 4.516171, 1, 1, 1, 1, 1,
0.06075602, 1.213647, -0.1628491, 1, 1, 1, 1, 1,
0.0607597, -1.407467, 3.072258, 1, 1, 1, 1, 1,
0.06287987, -0.7618214, 3.540059, 1, 1, 1, 1, 1,
0.06670327, -1.633406, 2.244907, 1, 1, 1, 1, 1,
0.06740601, -1.57873, 3.103022, 1, 1, 1, 1, 1,
0.0688183, -0.6575533, 2.246301, 1, 1, 1, 1, 1,
0.06971632, -0.6000425, 2.34307, 1, 1, 1, 1, 1,
0.07147288, 0.1927872, 1.122785, 1, 1, 1, 1, 1,
0.07475146, -0.7428161, 2.471412, 1, 1, 1, 1, 1,
0.09282953, -0.1775731, 3.11808, 0, 0, 1, 1, 1,
0.09406906, -0.3410665, 3.277189, 1, 0, 0, 1, 1,
0.09465452, 0.9858896, 1.178444, 1, 0, 0, 1, 1,
0.1129134, -0.5653003, 1.903819, 1, 0, 0, 1, 1,
0.1136128, -0.6795921, 3.507202, 1, 0, 0, 1, 1,
0.1176625, 0.09275059, 0.7073946, 1, 0, 0, 1, 1,
0.1189587, -1.478783, 3.792322, 0, 0, 0, 1, 1,
0.1212032, -0.4019457, 1.846079, 0, 0, 0, 1, 1,
0.1225515, 0.1459795, 2.205894, 0, 0, 0, 1, 1,
0.1251183, 1.772795, 0.465395, 0, 0, 0, 1, 1,
0.1320238, -1.110867, 2.001982, 0, 0, 0, 1, 1,
0.1351317, 0.07008046, 2.403499, 0, 0, 0, 1, 1,
0.1384708, 0.05504026, 0.2786878, 0, 0, 0, 1, 1,
0.151205, 1.678043, -0.8604416, 1, 1, 1, 1, 1,
0.1532934, -0.6290767, 4.212306, 1, 1, 1, 1, 1,
0.1562477, -1.253063, 2.633562, 1, 1, 1, 1, 1,
0.1573384, 0.7134473, -0.09992239, 1, 1, 1, 1, 1,
0.1576827, 0.8330069, 0.390152, 1, 1, 1, 1, 1,
0.1585348, 0.7279837, 1.565793, 1, 1, 1, 1, 1,
0.1632452, 0.8055906, 1.221332, 1, 1, 1, 1, 1,
0.1642763, 1.26865, 0.8340617, 1, 1, 1, 1, 1,
0.1676778, -2.901778, 3.292431, 1, 1, 1, 1, 1,
0.1686216, 0.5481777, -0.6434688, 1, 1, 1, 1, 1,
0.1703266, -1.109586, 0.9805434, 1, 1, 1, 1, 1,
0.1734251, 1.0922, 0.5004432, 1, 1, 1, 1, 1,
0.1734399, -0.9375741, 2.656799, 1, 1, 1, 1, 1,
0.1742098, -0.09027858, 0.4819149, 1, 1, 1, 1, 1,
0.1742406, -1.227786, 3.025318, 1, 1, 1, 1, 1,
0.1770683, -0.7907581, 2.371722, 0, 0, 1, 1, 1,
0.1827732, -1.088069, 1.575226, 1, 0, 0, 1, 1,
0.1832016, -0.5222574, 3.19154, 1, 0, 0, 1, 1,
0.1843711, -1.600561, 2.922839, 1, 0, 0, 1, 1,
0.1899747, -0.02322074, 0.840045, 1, 0, 0, 1, 1,
0.1920602, -0.7091351, 3.264445, 1, 0, 0, 1, 1,
0.1959878, -1.39589, 3.019547, 0, 0, 0, 1, 1,
0.1984778, 0.042821, 2.006213, 0, 0, 0, 1, 1,
0.1996513, -0.9502878, 3.215955, 0, 0, 0, 1, 1,
0.200899, 0.6952106, 0.3108601, 0, 0, 0, 1, 1,
0.204642, -0.8892078, 2.596118, 0, 0, 0, 1, 1,
0.2066866, -0.5158665, 2.8519, 0, 0, 0, 1, 1,
0.2068272, 0.8184941, -0.19879, 0, 0, 0, 1, 1,
0.2089219, 0.6012753, -0.4573912, 1, 1, 1, 1, 1,
0.2122316, 0.4083464, 2.46023, 1, 1, 1, 1, 1,
0.2130125, -0.04458683, 1.144117, 1, 1, 1, 1, 1,
0.2192981, 1.303313, 0.2535556, 1, 1, 1, 1, 1,
0.2202544, 0.2391529, 0.8214939, 1, 1, 1, 1, 1,
0.2206219, 0.282672, 0.8620524, 1, 1, 1, 1, 1,
0.224384, 1.20033, 1.255126, 1, 1, 1, 1, 1,
0.228187, 0.02973208, 1.388694, 1, 1, 1, 1, 1,
0.2285025, 0.731272, -0.2403841, 1, 1, 1, 1, 1,
0.2288569, -0.7143781, 1.972023, 1, 1, 1, 1, 1,
0.2292617, 0.6271534, -0.6147873, 1, 1, 1, 1, 1,
0.231697, -0.7517933, 2.127217, 1, 1, 1, 1, 1,
0.2320156, 0.7499238, -0.7569047, 1, 1, 1, 1, 1,
0.2331721, 0.8403856, 0.1665853, 1, 1, 1, 1, 1,
0.2354423, -1.185764, 3.278575, 1, 1, 1, 1, 1,
0.2368633, 0.4507682, 0.5044618, 0, 0, 1, 1, 1,
0.2385252, -0.4211228, 4.075907, 1, 0, 0, 1, 1,
0.2423272, -1.577725, 4.292641, 1, 0, 0, 1, 1,
0.242573, -0.1427163, 1.128624, 1, 0, 0, 1, 1,
0.2470304, 1.317074, -1.248011, 1, 0, 0, 1, 1,
0.2535443, -0.442442, 3.123616, 1, 0, 0, 1, 1,
0.2556629, -0.1854361, 2.37218, 0, 0, 0, 1, 1,
0.2583783, 0.9419264, 0.08528906, 0, 0, 0, 1, 1,
0.2587462, -0.33976, 2.19691, 0, 0, 0, 1, 1,
0.2590306, -0.8513615, 3.64098, 0, 0, 0, 1, 1,
0.2639669, 0.1703559, 2.20479, 0, 0, 0, 1, 1,
0.2640875, 0.5299847, 0.5205929, 0, 0, 0, 1, 1,
0.267563, -1.126634, 4.00197, 0, 0, 0, 1, 1,
0.2678488, -1.187991, 2.637339, 1, 1, 1, 1, 1,
0.2679659, 0.2216512, -0.2589321, 1, 1, 1, 1, 1,
0.268175, -0.9962229, 2.055243, 1, 1, 1, 1, 1,
0.2687696, -0.1785347, 3.30252, 1, 1, 1, 1, 1,
0.2734596, 0.5279359, -0.5282992, 1, 1, 1, 1, 1,
0.2754073, -1.548007, 2.216589, 1, 1, 1, 1, 1,
0.2796151, 0.3250302, 0.7008342, 1, 1, 1, 1, 1,
0.2813589, 0.07110686, 2.263893, 1, 1, 1, 1, 1,
0.2827508, -0.459178, 1.870583, 1, 1, 1, 1, 1,
0.2836631, 0.1150783, 1.52662, 1, 1, 1, 1, 1,
0.2862427, -0.9535606, 4.670768, 1, 1, 1, 1, 1,
0.2868488, 2.237477, 1.406598, 1, 1, 1, 1, 1,
0.2883813, 1.072951, 0.003848345, 1, 1, 1, 1, 1,
0.293447, -1.075547, 3.810968, 1, 1, 1, 1, 1,
0.2937642, 0.5544599, 0.5106219, 1, 1, 1, 1, 1,
0.2949837, 0.4396624, 1.503432, 0, 0, 1, 1, 1,
0.2974308, -1.269893, 3.491932, 1, 0, 0, 1, 1,
0.2990091, 0.04174406, 1.830737, 1, 0, 0, 1, 1,
0.3011981, 0.3108118, -0.9011122, 1, 0, 0, 1, 1,
0.3038366, 0.3924013, -0.5793976, 1, 0, 0, 1, 1,
0.3074884, 0.1411538, 3.506455, 1, 0, 0, 1, 1,
0.3078042, -0.4720796, 1.658236, 0, 0, 0, 1, 1,
0.3105888, -1.470425, 5.413472, 0, 0, 0, 1, 1,
0.3119455, 2.8387, -0.4083267, 0, 0, 0, 1, 1,
0.3132527, -0.2035495, 0.7237532, 0, 0, 0, 1, 1,
0.3199566, -1.601417, 3.124063, 0, 0, 0, 1, 1,
0.3202588, 0.6518924, 0.8484343, 0, 0, 0, 1, 1,
0.3267384, -0.9533553, 2.88504, 0, 0, 0, 1, 1,
0.3282484, 0.9601038, -0.1475631, 1, 1, 1, 1, 1,
0.3300039, -1.430719, 3.952513, 1, 1, 1, 1, 1,
0.3323998, -0.1069742, 0.5505673, 1, 1, 1, 1, 1,
0.3331396, 0.03685344, 0.2190064, 1, 1, 1, 1, 1,
0.3388163, 0.3829569, -0.2175456, 1, 1, 1, 1, 1,
0.3412137, -0.1904722, 2.161742, 1, 1, 1, 1, 1,
0.3440429, -0.367152, 2.517186, 1, 1, 1, 1, 1,
0.3445339, -1.580158, 2.313215, 1, 1, 1, 1, 1,
0.3503759, -0.2053973, -0.1787703, 1, 1, 1, 1, 1,
0.3503781, -0.01236576, 1.73632, 1, 1, 1, 1, 1,
0.3527698, -0.4502916, 2.157007, 1, 1, 1, 1, 1,
0.3549444, -0.6378032, 2.017388, 1, 1, 1, 1, 1,
0.3587565, -0.2253647, 2.923966, 1, 1, 1, 1, 1,
0.3597694, -1.644553, 2.382236, 1, 1, 1, 1, 1,
0.3600628, 0.6309315, 0.07895799, 1, 1, 1, 1, 1,
0.3607929, -0.4218758, 2.054733, 0, 0, 1, 1, 1,
0.3608876, -1.169421, 2.26026, 1, 0, 0, 1, 1,
0.361603, 0.5234368, 0.8421726, 1, 0, 0, 1, 1,
0.3633149, -0.816763, 1.558786, 1, 0, 0, 1, 1,
0.3650892, -1.5186, 3.762973, 1, 0, 0, 1, 1,
0.3723843, -0.2240043, 2.738148, 1, 0, 0, 1, 1,
0.3723857, 1.047071, 0.1950462, 0, 0, 0, 1, 1,
0.3761534, -0.1297033, 2.448885, 0, 0, 0, 1, 1,
0.3801925, 0.1867338, 3.235685, 0, 0, 0, 1, 1,
0.3804589, -0.477337, 3.093764, 0, 0, 0, 1, 1,
0.3823059, -2.387503, 3.14898, 0, 0, 0, 1, 1,
0.3843029, 0.06598009, 0.07460213, 0, 0, 0, 1, 1,
0.3886373, 0.972059, 1.420963, 0, 0, 0, 1, 1,
0.3896671, -1.621414, 3.971343, 1, 1, 1, 1, 1,
0.3903837, 1.296459, 0.7449171, 1, 1, 1, 1, 1,
0.3910416, -1.824469, 2.807183, 1, 1, 1, 1, 1,
0.4013037, -0.4701613, 2.118454, 1, 1, 1, 1, 1,
0.4089189, -1.138979, 1.938315, 1, 1, 1, 1, 1,
0.4183621, -0.2686874, 2.813199, 1, 1, 1, 1, 1,
0.4185441, -0.01956785, 1.576599, 1, 1, 1, 1, 1,
0.4198593, -0.7241028, 2.613609, 1, 1, 1, 1, 1,
0.4217911, -0.7563433, 2.768108, 1, 1, 1, 1, 1,
0.4226736, 0.06647703, 2.145808, 1, 1, 1, 1, 1,
0.4247604, -1.234472, 2.369897, 1, 1, 1, 1, 1,
0.4255523, 0.02201258, 3.384907, 1, 1, 1, 1, 1,
0.4256278, -1.220086, 1.588764, 1, 1, 1, 1, 1,
0.4271747, -0.8941181, 2.51864, 1, 1, 1, 1, 1,
0.4289085, -0.6791638, 3.16015, 1, 1, 1, 1, 1,
0.4314041, -0.01318126, 0.7020731, 0, 0, 1, 1, 1,
0.4321832, 0.2301154, 0.3148122, 1, 0, 0, 1, 1,
0.438892, 0.4182643, 0.8152903, 1, 0, 0, 1, 1,
0.4418549, 0.4583944, 0.2684272, 1, 0, 0, 1, 1,
0.4421468, 0.9864568, 0.1981393, 1, 0, 0, 1, 1,
0.4457913, -1.059466, 2.278195, 1, 0, 0, 1, 1,
0.4460854, -0.4565261, 2.477898, 0, 0, 0, 1, 1,
0.4534121, 0.4541135, 0.391346, 0, 0, 0, 1, 1,
0.4535612, 0.8730087, 0.8120683, 0, 0, 0, 1, 1,
0.4548101, -0.3946462, 0.1660879, 0, 0, 0, 1, 1,
0.4564786, -0.7879599, 2.549832, 0, 0, 0, 1, 1,
0.4569147, 0.4816287, 1.489868, 0, 0, 0, 1, 1,
0.4573867, 0.05643332, -0.5582914, 0, 0, 0, 1, 1,
0.4575661, -0.7542453, 1.334462, 1, 1, 1, 1, 1,
0.4583503, -0.3838181, 3.124445, 1, 1, 1, 1, 1,
0.4592825, -0.5832707, 4.040765, 1, 1, 1, 1, 1,
0.4621776, -1.226001, 3.980704, 1, 1, 1, 1, 1,
0.4658149, -1.743586, 3.009466, 1, 1, 1, 1, 1,
0.4659424, 0.9407572, -0.2688584, 1, 1, 1, 1, 1,
0.4661948, -0.2714282, 0.7029817, 1, 1, 1, 1, 1,
0.4675557, -1.227223, 1.968221, 1, 1, 1, 1, 1,
0.4677663, -0.5164199, 2.924904, 1, 1, 1, 1, 1,
0.4691532, 1.284584, -0.4233539, 1, 1, 1, 1, 1,
0.4704335, 0.3968318, 0.6312698, 1, 1, 1, 1, 1,
0.4733385, 1.10818, 1.637034, 1, 1, 1, 1, 1,
0.4762656, 1.589984, -0.1669928, 1, 1, 1, 1, 1,
0.477076, -1.483248, 1.793761, 1, 1, 1, 1, 1,
0.4785334, 0.6203464, 1.908518, 1, 1, 1, 1, 1,
0.4793352, -1.646377, 1.103103, 0, 0, 1, 1, 1,
0.4804415, -0.3602602, 0.8435089, 1, 0, 0, 1, 1,
0.4804428, -0.6716024, 3.051023, 1, 0, 0, 1, 1,
0.4862287, 0.1787352, 1.99375, 1, 0, 0, 1, 1,
0.4886052, -0.9519124, 1.814535, 1, 0, 0, 1, 1,
0.4887437, 0.5117015, 0.3116234, 1, 0, 0, 1, 1,
0.4926118, -1.609922, 1.470224, 0, 0, 0, 1, 1,
0.4926324, 0.7042925, 1.008574, 0, 0, 0, 1, 1,
0.4955859, 0.4411151, 0.9981315, 0, 0, 0, 1, 1,
0.4975771, -1.615187, 1.457522, 0, 0, 0, 1, 1,
0.4983711, 0.3873429, 0.2755969, 0, 0, 0, 1, 1,
0.5025525, 0.5005013, -0.6382501, 0, 0, 0, 1, 1,
0.5042755, 0.4315866, -0.8094496, 0, 0, 0, 1, 1,
0.5074965, -0.2760343, 2.898727, 1, 1, 1, 1, 1,
0.5079868, 0.7755705, -0.1759916, 1, 1, 1, 1, 1,
0.5084765, 1.261021, 1.028134, 1, 1, 1, 1, 1,
0.516824, -1.834441, 3.547878, 1, 1, 1, 1, 1,
0.5225762, 0.323837, 1.633983, 1, 1, 1, 1, 1,
0.5252411, -0.7001663, 3.343203, 1, 1, 1, 1, 1,
0.5285174, 1.060688, 1.70763, 1, 1, 1, 1, 1,
0.5309922, -0.4640298, 1.027781, 1, 1, 1, 1, 1,
0.5337408, -0.1599033, 0.9220152, 1, 1, 1, 1, 1,
0.5340943, 1.095429, 0.3422821, 1, 1, 1, 1, 1,
0.5387333, 0.4173997, 1.847069, 1, 1, 1, 1, 1,
0.5485919, 0.1749574, 1.255657, 1, 1, 1, 1, 1,
0.5493762, 0.275778, 2.097469, 1, 1, 1, 1, 1,
0.5524462, 0.4905318, 0.7210336, 1, 1, 1, 1, 1,
0.5529853, -0.2149991, 1.26055, 1, 1, 1, 1, 1,
0.5556256, -0.1262317, 2.687794, 0, 0, 1, 1, 1,
0.5574934, 1.076195, 0.05837475, 1, 0, 0, 1, 1,
0.5576268, 0.3621234, 1.611424, 1, 0, 0, 1, 1,
0.5592535, 0.7393414, -0.7031161, 1, 0, 0, 1, 1,
0.5680891, -1.199576, 2.828927, 1, 0, 0, 1, 1,
0.5699706, 0.2220527, 0.7394435, 1, 0, 0, 1, 1,
0.5728906, 1.403342, 0.5767289, 0, 0, 0, 1, 1,
0.5792309, -0.2592143, 1.122042, 0, 0, 0, 1, 1,
0.5811787, -0.5963198, 2.414893, 0, 0, 0, 1, 1,
0.5817581, -0.1955286, 2.490252, 0, 0, 0, 1, 1,
0.5876521, 0.002379022, 1.14421, 0, 0, 0, 1, 1,
0.5877321, 1.064028, 0.08361365, 0, 0, 0, 1, 1,
0.5900112, -0.5255475, 0.586613, 0, 0, 0, 1, 1,
0.593163, -1.766712, 2.532513, 1, 1, 1, 1, 1,
0.5953317, 0.392121, 0.5253475, 1, 1, 1, 1, 1,
0.5984524, 0.2639371, 2.458178, 1, 1, 1, 1, 1,
0.6035907, 1.711773, -1.838781, 1, 1, 1, 1, 1,
0.6118009, -0.7832532, 0.9584565, 1, 1, 1, 1, 1,
0.612016, -0.241831, -0.1803384, 1, 1, 1, 1, 1,
0.6124433, -0.5463139, 2.117681, 1, 1, 1, 1, 1,
0.613491, 1.924196, -0.3565117, 1, 1, 1, 1, 1,
0.614057, -0.8007403, 3.248966, 1, 1, 1, 1, 1,
0.6145477, -0.1621508, 0.8593726, 1, 1, 1, 1, 1,
0.6198443, 0.3920735, 1.719385, 1, 1, 1, 1, 1,
0.6204759, -0.786557, 2.794811, 1, 1, 1, 1, 1,
0.6211503, 0.2017251, 2.147898, 1, 1, 1, 1, 1,
0.6212706, -0.3033698, 0.508283, 1, 1, 1, 1, 1,
0.6251692, 0.8325159, 1.562727, 1, 1, 1, 1, 1,
0.6262448, 0.1697227, 2.641789, 0, 0, 1, 1, 1,
0.6266056, -0.1001336, 2.648084, 1, 0, 0, 1, 1,
0.6275465, 0.2113633, -0.150979, 1, 0, 0, 1, 1,
0.6302578, 0.0028762, 2.011792, 1, 0, 0, 1, 1,
0.6406516, -1.248055, 2.552985, 1, 0, 0, 1, 1,
0.6411464, 1.122234, 0.3231033, 1, 0, 0, 1, 1,
0.6417297, -0.2283865, 0.6166179, 0, 0, 0, 1, 1,
0.6446736, -0.2824313, 0.01155803, 0, 0, 0, 1, 1,
0.6534854, 0.05124846, 1.658844, 0, 0, 0, 1, 1,
0.6587562, 0.2628102, -0.2179068, 0, 0, 0, 1, 1,
0.6638528, -1.481194, 1.302236, 0, 0, 0, 1, 1,
0.6736332, 1.538758, 1.43579, 0, 0, 0, 1, 1,
0.6837896, -1.11348, 3.105732, 0, 0, 0, 1, 1,
0.6849063, 1.659952, 1.015469, 1, 1, 1, 1, 1,
0.6880691, -0.5352834, 1.262738, 1, 1, 1, 1, 1,
0.6989591, -0.94685, 2.105334, 1, 1, 1, 1, 1,
0.6993689, -0.6168255, 2.838648, 1, 1, 1, 1, 1,
0.7011058, 1.092969, 3.048818, 1, 1, 1, 1, 1,
0.7018378, 1.474578, 0.8673071, 1, 1, 1, 1, 1,
0.703994, -0.3488549, 0.06212111, 1, 1, 1, 1, 1,
0.7202323, -0.4798194, 1.989975, 1, 1, 1, 1, 1,
0.7209437, 0.6703144, -1.091327, 1, 1, 1, 1, 1,
0.7221607, -1.500751, 2.614164, 1, 1, 1, 1, 1,
0.7234805, 0.764702, 1.362752, 1, 1, 1, 1, 1,
0.7251924, 1.6858, -0.4025552, 1, 1, 1, 1, 1,
0.7292013, -0.05442175, 1.33764, 1, 1, 1, 1, 1,
0.7302867, -0.2807168, 2.513066, 1, 1, 1, 1, 1,
0.7331823, 0.2527708, 1.551702, 1, 1, 1, 1, 1,
0.7341995, 0.02155342, 1.72057, 0, 0, 1, 1, 1,
0.7410248, 0.2364838, 0.8367742, 1, 0, 0, 1, 1,
0.7434191, 0.5108543, 0.7455455, 1, 0, 0, 1, 1,
0.7459167, -0.4048712, 1.439634, 1, 0, 0, 1, 1,
0.7462587, -0.2106795, 1.252813, 1, 0, 0, 1, 1,
0.7509109, 0.3634661, 2.070213, 1, 0, 0, 1, 1,
0.756003, -3.119227, 2.040055, 0, 0, 0, 1, 1,
0.7569064, 0.1083557, 0.8590736, 0, 0, 0, 1, 1,
0.7585114, 1.165261, 0.0196981, 0, 0, 0, 1, 1,
0.7655802, 0.1728852, 0.1935429, 0, 0, 0, 1, 1,
0.7686424, -0.1320403, 2.303684, 0, 0, 0, 1, 1,
0.7770923, -0.1761321, 3.020658, 0, 0, 0, 1, 1,
0.7834848, -2.029182, 2.941128, 0, 0, 0, 1, 1,
0.7835902, -0.8026461, 3.509264, 1, 1, 1, 1, 1,
0.7848663, -0.9563804, 2.124058, 1, 1, 1, 1, 1,
0.7901911, 0.5222802, 2.463491, 1, 1, 1, 1, 1,
0.8048178, 1.177053, 1.011207, 1, 1, 1, 1, 1,
0.8099899, -1.02611, 1.447213, 1, 1, 1, 1, 1,
0.811817, 1.145816, 0.2465061, 1, 1, 1, 1, 1,
0.8134131, 1.115889, -1.844981, 1, 1, 1, 1, 1,
0.8143923, 1.019832, 1.330233, 1, 1, 1, 1, 1,
0.8193061, -0.650921, 1.90165, 1, 1, 1, 1, 1,
0.8195899, -1.157428, 2.038615, 1, 1, 1, 1, 1,
0.8223176, 1.497302, 0.9570355, 1, 1, 1, 1, 1,
0.8234893, 0.7278275, 0.4684656, 1, 1, 1, 1, 1,
0.8245255, -0.9930053, 2.200715, 1, 1, 1, 1, 1,
0.8313965, 1.569173, 0.9813148, 1, 1, 1, 1, 1,
0.8342746, -0.8462058, 2.635258, 1, 1, 1, 1, 1,
0.8447009, 0.8308813, -1.40679, 0, 0, 1, 1, 1,
0.8478262, -0.5114259, 2.562152, 1, 0, 0, 1, 1,
0.8490413, 0.8108388, 1.019382, 1, 0, 0, 1, 1,
0.8495862, -1.297588, 2.190859, 1, 0, 0, 1, 1,
0.8498309, 0.5671905, 1.760438, 1, 0, 0, 1, 1,
0.8599783, -1.721519, 1.980644, 1, 0, 0, 1, 1,
0.8632303, 0.6375532, -2.02817, 0, 0, 0, 1, 1,
0.8650017, -0.9527602, 1.832926, 0, 0, 0, 1, 1,
0.8819872, 0.3757121, -0.5371493, 0, 0, 0, 1, 1,
0.8861481, 0.3511862, 1.803313, 0, 0, 0, 1, 1,
0.8921595, 0.7279644, 1.160032, 0, 0, 0, 1, 1,
0.8979291, -0.4771919, 1.155012, 0, 0, 0, 1, 1,
0.8985702, 0.6729069, 0.7698435, 0, 0, 0, 1, 1,
0.8996931, -0.2612043, 2.465894, 1, 1, 1, 1, 1,
0.9079505, 2.078558, 0.950262, 1, 1, 1, 1, 1,
0.9095067, -0.4928328, 2.371065, 1, 1, 1, 1, 1,
0.9107469, -1.118015, 2.997531, 1, 1, 1, 1, 1,
0.9117785, -0.8966295, 3.697919, 1, 1, 1, 1, 1,
0.9140161, -0.6445298, 1.4077, 1, 1, 1, 1, 1,
0.9143509, -0.6331659, 1.968856, 1, 1, 1, 1, 1,
0.916025, -0.4274635, 4.156356, 1, 1, 1, 1, 1,
0.9183833, -0.1044081, 2.184131, 1, 1, 1, 1, 1,
0.9233291, -0.4366129, -0.002991987, 1, 1, 1, 1, 1,
0.9235381, 0.5419928, 0.5964569, 1, 1, 1, 1, 1,
0.9256623, 0.4233808, 0.9487723, 1, 1, 1, 1, 1,
0.926476, 0.3568838, 2.179003, 1, 1, 1, 1, 1,
0.9272454, 0.4539868, 0.362336, 1, 1, 1, 1, 1,
0.9365242, 0.6978296, -0.03518353, 1, 1, 1, 1, 1,
0.9526761, 2.593836, -0.8802777, 0, 0, 1, 1, 1,
0.9600004, -0.3838855, -0.9382567, 1, 0, 0, 1, 1,
0.963524, 2.130581, -1.487891, 1, 0, 0, 1, 1,
0.9641987, -0.5193332, 2.52185, 1, 0, 0, 1, 1,
0.9669569, 0.5353301, 1.575042, 1, 0, 0, 1, 1,
0.9678887, -2.170951, 2.12753, 1, 0, 0, 1, 1,
0.97356, -0.5133142, 0.5152153, 0, 0, 0, 1, 1,
0.9842514, -0.3387619, 0.8802643, 0, 0, 0, 1, 1,
0.9853566, 0.6198013, 0.3391536, 0, 0, 0, 1, 1,
0.985725, -0.7610107, 2.400379, 0, 0, 0, 1, 1,
0.993524, -0.2903496, 0.7839242, 0, 0, 0, 1, 1,
0.9984536, 0.1256756, 0.2320293, 0, 0, 0, 1, 1,
1.000396, -0.3229815, 0.7764181, 0, 0, 0, 1, 1,
1.000548, -1.963747, 4.130448, 1, 1, 1, 1, 1,
1.000577, -3.10614, 2.404259, 1, 1, 1, 1, 1,
1.010852, 0.5061045, 0.4744745, 1, 1, 1, 1, 1,
1.011812, 0.3222121, 2.37544, 1, 1, 1, 1, 1,
1.012369, 0.2881602, 1.90768, 1, 1, 1, 1, 1,
1.025702, 1.137671, -0.6081445, 1, 1, 1, 1, 1,
1.028299, -0.6738615, 2.27799, 1, 1, 1, 1, 1,
1.030668, 0.1488407, 1.886117, 1, 1, 1, 1, 1,
1.030929, 0.7421741, 1.01607, 1, 1, 1, 1, 1,
1.033117, 1.606908, 0.9245239, 1, 1, 1, 1, 1,
1.03326, -1.410331, 1.317222, 1, 1, 1, 1, 1,
1.03665, -0.7579939, 2.65156, 1, 1, 1, 1, 1,
1.038951, 1.406775, 0.5006216, 1, 1, 1, 1, 1,
1.041853, 0.8038416, 1.055922, 1, 1, 1, 1, 1,
1.046852, -0.1227537, 2.038098, 1, 1, 1, 1, 1,
1.055057, -0.7762171, 0.4512888, 0, 0, 1, 1, 1,
1.056812, -2.362674, 2.933472, 1, 0, 0, 1, 1,
1.059291, 0.4152862, 1.455293, 1, 0, 0, 1, 1,
1.061872, -0.8981736, 2.117968, 1, 0, 0, 1, 1,
1.062517, -0.3898817, 1.761339, 1, 0, 0, 1, 1,
1.066515, -0.4139016, 2.476092, 1, 0, 0, 1, 1,
1.067248, -0.8445606, 4.089222, 0, 0, 0, 1, 1,
1.073523, 0.9484103, 1.408145, 0, 0, 0, 1, 1,
1.078314, -0.6523806, 3.898231, 0, 0, 0, 1, 1,
1.08456, -0.989086, -0.1847988, 0, 0, 0, 1, 1,
1.089786, 0.3115658, 0.2147672, 0, 0, 0, 1, 1,
1.09295, -1.008255, 1.855014, 0, 0, 0, 1, 1,
1.093014, -1.564241, 1.573513, 0, 0, 0, 1, 1,
1.096267, 0.4393213, 1.008746, 1, 1, 1, 1, 1,
1.099669, 2.003088, 0.8955858, 1, 1, 1, 1, 1,
1.099946, -0.3454491, 1.746579, 1, 1, 1, 1, 1,
1.106476, -0.4724068, 3.306007, 1, 1, 1, 1, 1,
1.130863, -2.341394, 2.515628, 1, 1, 1, 1, 1,
1.13731, 0.7363585, 3.112631, 1, 1, 1, 1, 1,
1.139899, -1.173336, 0.590782, 1, 1, 1, 1, 1,
1.14635, -1.616397, 1.930794, 1, 1, 1, 1, 1,
1.150555, -1.149769, 2.087779, 1, 1, 1, 1, 1,
1.152448, -0.7442052, 2.710209, 1, 1, 1, 1, 1,
1.152699, 0.2532513, 2.294265, 1, 1, 1, 1, 1,
1.15795, 2.103857, 0.3094906, 1, 1, 1, 1, 1,
1.16112, 0.1821976, 0.5552821, 1, 1, 1, 1, 1,
1.164918, -0.5162674, 2.859017, 1, 1, 1, 1, 1,
1.174676, 2.215541, 1.674555, 1, 1, 1, 1, 1,
1.189415, -0.1523633, 1.665255, 0, 0, 1, 1, 1,
1.192982, -1.294806, 2.054037, 1, 0, 0, 1, 1,
1.197461, -1.340932, 2.174657, 1, 0, 0, 1, 1,
1.198206, 0.05167882, 2.398714, 1, 0, 0, 1, 1,
1.198271, -0.7409015, 2.756404, 1, 0, 0, 1, 1,
1.207545, 1.587454, 0.5326269, 1, 0, 0, 1, 1,
1.212428, -0.3559259, 2.571718, 0, 0, 0, 1, 1,
1.215891, -0.05757992, 1.790326, 0, 0, 0, 1, 1,
1.225052, -0.9979069, 1.32879, 0, 0, 0, 1, 1,
1.228453, 0.7990474, 2.664527, 0, 0, 0, 1, 1,
1.228551, -0.9057468, 1.894042, 0, 0, 0, 1, 1,
1.229149, -0.6145942, 1.189202, 0, 0, 0, 1, 1,
1.229449, -0.401918, 1.252856, 0, 0, 0, 1, 1,
1.229967, -2.19927, 2.781965, 1, 1, 1, 1, 1,
1.244405, -0.9344836, 2.800243, 1, 1, 1, 1, 1,
1.253861, -0.3101077, 2.491955, 1, 1, 1, 1, 1,
1.260169, 0.4706999, 2.321966, 1, 1, 1, 1, 1,
1.262331, 0.9481321, 2.225861, 1, 1, 1, 1, 1,
1.278521, -1.340613, 1.039508, 1, 1, 1, 1, 1,
1.28468, -0.1914858, 4.362495, 1, 1, 1, 1, 1,
1.287029, 0.2361803, 1.642166, 1, 1, 1, 1, 1,
1.290721, 1.765315, 1.313819, 1, 1, 1, 1, 1,
1.299051, 0.5186384, 1.693702, 1, 1, 1, 1, 1,
1.30597, 0.09094586, 2.15837, 1, 1, 1, 1, 1,
1.316275, 0.7600092, 0.7054365, 1, 1, 1, 1, 1,
1.317484, -0.03667616, 1.489947, 1, 1, 1, 1, 1,
1.344972, 1.130856, 1.376597, 1, 1, 1, 1, 1,
1.345928, -1.706319, 4.387988, 1, 1, 1, 1, 1,
1.365399, -1.02793, 1.323361, 0, 0, 1, 1, 1,
1.366311, 0.9050445, 2.043586, 1, 0, 0, 1, 1,
1.368418, 0.8303261, 2.232221, 1, 0, 0, 1, 1,
1.37718, -0.8883077, 2.198021, 1, 0, 0, 1, 1,
1.386301, -1.120133, 2.767602, 1, 0, 0, 1, 1,
1.419127, -0.8091473, 0.9442177, 1, 0, 0, 1, 1,
1.428381, -0.5323186, 2.535985, 0, 0, 0, 1, 1,
1.431629, -0.1642387, 1.25232, 0, 0, 0, 1, 1,
1.443519, -1.827216, 2.346176, 0, 0, 0, 1, 1,
1.444249, -0.1875921, 1.358927, 0, 0, 0, 1, 1,
1.454129, -0.1838979, 2.40017, 0, 0, 0, 1, 1,
1.459845, 1.017366, 0.8239524, 0, 0, 0, 1, 1,
1.466935, -0.2784125, 2.679824, 0, 0, 0, 1, 1,
1.480785, -0.5449151, -0.04444762, 1, 1, 1, 1, 1,
1.49452, -0.7081873, 1.231293, 1, 1, 1, 1, 1,
1.494897, 0.8421203, 2.264093, 1, 1, 1, 1, 1,
1.514359, -0.5735934, 1.559097, 1, 1, 1, 1, 1,
1.517394, -0.7924564, 4.113327, 1, 1, 1, 1, 1,
1.531273, -0.1346235, 2.67592, 1, 1, 1, 1, 1,
1.551027, -0.6307938, 2.241499, 1, 1, 1, 1, 1,
1.561544, -0.418987, 0.1768393, 1, 1, 1, 1, 1,
1.569421, -0.8979892, 0.2684585, 1, 1, 1, 1, 1,
1.573284, -0.4395574, 1.325978, 1, 1, 1, 1, 1,
1.61849, -0.1966261, 0.7197049, 1, 1, 1, 1, 1,
1.633025, 0.1540652, 2.594581, 1, 1, 1, 1, 1,
1.653299, 0.9603001, 1.896349, 1, 1, 1, 1, 1,
1.677141, 0.6857924, 1.364979, 1, 1, 1, 1, 1,
1.678165, 0.05969658, 1.016709, 1, 1, 1, 1, 1,
1.698797, 3.56564, 1.130579, 0, 0, 1, 1, 1,
1.713759, 0.4849465, 1.241065, 1, 0, 0, 1, 1,
1.72108, -0.8514068, 1.85522, 1, 0, 0, 1, 1,
1.724, -0.7783941, 4.704541, 1, 0, 0, 1, 1,
1.738857, 0.3662413, 2.82648, 1, 0, 0, 1, 1,
1.766599, -0.1494839, 2.430379, 1, 0, 0, 1, 1,
1.770855, 0.3510495, 1.168273, 0, 0, 0, 1, 1,
1.77509, -0.3560907, -0.2814606, 0, 0, 0, 1, 1,
1.802305, 1.357673, -0.4992367, 0, 0, 0, 1, 1,
1.820933, -0.4413933, 0.2662669, 0, 0, 0, 1, 1,
1.828574, 0.4421334, 1.17486, 0, 0, 0, 1, 1,
1.84189, 1.044719, 1.233436, 0, 0, 0, 1, 1,
1.842911, 0.5019768, 0.2365686, 0, 0, 0, 1, 1,
1.890063, -0.6765174, 4.510236, 1, 1, 1, 1, 1,
1.894645, 1.873301, 0.5048063, 1, 1, 1, 1, 1,
1.89868, -0.6936832, 1.171272, 1, 1, 1, 1, 1,
1.910014, -1.279269, 3.621993, 1, 1, 1, 1, 1,
1.911922, -0.6822566, 1.692494, 1, 1, 1, 1, 1,
1.957454, -0.8814849, 1.319139, 1, 1, 1, 1, 1,
1.985374, -0.2247289, 0.6611692, 1, 1, 1, 1, 1,
1.988861, 1.41349, 2.147141, 1, 1, 1, 1, 1,
1.991571, -0.6342769, 3.634943, 1, 1, 1, 1, 1,
2.006636, -1.108645, 2.166857, 1, 1, 1, 1, 1,
2.010107, -1.080246, 2.576992, 1, 1, 1, 1, 1,
2.024736, 1.07839, 0.8334949, 1, 1, 1, 1, 1,
2.084332, 0.8184876, 0.7687081, 1, 1, 1, 1, 1,
2.085881, 1.613625, 0.5418195, 1, 1, 1, 1, 1,
2.08936, 0.3170642, 3.248001, 1, 1, 1, 1, 1,
2.095611, -1.288646, 2.826401, 0, 0, 1, 1, 1,
2.186564, -2.5044, 2.88633, 1, 0, 0, 1, 1,
2.202052, -0.6271451, 1.103049, 1, 0, 0, 1, 1,
2.207772, -0.2742082, 2.548479, 1, 0, 0, 1, 1,
2.249344, -0.3967756, 1.430288, 1, 0, 0, 1, 1,
2.253569, -0.8703277, 2.012486, 1, 0, 0, 1, 1,
2.268277, 1.60612, 0.361343, 0, 0, 0, 1, 1,
2.28095, -0.6451287, 0.982969, 0, 0, 0, 1, 1,
2.351952, -0.04826849, 1.822468, 0, 0, 0, 1, 1,
2.404866, 0.004984902, 1.704228, 0, 0, 0, 1, 1,
2.414056, -0.4975949, 3.003136, 0, 0, 0, 1, 1,
2.463782, 0.1882233, 0.1737957, 0, 0, 0, 1, 1,
2.523573, 0.1344172, -0.07477825, 0, 0, 0, 1, 1,
2.543172, 0.6165541, 0.2728124, 1, 1, 1, 1, 1,
2.661925, -0.123427, 1.250407, 1, 1, 1, 1, 1,
2.684462, 0.1832536, 1.28524, 1, 1, 1, 1, 1,
2.751935, -0.3255099, 2.320615, 1, 1, 1, 1, 1,
2.757938, -2.097723, 2.282479, 1, 1, 1, 1, 1,
2.82083, 1.498832, -0.6180542, 1, 1, 1, 1, 1,
3.494804, 0.6322523, -0.6606422, 1, 1, 1, 1, 1
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
var radius = 10.03914;
var distance = 35.26205;
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
mvMatrix.translate( -0.1788561, -0.2232065, -0.3135533 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.26205);
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
